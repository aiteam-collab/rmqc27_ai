prompt --application/pages/page_00066
begin
--   Manifest
--     PAGE: 00066
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
 p_id=>66
,p_name=>'Work flow'
,p_alias=>'WORK-FLOW2'
,p_step_title=>'Work flow'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6524210064630168934)
,p_plug_name=>'Administrator'
,p_static_id=>'administrator'
,p_region_name=>'ig_line'
,p_parent_plug_id=>wwv_flow_imp.id(6549109159913617266)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       WFAD_BU,',
'       WFAD_SEQ_NO,',
'       WFAD_BUS_PROC_ID,',
'       WFAD_ADMIN_POS_ID,',
'         (SELECT hrpos_pos_name1',
'           FROM hr_positions',
'          WHERE hrpos_bu     =:GLOBAL_BU',
'            AND hrpos_pos_id = WFAD_ADMIN_POS_ID)POSITION_DESC,',
'        (SELECT EMP_EMP_ID ',
'          FROM EMPLOYEES',
'         WHERE EMP_BU =:global_bu',
'           AND  EMP_POS_ID = WFAD_ADMIN_POS_ID )EMPLOYEE_ID,',
'         (SELECT EMP_FIRST_NAME1 ',
'            FROM EMPLOYEES',
'           WHERE EMP_BU      =:global_bu',
'             AND  EMP_POS_ID = (SELECT EMP_EMP_ID',
'                                  FROM EMPLOYEES',
'                                 WHERE EMP_BU     =:global_bu',
'                                   AND EMP_POS_ID = WFAD_ADMIN_POS_ID))EMPLOYEE_DESC,',
'       (SELECT EMP_DEPT_ID ',
'          FROM EMPLOYEES ',
'         WHERE EMP_BU      = :GLOBAL_BU',
'           AND  EMP_POS_ID = WFAD_ADMIN_POS_ID) DEPT_ID,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = :GLOBAL_bu',
'           AND dept_id = (SELECT EMP_DEPT_ID ',
'                            FROM EMPLOYEES ',
'                           WHERE EMP_BU     = :GLOBAL_BU',
'                             AND EMP_POS_ID = WFAD_ADMIN_POS_ID)) DEPT_DESC, ',
'		 (SELECT bup_name1',
'             FROM bus_unit_plants',
'              WHERE bup_bu       = :global_BU',
'               AND BUP_PLANT_ID = WFAD_ADMIN_POS_ID) plnt,							                                ',
'WFAD_CRE_BY,',
'WFAD_CRE_IP_ADDR,',
'WFAD_CRE_OS_USER,',
'WFAD_CRE_DATE,',
'WFAD_UPD_BY,',
'WFAD_UPD_IP_ADDR,',
'WFAD_UPD_OS_USER,',
'WFAD_UPD_DATE,',
'WFAD_CRE_EMP_ID,',
'WFAD_UPD_EMP_ID',
'FROM wf_admin_details',
'WHERE WFAD_BU =:GLOBAL_BU',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Administrator'
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
 p_id=>wwv_flow_imp.id(6524211903891168938)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524211371835168937)
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
 p_id=>wwv_flow_imp.id(6561270488166448649)
,p_name=>'DEPT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dept Desc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(6561270404496448648)
,p_name=>'DEPT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6561270329873448647)
,p_name=>'EMPLOYEE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Employee Desc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>60
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
 p_id=>wwv_flow_imp.id(6561270196696448646)
,p_name=>'EMPLOYEE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_ID'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(6561270630252448650)
,p_name=>'PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6561270038648448645)
,p_name=>'POSITION_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSITION_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Position Desc'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(6524212873225168938)
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
 p_id=>wwv_flow_imp.id(6524216850511168945)
