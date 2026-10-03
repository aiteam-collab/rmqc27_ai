prompt --application/pages/page_00201
begin
--   Manifest
--     PAGE: 00201
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
 p_id=>201
,p_name=>'Report Parameter'
,p_alias=>'REPORT-PARAMETER'
,p_page_mode=>'MODAL'
,p_step_title=>'Report Parameter'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7294547799716617710)
,p_plug_name=>'SCHEDULER_PARAM_LN'
,p_static_id=>'scheduler-param-ln'
,p_region_name=>'SP'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PAR_LN_BU,',
'       PAR_LN_SEQ_NO,',
'       PAR_LN_ID,',
'       PAR_LN_DESC,',
'       PAR_LN_VALUE,',
'       PAR_LN_CRE_BY,',
'       PAR_LN_CRE_DATE,',
'       PAR_LN_UPD_BY,',
'       PAR_LN_UPD_DATE,',
'       PAR_LN_SCH_ID,',
'       PAR_LN_SCH_DESC,',
'       PAR_LN_PRT_ID,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from SCHEDULER_PARAM_LN',
'  where PAR_LN_BU        = :GLOBAL_BU',
'    and PAR_LN_SCH_ID    = :P201_RSJ_ID',
'    and PAR_LN_PRT_ID    = :P201_RPT_ID',
'    and PAR_LN_SCH_DESC  = :P201_RSJ_NAME'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P201_RSJ_ID,P201_RSJ_NAME,P201_RPT_ID'
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
 p_id=>wwv_flow_imp.id(7294548007107617712)
,p_name=>'PAR_LN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548499570617717)
,p_name=>'PAR_LN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548660962617718)
,p_name=>'PAR_LN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Ln Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548361661617715)
,p_name=>'PAR_LN_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Desc'
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
 p_id=>wwv_flow_imp.id(7294551466569617746)
,p_name=>'PAR_LN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Parameter ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>120
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
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
 p_id=>wwv_flow_imp.id(7294551372210617745)
,p_name=>'PAR_LN_PRT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_PRT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report ID'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P201_RPT_ID'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294549176305617723)
,p_name=>'PAR_LN_SCH_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_SCH_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Sch Desc'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
,p_default_expression=>'P201_RSJ_NAME'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294549003975617722)
,p_name=>'PAR_LN_SCH_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_SCH_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Sch Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
,p_default_expression=>'P201_RSJ_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548147384617713)
,p_name=>'PAR_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(7294548782414617719)
,p_name=>'PAR_LN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Ln Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548854542617720)
,p_name=>'PAR_LN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Ln Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7294548391536617716)
,p_name=>'PAR_LN_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_LN_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Parameter Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(7299308304478231127)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7299308413004231128)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''SP'');'
,p_link_text=>'&"btn_delete".'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7294547979684617711)
,p_internal_uid=>1815026995899697509
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
 p_id=>wwv_flow_imp.id(7294835837367889453)
