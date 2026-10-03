prompt --application/pages/page_00110
begin
--   Manifest
--     PAGE: 00110
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
 p_id=>110
,p_name=>'Project Details'
,p_alias=>'PROJECT-DETAILS1'
,p_step_title=>'Project Details'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6287737459928797825)
,p_plug_name=>'Breadcurmb'
,p_static_id=>'breadcurmb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6287739360900797844)
,p_plug_name=>'EMP_PROJ_DLS_LN'
,p_static_id=>'emp-proj-dls-ln'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMP_PROJ_DLS_LN'
,p_include_rowid_column=>true
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
 p_id=>wwv_flow_imp.id(6324435102412787516)
,p_name=>'EMP_NAME'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6287739507345797846)
,p_name=>'EPDL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6287739823178797849)
,p_name=>'EPDL_CLNDR_DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CLNDR_DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Calendar Days'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6287739984629797851)
,p_name=>'EPDL_CPC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CPC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'CPC '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(6287740117497797852)
,p_name=>'EPDL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6324434145469787506)
,p_name=>'EPDL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(6324433898835787504)
,p_name=>'EPDL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6324433797209787503)
,p_name=>'EPDL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6324434039801787505)
,p_name=>'EPDL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6287739670038797847)
,p_name=>'EPDL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P110_EPDH_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6287739783577797848)
,p_name=>'EPDL_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Employee',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6324569573905904862)
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
 p_id=>wwv_flow_imp.id(6287739919080797850)
,p_name=>'EPDL_PAID_DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_PAID_DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Paid Days'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6324434219614787507)
,p_name=>'EPDL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(6324434683734787511)
,p_name=>'EPDL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6324434399191787509)
,p_name=>'EPDL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6324434366826787508)
,p_name=>'EPDL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(6324434530088787510)
,p_name=>'EPDL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPDL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(6324434759077787512)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6287739421762797845)
,p_internal_uid=>808218437977877643
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_imp.id(6324443923658789598)
,p_interactive_grid_id=>wwv_flow_imp.id(6287739421762797845)
,p_static_id=>'8449230'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6324444125182789598)
,p_report_id=>wwv_flow_imp.id(6324443923658789598)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324444594712789603)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6287739507345797846)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324445492512789606)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6287739670038797847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324446403589789606)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6287739783577797848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324447329809789608)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6287739823178797849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324448282311789609)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6287739919080797850)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324449168789789612)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6287739984629797851)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324450008114789614)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6287740117497797852)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324450880509789614)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6324433797209787503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324451756186789616)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6324433898835787504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324452584607789617)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6324434039801787505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324453535243789619)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6324434145469787506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324454387358789620)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6324434219614787507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324455325374789622)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6324434366826787508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324456249352789623)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6324434399191787509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324457159040789625)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6324434530088787510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324458038849789627)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6324434683734787511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324458962795789628)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6324434759077787512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6324511350725850112)
,p_view_id=>wwv_flow_imp.id(6324444125182789598)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6324435102412787516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>350
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6288409657298206773)
,p_plug_name=>'Project Details'
,p_static_id=>'project-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMP_PROJ_DLS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324435767896787522)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_EPDL_DOC_NO,P110_EPDL_LINE,GLOBAL_FIRST_ROWID,GLOBAL_NEXT_ROWID,GLOBAL_PREV_ROWID,GLOBAL_LAST_ROWID:,,,,,'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287737292545797824)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324436330906787528)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EPDH_DOC_NO ',
'  FROM EMP_PROJ_DLS_HD',
'WHERE EPDH_STATUS = ''N''',
'AND EPDH_BU = :GLOBAL_BU',
'AND EPDH_DOC_NO = :P110_EPDH_DOC_NO;'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6288425482042206794)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P110_ROWID is NULL and :P110_EPDH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check '
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287737564111797826)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'First'
,p_static_id=>'first'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'First'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_ROWID:&GLOBAL_FIRST_ROWID.'
,p_icon_css_classes=>'fa-angle-double-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287737799196797829)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Last'
,p_static_id=>'last'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Last'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_ROWID:&GLOBAL_LAST_ROWID.'
,p_icon_css_classes=>'fa-angle-double-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324436022734787525)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287737777044797828)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_ROWID:&GLOBAL_NEXT_ROWID.'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324436249214787527)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EPDH_DOC_NO ',
'  FROM EMP_PROJ_DLS_HD',
'WHERE EPDH_STATUS = ''N''',
'AND EPDH_BU = :GLOBAL_BU',
'AND EPDH_DOC_NO = :P110_EPDH_DOC_NO;'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287737619622797827)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'Previous'
,p_static_id=>'previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_ROWID:&GLOBAL_PREV_ROWID.'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6288425029243206794)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6287737459928797825)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P110_ROWID is NOT NULL and :P110_EPDH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288410053779206777)
,p_name=>'P110_EPDH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288411255965206783)
,p_name=>'P110_EPDH_CLNDR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Calendar'
,p_source=>'EPDH_CLNDR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pc_clndr_id||'' - ''||pc_clndr_name AS CLNDR_NAME,',
'       pc_clndr_id',
'  FROM pyrl_clndr',
' WHERE pc_bu = :GLOBAL_bu',
' AND PC_ACTIVE_FLAG = ''Y''',
' ORDER BY pc_clndr_name'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Calendar',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288414044031206784)
,p_name=>'P110_EPDH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288415605244206786)
,p_name=>'P110_EPDH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288414875068206784)
,p_name=>'P110_EPDH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288414408433206784)
,p_name=>'P110_EPDH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288415248710206786)
,p_name=>'P110_EPDH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288412464217206783)
,p_name=>'P110_EPDH_DATE_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Date From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DATE_FROM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6288412787621206784)
,p_name=>'P110_EPDH_DATE_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Date To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DATE_TO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6288410859310206781)
,p_name=>'P110_EPDH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6288410390923206780)
,p_name=>'P110_EPDH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Doc.No.'
,p_source=>'EPDH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288412016945206783)
,p_name=>'P110_EPDH_PERIOD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Period'
,p_source=>'EPDH_PERIOD'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  pcp_long_desc d,',
'            pcp_period r',
'  FROM payroll_cal_period',
' WHERE pcp_bu       = :GLOBAL_bu',
'   AND pcp_clndr_id = :P110_EPDH_CLNDR_ID',
'   AND pcp_year     = :P110_EPDH_YEAR',
'   AND pcp_status   = ''O''',
' ORDER BY pcp_period asc'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P110_EPDH_CLNDR_ID,P110_EPDH_YEAR'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
  'title', 'Select the Period',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288413232145206784)
