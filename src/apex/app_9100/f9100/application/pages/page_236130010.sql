prompt --application/pages/page_236130010
begin
--   Manifest
--     PAGE: 236130010
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
 p_id=>236130010
,p_name=>'Work Flow'
,p_alias=>'WORK-FLOW3'
,p_step_title=>'Work Flow'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'a {',
'    color: #ed813e;',
'}',
'',
'',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'    color: rgba(0, 0, 0, 0.77);',
'    background-color: #ffffff;',
'    border-color: #1284cb;',
'    border-style: dashed;',
'}',
'',
'.t-Region-title {',
'    font-size: medium;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #dd360eed;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6581085121549880936)
,p_plug_name=>'Activities / Authorization'
,p_static_id=>'activities-authorization'
,p_parent_plug_id=>wwv_flow_imp.id(6581084955251880935)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(7624137381803706724)
,p_plug_name=>'Administrator'
,p_static_id=>'administrator'
,p_region_name=>'ig_line'
,p_parent_plug_id=>wwv_flow_imp.id(6581084955251880935)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
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
'WHERE WFAD_BU = :global_BU ',
'AND WFAD_BUS_PROC_ID = :WF_BUS_PROC_ID',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P236130010_WF_BUS_PROC_ID_DIS'
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
 p_id=>wwv_flow_imp.id(7624139221064706728)
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
 p_id=>wwv_flow_imp.id(7624138689008706727)
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
 p_id=>wwv_flow_imp.id(7661197805339986439)
,p_name=>'DEPT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dept. Name'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7661197721669986438)
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
 p_id=>wwv_flow_imp.id(7661197647046986437)
,p_name=>'EMPLOYEE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Employee Name'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7661197513869986436)
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
 p_id=>wwv_flow_imp.id(7661197947425986440)
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
 p_id=>wwv_flow_imp.id(7661197355821986435)
,p_name=>'POSITION_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSITION_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
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
 p_id=>wwv_flow_imp.id(7624140190398706728)
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
 p_id=>wwv_flow_imp.id(7624144167684706735)
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
,p_lov_cascade_parent_items=>'WFAD_BUS_PROC_ID'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7624141234906706733)
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
 p_id=>wwv_flow_imp.id(7624143165952706735)
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
 p_id=>wwv_flow_imp.id(7624145159579706736)
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
 p_id=>wwv_flow_imp.id(7624148185039706739)
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
 p_id=>wwv_flow_imp.id(7624153247360706746)
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
 p_id=>wwv_flow_imp.id(7624146157571706738)
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
 p_id=>wwv_flow_imp.id(7624147235573706739)
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
 p_id=>wwv_flow_imp.id(7624142243738706733)
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
 p_id=>wwv_flow_imp.id(7624149202644706741)
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
 p_id=>wwv_flow_imp.id(7624152206700706746)
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
 p_id=>wwv_flow_imp.id(7624154173654706747)
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
 p_id=>wwv_flow_imp.id(7624150203389706743)
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
 p_id=>wwv_flow_imp.id(7624151245615706744)
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
 p_id=>wwv_flow_imp.id(7624137945666706725)
,p_internal_uid=>2142176110123095697
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7624138308000706725)
,p_interactive_grid_id=>wwv_flow_imp.id(7624137945666706725)
,p_static_id=>'10422492'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7624138509040706727)
,p_report_id=>wwv_flow_imp.id(7624138308000706725)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963081645611036)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7624138689008706727)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624139616211706728)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7624139221064706728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624140573897706730)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7624140190398706728)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624141610178706733)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7624141234906706733)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624142565500706733)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7624142243738706733)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624143586152706735)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7624143165952706735)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624144601697706735)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7624144167684706735)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624145637484706738)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7624145159579706736)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624146640014706738)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7624146157571706738)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624147651174706739)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7624147235573706739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624148592377706741)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7624148185039706739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624149611902706741)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7624149202644706741)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624150572187706744)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7624150203389706743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624151587767706744)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7624151245615706744)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624152599106706746)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7624152206700706746)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624153652530706747)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7624153247360706746)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7624154626794706750)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7624154173654706747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662376973023630336)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7661197355821986435)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>222
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662379434543630344)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7661197513869986436)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662381770166630350)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7661197647046986437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662384165329630358)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7661197721669986438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662386596037630364)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7661197805339986439)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7662388981389630372)
,p_view_id=>wwv_flow_imp.id(7624138509040706727)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7661197947425986440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611760295561147764)
,p_plug_name=>'Mail File Name'
,p_static_id=>'mail-file-name'
,p_region_name=>'ig_line2'
,p_parent_plug_id=>wwv_flow_imp.id(6581084955251880935)
,p_region_template_options=>'#DEFAULT#:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
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
'  where WFMFN_BU = :global_BU ',
'  AND  WFMFN_WF_TYPE =:WF_BUS_PROC_ID'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P236130010_WF_BUS_PROC_ID_DIS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7649058192748158178)
,p_plug_name=>'Reports'
,p_static_id=>'reports'
,p_region_name=>'ig_line1'
,p_parent_plug_id=>wwv_flow_imp.id(6581084955251880935)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
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
'     WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :WF_BUS_PROC_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P236130010_WF_BUS_PROC_ID_DIS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Reports'
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
 p_id=>wwv_flow_imp.id(7649059943790158195)
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
 p_id=>wwv_flow_imp.id(7649060000964158196)
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
 p_id=>wwv_flow_imp.id(7649059777754158194)
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
 p_id=>wwv_flow_imp.id(7649058456682158180)
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
 p_id=>wwv_flow_imp.id(7649058832451158184)
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
 p_id=>wwv_flow_imp.id(7649059252161158188)
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
 p_id=>wwv_flow_imp.id(7649058956329158185)
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
 p_id=>wwv_flow_imp.id(7649058996860158186)
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
 p_id=>wwv_flow_imp.id(7649059152552158187)
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
 p_id=>wwv_flow_imp.id(7649058693217158183)
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
 p_id=>wwv_flow_imp.id(7649058621592158182)
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
 p_id=>wwv_flow_imp.id(7649059293622158189)
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
 p_id=>wwv_flow_imp.id(7649059745429158193)
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
 p_id=>wwv_flow_imp.id(7649059379992158190)
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
 p_id=>wwv_flow_imp.id(7649059486957158191)
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
 p_id=>wwv_flow_imp.id(7649059623004158192)
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
 p_id=>wwv_flow_imp.id(7649058514680158181)
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
 p_id=>wwv_flow_imp.id(7649058307052158179)
,p_internal_uid=>2167096471508547151
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
 p_id=>wwv_flow_imp.id(7659777675574718928)
