prompt --application/pages/page_00203
begin
--   Manifest
--     PAGE: 00203
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
 p_id=>203
,p_name=>'Scheduler Jobs'
,p_alias=>'SCHEDULER-JOBS2'
,p_step_title=>'Scheduler Jobs'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P198_TAB{',
'    padding: inherit;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7715421219852076044)
,p_plug_name=>'CC Mail'
,p_static_id=>'cc-mail'
,p_region_name=>'CC_Mail'
,p_parent_plug_id=>wwv_flow_imp.id(9290800516602042506)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7715421306271076045)
,p_plug_name=>'CC Mail'
,p_static_id=>'cc-mail-2'
,p_region_name=>'C'
,p_parent_plug_id=>wwv_flow_imp.id(7715421219852076044)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       RSJEC_BU,',
'       RSJEC_RSJ_ID,',
'       RSJEC_RSJ_NAME,',
'       RSJEC_SEQ_NO,',
'       RSJEC_EMAIL_TYPE,',
'       RSJEC_EMAIL_OWNER,',
'       RSJEC_EMAIL_ID,',
'       RSJEC_CRE_BY,',
'       RSJEC_CRE_DATE,',
'       RSJEC_UPD_BY,',
'       RSJEC_UPD_DATE,',
'       RSJEC_STATUS,',
'       RSJEC_EMP_ID,',
'       RSJEC_EMP_NAME,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from RM_SCH_JOB_CC_EMAILS',
'  where RSJEC_BU = :GLOBAL_BU'))
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
 p_id=>wwv_flow_imp.id(7715423061447076062)
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
 p_id=>wwv_flow_imp.id(7715423110164076063)
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
 p_id=>wwv_flow_imp.id(7715422927522076061)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715421482535076047)
,p_name=>'RSJEC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Bu'
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
 p_id=>wwv_flow_imp.id(7715422222366076054)
,p_name=>'RSJEC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(7715422284750076055)
,p_name=>'RSJEC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsjec Cre Date'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715422114627076053)
,p_name=>'RSJEC_EMAIL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_EMAIL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'CC Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(7715421973284076052)
,p_name=>'RSJEC_EMAIL_OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_EMAIL_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Email Owner'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(7715421939900076051)
,p_name=>'RSJEC_EMAIL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_EMAIL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Email Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(7715422682453076059)
,p_name=>'RSJEC_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp./Suplr. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>25
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(5652576847325525844)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715422813821076060)
,p_name=>'RSJEC_EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Suplr. Name'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715421579556076048)
,p_name=>'RSJEC_RSJ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_RSJ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rsjec Rsj Id'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715421688892076049)
,p_name=>'RSJEC_RSJ_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_RSJ_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Rsj Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715421778227076050)
,p_name=>'RSJEC_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7715422616028076058)
,p_name=>'RSJEC_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Status'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715422439830076056)
,p_name=>'RSJEC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjec Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(7715422479706076057)
,p_name=>'RSJEC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJEC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsjec Upd Date'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7715423626793076068)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''C'');'
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
 p_id=>wwv_flow_imp.id(7715421367472076046)
,p_internal_uid=>4078312685667839362
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
 p_id=>wwv_flow_imp.id(7715565561910085411)
,p_interactive_grid_id=>wwv_flow_imp.id(7715421367472076046)
,p_static_id=>'20152029'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7715565717701085413)
,p_report_id=>wwv_flow_imp.id(7715565561910085411)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5700362680403920749)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7715423110164076063)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715566253298085416)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7715421482535076047)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715567119900085421)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7715421579556076048)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715568057067085422)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7715421688892076049)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715568925920085424)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7715421778227076050)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715569791356085425)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7715421939900076051)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715570750694085427)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7715421973284076052)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715571575494085428)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7715422114627076053)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>354.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715572539508085430)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7715422222366076054)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715573387034085433)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7715422284750076055)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715574283599085435)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7715422439830076056)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715575247097085436)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7715422479706076057)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715576159257085438)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7715422616028076058)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715577009932085439)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7715422682453076059)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715577926396085441)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7715422813821076060)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>295.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715578847119085443)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7715422927522076061)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715582624570089011)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7715423061447076062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7715790415984164202)
,p_view_id=>wwv_flow_imp.id(7715565717701085413)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7715423626793076068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9295705113004358567)
,p_plug_name=>'Email'
,p_static_id=>'email'
,p_region_name=>'Email'
,p_parent_plug_id=>wwv_flow_imp.id(9290800516602042506)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9295705180444358568)
,p_plug_name=>'Email'
,p_static_id=>'email-2'
,p_region_name=>'E'
,p_parent_plug_id=>wwv_flow_imp.id(9295705113004358567)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       RSJE_BU,',
'       RSJE_RSJ_ID,',
'       RSJE_RSJ_NAME,',
'       RSJE_SEQ_NO,',
'       RSJE_EMAIL_TYPE,',
'       RSJE_EMAIL_OWNER,',
'       RSJE_EMP_ID,',
'       RSJE_EMP_NAME,',
'       RSJE_EMAIL_ID,',
'       RSJE_CRE_BY,',
'       RSJE_CRE_DATE,',
'       RSJE_UPD_BY,',
'       RSJE_UPD_DATE,',
'       RSJE_STATUS,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from RM_SCH_JOB_EMAILS',
'  where RSJE_BU = :GLOBAL_BU'))
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
 p_id=>wwv_flow_imp.id(9295706984113358586)
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
 p_id=>wwv_flow_imp.id(9295707158767358587)
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
 p_id=>wwv_flow_imp.id(9295706627888358582)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295705423435358570)
,p_name=>'RSJE_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295706117790358577)
,p_name=>'RSJE_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsje Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295706170384358578)
,p_name=>'RSJE_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsje Cre Date'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(9295706027389358576)
,p_name=>'RSJE_EMAIL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_EMAIL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'Readonly=Readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295705896230358575)
,p_name=>'RSJE_EMAIL_OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_EMAIL_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Owner'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(9295705863126358574)
,p_name=>'RSJE_EMAIL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_EMAIL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:To Mail;T,CC Mail;C,BCC Mail;B'
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9348620263080164066)
,p_name=>'RSJE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp./Suplr. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>25
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7285534125574705547)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9348620414792164068)
,p_name=>'RSJE_EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Suplr. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'Readonly=Readonly'
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
 p_id=>wwv_flow_imp.id(9295705474776358571)
,p_name=>'RSJE_RSJ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_RSJ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsje Rsj Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295705585448358572)
,p_name=>'RSJE_RSJ_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_RSJ_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsje Rsj Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295705752551358573)
,p_name=>'RSJE_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295706467667358581)
,p_name=>'RSJE_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsje Status'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295706363704358579)
,p_name=>'RSJE_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsje Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295706403741358580)
,p_name=>'RSJE_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJE_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsje Upd Date'
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
 p_id=>wwv_flow_imp.id(9296478190211128166)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''E'');'
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
 p_id=>wwv_flow_imp.id(9295705355010358569)
,p_internal_uid=>5658596673206121885
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
,p_show_toolbar=>true
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
 p_id=>wwv_flow_imp.id(9296199014574652187)
