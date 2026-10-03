prompt --application/pages/page_00198
begin
--   Manifest
--     PAGE: 00198
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
 p_id=>198
,p_name=>'Scheduler Jobs'
,p_alias=>'SCHEDULER-JOBS'
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
 p_id=>wwv_flow_imp.id(7213585740308044632)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>80
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5652167237614391985)
,p_plug_name=>'CC Mail'
,p_static_id=>'cc-mail'
,p_region_name=>'CC_Mail'
,p_parent_plug_id=>wwv_flow_imp.id(7227546534364358447)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5652167324033391986)
,p_plug_name=>'CC Mail'
,p_static_id=>'cc-mail-2'
,p_region_name=>'C'
,p_parent_plug_id=>wwv_flow_imp.id(5652167237614391985)
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
'  where RSJEC_BU = :GLOBAL_BU',
'    and RSJEC_RSJ_ID = :P198_RSJ_ID',
'    and RSJEC_RSJ_NAME = :P198_RSJ_NAME'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P198_RSJ_ID,P198_RSJ_NAME'
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
 p_id=>wwv_flow_imp.id(5652169079209392003)
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
 p_id=>wwv_flow_imp.id(5652169127926392004)
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
 p_id=>wwv_flow_imp.id(5652168945284392002)
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
 p_id=>wwv_flow_imp.id(5652167500297391988)
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
 p_id=>wwv_flow_imp.id(5652168240128391995)
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(5652168302512391996)
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(5652168132389391994)
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
 p_id=>wwv_flow_imp.id(5652167991046391993)
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
 p_id=>wwv_flow_imp.id(5652167957662391992)
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
 p_id=>wwv_flow_imp.id(5652168700215392000)
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
 p_id=>wwv_flow_imp.id(5652168831583392001)
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
 p_id=>wwv_flow_imp.id(5652167597318391989)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_ID'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5652167706654391990)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_NAME'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5652167795989391991)
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
 p_id=>wwv_flow_imp.id(5652168633790391999)
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
 p_id=>wwv_flow_imp.id(5652168457592391997)
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
 p_id=>wwv_flow_imp.id(5652168497468391998)
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
 p_id=>wwv_flow_imp.id(5652169644555392009)
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
 p_id=>wwv_flow_imp.id(5652167385234391987)
,p_internal_uid=>2015058703430155303
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
 p_id=>wwv_flow_imp.id(5652311579672401352)
,p_interactive_grid_id=>wwv_flow_imp.id(5652167385234391987)
,p_static_id=>'20152029'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5652311735463401354)
,p_report_id=>wwv_flow_imp.id(5652311579672401352)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3637108698166236690)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5652169127926392004)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652312271060401357)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5652167500297391988)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652313137662401362)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5652167597318391989)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652314074829401363)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5652167706654391990)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652314943682401365)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5652167795989391991)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652315809118401366)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5652167957662391992)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652316768456401368)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5652167991046391993)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652317593256401369)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5652168132389391994)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>354.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652318557270401371)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5652168240128391995)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652319404796401374)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5652168302512391996)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652320301361401376)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5652168457592391997)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652321264859401377)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5652168497468391998)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652322177019401379)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5652168633790391999)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652323027694401380)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5652168700215392000)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652323944158401382)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5652168831583392001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>295.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652324864881401384)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5652168945284392002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652328642332404952)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5652169079209392003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5652536433746480143)
,p_view_id=>wwv_flow_imp.id(5652311735463401354)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5652169644555392009)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7232451130766674508)
,p_plug_name=>'Email'
,p_static_id=>'email'
,p_region_name=>'Email'
,p_parent_plug_id=>wwv_flow_imp.id(7227546534364358447)
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
 p_id=>wwv_flow_imp.id(7232451198206674509)