,p_interactive_grid_id=>wwv_flow_imp.id(7649058307052158179)
,p_static_id=>'10778649'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7659777896959718928)
,p_report_id=>wwv_flow_imp.id(7659777675574718928)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963859155611046)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7649060000964158196)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659778425140718930)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7649058456682158180)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659779315740718936)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7649058514680158181)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659780179754718941)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7649058621592158182)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>502.297
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659781109336718944)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7649058693217158183)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>790.00025
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659781992316718947)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7649058832451158184)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659782882330718950)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7649058956329158185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659783818884718956)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7649058996860158186)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659784751374718963)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7649059152552158187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659785578651718967)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7649059252161158188)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659786513686718974)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7649059293622158189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659787407606718978)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7649059379992158190)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659788313467718985)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7649059486957158191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659789262155718992)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7649059623004158192)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659790161168718999)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7649059745429158193)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659791054319719005)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7649059777754158194)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7659791944785719010)
,p_view_id=>wwv_flow_imp.id(7659777896959718928)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7649059943790158195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43.31200000000001
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6581084358639880929)
,p_plug_name=>'Select List'
,p_static_id=>'select-list'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7570746831243894146)
,p_plug_name=>'<span id="WF_BUS_PROC_DESC"> Work Flow </span>'
,p_static_id=>'span-id-wf-bus-proc-desc-work-flow-span'
,p_region_name=>'Workflowsave'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WF_BU,',
'       WF_SEQ_NO,',
'       WF_BUS_PROC_ID,',
'       WF_BUS_PROC_DESC,',
'       WF_BUS_PROC_DESC2,',
'       WF_MAIL_FLAG,',
'       WF_INT_MSG_FLAG,',
'       WF_SMS_FLAG,',
'       WF_REPORT_ID,',
'       WF_CALL_FORM,',
'       WF_AUTH_TYPE,',
'       WF_BASIS,',
'       WF_APPL,',
'       WF_VAL_BASED_FLAG,',
'       WF_MODULE,',
'       WF_MOD_SEQ_NO,',
'       WF_CLS_BASED,',
'       WF_DISC_PCT_BASED_FLAG,',
'       WF_PRINT_SEQ_NO,',
'       WF_HIER_TYPE,',
'       WF_CRE_BY,',
'       WF_CRE_IP_ADDR,',
'       WF_CRE_OS_USER,',
'       WF_CRE_DATE,',
'       WF_UPD_BY,',
'       WF_UPD_IP_ADDR,',
'       WF_UPD_OS_USER,',
'       WF_UPD_DATE,',
'       WF_SELF_APPR_FLAG,',
'       WF_CRE_EMP_ID,',
'       WF_UPD_EMP_ID,',
'       WF_PROJ_BASED_FLAG,',
'       WF_APPR_BASIS,',
'       WF_VERT_TYPE,',
'       WF_MAIL_SEND_OPT,',
'       WF_SMS_SEND_OPT,',
'       WF_APEX_PAGE_NO,',
'       WF_APEX_APPL_NO',
'  from WORK_FLOW',
'  WHERE WF_BU=:GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<span id="WF_BUS_PROC_DESC"> Work Flow </span>'
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
 p_id=>wwv_flow_imp.id(7561275717575698929)
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
 p_id=>wwv_flow_imp.id(7561275835478698930)
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
 p_id=>wwv_flow_imp.id(7570748191860894149)
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
 p_id=>wwv_flow_imp.id(7570786207970894237)
,p_name=>'WF_APEX_APPL_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_APEX_APPL_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>410
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570785289748894235)
,p_name=>'WF_APEX_PAGE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_APEX_PAGE_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>400
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570761131265894185)
,p_name=>'WF_APPL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_APPL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570781267812894229)
,p_name=>'WF_APPR_BASIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_APPR_BASIS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Approval Basis'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Value;V,Class;C,Discount %;D,Project;P,Prefix;X,NA;N'
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
 p_id=>wwv_flow_imp.id(7570759171051894180)
,p_name=>'WF_AUTH_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_AUTH_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Auth. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Employee;E,Position;P'
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
 p_id=>wwv_flow_imp.id(7570760170835894182)
,p_name=>'WF_BASIS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_BASIS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Auth. Basis'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Entity;E,Unit;U'
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
 p_id=>wwv_flow_imp.id(7570749180185894157)
,p_name=>'WF_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570752157571894163)
,p_name=>'WF_BUS_PROC_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_BUS_PROC_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Work Flow Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570753101955894168)
,p_name=>'WF_BUS_PROC_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_BUS_PROC_DESC2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570751194817894160)
,p_name=>'WF_BUS_PROC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_BUS_PROC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Work Flow ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(7570758179857894179)
,p_name=>'WF_CALL_FORM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CALL_FORM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Call Form'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_imp.id(7570765373695894194)
,p_name=>'WF_CLS_BASED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CLS_BASED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570769275676894204)
,p_name=>'WF_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570772238553894210)
,p_name=>'WF_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570778201512894223)
,p_name=>'WF_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570770247419894205)
,p_name=>'WF_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570771260902894208)
,p_name=>'WF_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570766235288894196)
,p_name=>'WF_DISC_PCT_BASED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_DISC_PCT_BASED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570768244008894201)
,p_name=>'WF_HIER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_HIER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Hierarchical Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Emp. Hierarchy;E,Organization Chart;O,User Defined;U'
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
 p_id=>wwv_flow_imp.id(7570755187375894173)
,p_name=>'WF_INT_MSG_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_INT_MSG_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570754138765894169)
,p_name=>'WF_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570783198967894232)
,p_name=>'WF_MAIL_SEND_OPT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_MAIL_SEND_OPT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Mail Option'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:System;S,Manual;M'
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
 p_id=>wwv_flow_imp.id(7570763370004894191)
,p_name=>'WF_MODULE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_MODULE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Module'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(7570764379670894193)
,p_name=>'WF_MOD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_MOD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570767214259894199)
,p_name=>'WF_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_PRINT_SEQ_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570780248957894226)
,p_name=>'WF_PROJ_BASED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_PROJ_BASED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570757194069894176)
,p_name=>'WF_REPORT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_REPORT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570777265796894221)
,p_name=>'WF_SELF_APPR_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_SELF_APPR_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Self Approval'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570750124423894158)
,p_name=>'WF_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7570756191936894174)
,p_name=>'WF_SMS_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_SMS_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570784244785894233)
,p_name=>'WF_SMS_SEND_OPT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_SMS_SEND_OPT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>390
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570773207501894213)
,p_name=>'WF_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570776290697894219)
,p_name=>'WF_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570779275811894224)
,p_name=>'WF_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570774227335894216)
,p_name=>'WF_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570775241970894218)
,p_name=>'WF_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570762330007894187)
,p_name=>'WF_VAL_BASED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_VAL_BASED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7570782238881894230)
,p_name=>'WF_VERT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WF_VERT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Std./Vert. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Standard;STD,Vertical;VET'
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
,p_default_expression=>'STD'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7570747322109894148)
,p_internal_uid=>2088785486566283120
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7570747728142894148)
,p_interactive_grid_id=>wwv_flow_imp.id(7570747322109894148)
,p_static_id=>'10417830'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>5
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7570747938613894148)
,p_report_id=>wwv_flow_imp.id(7570747728142894148)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6528979080737575151)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7561275717575698929)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6529036777836631439)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(7561275835478698930)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570748585327894151)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7570748191860894149)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570749573082894157)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7570749180185894157)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570750533175894158)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7570750124423894158)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570751574498894160)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7570751194817894160)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570752520077894166)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7570752157571894163)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>329
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570753545952894169)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7570753101955894168)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570754529065894171)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7570754138765894169)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570755532111894173)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7570755187375894173)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570756510876894176)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7570756191936894174)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570757526088894177)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7570757194069894176)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570758520730894179)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7570758179857894179)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570759583725894182)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7570759171051894180)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570760587313894183)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7570760170835894182)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570761661404894185)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7570761131265894185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570762775352894187)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7570762330007894187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570763769524894191)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7570763370004894191)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570764767403894194)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7570764379670894193)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570765690074894196)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7570765373695894194)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570766655257894198)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7570766235288894196)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570767654951894199)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7570767214259894199)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570768669385894202)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7570768244008894201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570769612581894204)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7570769275676894204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570770666022894205)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7570770247419894205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570771618642894210)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7570771260902894208)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570772664988894212)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7570772238553894210)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570773637994894215)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7570773207501894213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570774620319894216)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7570774227335894216)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570775664912894218)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7570775241970894218)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570776674684894219)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(7570776290697894219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570777625435894221)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(7570777265796894221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570778668624894224)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(7570778201512894223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570779686014894226)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(7570779275811894224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570780618271894227)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(7570780248957894226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570781630201894229)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(7570781267812894229)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570782664540894230)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(7570782238881894230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570783650603894232)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(7570783198967894232)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570784640904894233)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(7570784244785894233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570785651578894237)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(7570785289748894235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7570786612430894238)
,p_view_id=>wwv_flow_imp.id(7570747938613894148)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(7570786207970894237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8723463517304960097)
,p_plug_name=>'<span id="WF_BUS_PROC_ID"> Activities </span>'
,p_static_id=>'span-id-wf-bus-proc-id-activities-span'
,p_region_name=>'act'
,p_parent_plug_id=>wwv_flow_imp.id(6581085121549880936)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAA_BU,',
'       WFAA_WF_ID,',
'       WFAA_SEQ_NO,',
'       WFAA_DESC,',
'       WFAA_STATUS,',
'       WFAA_STATUS_DESC,',
'       WFAA_HOUR,',
'       WFAA_STATUS_DESC2,',
'       WFAA_PRINT_SEQ_NO,',
'       WFAA_MSG_TO,',
'       WFAA_HIER_TYPE,',
'       WFAA_CRE_BY,',
'       WFAA_CRE_IP_ADDR,',
'       WFAA_CRE_OS_USER,',
'       WFAA_CRE_DATE,',
'       WFAA_UPD_BY,',
'       WFAA_UPD_IP_ADDR,',
'       WFAA_UPD_OS_USER,',
'       WFAA_UPD_DATE,',
'       WFAA_CRE_EMP_ID,',
'       WFAA_UPD_EMP_ID,',
'       WFAA_IM_FLAG,',
'       WFAA_MAIL_FLAG,',
'       WFAA_SMS_FLAG,',
'       WFAA_SMS_TEMPLATE_ID,',
'		 /* (SELECT rowid ',
'          FROM wf_internal_message',
'         WHERE wfim_bu     = WFAA_BU',
'           AND wfim_type   = WFAA_WF_ID ',
'           AND wfim_seq_no = wfaa_seq_no ) IM_ROWID,',
'		 (SELECT rowid ',
'          FROM wf_mail_message',
'         WHERE wfmm_bu     = WFAA_BU  ',
'           AND wfmm_type   = WFAA_WF_ID',
'           AND wfaa_seq_no = wfaa_seq_no ) MM_ROWID,',
'		 (SELECT rowid',
'          FROM wf_return_message',
'         WHERE wfrm_bu     = WFAA_BU ',
'           AND wfrm_type   = WFAA_WF_ID',
'           AND wfrm_seq_no = wfaa_seq_no) RM_ROWID,',
'		  (SELECT rowid ',
'           FROM wf_forward_message',
'          WHERE wffm_bu     = WFAA_BU ',
'            AND wffm_type   = WFAA_WF_ID',
'            AND wffm_seq_no = wfaa_seq_no )FM_ROWID,	',
'			(SELECT rowid ',
'				FROM work_flow_notify_persons  ',
'		     WHERE wfnp_bu     = WFAA_BU ',
'				 AND wfnp_wf_id  = WFAA_WF_ID',
'				 AND wfnp_seq_no = wfaa_seq_no)np_rowid,	   */',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">I</span>'' I ,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">M</span>'' M,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">R</span>'' R, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">F</span>'' F, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">NP</span>''NP,',
'		 ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' delete_act',
'  from WORK_FLOW_APPR_ACTVT',
'/*  where WFAA_BU =:Global_bu',
'   and WFAA_WF_ID = :P236130010_WF_BUS_PROC_ID */',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(7570746831243894146)
,p_ajax_items_to_submit=>'P236130010_WF_BUS_PROC_ID_DIS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<span id="WF_BUS_PROC_ID"> Activities </span>'
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
 p_id=>wwv_flow_imp.id(8723465408420960103)
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
 p_id=>wwv_flow_imp.id(8723464829629960102)
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
 p_id=>wwv_flow_imp.id(7025456687394319153)