,p_name=>'WFAD_ADMIN_POS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_ADMIN_POS_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Position'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6525141674430216387)
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524213917733168943)
,p_name=>'WFAD_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524215848779168945)
,p_name=>'WFAD_BUS_PROC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_BUS_PROC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524217842406168946)
,p_name=>'WFAD_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524220867866168949)
,p_name=>'WFAD_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524225930187168956)
,p_name=>'WFAD_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6524218840398168948)
,p_name=>'WFAD_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524219918400168949)
,p_name=>'WFAD_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6524214926565168943)
,p_name=>'WFAD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(6524221885471168951)
,p_name=>'WFAD_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524224889527168956)
,p_name=>'WFAD_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524226856481168957)
,p_name=>'WFAD_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6524222886216168953)
,p_name=>'WFAD_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6524223928442168954)
,p_name=>'WFAD_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_OS_USER'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6524210628493168935)
,p_internal_uid=>1042248792949557907
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6524210990827168935)
,p_interactive_grid_id=>wwv_flow_imp.id(6524210628493168935)
,p_static_id=>'10422492'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6524211191867168937)
,p_report_id=>wwv_flow_imp.id(6524210990827168935)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524212299038168938)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(6524211903891168938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524213256724168940)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6524212873225168938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524214293005168943)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6524213917733168943)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524215248327168943)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6524214926565168943)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524216268979168945)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6524215848779168945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524217284524168945)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6524216850511168945)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524218320311168948)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6524217842406168946)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524219322841168948)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6524218840398168948)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524220334001168949)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6524219918400168949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524221275204168951)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6524220867866168949)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524222294729168951)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6524221885471168951)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524223255014168954)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6524222886216168953)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524224270594168954)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6524223928442168954)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524225281933168956)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6524224889527168956)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524226335357168957)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6524225930187168956)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6524227309621168960)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6524226856481168957)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562449655850092546)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6561270038648448645)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562452117370092554)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6561270196696448646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562454452993092560)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6561270329873448647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562456848156092568)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6561270404496448648)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562459278864092574)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6561270488166448649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6562461664216092582)
,p_view_id=>wwv_flow_imp.id(6524211191867168937)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6561270630252448650)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6511821512372608547)
,p_plug_name=>'Mail File Name'
,p_static_id=>'mail-file-name'
,p_parent_plug_id=>wwv_flow_imp.id(6549109159913617266)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       WFMFN_BU,',
'       WFMFN_WF_TYPE,',
'       WFMFN_BENF_ID_REQ,',
'       WFMFN_DOC_NO_REQ,',
'       WFMFN_WF_TYPE_NAME_REQ,',
'       WFMFN_USER_ID_REQ,',
'       WFMFN_CRE_BY,',
'       WFMFN_CRE_IP_ADDR,',
'       WFMFN_CRE_OS_USER,',
'       WFMFN_CRE_DATE,',
'       WFMFN_UPD_BY,',
'       WFMFN_UPD_IP_ADDR,',
'       WFMFN_UPD_OS_USER,',
'       WFMFN_UPD_DATE,',
'       WFMFN_CRE_EMP_ID,',
'       WFMFN_UPD_EMP_ID',
'  from WF_MAIL_FILE_NAME',
'  where WFMFN_BU = :global_bu'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6549107155244617246)
,p_plug_name=>'Repotrs'
,p_static_id=>'repotrs'
,p_region_name=>'ig_line1'
,p_parent_plug_id=>wwv_flow_imp.id(6549109159913617266)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFR_BU,',
'       WFR_WF_ID,',
'       WFR_REPORT_ID,',
'       WFR_REPORT_DESC,',
'       WFR_CRE_BY,',
'       WFR_CRE_EMP_ID,',
'       WFR_CRE_IP_ADDR,',
'       WFR_CRE_OS_USER,',
'       WFR_CRE_DATE,',
'       WFR_UPD_BY,',
'       WFR_UPD_EMP_ID,',
'       WFR_UPD_IP_ADDR,',
'       WFR_UPD_OS_USER,',
'       WFR_UPD_DATE',
'  from WORK_FLOW_REPORTS',
'     WHERE WFR_BU =:GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Repotrs'
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
 p_id=>wwv_flow_imp.id(6549108906286617263)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549108963460617264)
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
 p_id=>wwv_flow_imp.id(6549108740250617262)
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
 p_id=>wwv_flow_imp.id(6549107419178617248)
