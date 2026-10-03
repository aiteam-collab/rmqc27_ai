prompt --application/pages/page_00082
begin
--   Manifest
--     PAGE: 00082
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
 p_id=>82
,p_name=>'Unit Access'
,p_alias=>'UNIT-ACCESS-HD'
,p_page_mode=>'MODAL'
,p_step_title=>'Unit Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BreadcrumbRegion {',
'    padding: 0px;',
'}',
'',
'.t-Breadcrumb, .t-Breadcrumb-item, .t-BreadcrumbRegion--compactTitle .t-BreadcrumbRegion-buttons .t-Button, .u-file-icon {',
'    vertical-align: baseline;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6060696871703945434)
,p_plug_name=>'Plant_access_hd'
,p_static_id=>'plant-access-hd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>15
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WAPL_USER_PLNT_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6059750178026719232)
,p_plug_name=>'Plant_access_ln'
,p_static_id=>'plant-access-ln'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WUPAL_BU,',
'       WUPAL_DOC_NO,',
'       WUPAL_SEQ_NO,',
'       WUPAL_PLNT_LOC_ID,',
'       (select bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu = WUPAL_BU',
'       and bupld_loc_id = WUPAL_PLNT_LOC_ID)Loc_name,',
'       WUPAL_DATE_FROM,',
'       WUPAL_DATE_TO,',
'       wupal_type,',
'       decode(wupal_type,''A'',''Add'',''R'',''Remove'')type,',
'       WUPAL_CRE_BY,',
'      WUPAL_CRE_DATE,',
'       WUPAL_UPD_BY,',
'       WUPAL_UPD_DATE',
'  from WAPL_USER_PLNT_ACCESS_LN',
'  where WUPAL_BU = :P82_WUPAH_BU',
'  and WUPAL_DOC_NO = :P82_WUPAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P82_WUPAH_DOC_NO'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Plant_access_ln'
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
 p_id=>wwv_flow_imp.id(6059753863153719269)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6059753989465719270)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'A',
  'unchecked_value', 'R',
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
 p_id=>wwv_flow_imp.id(6069493351160554231)
,p_name=>'LOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOC_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Loc. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(6069493136882554229)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
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
,p_default_type=>'STATIC'
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6059752294258719253)
,p_name=>'WUPAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6059752813744719258)
,p_name=>'WUPAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6059753077073719261)
,p_name=>'WUPAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(6059752601533719256)
,p_name=>'WUPAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(6059752669338719257)
,p_name=>'WUPAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(6059752361842719254)
,p_name=>'WUPAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6059752497454719255)
,p_name=>'WUPAL_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_PLNT_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Plnt. Loc. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(6069154895268284330)
,p_name=>'WUPAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Wupal Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6069154766052284329)
,p_name=>'WUPAL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_TYPE'
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
 p_id=>wwv_flow_imp.id(6059753176925719262)
,p_name=>'WUPAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(6059753440368719265)
,p_name=>'WUPAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_UPD_DATE'
,p_data_type=>'DATE'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6059752178092719252)
,p_internal_uid=>577790342549108224
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No Data Found'
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
 p_id=>wwv_flow_imp.id(6062360244083743992)