,p_name=>'DELETE_ACT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE_ACT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P236130010_WFAA_WF_ID'',''&WFAA_WF_ID.''),$s(''P236130010_WFAA_SEQ_NO'',''&WFAA_SEQ_NO.'');apex.submit(''DELETE_ACT'');'
,p_link_text=>'&DELETE_ACT.'
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
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731105186793607220)
,p_name=>'F'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'F'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFFM_TYPE,P2361300101_WFFM_SEQ_NO,P2361300101_ROWID_FF:FM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&FM_ROWID.'
,p_link_text=>'&F.'
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
 p_id=>wwv_flow_imp.id(8731104832736607217)
,p_name=>'I'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'I'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_WFIM_TYPE,P2361300101_WFIM_SEQ_NO,P2361300101_ROWID,P2361300101_TYPE:&WFAA_WF_ID.,&WFAA_SEQ_NO.,&IM_ROWID.,IM'
,p_link_text=>'&I.'
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
 p_id=>wwv_flow_imp.id(8731104936180607218)
,p_name=>'M'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'M'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFMM_TYPE,P2361300101_WFMM_SEQ_NO,P2361300101_ROWID_MM:MM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&MM_ROWID.'
,p_link_text=>'&M.'
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
 p_id=>wwv_flow_imp.id(8731105297061607221)
,p_name=>'NP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFNP_WF_ID,P2361300101_WFNP_SEQ_NO,P2361300101_ROWID_NP:NP,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&NP_ROWID.'
,p_link_text=>'&NP.'
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
 p_id=>wwv_flow_imp.id(8731105106516607219)
,p_name=>'R'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'R'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFRM_TYPE,P2361300101_WFRM_SEQ_NO,P2361300101_ROWID_RM:RM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&RM_ROWID.'
,p_link_text=>'&R.'
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
 p_id=>wwv_flow_imp.id(8723466390578960105)
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
 p_id=>wwv_flow_imp.id(8723467323468960109)
,p_name=>'WFAA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFAA_BU'
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
,p_parent_column_id=>wwv_flow_imp.id(7570749180185894157)
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723478409548960131)
,p_name=>'WFAA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_BY'
,p_data_type=>'VARCHAR2'
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
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723481405918960136)
,p_name=>'WFAA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723486336272960142)
,p_name=>'WFAA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(8723479349521960133)
,p_name=>'WFAA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(8723480408490960134)
,p_name=>'WFAA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(8723470349740960116)
,p_name=>'WFAA_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Process Desc.'
,p_heading_alignment=>'CENTER'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723477316159960130)
,p_name=>'WFAA_HIER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HIER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Hierarchical Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Emp. Hierarchy;E,Organization Chart ;O,User Defined;U'
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
,p_default_expression=>'E'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723473354944960122)
,p_name=>'WFAA_HOUR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HOUR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hours'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723488324457960153)
,p_name=>'WFAA_IM_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_IM_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'IM'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723489333326960155)
,p_name=>'WFAA_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723476386719960128)
,p_name=>'WFAA_MSG_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MSG_TO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Notify To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Creator;C,Receiver;R,All;A'
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
,p_default_expression=>'A'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723475371394960127)
,p_name=>'WFAA_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_PRINT_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(8723469320524960114)
,p_name=>'WFAA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SEQ_NO'
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
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(8723490320378960156)
,p_name=>'WFAA_SMS_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'SMS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723491392459960159)
,p_name=>'WFAA_SMS_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_TEMPLATE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'SMS Template ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'SMS Template')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT satc_template_id,',
'       satc_template_id b',
'  FROM sms_api_template_config,',
'       sms_api_param_config',
' WHERE satc_template_id = sapc_template_no',
'   AND sapc_bu = :GLOBAL_bu',
'   AND sapc_wf_type = :P236130010_WF_BUS_PROC_ID'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
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
 p_id=>wwv_flow_imp.id(8723471343984960117)
,p_name=>'WFAA_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2
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
 p_id=>wwv_flow_imp.id(8723472342870960120)
,p_name=>'WFAA_STATUS_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723474337377960123)
,p_name=>'WFAA_STATUS_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC2'
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
 p_id=>wwv_flow_imp.id(8723482316679960136)