,p_plug_name=>'Email'
,p_static_id=>'email-2'
,p_region_name=>'E'
,p_parent_plug_id=>wwv_flow_imp.id(7232451130766674508)
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
'  where RSJE_BU = :GLOBAL_BU',
'    and RSJE_RSJ_ID = :P198_RSJ_ID',
'    and RSJE_RSJ_NAME = :P198_RSJ_NAME'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P198_RSJ_ID,P198_RSJ_NAME'
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
 p_id=>wwv_flow_imp.id(7232453001875674527)
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
 p_id=>wwv_flow_imp.id(7232453176529674528)
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
 p_id=>wwv_flow_imp.id(7232452645650674523)
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
 p_id=>wwv_flow_imp.id(7232451441197674511)
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
 p_id=>wwv_flow_imp.id(7232452135552674518)
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
 p_id=>wwv_flow_imp.id(7232452188146674519)
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
 p_id=>wwv_flow_imp.id(7232452045151674517)
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
 p_id=>wwv_flow_imp.id(7232451913992674516)
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
 p_id=>wwv_flow_imp.id(7232451880888674515)
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
 p_id=>wwv_flow_imp.id(7285366280842480007)
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
 p_id=>wwv_flow_imp.id(7285366432554480009)
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
 p_id=>wwv_flow_imp.id(7232451492538674512)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7232451603210674513)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_NAME'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7232451770313674514)
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
 p_id=>wwv_flow_imp.id(7232452485429674522)
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
 p_id=>wwv_flow_imp.id(7232452381466674520)
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
 p_id=>wwv_flow_imp.id(7232452421503674521)
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
 p_id=>wwv_flow_imp.id(7233224207973444107)
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
 p_id=>wwv_flow_imp.id(7232451372772674510)
,p_internal_uid=>1752930388987754308
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
 p_id=>wwv_flow_imp.id(7232945032336968128)
,p_interactive_grid_id=>wwv_flow_imp.id(7232451372772674510)
,p_static_id=>'17534241'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7232945247439968128)
,p_report_id=>wwv_flow_imp.id(7232945032336968128)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5479521048718920202)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7232453176529674528)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232945739303968133)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7232451441197674511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232946611374968136)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7232451492538674512)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232947556511968137)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7232451603210674513)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232948444750968139)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7232451770313674514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232949370678968141)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7232451880888674515)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232950195078968142)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7232451913992674516)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232951088941968144)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7232452045151674517)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>343
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232951984697968145)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7232452135552674518)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232952937558968147)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7232452188146674519)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232953813434968147)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7232452381466674520)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232954703340968148)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7232452421503674521)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232955633311968152)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7232452485429674522)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232956494435968153)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7232452645650674523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232985153624036469)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7232453001875674527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7233234613873459659)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7233224207973444107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7285459449915603858)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7285366280842480007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7285491225188651334)
,p_view_id=>wwv_flow_imp.id(7232945247439968128)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7285366432554480009)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7227546869419358450)
,p_plug_name=>'Mail Content'
,p_static_id=>'mail-content'
,p_region_name=>'Mail_Content'
,p_parent_plug_id=>wwv_flow_imp.id(7227546534364358447)
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
 p_id=>wwv_flow_imp.id(7227546927824358451)
,p_plug_name=>'Mail Content'
,p_static_id=>'mail-content-2'
,p_region_name=>'MC'
,p_parent_plug_id=>wwv_flow_imp.id(7227546869419358450)
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
 p_id=>wwv_flow_imp.id(7241530018982878407)
,p_plug_name=>'PARAM SUB TYPES'
,p_static_id=>'param-sub-types'
,p_region_name=>'SV'
,p_parent_plug_id=>wwv_flow_imp.id(7227546869419358450)
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
 p_id=>wwv_flow_imp.id(7273399974821591634)
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
 p_id=>wwv_flow_imp.id(7273400196835591637)
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
 p_id=>wwv_flow_imp.id(7273400317869591638)
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
 p_id=>wwv_flow_imp.id(7273401605148591651)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7273401737532591652)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_NAME'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7273400136173591636)
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
 p_id=>wwv_flow_imp.id(7273400430457591639)
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
 p_id=>wwv_flow_imp.id(7273400562037591640)
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
 p_id=>wwv_flow_imp.id(7273400077106591635)
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
 p_id=>wwv_flow_imp.id(7273399860916591633)
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
 p_id=>wwv_flow_imp.id(7273401486510591650)
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
 p_id=>wwv_flow_imp.id(7273399685250591632)
