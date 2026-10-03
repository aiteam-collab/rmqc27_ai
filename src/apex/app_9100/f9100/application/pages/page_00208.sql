prompt --application/pages/page_00208
begin
--   Manifest
--     PAGE: 00208
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
 p_id=>208
,p_name=>'Mobile Bus. Fun. Access'
,p_alias=>'ESS-BUS-FUN-ACCESS4'
,p_step_title=>'Mobile Bus. Fun. Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10358302851706432946)
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
 p_id=>wwv_flow_imp.id(6962751810433841720)
,p_plug_name=>'BTN'
,p_static_id=>'btn'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
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
 p_id=>wwv_flow_imp.id(9659120898515583513)
,p_plug_name=>'Bus fun'
,p_static_id=>'bus-fun'
,p_region_name=>'ig_user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       mbfal_bu,',
'       mbfal_doc_no,',
'       mbfal_seq_no,',
'       mbfal_bus_fun_id,',
'       mbfal_bus_fun_name,',
'       mbfal_date_from,',
'       mbfal_date_to,',
'       mbfal_sel_flag,',
'       mbfal_remov_type,',
'       DECODE(mbfal_bus_fun_type,''REP'',''Report'',''FRM'',''Transaction'',''RPT'',''Analytics'')mbfal_bus_fun_type,',
'       mbfal_user_id,',
'       mbfal_cre_by,',
'       mbfal_cre_date,',
'       mbfal_upd_by,',
'       mbfal_upd_date',
'  FROM mobile_bu_fun_access_ln',
' WHERE mbfal_bu = :GLOBAL_BU',
'   AND mbfal_doc_no = :P208_MBFAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P208_MBFAH_DOC_NO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P208_MBFAH_STATUS'
,p_plug_read_only_when2=>'N'
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
 p_id=>wwv_flow_imp.id(9659122135837583526)
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
 p_id=>wwv_flow_imp.id(9659122233502583527)
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
 p_id=>wwv_flow_imp.id(6962751931436841721)
,p_name=>'MBFAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752232760841724)
,p_name=>'MBFAL_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6962752351341841725)
,p_name=>'MBFAL_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6962752852552841730)
,p_name=>'MBFAL_BUS_FUN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_BUS_FUN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962753081172841732)
,p_name=>'MBFAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962753157875841733)
,p_name=>'MBFAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752472238841726)
,p_name=>'MBFAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
 p_id=>wwv_flow_imp.id(6962752544398841727)
,p_name=>'MBFAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
 p_id=>wwv_flow_imp.id(6962752026004841722)
,p_name=>'MBFAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752743659841729)
,p_name=>'MBFAL_REMOV_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_REMOV_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P208_MBFAH_TYPE'
,p_display_condition2=>'R'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752629259841728)
,p_name=>'MBFAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P208_MBFAH_TYPE'
,p_display_condition2=>'A'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752099735841723)
,p_name=>'MBFAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(6962753271030841734)
,p_name=>'MBFAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6963767012476725385)
,p_name=>'MBFAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6962752978581841731)
,p_name=>'MBFAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MBFAL_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9189413381472462140)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9659120949080583514)
,p_internal_uid=>6022012267276346830
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
 p_id=>wwv_flow_imp.id(9660526599174086371)
