prompt --application/pages/page_00181
begin
--   Manifest
--     PAGE: 00181
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
 p_id=>181
,p_name=>'Grant/Revoke Notification Access'
,p_alias=>'GRANT-REVOKE-NOTIFICATION-ACCESS1'
,p_step_title=>'Grant/Revoke Notification Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7729520451556361543)
,p_plug_name=>'Add Bus. Fun.'
,p_static_id=>'add-bus-fun'
,p_region_name=>'type'
,p_region_css_classes=>'no-close'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6560637129564429408)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7030338498365512110)
,p_plug_name=>'Bus fun'
,p_static_id=>'bus-fun'
,p_region_name=>'ig_user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WUNALN_BU,',
'       WUNALN_DOC_NO,',
'       WUNALN_SEQ_NO,',
'       WUNALN_BUS_FUN_ID,',
'       WUNALN_BUS_FUN_NAME,',
'       WUNALN_DATE_FROM,',
'       WUNALN_DATE_TO,',
'       WUNALN_CRE_BY,',
'       WUNALN_CRE_DATE,',
'       WUNALN_UPD_BY,',
'       WUNALN_UPD_DATE,',
'        CASE WHEN WUNALN_SEL_FLAG = ''Y'' THEN',
'       ''<input type="checkbox" id="checkbox_''||WUNALN_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''||WUNALN_SEQ_NO||'',''''Y'''')"/>''',
'       ELSE',
'       ''<input type="checkbox" id="checkbox_''||WUNALN_SEQ_NO||''" onChange="checkanduncheck(''||WUNALN_SEQ_NO||'',''''N'''')" />''',
'       END      ',
'       "Flag",',
'       WUNALN_REMOV_TYPE,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>'' Delete1',
'  from WA_USER_NOTIF_ACCESS_LN ',
' WHERE  WUNALN_BU      = :global_bu',
'   AND WUNALN_DOC_NO  = :P181_WUNAHD_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bus fun'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7030339735687512123)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7030339833352512124)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7048684481503928299)
,p_name=>'DELETE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P111326009501_WBFAHD_DOC_NO'',''&WBFALN_DOC_NO.''),$s(''P111326009501_SEQ_NO'',''&WBFALN_SEQ_NO.'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_link_text=>'&DELETE1.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6844173844811088216)
,p_name=>'Flag'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Flag'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362167185716943)
,p_name=>'WUNALN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362417228716946)
,p_name=>'WUNALN_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Notification ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362554051716947)
,p_name=>'WUNALN_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Notification Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>800
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362857028716950)
,p_name=>'WUNALN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362904896716951)
,p_name=>'WUNALN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362587701716948)
,p_name=>'WUNALN_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362783652716949)
,p_name=>'WUNALN_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362264549716944)
,p_name=>'WUNALN_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6560636690624429404)
,p_name=>'WUNALN_REMOV_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_REMOV_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307362307757716945)
,p_name=>'WUNALN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6307363025136716952)
,p_name=>'WUNALN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6560636636949429403)
,p_name=>'WUNALN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUNALN_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7030338548930512111)
,p_internal_uid=>1550817565145591909
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7031744199024014968)
,p_interactive_grid_id=>wwv_flow_imp.id(7030338548930512111)
,p_static_id=>'4687475'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7031744358973014968)
,p_report_id=>wwv_flow_imp.id(7031744199024014968)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560652056806432995)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6307362167185716943)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560652958075433002)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6307362264549716944)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560653833809433006)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6307362307757716945)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>15
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560654724647433008)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6307362417228716946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560655614168433011)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6307362554051716947)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>500
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560656497419433014)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6307362587701716948)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560657572709433019)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6307362783652716949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560658481616433020)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6307362857028716950)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560659301671433023)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6307362904896716951)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560660237422433027)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6307363025136716952)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560661091127433030)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6560636636949429403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6560662028260433033)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6560636690624429404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562996739545060599)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7030339833352512124)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6910758307356400654)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6844173844811088216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7031765707517033741)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7030339735687512123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7048690862552930562)
,p_view_id=>wwv_flow_imp.id(7031744358973014968)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7048684481503928299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7030281326707511113)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUNAHD_BU,',
'       WUNAHD_DOC_NO,',
'       WUNAHD_USER_ID,',
'       WUNAHD_EFF_FROM,',
'       WUNAHD_EFF_TO,',
'       WUNAHD_STATUS,',
'       WUNAHD_REFERENCE,',
'       WUNAHD_CRE_BY,',
'       WUNAHD_CRE_DATE,',
'       WUNAHD_UPD_BY,',
'       WUNAHD_UPD_DATE,',
'       WUNAHD_DOC_DATE,',
'       WUNAHD_TYPE,',
'       WUNAHD_UPD_IP_ADDR,',
'       WUNAHD_UPD_OS_USER,',
'       WUNAHD_UPD_EMP_ID,',
'       WUNAHD_CRE_EMP_ID,',
'       WUNAHD_CRE_OS_USER,',
'       WUNAHD_CRE_IP_ADDR,',
'       WUNAHD_APPR_BY,',
'       WUNAHD_APPR_DATE,',
'       WUNAHD_MODULE',
'  from WA_USER_NOTIF_ACCESS_HD',
' where WUNAHD_BU=:global_bu '))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P181_ROWID IS NOT NULL'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560584842144369834)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:CR,184:P184_WF_NO,P184_RETURN_PAGE_NO:,181'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560584426041369834)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560586390638369836)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_condition=>':P181_WUNAHD_DOC_NO IS NOT NULL AND :P181_WUNAHD_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560588476376369837)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7729520451556361543)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560585622813369836)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P181_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560581777315369833)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7030338498365512110)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P181_WUNAHD_TYPE IN (''A'',''R'') AND :P181_WUNAHD_DOC_NO IS NOT NULL AND :P181_WUNAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560588025799369837)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7729520451556361543)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560586041267369836)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'POST'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'  FROM WA_USER_NOTIF_ACCESS_LN',
' WHERE WUNALN_BU=:global_bu',
'   AND WUNALN_DOC_NO=:P181_WUNAHD_DOC_NO',
'   AND :P181_WUNAHD_STATUS = ''N'')>0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-paper-plane'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560587272479369836)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.::P179_SHOW_DATA,P179_SEARCH_TYPE,P179_REFIND:Y,&P181_SEARCH_TYPE.,Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560585264407369836)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WA_USER_NOTIF_ACCESS_LN',
' WHERE WUNALN_BU=:global_bu',
'   AND WUNALN_DOC_NO=:P181_WUNAHD_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM DUAL',
' WHERE :P181_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560582094499369833)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7030338498365512110)
,p_button_name=>'Save'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P181_WUNAHD_DOC_NO IS NOT NULL AND :P181_WUNAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560586863386369836)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6560637129564429408)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6560612057771369872)
,p_branch_name=>'workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_P_DOC_NO,P236131090_P_PAGE_ID:WF_BUS_FUN_ACCS,&P181_WBFAHD_DOC_NO.,111326009501&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6560612386436369872)
,p_branch_name=>'Self_Approve'
,p_branch_action=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.::P181_ROWID:&P181_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6560612821573369872)
,p_branch_name=>'gotopage_add_copy'
,p_branch_action=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:RP,182:P182_HD_DOC_NO,P182_USER_ID,P182_ROWID:&P181_WUNAHD_DOC_NO.,&P181_WUNAHD_USER_ID.,&P181_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6560581777315369833)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7569259253152369544)
,p_name=>'P181_RETURN_PAGE_NO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7030338791960512129)
,p_name=>'P181_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7469056442407830945)
,p_name=>'P181_SEARCH_TYPE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7048711197638928361)
,p_name=>'P181_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7030338498365512110)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7729553653186361611)
,p_name=>'P181_WBFAHD_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7729520451556361543)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Wbfahd Add Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Add'' d, ''N'' r FROM DUAL WHERE :P181_WBFAHD_TYPE <> ''M''',
'UNION ALL',
'SELECT ''Copy'' d, ''C'' r FROM DUAL WHERE :P181_WBFAHD_TYPE <> ''M''',
'UNION ALL',
'SELECT ''MRM'' d, ''M'' r FROM DUAL WHERE :P181_WBFAHD_TYPE = ''M'''))
,p_colspan=>6
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7729553755820361612)
,p_name=>'P181_WBFAHD_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7729520451556361543)
,p_use_cache_before_default=>'NO'
,p_prompt=>'From User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wubfa_user_id',
'  FROM wapl_user_bus_fun_accs,',
'       appl_users',
' WHERE appluser_bu = wubfa_bu',
'   AND appluser_id = wubfa_user_id',
'   AND appluser_bu = :GLOBAL_bu',
'   AND appluser_id <> :P181_WBFAHD_USER_ID'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the From User',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7569259173760369543)
,p_name=>'P181_WF_COUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611970532227053042)
,p_name=>'P181_WF_NO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361934577716941)
,p_name=>'P181_WUNAHD_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307362057368716942)
,p_name=>'P181_WUNAHD_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360043960716922)
,p_name=>'P181_WUNAHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUNAHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360717380716929)
,p_name=>'P181_WUNAHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360859944716930)
,p_name=>'P181_WUNAHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WUNAHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361602313716938)
,p_name=>'P181_WUNAHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361802220716940)
,p_name=>'P181_WUNAHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361694808716939)
,p_name=>'P181_WUNAHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361161796716933)
,p_name=>'P181_WUNAHD_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_prompt=>'Not. Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WUNAHD_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360147694716923)
,p_name=>'P181_WUNAHD_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_prompt=>'Not. Doc. No.'
,p_source=>'WUNAHD_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'Readonly=readonly tabindex="-1" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360367095716925)
,p_name=>'P181_WUNAHD_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_EFF_FROM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360459088716926)
,p_name=>'P181_WUNAHD_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_EFF_TO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6595812449472136427)
,p_name=>'P181_WUNAHD_MODULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_prompt=>'Module'
,p_source=>'WUNAHD_MODULE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wnl_module d, wnl_module r',
'  FROM wapl_notify_list',
' WHERE wnl_module IS NOT NULL'))
,p_cSize=>30
,p_cMaxlength=>3
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Module')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360618528716928)
,p_name=>'P181_WUNAHD_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_prompt=>'Reference'
,p_source=>'WUNAHD_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360519901716927)
,p_name=>'P181_WUNAHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WUNAHD_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Draft;N,Entry Completed;E,Posted;P,Cancelled;L'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361191885716934)
,p_name=>'P181_WUNAHD_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'WUNAHD_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add Notification;A,Remove Notification;R'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360974135716931)
,p_name=>'P181_WUNAHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361039125716932)
,p_name=>'P181_WUNAHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WUNAHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361548191716937)
,p_name=>'P181_WUNAHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361366519716935)
,p_name=>'P181_WUNAHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307361479836716936)
,p_name=>'P181_WUNAHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_source=>'WUNAHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6307360265736716924)
,p_name=>'P181_WUNAHD_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_item_source_plug_id=>wwv_flow_imp.id(7030281326707511113)
,p_prompt=>'User ID'
,p_source=>'WUNAHD_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT appluser_id d,appluser_id r',
'   FROM appl_users',
' WHERE appluser_bu=:global_bu ',
'    AND appluser_status=''A''',
'    '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6560583038423369833)
,p_tabular_form_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_validation_name=>'Line Date From'
,p_static_id=>'line-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBFALN_DATE_FROM IS NULL THEN',
'   RETURN(''From date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE(:WBFALN_DATE_FROM,''DD-MM-YYYY'') > TO_DATE(:WBFALN_DATE_TO,''DD-MM-YYYY'') THEN',
'  RETURN(''From date should be less than or equal to To date. '');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6560583428695369834)
,p_tabular_form_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_validation_name=>'Line Date To'
,p_static_id=>'line-date-to'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBFALN_DATE_TO IS NULL THEN',
'   RETURN(''To date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE (:WBFALN_DATE_TO,''DD-MM-YYYY'') < TO_DATE (:WBFALN_DATE_FROM,''DD-MM-YYYY'') THEN',
'   RETURN(''To date should be greater than equal to From date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6560636895778429406)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P181_WUNAHD_REFERENCE is null then',
'return(''Reference must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6307360618528716928)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6560636824955429405)
,p_validation_name=>'User'
,p_static_id=>'user'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_WUNAHD_USER_ID IS NULL THEN',
'RETURN(''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6307360265736716924)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6560594134897369858)
,p_validation_name=>'WBFAHD_FROM_USER_ID1'
,p_static_id=>'wbfahd-from-user-id'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_WBFAHD_FROM_USER_ID1 IS NULL  THEN',
'	IF :P181_WBFAHD_ADD_TYPE = ''C'' THEN',
'        RETURN (''User must be entered.'');',
'    END IF;',
'END IF;',
'',
'IF :P181_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM appl_users',
'		 WHERE appluser_bu     = :GLOBAL_bu',
'		   AND appluser_user_type <> ''O''',
'		   AND appluser_id     = :P181_WBFAHD_FROM_USER_ID1;',
'',
'		cr1				    c1%ROWTYPE;',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		  IF c1%NOTFOUND THEN',
'		  	 RETURN (''User not found.'');',
'		  END IF;',
'		CLOSE c1;',
'	END;',
'',
'    IF :P181_WBFAHD_FROM_USER_ID1 = :P181_WBFAHD_USER_ID AND :P181_WBFAHD_ADD_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7729553755820361612)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560609187170369870)
,p_name=>'Add Bus Fun'
,p_static_id=>'add-bus-fun'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6560588476376369837)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560609706293369870)
,p_event_id=>wwv_flow_imp.id(6560609187170369870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7729520451556361543)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560604093486369867)
,p_name=>'ADD_TYPE'
,p_static_id=>'add-type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P181_WBFAHD_ADD_TYPE'
,p_condition_element=>'P181_WBFAHD_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560605159239369867)
,p_event_id=>wwv_flow_imp.id(6560604093486369867)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560604672326369867)
,p_event_id=>wwv_flow_imp.id(6560604093486369867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560610152012369870)
,p_name=>'Bus Fun'
,p_static_id=>'bus-fun'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560610651224369870)
,p_event_id=>wwv_flow_imp.id(6560610152012369870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560606405872369869)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P181_WBFAHD_FROM_USER_ID'
,p_condition_element=>'P181_WBFAHD_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560607455962369869)
,p_event_id=>wwv_flow_imp.id(6560606405872369869)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560606909550369869)
,p_event_id=>wwv_flow_imp.id(6560606405872369869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560601834759369866)
,p_name=>'Ig_save'
,p_static_id=>'ig-save'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6560582094499369833)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560602379316369866)
,p_event_id=>wwv_flow_imp.id(6560601834759369866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560600918313369866)
,p_name=>'Region Refresh'
,p_static_id=>'region-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560601461491369866)
,p_event_id=>wwv_flow_imp.id(6560600918313369866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560598658839369864)
,p_name=>'WBFAHD_ADD_TYPE'
,p_static_id=>'wbfahd-add-type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P181_WBFAHD_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560599156614369864)
,p_event_id=>wwv_flow_imp.id(6560598658839369864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560583762672369834)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7030338498365512110)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bus fun - Save Interactive Grid Data'
,p_static_id=>'bus-fun-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'',
'UPDATE wa_user_notif_access_ln',
'   SET wunaln_date_from   = TO_DATE(:wunaln_date_from,:GLOBAL_DATE_FORMAT),',
'       wunaln_date_to     = TO_DATE(:wunaln_date_to,:GLOBAL_DATE_FORMAT),',
'       wunaln_sel_flag    = :wunaln_sel_flag,',
'       WunALN_REMOV_TYPE = :WUNALN_REMOV_TYPE,',
'       wunaln_sel_user    = CASE WHEN :wunaln_sel_user =''Y'' THEN :global_user ELSE NULL END,',
'       wunaln_upd_by      = :global_user,',
'       wunaln_upd_date    = SYSDATE',
' WHERE wunaln_bu          = :global_bu',
'   AND wunaln_seq_no      = :wunaln_seq_no',
'   AND wunaln_doc_no      = :P181_WUNAHD_DOC_NO;',
'',
'   COMMIT;          ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1081062778887449632
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560596821007369861)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' UPDATE wa_user_notif_access_hd',
'    SET wunahd_status  		= ''L'',',
'        wunahd_upd_by		= :Global_user,',
'        wunahd_upd_ip_addr  = :Global_ip,',
'        wunahd_upd_os_user  = NULL,',
'        wunahd_upd_emp_id   = :Global_emp_id,',
'        wunahd_upd_date     = SYSDATE',
'  WHERE wunahd_bu     		= :Global_bu',
'   AND wunahd_doc_no  	    = :P181_WUNAHD_DOC_NO;',
'',
'  COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6560586390638369836)
,p_internal_uid=>1081075837222449659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560595996843369859)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Line'
,p_static_id=>'delete-line'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM WA_USER_NOTIF_ACCESS_LN',
' WHERE WUNALN_bu=:global_bu',
'   AND wunaln_doc_no=:P181_WUNAHD_DOC_NO',
'   AND wunaln_seq_no=:P181_SEQ_NO',
'   AND wunaln_user_id=:P181_WUNAHD_USER_ID;',
' COMMIT;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1081075013058449657
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560595207246369858)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_ROWID IS NULL THEN',
'',
'    SELECT NVL (MAX ((TO_NUMBER(wunahd_doc_no))), 1000000000) + 1',
'      INTO :P181_WUNAHD_DOC_NO',
'      FROM wa_user_notif_access_hd',
'     WHERE wunahd_bu = :global_bu;',
'',
'    :P181_WUNAHD_DOC_DATE := TRUNC(SYSDATE);',
'    ',
'    :P181_WUNAHD_CRE_BY        := :GLOBAL_USER;',
'    :P181_WUNAHD_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P181_WUNAHD_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P181_WUNAHD_CRE_IP_ADDR   := :GLOBAL_IP;',
'ELSE',
'    :P181_WUNAHD_UPD_BY        := :GLOBAL_USER;',
'    :P181_WUNAHD_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P181_WUNAHD_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P181_WUNAHD_UPD_IP_ADDR   := :GLOBAL_IP;',
'END IF;',
'    ',
'IF :P181_WUNAHD_REFERENCE IS NULL THEN',
'   IF :P181_WUNAHD_TYPE =''A'' THEN',
'      :P181_WUNAHD_REFERENCE := ''Add Bus. Fun.'';',
'   ELSE',
'      :P181_WUNAHD_REFERENCE := ''Remove Bus. Fun.'';',
'   END IF;',
'END IF;          '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1081074223461449656
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560572287146369814)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7030281326707511113)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Access'
,p_static_id=>'initialize-form-user-access'
,p_internal_uid=>1081051303361449612
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560596412267369859)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_WUNAHD_TYPE = ''A'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT wnl_bus_fun_id as wbf_bus_fun_id, ',
'            wnl_bus_fun_name as wbf_bus_fun_name,',
'            wnl_module',
'      FROM WAPL_NOTIFY_LIST',
'     WHERE WNL_PAR_FUN_ID IS NOT NULL',
'       AND  (WNL_MODULE=:P181_WUNAHD_MODULE OR :P181_WUNAHD_MODULE IS NULL)',
'       AND wnl_bus_fun_id NOT IN (SELECT wuna_bus_fun_id',
'                                    FROM wapl_user_notif_accs',
'                                   WHERE wuna_user_id = :P181_WUNAHD_USER_ID',
'                                     AND wuna_bu = :GLOBAL_bu);',
'',
'   		 v_seq_no     VARCHAR2(5);                             ',
'   BEGIN	',
'   	DELETE ',
'   	  FROM wa_user_notif_access_temp',
'   	 WHERE wunat_bu      = :GLOBAL_bu',
'   	   AND wunat_doc_no  = :P181_WUNAHD_DOC_NO;',
'/*',
'      IF (:P181_WUNAHD_FROM_USER_ID <> :P181_WUNAHD_FROM_USER_ID1) OR ',
'          (:P181_WUNAHD_FROM_USER_ID IS NULL AND :P181_WUNAHD_FROM_USER_ID1 IS NOT NULL) OR',
'          (:P181_WUNAHD_FROM_USER_ID IS NOT NULL AND :P181_WUNAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'   	   DELETE',
'   		  FROM wa_user_notif_access_ln',
'   		 WHERE wunaln_bu 	   = :GLOBAL_bu',
'   		   AND wunaln_doc_no   = :P181_WUNAHD_DOC_NO;',
'',
'      END IF;',
'      COMMIT; ',
'      */',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	      SELECT NVL (MAX (TO_NUMBER (wunat_seq_no)), 0) + 1',
'   	        INTO v_seq_no',
'   	        FROM wa_user_notif_access_temp',
'   	       WHERE wunat_bu     = :GLOBAL_bu',
'   	         AND wunat_doc_no = :P181_WUNAHD_DOC_NO;',
'   	      ',
'   	      INSERT INTO WA_USER_NOTIF_ACCESS_TEMP(wunat_bu,',
'       	                                  	    wunat_doc_no,',
'       	                                  	    wunat_seq_no,',
'       	                                  	    wunat_bus_fun_id,',
'       	                                  	    wunat_bus_fun_name,',
'       	                                  	    wunat_date_from,',
'       	                                  	    wunat_date_to,',
'       	                                  	    wunat_cre_by,',
'       	                                  	    wunat_cre_date,',
'       	                                  	    wunat_sel_flag,',
'       	                                  	    wunat_sel_user,',
'       	                                  	    wunat_user_id,',
'                                                WUNAT_MODULE)',
'      					                  VALUES(:GLOBAL_bu,',
'      						                      :P181_WUNAHD_DOC_NO,',
'      						                      v_seq_no,',
'      						                      cr1.wbf_bus_fun_id,',
'      						                      cr1.wbf_bus_fun_name,',
'      						                      TRUNC(SYSDATE),',
'      						                      TO_DATE(''31-DEC-2099''),',
'      						                      :GLOBAL_user,',
'      						                      SYSDATE,',
'      						                      ''N'',',
'      						                      :GLOBAL_user,',
'      						                      :P181_WUNAHD_USER_ID,',
'                                                  cr1.wnl_module);              ',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'',
'IF :P181_WUNAHD_TYPE = ''R'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT wnl_bus_fun_id as wbf_bus_fun_id, ',
'            wnl_bus_fun_name as wbf_bus_fun_name,',
'            wnl_module',
'      FROM WAPL_NOTIFY_LIST,wapl_user_notif_accs',
'     WHERE wnl_bus_fun_id = wuna_bus_fun_id',
'       and WUNA_BU = :global_bu',
'       and WUNA_USER_ID = :P181_WUNAHD_USER_ID',
'       AND  (WNL_MODULE=:P181_WUNAHD_MODULE OR :P181_WUNAHD_MODULE IS NULL)',
'       and WNL_PAR_FUN_ID IS NOT NULL;',
'',
'   		 v_seq_no     VARCHAR2(5);                             ',
'   BEGIN	',
'   	DELETE ',
'   	  FROM wa_user_notif_access_temp',
'   	 WHERE wunat_bu      = :GLOBAL_bu',
'   	   AND wunat_doc_no  = :P181_WUNAHD_DOC_NO;',
'/*',
'      IF (:P181_WUNAHD_FROM_USER_ID <> :P181_WUNAHD_FROM_USER_ID1) OR ',
'          (:P181_WUNAHD_FROM_USER_ID IS NULL AND :P181_WUNAHD_FROM_USER_ID1 IS NOT NULL) OR',
'          (:P181_WUNAHD_FROM_USER_ID IS NOT NULL AND :P181_WUNAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'   	   DELETE',
'   		  FROM wa_user_notif_access_ln',
'   		 WHERE wunaln_bu 	   = :GLOBAL_bu',
'   		   AND wunaln_doc_no   = :P181_WUNAHD_DOC_NO;',
'',
'      END IF;',
'      COMMIT; ',
'      */',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	      SELECT NVL (MAX (TO_NUMBER (wunat_seq_no)), 0) + 1',
'   	        INTO v_seq_no',
'   	        FROM wa_user_notif_access_temp',
'   	       WHERE wunat_bu     = :GLOBAL_bu',
'   	         AND wunat_doc_no = :P181_WUNAHD_DOC_NO;',
'   	      ',
'   	      INSERT INTO WA_USER_NOTIF_ACCESS_TEMP(wunat_bu,',
'       	                                  	    wunat_doc_no,',
'       	                                  	    wunat_seq_no,',
'       	                                  	    wunat_bus_fun_id,',
'       	                                  	    wunat_bus_fun_name,',
'       	                                  	    wunat_date_from,',
'       	                                  	    wunat_date_to,',
'       	                                  	    wunat_cre_by,',
'       	                                  	    wunat_cre_date,',
'       	                                  	    wunat_sel_flag,',
'       	                                  	    wunat_sel_user,',
'       	                                  	    wunat_user_id)',
'      					                  VALUES(:GLOBAL_bu,',
'      						                      :P181_WUNAHD_DOC_NO,',
'      						                      v_seq_no,',
'      						                      cr1.wbf_bus_fun_id,',
'      						                      cr1.wbf_bus_fun_name,',
'      						                      TRUNC(SYSDATE),',
'      						                      TO_DATE(''31-DEC-2099''),',
'      						                      :GLOBAL_user,',
'      						                      SYSDATE,',
'      						                      ''N'',',
'      						                      :GLOBAL_user,',
'      						                     cr1.wnl_module);              ',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'UPDATE WA_USER_NOTIF_ACCESS_HD',
'   SET WUNAHD_UPD_BY          = :GLOBAL_USER,',
'       WUNAHD_UPD_DATE        = SYSDATE',
' WHERE WUNAHD_BU              = :GLOBAL_BU',
'   AND WUNAHD_DOC_NO          = :P181_WUNAHD_DOC_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6560581777315369833)
,p_internal_uid=>1081075428482449657
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560594856229369858)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res                    VARCHAR2(1);',
'    v_appr_msg                    VARCHAR2(1000);',
'    v_cnt		    			  NUMBER(5);',
'BEGIN',
'  --- raise_application_error(-20999,''HRM''||''~''||:P181_WUNAHD_TYPE);',
'      if :P181_WUNAHD_TYPE <> ''M'' THEN',
'       proc_ins_user_notif_accs_dtl(:GLOBAL_bu,''WF_BUS_FUN_ACCS'',:P181_WUNAHD_DOC_NO,:GLOBAL_user,v_appr_res);   ',
' ---- raise_application_error(-20999,''HRM'');',
'      else',
'',
'       UPDATE WA_USER_NOTIF_ACCESS_HD',
'           SET wunahd_status       = ''P'',',
'               wunahd_upd_by       = :GLOBAL_user,',
'               wunahd_upd_emp_id   = :global_emp_id,',
'               wunahd_upd_date     = SYSDATE,',
'               wunahd_appr_by      = :GLOBAL_user,',
'               wunahd_appr_date    = SYSDATE',
'         WHERE wunahd_bu           = :GLOBAL_bu',
'           AND wunahd_doc_no       = :P181_WUNAHD_DOC_NO;',
'',
'           v_appr_res := ''Y'';',
'      ',
'      end if;      ',
'   ',
' ----RAISE_APPLICATION_ERROR(-20999,v_appr_res||''~''||v_appr_msg||''~''||:P111326009501_WBFAHD_DOC_NO);',
'    IF v_appr_res = ''Y'' THEN',
'      ---- :P111326009501_WF_COUNT := ''WFM1091'';',
'        APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'       ',
'    ELSE',
'       RAISE_APPLICATION_ERROR(-20999,v_appr_res||''~''||v_appr_msg||''~''||:P181_WUNAHD_DOC_NO);----:P111326009501_WF_COUNT  := ''WFM1090'';',
'    END IF;',
'      ',
'    COMMIT;',
'  ',
' ---- END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6560586041267369836)
,p_internal_uid=>1081073872444449656
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560572731474369814)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7030281326707511113)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Access Insert'
,p_static_id=>'process-form-user-access-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6560585622813369836)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>1081051747689449612
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560573154548369814)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7030281326707511113)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Access Update'
,p_static_id=>'process-form-user-access-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6560582094499369833)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>1081052170763449612
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560594386436369858)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P181_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P181_WBFAHD_DOC_NO',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P181_WF_NO;',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P181_ROWID',
'  FROM wa_bu_fun_access_hd',
' WHERE wbfahd_bu     = :GLOBAL_bu',
'   AND wbfahd_doc_no = :P181_WBFAHD_DOC_NO;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1081073402651449656
);
wwv_flow_imp.component_end;
end;
/
