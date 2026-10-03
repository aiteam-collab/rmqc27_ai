prompt --application/pages/page_81862026
begin
--   Manifest
--     PAGE: 81862026
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
 p_id=>81862026
,p_name=>'Employee Profile'
,p_alias=>'EMPLOYEE-PROFILE1'
,p_step_title=>'Employee Profile'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7596322173982029871)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7582849970095299731)
,p_plug_name=>'Employee Profiles'
,p_static_id=>'employee-profiles'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7582850083729299732)
,p_plug_name=>'Employee Profiles'
,p_static_id=>'employee-profiles-2'
,p_parent_plug_id=>wwv_flow_imp.id(7582849970095299731)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMP_ACTIVE_INFOS'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_plug_read_only_when=>'P81862026_ROWID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7596654173978112929)
,p_plug_name=>'LN_REPORT'
,p_static_id=>'ln-report'
,p_parent_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'     ephd_doc_no  as profile_no,   ',
'     ephd_prof_batch_no  as atch_no,',
'     ephd_date as doc_date,',
'     ephd_year ,',
'     ephd_period ,',
'     ephd_eff_date as eff_from,',
'     ephd_status   ,',
'     ephd_action_id,',
'    (SELECT pact_action_desc1 as ephd_action_desc	 	         ',
'       FROM profile_actions',
'      WHERE pact_bu        = ephd_bu',
'	AND pact_action_id = ephd_action_id) ephd_action_desc, ',
'     ephd_emp_type, 		',
'    (SELECT pact_action_type',
'       FROM profile_actions',
'      WHERE pact_bu        = ephd_bu',
'	AND pact_action_id = ephd_action_id) ephd_action_type ,',
'	ephd_ref',
' FROM  EMP_PROFILES_HD       	',
'WHERE  EPHD_BU     = :GLOBAL_BU',
'  AND  EPHD_EMP_ID = :P81862026_EMPAI_EMP_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LN_REPORT'
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
 p_id=>wwv_flow_imp.id(7596655958146112947)
,p_name=>'ATCH_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATCH_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Batch No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>120
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
 p_id=>wwv_flow_imp.id(7596656116635112948)
,p_name=>'DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Doc Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(7596656382539112951)
,p_name=>'EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eff From'
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
 p_id=>wwv_flow_imp.id(7596656694218112954)
,p_name=>'EPHD_ACTION_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_ACTION_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ephd Action Desc'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7596656588468112953)
,p_name=>'EPHD_ACTION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_ACTION_ID'
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
 p_id=>wwv_flow_imp.id(7596656930945112956)
,p_name=>'EPHD_ACTION_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_ACTION_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ephd Action Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_imp.id(7596656752236112955)
,p_name=>'EPHD_EMP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_EMP_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7596656252168112950)
,p_name=>'EPHD_PERIOD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_PERIOD'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>' Period'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(7596656936784112957)
,p_name=>'EPHD_REF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_REF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Reference'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(7596656534337112952)
,p_name=>'EPHD_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>1
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
 p_id=>wwv_flow_imp.id(7596656216670112949)
,p_name=>'EPHD_YEAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPHD_YEAR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Year'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(7596655879982112946)
,p_name=>'PROFILE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROFILE_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Profile No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>120
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
 p_id=>wwv_flow_imp.id(7596655816424112945)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7596655674975112944)
