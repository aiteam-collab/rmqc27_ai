prompt --application/pages/page_1113009501
begin
--   Manifest
--     PAGE: 1113009501
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
 p_id=>1113009501
,p_name=>'Load'
,p_alias=>'LOAD'
,p_page_mode=>'MODAL'
,p_step_title=>'Load'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7571214060710545330)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7568991206680352296)
,p_plug_name=>'Load'
,p_static_id=>'load'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WVBFT_VERTICAL_ID,',
'       WVBFT_BUS_FUN_ID,		 ',
'      (SELECT wbf_bus_fun_name',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFT_BUS_FUN_ID)bus_fun_desc, ',
'		 (SELECT wbf_vert_bus_fun_name',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFT_BUS_FUN_ID)vert_bus_fun_name,',
'       (SELECT wbf_node_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFT_BUS_FUN_ID)node_type, 	   ',
'       WVBFT_SEL_FLAG,',
'       WVBFT_CRE_BY,',
'       WVBFT_CRE_IP_ADDR,',
'       WVBFT_CRE_OS_USER,',
'       WVBFT_CRE_EMP_ID,',
'       WVBFT_CRE_DATE,',
'       WVBFT_UPD_BY,',
'       WVBFT_UPD_IP_ADDR,',
'       WVBFT_UPD_OS_USER,',
'       WVBFT_UPD_EMP_ID,',
'       WVBFT_UPD_DATE',
'  from WAPL_VERT_BUS_FUN_TEMP'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Load'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7568991328960352296)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2087029493416741268
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7567791902895578575)
,p_db_column_name=>'BUS_FUN_DESC'
,p_display_order=>12
,p_column_identifier=>'N'
,p_column_label=>'Description (Display)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7567792090956578577)
,p_db_column_name=>'NODE_TYPE'
,p_display_order=>32
,p_column_identifier=>'P'
,p_column_label=>' Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7592420277006319539)
,p_db_column_name=>'ROWID'
,p_display_order=>152
,p_column_identifier=>'Q'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7567792003861578576)
,p_db_column_name=>'VERT_BUS_FUN_NAME'
,p_display_order=>22
,p_column_identifier=>'O'
,p_column_label=>'Vertical Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568992054356352304)
,p_db_column_name=>'WVBFT_BUS_FUN_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>' Bus. Fun. '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568992873607352306)
,p_db_column_name=>'WVBFT_CRE_BY'
,p_display_order=>52
,p_column_identifier=>'D'
,p_column_label=>'Wvbft Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568994502032352307)
,p_db_column_name=>'WVBFT_CRE_DATE'
,p_display_order=>92
,p_column_identifier=>'H'
,p_column_label=>'Wvbft Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568994053923352307)
,p_db_column_name=>'WVBFT_CRE_EMP_ID'
,p_display_order=>82
,p_column_identifier=>'G'
,p_column_label=>'Wvbft Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568993288812352306)
,p_db_column_name=>'WVBFT_CRE_IP_ADDR'
,p_display_order=>62
,p_column_identifier=>'E'
,p_column_label=>'Wvbft Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568993710646352306)
,p_db_column_name=>'WVBFT_CRE_OS_USER'
,p_display_order=>72
,p_column_identifier=>'F'
,p_column_label=>'Wvbft Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568992455335352304)
,p_db_column_name=>'WVBFT_SEL_FLAG'
,p_display_order=>42
,p_column_identifier=>'C'
,p_column_label=>'Wvbft Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568994902472352307)
,p_db_column_name=>'WVBFT_UPD_BY'
,p_display_order=>102
,p_column_identifier=>'I'
,p_column_label=>'Wvbft Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568996482704352309)
,p_db_column_name=>'WVBFT_UPD_DATE'
,p_display_order=>142
,p_column_identifier=>'M'
,p_column_label=>'Wvbft Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568996095921352309)
,p_db_column_name=>'WVBFT_UPD_EMP_ID'
,p_display_order=>132
,p_column_identifier=>'L'
,p_column_label=>'Wvbft Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568995311992352307)
,p_db_column_name=>'WVBFT_UPD_IP_ADDR'
,p_display_order=>112
,p_column_identifier=>'J'
,p_column_label=>'Wvbft Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568995685843352309)
,p_db_column_name=>'WVBFT_UPD_OS_USER'
,p_display_order=>122
,p_column_identifier=>'K'
,p_column_label=>'Wvbft Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7568991665550352299)
,p_db_column_name=>'WVBFT_VERTICAL_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Wvbft Vertical Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7568997291788353556)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20870355'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WVBFT_BUS_FUN_ID:BUS_FUN_DESC:VERT_BUS_FUN_NAME:NODE_TYPE:ROWID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7567788893990578545)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7567790672766578563)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7567792217152578578)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790242572578559)
,p_name=>'P1113009501_ANALYTICS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'N'
,p_prompt=>'Analytics'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567788998630578546)
,p_name=>'P1113009501_BL_BUS_FUN_VERT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'B'
,p_prompt=>'Bus. Fun.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:From Bus. Fun;B,From Vertical;V'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567789511048578551)
,p_name=>'P1113009501_BL_FROM_VERT_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_prompt=>' From Vertical  Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567789396099578550)
,p_name=>'P1113009501_BL_FROM_VERT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_prompt=>'From Vertical'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_FROM_VERTICAL'
,p_lov_cascade_parent_items=>'P1113009501_BL_BUS_FUN_VERT,P1113009501_BL_TO_VERT_ID,P1113009501_STD_VERT_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567789691899578553)
,p_name=>'P1113009501_BL_TO_VERT_DESC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_prompt=>'To Vertical Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567789551988578552)
,p_name=>'P1113009501_BL_TO_VERT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_prompt=>'To Vertical'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790404260578560)
,p_name=>'P1113009501_REPORTS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'N'
,p_prompt=>'Reports'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790060467578557)
,p_name=>'P1113009501_SETUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'N'
,p_prompt=>'Setup'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567789273130578549)
,p_name=>'P1113009501_STD_VERT_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'S'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Standard;S,Vertical;V'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790181540578558)
,p_name=>'P1113009501_TRANSACTIONS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7567788893990578545)
,p_item_default=>'N'
,p_prompt=>'Transactions'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7567789788015578554)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1113009501_BL_FROM_VERT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7567789912532578555)
,p_event_id=>wwv_flow_imp.id(7567789788015578554)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1113009501_BL_FROM_VERT_DESC',
  'items_to_submit', 'P1113009501_BL_FROM_VERT_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P1113009501_BL_FROM_VERT_ID    IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT ev_vertical_desc',
    '	 	    FROM erp_vertical',
    '	 	   WHERE ev_vertical_id = :P1113009501_BL_FROM_VERT_ID  ',
    '	 	     AND (ev_vertical_id <> :P1113009501_BL_TO_VERT_ID   AND :P1113009501_BL_BUS_FUN_VERT   = ''V''',
    '	 	      OR :P1113009501_BL_BUS_FUN_VERT = ''B'');',
    '	    ',
    '	    cr1											c1%ROWTYPE;',
    '	       ',
    '	 BEGIN',
    '	 	',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	  ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Vertical not found.'');',
    '	 	     ELSE',
    '	 	     	  :P1113009501_BL_FROM_VERT_DESC   := cr1.ev_vertical_desc;',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7567790032569578556)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:P1113009501_BL_FROM_VERT_ID  IS NOT NULL OR :P1113009501_STD_VERT_TYPE = ''S'') THEN',