,p_interactive_grid_id=>wwv_flow_imp.id(9659120949080583514)
,p_static_id=>'4687475'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9660526759123086371)
,p_report_id=>wwv_flow_imp.id(9660526599174086371)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963772563124725712)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6962751931436841721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963773481048725716)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6962752026004841722)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115.43799999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963774365902725718)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6962752099735841723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963775279607725719)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6962752232760841724)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963776132927725721)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6962752351341841725)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963776995952725723)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6962752472238841726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963777906560725724)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6962752544398841727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963778872722725727)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6962752629259841728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963779711871725729)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6962752743659841729)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963780603851725730)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6962752852552841730)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963781580020725732)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6962752978581841731)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963782396084725734)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6962753081172841732)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963783334234725735)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6962753157875841733)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963784254111725737)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6962753271030841734)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6963785118377725738)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6963767012476725385)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9191779139695132002)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9659122233502583527)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296410135126966329)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9189413381472462140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9660548107667105144)
,p_view_id=>wwv_flow_imp.id(9660526759123086371)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9659122135837583526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9659063726857582516)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       MBFAH_BU,',
'       MBFAH_DOC_NO,',
'       MBFAH_DOC_DATE,',
'       MBFAH_USER_ID,',
'       MBFAH_EFF_FROM,',
'       MBFAH_EFF_TO,',
'       MBFAH_TYPE,',
'       MBFAH_APPR_BY,',
'       MBFAH_APPR_DATE,',
'       MBFAH_STATUS,',
'       MBFAH_REFERENCE,',
'       MBFAH_CRE_BY,',
'       MBFAH_CRE_DATE,',
'       MBFAH_CRE_EMP_ID,',
'       MBFAH_CRE_IP_ADDR',
'       MBFAH_CRE_OS_USER,',
'       MBFAH_UPD_BY,',
'       MBFAH_UPD_DATE,',
'       MBFAH_UPD_EMP_ID,',
'       MBFAH_UPD_IP_ADDR,',
'       MBFAH_UPD_OS_USER,',
'       MBFAH_FROM_USER_ID',
'  FROM MOBILE_BU_FUN_ACCESS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P208_MBFAH_STATUS NOT IN (''N'') OR :P208_LINE_COUNT > 0'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962756449242849409)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:208:&SESSION.::&DEBUG.:CR,111326009501::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962756080286849407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962757968857849410)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P208_MBFAH_DOC_NO IS NOT NULL AND :P208_MBFAH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962785982337849441)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10358302851706432946)
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
 p_id=>wwv_flow_imp.id(6962757160721849409)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'INSERT'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P208_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962782602924849438)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P208_MBFAH_TYPE IN (''A'') AND :P208_MBFAH_DOC_NO IS NOT NULL AND :P208_MBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962782240839849438)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P208_MBFAH_TYPE IN (''R'') AND :P208_MBFAH_DOC_NO IS NOT NULL AND :P208_MBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962785633321849441)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(10358302851706432946)
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
 p_id=>wwv_flow_imp.id(6962757562632849409)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'POST'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'   FROM mobile_bu_fun_access_ln',
'  WHERE mbfal_bu = :GLOBAL_bu',
'    AND mbfal_doc_no = :P208_MBFAH_DOC_NO',
'    AND :P208_MBFAH_STATUS = ''N'') > 0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-paper-plane-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962758701962849410)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.::P207_SHOW_DATA:Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962783020141849438)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P208_MBFAH_DOC_NO IS NOT NULL AND :P208_MBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962758363659849410)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6965970241845867587)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_button_name=>'Un_Load'
,p_static_id=>'un-load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unload'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P208_LINE_COUNT > 0 AND :P208_MBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6962756878468849409)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6962751810433841720)
,p_button_name=>'UPDATE'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM mobile_bu_fun_access_ln',
' WHERE mbfal_bu = :GLOBAL_bu',
'   AND mbfal_doc_no = :P208_MBFAH_DOC_NO',
' UNION ALL',
'SELECT 1',
'  FROM DUAL',
' WHERE :P208_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9189443131500462195)
,p_name=>'P208_LINE_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)  FROM mobile_bu_fun_access_ln',
' WHERE mbfal_bu = :GLOBAL_BU',
'   AND mbfal_doc_no = :P208_MBFAH_DOC_NO'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750454838841706)
,p_name=>'P208_MBFAH_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750560196841707)
,p_name=>'P208_MBFAH_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962749719505841699)
,p_name=>'P208_MBFAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750794253841710)
,p_name=>'P208_MBFAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750934932841711)
,p_name=>'P208_MBFAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'MBFAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751069209841712)
,p_name=>'P208_MBFAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751105880841713)
,p_name=>'P208_MBFAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962749976758841701)
,p_name=>'P208_MBFAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_prompt=>'Doc. Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'MBFAH_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6962749813095841700)
,p_name=>'P208_MBFAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_prompt=>'Doc. No.'
,p_source=>'MBFAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6962750090871841703)
,p_name=>'P208_MBFAH_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'MBFAH_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750245036841704)
,p_name=>'P208_MBFAH_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_default=>'31-12-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'MBFAH_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751694040841719)
,p_name=>'P208_MBFAH_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_FROM_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750702046841709)
,p_name=>'P208_MBFAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_prompt=>'Reference'
,p_source=>'MBFAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_colspan=>10
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
 p_id=>wwv_flow_imp.id(6962750594133841708)