,p_internal_uid=>1793878701465671430
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
 p_id=>wwv_flow_imp.id(7273594441376839117)
,p_interactive_grid_id=>wwv_flow_imp.id(7273399685250591632)
,p_static_id=>'17940735'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7273594603285839117)
,p_report_id=>wwv_flow_imp.id(7273594441376839117)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273595010196839122)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7273399860916591633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273595887203839125)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7273399974821591634)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273596852483839127)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7273400077106591635)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273597720839839128)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7273400136173591636)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>261.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273598676423839130)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7273400196835591637)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273599524372839131)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7273400317869591638)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273600404162839133)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7273400430457591639)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273601303124839134)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7273400562037591640)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273762897381971447)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7273401486510591650)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273923519477034792)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7273401605148591651)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7273924425165034795)
,p_view_id=>wwv_flow_imp.id(7273594603285839117)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7273401737532591652)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7232322544616496640)
,p_plug_name=>'Reports'
,p_static_id=>'reports'
,p_region_name=>'Reports'
,p_parent_plug_id=>wwv_flow_imp.id(7227546534364358447)
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
 p_id=>wwv_flow_imp.id(7232322630728496641)
,p_plug_name=>'Reports'
,p_static_id=>'reports-2'
,p_region_name=>'R'
,p_parent_plug_id=>wwv_flow_imp.id(7232322544616496640)
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
'    and RSJR_RSJ_ID = :P198_RSJ_ID',
'    and RSJR_RSJ_NAME = :P198_RSJ_NAME'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P198_RSJ_ID,P198_RSJ_NAME'
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
 p_id=>wwv_flow_imp.id(7294547229571617704)
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
 p_id=>wwv_flow_imp.id(7232451024334674507)
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
 p_id=>wwv_flow_imp.id(7232322788777496643)
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
 p_id=>wwv_flow_imp.id(7232323725568496652)
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
 p_id=>wwv_flow_imp.id(7232450587632674503)
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
 p_id=>wwv_flow_imp.id(7232323654763496651)
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
 p_id=>wwv_flow_imp.id(7232323201856496647)
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
  'manual_entry', 'Y',
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
 p_id=>wwv_flow_imp.id(7232323485083496650)
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
 p_id=>wwv_flow_imp.id(7232323335060496648)
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
 p_id=>wwv_flow_imp.id(7232323457198496649)
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
 p_id=>wwv_flow_imp.id(7232322939607496644)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7232323001707496645)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P198_RSJ_NAME'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7232323149989496646)
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
 p_id=>wwv_flow_imp.id(7232450903441674506)
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
 p_id=>wwv_flow_imp.id(7274990735997457325)
,p_name=>'RSJR_SUB_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RSJR_SUB_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Sub Vou. Type'
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
 p_id=>wwv_flow_imp.id(7294550095778617733)
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
 p_id=>wwv_flow_imp.id(7274990673286457324)
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
 p_id=>wwv_flow_imp.id(7232450691335674504)
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
 p_id=>wwv_flow_imp.id(7232450796399674505)
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
 p_id=>wwv_flow_imp.id(7233224157082444106)
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
 p_id=>wwv_flow_imp.id(7232322770071496642)
,p_internal_uid=>1752801786286576440
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
 p_id=>wwv_flow_imp.id(7232456530303675077)