,p_name=>'WFAA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723485390417960141)
,p_name=>'WFAA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723487385574960152)
,p_name=>'WFAA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723483385978960138)
,p_name=>'WFAA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8723484345359960139)
,p_name=>'WFAA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(8723468333814960111)
,p_name=>'WFAA_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_WF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFAA_WF_ID'
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
,p_parent_column_id=>wwv_flow_imp.id(7570751194817894160)
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8723464019692960100)
,p_internal_uid=>3241502184149349072
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
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8723464457329960102)
,p_interactive_grid_id=>wwv_flow_imp.id(8723464019692960100)
,p_static_id=>'10418643'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8723464640166960102)
,p_report_id=>wwv_flow_imp.id(8723464457329960102)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5486060464756225809)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(7025456687394319153)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7681601403415552523)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(8723464829629960102)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723465799940960103)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(8723465408420960103)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723466757022960105)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8723466390578960105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723467796366960111)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8723467323468960109)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723468753314960113)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8723468333814960111)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723469730213960114)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8723469320524960114)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>44.9943
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723470738473960116)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8723470349740960116)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111.3438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723471717513960117)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8723471343984960117)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723472716905960120)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8723472342870960120)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723473729360960123)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8723473354944960122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>54.9943
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723474719347960125)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8723474337377960123)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723475757757960127)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8723475371394960127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723476805391960128)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8723476386719960128)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723477767902960130)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8723477316159960130)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723478767282960131)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8723478409548960131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723479770660960133)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8723479349521960133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723480781279960134)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8723480408490960134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723481780358960136)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8723481405918960136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723482765775960138)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8723482316679960136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723483767830960138)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8723483385978960138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723484784556960141)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8723484345359960139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723485751136960142)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8723485390417960141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723486787239960150)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8723486336272960142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723487783411960153)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8723487385574960152)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723488745030960155)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8723488324457960153)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723489784867960155)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8723489333326960155)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>52
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723490788029960158)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8723490320378960156)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>47
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8723491789117960159)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8723491392459960159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161.991
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731500095569822786)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(8731104832736607217)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731500927931822791)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(8731104936180607218)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731501827991822797)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(8731105106516607219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731502734039822803)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(8731105186793607220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731503547699822808)
,p_view_id=>wwv_flow_imp.id(8723464640166960102)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(8731105297061607221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6581084955251880935)
,p_plug_name=>'Tab'
,p_static_id=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8731122533542609428)
,p_plug_name=>'Workflow_Auth'
,p_static_id=>'workflow-auth'
,p_region_name=>'auth'
,p_parent_plug_id=>wwv_flow_imp.id(6581085121549880936)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFDA_BU,',
'       WFDA_TYPE,',
'       WFDA_POSITION,',
'       WFDA_DATE_FROM,',
'       WFDA_DATE_TO,',
'       WFDA_SEQ_NO,',
'       WFDA_VALUE,',
'       WFDA_AOD_FLAG,',
'       WFDA_MOBILE_NO,',
'       WFDA_PLNT,',
'       WFDA_SUB_SEQ_NO,',
'       WFDA_APPR_BU,',
'       WFDA_DISC_PCT,',
'       WFDA_DFLT_FLAG,',
'       WFDA_CRE_BY,',
'       WFDA_CRE_IP_ADDR,',
'       WFDA_CRE_OS_USER,',
'       WFDA_CRE_DATE,',
'       WFDA_UPD_BY,',
'       WFDA_UPD_IP_ADDR,',
'       WFDA_UPD_OS_USER,',
'       WFDA_UPD_DATE,',
'       WFDA_CRE_EMP_ID,',
'       WFDA_UPD_EMP_ID,',
'       WFDA_MAIL_OPT_FLAG,',
'       WFDA_SENDER_MAIL,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">Pfx.</span>'' pfx, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">CS</span>''cs, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">RL</span>''rl,',
'		 ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' delete_dir_auth',
'  from WF_DIRECT_AUTHORIZATION',
' /* where WFDA_BU = :Global_bu',
'	and wfda_type = :P236130010_WF_TYPE   ',
'	and wfda_seq_no = :P236130010_SEQ_NO */'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Workflow_Auth'
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
 p_id=>wwv_flow_imp.id(8731126489139609467)
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
 p_id=>wwv_flow_imp.id(8731126555759609468)
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
 p_id=>wwv_flow_imp.id(8731925026647966642)
,p_name=>'CS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:SC,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'&CS.'
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
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7025457064075319157)
,p_name=>'DELETE_DIR_AUTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE_DIR_AUTH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P236130010_WFDA_TYPE'',''&WFDA_TYPE.''),$s(''P236130010_WFDA_SEQ_NO'',''&WFDA_SEQ_NO.''),$s(''P236130010_WFDA_SUB_SEQ_NO'',''&WFDA_SUB_SEQ_NO.'');apex.submit(''DELETE_DIR_AUTH'');'
,p_link_text=>'&DELETE_DIR_AUTH.'
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
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731925014032966641)
,p_name=>'PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:PFX,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'&PFX.'
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
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731925202982966643)
,p_name=>'RL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:ROLE,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'&RL.'
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
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731125362055609456)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731123520485609437)
,p_name=>'WFDA_AOD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_AOD_FLAG'
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
 p_id=>wwv_flow_imp.id(8731123922144609441)
,p_name=>'WFDA_APPR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_APPR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Entity')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581793269360069601)
,p_lov_display_extra=>false
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731122807416609430)
,p_name=>'WFDA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_BU'
,p_heading_alignment=>'LEFT'
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
,p_parent_column_id=>wwv_flow_imp.id(8723467323468960109)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124175039609444)
,p_name=>'WFDA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_BY'
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
 p_id=>wwv_flow_imp.id(8731124496807609447)
,p_name=>'WFDA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124932994609452)
,p_name=>'WFDA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124239544609445)
,p_name=>'WFDA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124365210609446)
,p_name=>'WFDA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(8731123103870609433)
,p_name=>'WFDA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'From'
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
,p_format_mask=>'DD-MON-YYYY'
,p_is_required=>false
,p_max_length=>9
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
 p_id=>wwv_flow_imp.id(8731123176850609434)
,p_name=>'WFDA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_imp.id(8731124072223609443)
,p_name=>'WFDA_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124000132609442)
,p_name=>'WFDA_DISC_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DISC_PCT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Disc. Pct.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(8731125137161609454)
,p_name=>'WFDA_MAIL_OPT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MAIL_OPT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731123607120609438)
,p_name=>'WFDA_MOBILE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MOBILE_NO'
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
 p_id=>wwv_flow_imp.id(8731123626524609439)
,p_name=>'WFDA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
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
  'title', 'Select Unit')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  bup_name1,bup_plant_id',
'   FROM  business_units,',
'             bus_unit_plants,',
'             appl_users,',
'             appl_user_plant_access',
' WHERE bup_bu = bu_id',
'     AND bup_bu = appluser_bu',
'     AND bup_bu = auba_bu',
'     AND bup_plant_id = auba_plant',
'     AND auba_user_id = appluser_id',
'     AND bup_bu = :global_bu ---:wfda_appr_bu',
'     AND appluser_status = ''A''',
'     AND TRUNC(SYSDATE) BETWEEN TRUNC(appluser_eff_From) AND TRUNC(appluser_eff_to) ',
'     AND TRUNC(SYSDATE) BETWEEN auba_from AND auba_to',
' GROUP BY bup_plant_id,bup_name1',
'ORDER BY bup_name1 ASC'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'WFDA_APPR_BU'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731122935896609432)
,p_name=>'WFDA_POSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_POSITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp. / Pos.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee / Position',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581794790389069604)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'WFDA_APPR_BU,WFDA_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731125278597609455)
,p_name=>'WFDA_SENDER_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SENDER_MAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sender Mail'
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
 p_id=>wwv_flow_imp.id(8731123313968609435)
,p_name=>'WFDA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_SEQ_NO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(8723469320524960114)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731123756181609440)
,p_name=>'WFDA_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(8731122865718609431)
,p_name=>'WFDA_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_TYPE'
,p_heading_alignment=>'LEFT'
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
,p_parent_column_id=>wwv_flow_imp.id(8723468333814960111)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124533972609448)
,p_name=>'WFDA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_BY'
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
 p_id=>wwv_flow_imp.id(8731124872229609451)
,p_name=>'WFDA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731125102603609453)
,p_name=>'WFDA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124693459609449)
,p_name=>'WFDA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731124766894609450)
,p_name=>'WFDA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8731123391228609436)
,p_name=>'WFDA_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_VALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8731122635916609429)
,p_internal_uid=>3249160800372998401
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
 p_id=>wwv_flow_imp.id(8731670299835876365)