'	',
'	 DECLARE',
'	 	',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM wapl_vert_bus_fun_asso,',
'	 	    		 wapl_bus_fun',
'	 	   WHERE wvbfa_vertical_id = :P1113009501_BL_FROM_VERT_ID ',
'	 	     AND wbf_bus_fun_id = wvbfa_bus_fun_id',
'	 	     AND :P1113009501_STD_VERT_TYPE = ''V''',
'	 	     AND wbf_vertical_id NOT IN (''40001'',''40002'',''40003'',''40004'')',
'	 	     AND (wbf_node_type = ''SET'' AND :P1113009501_SETUP  = ''Y'' OR',
'	 	     			wbf_node_type = ''FRM'' AND :P1113009501_TRANSACTIONS = ''Y'' OR',
'	 	     			wbf_node_type = ''RPT'' AND :P1113009501_ANALYTICS  = ''Y'' OR',
'	 	     			wbf_node_type = ''REP'' AND :P1113009501_REPORTS = ''Y'' OR',
'	 	     			wbf_node_type = ''MOD'');',
'	 	     			',
'			cr1												c1%ROWTYPE;',
'			',
'      CURSOR c2',
'          IS',
'      SELECT *',
'        FROM wapl_bus_fun',
'       WHERE wbf_std_vert_type = ''S''',
'         AND :P1113009501_STD_VERT_TYPE = ''S''',
'         AND (wbf_vertical_id NOT IN (''40001'',''40002'',''40003'',''40004'') OR wbf_vertical_id IS NULL)',
'	 	     AND (wbf_node_type = ''SET'' AND :P1113009501_SETUP = ''Y'' OR',
'	 	     			wbf_node_type = ''FRM'' AND :P1113009501_TRANSACTIONS = ''Y'' OR',
'	 	     			wbf_node_type = ''RPT'' AND :P1113009501_ANALYTICS = ''Y'' OR',
'	 	     			wbf_node_type = ''REP'' AND :P1113009501_REPORTS = ''Y'' OR',
'	 	     			wbf_node_type = ''MOD'');',
'         --AND wbf_node_type <> ''MOD'';',
'         ',
'      CURSOR c3',
'          IS',
'      SELECT *',
'        FROM wapl_bus_fun',
'       WHERE (:P1113009501_STD_VERT_TYPE = ''V'' AND wbf_vertical_id = :P1113009501_BL_FROM_VERT_ID  AND wbf_std_vert_type = ''V''',
'          OR :P1113009501_BL_BUS_FUN_VERT = ''B'' AND wbf_std_vert_type = ''S'' AND :P1113009501_STD_VERT_TYPE  = ''S'')',
'	 	     AND (wbf_node_type = ''SET'' AND :P1113009501_SETUP = ''Y'' OR',
'	 	     			wbf_node_type = ''FRM'' AND :P1113009501_TRANSACTIONS = ''Y'' OR',
'	 	     			wbf_node_type = ''RPT'' AND :P1113009501_ANALYTICS = ''Y'' OR',
'	 	     			wbf_node_type = ''REP'' AND :P1113009501_REPORTS  = ''Y'' OR',
'	 	     			wbf_node_type = ''MOD'')',
'	 	     AND wbf_vertical_id NOT IN (''40001'',''40002'',''40003'',''40004'');',
'         --AND wbf_node_type <> ''MOD'';',
'			',
'			v_res											VARCHAR2(1) := ''N'';',
'	 	   ',
'	 BEGIN',
'	 	  ',
'	 	  DELETE wapl_vert_bus_fun_temp;',
'	 	  ',
'	 	  IF :P1113009501_BL_BUS_FUN_VERT  = ''V'' THEN',
'			 	  ',
'			 	  FOR cr1 IN c1',
'			 	  LOOP',
'			 	  	 ',
'			 	  	 INSERT INTO wapl_vert_bus_fun_temp(wvbft_vertical_id		 ,',
'																				        wvbft_bus_fun_id		 ,',
'																				        wvbft_sel_flag			 ,',
'																				        wvbft_cre_by				 ,',
'																				        wvbft_cre_ip_addr		 ,',
'																				        wvbft_cre_os_user		 ,',
'																				        wvbft_cre_emp_id		 ,',
'																				        wvbft_cre_date			 )',
'																				 VALUES(cr1.wvbfa_vertical_id,',
'																				 				cr1.wvbfa_bus_fun_id ,',
'																				 				''Y''									 ,',
'																				 				:GLOBAL_USER			 ,',
'																				 				:GLOBAL_IP_ADDR	 ,',
'																				 				:GLOBAL_USER			 ,',
'																				 				:GLOBAL_EMP_ID		 ,',
'																				 				SYSDATE							 );',
'			 	  ',
'			 	     v_res := ''Y'';',
'			 	  	 ',
'			 	  END LOOP c1;',
'			 	  ',
'			 	  ',
'			 	  FOR cr2 IN c2',
'			 	  LOOP',
'			 	  	 ',
'			 	  	INSERT INTO wapl_vert_bus_fun_temp(wvbft_vertical_id		,',
'																				       wvbft_bus_fun_id		 	,',
'																				       wvbft_sel_flag			 	,',
'																				       wvbft_cre_by				 	,',
'																				       wvbft_cre_ip_addr		,',
'																				       wvbft_cre_os_user		,',
'																				       wvbft_cre_emp_id		 	,',
'																				       wvbft_cre_date			 	)',
'																				VALUES(:P1113009501_BL_TO_VERT_ID ,',
'																				 			 cr2.wbf_bus_fun_id   ,',
'																				 			 ''Y''									,',
'																				 			 :GLOBAL_USER			,',
'																				 			 :GLOBAL_IP_ADDR	  ,',
'																				 			 :GLOBAL_USER			,',
'																				 			 :GLOBAL_EMP_ID		,',
'																				 			 SYSDATE							);',
'			 	  ',
'			 	    v_res := ''Y'';',
'			 	  	 ',
'			 	 END LOOP c2;	 	  ',
'	 	  ',
'	 	  ELSE',
'	 	  	   ',
'	 	  	 FOR cr3 IN c3',
'	 	  	 LOOP',
'	 	  	 	',
'	 	  	    INSERT INTO wapl_vert_bus_fun_temp(wvbft_vertical_id	 ,',
'																		           wvbft_bus_fun_id		 ,',
'																		           wvbft_sel_flag			 ,',
'																		           wvbft_cre_by				 ,',
'																		           wvbft_cre_ip_addr	 ,',
'																		           wvbft_cre_os_user	 ,',
'																		           wvbft_cre_emp_id		 ,',
'																		           wvbft_cre_date			 )',
'																		    VALUES(:BL_TO_VERTICAL_ID,',
'																		 				   cr3.wbf_bus_fun_id  ,',
'																		 				   ''Y''								 ,',
'																		 				   :GLOBAL_USER		 ,',
'																		 				   :GLOBAL_IP_ADDR	 ,',
'																		 				   :GLOBAL_USER		 ,',
'																		 				   :GLOBAL_EMP_ID	 ,',
'																		 				   SYSDATE						 );',
'	 	  	 	  ',
'	 	  	 	  v_res := ''Y'';',
'	 	  	 	  ',
'	 	  	 END LOOP c3;',
'	 	  	   ',
'	 	  END IF;',
'	 	  ',
'	 	  ',
'	 	  COMMIT;',
'	 	  ',
'	 	  IF v_res = ''Y'' THEN',
'				 apex_application.g_print_success_message := ''Loaded Successfully.'';',
'	 	  ELSE',
'				 apex_application.g_print_success_message := ''Not Loaded'';',
'	 	  END IF;',
'	 	  ',
'	 END;',
'	 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7567790672766578563)
,p_internal_uid=>2085828197025967528
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7571214029103545329)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK'
,p_static_id=>'ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	',
'	 CURSOR c1',
'	     IS',
'	 SELECT COUNT(*) v_cnt',
'	   FROM wapl_vert_bus_fun_temp',
'	  WHERE wvbft_sel_flag = ''Y'';',
'	   ',
'	 cr1														c1%ROWTYPE;',
'	 ',
'	 CURSOR c2',
'	     IS',
'	 SELECT *',
'	   FROM wapl_vert_bus_fun_temp',
'	  WHERE wvbft_sel_flag = ''Y'';',
'	   ',
'	 CURSOR c3(c_bus_fun_id					VARCHAR2)',
'	     IS',
'	 SELECT *',
'	   FROM wapl_vert_bus_fun_asso',
'	  WHERE wvbfa_vertical_id = :P1113009501_BL_TO_VERT_ID ',
'	    AND wvbfa_bus_fun_id  = c_bus_fun_id;',
'	    ',
'	 cr3														c3%ROWTYPE;',
'	 ',
'   CURSOR c4(c_bus_fun_id					VARCHAR2)',
'       IS',
'   SELECT *',
'     FROM wapl_bus_fun',
'    WHERE wbf_bus_fun_id = c_bus_fun_id;',
'    ',
'   cr4														c4%ROWTYPE;',
'   ',
'   v_seq_no												NUMBER(5);',
'	   ',
'BEGIN',
'	',
'	 OPEN c1;',
'	 FETCH c1 INTO cr1;',
'	 ',
'	    IF cr1.v_cnt = 0 THEN',
'	      RAISE_APPLICATION_ERROR(-20999,''Line details not found.'');',
'	    END IF;',
'	    ',
'	 CLOSE c1;',
'	 ',
'	 FOR cr2 IN c2',
'	 LOOP',
'	 	  ',
'	 	  OPEN c3(cr2.wvbft_bus_fun_id);',
'	 	  FETCH c3 INTO cr3;',
'	 	  ',
'	 	     IF c3%NOTFOUND THEN',
'	 	     	  ',
'	 	     	  OPEN c4(cr2.wvbft_bus_fun_id);',
'	 	     	  FETCH c4 INTO cr4;',
'	 	     	  ',
'	 	     	     IF c4%NOTFOUND THEN',
'	 	     	     	  v_seq_no := 1;',
'	 	     	     ELSE',
'	 	     	     	  v_seq_no := cr4.wbf_seq_no;',
'	 	     	     END IF;',
'	 	     	     ',
'	 	     	  CLOSE c4;',
'	 	     	  ',
'	 	     	  INSERT INTO wapl_vert_bus_fun_asso(wvbfa_vertical_id					,',
'																				       wvbfa_bus_fun_id						,',
'																				       wvbfa_cre_by								,',
'																				       wvbfa_cre_ip_addr					,',
'																				       wvbfa_cre_os_user					,	',
'																				       wvbfa_cre_emp_id						,',
'																				       wvbfa_cre_date							,',
'																				       wvbfa_seq_no								)',
'																				VALUES(:P1113009501_BL_TO_VERT_ID         ,',
'																							 cr2.wvbft_bus_fun_id				,',
'																							 :GLOBAL_USER						,',
'																							 :GLOBAL_IP_USER					,',
'																							 :GLOBAL_USER						,',
'																							 :GLOBAL_EMP_ID					,',
'																							 SYSDATE										,',
'																							 v_seq_no										);',
'	 	     	  ',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c3;',
'	 	  ',
'	 END LOOP c2;',
'	 ',
'	 DELETE wapl_vert_bus_fun_temp;',
'',
'	 COMMIT;',
'	',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7567792217152578578)
,p_internal_uid=>2089252193559934301
);
wwv_flow_imp.component_end;
end;
/