,p_interactive_grid_id=>wwv_flow_imp.id(7232322770071496642)
,p_static_id=>'17529356'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7232456717619675078)
,p_report_id=>wwv_flow_imp.id(7232456530303675077)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5479547867984001954)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7294550095778617733)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232457271805675081)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7232322788777496643)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232458173391675084)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7232322939607496644)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232458998903675086)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7232323001707496645)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232459909983675087)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7232323149989496646)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232460870389675087)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7232323201856496647)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232461688035675091)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7232323335060496648)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>260
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232462674762675092)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7232323457198496649)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232463577978675094)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7232323485083496650)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>257
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232464319399675095)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7232323654763496651)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232465254083675097)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7232323725568496652)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232466132337675098)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7232450587632674503)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232467035844675098)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7232450691335674504)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232467889830675100)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7232450796399674505)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232468858698675103)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7232450903441674506)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7232469755138675103)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7232451024334674507)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7233233751406459655)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7233224157082444106)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7275500838293776459)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7274990673286457324)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>221
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7275501732692776464)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7274990735997457325)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>450
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7294582556640706656)
,p_view_id=>wwv_flow_imp.id(7232456717619675078)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7294547229571617704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7213582872972044603)
,p_plug_name=>'Scheduler Jobs'
,p_static_id=>'scheduler-jobs'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'RM_SCHEDULE_JOBS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7227546534364358447)
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
 p_id=>wwv_flow_imp.id(7213585352901044628)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213585089292044626)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7232453351845674530)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7232322630728496641)
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
,p_button_cattributes=>'onclick="add_row(''R'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7233223792002444103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7232451198206674509)
,p_button_name=>'ADD_1'
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
,p_button_cattributes=>'onclick="add_row(''E'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7273400903474591644)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7241530018982878407)
,p_button_name=>'ADD_2'
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
,p_button_cattributes=>'onclick="add_row(''SV'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5652169316530392006)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5652167324033391986)
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
 p_id=>wwv_flow_imp.id(7227544388523358426)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213586026716044635)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213585884574044634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_static_id=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_condition=>'P198_RSJ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7213585235777044627)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7273401138938591646)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7241530018982878407)
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
 p_id=>wwv_flow_imp.id(7232453554744674532)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7232322630728496641)
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
 p_id=>wwv_flow_imp.id(7233223990847444105)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7232451198206674509)
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
 p_id=>wwv_flow_imp.id(5652169513081392008)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5652167324033391986)
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
 p_id=>wwv_flow_imp.id(7213586707510044642)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
,p_button_name=>'PARAMETER'
,p_static_id=>'parameter'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Parameter'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:199:&SESSION.::&DEBUG.::P199_RSJ_ID,P199_RSJ_NAME:&P198_RSJ_ID.,&P198_RSJ_NAME.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7213585442415044629)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213585494429044630)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213586186972044637)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P198_RSJ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7273400990395591645)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7241530018982878407)
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
 p_id=>wwv_flow_imp.id(7232453415350674531)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7232322630728496641)
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
 p_id=>wwv_flow_imp.id(7233223928092444104)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7232451198206674509)
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
 p_id=>wwv_flow_imp.id(5652169432055392007)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5652167324033391986)
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
 p_id=>wwv_flow_imp.id(7213585652449044631)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7213585740308044632)
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
 p_id=>wwv_flow_imp.id(7213585036477044625)