,p_internal_uid=>2114693839431501916
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(7596733802540263165)
,p_interactive_grid_id=>wwv_flow_imp.id(7596655674975112944)
,p_static_id=>'21147720'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7596733985057263167)
,p_report_id=>wwv_flow_imp.id(7596733802540263165)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596734498844263181)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7596655816424112945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596735368105263196)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7596655879982112946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596736309394263206)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7596655958146112947)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596737158838263213)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7596656116635112948)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596738058567263223)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7596656216670112949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596738848291263234)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7596656252168112950)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596739828165263242)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7596656382539112951)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596740666452263249)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7596656534337112952)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596741599629263257)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7596656588468112953)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596742443163263265)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7596656694218112954)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596743393585263271)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7596656752236112955)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596744327481263279)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7596656930945112956)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7596745202352263285)
,p_view_id=>wwv_flow_imp.id(7596733985057263167)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7596656936784112957)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9711417916378757360)
,p_plug_name=>'LN_REPORT'
,p_static_id=>'ln-report-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'     ephd_doc_no  as profile_no,   ',
'     ephd_prof_batch_no  as atch_no,',
'     ephd_date as doc_date,',
'     ephd_year ,',
'     ephd_period ,',
'     ephd_eff_date as eff_from,',
'     ephd_status   ,',
'     ephd_action_id,',
'    (SELECT pact_action_desc1 as ephd_action_desc	 	         ',
'       FROM profile_actions',
'      WHERE pact_bu        = ephd_bu',
'	AND pact_action_id = ephd_action_id) ephd_action_desc, ',
'     ephd_emp_type, 		',
'    (SELECT pact_action_type',
'       FROM profile_actions',
'      WHERE pact_bu        = ephd_bu',
'	AND pact_action_id = ephd_action_id) ephd_action_type ,',
'	ephd_ref',
' FROM  EMP_PROFILES_HD       	',
'WHERE  EPHD_BU     = :GLOBAL_BU',
'  AND  EPHD_EMP_ID = :P81862026_EMPAI_EMP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'LN_REPORT'
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
 p_id=>wwv_flow_imp.id(9711418009589757361)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4229456174046146333
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418351444757364)
,p_db_column_name=>'ATCH_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Atch No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418400810757365)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418684752757368)
,p_db_column_name=>'EFF_FROM'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Eff From'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418999766757371)
,p_db_column_name=>'EPHD_ACTION_DESC'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ephd Action Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418965975757370)
,p_db_column_name=>'EPHD_ACTION_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Ephd Action Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711419199816757373)
,p_db_column_name=>'EPHD_ACTION_TYPE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Ephd Action Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711419150306757372)
,p_db_column_name=>'EPHD_EMP_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Ephd Emp Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418602743757367)
,p_db_column_name=>'EPHD_PERIOD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Ephd Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711419375591757374)
,p_db_column_name=>'EPHD_REF'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Ephd Ref'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418809116757369)
,p_db_column_name=>'EPHD_STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ephd Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418537706757366)
,p_db_column_name=>'EPHD_YEAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ephd Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418232032757363)
,p_db_column_name=>'PROFILE_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Profile No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9711418096214757362)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
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
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9711433158966769735)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21147076'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:PROFILE_NO:ATCH_NO:DOC_DATE:EPHD_YEAR:EPHD_PERIOD:EFF_FROM:EPHD_STATUS:EPHD_ACTION_ID:EPHD_ACTION_DESC:EPHD_EMP_TYPE:EPHD_ACTION_TYPE:EPHD_REF'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853726105299768)
,p_name=>'P81862026_EMPAI_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853776299299769)
,p_name=>'P81862026_EMPAI_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853843408299770)
,p_name=>'P81862026_EMPAI_APPR_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_APPR_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851726558299748)
,p_name=>'P81862026_EMPAI_BASIC_SAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_BASIC_SAL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851005863299741)
,p_name=>'P81862026_EMPAI_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852584336299757)
,p_name=>'P81862026_EMPAI_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852859145299760)
,p_name=>'P81862026_EMPAI_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853430426299765)
,p_name=>'P81862026_EMPAI_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852718667299758)
,p_name=>'P81862026_EMPAI_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852834305299759)
,p_name=>'P81862026_EMPAI_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851213106299743)
,p_name=>'P81862026_EMPAI_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_DEPT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851828000299749)
,p_name=>'P81862026_EMPAI_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Empai Eff From'
,p_source=>'EMPAI_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582854531800299776)
,p_name=>'P81862026_EMPAI_EMP_DEPT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582850304792299734)
,p_name=>'P81862026_EMPAI_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Emp.ID'
,p_source=>'EMPAI_EMP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
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
 p_id=>wwv_flow_imp.id(7582854103131299772)
