prompt --application/pages/page_00032
begin
--   Manifest
--     PAGE: 00032
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
 p_id=>32
,p_name=>'Designation'
,p_alias=>'DESIGNATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Designation'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,500));',
'    background: #00b1e7;',
'    color: white;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10763014523438823931)
,p_plug_name=>'Designation'
,p_static_id=>'designation'
,p_region_name=>'ig_des_gp'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       HRPOS_BU,',
'       HRPOS_POS_ID,',
'       HRPOS_POS_NAME1,',
'       HRPOS_POS_NAME2,',
'       HRPOS_WORK_LOC_ID,',
'       HRPOS_START_FROM,',
'       HRPOS_OVRTME_FLAG,',
'       HRPOS_DEPT_ID,',
'       HRPOS_JOB_ID,',
'       HRPOS_OT_PFX_ID,',
'       HRPOS_NMR_FLAG,',
'       HRPOS_CRE_BY,',
'       HRPOS_CRE_IP_ADDR,',
'       HRPOS_CRE_OS_USER,',
'       HRPOS_CRE_DATE,',
'       HRPOS_UPD_BY,',
'       HRPOS_UPD_IP_ADDR,',
'       HRPOS_UPD_OS_USER,',
'       HRPOS_UPD_DATE,',
'       HRPOS_CRE_EMP_ID,',
'       HRPOS_UPD_EMP_ID,',
'       HRPOS_JOB_LEVEL_ID',
'       /*(SELECT jl_lvl_desc1',
'          FROM job_level',
'         WHERE jl_bu         = HRPOS_BU',
'           AND jl_job_lvl_id = HRPOS_JOB_LEVEL_ID',
'       ) HRPOS_JOB_LEVEL_DESC */',
'  from HR_POSITIONS',
' where HRPOS_BU = :GLOBAL_BU',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Jobs and Designation'
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
 p_id=>wwv_flow_imp.id(10763016958724823956)
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
 p_id=>wwv_flow_imp.id(10763017075442823957)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8606401513650372966)
,p_name=>'DELETE_DE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_link_target=>'javascript:$s(''P32_HRPOS_POS_ID'',''&HRPOS_POS_ID.'');apex.submit(''DELETE_DE'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763014700883823933)
,p_name=>'HRPOS_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Bu'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015772592823944)
,p_name=>'HRPOS_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Cre By'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016126148823947)
,p_name=>'HRPOS_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Hrpos Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016594145823952)
,p_name=>'HRPOS_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015901914823945)
,p_name=>'HRPOS_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Cre Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016026109823946)
,p_name=>'HRPOS_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Cre Os User'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015350624823940)
,p_name=>'HRPOS_DEPT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_DEPT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Dept Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015500286823941)
,p_name=>'HRPOS_JOB_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_JOB_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016792583823954)
,p_name=>'HRPOS_JOB_LEVEL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_JOB_LEVEL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015684505823943)
,p_name=>'HRPOS_NMR_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_NMR_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Nmr Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015606810823942)
,p_name=>'HRPOS_OT_PFX_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_OT_PFX_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Ot Pfx Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015317608823939)
,p_name=>'HRPOS_OVRTME_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_OVRTME_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763014807999823934)
,p_name=>'HRPOS_POS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_POS_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Designation'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'&P32_HRM_FLAG.'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(10763014889111823935)
,p_name=>'HRPOS_POS_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_POS_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763014977694823936)
,p_name=>'HRPOS_POS_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_POS_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Pos Name2'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015231180823938)
,p_name=>'HRPOS_START_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_START_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Hrpos Start From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016182448823948)
,p_name=>'HRPOS_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016517454823951)
,p_name=>'HRPOS_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Hrpos Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016740717823953)
,p_name=>'HRPOS_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016245155823949)
,p_name=>'HRPOS_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Upd Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016379647823950)
,p_name=>'HRPOS_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Upd Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763015134508823937)
,p_name=>'HRPOS_WORK_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HRPOS_WORK_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Hrpos Work Loc Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10763016863464823955)
,p_name=>'JOBS_ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(10763014552786823932)
,p_internal_uid=>5281052717243212904
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
 p_id=>wwv_flow_imp.id(10763373950087263182)