,p_name=>'P198_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213583318264044608)
,p_name=>'P198_RSJ_ACTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_source=>'RSJ_ACTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213583007073044605)
,p_name=>'P198_RSJ_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'RSJ_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7285365984924480005)
,p_name=>'P198_RSJ_CC_MAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7227546927824358451)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_source=>'RSJ_CC_MAIL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213583727892044612)
,p_name=>'P198_RSJ_COMMENTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Comments'
,p_source=>'RSJ_COMMENTS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>240
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213584070116044615)
,p_name=>'P198_RSJ_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'RSJ_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584108841044616)
,p_name=>'P198_RSJ_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'RSJ_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213583527034044610)
,p_name=>'P198_RSJ_END_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'End Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source=>'RSJ_END_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213583157517044606)
,p_name=>'P198_RSJ_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Schedule ID'
,p_source=>'RSJ_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(7213583902890044614)
,p_name=>'P198_RSJ_MAIL_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7227546927824358451)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Body'
,p_source=>'RSJ_MAIL_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>6
,p_colspan=>6
,p_grid_column=>4
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213583809424044613)
,p_name=>'P198_RSJ_MAIL_SUB'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7227546927824358451)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Subject'
,p_source=>'RSJ_MAIL_SUB'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>4
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213583242919044607)
,p_name=>'P198_RSJ_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Schedule Name'
,p_source=>'RSJ_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7285366122696480006)
,p_name=>'P198_RSJ_RECEIVER_MAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7227546927824358451)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_source=>'RSJ_RECEIVER_MAIL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584507529044620)
,p_name=>'P198_RSJ_REP_INTERV_NORMAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Script'
,p_source=>'RSJ_REP_INTERV_NORMAL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(7213584673559044621)
,p_name=>'P198_RSJ_REP_INTERV_REPORT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_source=>'RSJ_REP_INTERV_REPORT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584741562044622)
,p_name=>'P198_RSJ_RUN_TIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Run Time'
,p_placeholder=>'HH24:MI:SS'
,p_format_mask=>'HH24:MI:SS'
,p_source=>'RSJ_RUN_TIME'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213584845153044623)
,p_name=>'P198_RSJ_SCHEDULE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Schedule Type'
,p_source=>'RSJ_SCHEDULE_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PL/Sql Block;P,Executable;E,Stored Procedure;S'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213583407533044609)
,p_name=>'P198_RSJ_START_DATE'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Start Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source=>'RSJ_START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(7213583645024044611)
,p_name=>'P198_RSJ_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'RSJ_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;A,De-Active;D,Draft;N,Cancelled;C'
,p_cHeight=>1
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584430102044619)
,p_name=>'P198_RSJ_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_prompt=>'Type'
,p_source=>'RSJ_TYPE'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Normal;N,Mail;M'
,p_begin_on_new_line=>'N'
,p_read_only_when=>':P198_RSJ_STATUS <> ''N'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584199673044617)
,p_name=>'P198_RSJ_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'RSJ_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7213584310672044618)
,p_name=>'P198_RSJ_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_source_plug_id=>wwv_flow_imp.id(7213582872972044603)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'RSJ_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227546650678358448)
,p_name=>'P198_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7227546534364358447)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Mail Content;MC,Report;R,Email;E'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7299565037441666111)
,p_validation_name=>'VALID_RSJ_NAME'
,p_static_id=>'valid-rsj-name'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P198_RSJ_NAME IS NULL THEN',
'    RETURN ''Scheduler Name must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7213583242919044607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5652169731107392010)
,p_name=>'Dyn_CC'
,p_static_id=>'dyn-cc'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(5652167324033391986)
,p_triggering_element=>'RSJEC_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5652169809507392011)
,p_event_id=>wwv_flow_imp.id(5652169731107392010)
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
 p_id=>wwv_flow_imp.id(7285366538329480010)
,p_name=>'Dyn_Emp'
,p_static_id=>'dyn-emp'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7232451198206674509)
,p_triggering_element=>'RSJE_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7285366596970480011)
,p_event_id=>wwv_flow_imp.id(7285366538329480010)
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
 p_id=>wwv_flow_imp.id(7233224309686444108)
,p_name=>'Dyn_Refresh'
,p_static_id=>'dyn-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7232322630728496641)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7233224456067444109)
,p_event_id=>wwv_flow_imp.id(7233224309686444108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7232322630728496641)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7233224512608444110)
,p_name=>'Dyn_Refresh1'
,p_static_id=>'dyn-refresh-2'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7232451198206674509)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7233224666403444111)
,p_event_id=>wwv_flow_imp.id(7233224512608444110)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7232451198206674509)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5652169951233392012)
,p_name=>'Dyn_Refresh_3'
,p_static_id=>'dyn-refresh-3'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5652167324033391986)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5652170027542392013)
,p_event_id=>wwv_flow_imp.id(5652169951233392012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5652167324033391986)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7273401318125591648)
,p_name=>'Dyn_Refresh_2'
,p_static_id=>'dyn-refresh-4'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7241530018982878407)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7273401470970591649)
,p_event_id=>wwv_flow_imp.id(7273401318125591648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7241530018982878407)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7294550412103617736)
,p_name=>'Dyn_Rsjr_Sub_Type'
,p_static_id=>'dyn-rsjr-sub-type'
,p_event_sequence=>90
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7232322630728496641)
,p_triggering_element=>'RSJR_SUB_VOU_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7294550578314617737)
,p_event_id=>wwv_flow_imp.id(7294550412103617736)
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
 p_id=>wwv_flow_imp.id(7294550718797617739)