,p_name=>'P81862026_EMPAI_EMP_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Emp.Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582854367470299775)
,p_name=>'P81862026_EMPAI_EMP_POS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582854651210299778)
,p_name=>'P81862026_EMPAI_EMP_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582854593758299777)
,p_name=>'P81862026_EMPAI_EMP_UNIT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851475834299746)
,p_name=>'P81862026_EMPAI_GRADE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_GRADE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851329310299744)
,p_name=>'P81862026_EMPAI_JOB_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_JOB_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851950307299751)
,p_name=>'P81862026_EMPAI_LAST_PROF_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_LAST_PROF_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853598067299767)
,p_name=>'P81862026_EMPAI_LOAD_ALLOW'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_LOAD_ALLOW'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851622299299747)
,p_name=>'P81862026_EMPAI_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_LOC_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852377533299755)
,p_name=>'P81862026_EMPAI_MON_CTC'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_MON_CTC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852305506299754)
,p_name=>'P81862026_EMPAI_MON_GROSS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_MON_GROSS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852466252299756)
,p_name=>'P81862026_EMPAI_PER_DAY_SAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_PER_DAY_SAL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852234339299753)
,p_name=>'P81862026_EMPAI_PER_DAY_WAGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_PER_DAY_WAGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851126566299742)
,p_name=>'P81862026_EMPAI_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851434178299745)
,p_name=>'P81862026_EMPAI_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_POS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852111058299752)
,p_name=>'P81862026_EMPAI_REF_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_REF_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582852957513299761)
,p_name=>'P81862026_EMPAI_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853260962299764)
,p_name=>'P81862026_EMPAI_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853513478299766)
,p_name=>'P81862026_EMPAI_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853122082299762)
,p_name=>'P81862026_EMPAI_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582851925897299750)
,p_name=>'P81862026_EMPAI_UPD_OPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_OPTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582853170188299763)
,p_name=>'P81862026_EMPAI_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'EMPAI_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7582854022970299771)
,p_name=>'P81862026_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_item_source_plug_id=>wwv_flow_imp.id(7582850083729299732)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7582854171034299773)
,p_name=>'P81862026_EMPAI_EMP_ID'
,p_static_id=>'p81862026-empai-emp-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P81862026_EMPAI_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7582854238282299774)
,p_event_id=>wwv_flow_imp.id(7582854171034299773)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P81862026_EMPAI_EMP_NAME,P81862026_EMPAI_EMP_STATUS,P81862026_EMPAI_EMP_POS,P81862026_EMPAI_EMP_DEPT,P81862026_EMPAI_EMP_UNIT',
  'items_to_submit', 'P81862026_EMPAI_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P81862026_EMPAI_EMP_ID IS NOT NULL THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)) emp_name,',
    '               emp_status,',
    '	 	         empai_pos_id,',
    '	 	         empai_dept_id,',
    '	 	         empai_plnt',
    '	 	    FROM employees,',
    '	 	         emp_active_infos',
    '	 	   WHERE emp_bu     = empai_bu',
    '	 	     AND emp_emp_id = empai_emp_id',
    '	 	     AND emp_bu     = :GLOBAL_bu',
    '	 	     AND emp_emp_id = :P81862026_EMPAI_EMP_ID;',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	     ',
    '	    CURSOR c2(c_pos_id	 VARCHAR2)',
    '	        IS',
    '	    SELECT hrpos_pos_name1',
    '        FROM hr_positions',
    '       WHERE hrpos_bu     = :GLOBAL_bu',
    '         AND hrpos_active_flag = ''Y''',
    '         AND hrpos_pos_id = c_pos_id;',
    '         ',
    '         cr2	c2%ROWTYPE;',
    '         ',
    '      CURSOR c3(c_dept_id	VARCHAR2)',
    '          IS',
    '      SELECT dept_name1',
    '        FROM departments',
    '       WHERE dept_bu = :GLOBAL_bu',
    '         AND dept_id = c_dept_id;',
    '         ',
    '         cr3	c3%ROWTYPE;',
    '         ',
    '      CURSOR c4(c_plnt	 VARCHAR2)',
    '          IS',
    '      SELECT bup_name1',
    '        FROM bus_unit_plants',
    '       WHERE bup_bu       = :GLOBAL_bu',
    '         AND bup_plant_id = c_plnt;',
    '         ',
    '         cr4	c4%ROWTYPE;',
    '	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%FOUND THEN',
    '	 	     	  :P81862026_EMPAI_EMP_NAME := cr1.emp_name;',
    '              :P81862026_EMPAI_EMP_STATUS :=cr1.emp_status;',
    '				 	  IF cr1.empai_pos_id IS NOT NULL THEN',
    '				 	  	 OPEN c2(cr1.empai_pos_id);',
    '				 	  	 FETCH c2 INTO cr2;',
    '				 	  	    IF c2%FOUND THEN',
    '				 	  	    	 :P81862026_EMPAI_EMP_POS := cr2.hrpos_pos_name1;',
    '				 	  	    END IF;',
    '				 	  	 CLOSE c2;',
    '				 	  	    END IF;',
    '				 	  IF cr1.empai_dept_id IS NOT NULL THEN',
    '				 	  	 OPEN c3(cr1.empai_dept_id);',
    '				 	  	 FETCH c3 INTO cr3;',
    '				 	  	    IF c3%FOUND THEN',
    '				 	  	    	 :P81862026_EMPAI_EMP_DEPT := cr3.dept_name1;',
    '				 	  	    END IF;',
    '				 	  	 CLOSE c3;',
    '				 	  	    END IF;',
    '				 	  IF cr1.empai_plnt IS NOT NULL THEN',
    '				 	  	 OPEN c4(cr1.empai_plnt);',
    '				 	  	 FETCH c4 INTO cr4;',
    '				 	  	    IF c4%FOUND THEN',
    '				 	  	    	 :P81862026_EMPAI_EMP_UNIT := cr4.bup_name1;',
    '				 	  	    END IF;',
    '				 	  	 CLOSE c4;',
    '				 	  END IF;',
    '	 	     END IF;',
    '	 	  CLOSE c1;',
    '	 END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7582850207618299733)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7582850083729299732)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Employee Profile'
,p_static_id=>'initialize-form-employee-profile'
,p_internal_uid=>2100888372074688705
);
wwv_flow_imp.component_end;
end;
/
