prompt --application/pages/page_00074
begin
--   Manifest
--     PAGE: 00074
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
 p_id=>74
,p_name=>'Business Function Usage'
,p_alias=>'BUSINESS-FUNCTION-USAGE1'
,p_step_title=>'Business Function Usage'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    background: #00b1e7 !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6791361202394409445)
,p_plug_name=>'Business function Usage'
,p_static_id=>'business-function-usage'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    page_id,',
'    workspace_display_name,',
'    apex_user,',
'    application_id,',
'    application_name,',
'    application_schema_owner,',
'    WBF_BUS_FUN_ID,',
'    page_name,',
'    apex_session_id,',
'    max(VIEW_TIMESTAMP)over(order by id) as dt',
'FROM',
'    wapl_bus_fun,',
'    apex_workspace_activity_log',
'WHERE',
'        wbf_appl_no     = application_id',
'    AND wbf_page_no     = page_id',
'    AND application_schema_owner = sys_context(''USERENV'', ''CURRENT_SCHEMA'')',
'    AND  to_char(VIEW_TIMESTAMP,''DD-MON-YY'')  = :P74_TIMESTAMP',
'    AND (UPPER(workspace_display_name) LIKE ''%''||UPPER(:P74_WORKSPACE_NAME)||''%'' OR :P74_WORKSPACE_NAME IS NULL) ',
'    AND (application_id LIKE ''%''||:P74_APPLICATION_ID||''%'' OR :P74_APPLICATION_ID IS NULL) ',
'    AND (page_id LIKE ''%''||:P74_PAGE_ID||''%'' OR :P74_PAGE_ID IS NULL) ',
'    AND (UPPER(page_name) LIKE ''%''||UPPER(:P74_PAGE_NAME)||''%'' OR :P74_PAGE_NAME IS NULL) ',
'    AND (apex_user = :P74_USER_ID or :P74_USER_ID is null)',
'    order by 9'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P74_USER_ID,P74_TIMESTAMP,P74_WORKSPACE_NAME,P74_APPLICATION_ID,P74_PAGE_ID,P74_PAGE_NAME'
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
 p_id=>wwv_flow_imp.id(6791361298121409446)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1309399462577798418
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913600208532602526)
,p_db_column_name=>'APEX_SESSION_ID'
,p_display_order=>80
,p_column_identifier=>'BB'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913599675779602521)
,p_db_column_name=>'APEX_USER'
,p_display_order=>30
,p_column_identifier=>'AW'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913599806850602522)
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
 p_id=>wwv_flow_imp.id(6913599861290602523)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>50
,p_column_identifier=>'AY'
,p_column_label=>'Application Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913599954039602524)
,p_db_column_name=>'APPLICATION_SCHEMA_OWNER'
,p_display_order=>60
,p_column_identifier=>'AZ'
,p_column_label=>'Schema Owner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913600309543602527)
,p_db_column_name=>'DT'
,p_display_order=>90
,p_column_identifier=>'BC'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913599451420602519)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>10
,p_column_identifier=>'AU'
,p_column_label=>'Page ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913600097230602525)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>70
,p_column_identifier=>'BA'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192951697850721050)
,p_db_column_name=>'WBF_BUS_FUN_ID'
,p_display_order=>100
,p_column_identifier=>'BD'
,p_column_label=>'Bus. Fun. ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6913599585375602520)
,p_db_column_name=>'WORKSPACE_DISPLAY_NAME'
,p_display_order=>20
,p_column_identifier=>'AV'
,p_column_label=>'Workspace Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6897001008230721091)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6943904'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'APEX_USER:WORKSPACE_DISPLAY_NAME:APPLICATION_NAME:APEX_SESSION_ID:DT:PAGE_ID:WBF_BUS_FUN_ID:PAGE_NAME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192953351756721067)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6791361202394409445)
,p_button_name=>'search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:CR,::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952885571721062)
,p_name=>'P74_APPLICATION_ID'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952943748721063)
,p_name=>'P74_PAGE_ID'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192953095897721064)
,p_name=>'P74_PAGE_NAME'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192953176007721065)
,p_name=>'P74_TIMESTAMP'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952428898721057)
,p_name=>'P74_USER_ID'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952829244721061)
,p_name=>'P74_WORKSPACE_NAME'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
