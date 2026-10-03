prompt --application/pages/page_00199
begin
--   Manifest
--     PAGE: 00199
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
 p_id=>199
,p_name=>'Parameter'
,p_alias=>'PARAMETER1'
,p_page_mode=>'MODAL'
,p_step_title=>'Parameter'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(6470303034115005558)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'350'
,p_dialog_width=>'800'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7213586793120044643)
,p_plug_name=>'PARAMETER'
,p_static_id=>'parameter'
,p_region_name=>'PAR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PAR_BU,',
'       PAR_SCH_ID,',
'       PAR_SCH_DESC,',
'       PAR_SEQ_NO,',
'       PAR_ID,',
'       PAR_DESC,',
'       PAR_VALUE,',
'       PAR_CRE_BY,',
'       PAR_CRE_DATE,',
'       PAR_UPD_BY,',
'       PAR_UPD_DATE,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from SCHEDULER_PARAM',
'  WHERE PAR_BU = :GLOBAL_BU;'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(7213587663071044651)
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
 p_id=>wwv_flow_imp.id(7213587725196044652)
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
 p_id=>wwv_flow_imp.id(7213587043306044645)
,p_name=>'PAR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217731449600236509)
,p_name=>'PAR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>25
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217731535828236510)
,p_name=>'PAR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7213587353125044648)
,p_name=>'PAR_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par. Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(7213587268819044647)
,p_name=>'PAR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(7294547695982617709)
,p_name=>'PAR_SCH_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SCH_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sch Desc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
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
,p_default_type=>'ITEM'
,p_default_expression=>'P199_RSJ_NAME'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294547641258617708)
,p_name=>'PAR_SCH_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SCH_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sch Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_default_type=>'ITEM'
,p_default_expression=>'P199_RSJ_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217731363038236508)
,p_name=>'PAR_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'SI No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=readonly'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217731870186236513)
,p_name=>'PAR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>25
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217731965488236514)
,p_name=>'PAR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7213587386075044649)
,p_name=>'PAR_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par. Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(7217730947314236504)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7217732009950236515)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''PAR'');'
,p_link_text=>'&"btn_delete".'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7213586967534044644)
,p_internal_uid=>1734065983749124442
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7217724256042228906)
,p_interactive_grid_id=>wwv_flow_imp.id(7213586967534044644)
,p_static_id=>'17382033'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7217724469582228906)
,p_report_id=>wwv_flow_imp.id(7217724256042228906)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5479521161587920218)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7213587725196044652)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217724852276228911)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7213587043306044645)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217726642778228914)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7213587268819044647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>274
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217727500701228917)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7213587353125044648)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>334
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217728405281228919)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7213587386075044649)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>278
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217736849810236698)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7213587663071044651)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217744157952244998)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7217730947314236504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217950661880394753)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7217731363038236508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217951562762394756)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7217731449600236509)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7217952395190394758)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7217731535828236510)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7218002074669497694)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7217731870186236513)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7218002977248497695)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7217731965488236514)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7218004748461505294)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7217732009950236515)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294748550130811686)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7294547641258617708)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294749444339811691)
,p_view_id=>wwv_flow_imp.id(7217724469582228906)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7294547695982617709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7217731051017236505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7213586793120044643)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''PAR'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7217731185910236507)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7213586793120044643)
,p_button_name=>'DOWNLOAD'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''PAR'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7217731120498236506)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7213586793120044643)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''PAR'')"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7294547400901617706)
,p_name=>'P199_RSJ_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7294547486518617707)
,p_name=>'P199_RSJ_NAME'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7217731639122236511)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7213586793120044643)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7217731689747236512)
,p_event_id=>wwv_flow_imp.id(7217731639122236511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7213586793120044643)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7217730828782236503)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7213586793120044643)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAMETER - Save Interactive Grid Data'
,p_static_id=>'parameter-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' IF :APEX$ROW_STATUS = ''C'' THEN',
'',
' /*DECLARE ',
' CURSOR C1',
'  IS ',
'    SELECT COUNT(*) LINES',
'        FROM SCHEDULER_PARAM',
'          WHERE PAR_BU      = :GLOBAL_BU',
'            AND PAR_SEQ_NO  = :PAR_SEQ_NO',
'    	    AND PAR_ID      = :PAR_ID',
'            AND PAR_DESC    = :BEC_IP_PROD_ID;',
'    CR1 C1%ROWTYPE;',
'    BEGIN',
'    OPEN C1;',
'    FETCH C1 INTO CR1;',
'      IF CR1.LINES > 0 THEN',
'      RAISE_APPLICATION_ERROR(-20999,''Scheduler already found.'');',
'      END IF;',
'    CLOSE C1;',
'    END;*/',
'        SELECT NVL(MAX(PAR_SEQ_NO),0) + 1',
'          INTO :PAR_SEQ_NO',
'      FROM SCHEDULER_PARAM',
'          WHERE PAR_BU     = :GLOBAL_BU',
'            AND PAR_ID     = :PAR_ID',
'    	    AND PAR_DESC   = :PAR_DESC;',
'',
'    INSERT INTO SCHEDULER_PARAM(',
'                             PAR_BU,',
'                             PAR_SEQ_NO,',
'                             PAR_ID,',
'                             PAR_DESC,',
'                             PAR_VALUE,',
'                             PAR_CRE_BY,',
'                             PAR_CRE_DATE',
'                            )',
'                            VALUES(',
'                            :PAR_BU,',
'                            :PAR_SEQ_NO,',
'                            :PAR_ID,',
'                            :PAR_DESC,',
'                            :PAR_VALUE,',
'                            :PAR_CRE_BY,',
'                            :PAR_CRE_DATE',
'                          );',
'                          APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Inserted.'';',
'  ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'    UPDATE SCHEDULER_PARAM SET  PAR_ID       = :PAR_ID,',
'                              PAR_DESC     = :PAR_DESC,',
'                              PAR_VALUE    = :PAR_VALUE,',
'                              PAR_UPD_BY   = :PAR_UPD_BY,',
'                              PAR_UPD_DATE = :PAR_UPD_DATE',
'                          WHERE PAR_BU = :GLOBAL_BU',
'                              AND PAR_SEQ_NO  = :PAR_SEQ_NO',
'                              AND PAR_ID      = :PAR_ID',
'                              AND PAR_VALUE   = :PAR_VALUE; ',
'                              APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Updated.'';',
'  ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'    DELETE FROM SCHEDULER_PARAM',
'      WHERE PAR_BU      = :GLOBAL_BU',
'        AND PAR_ID      = :PAR_ID',
'        AND PAR_VALUE   = :PAR_VALUE',
'        AND PAR_SEQ_NO  = :PAR_SEQ_NO',
'        AND ROWID       = ROWID;',
'        APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Deleted.'';',
'',
' END IF;',
' COMMIT;',
'END;',
'  ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1738209844997316301
);
wwv_flow_imp.component_end;
end;
/