,p_interactive_grid_id=>wwv_flow_imp.id(7294547979684617711)
,p_static_id=>'18153149'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7294836053495889453)
,p_report_id=>wwv_flow_imp.id(7294835837367889453)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294836502233889458)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7294548007107617712)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294837426921889461)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7294548147384617713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294839271801889464)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7294548361661617715)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294840138079889466)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7294548391536617716)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294841014997889467)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7294548499570617717)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294841927717889469)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7294548660962617718)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294842859760889470)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7294548782414617719)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294843710159889472)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7294548854542617720)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294845490476889475)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7294549003975617722)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294846410384889477)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7294549176305617723)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7296308712659947127)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7294551372210617745)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7296348527867273478)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7294551466569617746)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7299364769968309312)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7299308304478231127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7299368996802320617)
,p_view_id=>wwv_flow_imp.id(7294836053495889453)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7299308413004231128)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7294549802946617730)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7294547799716617710)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''SP'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7294550082227617732)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7294547799716617710)
,p_button_name=>'DOWNLOAD'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="download_row(''SP'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7299564835786666109)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7294547799716617710)
,p_button_name=>'LOAD'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7299308729818231131)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7294547799716617710)
,p_button_name=>'REPORT'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::P202_RPT_ID,P202_SUB_TYPE:&P201_RPT_ID.,&P201_RPT_SUB_TYPE.'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7294549938239617731)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7294547799716617710)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''SP'')"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7294551252301617744)
,p_name=>'P201_RPT_ID'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7299564490475666106)
,p_name=>'P201_RPT_SUB_TYPE'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7294549589597617728)
,p_name=>'P201_RSJ_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7294549751558617729)
,p_name=>'P201_RSJ_NAME'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7299308490342231129)
,p_name=>'Dyn_Refresh'
,p_static_id=>'dyn-refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7294547799716617710)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7299308588885231130)
,p_event_id=>wwv_flow_imp.id(7299308490342231129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7294547799716617710)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7299564979405666110)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Load'
,p_static_id=>'process-for-load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PROC_LOAD_SCHE_PARAM(:GLOBAL_BU,',
'                         :P201_RPT_ID,',
'                         :P201_RSJ_ID,',
'                         :P201_RSJ_NAME,',
'                         :P201_RPT_SUB_TYPE,',
'                         :GLOBAL_USER);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7299564835786666109)
,p_internal_uid=>1820043995620745908
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7294549490944617727)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7294547799716617710)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SCHEDULER_PARAM_LN - Save Interactive Grid Data'
,p_static_id=>'scheduler-param-ln-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' --IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'     /*  SELECT NVL(MAX(PAR_LN_SEQ_NO),0) + 1',
'          INTO :PAR_LN_SEQ_NO',
'      FROM SCHEDULER_PARAM_LN',
'          WHERE PAR_LN_BU     = :GLOBAL_BU',
'            AND PAR_LN_ID     = :PAR_LN_ID',
'    	    AND PAR_LN_DESC   = :PAR_LN_DESC; */',
'',
'   -- INSERT INTO SCHEDULER_PARAM_LN(',
'                             --PAR_LN_BU,',
'                             --PAR_LN_SEQ_NO,',
'                             --PAR_LN_ID,',
'                             --PAR_LN_DESC,',
'                             --PAR_LN_VALUE',
'                             --PAR_LN_CRE_BY,',
'                             --PAR_LN_CRE_DATE',
'                             --PAR_LN_SCH_ID',
'                            --)',
'                          --  VALUES(',
'                            --:PAR_LN_BU,',
'                            --:PAR_LN_SEQ_NO,',
'                           -- :PAR_LN_ID,',
'                           -- :PAR_LN_DESC,',
'                            --:PAR_LN_VALUE',
'                            --:PAR_LN_CRE_BY,',
'                            --:PAR_LN_CRE_DATE',
'                            --:P201_RPT_ID',
'                         -- );',
'                          --APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Inserted.'';',
'  IF :APEX$ROW_STATUS = ''U'' THEN',
'    UPDATE SCHEDULER_PARAM_LN SET PAR_LN_VALUE    = :PAR_LN_VALUE,',
'                                  PAR_LN_UPD_BY   = :PAR_LN_UPD_BY,',
'                                  PAR_LN_UPD_DATE = :PAR_LN_UPD_DATE',
'                          WHERE PAR_LN_BU     = :GLOBAL_BU',
'                            AND ROWID         = ROWID   ',
'                            AND PAR_LN_SEQ_NO   = :PAR_LN_SEQ_NO',
'                            AND PAR_LN_SCH_ID   = :PAR_LN_SCH_ID ',
'                            AND PAR_LN_SCH_DESC = :PAR_LN_SCH_DESC; ',
'                        APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Updated.'';',
'  ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'    DELETE FROM SCHEDULER_PARAM_LN',
'      WHERE PAR_LN_BU       = :GLOBAL_BU',
'        AND PAR_LN_SEQ_NO   = :PAR_LN_SEQ_NO',
'        AND PAR_LN_SCH_ID   = :PAR_LN_SCH_ID ',
'        AND PAR_LN_SCH_DESC = :PAR_LN_SCH_DESC',
'        AND ROWID           = ROWID;',
'        APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Line Deleted.'';',
' END IF;',
' COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1815028507159697525
);
wwv_flow_imp.component_end;
end;
/