,p_event_id=>wwv_flow_imp.id(7294550412103617736)
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
 p_id=>wwv_flow_imp.id(7294550229481617734)
,p_name=>'Dyn_Rsjr_Type'
,p_static_id=>'dyn-rsjr-type'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7232322630728496641)
,p_triggering_element=>'RSJR_SUB_VOU_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7294550285479617735)
,p_event_id=>wwv_flow_imp.id(7294550229481617734)
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
 p_id=>wwv_flow_imp.id(7294550623585617738)
,p_event_id=>wwv_flow_imp.id(7294550229481617734)
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
 p_id=>wwv_flow_imp.id(7227547074994358452)
,p_name=>'Dyn_Show'
,p_static_id=>'dyn-show'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P198_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7232235701014420403)
,p_event_id=>wwv_flow_imp.id(7227547074994358452)
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
    '  ''E'':  ''Email''',
    '  //''C'':  ''CC_Mail''',
    '};',
    '',
    'const selectedTab = $v("P198_TAB");',
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
 p_id=>wwv_flow_imp.id(7257020750681322109)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7213586186972044637)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7257020805593322110)
,p_event_id=>wwv_flow_imp.id(7257020750681322109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P198_RSJ_ID,P198_RSJ_REP_INTERV_NORMAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    UPDATE rm_schedule_jobs',
    '    SET',
    '        rsj_rep_interv_normal = replace(replace(:p198_rsj_rep_interv_normal, ''p_bu'', :global_bu),''p_user'',:global_user)',
    '    WHERE',
    '            rsj_bu = :global_bu',
    '        AND rsj_id = :p198_rsj_id;',
    '',
    '    ',
    'END;')),
  'show_processing', 'N')).to_clob
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5652169275252392005)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5652167324033391986)
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
'        AND RSJEC_RSJ_ID = :P198_RSJ_ID',
'        AND RSJEC_RSJ_NAME = :P198_RSJ_NAME;',
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
,p_internal_uid=>2015060593448155321
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7232453219120674529)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7232451198206674509)
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
'        AND RSJE_RSJ_ID   = :P198_RSJ_ID',
'        AND RSJE_RSJ_NAME = :P198_RSJ_NAME;',
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
,p_internal_uid=>1752932235335754327
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213582924222044604)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7213582872972044603)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Scheduler Jobs'
,p_static_id=>'initialize-form-scheduler-jobs'
,p_internal_uid=>1734061940437124402
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7273400784442591643)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7241530018982878407)
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
'          AND PAR_SUB_ID               = :P198_RSJ_ID',
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
,p_internal_uid=>1793879800657671441
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213586326816044638)
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
'AND JRP_RSJR_RSJ_ID = :P198_RSJ_ID',
'AND JRP_RSJR_RSJ_NAME = :P198_RSJ_NAME;',
'',
'IF CNT>0 THEN',
'    RAISE_APPLICATION_ERROR(-20999,''Some report not activate.Press test/ok button to activate the report.'');',
'END IF;',
'',
'END; ',
'',
'DECLARE',
'    l_job_name VARCHAR2(128) := DBMS_ASSERT.SIMPLE_SQL_NAME(:P198_RSJ_NAME);',
'    l_job_action VARCHAR2(4000);',
'    l_start_date TIMESTAMP WITH TIME ZONE;',
'    l_end_date TIMESTAMP WITH TIME ZONE;',
'    l_repeat_interval VARCHAR2(200);',
'    l_comments VARCHAR2(500) := :P198_RSJ_COMMENTS;',
'BEGIN',
'    -- Parse dates',
'    l_start_date := TO_TIMESTAMP_TZ(:P198_RSJ_START_DATE || '' 00:00:00.000000 +05:30'', ',
'                                    ''DD-MM-YYYY HH24:MI:SS.FF TZH:TZM'');',
'    l_end_date := TO_TIMESTAMP_TZ(:P198_RSJ_END_DATE || '' 00:00:00.000000 +05:30'', ',
'                                  ''DD-MM-YYYY HH24:MI:SS.FF TZH:TZM'');',
'    ',
'    -- Build repeat interval',
'    l_repeat_interval := ''FREQ=DAILY;BYHOUR='' || SUBSTR(:P198_RSJ_RUN_TIME, 1, 2) ||',
'                         '';BYMINUTE='' || SUBSTR(:P198_RSJ_RUN_TIME, 4, 2) ||',
'                         '';BYSECOND='' || SUBSTR(:P198_RSJ_RUN_TIME, 7, 2);',
'                         ',
'                         ',
'    IF :P198_RSJ_TYPE=''N'' THEN',
'    -- Create job',
'    l_job_action  := :P198_RSJ_REP_INTERV_NORMAL;',
'     DBMS_SCHEDULER.CREATE_JOB(',
'        job_name        => l_job_name,',
'        job_type        => ''PLSQL_BLOCK'',',
'        job_action      => l_job_action,',
'        start_date      => l_start_date,',
'        repeat_interval => l_repeat_interval,',
'        end_date        => l_end_date,',
'        enabled         => TRUE,',
'        comments        => l_comments',
'    );',
'    UPDATE RM_SCHEDULE_JOBS SET RSJ_STATUS =''A''',
'    WHERE RSJ_BU = :GLOBAL_BU',
'      AND RSJ_ID = :P198_RSJ_ID',
'      AND RSJ_NAME = :P198_RSJ_NAME; ',
'',
'    APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Activated Successfully.'';',
'    ELSE',
'   BEGIN ',
'    EXECUTE IMMEDIATE  (''CREATE OR REPLACE PROCEDURE PROC_''||:P198_RSJ_ID||'' IS',
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
'       WHERE PAR_LN_BU = '''''' || :GLOBAL_BU || '''''' AND PAR_LN_SCH_ID = '''''' || :P198_RSJ_ID || '''''';',
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
'       WHERE RSJR_BU = '''''' || :GLOBAL_BU || '''''' AND RSJR_RSJ_ID = '''''' || :P198_RSJ_ID || '''''';',
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
'       WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P198_RSJ_ID || '''''';',
'   CR6             C6%ROWTYPE;',
'   CURSOR C7',
'   IS',
'      SELECT RSJEC_EMAIL_ID',
'        FROM RM_SCH_JOB_CC_EMAILS',
'       WHERE RSJEC_BU = '''''' || :GLOBAL_BU || '''''' AND RSJEC_RSJ_ID = '''''' || :P198_RSJ_ID || '''''';',
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
'   v_rpt_param     VARCHAR2 (4000);   ',
'   v_f_emp_id      VARCHAR2 (10);',
'   v_period_desc   VARCHAR2 (25);',
'   v_db            VARCHAR2 (100);   ',
'   v_pass          VARCHAR2 (100);',
'   v_cc_email      VARCHAR2(500);',
'   v_bcc_email     VARCHAR2(500);',
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
'         || '''''' || :P198_RSJ_ID || ''''''',
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
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P198_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''T'''';',
'        ',
'         SELECT LISTAGG (RSJE_EMAIL_ID, '''','''')',
'            WITHIN GROUP (ORDER BY RSJE_SEQ_NO)  RSJE_EMAIL_ID INTO v_cc_email',
'         FROM RM_SCH_JOB_EMAILS',
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P198_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''C'''';',
'',
'         SELECT LISTAGG (RSJE_EMAIL_ID, '''','''')',
'            WITHIN GROUP (ORDER BY RSJE_SEQ_NO)  RSJE_EMAIL_ID INTO v_bcc_email',
'         FROM RM_SCH_JOB_EMAILS',
'            WHERE RSJE_BU = '''''' || :GLOBAL_BU || '''''' AND RSJE_RSJ_ID = '''''' || :P198_RSJ_ID || '''''' AND RSJE_EMAIL_TYPE = ''''B'''';',
'        ',
'        v_subject   := '''''' || :P198_RSJ_MAIL_SUB || '''''';',
'        v_body      := '''''' || :P198_RSJ_MAIL_BODY || '''''';',
'',
'      IF v_to_email IS NOT NULL THEN',
'            SELECT wfm_mail_report_seq.NEXTVAL INTO v_seq_no FROM DUAL;',
'',
'         OPEN C3 ;',
'         FETCH C3 INTO CR3;',
'         DBMS_LOCK.sleep (05);',
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
'    l_job_action  := ''BEGIN PROC_''||:P198_RSJ_ID||'';END;'';',
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
'UPDATE RM_SCHEDULE_JOBS SET RSJ_STATUS =''A''',
'    WHERE RSJ_BU = :GLOBAL_BU',
'      AND RSJ_ID = :P198_RSJ_ID',
'      AND RSJ_NAME = :P198_RSJ_NAME; ',
'',
'    APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Activated Successfully.'';',
'',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7213585089292044626)
,p_internal_uid=>1734065343031124436
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7217732169128236516)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Cancel'
,p_static_id=>'process-for-cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE RM_SCHEDULE_JOBS ',
'      SET rsj_status = ''C'' ',
'    WHERE rsj_bu = :GLOBAL_BU',
'      AND rsj_id = :P198_RSJ_ID',
'      AND rsj_name = :P198_RSJ_NAME;',
'APEX_APPLICATION.g_print_success_message := ''Document cancelled.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7213586026716044635)
,p_internal_uid=>1738211185343316314
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213586408761044639)
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
'      AND RSJ_ID   = :P198_RSJ_ID',
'      AND RSJ_NAME = :P198_RSJ_NAME;',
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
,p_process_when_button_id=>wwv_flow_imp.id(7213585235777044627)
,p_internal_uid=>1734065424976124437
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213586484902044640)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Run Job'
,p_static_id=>'process-for-run-job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    JOB_RUNNING EXCEPTION;',
'	BEGIN',
'        DBMS_SCHEDULER.run_job (job_name            => :P198_RSJ_NAME,',
'                                use_current_session => TRUE);',
'        APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Job Runned Successfully.'';                 ',
'EXCEPTION',
'	WHEN JOB_RUNNING THEN',
'	    RAISE_APPLICATION_ERROR(-20999,''Job already in run'');',
'	END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7213585494429044630)
,p_internal_uid=>1734065501117124438
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7285366782797480012)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Scheduler ID'
,p_static_id=>'process-for-scheduler-id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_PLAN_NO  NUMBER;',
'BEGIN',
'    IF :P198_RSJ_ID IS NULL THEN',
'    /*SELECT NVL(MAX(TO_NUMBER(RSJ_ID)), 100000) + 1',
'        INTO V_PLAN_NO',
'      FROM RM_SCHEDULE_JOBS',
'      WHERE RSJ_BU = :GLOBAL_USER',
'        AND RSJ_NAME = RSJ_NAME;*/',
'     SELECT RSJ_SEQ.NEXTVAL',
'            INTO V_PLAN_NO',
'     FROM DUAL;',
'     ',
'    :P198_RSJ_ID := V_PLAN_NO;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7213585884574044634)
,p_process_success_message=>'Document created &RSJ_ID.'
,p_internal_uid=>1805845799012559810
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213586596004044641)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Stop Job'
,p_static_id=>'process-for-stop-job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	JOB_NOT_RUNNING EXCEPTION;',
'BEGIN',
'    DBMS_SCHEDULER.stop_job (job_name => :P198_RSJ_NAME);',
'    APEX_APPLICATION.g_print_success_message := '' <span style="color:WHITE"> Job stopped Successfully.'';',
'EXCEPTION',
'WHEN JOB_NOT_RUNNING THEN',
'   RAISE_APPLICATION_ERROR(-20999,''JOB NOT RUNNING'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7213585652449044631)
,p_internal_uid=>1734065612219124439
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7213586112189044636)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7213582872972044603)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Scheduler Jobs'
,p_static_id=>'process-form-scheduler-jobs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1734065128404124434
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7232452897600674526)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7232322630728496641)
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
'        AND RSJR_RSJ_ID = :P198_RSJ_ID',
'        AND RSJR_RSJ_NAME = :P198_RSJ_NAME;',
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
,p_internal_uid=>1752931913815754324
);
wwv_flow_imp.component_end;
end;
/