,p_name=>'P110_EPDH_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Reference'
,p_source=>'EPDH_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(6288413628918206784)
,p_name=>'P110_EPDH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'EPDH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Draft;N,Posted;P,Cancelled;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288416010438206786)
,p_name=>'P110_EPDH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288417599602206787)
,p_name=>'P110_EPDH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288416857411206786)
,p_name=>'P110_EPDH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288416412774206786)
,p_name=>'P110_EPDH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288417279196206786)
,p_name=>'P110_EPDH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'EPDH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6288411609639206783)
,p_name=>'P110_EPDH_YEAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_prompt=>'Year'
,p_source=>'EPDH_YEAR'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pcp_year d,',
'       pcp_year r',
'  FROM payroll_cal_period',
' WHERE pcp_bu = :GLOBAL_bu',
'   AND pcp_clndr_id =  :P110_EPDH_CLNDR_ID',
' GROUP BY pcp_year',
' ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P110_EPDH_CLNDR_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
  'title', 'Select the Year',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324435855536787523)
,p_name=>'P110_EPDL_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6287739360900797844)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324435925359787524)
,p_name=>'P110_EPDL_LINE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6287739360900797844)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6287736130382797812)
,p_name=>'P110_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_item_source_plug_id=>wwv_flow_imp.id(6288409657298206773)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6287736228216797813)
,p_validation_name=>'Assign_clndr_id'
,p_static_id=>'assign-clndr-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_EPDH_CLNDR_ID IS NULL THEN',
'     return(''Calendar must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6288411255965206783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6287736340188797814)
,p_validation_name=>'cldr_year'
,p_static_id=>'cldr-year'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_EPDH_YEAR IS NULL THEN',
'     return(''Year must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6288411609639206783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6287736667599797817)
,p_validation_name=>'period'
,p_static_id=>'period'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_EPDH_PERIOD IS NULL THEN',
'     return(''Period must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6288412016945206783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6287736971625797820)
,p_validation_name=>'reference'
,p_static_id=>'reference'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_EPDH_REF IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6288413232145206784)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6324435451408787519)
,p_name=>'Find_Empid'
,p_static_id=>'find-empid'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6287739360900797844)
,p_triggering_element=>'EPDL_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6324435501861787520)
,p_event_id=>wwv_flow_imp.id(6324435451408787519)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'EMP_NAME',
  'items_to_submit', 'EPDL_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :EPDL_EMP_ID IS NOT NULL THEN',
    '',
    'DECLARE',
    '',
    '    CURSOR c1',
    '        IS',
    '    SELECT emp_emp_id,',
    '   	     LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)) emp_emp_name',
    '      FROM employees,',
    '           emp_active_infos',
    '     WHERE emp_bu     = empai_bu ',
    '       AND emp_emp_id = empai_emp_id',
    '       AND emp_bu     = :GLOBAL_bu ',
    '       AND emp_emp_id = :EPDL_EMP_ID; ',
    '',
    '       cr1       c1%ROWTYPE;  ',
    '',
    'BEGIN',
    '   OPEN c1;',
    '   FETCH c1 INTO cr1;',
    '     IF c1%FOUND THEN',
    '   	     :EMP_NAME   := cr1.emp_emp_name;',
    '     END IF;',
    '   CLOSE c1;',
    'END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6287736429980797815)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_EPDH_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6287736537227797816)
