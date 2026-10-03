prompt --application/pages/page_211131013
begin
--   Manifest
--     PAGE: 211131013
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
 p_id=>211131013
,p_name=>'Load Business Functions'
,p_alias=>'LOAD-BUSINESS-FUNCTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Load Business Functions'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9634279186737404260)
,p_plug_name=>'<b>Business Functions</b>'
,p_static_id=>'b-business-functions-b'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'USER_BUS_FUN_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7604591737162412832)
,p_plug_name=>'Header-options'
,p_static_id=>'header-options'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9629765269585909551)
,p_plug_name=>'Line Details'
,p_static_id=>'line-details'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       UBFAT_BU,',
'       UBFAT_DOC_NO,',
'       UBFAT_USER,',
'       UBFAT_SEQ_NO,',
'       UBFAT_BUS_FUN_ID,',
'		 --func_find_busfun_desc(:GLOBAL_bu,:ubfal_bus_fun_id,:GLOBAL.LANG)',
'       UBFAT_SEL_FLAG,',
'       UBFAT_CRE_BY,',
'       UBFAT_CRE_DATE,',
'       UBFAT_CRE_EMP_ID,',
'       UBFAT_CRE_IP_ADDR,',
'       UBFAT_CRE_OS_USER,',
'       UBFAT_UPD_BY,',
'       UBFAT_UPD_DATE,',
'       UBFAT_UPD_EMP_ID,',
'       UBFAT_UPD_IP_ADDR,',
'       UBFAT_UPD_OS_USER,',
'       UBFAT_BUS_FUN_TYPE,',
'       UBFAT_MODULE,',
'		 CASE WHEN UBFAT_SEL_FLAG = ''Y'' THEN',
'               ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"> </span>''',
'       ELSE',
'               ''<span aria-hidden="true" class="fa fa-square-o"  style = "color:GREEN;"> </span>''',
'       END select_flag',
'  from USER_BUS_FUN_ACCESS_TEMP',
'  where UBFAT_BU    =:global_bu',
'  and UBFAT_DOC_NO  =:P211131013_UBFAH_DOC_NO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P211131013_UBFAH_DOC_NO,P211131013_UBFAT_USER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Line Details'
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
 p_id=>wwv_flow_imp.id(9633824526774974148)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9633824625606974149)
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
 p_id=>wwv_flow_imp.id(9629767289898909571)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(7694122122463857076)
,p_name=>'SELECT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELECT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:$s(''P211131013_UBFAT_SEQ_NO'',''&UBFAT_SEQ_NO.''),$s(''P211131013_UBFAT_DOC_NO'',''&UBFAT_DOC_NO.''),$s(''P211131013_UBFAT_USER'',''&UBFAT_USER.''),$s(''P211131013_SELECT_FLAG'',''&UBFAT_SEL_FLAG.''),$s(''P211131013_UBFAT_ROWID'',''&ROWID.'');apex.submit(''Se'
||'lect'');'
,p_link_text=>'&SELECT_FLAG.'
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
 p_id=>wwv_flow_imp.id(9629765488535909553)
,p_name=>'UBFAT_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Bu'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9629765872975909557)
,p_name=>'UBFAT_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun.'
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
 p_id=>wwv_flow_imp.id(9629767063491909569)
,p_name=>'UBFAT_BUS_FUN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_BUS_FUN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Configurations;C,Entry;E,Queries;Q,Reports;R,Others;N'
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9629766090418909559)
,p_name=>'UBFAT_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(9629766208639909560)
,p_name=>'UBFAT_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ubfat Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(9629766221618909561)
,p_name=>'UBFAT_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(9629766374572909562)
,p_name=>'UBFAT_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Cre Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(9629766434793909563)
,p_name=>'UBFAT_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Cre Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(9629765549128909554)
,p_name=>'UBFAT_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Doc No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(9629767204659909570)
,p_name=>'UBFAT_MODULE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_MODULE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Module'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(9629765952374909558)
,p_name=>'UBFAT_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Sel Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(9629765746185909556)
,p_name=>'UBFAT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(9629766522042909564)
,p_name=>'UBFAT_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Upd By'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9629766623845909565)
,p_name=>'UBFAT_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ubfat Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(9629766792290909566)
,p_name=>'UBFAT_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(9629766873016909567)
,p_name=>'UBFAT_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Upd Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(9629766940181909568)
,p_name=>'UBFAT_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat Upd Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(9629765672739909555)
,p_name=>'UBFAT_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAT_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfat User'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P211131013_UBFAH_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9629765353041909552)
,p_internal_uid=>4147803517498298524
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9635334458628918086)
,p_interactive_grid_id=>wwv_flow_imp.id(9629765353041909552)
,p_static_id=>'20729351'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>5
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9635334642363918086)
,p_report_id=>wwv_flow_imp.id(9635334458628918086)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482011020901681049)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7694122122463857076)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562400600033040828)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9633824625606974149)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635335153469918090)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(9629765488535909553)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635336042174918094)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9629765549128909554)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635337017148918099)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9629765672739909555)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635337916827918104)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9629765746185909556)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635338743220918108)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9629765872975909557)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635339627779918113)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9629765952374909558)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635340521592918116)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9629766090418909559)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635341481432918122)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9629766208639909560)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635342374064918129)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9629766221618909561)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635343313085918135)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9629766374572909562)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635344212673918141)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9629766434793909563)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635345014473918147)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9629766522042909564)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635345855330918152)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9629766623845909565)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635346797055918158)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9629766792290909566)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635347627557918168)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9629766873016909567)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635348546790918172)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9629766940181909568)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635349473184918179)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9629767063491909569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>354
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635350369234918186)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9629767204659909570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635351267703918193)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9629767289898909571)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9635369171451943340)
,p_view_id=>wwv_flow_imp.id(9635334642363918086)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9633824526774974148)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>89
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562429355078040979)
,p_button_sequence=>70
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131013:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562429773074040981)
,p_button_sequence=>50
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562431297969040984)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562430931239040982)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562430066954040981)
,p_button_sequence=>60
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562431647963040985)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9634279186737404260)
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
 p_id=>wwv_flow_imp.id(7694121679102857072)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P211131013_LINE_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562430438871040982)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7704461952515104136)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_button_name=>'Select_all'