,p_name=>'P208_MBFAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'MBFAH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P,Cancelled;L'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750376952841705)
,p_name=>'P208_MBFAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'MBFAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751192202841714)
,p_name=>'P208_MBFAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751374967841715)
,p_name=>'P208_MBFAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'MBFAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751468771841716)
,p_name=>'P208_MBFAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751501514841717)
,p_name=>'P208_MBFAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962751604798841718)
,p_name=>'P208_MBFAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'MBFAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6962750018186841702)
,p_name=>'P208_MBFAH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_prompt=>'User ID'
,p_source=>'MBFAH_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id D,',
'       appluser_id R',
'  FROM appl_users',
' WHERE appluser_bu = :GLOBAL_bu',
'   AND appluser_user_type IN (''E'',''R'',''M'')',
'   AND appluser_emp_id is not null',
'   AND appluser_status = ''A'';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9659125285689583517)
,p_name=>'P208_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_item_source_plug_id=>wwv_flow_imp.id(9659063726857582516)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9677521399262999774)
,p_name=>'P208_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9659120898515583513)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10358366926447433030)
,p_name=>'P208_WBFAHD_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10358302851706432946)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Add;N,Copy;C'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10358367029081433031)
,p_name=>'P208_WBFAHD_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10358302851706432946)
,p_use_cache_before_default=>'NO'
,p_prompt=>'From User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'ESS_COPY_USER_ACCESS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the From User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6962784184936849440)
,p_tabular_form_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_validation_name=>'Line Date From'
,p_static_id=>'line-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :MBFAL_DATE_FROM IS NULL THEN',
'   RETURN(''From date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE(:MBFAL_DATE_FROM,''DD-MM-YYYY'') > TO_DATE(:MBFAL_DATE_TO,''DD-MM-YYYY'') THEN',
'  RETURN(''From date should be less than or equal to To date. '');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6962784591532849441)
,p_tabular_form_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_validation_name=>'Line Date To'
,p_static_id=>'line-date-to'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :MBFAL_DATE_TO IS NULL THEN',
'   RETURN(''To date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE (:MBFAL_DATE_TO,''DD-MM-YYYY'') < TO_DATE (:MBFAL_DATE_FROM,''DD-MM-YYYY'') THEN',
'   RETURN(''To date should be greater than equal to From date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6962790080946849446)
,p_validation_name=>'WBFAHD_FROM_USER_ID1'
,p_static_id=>'wbfahd-from-user-id'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_WBFAHD_FROM_USER_ID1 IS NULL  THEN',
'	IF :P208_WBFAHD_ADD_TYPE = ''C'' THEN',
'        RETURN (''User must be entered.'');',
'    END IF;',
'END IF;',
'',
'IF :P208_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM appl_users',
'		 WHERE appluser_bu     = :GLOBAL_bu',
'		   AND appluser_user_type <> ''O''',
'		   AND appluser_id     = :P208_WBFAHD_FROM_USER_ID1;',
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
'    IF :P208_WBFAHD_FROM_USER_ID1 = :P208_MBFAH_USER_ID AND :P208_WBFAHD_ADD_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(10358367029081433031)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962800528145849454)
,p_name=>'Add Bus Fun'
,p_static_id=>'add-bus-fun'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6962785982337849441)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962800992536849454)
,p_event_id=>wwv_flow_imp.id(6962800528145849454)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10358302851706432946)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962796789098849452)
,p_name=>'ADD_TYPE'
,p_static_id=>'add-type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P208_WBFAHD_ADD_TYPE'
,p_condition_element=>'P208_WBFAHD_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962797813841849452)
,p_event_id=>wwv_flow_imp.id(6962796789098849452)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962797315161849452)
,p_event_id=>wwv_flow_imp.id(6962796789098849452)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962799596741849454)
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
 p_id=>wwv_flow_imp.id(6962800155469849454)