,p_interactive_grid_id=>wwv_flow_imp.id(10763014552786823932)
,p_static_id=>'11182429'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(10763374175455263182)
,p_report_id=>wwv_flow_imp.id(10763373950087263182)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8623077076988366255)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8606401513650372966)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9645132362476580530)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(10763017075442823957)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763374691254263184)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(10763014700883823933)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763375553633263187)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(10763014807999823934)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763376450624263192)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(10763014889111823935)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>307
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763377360569263195)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(10763014977694823936)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763378341741263203)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(10763015134508823937)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763379196437263207)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(10763015231180823938)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763380072721263212)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(10763015317608823939)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763381023642263218)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(10763015350624823940)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763381912803263223)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(10763015500286823941)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>311
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763382774067263229)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(10763015606810823942)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763383693427263234)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(10763015684505823943)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763384606232263240)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(10763015772592823944)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763385496862263245)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(10763015901914823945)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763386361868263251)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(10763016026109823946)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763387144880263256)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(10763016126148823947)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763388115772263262)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(10763016182448823948)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763388978590263267)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(10763016245155823949)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763389928602263273)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(10763016379647823950)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763390794595263278)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(10763016517454823951)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763391695293263282)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(10763016594145823952)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763392594088263289)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(10763016740717823953)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763393509782263295)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(10763016792583823954)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763394374148263300)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(10763016863464823955)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(10763395293386263304)
,p_view_id=>wwv_flow_imp.id(10763374175455263182)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(10763016958724823956)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116747767802655996)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10763014523438823931)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116748130205655996)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10763014523438823931)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7689089686043661571)
,p_name=>'P32_HRM_FLAG'
,p_item_sequence=>10
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MCC_HRM_FLAG from master_config_ctrl',
'where mcc_bu=:global_bu'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8606414088986373021)
,p_name=>'P32_HRPOS_POS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10763014523438823931)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116748981548655998)
,p_tabular_form_region_id=>wwv_flow_imp.id(10763014523438823931)
,p_validation_name=>'HRPOS_POS_ID'
,p_static_id=>'hrpos-pos-id'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	 ',
'	 CURSOR c1',
'	     IS',
'	 SELECT *',
'     FROM master_config_ctrl',
'    WHERE mcc_bu = :GLOBAL_bu;',
'    ',
'    cr1		c1%ROWTYPE;',
'    ',
'BEGIN',
'	 ',
'	 OPEN c1;',
'	 FETCH c1 INTO cr1;',
'	    ',
'	    IF c1%FOUND THEN',
'	    	 ',
'	    	 IF cr1.mcc_hrm_flag = ''M'' AND :HRPOS_POS_ID IS NULL THEN',
'				RETURN(''Designation must be entered.'');',
'	    	 END IF;',
'	    ',
'	    END IF;',
'	    ',
'	 CLOSE c1;',
'	 ',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116748130205655996)
,p_associated_column=>'HRPOS_POS_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116749393577655998)
,p_tabular_form_region_id=>wwv_flow_imp.id(10763014523438823931)
,p_validation_name=>'HRPOS_POS_NAME1'
,p_static_id=>'hrpos-pos-name'
,p_validation_sequence=>10
,p_validation=>'HRPOS_POS_NAME1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Designation must be entered.'
,p_when_button_pressed=>wwv_flow_imp.id(7116748130205655996)
,p_associated_column=>'HRPOS_POS_NAME1'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116751329523656004)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116747767802655996)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116751751061656006)
,p_event_id=>wwv_flow_imp.id(7116751329523656004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_des_gp" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116752172098656006)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116748130205655996)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116752648318656007)
,p_event_id=>wwv_flow_imp.id(7116752172098656006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_des_gp" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116750842647656003)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Designation Delete'
,p_static_id=>'designation-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C1',
'	    IS ',
'   SELECT * ',
'     FROM emp_active_infos',
'    WHERE empai_bu     = :GLOBAL_bu',
'      AND empai_pos_id = (SELECT HRPOS_POS_ID',
'		                      FROM hr_positions ',
'		                     WHERE ROWID = :JOBS_ROWID );',
'',
'       cr1                         c1%ROWTYPE;',
'',
'BEGIN',
'   OPEN c1;',
'	FETCH c1 INTO cr1;',
'',
'	  IF c1%FOUND THEN  ',
'		  RAISE_APPLICATION_ERROR(-20010,''Cannot delete since child record exists.'');',
'	  ELSE ',
'   --   RAISE_APPLICATION_ERROR(-20010,''TEST''||''~''||:P32_HRPOS_POS_ID);',
'	  DELETE ',
'	    FROM HR_POSITIONS',
'	   WHERE HRPOS_BU     = :global_bu',
'        AND HRPOS_POS_ID = :P32_HRPOS_POS_ID;',
'	   ',
'      apex_application.g_print_success_message := ''<span>Designation Deleted.</span>'';',
'',
'	 END IF;',
'   CLOSE c1;',
'END ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_DE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1634789007104044975
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116749645171655999)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(10763014523438823931)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Designation - Save Interactive Grid Data'
,p_static_id=>'designation-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS IN  (''C'',''U'')  THEN',
'   ',
'   DECLARE',
'     CURSOR c1',
'         IS',
'     SELECT *',
'       FROM hr_positions',
'      WHERE hrpos_bu = :Global_bu',
'        AND UPPER(TRIM(hrpos_pos_name1)) = UPPER(TRIM(:hrpos_pos_name1))',
'        AND (ROWID <> :job_rowid OR :job_rowid is null);',
'',
'        cr1             c1%ROWTYPE;',
'   BEGIN',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'        IF c1%FOUND THEN',
'           RAISE_APPLICATION_ERROR(-20010,''Designation already exists.'');',
'        END IF;',
'      CLOSE c1;',
'   END;',
'',
'END IF;',
'',
'IF :APEX$ROW_STATUS = ''C'' THEN ',
'',
'DECLARE',
'	V_POS_ID VARCHAR2(10);',
'  CURSOR c1',
'      IS',
'   SELECT *',
'     FROM master_config_ctrl',
'     WHERE mcc_bu = :GLOBAL_bu;',
'',
'    cr1                c1%ROWTYPE;',
'',
'BEGIN',
'	 ',
' OPEN c1;',
' FETCH c1 INTO cr1;',
'',
'  IF c1%NOTFOUND THEN',
'',
'   raise_application_error(-20999,''Designation master not found.'');',
'',
'    ELSE',
'',
'   IF cr1.mcc_hrm_flag = ''S'' THEN',
'',
'	SELECT MAX(hrpos_pos_id)',
'	  INTO :HRPOS_POS_ID',
'	  FROM hr_positions',
'	 WHERE hrpos_bu = :GLOBAL_bu;',
'',
'     :HRPOS_POS_ID := func_get_next_id(:HRPOS_POS_ID);',
'',
'    END IF;',
'',
'   END IF;',
'',
' CLOSE c1;',
'',
'END;',
'',
'-- raise_application_error(-20999,:HRPOS_POS_ID);',
'',
'IF :HRPOS_POS_ID IS NULL THEN',
'    raise_application_error (-20999,''Designation Id must be entered. The Setup Configured by Manual'');',
'END IF;',
'',
'      insert into hr_positions (hrpos_bu,',
'                                hrpos_pos_id,',
'                                hrpos_pos_name1,',
'                                hrpos_pos_name2,',
'                                hrpos_work_loc_id,',
'                                hrpos_start_from,',
'                                hrpos_ovrtme_flag,',
'                                hrpos_dept_id,',
'                                hrpos_job_id,',
'                                hrpos_ot_pfx_id,',
'                                hrpos_nmr_flag,',
'                                hrpos_cre_by,',
'                                hrpos_cre_date,',
'                                hrpos_job_level_id)',
'                         values(:GLOBAL_BU,',
'                                :HRPOS_POS_ID,',
'                                :hrpos_pos_name1,',
'                                :hrpos_pos_name2,',
'                                :hrpos_work_loc_id,',
'                                :hrpos_start_from,',
'                                :hrpos_ovrtme_flag,',
'                                :hrpos_dept_id,',
'                                :hrpos_job_id,',
'                                :hrpos_ot_pfx_id,',
'                                :hrpos_nmr_flag,',
'                                :global_user,',
'                                sysdate,',
'                                :hrpos_job_level_id);',
'',
' apex_application.g_print_success_message := ''<span>Designation Created Successfully.</span>'';',
'',
' END IF;',
' ',
' ',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'',
' UPDATE hr_positions ',
'    SET hrpos_pos_name1	        = :hrpos_pos_name1,',
'        hrpos_pos_name2	        = :hrpos_pos_name2,',
'        hrpos_work_loc_id	    = :hrpos_work_loc_id,',
'        hrpos_start_from	    = :hrpos_start_from,',
'        hrpos_ovrtme_flag	    = :hrpos_ovrtme_flag,',
'        hrpos_dept_id	        = :hrpos_dept_id,',
'        hrpos_job_id	        = :hrpos_job_id,',
'        hrpos_ot_pfx_id	        = :hrpos_ot_pfx_id,',
'        hrpos_nmr_flag	        = :hrpos_nmr_flag,',
'        hrpos_upd_by	        = :global_user,',
'        hrpos_upd_ip_addr	    = :hrpos_upd_ip_addr,',
'        hrpos_upd_os_user	    = :hrpos_upd_os_user,',
'        hrpos_upd_date	        = sysdate,',
'        hrpos_upd_emp_id	    = :hrpos_upd_emp_id,',
'        hrpos_job_level_id      = :hrpos_job_level_id',
'  WHERE hrpos_bu	            = :global_bu',
'    AND ROWID	                = :JOBS_ROWID;',
'',
' apex_application.g_print_success_message := ''<span>Designation Updated Successfully.</span>'';',
'',
'END IF;',
'',
'IF :APEX$ROW_STATUS = ''D'' then',
'',
'  DECLARE',
'      CURSOR C1',
'	  IS ',
'      SELECT * ',
'        FROM emp_active_infos',
'       WHERE empai_bu     = :GLOBAL_BU',
'         AND empai_pos_id = (SELECT HRPOS_POS_ID',
'		                       FROM hr_positions ',
'		                      WHERE ROWID = :JOBS_ROWID',
'                               );',
'',
'       cr1                         c1%ROWTYPE;',
'			        	       ',
' BEGIN',
'   OPEN c1;',
'	FETCH c1 INTO cr1;',
'',
'	  IF c1%FOUND THEN  ',
'		 RAISE_APPLICATION_ERROR(-20010,''Cannot delete since child record exists.'');',
'	  ELSE ',
'	  DELETE ',
'	    FROM HR_POSITIONS',
'	   WHERE ROWID = :JOBS_ROWID;',
'	   ',
'  apex_application.g_print_success_message := ''<span>Designation Deleted.</span>'';',
'',
'	 END IF;',
'   CLOSE c1;',
' END ;',
'END IF;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1634787809628044971
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116750524832656001)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	 ',
'	 CURSOR c1',
'	     IS',
'	 SELECT *',
'     FROM master_config_ctrl',
'    WHERE mcc_bu = :GLOBAL_bu;',
'    ',
'    cr1		c1%ROWTYPE;',
'    ',
'BEGIN',
'	 ',
'	 OPEN c1;',
'	 FETCH c1 INTO cr1;',
'	    ',
'	    IF c1%FOUND THEN',
'           IF cr1.mcc_hrm_flag = ''S'' THEN',
'              :P32_HRM_FLAG := ''readonly = readonly'';',
'           ELSE',
'              :P32_HRM_FLAG := NULL;',
'           END IF;',
'        END IF;',
'     CLOSE c1;',
'',
'END;',
'        '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1634788689289044973
);
wwv_flow_imp.component_end;
end;
/