,p_static_id=>'select-all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Select All'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P211131013_LINE_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check-square'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7704462244035104139)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_button_name=>'UnSelect_all'
,p_static_id=>'unselect-all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unselect All'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P211131013_LINE_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-square-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7694122159318857077)
,p_branch_name=>'Go To Page 211131011'
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&P211131013_HEADER_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7694121679102857072)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7704462631774104142)
,p_branch_action=>'f?p=&APP_ID.:211131013:&SESSION.::&DEBUG.::P211131013_ROWID,P211131013_UBFAT_USER,P211131013_UBFAH_DOC_NO,P211131013_SELECT_FLAG:&P211131013_ROWID.,&P211131013_UBFAT_USER.,&P211131013_UBFAH_DOC_NO.,&P211131013_SELECT_FLAG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562411560507040853)
,p_name=>'P211131013_ALL'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'Y'
,p_prompt=>'All'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562409940949040849)
,p_name=>'P211131013_CONFIG'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'N'
,p_prompt=>'Configurations'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562410404975040851)
,p_name=>'P211131013_ENTRY'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'N'
,p_prompt=>'Entry'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7694122253191857078)
,p_name=>'P211131013_HEADER_ROWID'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704462775353104144)
,p_name=>'P211131013_LINE_COUNT'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)    from USER_BUS_FUN_ACCESS_TEMP',
'  where UBFAT_BU=:global_bu',
'  and UBFAT_DOC_NO=:P211131013_UBFAH_DOC_NO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562409588776040849)
,p_name=>'P211131013_MODULE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_MODULE_UAM1010'
,p_lov_cascade_parent_items=>'P211131013_UBFAH_VERT_ID'
,p_ajax_items_to_submit=>'P211131013_UBFAH_VERT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Module',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562410831140040851)
,p_name=>'P211131013_QUERY'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'N'
,p_prompt=>'Queries'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562411200113040853)
,p_name=>'P211131013_REPORTS'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'N'
,p_prompt=>'Reports'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562409152244040848)
,p_name=>'P211131013_ROLE_DESC'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_prompt=>'Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562408748196040848)
,p_name=>'P211131013_ROLE_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_prompt=>'Role Id'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_ROLE_UAM1010'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Role')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562400024268040829)
,p_name=>'P211131013_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704462126634104137)
,p_name=>'P211131013_SELECT_ALL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704461722071104133)
,p_name=>'P211131013_SELECT_FLAG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562400363677040831)
,p_name=>'P211131013_UBFAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562403595859040835)
,p_name=>'P211131013_UBFAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562404023149040837)
,p_name=>'P211131013_UBFAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562404348852040837)
,p_name=>'P211131013_UBFAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562404742245040838)
,p_name=>'P211131013_UBFAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562405210282040840)
,p_name=>'P211131013_UBFAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562401177950040832)
,p_name=>'P211131013_UBFAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562400791381040832)
,p_name=>'P211131013_UBFAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562401938896040834)
,p_name=>'P211131013_UBFAH_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_EFF_FROM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562402358659040834)
,p_name=>'P211131013_UBFAH_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_EFF_TO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562407950591040845)
,p_name=>'P211131013_UBFAH_LOAD_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'N'
,p_source=>'UBFAH_LOAD_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562401562856040832)
,p_name=>'P211131013_UBFAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_REFERENCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562402765143040835)
,p_name=>'P211131013_UBFAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562408423107040846)
,p_name=>'P211131013_UBFAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'D'
,p_source=>'UBFAH_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562405595436040840)
,p_name=>'P211131013_UBFAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562405966199040840)
,p_name=>'P211131013_UBFAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562406348350040842)
,p_name=>'P211131013_UBFAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562406819224040842)
,p_name=>'P211131013_UBFAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562407138415040843)
,p_name=>'P211131013_UBFAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562403155328040835)
,p_name=>'P211131013_UBFAH_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_source=>'UBFAH_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562407627676040845)
,p_name=>'P211131013_UBFAH_VERT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_source_plug_id=>wwv_flow_imp.id(9634279186737404260)
,p_item_default=>':GLOBAL_VERTICAL'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_VERT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704461409723104130)
,p_name=>'P211131013_UBFAT_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_item_default=>'P211131013_UBFAH_DOC_NO'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704461924363104135)
,p_name=>'P211131013_UBFAT_ROWID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704461548583104132)
,p_name=>'P211131013_UBFAT_SEQ_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7704461529814104131)
,p_name=>'P211131013_UBFAT_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9629765269585909551)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7694119818778857053)
,p_validation_name=>'P211131013_MODULE'
,p_static_id=>'p211131013-module'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P211131013_MODULE is null then',
'	return(''Module must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_imp.id(7562409588776040849)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7694119681515857052)
,p_validation_name=>'Role_id'
,p_static_id=>'role-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P211131013_ROLE_ID is null then',
'	return(''Role Id must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7562408748196040848)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562439301411041003)
,p_name=>'Assign_config'
,p_static_id=>'assign-config'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_CONFIG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562439826184041003)
,p_event_id=>wwv_flow_imp.id(7562439301411041003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131013_ALL',
  'items_to_submit', 'P211131013_CONFIG,P211131013_ENTRY,P211131013_QUERY,P211131013_REPORTS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131013_CONFIG = ''Y'' THEN',
    '   :P211131013_ENTRY   :=  ''N'';  ',
    '	:P211131013_QUERY   :=  ''N''; ',
    '	:P211131013_REPORTS := ''N''; ',
    '	:P211131013_ALL     := ''N'';',
    'END IF;',
    '',
    'IF :P211131013_CONFIG = ''N'' AND',
    '	 :P211131013_ENTRY = ''N'' AND ',
    '	 :P211131013_QUERY = ''N'' AND ',
    '	 :P211131013_REPORTS = ''N'' THEN',
    '	:P211131013_ALL := ''Y'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562435714530040996)