,p_interactive_grid_id=>wwv_flow_imp.id(9295705355010358569)
,p_static_id=>'17534241'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9296199229677652187)
,p_report_id=>wwv_flow_imp.id(9296199014574652187)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7542775030956604261)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9295707158767358587)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296199721541652192)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9295705423435358570)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296200593612652195)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9295705474776358571)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296201538749652196)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9295705585448358572)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296202426988652198)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9295705752551358573)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296203352916652200)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9295705863126358574)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296204177316652201)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9295705896230358575)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296205071179652203)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9295706027389358576)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>343
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296205966935652204)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9295706117790358577)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296206919796652206)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9295706170384358578)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296207795672652206)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9295706363704358579)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296208685578652207)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9295706403741358580)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296209615549652211)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9295706467667358581)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296210476673652212)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9295706627888358582)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296239135861720528)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9295706984113358586)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296488596111143718)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9296478190211128166)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9348713432153287917)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9348620263080164066)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9348745207426335393)
,p_view_id=>wwv_flow_imp.id(9296199229677652187)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9348620414792164068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9290800851657042509)
,p_plug_name=>'Mail Content'
,p_static_id=>'mail-content'
,p_region_name=>'Mail_Content'
,p_parent_plug_id=>wwv_flow_imp.id(9290800516602042506)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9290800910062042510)
,p_plug_name=>'Mail Content'
,p_static_id=>'mail-content-2'
,p_region_name=>'MC'
,p_parent_plug_id=>wwv_flow_imp.id(9290800851657042509)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9304784001220562466)
,p_plug_name=>'PARAM SUB TYPES'
,p_static_id=>'param-sub-types'
,p_region_name=>'SV'
,p_parent_plug_id=>wwv_flow_imp.id(9290800851657042509)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_display_column=>7
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PAR_SUB_BU,',
'       PAR_SUB_ID,',
'       PAR_SUB_NAME,',
'       PAR_SUB_VOU_TYPE,',
'       PAR_SUB_TYPE_DESC,',
'       PAR_SUB_CRE_BY,',
'       PAR_SUB_CRE_DATE,',
'       PAR_SUB_UPD_BY,',
'       PAR_SUB_UPD_DATE,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from PARAM_SUB_TYPES',
'   where PAR_SUB_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(9336653957059275693)
,p_name=>'PAR_SUB_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sub Bu'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(9336654179073275696)
,p_name=>'PAR_SUB_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sub Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(9336654300107275697)
,p_name=>'PAR_SUB_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Sub Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(9336655587386275710)
,p_name=>'PAR_SUB_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sub Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(9336655719770275711)
,p_name=>'PAR_SUB_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sub Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(9336654118411275695)
,p_name=>'PAR_SUB_TYPE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_TYPE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Sub Type Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Type Desc.')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7273524411237648869)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9336654412695275698)
,p_name=>'PAR_SUB_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par Sub Upd By'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9336654544275275699)
,p_name=>'PAR_SUB_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Par Sub Upd Date'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9336654059344275694)
,p_name=>'PAR_SUB_VOU_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_SUB_VOU_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Sub Vou. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Vou. Type')).to_clob
,p_is_required=>false
,p_max_length=>25
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7274185617128338762)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9336653843154275692)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9336655468748275709)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''SV'');'
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
 p_id=>wwv_flow_imp.id(9336653667488275691)
,p_internal_uid=>5699544985684039007
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
 p_id=>wwv_flow_imp.id(9336848423614523176)
,p_interactive_grid_id=>wwv_flow_imp.id(9336653667488275691)
,p_static_id=>'17940735'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9336848585523523176)
,p_report_id=>wwv_flow_imp.id(9336848423614523176)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336848992434523181)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9336653843154275692)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336849869441523184)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9336653957059275693)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336850834721523186)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9336654059344275694)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336851703077523187)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9336654118411275695)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>261.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336852658661523189)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9336654179073275696)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336853506610523190)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9336654300107275697)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336854386400523192)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9336654412695275698)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9336855285362523193)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9336654544275275699)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9337016879619655506)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9336655468748275709)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9337177501714718851)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9336655587386275710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9337178407402718854)
,p_view_id=>wwv_flow_imp.id(9336848585523523176)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9336655719770275711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9295576526854180699)
,p_plug_name=>'Reports'
,p_static_id=>'reports'
,p_region_name=>'Reports'
,p_parent_plug_id=>wwv_flow_imp.id(9290800516602042506)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9295576612966180700)
,p_plug_name=>'Reports'
,p_static_id=>'reports-2'
,p_region_name=>'R'
,p_parent_plug_id=>wwv_flow_imp.id(9295576526854180699)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       RSJR_BU,',
'       RSJR_RSJ_ID,',
'       RSJR_RSJ_NAME,',
'       RSJR_SEQ_NO,',
'       RSJR_SUB_VOU_FLAG,',
'       RSJR_TYPE,',
'       RSJR_SUB_TYPE,',
'       RSJR_REPORT,',
'       RSJR_REPORT_NAME,',
'       RSJR_REPORT_PATH,',
'       RSJR_REPORT_DEST_PATH,',
'       RSJR_NO_OF_PARAM,',
'       RSJR_CRE_BY,',
'       RSJR_CRE_DATE,',
'       RSJR_UPD_BY,',
'       RSJR_UPD_DATE,',
'       RSJR_STATUS,',
'       ''<span aria-hidden="true" class="fa fa-clipboard-list" style="color: blue ;font-size : 12px ;font-weight: bold"></span>'' Parameters,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from RM_SCH_JOB_REPORTS',
'  where RSJR_BU = :GLOBAL_BU',
'    and RSJR_RSJ_ID = :P203_RSJ_ID',
'    and RSJR_RSJ_NAME = :P203_RSJ_NAME'))
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
 p_id=>wwv_flow_imp.id(9357801211809301763)
,p_name=>'PARAMETERS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAMETERS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Parameters'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.::P201_RSJ_ID,P201_RSJ_NAME,P201_RPT_ID,P201_RPT_SUB_TYPE:&RSJR_RSJ_ID.,&RSJR_RSJ_NAME.,&RSJR_REPORT.,&RSJR_SUB_TYPE.'
,p_link_text=>'&PARAMETERS.'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295705006572358566)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295576771015180702)
,p_name=>'RSJR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295577707806180711)
,p_name=>'RSJR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjr Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295704569870358562)
,p_name=>'RSJR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsjr Cre Date'
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
 p_id=>wwv_flow_imp.id(9295577637001180710)
,p_name=>'RSJR_NO_OF_PARAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_NO_OF_PARAM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295577184094180706)
,p_name=>'RSJR_REPORT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_REPORT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Report ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7295979278580741780)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'RSJR_TYPE,RSJR_SUB_TYPE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295577467321180709)
,p_name=>'RSJR_REPORT_DEST_PATH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_REPORT_DEST_PATH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295577317298180707)
,p_name=>'RSJR_REPORT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_REPORT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report Name'
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
 p_id=>wwv_flow_imp.id(9295577439436180708)
,p_name=>'RSJR_REPORT_PATH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_REPORT_PATH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295576921845180703)
,p_name=>'RSJR_RSJ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_RSJ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjr Rsj Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295576983945180704)
,p_name=>'RSJR_RSJ_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_RSJ_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjr Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295577132227180705)
,p_name=>'RSJR_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295704885679358565)
,p_name=>'RSJR_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjr Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(9338244718235141384)
,p_name=>'RSJR_SUB_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_SUB_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Sub Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7295866492568518652)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(9357804078016301792)
,p_name=>'RSJR_SUB_VOU_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_SUB_VOU_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9338244655524141383)
,p_name=>'RSJR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Vou. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7295811118436331245)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'RSJR_SUB_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295704673573358563)
,p_name=>'RSJR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rsjr Upd By'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9295704778637358564)
,p_name=>'RSJR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Rsjr Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(9296478139320128165)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''R'');'
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
 p_id=>wwv_flow_imp.id(9295576752309180701)
,p_internal_uid=>5658468070504944017
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
 p_id=>wwv_flow_imp.id(9295710512541359136)