,p_name=>'WFR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_BU'
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
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549107794947617252)
,p_name=>'WFR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549108214657617256)
,p_name=>'WFR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549107918825617253)
,p_name=>'WFR_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6549107959356617254)
,p_name=>'WFR_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549108115048617255)
,p_name=>'WFR_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6549107655713617251)
,p_name=>'WFR_REPORT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_REPORT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_imp.id(6549107584088617250)
,p_name=>'WFR_REPORT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_REPORT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(6549108256118617257)
,p_name=>'WFR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549108707925617261)
,p_name=>'WFR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6549108342488617258)
,p_name=>'WFR_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6549108449453617259)
,p_name=>'WFR_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6549108585500617260)
,p_name=>'WFR_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6549107477176617249)
,p_name=>'WFR_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_WF_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6549107269548617247)
,p_internal_uid=>1067145434005006219
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
 p_id=>wwv_flow_imp.id(6559826638071177996)
,p_interactive_grid_id=>wwv_flow_imp.id(6549107269548617247)
,p_static_id=>'10778649'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6559826859456177996)
,p_report_id=>wwv_flow_imp.id(6559826638071177996)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559827387637177998)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6549107419178617248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559828278237178004)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6549107477176617249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559829142251178009)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6549107584088617250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559830071833178012)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6549107655713617251)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559830954813178015)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6549107794947617252)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559831844827178018)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6549107918825617253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559832781381178024)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6549107959356617254)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559833713871178031)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6549108115048617255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559834541148178035)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6549108214657617256)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559835476183178042)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6549108256118617257)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559836370103178046)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6549108342488617258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559837275964178053)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6549108449453617259)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559838224652178060)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6549108585500617260)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559839123665178067)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6549108707925617261)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559840016816178073)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6549108740250617262)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6559840907282178078)
,p_view_id=>wwv_flow_imp.id(6559826859456177996)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6549108906286617263)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6549109159913617266)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6549109306550617267)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6524210064630168934)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6561268511374448629)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6549107155244617246)
,p_button_name=>'add'
,p_static_id=>'add-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6549109532442617269)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6524210064630168934)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6561269104322448635)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6549107155244617246)
,p_button_name=>'download'
,p_static_id=>'download-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6549109392540617268)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6524210064630168934)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6561268745656448632)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6549107155244617246)
,p_button_name=>'save'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511823314009608565)
,p_name=>'P66_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511821854325608551)
,p_name=>'P66_WFMFN_BENF_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'N'
,p_prompt=>'Required Benef. ID'
,p_source=>'WFMFN_BENF_ID_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511821715697608549)
,p_name=>'P66_WFMFN_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822239933608555)
,p_name=>'P66_WFMFN_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822610775608558)
,p_name=>'P66_WFMFN_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511823038493608563)
,p_name=>'P66_WFMFN_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822364828608556)
,p_name=>'P66_WFMFN_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822446048608557)
,p_name=>'P66_WFMFN_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822016214608552)
,p_name=>'P66_WFMFN_DOC_NO_REQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'N'
,p_prompt=>'Required Doc. No.'
,p_source=>'WFMFN_DOC_NO_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822699671608559)
,p_name=>'P66_WFMFN_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822981819608562)
,p_name=>'P66_WFMFN_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511823201879608564)
,p_name=>'P66_WFMFN_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822762859608560)
,p_name=>'P66_WFMFN_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822847052608561)
,p_name=>'P66_WFMFN_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822158715608554)
,p_name=>'P66_WFMFN_USER_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'N'
,p_prompt=>'Required User ID'
,p_source=>'WFMFN_USER_ID_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511821827663608550)
,p_name=>'P66_WFMFN_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_source=>'WFMFN_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511822093850608553)
,p_name=>'P66_WFMFN_WF_TYPE_NAME_REQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_source_plug_id=>wwv_flow_imp.id(6511821512372608547)
,p_item_default=>'N'
,p_prompt=>'Required Workflow Name'
,p_source=>'WFMFN_WF_TYPE_NAME_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6511823402677608566)
,p_validation_name=>'Required Benef. ID'
,p_static_id=>'required-benef-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :wfmfn_benf_id_req = ''Y'' THEN',
'	 ',
'	 IF :wfmfn_doc_no_req = ''Y'' OR :wfmfn_wf_type_name_req = ''Y'' OR :wfmfn_user_id_req = ''Y'' THEN',
'	 	 :wfmfn_benf_id_req := ''N'';',
'	 	  Return(''More than one required flag should not be allowed.'');',
'	 ',
'	 END IF;',
'	 ',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6511821854325608551)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6511823730235608569)
,p_validation_name=>'Required User ID validate'
,p_static_id=>'required-user-id-validate'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :wfmfn_user_id_req = ''Y'' THEN',
'	 ',
'	 IF :wfmfn_benf_id_req = ''Y'' OR :wfmfn_doc_no_req = ''Y'' OR',
'	 	  :wfmfn_wf_type_name_req = ''Y'' THEN',
'	 	  ',
'	 	  :wfmfn_user_id_req := ''N'';',
'	 	  Return(''More than one required flag should not be allowed.'');',
'	 ',
'	 END IF;',
'	 ',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6511822158715608554)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6511823618914608568)
,p_validation_name=>'Required Workflow Name validate'
,p_static_id=>'required-workflow-name-validate'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :wfmfn_doc_no_req = ''Y'' THEN',
'	 ',
'	 IF :wfmfn_benf_id_req = ''Y'' OR :wfmfn_wf_type_name_req = ''Y'' OR',
'       :wfmfn_user_id_req = ''Y'' THEN',
'	 	  ',
'	 	  :wfmfn_doc_no_req := ''N'';',
'	 	  Return(''More than one required flag should not be allowed.'');',
'	 ',
'	 END IF;',
'	 ',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6511822093850608553)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6511823491036608567)
,p_validation_name=>'WFMFN_DOC_NO_REQ validate'
,p_static_id=>'wfmfn-doc-no-req-validate'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :wfmfn_doc_no_req = ''Y'' THEN',
'	 ',
'	 IF :wfmfn_benf_id_req = ''Y'' OR :wfmfn_wf_type_name_req = ''Y'' OR :wfmfn_user_id_req = ''Y'' THEN',
'	 	 :wfmfn_doc_no_req := ''N'';',
'	 	  Return(''More than one required flag should not be allowed.'');',
'	 ',
'	 END IF;',
'	 ',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6511822016214608552)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6549109540564617270)
,p_name=>'ADD'
,p_static_id=>'add'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6549109306550617267)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6549109726769617271)
,p_event_id=>wwv_flow_imp.id(6549109540564617270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6561268621967448630)
,p_name=>'add'
,p_static_id=>'add-2'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6561268511374448629)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6561268697580448631)
,p_event_id=>wwv_flow_imp.id(6561268621967448630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6549110058920617275)
,p_name=>'download'
,p_static_id=>'download'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6549109532442617269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6549110195435617276)
,p_event_id=>wwv_flow_imp.id(6549110058920617275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6561269229512448636)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6561269104322448635)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6561269320020448637)
,p_event_id=>wwv_flow_imp.id(6561269229512448636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6524749769811846440)
,p_name=>'Position'
,p_static_id=>'position'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6524210064630168934)
,p_triggering_element=>'WFAD_ADMIN_POS_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6524749867155846441)
,p_event_id=>wwv_flow_imp.id(6524749769811846440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'POSITION_DESC,,EMPLOYEE_DESC,DEPT_DESC',
  'items_to_submit', 'WFAD_ADMIN_POS_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    'IF :WFAD_ADMIN_POS_ID IS NOT NULL THEN',
    '',
    '					proc_find_emp_details(:global_bu,',
    '                                     NULL,',
    '                                     :WFAD_ADMIN_POS_ID,',
    '                                     NULL,',
    '                                     :PLNT,',
    '                                     :EMPLOYEE_ID,',
    '                                     :EMPLOYEE_DESC,',
    '                                     :DEPT_ID,',
    '                                     :DEPT_DESC,',
    '                                     :DEPT_DESC,',
    '                                     :POSITION_DESC,',
    '                                     1',
    '                                        );',
    '',
    'END IF;',
    '',
    '',
    'end;',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6549110281363617277)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6524210064630168934)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6549110411032617278)