,p_interactive_grid_id=>wwv_flow_imp.id(8731122635916609429)
,p_static_id=>'10500529'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8731670517939876365)
,p_report_id=>wwv_flow_imp.id(8731670299835876365)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482056357430790879)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(7025457064075319157)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7681623051461554730)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(8731126555759609468)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731670977040876367)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8731122807416609430)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731671838994876370)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8731122865718609431)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731672729141876373)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8731122935896609432)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731673682518876376)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8731123103870609433)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731674557748876379)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8731123176850609434)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731675471251876383)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8731123313968609435)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731676381543876386)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8731123391228609436)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156.972
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731677307749876389)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8731123520485609437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731678127714876392)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8731123607120609438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731679104575876401)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8731123626524609439)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57.9972
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731679964257876404)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8731123756181609440)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46.988600000000005
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731680821774876411)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8731123922144609441)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731681638824876415)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8731124000132609442)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731682592172876417)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8731124072223609443)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61.99720000000001
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731683499455876420)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8731124175039609444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731684383949876423)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8731124239544609445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731685270003876426)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8731124365210609446)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731686126312876429)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8731124496807609447)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731687083664876433)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8731124533972609448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731687956393876436)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8731124693459609449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731688924284876439)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8731124766894609450)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731689729945876440)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8731124872229609451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731690685242876444)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8731124932994609452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731691579317876447)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8731125102603609453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731692477370876450)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8731125137161609454)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731693341198876453)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8731125278597609455)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126.989
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731694271312876456)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8731125362055609456)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8731906566683962839)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(8731126489139609467)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8734005329308383008)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(8731925014032966641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8734006755694383014)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(8731925026647966642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8734008153045383020)
,p_view_id=>wwv_flow_imp.id(8731670517939876365)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(8731925202982966643)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>47.44363983154297
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581899394657148837)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7624137381803706724)
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
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581920643158151974)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7649058192748158178)
,p_button_name=>'add'
,p_static_id=>'add-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581825327176094067)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_button_name=>'Add_act'
,p_static_id=>'add-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581845015291096271)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_button_name=>'add_auth'
,p_static_id=>'add-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581826109728094067)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_button_name=>'down_act'
,p_static_id=>'down-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581844615464096271)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_button_name=>'down_auth'
,p_static_id=>'down-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6528984812938544253)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7570746831243894146)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581900193295148838)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7624137381803706724)
,p_button_name=>'Download'
,p_static_id=>'download-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581921494618151974)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7649058192748158178)
,p_button_name=>'download'
,p_static_id=>'download-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6528986783692544265)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7570746831243894146)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6596353864109369253)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_button_name=>'save3'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save3'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581899744405148837)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7624137381803706724)
,p_button_name=>'Save'
,p_static_id=>'save-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581921118572151974)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7649058192748158178)
,p_button_name=>'save'
,p_static_id=>'save-4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581825644902094067)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_button_name=>'save_act'
,p_static_id=>'save-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581844205618096270)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_button_name=>'save_auth'
,p_static_id=>'save-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6581084677187880932)
,p_branch_name=>'Go To Page 2361300105(Emp.H)'
,p_branch_action=>'f?p=&APP_ID.:2361300105:&SESSION.::&DEBUG.::P2361300105_FILTER:EH&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P236130010__FILTER'
,p_branch_condition_text=>'EH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581907233585150263)
,p_name=>'P236130010_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7025457524092319161)
,p_name=>'P236130010_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7025456909618319155)
,p_name=>'P236130010_WFAA_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7025456799422319154)
,p_name=>'P236130010_WFAA_WF_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581845829282096273)
,p_name=>'P236130010_WFDA_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7025457174337319158)
,p_name=>'P236130010_WFDA_SUB_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581845346481096271)
,p_name=>'P236130010_WFDA_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581901695735150249)
,p_name=>'P236130010_WFMFN_BENF_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581900870511150248)
,p_name=>'P236130010_WFMFN_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581903172555150256)
,p_name=>'P236130010_WFMFN_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581904435184150259)
,p_name=>'P236130010_WFMFN_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581906379315150260)
,p_name=>'P236130010_WFMFN_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581903541516150256)
,p_name=>'P236130010_WFMFN_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581903992750150257)
,p_name=>'P236130010_WFMFN_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581902047473150249)
,p_name=>'P236130010_WFMFN_DOC_NO_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_default=>'N'
,p_prompt=>'Required Doc. No.'
,p_source=>'WFMFN_DOC_NO_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581904816384150259)
,p_name=>'P236130010_WFMFN_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581906028211150260)
,p_name=>'P236130010_WFMFN_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
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
 p_id=>wwv_flow_imp.id(6581906777257150260)
,p_name=>'P236130010_WFMFN_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581905211312150259)
,p_name=>'P236130010_WFMFN_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581905611992150259)
,p_name=>'P236130010_WFMFN_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581902783929150256)
,p_name=>'P236130010_WFMFN_USER_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_default=>'N'
,p_prompt=>'Required User ID'
,p_source=>'WFMFN_USER_ID_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581901293619150249)
,p_name=>'P236130010_WFMFN_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_source=>'WFMFN_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581902496193150249)
,p_name=>'P236130010_WFMFN_WF_TYPE_NAME_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_source_plug_id=>wwv_flow_imp.id(7611760295561147764)
,p_item_default=>'N'
,p_prompt=>'Required Workflow Name'
,p_source=>'WFMFN_WF_TYPE_NAME_REQ'
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
 p_id=>wwv_flow_imp.id(7170291931564952241)
,p_name=>'P236130010_WF_AUTH_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7570746831243894146)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5827266965553616748)
,p_name=>'P236130010_WF_BUS_PROC_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7570746831243894146)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581826474775094068)
,p_name=>'P236130010_WF_BUS_PROC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8723463517304960097)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5827266908483616747)
,p_name=>'P236130010_WF_BUS_PROC_ID_DIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7570746831243894146)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7025457358248319160)
,p_name=>'P236130010_WF_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8731122533542609428)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581084530804880930)
,p_name=>'P236130010__FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6581084358639880929)
,p_item_default=>'WF'
,p_prompt=>'Filter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Work Flow;WF,Employee Hierarchy;EH'
,p_cHeight=>1
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6596353510634369249)
,p_validation_name=>'benifit id'
,p_static_id=>'benifit-id'
,p_validation_sequence=>50
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
,p_associated_item=>wwv_flow_imp.id(6581901695735150249)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7168877218730422864)
,p_tabular_form_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_validation_name=>'hrs'
,p_static_id=>'hrs'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :wfaa_hour IS NULL THEN',
'	return(''Hour must be entered.'');',
'END IF;',
'',
'IF :wfaa_hour < 0 THEN',
'	 return(''Hour should be greater than zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFAA_HOUR'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7158102267148306460)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'no negative'
,p_static_id=>'no-negative'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF to_number(:WFDA_VALUE) < 0  THEN ',
'return(''Negative values not allowed.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6596353803704369252)
,p_validation_name=>'Required User ID validate'
,p_static_id=>'required-user-id-validate'
,p_validation_sequence=>80
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
,p_associated_item=>wwv_flow_imp.id(6581902783929150256)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6596353716950369251)
,p_validation_name=>'Required Workflow Name validate'
,p_static_id=>'required-workflow-name-validate'
,p_validation_sequence=>70
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
,p_associated_item=>wwv_flow_imp.id(6581902496193150249)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581826950326094073)
,p_tabular_form_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_validation_name=>'WFAA_STATUS'
,p_static_id=>'wfaa-status'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFAA_STATUS IS NULL THEN',
'   Return(''Status must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFAA_STATUS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581846309034096273)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'WFDA_APPR_BU'
,p_static_id=>'wfda-appr-bu'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_APPR_BU IS NULL THEN',
'   Return(''Entity must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_APPR_BU'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581847042544096274)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'WFDA_DATE_FROM'
,p_static_id=>'wfda-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:WFDA_DATE_FROM) IS NULL THEN',
'   Return(''From Date must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7170292706287952249)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'WFDA_DATE_TO'
,p_static_id=>'wfda-date-to'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:WFDA_DATE_TO)  < TO_DATE(:WFDA_DATE_FROM)  THEN',
'   Return(''To Date Should not be Lesser than From Date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5772816028845257272)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'WFDA_PLNT'
,p_static_id=>'wfda-plnt'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  ',
'  CURSOR C1 ',
'     IS    ',
'    SELECT WF_BASIS',
'     from WORK_FLOW ',
'     WHERE WF_BU   =  :GLOBAL_BU ',
'     AND WF_BUS_PROC_ID = :WFDA_TYPE ',
'     AND WF_BASIS =  ''U'';',
'',
'    CR1   C1%ROWTYPE;',
'',
'BEGIN',
'    OPEN  C1;',
'    FETCH  C1 INTO CR1;',
'    Return(''Unit must be entered'');',
'    IF CR1.WF_BASIS  =  ''U''  THEN',
'	   IF :WFDA_PLNT IS NULL THEN',
'		   Return(''Unit must be entered'');',
'	   END IF;',
'   END IF;',
'',
'   CLOSE C1;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_associated_column=>'WFDA_PLNT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581846673877096274)
,p_tabular_form_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_validation_name=>'WFDA_POSITION'
,p_static_id=>'wfda-position'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_POSITION IS NULL THEN',
'    Return(''Employee / Position must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_POSITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6596353555524369250)
,p_validation_name=>'WFMFN_DOC_NO_REQ validate'
,p_static_id=>'wfmfn-doc-no-req-validate'
,p_validation_sequence=>60
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
,p_associated_item=>wwv_flow_imp.id(6581902047473150249)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596351807180369232)
,p_name=>'add'
,p_static_id=>'add'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581899394657148837)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596351907492369233)
,p_event_id=>wwv_flow_imp.id(6596351807180369232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596352344108369238)
,p_name=>'add1'
,p_static_id=>'add-2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581920643158151974)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596352508225369239)
,p_event_id=>wwv_flow_imp.id(6596352344108369238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607191239503966355)
,p_name=>'ADD_ACT'
,p_static_id=>'add-act'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581825327176094067)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607191398950966356)
,p_event_id=>wwv_flow_imp.id(6607191239503966355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607191984438966362)
,p_name=>'add_auth'
,p_static_id=>'add-auth'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581845015291096271)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607192045511966363)
,p_event_id=>wwv_flow_imp.id(6607191984438966362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596351622208369230)
,p_name=>'Admin position'
,p_static_id=>'admin-position'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7624137381803706724)
,p_triggering_element=>'WFAD_ADMIN_POS_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596351708446369231)
,p_event_id=>wwv_flow_imp.id(6596351622208369230)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'POSITION_DESC,EMPLOYEE_DESC,DEPT_DESC',
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
 p_id=>wwv_flow_imp.id(6614981658265441366)