,p_name=>'Assign_entry'
,p_static_id=>'assign-entry'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ENTRY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562436135854040998)
,p_event_id=>wwv_flow_imp.id(7562435714530040996)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131013_ALL',
  'items_to_submit', 'P211131013_CONFIG,P211131013_ENTRY,P211131013_QUERY,P211131013_REPORTS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131013_ENTRY = ''Y'' THEN',
    '	:P211131013_CONFIG := ''N'';',
    '	:P211131013_QUERY := ''N'';',
    '	:P211131013_REPORTS := ''N'';',
    '	:P211131013_ALL := ''N'';',
    'END IF;',
    '',
    'IF :P211131013_CONFIG = ''N'' AND',
    '	 :P211131013_ENTRY = ''N'' AND ',
    '	 :P211131013_QUERY = ''N'' AND ',
    '	 :P211131013_REPORTS = ''N'' THEN',
    '	:P211131013_ALL := ''N'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562436599927040999)
,p_name=>'Assign_query'
,p_static_id=>'assign-query'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562437041447040999)
,p_event_id=>wwv_flow_imp.id(7562436599927040999)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131013_ALL',
  'items_to_submit', 'P211131013_CONFIG,P211131013_ENTRY,P211131013_QUERY,P211131013_REPORTS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131013_QUERY = ''Y'' THEN',
    '    :P211131013_CONFIG := ''N'';',
    '	 :P211131013_ENTRY := ''N''; ',
    '	 :P211131013_REPORTS := ''N'';',
    '	:P211131013_ALL := ''N'';',
    'END IF;',
    '',
    'IF :P211131013_CONFIG = ''N'' AND',
    '	 :P211131013_ENTRY = ''N'' AND ',
    '	 :P211131013_QUERY = ''N'' AND ',
    '	 :P211131013_REPORTS = ''N'' THEN',
    '	:P211131013_ALL := ''Y'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562437461857040999)