,p_event_id=>wwv_flow_imp.id(6287736429980797815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P110_EPDH_PERIOD,P110_EPDH_DATE_FROM,P110_EPDH_DATE_TO',
  'items_to_submit', 'P110_EPDH_CLNDR_ID,P110_EPDH_YEAR',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF  :P110_EPDH_YEAR IS NOT NULL THEN',
    '    ',
    '   DECLARE',
    '         ',
    '      CURSOR c1',
    '          IS',
    '      SELECT pcp_year',
    '        FROM payroll_cal_period',
    '       WHERE pcp_bu       = :GLOBAL_bu',
    '         AND pcp_clndr_id = :P110_EPDH_CLNDR_ID ',
    '         AND pcp_year     = :P110_EPDH_YEAR;',
    '         ',
    '         cr1                c1%ROWTYPE;',
    '         ',
    '   BEGIN',
    ' ',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '           ',
    '         IF c1%FOUND THEN',
    '         	  ',
    '         	  IF :P110_EPDH_YEAR > func_find_pyrl_year(:GLOBAL_bu, SYSDATE) THEN ',
    '                   raise_application_error(-20999,''Year should be less than or equal to Current year.'');',
    '         	  END IF;',
    '               else',
    '                 raise_application_error(-20999,''Year does not exists.'');',
    '         	  ',
    '            :P110_EPDH_PERIOD    := NULL;',
    '            :P110_EPDH_DATE_FROM := NULL;',
    '            :P110_EPDH_DATE_TO   := NULL;',
    '            ',
    '         END IF;',
    '              ',
    '      CLOSE c1;',
    '           ',
    '   END;',
    '         ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6287736738951797818)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P110_EPDH_PERIOD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6287736792682797819)
,p_event_id=>wwv_flow_imp.id(6287736738951797818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P110_EPDH_DATE_FROM,P110_EPDH_DATE_TO',
  'items_to_submit', 'P110_EPDH_CLNDR_ID,P110_EPDH_YEAR,P110_EPDH_PERIOD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF  :P110_EPDH_PERIOD  IS NOT NULL THEN',
    '    ',
    '   DECLARE',
    '         ',
    '      CURSOR c1',
    '          IS',
    '      SELECT *',
    '        FROM payroll_cal_period',
    '       WHERE pcp_bu       = :GLOBAL_bu',
    '         AND pcp_clndr_id = :P110_EPDH_CLNDR_ID ',
    '         AND pcp_year     = :P110_EPDH_YEAR ',
    '         AND pcp_period   = :P110_EPDH_PERIOD;',
    '         ',
    '         cr1                c1%ROWTYPE;',
    '         ',
    '   BEGIN',
    '           ',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '        --    raise_application_error(-20999,:P16251310401_EOHD_PERIOD||''-''||:P16251310401_CLNDR_ID||''-''||:P16251310401_EOHD_YEAR); ',
    '         IF c1%NOTFOUND THEN',
    '            raise_application_error(-20999,''Period does not exist.'');',
    '         ELSE',
    '',
    '         	  IF :P110_EPDH_YEAR||TO_CHAR(:P110_EPDH_PERIOD, ''00'') > func_find_pyrl_year(:GLOBAL_bu, SYSDATE)||TO_CHAR(func_find_pyrl_period(:GLOBAL_bu, SYSDATE),''00'') THEN ',
    '                   raise_application_error(-20999,''Period should be less than or equal to Current period.'');',
    '         	  END IF; ',
    '',
    '            :P110_EPDH_DATE_FROM  := TO_CHAR(TO_DATE(cr1.pcp_start_date,func_find_date_format(:GLOBAL_BU)),func_find_date_format(:GLOBAL_BU));',
    '            :P110_EPDH_DATE_TO    := TO_CHAR(cr1.pcp_end_date,func_find_date_format(:GLOBAL_BU)); ',
    '',
    '         END IF;',
    '              ',
    '      CLOSE c1;',
    '           ',
    '   END;',
    '         ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6287737242125797823)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' ',
'  UPDATE EMP_PROJ_DLS_HD',
'     SET EPDH_STATUS    = ''L'',',
'         EPDH_UPD_BY   = :GLOBAL_user,',
'         EPDH_UPD_DATE = SYSDATE',
'   WHERE EPDH_BU     = :GLOBAL_bu',
'     AND EPDH_DOC_NO = :P110_EPDH_DOC_NO;',
'',
' apex_application.g_print_success_message := ''Doc. No''||''-''||:P110_EPDH_DOC_NO||'' ''||''is Cancelled'';',
'',
' END;	     '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>808216258340877621
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6287737119041797822)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_no'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(EPDH_DOC_NO), 1000000000) + 1',
'  INTO :P110_EPDH_DOC_NO',
'  FROM EMP_PROJ_DLS_HD',
' WHERE EPDH_BU = :GLOBAL_bu;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6288425482042206794)
,p_internal_uid=>808216135256877620
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6288425794723206795)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6288409657298206773)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Project Details'
,p_static_id=>'initialize-form-project-details'
,p_internal_uid=>808904810938286593
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6325506365838264427)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_EPDH_STATUS = ''N'' THEN',
'',
'    DECLARE',
'        v_res      VARCHAR2(1);',
'',
'    BEGIN',
'       proc_load_cpc_emp_dtls(:GLOBAL_bu,',
'                              :P110_EPDH_DOC_NO,',
'                              :P110_EPDH_YEAR,',
'                              :P110_EPDH_PERIOD,',
'                              TO_DATE(:P110_EPDH_DATE_FROM,func_find_date_format(:GLOBAL_BU)), ',
'                              TO_DATE(:P110_EPDH_DATE_TO,func_find_date_format(:GLOBAL_BU)), ',
'                              :GLOBAL_user,',
'                              v_res',
'                               );',
'          IF v_res  = ''Y'' THEN',
'              APEX_APPLICATION.g_print_success_message :=''Employees Loaded'';',
'          ELSE',
'              APEX_APPLICATION.g_print_success_message :=''Not Loaded'';',
'          END IF;',
'',
'    END;',
'ELSE',
'    raise_application_error(-20999,''Document Not Found.'');',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6324436022734787525)
,p_internal_uid=>845985382053344225
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6287737045664797821)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P110_ROWID IS NULL THEN',
'   :P110_EPDH_BU       := :GLOBAL_BU;',
'   :P110_EPDH_CRE_BY   := :GLOBAL_USER;',
'   :P110_EPDH_CRE_DATE := SYSDATE;',
'ELSE',
'   :P110_EPDH_UPD_BY   := :GLOBAL_USER;',
'   :P110_EPDH_UPD_DATE := SYSDATE;',
'END IF;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>808216061879877619
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6288426242681206795)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6288409657298206773)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Project Details'
,p_static_id=>'process-form-project-details'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>808905258896286593
);
wwv_flow_imp.component_end;
end;
/
