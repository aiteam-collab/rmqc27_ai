prompt --application/pages/page_00070
begin
--   Manifest
--     PAGE: 00070
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_page.create_page(
 p_id=>70
,p_name=>'Business function Usage'
,p_alias=>'BUSINESS-FUNCTION-USAGE'
,p_page_mode=>'MODAL'
,p_step_title=>'Business function Usage'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6070712405652527966)
,p_plug_name=>'Business function Usage'
,p_static_id=>'business-function-usage'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT wbf_bus_fun_id page_id,',
'            workspace_display_name,',
'            apex_user,',
'            application_id,',
'            application_name,',
'            application_schema_owner,',
'           page_name,',
'         apex_session_id,',
'         MIN (TO_CHAR (VIEW_TIMESTAMP, ''DD-MM-RRRR HH:MI:SS AM'')) AS dt_min,',
'         MAX (TO_CHAR (VIEW_TIMESTAMP, ''DD-MM-RRRR HH:MI:SS AM'')) AS dt_max',
'    FROM wapl_bus_fun, ',
'             apex_workspace_activity_log',
'   WHERE wbf_appl_no = application_id',
'         AND wbf_page_no = page_id',
'         AND apex_session_id = :P70_SESSION_ID',
'         AND workspace_display_name = :P70_WORKSPACE_NAME',
'         AND apex_user = :P70_USER_ID',
'GROUP BY wbf_bus_fun_id,',
'         workspace_display_name,',
'         apex_user,',
'         application_id,',
'         application_name,',
'         application_schema_owner,',
'         page_name,',
'         apex_session_id',
'ORDER BY 9'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Business function Usage'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6070712501379527967)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>588750665835916939
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951411790721047)
,p_db_column_name=>'APEX_SESSION_ID'
,p_display_order=>80
,p_column_identifier=>'BB'
,p_column_label=>'Apex Session ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192950879037721042)
,p_db_column_name=>'APEX_USER'
,p_display_order=>30
,p_column_identifier=>'AW'
,p_column_label=>'Apex User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951010108721043)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>40
,p_column_identifier=>'AX'
,p_column_label=>'Application ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951064548721044)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>50
,p_column_identifier=>'AY'
,p_column_label=>'Application Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951157297721045)
,p_db_column_name=>'APPLICATION_SCHEMA_OWNER'
,p_display_order=>60
,p_column_identifier=>'AZ'
,p_column_label=>'Application Schema'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5628975732820381759)
,p_db_column_name=>'DT_MAX'
,p_display_order=>120
,p_column_identifier=>'BG'
,p_column_label=>'Date To.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5628975545954381758)
,p_db_column_name=>'DT_MIN'
,p_display_order=>110
,p_column_identifier=>'BF'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5628975500474381757)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>100
,p_column_identifier=>'BE'
,p_column_label=>'Bus. Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951300488721046)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>70
,p_column_identifier=>'BA'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192950788633721041)
,p_db_column_name=>'WORKSPACE_DISPLAY_NAME'
,p_display_order=>20
,p_column_identifier=>'AV'
,p_column_label=>'Workspace Display Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6176352211488839612)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6943904'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'APPLICATION_NAME:PAGE_ID:PAGE_NAME:DT_MIN:DT_MAX'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6176233186383743258)
,p_name=>'P70_SESSION_ID'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6176233426581743260)
,p_name=>'P70_USER_ID'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6176233277642743259)
,p_name=>'P70_WORKSPACE_NAME'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