,p_name=>'auth'
,p_static_id=>'auth'
,p_event_sequence=>190
,p_condition_element=>'P236130010_WF_AUTH_TYPE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6614981758795441367)
,p_event_id=>wwv_flow_imp.id(6614981658265441366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596352773084369242)
,p_name=>'down'
,p_static_id=>'down'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581921494618151974)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596352924789369243)
,p_event_id=>wwv_flow_imp.id(6596352773084369242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607191741273966360)
,p_name=>'Down_act'
,p_static_id=>'down-act'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581826109728094067)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607191871086966361)
,p_event_id=>wwv_flow_imp.id(6607191741273966360)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607192370574966366)
,p_name=>'down_auth'
,p_static_id=>'down-auth'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581844615464096271)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607192464844966367)
,p_event_id=>wwv_flow_imp.id(6607192370574966366)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6528988526859544267)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6528984812938544253)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6528989029498544268)
,p_event_id=>wwv_flow_imp.id(6528988526859544267)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "Workflowsave" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596352196923369236)
,p_name=>'download'
,p_static_id=>'download-2'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581900193295148838)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596352312422369237)
,p_event_id=>wwv_flow_imp.id(6596352196923369236)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5827266723496616745)
,p_name=>'Drilldown Heading'
,p_static_id=>'drilldown-heading'
,p_event_sequence=>220
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7570746831243894146)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5827266751914616746)
,p_event_id=>wwv_flow_imp.id(5827266723496616745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Get Seq*/',
    'var i, i_empids, i_empid,',
    'model = this.data.model;',
    '',
    'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {',
    '    i_empids = model.getValue( this.data.selectedRecords[i], "WF_BUS_PROC_ID") ;',
    '	 i_empid = model.getValue( this.data.selectedRecords[i], "WF_BUS_PROC_DESC") ;',
    '}',
    '',
    'apex.item( "P236130010_WF_BUS_PROC_DESC" ).setValue (i_empids);',
    'apex.item( "P236130010_WF_BUS_PROC_ID_DIS" ).setValue (i_empid);',
    '',
    '$x(''WF_BUS_PROC_DESC'').innerHTML =$x(''P236130010_WF_BUS_PROC_ID_DIS'').value;')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5827267057613616749)