,p_event_id=>wwv_flow_imp.id(6962799596741849454)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962798187006849454)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P208_WBFAHD_FROM_USER_ID'
,p_condition_element=>'P208_WBFAHD_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962799204974849454)
,p_event_id=>wwv_flow_imp.id(6962798187006849454)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962798725607849454)
,p_event_id=>wwv_flow_imp.id(6962798187006849454)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962794506753849451)
,p_name=>'Ig_save'
,p_static_id=>'ig-save'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6962783020141849438)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962795067472849452)
,p_event_id=>wwv_flow_imp.id(6962794506753849451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962795426825849452)
,p_name=>'LOAD  AC'
,p_static_id=>'load-ac'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6962782602924849438)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962795960509849452)
,p_event_id=>wwv_flow_imp.id(6962795426825849452)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10358302851706432946)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962796404061849452)
,p_event_id=>wwv_flow_imp.id(6962795426825849452)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_ADD_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962793612839849451)
,p_name=>'Region Refresh'
,p_static_id=>'region-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962794136726849451)
,p_event_id=>wwv_flow_imp.id(6962793612839849451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6962792716876849451)
,p_name=>'WBFAHD_ADD_TYPE'
,p_static_id=>'wbfahd-add-type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P208_WBFAHD_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6962793181934849451)
,p_event_id=>wwv_flow_imp.id(6962792716876849451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P208_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962784948279849441)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9659120898515583513)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bus fun - Save Interactive Grid Data'
,p_static_id=>'bus-fun-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'-- RAISE_APPLICATION_ERROR(-20100, ''HRM''||''~''||:P208_MBFAH_DOC_NO||''~''||:mbfal_seq_no||''~''||:GLOBAL_bu);',
'    UPDATE mobile_bu_fun_access_ln',
'       SET mbfal_date_from  = TO_DATE(:mbfal_date_from,:GLOBAL_DATE_FORMAT),',
'           mbfal_date_to    = TO_DATE(:mbfal_date_to,:GLOBAL_DATE_FORMAT),',
'           mbfal_remov_type = :mbfal_remov_type,',
'           mbfal_sel_flag   = :mbfal_sel_flag,',
'           mbfal_upd_by     = :GLOBAL_user,',
'           mbfal_upd_date   = SYSDATE',
'     WHERE mbfal_bu         = :GLOBAL_bu',
'       AND mbfal_seq_no     = :mbfal_seq_no',
'       AND mbfal_doc_no     = :P208_MBFAH_DOC_NO;',
'    COMMIT;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3325676266475612757
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962792309228849449)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_MBFAH_STATUS = ''N'' THEN',
'',
'    UPDATE mobile_bu_fun_access_hd',
'       SET mbfah_status  	 = ''L'',',
'           mbfah_upd_by	     = :GLOBAL_user,',
'           mbfah_upd_ip_addr = :GLOBAL_IP,',
'           mbfah_upd_os_user = NULL,',
'           mbfah_upd_emp_id  = :GLOBAL_EMP_ID,',
'           mbfah_upd_date    = SYSDATE',
'     WHERE mbfah_bu     	 = :GLOBAL_bu',
'       AND mbfah_doc_no  	 = :P208_MBFAH_DOC_NO;',
'',
'     COMMIT;',
'',
'END IF;',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962757968857849410)
,p_internal_uid=>3325683627424612765
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962791132380849449)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_ROWID IS NULL THEN',
'',
'    SELECT NVL (MAX ((TO_NUMBER(mbfah_doc_no))), 1000000000) + 1',
'      INTO :P208_MBFAH_DOC_NO',
'      FROM mobile_bu_fun_access_hd',
'     WHERE mbfah_bu = :GLOBAL_bu;',
'',
'    :P208_MBFAH_DOC_DATE := TRUNC(SYSDATE);',
'    ',
'    :P208_MBFAH_BU            := :GLOBAL_bu;',
'    :P208_MBFAH_CRE_BY        := :GLOBAL_USER;',
'    :P208_MBFAH_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P208_MBFAH_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'ELSE',
'    :P208_MBFAH_UPD_BY        := :GLOBAL_USER;',
'    :P208_MBFAH_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P208_MBFAH_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P208_MBFAH_UPD_IP_ADDR   := :GLOBAL_IP;',
'END IF;',
'    ',
'IF :P208_MBFAH_REFERENCE IS NULL THEN',
'    IF :P208_MBFAH_TYPE =''A'' THEN',
'       :P208_MBFAH_REFERENCE := ''Add Bus. Fun.'';',
'    ELSE',
'       :P208_MBFAH_REFERENCE := ''Remove Bus. Fun.'';',
'    END IF;',
'END IF;          '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3325682450576612765
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962772869046849423)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9659063726857582516)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Access'
,p_static_id=>'initialize-form-user-access'
,p_internal_uid=>3325664187242612739
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962791916784849449)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_WBFAHD_ADD_TYPE = ''N'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT bfm_menu_id,',
'   		   bfm_menu_desc,',
'   		   bfm_type',
'   	  FROM bus_fun_mobile',
'   	 WHERE bfm_menu_id NOT IN (SELECT bfam_menu_id',
'   		                         FROM bus_fun_access_mobile',
'   		                        WHERE bfam_user_id = :P208_MBFAH_USER_ID',
'   		                        UNION ALL',
'   		                       SELECT mbfal_bus_fun_id',
'   				                 FROM mobile_bu_fun_access_ln',
'   				                WHERE mbfal_bu 	   = :GLOBAL_bu',
'   				                  AND mbfal_doc_no = :P208_MBFAH_DOC_NO)',
'         AND bfm_visible_flag = ''Y''',
'         AND bfm_app_id = ''STD_TRANS''',
'        --  AND bfa_par_menu_id NOT IN (''MASTER'')',
'        --  AND bfa_par_menu_id IN (''MA_MY_INFO_MAS'',''MA_LEAVE'',''MA_ATTEN'',''MA_LOAN'',''MA_TDS'',''MA_TRAVE'',''MA_TDS'',''MA_TRAVE'',''MA_COMPLAINT'',''MA_TERMI'',''MA_COMPLAINT'',''MA_WFM'')',
'         AND bfm_type IN (''FORM'',''REP'',''RPT'');',
'',
'   		v_seq_no     VARCHAR2(5);',
'   BEGIN',
'',
'   	    DELETE',
'   	      FROM mobile_bu_fun_access_ln',
'   	     WHERE mbfal_bu 	= :GLOBAL_bu',
'   	       AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	    SELECT NVL (MAX (TO_NUMBER (mbfal_seq_no)), 0) + 1',
'   	      INTO v_seq_no',
'   	      FROM mobile_bu_fun_access_ln',
'   	     WHERE mbfal_bu     = :GLOBAL_bu',
'   	       AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'',
'            INSERT INTO mobile_bu_fun_access_ln (',
'                        mbfal_bu,',
'                        mbfal_doc_no,',
'                        mbfal_seq_no,',
'                        mbfal_bus_fun_id,',
'                        mbfal_bus_fun_name,',
'                        mbfal_date_from,',
'                        mbfal_date_to,',
'                        mbfal_sel_flag,',
'                        mbfal_remov_type,',
'                        mbfal_bus_fun_type,',
'                        mbfal_user_id,',
'                        mbfal_cre_by,',
'                        mbfal_cre_date,',
'                        mbfal_upd_by,',
'                        mbfal_upd_date',
'                        ) ',
'                VALUES (',
'                        :GLOBAL_BU,',
'                        :P208_MBFAH_DOC_NO,',
'                        v_seq_no,',
'                        cr1.bfm_menu_id,',
'                        cr1.bfm_menu_desc,',
'                        TO_DATE(:P208_MBFAH_EFF_FROM,''DD-MM-RRRR''),',
'                        TO_DATE(:P208_MBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        ''N'',',
'                        cr1.bfm_type,',
'                        :P208_MBFAH_USER_ID,',
'                        :GLOBAL_user,',
'                        SYSDATE,',
'                        NULL,',
'                        NULL',
'                        );',
'',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'IF :P208_WBFAHD_ADD_TYPE = ''C'' AND :P208_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE	',
'		CURSOR c1',
'		IS',
'		SELECT bfm_menu_id,',
'   		       bfm_menu_desc,',
'   		       bfm_type',
'		  FROM bus_fun_mobile,',
'		       bus_fun_access_mobile ',
'		 WHERE bfm_menu_id   = bfam_menu_id',
'		   AND bfam_user_id = :P208_WBFAHD_FROM_USER_ID1',
'		   AND bfm_menu_id NOT IN (SELECT mbfal_bus_fun_id',
'         							 FROM mobile_bu_fun_access_ln',
'         							WHERE mbfal_bu 	   = :GLOBAL_bu',
'         							  AND mbfal_doc_no = :P208_MBFAH_DOC_NO)',
'           AND bfm_menu_id NOT IN (SELECT bfam_menu_id',
'			         	   		     FROM bus_fun_access_mobile',
'									WHERE bfam_user_id = :P208_MBFAH_USER_ID)																	   ',
'		   AND bfm_visible_flag = ''Y''',
'           AND bfm_app_id = ''STD_TRANS''',
'        --    AND bfa_par_menu_id NOT IN (''MASTER'')',
'        --    AND bfa_par_menu_id IN (''MA_MY_INFO_MAS'',''MA_LEAVE'',''MA_ATTEN'',''MA_LOAN'',''MA_TDS'',''MA_TRAVE'',''MA_TDS'',''MA_TRAVE'',''MA_COMPLAINT'',''MA_TERMI'',''MA_COMPLAINT'',''MA_WFM'')',
'		   AND bfm_type IN (''FORM'',''REP'',''RPT'');',
'',
'		v_seq_no     VARCHAR2(5);                             ',
'	BEGIN	',
'    IF (:P208_MBFAH_FROM_USER_ID <> :P208_WBFAHD_FROM_USER_ID1) OR ',
'       (:P208_MBFAH_FROM_USER_ID IS NULL AND :P208_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'       (:P208_MBFAH_FROM_USER_ID IS NOT NULL AND :P208_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'	    DELETE',
'		  FROM mobile_bu_fun_access_ln',
'		 WHERE mbfal_bu 	= :GLOBAL_bu',
'		   AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'',
'    END IF;',
'',
'	COMMIT;',
'    ',
'		FOR cr1 IN c1',
'		LOOP',
'		    SELECT NVL (MAX (TO_NUMBER (mbfal_seq_no)), 0) + 1',
'		      INTO v_seq_no',
'		      FROM mobile_bu_fun_access_ln',
'		     WHERE mbfal_bu     = :GLOBAL_bu',
'		       AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'		    ',
'		    INSERT INTO mobile_bu_fun_access_ln (',
'                        mbfal_bu,',
'                        mbfal_doc_no,',
'                        mbfal_seq_no,',
'                        mbfal_bus_fun_id,',
'                        mbfal_bus_fun_name,',
'                        mbfal_date_from,',
'                        mbfal_date_to,',
'                        mbfal_sel_flag,',
'                        mbfal_remov_type,',
'                        mbfal_bus_fun_type,',
'                        mbfal_user_id,',
'                        mbfal_cre_by,',
'                        mbfal_cre_date,',
'                        mbfal_upd_by,',
'                        mbfal_upd_date',
'                        ) ',
'                VALUES (',
'                        :GLOBAL_BU,',
'                        :P208_MBFAH_DOC_NO,',
'                        v_seq_no,',
'                        cr1.bfm_menu_id,',
'                        cr1.bfm_menu_desc,',
'                        TO_DATE(:P208_MBFAH_EFF_FROM,''DD-MM-RRRR''),',
'                        TO_DATE(:P208_MBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        ''N'',',
'                        cr1.bfm_type,',
'                        :P208_MBFAH_USER_ID,',
'                        :GLOBAL_user,',
'                        SYSDATE,',
'                        NULL,',
'                        NULL',
'                        );',
'   	END LOOP;',
'	END;  ',
'',
'END IF;	',
'',
'    UPDATE mobile_bu_fun_access_hd',
'       SET mbfah_from_user_id = :P208_WBFAHD_FROM_USER_ID1,',
'           mbfah_upd_by       = :GLOBAL_user,',
'           mbfah_upd_date     = SYSDATE',
'     WHERE mbfah_bu           = :GLOBAL_BU',
'       AND mbfah_doc_no       = :P208_MBFAH_DOC_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962785633321849441)
,p_internal_uid=>3325683234980612765
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962791547846849449)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing'
,p_static_id=>'load-existing'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_MBFAH_TYPE = ''R'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT *',
'		  FROM bus_fun_access_mobile,',
'		       bus_fun_mobile',
'		 WHERE bfm_menu_id = bfam_menu_id',
'           AND bfam_user_id = :P208_MBFAH_USER_ID',
'		   AND bfm_visible_flag = ''Y''',
'           AND bfm_app_id = ''STD_TRANS'';',
'		 ',
'		cr1                  c1%ROWTYPE;',
'		v_seq_no             VARCHAR2(5);',
'		v_res		         VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM mobile_bu_fun_access_ln',
'		 WHERE mbfal_bu      = :GLOBAL_bu',
'		   AND mbfal_doc_no  = :P208_MBFAH_DOC_NO',
'		   AND mbfal_user_id = :P208_MBFAH_USER_ID;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		    SELECT NVL(MAX(TO_NUMBER(mbfal_seq_no)), 0) + 1',
'		      INTO v_seq_no',
'		      FROM mobile_bu_fun_access_ln',
'		     WHERE mbfal_bu     = :GLOBAL_bu',
'		       AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'',
'		    INSERT INTO mobile_bu_fun_access_ln(',
'                        mbfal_bu,',
'                        mbfal_doc_no,',
'                        mbfal_seq_no,',
'                        mbfal_bus_fun_id,',
'                        mbfal_bus_fun_name,',
'                        mbfal_date_from,',
'                        mbfal_date_to,',
'                        mbfal_sel_flag,',
'                        mbfal_bus_fun_type,',
'                        mbfal_user_id,',
'                        mbfal_cre_by,',
'                        mbfal_cre_date',
'                        )',
'				 VALUES(',
'                        :GLOBAL_bu,',
'				        :P208_MBFAH_DOC_NO,',
'				        v_seq_no,',
'				        cr1.bfm_menu_id,',
'				        cr1.bfm_menu_desc,',
'				        TO_DATE(:P208_MBFAH_EFF_FROM,''DD-MM-RRRR''),',
'				        TO_DATE(:P208_MBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        cr1.bfm_type,',
'                        :P208_MBFAH_USER_ID,',
'				        :GLOBAL_USER,',
'				        SYSDATE',
'                        );',
'',
'            v_res := ''Y'';',
'',
'		END LOOP;',
'    ',
'		IF v_res = ''Y'' THEN',
'           apex_application.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           apex_application.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'',
'	END; 	',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962782240839849438)
,p_internal_uid=>3325682866042612765
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962790754160849448)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_ROWID IS NOT NULL AND :P208_MBFAH_STATUS = ''N'' THEN',
'',
'DECLARE',
'    v_res           VARCHAR2(1);',
'BEGIN',
'    ',
'    proc_mobile_bus_fun_accs_dtl(:GLOBAL_bu,:P208_MBFAH_DOC_NO,:GLOBAL_user,v_res);',
'',
'    IF v_res = ''Y'' THEN',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'    ELSE',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document is Not Approved</span>''||''~''||:P208_MBFAH_DOC_NO; ',
'    END IF;',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962757562632849409)
,p_internal_uid=>3325682072356612764
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962773227170849423)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9659063726857582516)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Mobile User Access Insert'
,p_static_id=>'process-form-mobile-user-access-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962757160721849409)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>3325664545366612739
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6962773667206849423)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9659063726857582516)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Mobile User Access Update'
,p_static_id=>'process-form-mobile-user-access-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6962756878468849409)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>3325664985402612739
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6965970379565867588)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Un Load'
,p_static_id=>'un-load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P208_MBFAH_STATUS = ''N'' THEN',
'',
'    DELETE',
'      FROM mobile_bu_fun_access_ln',
'     WHERE mbfal_bu     = :GLOBAL_bu',
'       AND mbfal_doc_no = :P208_MBFAH_DOC_NO;',
'',
'    COMMIT;',
'',
'END IF;',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6965970241845867587)
,p_internal_uid=>3328861697761630904
);
wwv_flow_imp.component_end;
end;
/