,p_interactive_grid_id=>wwv_flow_imp.id(9295576752309180701)
,p_static_id=>'17529356'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9295710699857359137)
,p_report_id=>wwv_flow_imp.id(9295710512541359136)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7542801850221686013)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9357804078016301792)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295711254043359140)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9295576771015180702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295712155629359143)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9295576921845180703)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295712981141359145)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9295576983945180704)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295713892221359146)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9295577132227180705)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295714852627359146)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9295577184094180706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295715670273359150)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9295577317298180707)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>260
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295716657000359151)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9295577439436180708)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295717560216359153)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9295577467321180709)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295718301637359154)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9295577637001180710)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295719236321359156)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9295577707806180711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295720114575359157)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9295704569870358562)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295721018082359157)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9295704673573358563)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295721872068359159)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9295704778637358564)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295722840936359162)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9295704885679358565)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9295723737376359162)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9295705006572358566)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9296487733644143714)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9296478139320128165)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9338754820531460518)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9338244655524141383)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9338755714930460523)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9338244718235141384)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>450
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9357836538878390715)
,p_view_id=>wwv_flow_imp.id(9295710699857359137)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9357801211809301763)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5700316562942889706)
,p_plug_name=>'Scheduler Jobs'
,p_static_id=>'scheduler-jobs'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DBA_SCHEDULER_JOBS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9290800516602042506)
,p_plug_name=>'TAB'
,p_static_id=>'tab'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700377628345920794)
,p_button_sequence=>70
,p_button_name=>'ACTION_TIPS'
,p_static_id=>'action-tips'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Action Tips'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700376869398920793)
,p_button_sequence=>50
,p_button_name=>'ACTIVATE'
,p_static_id=>'activate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Activate'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700388965990920813)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9304784001220562466)
,p_button_name=>'ADD_2'
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
,p_button_cattributes=>'onclick="add_row(''SV'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700400040453920823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9295576612966180700)
,p_button_name=>'ADD'
,p_static_id=>'add-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''R'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700410371395920832)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9295705180444358568)
,p_button_name=>'ADD_1'
,p_static_id=>'add-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''E'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700420620194920841)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7715421306271076045)
,p_button_name=>'ADD_3'
,p_static_id=>'add-4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''C'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700379254135920794)
,p_button_sequence=>110
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700376419797920793)
,p_button_sequence=>40
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700375221159920791)
,p_button_sequence=>10
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_static_id=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700377258039920793)
,p_button_sequence=>60
,p_button_name=>'DE-ACTIVATE'
,p_static_id=>'de-activate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'De-Activate'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700389723031920813)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9304784001220562466)
,p_button_name=>'DOWNLOAD_2'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="download_row(''SV'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700400826365920823)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9295576612966180700)
,p_button_name=>'DOWNLOAD'
,p_static_id=>'download-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="download_row(''R'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700411101861920832)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9295705180444358568)
,p_button_name=>'DOWNLOAD_1'
,p_static_id=>'download-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="download_row(''E)"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700421462894920841)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7715421306271076045)
,p_button_name=>'DOWNLOAD_3'
,p_static_id=>'download-4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="download_row(''C)"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700375999410920793)
,p_button_sequence=>30
,p_button_name=>'PARAMETER'
,p_static_id=>'parameter'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Parameter'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:199:&SESSION.::&DEBUG.::P199_RSJ_ID,P199_RSJ_NAME:&P203_RSJ_ID.,&P203_RSJ_NAME.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700377985097920794)
,p_button_sequence=>80
,p_button_name=>'REPEAT_INTERVAL_TIPS'
,p_static_id=>'repeat-interval-tips'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Repeat Interval Tips'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700378427901920794)
,p_button_sequence=>90
,p_button_name=>'RUN_JOB'
,p_static_id=>'run-job'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Run Job'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700375632882920793)
,p_button_sequence=>20
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700389326773920813)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9304784001220562466)
,p_button_name=>'Save_2'
,p_static_id=>'save-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''SV'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700400415397920823)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9295576612966180700)
,p_button_name=>'Save'
,p_static_id=>'save-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''R'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700410692367920832)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9295705180444358568)
,p_button_name=>'Save_1'
,p_static_id=>'save-4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''E'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700421018405920841)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7715421306271076045)
,p_button_name=>'Save_3'
,p_static_id=>'save-5'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''C'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700378836183920794)
,p_button_sequence=>100
,p_button_name=>'STOP_JOB'
,p_static_id=>'stop-job'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Stop Job'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700442092805930018)
,p_name=>'P203_ALLOW_RUNS_IN_RESTRICTED_MODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Allow Runs In Restricted Mode'
,p_source=>'ALLOW_RUNS_IN_RESTRICTED_MODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700438802377929985)
,p_name=>'P203_AUTO_DROP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Auto Drop'
,p_source=>'AUTO_DROP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700317209125889713)
,p_name=>'P203_CLIENT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Client Id'
,p_source=>'CLIENT_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>65
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
 p_id=>wwv_flow_imp.id(5700442243190930019)
,p_name=>'P203_COMMENTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Comments'
,p_source=>'COMMENTS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700442689942930024)
,p_name=>'P203_CONNECT_CREDENTIAL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Connect Credential Name'
,p_source=>'CONNECT_CREDENTIAL_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700442619713930023)
,p_name=>'P203_CONNECT_CREDENTIAL_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Connect Credential Owner'
,p_source=>'CONNECT_CREDENTIAL_OWNER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700441791642930015)
,p_name=>'P203_CREDENTIAL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Credential Name'
,p_source=>'CREDENTIAL_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700441770669930014)
,p_name=>'P203_CREDENTIAL_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Credential Owner'
,p_source=>'CREDENTIAL_OWNER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700442000947930017)
,p_name=>'P203_DEFERRED_DROP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Deferred Drop'
,p_source=>'DEFERRED_DROP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700441615763930013)
,p_name=>'P203_DESTINATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Destination'
,p_source=>'DESTINATION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1044
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700441552009930012)
,p_name=>'P203_DESTINATION_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Destination Owner'
,p_source=>'DESTINATION_OWNER'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1044
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700319300798889734)
,p_name=>'P203_ENABLED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Enabled'
,p_source=>'ENABLED'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700319121358889732)
,p_name=>'P203_END_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'End Date'
,p_source=>'END_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700318716302889728)
,p_name=>'P203_EVENT_CONDITION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Event Condition'
,p_source=>'EVENT_CONDITION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700318672721889727)
,p_name=>'P203_EVENT_QUEUE_AGENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Event Queue Agent'
,p_source=>'EVENT_QUEUE_AGENT'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>523
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700318568758889726)
,p_name=>'P203_EVENT_QUEUE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Event Queue Name'
,p_source=>'EVENT_QUEUE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700318431731889725)
,p_name=>'P203_EVENT_QUEUE_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Event Queue Owner'
,p_source=>'EVENT_QUEUE_OWNER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700318877146889729)
,p_name=>'P203_EVENT_RULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Event Rule'
,p_source=>'EVENT_RULE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>261
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700439639234929993)
,p_name=>'P203_FAILURE_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Failure Count'
,p_source=>'FAILURE_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700442855739930025)
,p_name=>'P203_FAIL_ON_SCRIPT_ERROR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Fail On Script Error'
,p_source=>'FAIL_ON_SCRIPT_ERROR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700319044408889731)
,p_name=>'P203_FILE_WATCHER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'File Watcher Name'
,p_source=>'FILE_WATCHER_NAME'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1044
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700318882252889730)
,p_name=>'P203_FILE_WATCHER_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'File Watcher Owner'
,p_source=>'FILE_WATCHER_OWNER'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1044
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700442303860930020)
,p_name=>'P203_FLAGS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Flags'
,p_source=>'FLAGS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700317285157889714)
,p_name=>'P203_GLOBAL_UID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Global Uid'
,p_source=>'GLOBAL_UID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>33
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
 p_id=>wwv_flow_imp.id(5700442556813930022)
,p_name=>'P203_HAS_CONSTRAINTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Has Constraints'
,p_source=>'HAS_CONSTRAINTS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700441912704930016)
,p_name=>'P203_INSTANCE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Instance Id'
,p_source=>'INSTANCE_ID'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700440849836930005)
,p_name=>'P203_INSTANCE_STICKINESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Instance Stickiness'
,p_source=>'INSTANCE_STICKINESS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700317751137889718)
,p_name=>'P203_JOB_ACTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Action'
,p_source=>'JOB_ACTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700319204507889733)
,p_name=>'P203_JOB_CLASS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Class'
,p_source=>'JOB_CLASS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700317122012889712)
,p_name=>'P203_JOB_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Creator'
,p_source=>'JOB_CREATOR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700316805128889709)
,p_name=>'P203_JOB_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Name'
,p_source=>'JOB_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700439201183929989)
,p_name=>'P203_JOB_PRIORITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Priority'
,p_source=>'JOB_PRIORITY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700317031506889711)
,p_name=>'P203_JOB_STYLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Style'
,p_source=>'JOB_STYLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>17
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
 p_id=>wwv_flow_imp.id(5700316972119889710)
,p_name=>'P203_JOB_SUBNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Subname'
,p_source=>'JOB_SUBNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700317584631889717)
,p_name=>'P203_JOB_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Type'
,p_source=>'JOB_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>16
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
 p_id=>wwv_flow_imp.id(5700441136924930008)
,p_name=>'P203_JOB_WEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Job Weight'
,p_source=>'JOB_WEIGHT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700440167597929998)
,p_name=>'P203_LAST_RUN_DURATION'
,p_source_data_type=>'INTERVAL_D2S'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Last Run Duration'
,p_source=>'LAST_RUN_DURATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700440074581929997)
,p_name=>'P203_LAST_START_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Last Start Date'
,p_source=>'LAST_START_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700440482825930002)
,p_name=>'P203_LOGGING_LEVEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Logging Level'
,p_source=>'LOGGING_LEVEL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>11
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
 p_id=>wwv_flow_imp.id(5700439856917929995)