,p_event_id=>wwv_flow_imp.id(6549110281363617277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6524210064630168934)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6561269421603448638)
,p_name=>'refresh'
,p_static_id=>'refresh-2'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6549107155244617246)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6561269436409448639)
,p_event_id=>wwv_flow_imp.id(6561269421603448638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6549107155244617246)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6549109758494617272)
,p_name=>'save'
,p_static_id=>'save'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6549109392540617268)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6549109910896617273)
,p_event_id=>wwv_flow_imp.id(6549109758494617272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6561268853165448633)
,p_name=>'save1'
,p_static_id=>'save-2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6561268745656448632)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6561269017925448634)
,p_event_id=>wwv_flow_imp.id(6561268853165448633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6511821569717608548)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6511821512372608547)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Work flow'
,p_static_id=>'initialize-form-work-flow'
,p_internal_uid=>1029859734173997520
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6549109110305617265)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6549107155244617246)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Repotrs - Save Interactive Grid Data'
,p_static_id=>'repotrs-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1067147274762006237
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6524750457414846447)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6524210064630168934)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'seq no.'
,p_static_id=>'seq-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
' IF :APEX$ROW_STATUS = ''C'' THEN',
'',
' SELECT NVL(MAX(WFAD_SEQ_NO),0)+1',
'   INTO :WFAD_SEQ_NO',
'   FROM WF_ADMIN_DETAILS',
'  WHERE WFAD_BU = :GLOBAL_BU',
'    AND WFAD_BUS_PROC_ID=:WFAD_BUS_PROC_ID;',
'',
'	    INSERT INTO wf_admin_details (WFAD_BU,',
'                                     WFAD_SEQ_NO,',
'                                     WFAD_BUS_PROC_ID,',
'                                     WFAD_ADMIN_POS_ID,',
'								             WFAD_CRE_BY,',
'                                     WFAD_CRE_DATE)',
'						           VALUES (:global_BU,',
'                                    :WFAD_SEQ_NO,',
'                                    :WFAD_BUS_PROC_ID,',
'                                    :WFAD_ADMIN_POS_ID,',
'								            :global_user,',
'                                     sysdate);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN	',
'',
'           					update wf_admin_details set  wfad_seq_no       =:wfad_seq_no,',
'                                                     wfad_bus_proc_id  =:wfad_bus_proc_id,',
'                                                     wfad_admin_pos_id =:wfad_admin_pos_id,',
'                                                     wfad_upd_by       =:global_bu,',
'                                                     wfad_upd_date     = sysdate',
'													        where wfad_bu           =:global_user;',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN	',
'',
'       DELETE FROM wf_admin_details ',
'		 where wfad_bu =:global_user;',
'',
'',
'',
'',
'	  ',
'COMMIT;',
'END IF;',
' END;',
'',
'',
'								'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1042788621871235419
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6524227841712168962)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6524210064630168934)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Work flow - Save Interactive Grid Data'
,p_static_id=>'work-flow-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1042266006168557934
);
wwv_flow_imp.component_end;
end;
/