,p_interactive_grid_id=>wwv_flow_imp.id(6059752178092719252)
,p_static_id=>'5803985'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6062360513185743995)
,p_report_id=>wwv_flow_imp.id(6062360244083743992)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961949254611039)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6059753989465719270)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>41
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062361005861744003)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6059752294258719253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062361847586744017)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6059752361842719254)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062362704727744028)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6059752497454719255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062363633728744035)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6059752601533719256)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062364442791744043)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6059752669338719257)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062365337455744051)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6059752813744719258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062368070559744073)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6059753077073719261)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062368967608744084)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6059753176925719262)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062371711419744107)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6059753440368719265)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6062643983685816643)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6059753863153719269)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6069160744005284709)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6069154766052284329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6069350802219463728)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6069154895268284330)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6069499230168554624)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6069493136882554229)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6069834660071761329)
,p_view_id=>wwv_flow_imp.id(6062360513185743995)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6069493351160554231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6060709630152945473)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Create'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P82_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6059752010462719250)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_button_name=>'LOAD'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Load'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6060709148386945473)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P82_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6059754136056719272)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6059750178026719232)
,p_button_name=>'Save'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6059754693754719277)
,p_branch_name=>'Go To Page 83'
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ROWID,P83_WUPAH_DOC_NO:&P82_ROWID.,&P82_WUPAH_DOC_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6060709630152945473)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6059750033624719230)
,p_name=>'P82_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060697222174945434)
,p_name=>'P82_WUPAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060698754530945451)
,p_name=>'P82_WUPAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060699943555945453)
,p_name=>'P82_WUPAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060698023437945446)
,p_name=>'P82_WUPAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_source=>'WUPAH_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(6060697591314945442)
,p_name=>'P82_WUPAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_source=>'WUPAH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060698402022945451)
,p_name=>'P82_WUPAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_prompt=>'Reference'
,p_source=>'WUPAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>250
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6073907585018106233)
,p_name=>'P82_WUPAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>'N'
,p_source=>'WUPAH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6073907523639106232)
,p_name=>'P82_WUPAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_prompt=>'Type'
,p_source=>'WUPAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add User Location;A,Remove User Location;R'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060700393752945454)
,p_name=>'P82_WUPAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6060701561938945456)
,p_name=>'P82_WUPAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6073907389612106231)
,p_name=>'P82_WUPAH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_item_source_plug_id=>wwv_flow_imp.id(6060696871703945434)
,p_prompt=>'User'
,p_source=>'WUPAH_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_APPL_USERS'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'',
'    options.defaultGridOptions = {',
'',
'        columns: [{',
'',
'            D: {',
'',
'                heading: "User Name",',
'',
'                width: 120,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true               ',
'',
'            },',
'',
'            APPLUSER_EMP_ID: {',
'',
'                heading: "Employee",',
'',
'                width: 100,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true,',
'',
'                sortDirection: "asc",',
'',
'                sortIndex: 1',
'',
'            },           ',
'',
'            APPLUSER_EMP_NAME: {',
'',
'                heading: "Employee Name",',
'',
'                width: 150,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true,',
'',
'                sortDirection: "desc",',
'',
'                sortIndex: 2',
'',
'            },',
'    APPLUSER_POS_NAME: {',
'',
'                heading: "Designation",',
'',
'                width: 200,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true',
'',
'            }, ',
'              APPLUSER_DEPT_NAME: {',
'',
'                heading: "Department",',
'',
'                width: 200,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true,',
'',
'                sortDirection: "asc",',
'',
'                sortIndex: 1',
'',
'            }          ',
'             }]',
'',
'    };',
'',
'    return options;',
'',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Users',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6083149181379499540)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>'P82_WUPAH_REFERENCE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Reference must be entered.'
,p_associated_item=>wwv_flow_imp.id(6060698402022945451)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6059754814463719278)
,p_validation_name=>'User'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>'P82_WUPAH_USER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'User must be entered.'
,p_associated_item=>wwv_flow_imp.id(6073907389612106231)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6073907185515106229)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6059754136056719272)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6073907311419106230)
,p_event_id=>wwv_flow_imp.id(6073907185515106229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6059750059324719231)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_No'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (NVL(max(WUPAH_DOC_NO),100000)) + 1 into :P82_WUPAH_DOC_NO',
'from WAPL_USER_PLNT_ACCESS_HD',
'where wupah_bu = :global_bu;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6060709630152945473)
,p_internal_uid=>577788223781108203
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6060710009965945476)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6060696871703945434)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Plant_access_hd'
,p_static_id=>'initialize-form-plant-access-hd'
,p_internal_uid=>578748174422334448
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6059753765039719268)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'cursor c1',
'is',
'',
'SELECT *',
'  FROM bus_unit_plants_loc_dtls',
' WHERE bupld_bu = :global_bu;',
'',
' v_seq_no      number;',
'',
' begin',
'       delete from wapl_user_plnt_access_ln',
'       where wupal_bu = :global_bu',
'        and wupal_doc_no = :P82_WUPAH_DOC_NO;',
'   for cr1 in c1 loop',
'',
'       select (NVL(max(wupal_seq_no),0)) + 1 into v_seq_no',
'        from wapl_user_plnt_access_ln',
'        where wupal_bu = :global_bu',
'        and wupal_doc_no = :P82_WUPAH_DOC_NO;',
'        ',
'        INSERT INTO wapl_user_plnt_access_ln (wupal_bu,',
'                                      wupal_doc_no,',
'                                      wupal_seq_no,',
'                                      wupal_plnt_loc_id,',
'                                      wupal_date_from,',
'                                      wupal_date_to,',
'                                      wupal_type,',
'                                      wupal_cre_by,',
'                                      wupal_cre_date)',
'                         VALUES (:global_bu,',
'                                 :p82_wupah_doc_no,',
'                                 v_seq_no,',
'                                 cr1.bupld_loc_id,',
'                                 SYSDATE,',
'                                 TO_DATE (''31-12-2099'',''DD-MM-YYYY''),',
'                                 ''R'',',
'                                 :global_user,',
'                                 SYSDATE);',
'   end loop;',
'   commit;',
' end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6059752010462719250)
,p_internal_uid=>577791929496108240
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6059754038837719271)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6059750178026719232)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Plant_access_ln - Save Interactive Grid Data'
,p_static_id=>'plant-access-ln-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    v_unit    varchar2(10);',
'begin ',
' -- raise_application_error(-20999,:APEX$ROW_STATUS||''-''||:APEX$ROW_SELECTOR);',
'  update WAPL_USER_PLNT_ACCESS_LN',
'  set wupal_date_from = :WUPAL_DATE_FROM,',
'  wupal_date_to = :WUPAL_DATE_TO,',
'  wupal_upd_by = :global_user,',
'  wupal_upd_date = sysdate',
'  where wupal_bu = :global_bu',
'  and wupal_doc_no = :P82_WUPAH_DOC_NO',
'  and wupal_seq_no = :WUPAL_SEQ_NO;',
'',
'  IF :APEX$ROW_SELECTOR = ''A'' then',
'      SELECT bupld_plnt into v_unit',
'  FROM bus_unit_plants_loc_dtls',
' WHERE bupld_bu = :WUPAL_BU',
' and bupld_loc_id = :WUPAL_PLNT_LOC_ID;',
'     INSERT INTO appl_user_plant_access (',
'    auba_bu,',
'    auba_user_id,',
'    auba_plant,',
'    auba_from,',
'    auba_to,',
'    auba_deflt_flag,',
'    auba_cre_by,',
'    auba_cre_date,',
'    auba_plnt_loc_id',
') VALUES (',
'    :Global_bu,',
'    :Global_user,',
'    v_unit,',
'    :WUPAL_DATE_FROM,',
'    :WUPAL_DATE_TO,',
'    ''N'',',
'    :GLOBAL_USER,',
'    sysdate,',
'    :WUPAL_PLNT_LOC_ID',
');',
'  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Document Added'
,p_internal_uid=>577792203294108243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6060710386948945478)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6060696871703945434)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Plant_access_hd'
,p_static_id=>'process-form-plant-access-hd'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>578748551405334450
);
wwv_flow_imp.component_end;
end;
/