,p_name=>'P203_MAX_FAILURES'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Max Failures'
,p_source=>'MAX_FAILURES'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700439569961929992)
,p_name=>'P203_MAX_RUNS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Max Runs'
,p_source=>'MAX_RUNS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700440401472930001)
,p_name=>'P203_MAX_RUN_DURATION'
,p_source_data_type=>'INTERVAL_D2S'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Max Run Duration'
,p_source=>'MAX_RUN_DURATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700440275366929999)
,p_name=>'P203_NEXT_RUN_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Next Run Date'
,p_source=>'NEXT_RUN_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700441254773930009)
,p_name=>'P203_NLS_ENV'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Nls Env'
,p_source=>'NLS_ENV'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700317874932889719)
,p_name=>'P203_NUMBER_OF_ARGUMENTS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Number Of Arguments'
,p_source=>'NUMBER_OF_ARGUMENTS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700441434867930011)
,p_name=>'P203_NUMBER_OF_DESTINATIONS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Number Of Destinations'
,p_source=>'NUMBER_OF_DESTINATIONS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700316713244889708)
,p_name=>'P203_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Owner'
,p_source=>'OWNER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700317553315889716)
,p_name=>'P203_PROGRAM_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Program Name'
,p_source=>'PROGRAM_NAME'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700317455351889715)
,p_name=>'P203_PROGRAM_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Program Owner'
,p_source=>'PROGRAM_OWNER'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700440894323930006)
,p_name=>'P203_RAISE_EVENTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Raise Events'
,p_source=>'RAISE_EVENTS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700318308499889724)
,p_name=>'P203_REPEAT_INTERVAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Repeat Interval'
,p_source=>'REPEAT_INTERVAL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700442391304930021)
,p_name=>'P203_RESTARTABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Restartable'
,p_source=>'RESTARTABLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700439002432929987)
,p_name=>'P203_RESTART_ON_FAILURE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Restart On Failure'
,p_source=>'RESTART_ON_FAILURE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700438928317929986)
,p_name=>'P203_RESTART_ON_RECOVERY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Restart On Recovery'
,p_source=>'RESTART_ON_RECOVERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700439897199929996)
,p_name=>'P203_RETRY_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Retry Count'
,p_source=>'RETRY_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700439296895929990)
,p_name=>'P203_RUN_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Run Count'
,p_source=>'RUN_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700440286842930000)
,p_name=>'P203_SCHEDULE_LIMIT'
,p_source_data_type=>'INTERVAL_D2S'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Schedule Limit'
,p_source=>'SCHEDULE_LIMIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700317993361889721)
,p_name=>'P203_SCHEDULE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Schedule Name'
,p_source=>'SCHEDULE_NAME'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700317887861889720)
,p_name=>'P203_SCHEDULE_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Schedule Owner'
,p_source=>'SCHEDULE_OWNER'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700318174050889722)
,p_name=>'P203_SCHEDULE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Schedule Type'
,p_source=>'SCHEDULE_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>12
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
 p_id=>wwv_flow_imp.id(5700441313893930010)
,p_name=>'P203_SOURCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Source'
,p_source=>'SOURCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
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
 p_id=>wwv_flow_imp.id(5700318236430889723)
,p_name=>'P203_START_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(5700439143962929988)
,p_name=>'P203_STATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'State'
,p_source=>'STATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
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
 p_id=>wwv_flow_imp.id(5700440719381930004)
,p_name=>'P203_STOP_ON_WINDOW_CLOSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Stop On Window Close'
,p_source=>'STOP_ON_WINDOW_CLOSE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700440672372930003)
,p_name=>'P203_STORE_OUTPUT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Store Output'
,p_source=>'STORE_OUTPUT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(5700441075935930007)
,p_name=>'P203_SYSTEM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'System'
,p_source=>'SYSTEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
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
 p_id=>wwv_flow_imp.id(9290817999854042558)
,p_name=>'P203_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9290800516602042506)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Mail Content;MC,Report;R,Email;E,CC Mail;C'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700439758310929994)
,p_name=>'P203_UPTIME_FAILURE_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Uptime Failure Count'
,p_source=>'UPTIME_FAILURE_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700439474905929991)
,p_name=>'P203_UPTIME_RUN_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_item_source_plug_id=>wwv_flow_imp.id(5700316562942889706)
,p_prompt=>'Uptime Run Count'
,p_source=>'UPTIME_RUN_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700437919282920859)
,p_name=>'Dyn_CC'
,p_static_id=>'dyn-cc'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7715421306271076045)
,p_triggering_element=>'RSJEC_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700438450270920859)
,p_event_id=>wwv_flow_imp.id(5700437919282920859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'RSJEC_EMP_NAME,RSJEC_EMAIL_ID',
  'items_to_submit', 'RSJEC_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT  NAME, MAIL_ID ',
    '    INTO :RSJEC_EMP_NAME, :RSJEC_EMAIL_ID FROM(',
    ' (SELECT DISTINCT EMP_EMP_ID ID,',
    '  NVL(EMP_FIRST_NAME1,EMP_FIRST_NAME2) NAME,',
    '  EMP_EMAIL_ID MAIL_ID',
    ' FROM EMPLOYEES',
    ' WHERE  EMP_BU = :GLOBAL_BU',
    ' AND EMP_EMP_ID = :RSJEC_EMP_ID',
    ' AND EMP_EMP_ID IS NOT NULL)',
    ' UNION ',
    ' (SELECT ',
    ' DISTINCT SUPLR_SUPLR_ID ID,',
    ' NVL(SUPLR_NAME1,SUPLR_NAME2) NAME,',
    ' NVL(SUPLR_EMAIL1,SUPLR_EMAIL2) MAIL_ID',
    ' FROM SUPPLIERS',
    ' WHERE  SUPLR_BU = :GLOBAL_BU',
    ' AND SUPLR_SUPLR_ID = :RSJEC_EMP_ID',
    'AND SUPLR_EMAIL1 IS NOT NULL ));')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700433285324920855)
,p_name=>'Dyn_Emp'
,p_static_id=>'dyn-emp'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9295705180444358568)
,p_triggering_element=>'RSJE_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700433874095920857)
,p_event_id=>wwv_flow_imp.id(5700433285324920855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'RSJE_EMP_NAME,RSJE_EMAIL_ID',
  'items_to_submit', 'RSJE_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT  NAME, MAIL_ID ',
    '    INTO :RSJE_EMP_NAME, :RSJE_EMAIL_ID FROM(',
    ' (SELECT DISTINCT EMP_EMP_ID ID,',
    '  NVL(EMP_FIRST_NAME1,EMP_FIRST_NAME2) NAME,',
    '  EMP_EMAIL_ID MAIL_ID',
    ' FROM EMPLOYEES',
    ' WHERE  EMP_BU = :GLOBAL_BU',
    ' AND EMP_EMP_ID = :RSJE_EMP_ID',
    ' AND EMP_EMP_ID IS NOT NULL)',
    ' UNION ',
    ' (SELECT ',
    ' DISTINCT SUPLR_SUPLR_ID ID,',
    ' NVL(SUPLR_NAME1,SUPLR_NAME2) NAME,',
    ' NVL(SUPLR_EMAIL1,SUPLR_EMAIL2) MAIL_ID',
    ' FROM SUPPLIERS',
    ' WHERE  SUPLR_BU = :GLOBAL_BU',
    ' AND SUPLR_SUPLR_ID = :RSJE_EMP_ID',
    'AND SUPLR_EMAIL1 IS NOT NULL ));')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700429757489920854)