,p_event_id=>wwv_flow_imp.id(5827266723496616745)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7570746831243894146)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596352991069369244)
,p_name=>'refresh'
,p_static_id=>'refresh'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7649058192748158178)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596353079330369245)
,p_event_id=>wwv_flow_imp.id(6596352991069369244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7649058192748158178)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596353221620369246)
,p_name=>'refresh1'
,p_static_id=>'refresh-2'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7624137381803706724)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596353271726369247)
,p_event_id=>wwv_flow_imp.id(6596353221620369246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7624137381803706724)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7170291957697952242)
,p_name=>'Refresh'
,p_static_id=>'refresh-3'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7170292099828952243)
,p_event_id=>wwv_flow_imp.id(7170291957697952242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6528987539411544267)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6528986783692544265)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6528988056658544267)
,p_event_id=>wwv_flow_imp.id(6528987539411544267)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "Workflowsave" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596351966916369234)
,p_name=>'save'
,p_static_id=>'save-2'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581899744405148837)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596352121504369235)
,p_event_id=>wwv_flow_imp.id(6596351966916369234)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596352571701369240)
,p_name=>'save1'
,p_static_id=>'save-3'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581921118572151974)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596352664842369241)
,p_event_id=>wwv_flow_imp.id(6596352571701369240)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6596353959036369254)
,p_name=>'save3'
,p_static_id=>'save-4'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6596353864109369253)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6596354107914369255)
,p_event_id=>wwv_flow_imp.id(6596353959036369254)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line2" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607191601574966358)
,p_name=>'SAVE_ACT'
,p_static_id=>'save-act'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581825644902094067)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607191648835966359)
,p_event_id=>wwv_flow_imp.id(6607191601574966358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6607192152014966364)
,p_name=>'save_auth'
,p_static_id=>'save-auth'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581844205618096270)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6607192304207966365)
,p_event_id=>wwv_flow_imp.id(6607192152014966364)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7170292152785952244)
,p_name=>'Workflow_Auth Refresh'
,p_static_id=>'workflow-auth-refresh'
,p_event_sequence=>210
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7170292321179952245)
,p_event_id=>wwv_flow_imp.id(7170292152785952244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6596351509113369229)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7624137381803706724)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Administrator - Save Interactive Grid Data'
,p_static_id=>'administrator-save-interactive-grid-data'
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
'													       WHERE WFAD_BU = :global_BU ',
'                                                AND WFAD_BUS_PROC_ID = :WF_BUS_PROC_ID;',
'',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN	',
'',
'       DELETE FROM wf_admin_details ',
'		  WHERE WFAD_BU = :global_BU ',
'          AND WFAD_BUS_PROC_ID = :WF_BUS_PROC_ID;',
'',
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
,p_internal_uid=>1114389673569758201
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7025457021084319156)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Delete Workflow_activity '
,p_static_id=>'process-for-delete-workflow-activity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'DELETE FROM WF_INTERNAL_MESSAGE',
'WHERE WFIM_BU = :global_bu',
'AND WFIM_TYPE = :P236130010_WFAA_WF_ID',
'AND WFIM_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_MAIL_MESSAGE',
'WHERE WFMM_BU = :global_bu',
'AND WFMM_TYPE = :P236130010_WFAA_WF_ID',
'AND WFMM_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_RETURN_MESSAGE',
'WHERE WFRM_BU =:GLOBAL_BU',
'AND WFRM_TYPE = :P236130010_WFAA_WF_ID',
'AND WFRM_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_FORWARD_MESSAGE',
'WHERE WFFM_BU = :GLOBAL_BU',
'AND WFFM_TYPE  =:P236130010_WFAA_WF_ID',
'AND WFFM_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WORK_FLOW_NOTIFY_PERSONS',
'WHERE WFNP_BU = :GLOBAL_BU',
'AND WFNP_WF_ID =:P236130010_WFAA_WF_ID',
'AND WFNP_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'        DELETE FROM work_flow_appr_actvt',
'	      WHERE wfaa_bu         = :Global_bu ',
'         AND wfaa_wf_id      = :P236130010_WFAA_WF_ID',
'         AND wfaa_seq_no     = :P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_AUTHORIZATION_PFX',
'WHERE WFAP_BU = :GLOBAL_BU',
'AND WFAP_WF_ID = :P236130010_WFAA_WF_ID',
'AND WFAP_SEQ_NO =:P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_AUTHORIZATION_CLASS',
'WHERE WFAC_BU = :GLOBAL_BU',
'AND WFAC_WF_ID =:P236130010_WFAA_WF_ID',
'AND WFAC_SEQ_NO = :P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WORK_FLOW_AUTH_ROLE',
'WHERE WFAR_BU  =:GLOBAL_BU',
'AND WFAR_WF_TYPE =:P236130010_WFAA_WF_ID',
'AND WFAR_SEQ_NO = :P236130010_WFAA_SEQ_NO;',
'',
'DELETE FROM WF_DIRECT_AUTHORIZATION',
' where WFDA_BU = :Global_bu',
'	and wfda_type = :P236130010_WFAA_WF_ID   ',
'	and wfda_seq_no = :P236130010_WFAA_SEQ_NO',
'	and wfda_sub_seq_no = :P236130010_WFDA_SUB_SEQ_NO;',
'',
'COMMIT;	',
'',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_ACT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Activities Line Deleted &P236130010_WFAA_SEQ_NO.'
,p_internal_uid=>1543495185540708128
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7025457310751319159)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Delete Workflow_Auth'
,p_static_id=>'process-for-delete-workflow-auth'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'DELETE FROM WF_AUTHORIZATION_PFX',
'WHERE WFAP_BU = :GLOBAL_BU',
'AND WFAP_WF_ID = :P236130010_WFDA_TYPE',
'AND WFAP_SEQ_NO =:P236130010_WFDA_SEQ_NO;',
'',
'DELETE FROM WF_AUTHORIZATION_CLASS',
'WHERE WFAC_BU = :GLOBAL_BU',
'AND WFAC_WF_ID =:P236130010_WFDA_TYPE',
'AND WFAC_SEQ_NO = :P236130010_WFDA_SEQ_NO;',
'',
'DELETE FROM WORK_FLOW_AUTH_ROLE',
'WHERE WFAR_BU  =:GLOBAL_BU',
'AND WFAR_WF_TYPE =:P236130010_WFDA_TYPE',
'AND WFAR_SEQ_NO = :P236130010_WFDA_SEQ_NO;',
'',
'DELETE FROM WF_DIRECT_AUTHORIZATION',
' where WFDA_BU = :Global_bu',
'	and wfda_type = :P236130010_WFDA_TYPE   ',
'	and wfda_seq_no = :P236130010_WFDA_SEQ_NO',
'	and wfda_sub_seq_no = :P236130010_WFDA_SUB_SEQ_NO;',
'',
'COMMIT;	',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_DIR_AUTH'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Authorization Line Deleted &P236130010_WFDA_SEQ_NO.'
,p_internal_uid=>1543495475207708131
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6596353368113369248)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7649058192748158178)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reports - Save Interactive Grid Data'
,p_static_id=>'reports-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
' IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'INSERT INTO WORK_FLOW_REPORTS (WFR_BU,',
'                              WFR_WF_ID,',
'                              WFR_REPORT_ID,',
'                              WFR_REPORT_DESC,',
'                              WFR_CRE_BY,',
'                              WFR_CRE_DATE)',
'                       values(:global_bu,',
'					          :WFR_WF_ID,',
'                              :WFR_REPORT_ID,',
'                              :WFR_REPORT_DESC,',
'                              :global_user,',
'                               sysdate);',
'							   ',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN								   ',
'							   ',
'update 	WORK_FLOW_REPORTS set WFR_WF_ID           =:WFR_WF_ID,',
'                          WFR_REPORT_ID       =:WFR_REPORT_ID,',
'                          WFR_REPORT_DESC     =:WFR_REPORT_DESC,',
'                          WFR_upd_BY          =:global_user,',
'                          WFR_upd_DATE		  =sysdate',
'				  WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :WF_BUS_PROC_ID;',
'					',
'							   ',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN	',
'',
'delete from WORK_FLOW_REPORTS   WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :WF_BUS_PROC_ID;	',
'',
'commit;',
'end if;',
'end;			   ',
'							   					'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1114391532569758220
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6528987203735544265)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7570746831243894146)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Work Flow - Save Interactive Grid Data'
,p_static_id=>'work-flow-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'UPDATE work_flow',
'   SET wf_hier_type=:wf_hier_type,',
'       wf_auth_type=:wf_auth_type,',
'	   wf_basis=:wf_basis,',
'	   wf_appr_basis=:wf_appr_basis,',
'	   wf_vert_type=:wf_vert_type,',
'	   wf_self_appr_flag=:wf_self_appr_flag,',
'		wf_mail_send_opt=:wf_mail_send_opt,',
'	   wf_upd_by=:global_user,',
'	   wf_upd_date=sysdate',
' WHERE wf_bu=:global_bu',
' and   WF_BUS_PROC_ID=:WF_BUS_PROC_ID;',
'   --AND WFDA_TYPE =:WF_BUS_PROC_ID;',
'END IF;',
'END; ',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1047025368191933237
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581827652815094078)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8723463517304960097)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_activity - Save Interactive Grid Data'
,p_static_id=>'workflow-activity-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'      SELECT NVL(MAX(wfaa_seq_no),0)+1',
'        INTO :wfaa_seq_no',
'        FROM work_flow_appr_actvt',
'       WHERE wfaa_bu    = :Global_bu',
'         AND wfaa_wf_id = :wfaa_wf_id;',
'',
'      INSERT INTO work_flow_appr_actvt(wfaa_bu,',
'                                       wfaa_wf_id,',
'                                       wfaa_seq_no,',
'                                       wfaa_desc,',
'                                       wfaa_status,',
'                                       wfaa_status_desc,',
'                                       wfaa_hour,',
'                                       wfaa_status_desc2,',
'                                       wfaa_print_seq_no,',
'                                       wfaa_msg_to,',
'                                       wfaa_hier_type,',
'                                       wfaa_cre_by,',
'                                       wfaa_cre_ip_addr,',
'                                       wfaa_cre_os_user,',
'                                       wfaa_cre_date,',
'                                       wfaa_upd_by,',
'                                       wfaa_upd_ip_addr,',
'                                       wfaa_upd_os_user,',
'                                       wfaa_upd_date,',
'                                       wfaa_cre_emp_id,',
'                                       wfaa_upd_emp_id,',
'                                       wfaa_im_flag,',
'                                       wfaa_mail_flag,',
'                                       wfaa_sms_flag,',
'                                       wfaa_sms_template_id)        ',
'                               VALUES (:Global_bu,',
'                                       :wfaa_wf_id,',
'                                       :wfaa_seq_no,',
'                                       :wfaa_desc,',
'                                       :wfaa_status,',
'                                       :wfaa_status_desc,',
'                                       :wfaa_hour,',
'                                       :wfaa_status_desc2,',
'                                       :wfaa_print_seq_no,',
'                                       :wfaa_msg_to,',
'                                       :wfaa_hier_type,',
'                                       :Global_user,',
'                                       :wfaa_cre_ip_addr,',
'                                       :wfaa_cre_os_user,',
'                                       SYSDATE,',
'                                       :Global_user,',
'                                       :wfaa_upd_ip_addr,',
'                                       :wfaa_upd_os_user,',
'                                       SYSDATE,',
'                                       :wfaa_cre_emp_id,',
'                                       :wfaa_upd_emp_id,',
'                                       :wfaa_im_flag,',
'                                       :wfaa_mail_flag,',
'                                       :wfaa_sms_flag,',
'                                       :wfaa_sms_template_id );',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'      UPDATE work_flow_appr_actvt',
'         SET wfaa_desc         = :wfaa_desc,',
'             wfaa_status       = :wfaa_status,',
'             wfaa_status_desc  = :wfaa_status_desc,',
'             wfaa_hour         = :wfaa_hour,',
'             wfaa_status_desc2 = :wfaa_status_desc2,',
'             wfaa_print_seq_no = :wfaa_print_seq_no,',
'             wfaa_msg_to       = :wfaa_msg_to,',
'             wfaa_hier_type    = :wfaa_hier_type,',
'             wfaa_cre_ip_addr  = :wfaa_cre_ip_addr,',
'             wfaa_cre_os_user  = :wfaa_cre_os_user,',
'             wfaa_upd_by       = :wfaa_upd_by,',
'             wfaa_upd_ip_addr  = :wfaa_upd_ip_addr,',
'             wfaa_upd_os_user  = :wfaa_upd_os_user,',
'             wfaa_upd_date     = :wfaa_upd_date,',
'             wfaa_cre_emp_id   = :wfaa_cre_emp_id,',
'             wfaa_upd_emp_id   = :wfaa_upd_emp_id,',
'             wfaa_im_flag      = :wfaa_im_flag,',
'             wfaa_mail_flag    = :wfaa_mail_flag,',
'             wfaa_sms_flag     = :wfaa_sms_flag,',
'             wfaa_sms_template_id = :wfaa_sms_template_id',
'       WHERE wfaa_bu         = :Global_bu ',
'         AND wfaa_wf_id      = :wfaa_wf_id',
'         AND wfaa_seq_no     = :wfaa_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	  DELETE',
'        FROM work_flow_appr_actvt',
'	   WHERE wfaa_bu         = :Global_bu ',
'         AND wfaa_wf_id      = :wfaa_wf_id',
'         AND wfaa_seq_no     = :wfaa_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1099865817271483050
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581847780196096274)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8731122533542609428)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_Auth - Save Interactive Grid Data'
,p_static_id=>'workflow-auth-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' V_POS_DESC   VARCHAR2(200);',
' V_DEPT_DESC  VARCHAR2(200);',
' V_EMP_DESC   VARCHAR2(200); ',
' V_CNT        NUMBER;',
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'  ',
'   Select COUNT(*)',
'   INTO V_CNT',
' from WF_DIRECT_AUTHORIZATION',
' where WFDA_BU     = :Global_bu',
' AND WFDA_TYPE     = :wfda_type',
' AND WFDA_PLNT     = :WFDA_PLNT',
' AND WFDA_POSITION = :WFDA_POSITION;',
'',
' IF V_CNT > 1  THEN  ',
'    raise_application_error(-20999,''Duplicate entries not allowed'');',
' END IF;',
'',
'     SELECT NVL(MAX(wfda_sub_seq_no),0) + 1',
'       INTO :wfda_sub_seq_no',
'       FROM wf_direct_authorization',
'      WHERE wfda_bu = :GLOBAL_BU',
'        AND wfda_type = :wfda_type',
'        AND wfda_seq_no = :wfda_seq_no;',
'      --raise_application_error(-20999,:WFDA_BU||''/''||:wfda_type||''/''||:WFDA_PLNT||''/''||:WFDA_POSITION);',
'      INSERT INTO wf_direct_authorization(wfda_bu,',
'                                          wfda_type,',
'                                          wfda_position,',
'                                          wfda_date_from,',
'                                          wfda_date_to,',
'                                          wfda_seq_no,',
'                                          wfda_value,',
'                                          wfda_aod_flag,',
'                                          wfda_mobile_no,',
'                                          wfda_plnt,',
'                                          wfda_sub_seq_no,',
'                                          wfda_appr_bu,',
'                                          wfda_disc_pct,',
'                                          wfda_dflt_flag,',
'                                          wfda_cre_by,',
'                                          wfda_cre_ip_addr,',
'                                          wfda_cre_os_user,',
'                                          wfda_cre_date,',
'                                          wfda_upd_by,',
'                                          wfda_upd_ip_addr,',
'                                          wfda_upd_os_user,',
'                                          wfda_upd_date,',
'                                          wfda_cre_emp_id,',
'                                          wfda_upd_emp_id,',
'                                          wfda_mail_opt_flag,',
'                                          wfda_sender_mail)        ',
'                                   VALUES (:Global_bu,',
'                                           :wfda_type,',
'                                           :wfda_position,',
'                                           TO_DATE(:wfda_date_from),',
'                                           TO_DATE(:wfda_date_to),',
'                                           :wfda_seq_no,',
'                                           :wfda_value,',
'                                           :wfda_aod_flag,',
'                                           :wfda_mobile_no,',
'                                           :wfda_plnt,',
'                                           :wfda_sub_seq_no,',
'                                           :wfda_appr_bu,',
'                                           :wfda_disc_pct,',
'                                           :wfda_dflt_flag,',
'                                           :Global_User,',
'                                           :wfda_cre_ip_addr,',
'                                           :wfda_cre_os_user,',
'                                           SYSDATE,',
'                                           :Global_User,',
'                                           :wfda_upd_ip_addr,',
'                                           :wfda_upd_os_user,',
'                                           SYSDATE,',
'                                           :wfda_cre_emp_id,',
'                                           :wfda_upd_emp_id,',
'                                           :wfda_mail_opt_flag,',
'                                           :wfda_sender_mail     ',
'                                           );',
'		/* IF :WFDA_POSITION IS NOT NULL THEN',
'   IF :P236130010_WF_AUTH_TYPE = ''P'' THEN',
'	 proc_find_emp_details(:wfda_appr_bu,',
'		                    NULL,',
'		                    :wfda_position,',
'		                    NULL,',
'		                    :wfda_plnt,',
'		                    :wfda_emp_id,',
'		                    V_EMP_DESC,',
'		                    :DEPT_ID,',
'		                    V_DEPT_DESC,',
'		                    :position,',
'		                    V_POS_DESC,',
'		                    1);',
'		 ',
'',
'    ELSIF :P236130010_WF_AUTH_TYPE = ''E'' THEN',
'			proc_find_emp_details(:wfda_appr_bu,',
'                                  :wfda_position,',
'                                  NULL,',
'                                  NULL,',
'                                  :wfda_plnt,',
'                                  :position,',
'                                  V_POS_DESC,',
'                                  :DEPT_ID,',
'                                  V_DEPT_DESC,',
'                                  :wfda_emp_id,',
'                                  V_EMP_DESC,',
'                                  1);',
'	END IF;',
'',
'END IF;		 */',
'',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'   Select COUNT(*)',
'   INTO V_CNT',
' from WF_DIRECT_AUTHORIZATION',
' where WFDA_BU     = :Global_bu',
' AND WFDA_TYPE     = :wfda_type',
' AND WFDA_PLNT     = :WFDA_PLNT',
' AND WFDA_POSITION = :WFDA_POSITION;',
' ',
' IF V_CNT > 1  THEN  ',
'    raise_application_error(-20999,''Duplicate entries not allowed'');',
' END IF;',
' ',
'      UPDATE wf_direct_authorization',
'         SET wfda_position  = :wfda_position,',
'             wfda_date_from = TO_DATE(:wfda_date_from),',
'             wfda_date_to   = TO_DATE(:wfda_date_to),',
'             wfda_value     = :wfda_value,',
'             wfda_aod_flag  = :wfda_aod_flag,',
'             wfda_mobile_no = :wfda_mobile_no,',
'             wfda_plnt      = :wfda_plnt,',
'             wfda_sub_seq_no = :wfda_sub_seq_no,',
'             wfda_appr_bu   = :wfda_appr_bu, ',
'             wfda_disc_pct  = :wfda_disc_pct,',
'             wfda_dflt_flag = :wfda_dflt_flag,',
'             wfda_cre_ip_addr = :wfda_cre_ip_addr,',
'             wfda_cre_os_user = :wfda_cre_os_user,',
'             wfda_cre_date   = :wfda_cre_date,',
'             wfda_upd_by   = :wfda_upd_by,',
'             wfda_upd_ip_addr = :wfda_upd_ip_addr,',
'             wfda_upd_os_user = :wfda_upd_os_user,',
'             wfda_upd_date = :wfda_upd_date,',
'             wfda_cre_emp_id = :wfda_cre_emp_id,',
'             wfda_upd_emp_id = :wfda_upd_emp_id,',
'             wfda_mail_opt_flag = :wfda_mail_opt_flag,',
'             wfda_sender_mail = :wfda_sender_mail ',
'       WHERE wfda_bu         = :Global_bu ',
'         AND wfda_type       = :wfda_type',
'         AND wfda_seq_no     = :wfda_seq_no',
'         AND wfda_sub_seq_no = :wfda_sub_seq_no;',
'',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'',
'	  DELETE',
'        FROM wf_direct_authorization',
'	   WHERE wfda_bu          = :Global_bu ',
'         AND wfda_type       = :wfda_type',
'         AND wfda_seq_no     = :wfda_seq_no',
'         AND wfda_sub_seq_no = :wfda_sub_seq_no;',
'            ',
'   END IF;',
'',
'   COMMIT;',
'END;			  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1099885944652485246
);
wwv_flow_imp.component_end;
end;
/
