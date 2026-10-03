prompt --application/pages/page_00034
begin
--   Manifest
--     PAGE: 00034
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
 p_id=>34
,p_name=>'SMS'
,p_alias=>'BUS-FUN'
,p_page_mode=>'MODAL'
,p_step_title=>'SMS'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5894807671024404672)
,p_name=>'BUS FUN'
,p_static_id=>'bus-fun'
,p_template=>wwv_flow_imp.id(10650515782604505361)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.*,',
'       (SELECT wbf_bus_fun_name',
'          FROM wapl_bus_fun B',
'         WHERE B.wbf_bus_fun_id = A.par_bus_fun_id) par_bus_fun_desc',
'  FROM (SELECT WVBFA_BUS_FUN_ID,',
'               (SELECT wbf_bus_fun_name',
'                  FROM wapl_bus_fun',
'                 WHERE wbf_bus_fun_id = WVBFA_BUS_FUN_ID)',
'                  bus_fun_name, ',
'                   (SELECT DECODE (wbf_node_type,''REP'', ''Reports'',''RPT'', ''Analytics'',''MOD'',''Module'',wbf_node_type)',
'                  node_type',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = wvbfa_bus_fun_id)',
'          node_type,                 ',
'               (SELECT wbf_par_fun_id',
'                  FROM wapl_bus_fun',
'                 WHERE wbf_bus_fun_id = WVBFA_BUS_FUN_ID) par_bus_fun_id',
'          FROM wapl_vert_bus_fun_asso',
'         WHERE WVBFA_VERTICAL_ID = ''20108''',
'          AND (SELECT DECODE (wbf_node_type,''REP'', ''Reports'',''RPT'', ''Analytics'',''MOD'',''Module'',wbf_node_type)',
'                  node_type',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = wvbfa_bus_fun_id) NOT IN (''FRM'',''SET'')) a',
'         ORDER BY par_bus_fun_id'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1:2:3'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'Y'
,p_prn_format=>'XLS'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'BUS FUN'
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
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5902273954374423830)
,p_query_column_id=>2
,p_column_alias=>'BUS_FUN_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Bus Fun Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5902274079027423831)
,p_query_column_id=>3
,p_column_alias=>'NODE_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Node Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5902274335438423833)
,p_query_column_id=>5
,p_column_alias=>'PAR_BUS_FUN_DESC'
,p_column_display_sequence=>20
,p_column_heading=>'Par Bus Fun Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5902274150968423832)
,p_query_column_id=>4
,p_column_alias=>'PAR_BUS_FUN_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Par Bus Fun Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5902273901996423829)
,p_query_column_id=>1
,p_column_alias=>'WVBFA_BUS_FUN_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Wvbfa Bus Fun Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6171072459529328669)
,p_plug_name=>'BUS FUN'
,p_static_id=>'bus-fun-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.*,',
'       (SELECT wbf_bus_fun_name',
'          FROM wapl_bus_fun B',
'         WHERE B.wbf_bus_fun_id = A.par_bus_fun_id) par_bus_fun_desc',
'  FROM (SELECT WVBFA_BUS_FUN_ID,',
'               (SELECT wbf_bus_fun_name',
'                  FROM wapl_bus_fun',
'                 WHERE wbf_bus_fun_id = WVBFA_BUS_FUN_ID)',
'                  bus_fun_name, ',
'                   (SELECT DECODE (wbf_node_type,''REP'', ''Reports'',''RPT'', ''Analytics'',''MOD'',''Module'',wbf_node_type)',
'                  node_type',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = wvbfa_bus_fun_id)',
'          node_type,                 ',
'               (SELECT wbf_par_fun_id',
'                  FROM wapl_bus_fun',
'                 WHERE wbf_bus_fun_id = WVBFA_BUS_FUN_ID) par_bus_fun_id',
'          FROM wapl_vert_bus_fun_asso',
'         WHERE WVBFA_VERTICAL_ID = ''20108'') a',
'         ORDER BY par_bus_fun_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'BUS FUN'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6171072607080328669)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>'|'
,p_internal_uid=>298730274898477112
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6171073423720328683)
,p_db_column_name=>'BUS_FUN_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5894807567779404671)
,p_db_column_name=>'NODE_TYPE'
,p_display_order=>14
,p_column_identifier=>'E'
,p_column_label=>'Node Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6171074161078328685)
,p_db_column_name=>'PAR_BUS_FUN_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Par. Bus Fun Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6171073771161328685)
,p_db_column_name=>'PAR_BUS_FUN_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Par. Bus Fun ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6171073005480328678)
,p_db_column_name=>'WVBFA_BUS_FUN_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Bus. Fun.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6171074757841330767)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2987325'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAR_BUS_FUN_DESC:NODE_TYPE:WVBFA_BUS_FUN_ID:BUS_FUN_NAME'
,p_break_on=>'PAR_BUS_FUN_DESC:NODE_TYPE'
,p_break_enabled_on=>'PAR_BUS_FUN_DESC:NODE_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5583609653003820748)
,p_plug_name=>'SMS '
,p_static_id=>'sms'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5600248315353075636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6171072459529328669)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'New'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190015:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5583610239318820754)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5583609653003820748)
,p_button_name=>'SMS_SEND'
,p_static_id=>'sms-send'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583610091584820752)
,p_name=>'P34_ST_MESSAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5583609653003820748)
,p_prompt=>'Message'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>4
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583609932211820750)
,p_name=>'P34_ST_PHONE_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5583609653003820748)
,p_prompt=>'Mobile'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583609804307820749)
,p_name=>'P34_ST_TEMPLATE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5583609653003820748)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5583610348462820755)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POST QUREY'
,p_static_id=>'post-qurey'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT satc_template_content INTO :P34_ST_MESSAGE',
'  FROM sms_api_template_config',
' WHERE satc_template_id = :P34_ST_TEMPLATE_ID;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>101648512919209727
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5583610018685820751)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESSES SMS SEND'
,p_static_id=>'processes-sms-send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P34_ST_PHONE_NO IS NULL THEN',
'	RAISE_APPLICATION_ERROR(-20999,''Mobile Number Must Be Entered'');',
'END IF;',
'',
'BEGIN',
'',
'PROC_SEND_TEST_SMS (:GLOBAL_bu,',
'						 :P34_ST_PHONE_NO,',
'						 :P34_ST_TEMPLATE_ID,',
'						 :P34_ST_MESSAGE,',
'						 :GLOBAL_user);',
'',
' APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Message sent successfully.</span>'';',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5583610239318820754)
,p_internal_uid=>101648183142209723
);
wwv_flow_imp.component_end;
end;
/