,p_name=>'Dyn_Refresh'
,p_static_id=>'dyn-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9295576612966180700)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700430224656920854)
,p_event_id=>wwv_flow_imp.id(5700429757489920854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9295576612966180700)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700430638199920855)
,p_name=>'Dyn_Refresh1'
,p_static_id=>'dyn-refresh-2'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9295705180444358568)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700431099547920855)
,p_event_id=>wwv_flow_imp.id(5700430638199920855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9295705180444358568)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700436995119920859)
,p_name=>'Dyn_Refresh_3'
,p_static_id=>'dyn-refresh-3'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7715421306271076045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700437555572920859)
,p_event_id=>wwv_flow_imp.id(5700436995119920859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7715421306271076045)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700432383010920855)
,p_name=>'Dyn_Refresh_2'
,p_static_id=>'dyn-refresh-4'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9304784001220562466)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700432926786920855)
,p_event_id=>wwv_flow_imp.id(5700432383010920855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9304784001220562466)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700435594175920857)
,p_name=>'Dyn_Rsjr_Sub_Type'
,p_static_id=>'dyn-rsjr-sub-type'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9295576612966180700)
,p_triggering_element=>'RSJR_SUB_VOU_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700436677520920859)
,p_event_id=>wwv_flow_imp.id(5700435594175920857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RSJR_SUB_TYPE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'RSJR_SUB_VOU_FLAG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700436139956920857)
,p_event_id=>wwv_flow_imp.id(5700435594175920857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RSJR_SUB_TYPE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'RSJR_SUB_VOU_FLAG'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700434269623920857)
,p_name=>'Dyn_Rsjr_Type'
,p_static_id=>'dyn-rsjr-type'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9295576612966180700)
,p_triggering_element=>'RSJR_SUB_VOU_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700435222731920857)
,p_event_id=>wwv_flow_imp.id(5700434269623920857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RSJR_TYPE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'RSJR_SUB_VOU_FLAG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700434695448920857)
,p_event_id=>wwv_flow_imp.id(5700434269623920857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RSJR_TYPE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'RSJR_SUB_VOU_FLAG'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700428876834920851)
,p_name=>'Dyn_Show'
,p_static_id=>'dyn-show'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P203_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700429308444920854)
,p_event_id=>wwv_flow_imp.id(5700428876834920851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''MC'': ''Mail_Content'',',
    '  ''R'':  ''Reports'',',
    '  ''E'':  ''Email'',',
    '  ''C'':  ''CC_Mail''',
    '};',
    '',
    'const selectedTab = $v("P203_TAB");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700431547061920855)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5700375632882920793)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700432022465920855)
,p_event_id=>wwv_flow_imp.id(5700431547061920855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    UPDATE rm_schedule_jobs',
    '    SET',
    '        rsj_rep_interv_normal = replace(replace(:p203_rsj_rep_interv_normal, ''p_bu'', :global_bu),''p_user'',:global_user)',
    '    WHERE',
    '            rsj_bu = :global_bu',
    '        AND rsj_id = :p203_rsj_id;',
    '',
    '    ',
    'END;')),
  'show_processing', 'N')).to_clob
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700421890221920841)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7715421306271076045)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CC Mail - Save Interactive Grid Data'
,p_static_id=>'cc-mail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :apex$ROW_STATUS = ''C'' THEN ',
'',
'SELECT NVL(MAX(RSJEC_SEQ_NO),0) + 1',
'      INTO :RSJEC_SEQ_NO',
'  FROM RM_SCH_JOB_CC_EMAILS',
'      WHERE RSJEC_BU     = :GLOBAL_BU',
'        AND RSJEC_RSJ_ID = :P203_RSJ_ID',
'        AND RSJEC_RSJ_NAME = :P203_RSJ_NAME;',
'                                                            ',
' INSERT INTO RM_SCH_JOB_CC_EMAILS(       RSJEC_BU           ,',
'                                         RSJEC_RSJ_ID       ,',
'                                         RSJEC_RSJ_NAME     ,',
'                                         RSJEC_SEQ_NO       ,',
'                                         RSJEC_EMAIL_TYPE     ,',
'                                         RSJEC_EMAIL_OWNER  ,',
'                                         RSJEC_EMP_ID        ,',
'                                         RSJEC_EMP_NAME      ,',
'                                         RSJEC_EMAIL_ID  ,',
'                                         RSJEC_CRE_BY       ,',
'                                         RSJEC_CRE_DATE       ',
'                                      )',
'                                VALUES( :GLOBAL_BU          ,',
'                                        :RSJEC_RSJ_ID       ,',
'                                        :RSJEC_RSJ_NAME      ,',
'                                        :RSJEC_SEQ_NO       ,',
'                                        :RSJEC_EMAIL_TYPE     ,',
'                                        :RSJEC_EMAIL_OWNER  ,',
'                                        :RSJEC_EMP_ID        ,',
'                                        :RSJEC_EMP_NAME      ,',
'                                        :RSJEC_EMAIL_ID  ,',
'                                        :GLOBAL_USER        ,',
'                                         SYSDATE             ',
'                                       );',
'                                       ',
'                apex_application.g_print_success_message := ''<span style="color:WHITE"> Line inserted.'';',
'                ',
'    ELSIF :apex$ROW_STATUS = ''U'' THEN',
'    ',
'        UPDATE RM_SCH_JOB_CC_EMAILS',
'        SET    RSJEC_EMAIL_TYPE     = :RSJEC_EMAIL_TYPE        ,',
'               RSJEC_EMAIL_OWNER    = :RSJEC_EMAIL_OWNER  ,',
'               RSJEC_EMP_ID         = :RSJEC_EMP_ID       ,',
'               RSJEC_EMP_NAME       = :RSJEC_EMP_NAME     ,',
'               RSJEC_EMAIL_ID       = :RSJEC_EMAIL_ID  ,',
'               RSJEC_UPD_BY         = :GLOBAL_USER        ,',
'               RSJEC_UPD_DATE       =  SYSDATE          ',
'        WHERE ROWID           = :ROWID',
'          AND RSJEC_BU         = :GLOBAL_BU',
'          AND RSJEC_RSJ_ID     = :RSJEC_RSJ_ID;',
'          ',
'        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line updated.'';',
'',
'    ELSIF :apex$ROW_STATUS = ''D'' THEN',
'    ',
'            DELETE FROM RM_SCH_JOB_CC_EMAILS',
'            WHERE ROWID        = :ROWID',
'              AND RSJEC_RSJ_ID  = :RSJEC_RSJ_ID',
'              AND RSJEC_BU        = :GLOBAL_BU;',
'            apex_application.g_print_success_message := ''<span style="color:WHITE"> Line deleted.'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2063313208417684157
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700411664161920834)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9295705180444358568)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Email - Save Interactive Grid Data'
,p_static_id=>'email-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :apex$ROW_STATUS = ''C'' THEN ',
'',
'SELECT NVL(MAX(RSJE_SEQ_NO),0) + 1',
'      INTO :RSJE_SEQ_NO',
'  FROM RM_SCH_JOB_EMAILS',
'      WHERE RSJE_BU       = :GLOBAL_BU',
'        AND RSJE_RSJ_ID   = :P203_RSJ_ID',
'        AND RSJE_RSJ_NAME = :P203_RSJ_NAME;',
'                                                            ',
' INSERT INTO RM_SCH_JOB_EMAILS( RSJE_BU           ,',
'                                         RSJE_RSJ_ID       ,',
'                                         RSJE_RSJ_NAME     ,',
'                                         RSJE_SEQ_NO       ,',
'                                         RSJE_EMAIL_TYPE     ,',
'                                         RSJE_EMAIL_OWNER  ,',
'                                         RSJE_EMP_ID        ,',
'                                         RSJE_EMP_NAME      ,',
'                                         RSJE_EMAIL_ID  ,',
'                                         RSJE_CRE_BY       ,',
'                                         RSJE_CRE_DATE       ',
'                                      )',
'                                VALUES( :GLOBAL_BU          ,',
'                                        :RSJE_RSJ_ID       ,',
'                                        :RSJE_RSJ_NAME      ,',
'                                        :RSJE_SEQ_NO       ,',
'                                        :RSJE_EMAIL_TYPE     ,',
'                                        :RSJE_EMAIL_OWNER  ,',
'                                        :RSJE_EMP_ID        ,',
'                                        :RSJE_EMP_NAME      ,',
'                                        :RSJE_EMAIL_ID  ,',
'                                        :GLOBAL_USER        ,',
'                                         SYSDATE             ',
'                                       );',
'                                       ',
'                apex_application.g_print_success_message := ''<span style="color:WHITE"> Line inserted.'';',
'                ',
'    ELSIF :apex$ROW_STATUS = ''U'' THEN',
'    ',
'        UPDATE RM_SCH_JOB_EMAILS',
'        SET    RSJE_EMAIL_TYPE     = :RSJE_EMAIL_TYPE        ,',
'               RSJE_EMAIL_OWNER    = :RSJE_EMAIL_OWNER  ,',
'               RSJE_EMP_ID         = :RSJE_EMP_ID       ,',
'               RSJE_EMP_NAME       = :RSJE_EMP_NAME     ,',
'               RSJE_EMAIL_ID       = :RSJE_EMAIL_ID  ,',
'               RSJE_UPD_BY         = :GLOBAL_USER        ,',
'               RSJE_UPD_DATE       =  SYSDATE          ',
'        WHERE ROWID           = :ROWID',
'          AND RSJE_BU         = :GLOBAL_BU',
'          AND RSJE_RSJ_ID     = :RSJE_RSJ_ID;',
'          ',
'        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line updated.'';',
'',
'    ELSIF :apex$ROW_STATUS = ''D'' THEN',
'    ',
'            DELETE FROM RM_SCH_JOB_EMAILS',
'            WHERE ROWID        = :ROWID',
'              AND RSJE_RSJ_ID  = :RSJE_RSJ_ID',
'              AND RSJE_BU        = :GLOBAL_BU;',
'            apex_application.g_print_success_message := ''<span style="color:WHITE"> Line deleted.'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2063302982357684150
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700316593284889707)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(5700316562942889706)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Scheduler Jobs'
,p_static_id=>'initialize-form-scheduler-jobs'
,p_internal_uid=>2063207911480653023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700390231382920815)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9304784001220562466)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PARAM SUB TYPES - Save Interactive Grid Data'
,p_static_id=>'param-sub-types-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :apex$ROW_STATUS = ''C'' THEN ',
'                                                      ',
' INSERT INTO PARAM_SUB_TYPES( PAR_SUB_BU           ,',
'                                         PAR_SUB_VOU_TYPE       ,',
'                                         PAR_SUB_TYPE_DESC     ,',
'                                         PAR_SUB_CRE_BY       ,',
'                                         PAR_SUB_CRE_DATE       ',
'                                      )',
'                                VALUES( :GLOBAL_BU          ,',
'                                        :PAR_SUB_VOU_TYPE       ,',
'                                        :PAR_SUB_TYPE_DESC     ,',
'                                        :GLOBAL_USER        ,',
'                                         SYSDATE             ',
'                                       );',
'                                       ',
'                apex_application.g_print_success_message := ''<span style="color:WHITE"> Line inserted.'';',
'                ',
'    ELSIF :apex$ROW_STATUS = ''U'' THEN',
'    ',
'        UPDATE PARAM_SUB_TYPES',
'        SET    PAR_SUB_VOU_TYPE        = :PAR_SUB_VOU_TYPE    ,',
'               PAR_SUB_TYPE_DESC       = :PAR_SUB_TYPE_DESC     ,',
'               PAR_SUB_UPD_BY          = :GLOBAL_USER        ,',
'               PAR_SUB_UPD_DATE        =  SYSDATE          ',
'        WHERE ROWID                    = :ROWID',
'          AND PAR_SUB_BU               = :GLOBAL_BU',
'          AND PAR_SUB_ID               = :P203_RSJ_ID',
'          AND PAR_SUB_VOU_TYPE   = :PAR_SUB_VOU_TYPE;',
'          ',
'        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line updated.'';',
'',
'    ELSIF :apex$ROW_STATUS = ''D'' THEN',
'    ',
'            DELETE FROM PARAM_SUB_TYPES',
'            WHERE ROWID                  = :ROWID;',
'            apex_application.g_print_success_message := ''<span style="color:WHITE"> Line deleted.'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2063281549578684131
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700426382814920848)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Activate'
,p_static_id=>'process-for-activate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CNT NUMBER;',
'BEGIN',
'SELECT COUNT(*) INTO CNT FROM JOB_REPORTS_PARAM ',
'WHERE JRP_STATUS=''N'' ',
'AND JRP_BU = :GLOBAL_BU',
'AND JRP_RSJR_RSJ_ID = :P203_RSJ_ID',
'AND JRP_RSJR_RSJ_NAME = :P203_RSJ_NAME;',
'',
'IF CNT>0 THEN',
'    RAISE_APPLICATION_ERROR(-20999,''Some report not activate.Press test/ok button to activate the report.'');',
'END IF;',
'',
'END; ',
'',
'DECLARE',
'    l_job_name VARCHAR2(128) := DBMS_ASSERT.SIMPLE_SQL_NAME(:P203_RSJ_NAME);',
'    l_job_action VARCHAR2(4000);',
'    l_start_date TIMESTAMP WITH TIME ZONE;',
'    l_end_date TIMESTAMP WITH TIME ZONE;',
'    l_repeat_interval VARCHAR2(200);',
'    l_comments VARCHAR2(500) := :P203_RSJ_COMMENTS;',
'BEGIN',
'    -- Parse dates',
'    l_start_date := TO_TIMESTAMP_TZ(:P203_RSJ_START_DATE || '' 00:00:00.000000 +05:30'', ',
'                                    ''DD-MM-YYYY HH24:MI:SS.FF TZH:TZM'');',
'    l_end_date := TO_TIMESTAMP_TZ(:P203_RSJ_END_DATE || '' 00:00:00.000000 +05:30'', ',
'                                  ''DD-MM-YYYY HH24:MI:SS.FF TZH:TZM'');',
'    ',
'    -- Build repeat interval',
'    l_repeat_interval := ''FREQ=DAILY;BYHOUR='' || SUBSTR(:P203_RSJ_RUN_TIME, 1, 2) ||',
'                         '';BYMINUTE='' || SUBSTR(:P203_RSJ_RUN_TIME, 4, 2) ||',
'                         '';BYSECOND='' || SUBSTR(:P203_RSJ_RUN_TIME, 7, 2);',
'                         ',
'                         ',
'    IF :P203_RSJ_TYPE=''N'' THEN',
'    -- Create job',
'    l_job_action  := :P203_RSJ_REP_INTERV_NORMAL;',
'    ELSE',
'   BEGIN ',
'    EXECUTE IMMEDIATE  (''CREATE OR REPLACE PROCEDURE PROC_''||:P203_RSJ_ID||'' IS',
'   CURSOR C1',
'   IS ',
'   SELECT *',
'        FROM BUS_UNIT_PLANTS',
'        WHERE BUP_BU = '''''' || :GLOBAL_BU || '''''';',
'    ',
'    cr1         c1%ROWTYPE;',
'   CURSOR c2',
'   IS',
'      SELECT *',
'        FROM SCHEDULER_PARAM_LN',
'       WHERE PAR_LN_BU = '''''' || :GLOBAL_BU || '''''' AND PAR_LN_SCH_ID = '''''' || :P203_RSJ_ID || '''''';',
'',
'   cr2            c2%ROWTYPE;',
'   CURSOR c3',
'   IS',
'      SELECT *',
'        FROM user_mail_access',
'       WHERE uma_bu = '''''' || :GLOBAL_BU || '''''' AND uma_user = '''''' || :GLOBAL_USER || '''''';',
'',
'   cr3             c3%ROWTYPE;',
'   CURSOR C4',
'   IS',
'   SELECT RSJR_REPORT',
'        FROM RM_SCH_JOB_REPORTS',
'       WHERE RSJR_BU = '''''' || :GLOBAL_BU || '''''' AND RSJR_RSJ_ID = '''''' || :P203_RSJ_ID || '''''';',
'   CR4             C4%ROWTYPE;   ',
'   CURSOR C5 (c_seq_no NUMBER)',
'   IS',
'      SELECT MR_STATUS',
'        FROM WFM_MAIL_REPORT',
'       WHERE MR_SEQ_NO = c_seq_no;',
'   CR5             C5%ROWTYPE;',
'   CURSOR C6',
'   IS',
'      SELECT RSJE_EMAIL_ID',
'        FROM RM_SCH_JOB_EMAILS',
'       WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P203_RSJ_ID || '''''';',
'   CR6             C6%ROWTYPE;',
'   CURSOR C7',
'   IS',
'      SELECT RSJEC_EMAIL_ID',
'        FROM RM_SCH_JOB_CC_EMAILS',
'       WHERE RSJEC_BU = '''''' || :GLOBAL_BU || '''''' AND RSJEC_RSJ_ID = '''''' || :P203_RSJ_ID || '''''';',
'   CR7             C7%ROWTYPE;',
'',
'   v_userid        VARCHAR2 (100);',
'   v_to_email      VARCHAR2 (1000);',
'   v_emp_name      VARCHAR2 (150);',
'   v_subject       VARCHAR2 (100);',
'   v_body          VARCHAR2 (100);',
'   v_id            NUMBER;',
'   v_mail_status   VARCHAR2 (500);',
'   v_f_name        VARCHAR2 (500);',
'   v_seq_no        NUMBER (10);',
'   v_dir_name      VARCHAR2 (500);',
'   v_rpt_url       VARCHAR2 (2000);',
'   v_rpt_param       VARCHAR2 (4000);   ',
'   v_f_emp_id      VARCHAR2 (10);',
'   v_period_desc   VARCHAR2 (25);',
'   v_db            VARCHAR2 (100);   ',
'   v_pass          VARCHAR2 (100);',
'   v_cc_email      VARCHAR2(500);',
'   v_bcc_email      VARCHAR2(500);',
'BEGIN',
'   SELECT directory_path',
'     INTO v_dir_name',
'     FROM dba_directories',
'    WHERE directory_name = ''''FILE_ATTACH_DIR'''';',
'',
'   v_userid := SYS_CONTEXT (''''USERENV'''', ''''CURRENT_SCHEMA'''');',
'   ',
'         SELECT cryptit.decrypt (pass)',
'        INTO v_pass',
'        FROM schema_det',
'       WHERE user_id = v_userid;',
'   ',
'         v_db := UPPER (SYS_CONTEXT (''''USERENV'''', ''''DB_NAME''''));',
'',
'      v_f_name := v_dir_name',
'         || RTRIM ('''''' || :GLOBAL_USER || '''''')',
'         || ''''_''''',
'         || '''''' || :P203_RSJ_ID || ''''''',
'         || ''''.pdf'''';',
'',
'FOR CR2 IN C2',
'LOOP ',
'v_rpt_param := v_rpt_param || ''''&'''' || cr2.PAR_LN_ID || ''''='''' || cr2.PAR_LN_VALUE;',
'END LOOP;',
' OPEN C4 ;',
'         FETCH C4 INTO CR4;',
'      v_rpt_url :=',
'            func_get_jasper_report ('''''' || :GLOBAL_BU || '''''',',
'                                    SUBSTR(cr4.RSJR_REPORT,0,3),',
'                                    cr4.RSJR_REPORT,',
'                                    ''''PDF'''',',
'                                    ''''DOWNLOAD'''',',
'                                   ''''192.168.0.12'''') || v_rpt_param;',
' CLOSE C4;',
'      proc_debug_proc(func_get_jasper_report ('''''' || :GLOBAL_BU || '''''',',
'                                    SUBSTR(cr4.RSJR_REPORT,0,3),',
'                                    cr4.RSJR_REPORT,',
'                                    ''''PDF'''',',
'                                    ''''DOWNLOAD'''',',
'                                   ''''192.168.0.12'''') || v_rpt_param);',
'      --raise_application_error(-20999,v_rpt_url);',
'      ',
'      store_jasper_blob (v_rpt_url, v_f_name, v_id);',
'      export_jasper_blob (v_id, v_f_name);',
'         OPEN C6 ;',
'         FETCH C6 INTO CR6;',
'         OPEN C7 ;',
'         FETCH C7 INTO CR7;',
'',
'         SELECT LISTAGG (RSJE_EMAIL_ID, '''','''')',
'            WITHIN GROUP (ORDER BY RSJE_SEQ_NO)  RSJE_EMAIL_ID INTO v_to_email',
'         FROM RM_SCH_JOB_EMAILS',
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P203_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''T'''';',
'        ',
'         SELECT LISTAGG (RSJE_EMAIL_ID, '''','''')',
'            WITHIN GROUP (ORDER BY RSJE_SEQ_NO)  RSJE_EMAIL_ID INTO v_cc_email',
'         FROM RM_SCH_JOB_EMAILS',
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P203_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''C'''';',
'',
'         SELECT LISTAGG (RSJE_EMAIL_ID, '''','''')',
'            WITHIN GROUP (ORDER BY RSJE_SEQ_NO)  RSJE_EMAIL_ID INTO v_bcc_email',
'         FROM RM_SCH_JOB_EMAILS',
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P203_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''B'''';',
'        ',
'        v_subject   := '''''' || :P203_RSJ_MAIL_SUB || '''''';',
'        v_body      := '''''' || :P203_RSJ_MAIL_BODY || '''''';',
'',
'      IF v_to_email IS NOT NULL THEN',
'            SELECT wfm_mail_report_seq.NEXTVAL INTO v_seq_no FROM DUAL;',
'',
'         OPEN C3 ;',
'         FETCH C3 INTO CR3;',
'         INSERT INTO wfm_mail_report (mr_bu,',
'                                      mr_date,',
'                                      mr_f_name,',
'                                      mr_status,',
'                                      mr_body,',
'                                      mr_sub,',
'                                      mr_receiver_email,',
'                                      mr_bus_fun,',
'                                      mr_sender_email,',
'                                      mr_sender_pass,',
'                                      mr_cre_by,',
'                                      mr_cre_date,',
'                                      mr_host,',
'                                      mr_port,',
'                                      mr_seq_no,',
'                                      mr_user_email,',
'                                      mr_encryp_type,',
'                                      mr_cc,',
'                                      mr_bcc)',
'              VALUES ('''''' || :GLOBAL_BU || '''''',',
'                      SYSDATE,',
'                      v_f_name,',
'                      NULL,',
'                      v_body,',
'                      v_subject,',
'                      v_to_email,              ',
'                      cr2.PAR_LN_PRT_ID,',
'                      cr3.uma_user_name,',
'                      cr3.uma_password,',
'                      '''''' || :GLOBAL_USER || '''''',',
'                      SYSDATE,',
'                      cr3.uma_host,',
'                      cr3.uma_port,',
'                      v_seq_no,',
'                      cr3.uma_user_name,',
'                      ''''TLS'''',',
'                      v_cc_email,',
'                      v_bcc_email);',
'         COMMIT;',
'',
'         v_mail_status :=',
'            func_run_command (',
'               ''''"C:\Program Files\Java\jdk1.8.0_231\bin\java" sendmailv24.Roadmap jdbc:oracle:thin:@localhost:1521:''''',
'               || v_db',
'               || '''' ''''',
'               || v_userid               ',
'               || '''' ''''',
'               || v_pass',
'               || '''' ''''',
'               || v_seq_no',
'               || '''' ''''',
'               || '''''' || :GLOBAL_USER || '''''');',
'',
'         CLOSE C3;',
'         CLOSE C6;',
'         CLOSE C7;',
'         ',
'         OPEN C5 (v_seq_no);',
'         FETCH C5 INTO CR5;',
'         OPEN C1 ;',
'         FETCH C1 INTO CR1;',
'',
'         INSERT INTO email_outbox_hd (eoh_bu,',
'                                      eoh_doc_no,',
'                                      eoh_doc_date,',
'                                      eoh_sndr_email,',
'                                      eoh_subj,',
'                                      eoh_body,',
'                                      eoh_unit,',
'                                      eoh_status,',
'                                      eoh_cre_by,',
'                                      eoh_cre_date)',
'              VALUES ('''''' || :GLOBAL_BU || '''''',',
'                      v_seq_no,',
'                      SYSDATE,',
'                      cr3.uma_user_name,',
'                      v_subject,',
'                      v_body,',
'                      cr1.BUP_PLANT_ID,',
'                      cr5.mr_status,',
'                      '''''' || :GLOBAL_USER || '''''',',
'                      SYSDATE);',
'',
'         INSERT INTO email_outbox_rcvr_list (eorl_bu,',
'                                             eorl_doc_no,',
'                                             eorl_seq_no,',
'                                             eorl_rcvr_email,',
'                                             eorl_rcvr_type,',
'                                             eorl_cre_by,',
'                                             eorl_cre_date,',
'                                             eorl_status)',
'              VALUES ('''''' || :GLOBAL_BU || '''''',',
'                      v_seq_no,',
'                      1,',
'                      v_to_email,',
'                      ''''E'''',',
'                      '''''' || :GLOBAL_USER || '''''',',
'                      SYSDATE,',
'                      cr5.mr_status);',
'',
'         INSERT INTO email_outbox_attach (eoa_bu,',
'                                          eoa_doc_no,',
'                                          eoa_seq_no,',
'                                          eoa_filename,',
'                                          eoa_cre_by,',
'                                          eoa_cre_date)',
'              VALUES ('''''' || :GLOBAL_BU || '''''',',
'                      v_seq_no,',
'                      1,',
'                      v_f_name,',
'                      '''''' || :GLOBAL_USER || '''''',',
'                      SYSDATE);',
'         CLOSE C1;',
'         CLOSE C5;',
'         COMMIT;',
'      END IF;',
'END;'');END;',
'    l_job_action  := ''BEGIN PROC_''||:P203_RSJ_ID||'';END;'';',
'    DBMS_SCHEDULER.CREATE_JOB(',
'        job_name        => l_job_name,',
'        job_type        => ''PLSQL_BLOCK'',',
'        job_action      => l_job_action,',
'        start_date      => l_start_date,',
'        repeat_interval => l_repeat_interval,',
'        end_date        => l_end_date,',
'        enabled         => TRUE,',
'        comments        => l_comments',
'    );',
'',
'',
'UPDATE RM_SCHEDULE_JOBS SET RSJ_STATUS =''A''',
'    WHERE RSJ_BU = :GLOBAL_BU',
'      AND RSJ_ID = :P203_RSJ_ID',
'      AND RSJ_NAME = :P203_RSJ_NAME; ',
'',
'    APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Activated Successfully.'';',
'',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700376869398920793)
,p_internal_uid=>2063317701010684164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700428025164920851)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Cancel'
,p_static_id=>'process-for-cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE RM_SCHEDULE_JOBS ',
'      SET rsj_status = ''C'' ',
'    WHERE rsj_bu = :GLOBAL_BU',
'      AND rsj_id = :P203_RSJ_ID',
'      AND rsj_name = :P203_RSJ_NAME;',
'APEX_APPLICATION.g_print_success_message := ''Document cancelled.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700376419797920793)
,p_internal_uid=>2063319343360684167
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700426877080920849)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Deactivate'
,p_static_id=>'process-for-deactivate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'   IF :P10_RSJ_NAME IS NOT NULL THEN',
'      DBMS_SCHEDULER.DROP_JOB(',
'         job_name => TRIM(:P10_RSJ_NAME),',
'         force    => TRUE',
'      );',
'   END IF;',
'',
'   UPDATE RM_SCHEDULE_JOBS',
'      SET RSJ_STATUS = ''D''',
'    WHERE RSJ_BU   = :GLOBAL_BU',
'      AND RSJ_ID   = :P203_RSJ_ID',
'      AND RSJ_NAME = :P203_RSJ_NAME;',
'',
'   APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE :=',
'      ''<span style="color:white">Deactivated Successfully.</span>'';',
'',
'EXCEPTION',
'   WHEN OTHERS THEN',
'      APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE :=',
'         ''Error : '' || SQLERRM;',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700377258039920793)
,p_internal_uid=>2063318195276684165
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700427271424920849)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Run Job'
,p_static_id=>'process-for-run-job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    JOB_RUNNING EXCEPTION;',
'	BEGIN',
'        DBMS_SCHEDULER.run_job (job_name            => :P203_RSJ_NAME,',
'                                use_current_session => TRUE);',
'        APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Job Runned Successfully.'';                 ',
'EXCEPTION',
'	WHEN JOB_RUNNING THEN',
'	    RAISE_APPLICATION_ERROR(-20999,''Job already in run'');',
'	END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700378427901920794)
,p_internal_uid=>2063318589620684165
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700428394845920851)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Scheduler ID'
,p_static_id=>'process-for-scheduler-id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_PLAN_NO  NUMBER;',
'BEGIN',
'    IF :P203_RSJ_ID IS NULL THEN',
'',
'     /*SELECT NVL(MAX(TO_NUMBER(RSJ_ID)), 100000) + 1',
'        INTO V_PLAN_NO',
'      FROM RM_SCHEDULE_JOBS',
'      WHERE RSJ_BU = :GLOBAL_USER',
'        AND RSJ_NAME = RSJ_NAME;*/',
'     SELECT RSJ_SEQ.NEXTVAL',
'            INTO V_PLAN_NO',
'     FROM DUAL;',
'     ',
'    :P203_RSJ_ID := V_PLAN_NO;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700375221159920791)
,p_process_success_message=>'Document created &RSJ_ID.'
,p_internal_uid=>2063319713041684167
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700427630864920851)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Stop Job'
,p_static_id=>'process-for-stop-job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	JOB_NOT_RUNNING EXCEPTION;',
'BEGIN',
'    DBMS_SCHEDULER.stop_job (job_name => :P203_RSJ_NAME);',
'    APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Job stopped Successfully.'';',
'EXCEPTION',
'WHEN JOB_NOT_RUNNING THEN',
'   RAISE_APPLICATION_ERROR(-20999,''JOB NOT RUNNING'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700378836183920794)
,p_internal_uid=>2063318949060684167
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700442967985930026)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5700316562942889706)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Scheduler Jobs'
,p_static_id=>'process-form-scheduler-jobs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2063334286181693342
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700401314869920824)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9295576612966180700)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reports - Save Interactive Grid Data'
,p_static_id=>'reports-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :apex$ROW_STATUS = ''C'' THEN ',
'',
'SELECT NVL(MAX(RSJR_SEQ_NO),0) + 1',
'      INTO :RSJR_SEQ_NO',
'  FROM RM_SCH_JOB_REPORTS',
'      WHERE RSJR_BU     = :GLOBAL_BU',
'        AND RSJR_RSJ_ID = :P203_RSJ_ID',
'        AND RSJR_RSJ_NAME = :P203_RSJ_NAME;',
'                                                            ',
' INSERT INTO RM_SCH_JOB_REPORTS( RSJR_BU           ,',
'                                         RSJR_RSJ_ID       ,',
'                                         RSJR_RSJ_NAME     ,',
'                                         RSJR_SEQ_NO       ,',
'                                         RSJR_TYPE          ,',
'                                         RSJR_SUB_TYPE      ,',
'                                         RSJR_REPORT     ,',
'                                         RSJR_REPORT_NAME  ,',
'                                         RSJR_REPORT_PATH  ,',
'										 RSJR_REPORT_DEST_PATH,',
'									     RSJR_NO_OF_PARAM,',
'                                         RSJR_SUB_VOU_FLAG,',
'                                         RSJR_CRE_BY       ,',
'                                         RSJR_CRE_DATE       ',
'                                      )',
'                                VALUES( :GLOBAL_BU          ,',
'                                        :RSJR_RSJ_ID       ,',
'                                        :RSJR_RSJ_NAME     ,',
'                                        :RSJR_SEQ_NO       ,',
'                                        :RSJR_TYPE          ,',
'                                        :RSJR_SUB_TYPE      ,',
'                                        :RSJR_REPORT     ,',
'                                        :RSJR_REPORT_NAME  ,',
'                                        :RSJR_REPORT_PATH  ,',
'                                        :RSJR_REPORT_DEST_PATH  ,',
'										:RSJR_NO_OF_PARAM,',
'                                        :RSJR_SUB_VOU_FLAG      ,',
'                                        :GLOBAL_USER        ,',
'                                         SYSDATE             ',
'                                       );',
'                                       ',
'                apex_application.g_print_success_message := ''<span style="color:WHITE"> Line inserted.'';',
'                ',
'    ELSIF :apex$ROW_STATUS = ''U'' THEN',
'    ',
'        UPDATE RM_SCH_JOB_REPORTS',
'        SET    RSJR_REPORT     = :RSJR_REPORT        ,',
'               RSJR_REPORT_NAME    = :RSJR_REPORT_NAME  ,',
'               RSJR_REPORT_PATH            = :RSJR_REPORT_PATH  ,',
'	           RSJR_REPORT_DEST_PATH = :RSJR_REPORT_DEST_PATH,',
'			   RSJR_NO_OF_PARAM = :RSJR_NO_OF_PARAM,',
'               RSJR_TYPE       = :RSJR_TYPE,',
'               RSJR_SUB_TYPE   = :RSJR_SUB_TYPE,',
'               RSJR_SUB_VOU_FLAG = :RSJR_SUB_VOU_FLAG,',
'               RSJR_UPD_BY              = :GLOBAL_USER        ,',
'               RSJR_UPD_DATE          =  SYSDATE          ',
'        WHERE ROWID         = :ROWID',
'          AND RSJR_BU         = :GLOBAL_BU',
'          AND RSJR_RSJ_ID   = :RSJR_RSJ_ID;',
'          ',
'        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line updated.'';',
'',
'    ELSIF :apex$ROW_STATUS = ''D'' THEN',
'    ',
'            DELETE FROM RM_SCH_JOB_REPORTS',
'            WHERE ROWID        = :ROWID',
'              AND RSJR_RSJ_ID  = :RSJR_RSJ_ID',
'              AND RSJR_BU        = :GLOBAL_BU;',
'            apex_application.g_print_success_message := ''<span style="color:WHITE"> Line deleted.'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2063292633065684140
);
wwv_flow_imp.component_end;
end;
/