,p_name=>'Assign_reports'
,p_static_id=>'assign-reports'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_REPORTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562438008469041001)
,p_event_id=>wwv_flow_imp.id(7562437461857040999)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131013_ALL',
  'items_to_submit', 'P211131013_CONFIG,P211131013_ENTRY,P211131013_QUERY,P211131013_REPORTS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131013_REPORTS = ''Y'' THEN',
    '    :P211131013_CONFIG := ''N''; ',
    '	 :P211131013_ENTRY := ''N''; ',
    '	 :P211131013_QUERY := ''N'';  ',
    '	:P211131013_ALL := ''N'';',
    'END IF;',
    '',
    'IF :P211131013_CONFIG = ''N'' AND',
    '	 :P211131013_ENTRY = ''N'' AND ',
    '	 :P211131013_QUERY = ''N'' AND ',
    '	 :P211131013_REPORTS = ''N'' THEN',
    '	:P211131013_ALL := ''Y'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694119846919857054)
,p_name=>'Config _submit'
,p_static_id=>'config-submit'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_CONFIG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694120031986857055)
,p_event_id=>wwv_flow_imp.id(7694119846919857054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694120853637857064)
,p_name=>'Enable/Disable(Config_yes)'
,p_static_id=>'enable-disable-config-yes'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694120945679857065)
,p_event_id=>wwv_flow_imp.id(7694120853637857064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P211131013_ALL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P211131013_CONFIG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694121064693857066)
,p_name=>'Enable/Disable(Entry_yes)'
,p_static_id=>'enable-disable-entry-yes'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694121185322857067)
,p_event_id=>wwv_flow_imp.id(7694121064693857066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P211131013_ALL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P211131013_ENTRY'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694121258254857068)
,p_name=>'Enable/Disable(Query_yes)'
,p_static_id=>'enable-disable-query-yes'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694121428547857069)
,p_event_id=>wwv_flow_imp.id(7694121258254857068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P211131013_ALL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P211131013_QUERY'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694121497327857070)
,p_name=>'Enable/Disable(Reports_yes)'
,p_static_id=>'enable-disable-reports-yes'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694121597068857071)
,p_event_id=>wwv_flow_imp.id(7694121497327857070)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P211131013_ALL'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P211131013_REPORTS'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694120113161857056)
,p_name=>'Entry_submit'
,p_static_id=>'entry-submit'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ENTRY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694120199544857057)
,p_event_id=>wwv_flow_imp.id(7694120113161857056)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7794935090266546732)
,p_name=>'line_refresh'
,p_static_id=>'line-refresh'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9629765269585909551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7794935185729546733)
,p_event_id=>wwv_flow_imp.id(7794935090266546732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9629765269585909551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7657250223300606254)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7657250332189606255)
,p_event_id=>wwv_flow_imp.id(7657250223300606254)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7657250370859606256)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_MODULE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7657250489495606257)
,p_event_id=>wwv_flow_imp.id(7657250370859606256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694120271783857058)
,p_name=>'Query_submit'
,p_static_id=>'query-submit'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694120336850857059)
,p_event_id=>wwv_flow_imp.id(7694120271783857058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7694120523817857060)
,p_name=>'Report_submit'
,p_static_id=>'report-submit'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_REPORTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7694120556320857061)
,p_event_id=>wwv_flow_imp.id(7694120523817857060)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562438408601041001)
,p_name=>'Role Id'
,p_static_id=>'role-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131013_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562438859824041001)
,p_event_id=>wwv_flow_imp.id(7562438408601041001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131013_ROLE_DESC',
  'items_to_submit', 'P211131013_ROLE_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131013_ROLE_ID IS NULL THEN	',
    '	:P211131013_ROLE_DESC := NULL;',
    'ELSE',
    '	',
    'DECLARE',
    '	CURSOR c1',
    '	    IS	',
    '	SELECT abr_role_desc1,abr_role_id ',
    '    FROM APPL_BF_ROLES',
    '   WHERE abr_bu = :GLOBAL_bu ',
    '     AND abr_sys_admin = ''N''',
    '     AND abr_role_id = :P211131013_ROLE_ID;',
    '	',
    '	cr1		c1%ROWTYPE;',
    '',
    'BEGIN',
    '	OPEN c1;',
    '	FETCH c1 INTO cr1;',
    '	',
    '	IF c1%FOUND THEN',
    '		:P211131013_ROLE_DESC := cr1.abr_role_desc1;',
    '	ELSE',
    '		RAISE_APPLICATION_ERROR(-20999,''User Role not found.'');',
    '	END IF;	',
    '		',
    '	CLOSE c1;',
    '	',
    'END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562434477546040992)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(ubfah_doc_no),10000) + 1',
'  INTO :P211131013_UBFAH_DOC_NO',
'  FROM USER_BUS_FUN_ACCESS_HD',
' WHERE ubfah_bu = :GLOBAL_bu; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562430931239040982)
,p_internal_uid=>2080472642002429964
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562418550668040865)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9634279186737404260)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Load Business Functions'
,p_static_id=>'initialize-form-load-business-functions'
,p_internal_uid=>2080456715124429837
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562428690802040978)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9629765269585909551)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Line Details - Save Interactive Grid Data'
,p_static_id=>'line-details-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'raise_application_error(-20999,''test'');',
'',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'update USER_BUS_FUN_ACCESS_TEMP',
'set',
'UBFAT_BUS_FUN_ID		=:UBFAT_BUS_FUN_ID,',
'UBFAT_SEL_FLAG			=:UBFAT_SEL_FLAG,',
'UBFAT_UPD_BY			=:global_user,',
'UBFAT_UPD_DATE			=sysdate,',
'UBFAT_UPD_EMP_ID		=:UBFAT_UPD_EMP_ID,',
'UBFAT_UPD_IP_ADDR		=:global_ip_addr,',
'UBFAT_UPD_OS_USER		=:global_os_user,',
'UBFAT_BUS_FUN_TYPE	=:UBFAT_BUS_FUN_TYPE,',
'UBFAT_MODULE			=:UBFAT_MODULE',
'where UBFAT_BU			=:global_bu',
'and UBFAT_DOC_NO			=:P211131013_UBFAT_DOC_NO',
'and UBFAT_USER				=:P211131013_UBFAT_USER',
'and UBFAT_SEQ_NO			=:UBFAT_SEQ_NO;',
'commit;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>2080466855258429950
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562435271113040995)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process_for_clear'
,p_static_id=>'process-for-clear'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131013_UBFAH_DOC_NO IS NOT NULL THEN',
'	',
'	DELETE FROM user_bus_fun_access_temp',
'	 WHERE ubfat_bu = :GLOBAL_bu',
'	   AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO;',
'	   ',
'	:P211131013_MODULE 	:= NULL;	   ',
'	-- :USER_BUS_FUN_ACCESS_HD.module_desc := NULL;',
'	:P211131013_CONFIG 	:= ''N'';',
'	:P211131013_ENTRY 	:= ''N'';',
'	:P211131013_QUERY 	:= ''N'';',
'	:P211131013_REPORTS	:= ''N'';',
'	:P211131013_ALL 		:= ''Y'';',
'	',
'		 		  	  apex_application.g_print_success_message := ''Records Cleared Successfully.'';',
'--  ',
'	COMMIT;',
'',
'',
'END IF;	  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562431297969040984)
,p_internal_uid=>2080473435569429967
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562434873750040992)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process_for_Load'
,p_static_id=>'process-for-load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- RAISE_APPLICATION_ERROR(-20999,:P211131013_CONFIG||''-''||:P211131013_REPORTS||''-''||:P211131013_ENTRY||''-''||:P211131013_QUERY);',
'-- raise_application_error(-20999,:P211131013_MODULE||''~''||:P211131013_CONFIG||''~''||:P211131013_REPORTS||''~''||:P211131013_ENTRY||''~''||:P211131013_QUERY);',
'IF :P211131013_UBFAH_DOC_NO IS NOT NULL THEN',
'	',
'	IF :P211131013_ROLE_ID IS NOT NULL THEN',
'	',
'		DECLARE ',
'			v_seq_no			NUMBER;	',
'			v_access_type	VARCHAR2(1);',
'		BEGIN',
'		',
'		BEGIN	',
'			SELECT APPLUSER_ERP_ADMIN_USER',
'			  INTO v_access_type',
'			  FROM appl_users',
'			 WHERE appluser_bu = :global_bu',
'			   AND appluser_id = :P211131013_UBFAT_USER; ',
'		EXCEPTION',
'			 WHEN NO_DATA_FOUND THEN',
'			 	v_access_type := ''N'';',
'		END;',
'			if :P211131013_ALL =''Y'' then',
'			FOR cr1 IN (SELECT abra_bus_fun_id,apbuf_bus_fun_type,apbuf_module ',
'			              FROM appl_bf_role_access,appl_bus_fun',
'			             WHERE apbuf_fun_id = abra_bus_fun_id',
'			               AND abra_bu = :global_bu',
'			               AND abra_role_id = :P211131013_ROLE_ID',
'			               AND ((v_access_type = ''N'' AND apbuf_access_type = ''U'')',
'			                OR  v_access_type = ''Y'')',
'			               AND :P211131013_ROLE_ID IS NOT NULL',
'			               AND EXISTS (SELECT 1',
'			                             FROM appl_bus_fun_vert',
'			                            WHERE abfv_vertical_id = :global_vertical',
'			                              AND abfv_fun_id = abra_bus_fun_id ',
'			                              AND abfv_file_type IN (''FRM'',''RPT''))',
'			               AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access',
'				   					                 WHERE ubfa_bu = abra_bu',
'				   														 AND ubfa_user_id = :P211131013_UBFAT_USER ',
'				   														 AND ubfa_bus_fun_id = abra_bus_fun_id)',
'			              AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access_temp',
'				   					                 WHERE ubfat_bu = :global_bu',
'				   														 AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO',
'				   														 AND ubfat_bus_fun_id = abra_bus_fun_id)					   														 ',
'			             UNION ALL',
'			            SELECT abfv_fun_id,apbuf_bus_fun_type,apbuf_module',
'                    FROM appl_bus_fun_vert,appl_bus_fun',
'                   WHERE abfv_fun_id = apbuf_fun_id',
'                     AND abfv_vertical_id = :global_vertical',
'                     AND :P211131013_ROLE_ID IS NULL',
'                     AND abfv_file_type IN (''FRM'',''RPT'')',
'			               AND ((v_access_type = ''N'' AND apbuf_access_type = ''U'')',
'			                OR  v_access_type = ''Y'')                     ',
'                     AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access',
'				   					                 WHERE ubfa_bu = :global_bu',
'				   														 AND ubfa_user_id = :P211131013_UBFAT_USER ',
'				   														 AND ubfa_bus_fun_id = abfv_fun_id)',
'			              AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access_temp',
'				   					                 WHERE ubfat_bu = :global_bu',
'				   														 AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO',
'				   														 AND ubfat_bus_fun_id = abfv_fun_id)					   														 ',
'				   				)',
'		  LOOP',
'		  	SELECT NVL(MAX(ubfat_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM USER_BUS_FUN_ACCESS_TEMP',
'				 WHERE ubfat_bu = :global_bu',
'				   AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO; ',
'		  	-- raise_application_error(-20999,cr1.abra_bus_fun_id||''-''||cr1.apbuf_bus_fun_type||''-''||cr1.apbuf_module);',
'				INSERT INTO USER_BUS_FUN_ACCESS_TEMP (',
'																						  UBFAT_BU,',
'																						  UBFAT_DOC_NO,',
'																						  UBFAT_USER,',
'																						  UBFAT_SEQ_NO,',
'																						  UBFAT_BUS_FUN_ID,',
'																						  UBFAT_BUS_FUN_TYPE,',
'																						  UBFAT_MODULE,',
'																						  UBFAT_SEL_FLAG,',
'																						  UBFAT_CRE_BY,',
'																						  UBFAT_CRE_DATE,',
'																						  UBFAT_CRE_EMP_ID,',
'																						  UBFAT_CRE_IP_ADDR,',
'																						  UBFAT_CRE_OS_USER',
'																						)',
'																						VALUES',
'																						(',
'																						  :global_bu,',
'																						  :P211131013_UBFAH_DOC_NO,',
'																						  :P211131013_UBFAT_USER,',
'																						  v_seq_no,',
'																						  cr1.abra_bus_fun_id,',
'																						  cr1.apbuf_bus_fun_type,',
'																						  cr1.apbuf_module,',
'																						  ''N'',',
'																						  :global_user,',
'																						  SYSDATE,',
'																						  NULL,',
'																						  :GLOBAL_IP_ADDR,',
'																						  :GLOBAL_OS_USER',
'																						);',
'		  		  COMMIT;',
'',
'		  END LOOP;',
'		  end if;',
'		  PROC_COMMIT;',
'		  ',
'		  	  apex_application.g_print_success_message := ''Records  loaded'';',
'',
'		  ',
'		END;',
'		',
'	END IF;	',
'',
'	   ',
'	 	IF :P211131013_ROLE_ID IS NULL THEN',
'	',
'		DECLARE ',
'			v_seq_no	NUMBER;	',
'			v_access_type VARCHAR2(1);',
'		BEGIN',
'			',
'		BEGIN	',
'			SELECT APPLUSER_ERP_ADMIN_USER',
'			  INTO v_access_type',
'			  FROM appl_users',
'			 WHERE appluser_bu = :global_bu',
'			   AND appluser_id = :P211131013_UBFAT_USER; ',
'		EXCEPTION',
'			 WHEN NO_DATA_FOUND THEN',
'			 	v_access_type := ''N'';',
'		END;			',
'			',
'			FOR cr1 IN (SELECT abfv_fun_id,apbuf_bus_fun_type,abfv_module',
'                    FROM appl_bus_fun_vert,appl_bus_fun',
'                   WHERE abfv_fun_id = apbuf_fun_id ',
'                    AND abfv_vertical_id = :P211131013_UBFAH_VERT_ID',
'			               AND ((v_access_type = ''N'' AND apbuf_access_type = ''U'')',
'			                OR  v_access_type = ''Y'')                    ',
'                    AND (abfv_module = :P211131013_MODULE OR :P211131013_MODULE IS NULL) ',
'                    AND ((apbuf_bus_fun_type = ''C'' AND :P211131013_CONFIG = ''Y'')',
'                     OR (apbuf_bus_fun_type = ''E'' AND :P211131013_ENTRY = ''Y'')',
'                     OR (apbuf_bus_fun_type = ''Q'' AND :P211131013_QUERY = ''Y'')',
'                     OR (apbuf_bus_fun_type = ''R'' AND :P211131013_REPORTS = ''Y'')',
'                     OR (apbuf_bus_fun_type IN (''C'',''E'',''Q'',''R'') AND :P211131013_ALL = ''Y'')) ',
'			              AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access',
'				   					                 WHERE ubfa_bu = :global_bu',
'				   														 AND ubfa_user_id = :P211131013_UBFAT_USER ',
'				   														 AND ubfa_bus_fun_id = abfv_fun_id)',
'			              AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access_temp',
'				   					                 WHERE ubfat_bu = :global_bu',
'				   														 AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO',
'				   														 AND ubfat_bus_fun_id = abfv_fun_id)				   														 ',
'				   			ORDER BY TO_NUMBER(DECODE(apbuf_bus_fun_type,''C'',1,''E'',2,''Q'',3,''R'',4,5)),abfv_fun_id)',
'		  LOOP',
'		  	',
'		  	SELECT NVL(MAX(ubfat_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM USER_BUS_FUN_ACCESS_TEMP',
'				 WHERE ubfat_bu = :global_bu',
'				   AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO; ',
'		  	',
'				INSERT INTO USER_BUS_FUN_ACCESS_TEMP (',
'																						  UBFAT_BU,',
'																						  UBFAT_DOC_NO,',
'																						  UBFAT_USER,',
'																						  UBFAT_SEQ_NO,',
'																						  UBFAT_BUS_FUN_ID,',
'																						  UBFAT_BUS_FUN_TYPE,',
'																						  UBFAT_MODULE,',
'																						  UBFAT_SEL_FLAG,',
'																						  UBFAT_CRE_BY,',
'																						  UBFAT_CRE_DATE,',
'																						  UBFAT_CRE_EMP_ID,',
'																						  UBFAT_CRE_IP_ADDR,',
'																						  UBFAT_CRE_OS_USER',
'																						)',
'																						VALUES',
'																						(',
'																						  :global_bu,',
'																						  :P211131013_UBFAH_DOC_NO,',
'																						  :P211131013_UBFAT_USER,',
'																						  v_seq_no,',
'																						  cr1.abfv_fun_id,',
'																						  cr1.apbuf_bus_fun_type,',
'																						  cr1.abfv_module,',
'																						  ''N'',',
'																						  :global_user,',
'																						  SYSDATE,',
'																						  :P211131013_UBFAH_CRE_EMP_ID,',
'																						  :GLOBAL_IP_ADDR,',
'																						  :GLOBAL_OS_USER',
'																						);',
'		  END LOOP;',
'		  ',
'		  PROC_COMMIT;',
'		  ',
'		END;',
'	',
'		END IF;',
'	',
'END IF;	  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562431647963040985)
,p_internal_uid=>2080473038206429964
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562419011307040865)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9634279186737404260)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Load Business Functions'
,p_static_id=>'process-form-load-business-functions'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>2080457175763429837
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7704462390616104140)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process from line select_all'
,p_static_id=>'process-from-line-select-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update USER_BUS_FUN_ACCESS_TEMP',
'set UBFAT_SEL_FLAG=  ''Y''',
'where UBFAT_DOC_NO=:P211131013_UBFAT_DOC_NO',
'and UBFAT_USER=:P211131013_UBFAT_USER;',
'commit;',
':P211131013_SELECT_ALL :=''Y'';',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7704461952515104136)
,p_internal_uid=>2222500555072493112
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7704461815811104134)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process from line select flag'
,p_static_id=>'process-from-line-select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_Application_error(-20999,:P211131013_SELECT_FLAG||''-''||:P211131013_UBFAT_DOC_NO||''-''||:P211131013_UBFAT_USER||''-''||:P211131013_UBFAT_SEQ_NO);',
'',
'IF :P211131013_SELECT_FLAG = ''N'' THEN',
'    :P211131013_SELECT_FLAG := ''Y'';',
'else',
'    :P211131013_SELECT_FLAG := ''N'';',
'end if;',
'IF :P211131013_SELECT_FLAG = ''Y'' THEN',
'',
'update USER_BUS_FUN_ACCESS_TEMP',
'set UBFAT_SEL_FLAG=  ''Y''',
'where rowid=:P211131013_UBFAT_ROWID;',
'-- and UBFAT_DOC_NO=:P211131013_UBFAT_DOC_NO',
'-- and UBFAT_USER=:P211131013_UBFAT_USER',
'-- and UBFAT_SEQ_NO=:P211131013_UBFAT_SEQ_NO;',
'commit;',
'end if;',
'IF :P211131013_SELECT_FLAG = ''N'' THEN',
'',
'update USER_BUS_FUN_ACCESS_TEMP',
'set UBFAT_SEL_FLAG=  ''N''',
'where rowid=:P211131013_UBFAT_ROWID;',
'',
'-- where UBFAT_BU=:global_bu',
'-- and UBFAT_DOC_NO=:P211131013_UBFAT_DOC_NO',
'-- and UBFAT_USER=:P211131013_UBFAT_USER',
'-- and UBFAT_SEQ_NO=:P211131013_UBFAT_SEQ_NO;',
'commit;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Select'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2222499980267493106
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7704462479853104141)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process from line unselect_all_1'
,p_static_id=>'process-from-line-unselect-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update USER_BUS_FUN_ACCESS_TEMP',
'set UBFAT_SEL_FLAG=  ''N''',
'where UBFAT_DOC_NO=:P211131013_UBFAT_DOC_NO',
'and UBFAT_USER=:P211131013_UBFAT_USER;',
'commit;',
':P211131013_SELECT_ALL :=''N'';',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7704462244035104139)
,p_internal_uid=>2222500644309493113
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7694121998664857075)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from ok'
,p_static_id=>'process-from-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_Application_error(-20999,:P211131013_UBFAH_DOC_NO||''-''||:P211131013_UBFAT_USER||''-''||:P211131013_UBFAH_EFF_FROM||''-''||:P211131013_UBFAH_EFF_TO||''-''||:global_emp_id||''-''||:GLOBAL_ip_addr||''-''||:GLOBAL_os_user);',
'IF :P211131013_UBFAH_DOC_NO IS NOT NULL THEN',
'',
'		DECLARE ',
'			v_seq_no	NUMBER;	',
'		BEGIN',
'			FOR cr1 IN (SELECT ubfat_bus_fun_id,ubfat_bus_fun_type,ubfat_module ',
'			              FROM USER_BUS_FUN_ACCESS_TEMP',
'			             WHERE ubfat_bu = :global_bu',
'				   					 AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO',
'				   					 AND ubfat_user = :P211131013_UBFAT_USER',
'				   					 AND ubfat_sel_flag = ''Y''',
'				   					 AND NOT EXISTS(SELECT 1',
'				   					                  FROM user_bus_fun_access_ln',
'				   					                 WHERE ubfal_bu = ubfat_bu',
'				   														 AND ubfal_doc_no = ubfat_doc_no ',
'				   														 AND ubfal_bus_fun_id = ubfat_bus_fun_id)',
'				   				ORDER BY TO_NUMBER(DECODE(ubfat_bus_fun_type,''C'',1,''E'',2,''Q'',3,''R'',4,5)),ubfat_bus_fun_id)',
'		  LOOP',
'		  	',
'		  	SELECT NVL(MAX(ubfal_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM USER_BUS_FUN_ACCESS_LN',
'				 WHERE ubfal_bu = :global_bu',
'				   AND ubfal_doc_no = :P211131013_UBFAH_DOC_NO; ',
'		  	',
'				INSERT INTO USER_BUS_FUN_ACCESS_LN   (UBFAL_BU,',
'																						  UBFAL_DOC_NO,',
'																						  UBFAL_SEQ_NO,',
'																						  UBFAL_BUS_FUN_ID,',
'																						  UBFAL_BUS_FUN_TYPE,',
'																						  UBFAL_EFF_FROM,',
'																						  UBFAL_EFF_TO,',
'																						  UBFAL_MODULE,',
'																						  UBFAL_CRE_BY,',
'																						  UBFAL_CRE_DATE,',
'																						  UBFAL_CRE_EMP_ID,',
'																						  UBFAL_CRE_IP_ADDR,',
'																						  UBFAL_CRE_OS_USER',
'																						)',
'																						VALUES',
'																						(',
'																						  :global_bu,',
'																						  :P211131013_UBFAH_DOC_NO,',
'																						  v_seq_no,',
'																						  cr1.ubfat_bus_fun_id,',
'																						  cr1.ubfat_bus_fun_type,',
'																						  :P211131013_UBFAH_EFF_FROM,',
'																						  :P211131013_UBFAH_EFF_TO,',
'																						  cr1.ubfat_module,',
'																						  :global_user,',
'																						  SYSDATE,',
'																						  :global_emp_id,',
'																						  :GLOBAL_ip_addr,',
'																						  :GLOBAL_os_user',
'																						);',
'		  END LOOP;',
'		 		 		  	  apex_application.g_print_success_message := ''Records added Bus. Func Screen.'';',
' ',
'		DELETE FROM USER_BUS_FUN_ACCESS_TEMP',
'		 WHERE ubfat_bu = :global_bu',
'		   AND ubfat_doc_no = :P211131013_UBFAH_DOC_NO;',
'		  ',
'		  COMMIT;',
'		  ',
'		END;',
'	',
'END IF;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7694121679102857072)
,p_internal_uid=>2212160163121246047
);
wwv_flow_imp.component_end;
end;
/
