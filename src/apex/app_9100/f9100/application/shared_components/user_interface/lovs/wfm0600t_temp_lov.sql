prompt --application/shared_components/user_interface/lovs/wfm0600t_temp_lov
begin
--   Manifest
--     WFM0600T TEMP LOV
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
 p_id=>wwv_flow_imp.id(7609812271353445449)
,p_lov_name=>'WFM0600T TEMP LOV'
,p_static_id=>'wfm0600t-temp-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wat_template_id,wat_template_desc, wat_header_msg||CHR(10)||wat_template_msg||CHR(10)||wat_footer_msg  message',
'  FROM whatsapp_api_templates',
' WHERE WAT_BU = :GLOBAL_bu',
'   AND WAT_STATUS = ''A'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WAT_TEMPLATE_DESC'
,p_display_column_name=>'WAT_TEMPLATE_DESC'
,p_default_sort_column_name=>'WAT_TEMPLATE_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7609814947571453231)
,p_query_column_name=>'MESSAGE'
,p_heading=>'Message'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7609814578734453229)
,p_query_column_name=>'WAT_TEMPLATE_DESC'
,p_heading=>'Template'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7609814234983453226)
,p_query_column_name=>'WAT_TEMPLATE_ID'
,p_heading=>'Template ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
