prompt --application/pages/page_1963151
begin
--   Manifest
--     PAGE: 1963151
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
 p_id=>1963151
,p_name=>'Object Audit'
,p_alias=>'OBJECT-AUDIT'
,p_step_title=>'Object Audit'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.my_custom_checkbox {',
'    /* Your custom CSS styles here */',
'    position: absolute;',
'    top: 10;',
'    left: 10;',
'}',
'',
'',
'',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7893083259499245773)
,p_plug_name=>'Object Audit'
,p_static_id=>'object-audit'
,p_region_name=>'object'
,p_parent_plug_id=>wwv_flow_imp.id(7893690309182097361)
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       ROA_OBJ_NAME,',
'       ROA_OBJ_TYPE,',
'       ROA_OBJ_STATUS,',
'       ROA_OBJ_MODULE,',
'       ROA_OBJ_TEAM,',
'       ROA_OBJ_OWNER_ID,',
'       ROA_OBJ_OWNER,',
'       ROA_OBJ_CLIENT,',
'       ROA_OBJ_CLIENT_DESC,',
'       ROA_OBJ_REQ,',
'       ROA_CRE_BY,',
'       ROA_CRE_IP_ADDR,',
'       ROA_CRE_OS_USER,',
'       TO_CHAR(ROA_CRE_DATE,func_find_date_format(:GLOBAL_BU))ROA_CRE_DATE,',
'       ROA_CRE_EMP_ID,',
'       ROA_UPD_BY,',
'       ROA_UPD_IP_ADDR,',
'       ROA_UPD_OS_USER,',
'       TO_CHAR(ROA_UPD_DATE,func_find_date_format(:GLOBAL_BU))ROA_UPD_DATE,',
'       ROA_UPD_EMP_ID,',
'       ROA_APEX_WORKSPACE_NAME,',
'       ROA_APEX_APP_ID,',
'       ROA_APEX_SESSION_ID,',
'       ROA_LOC_IP_ADDR,',
'       ROA_PUB_IP_ADDR,',
'       ROA_DEVICETYPE,',
'       ROA_NARRATION,',
'       ''<span aria-hidden="true" class="fa fa-trash" style="color: red ;font-size : 12px ;font-weight: bold"></span>'' del ,',
'       ''<span aria-hidden="true" class="fa fa-clipboard-list" style="color: green ;font-size : 12px ;font-weight: bold"></span>'' Audit_info',
'  from RMAP_OBJECT_AUDIT'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_page_header=>'Object Audit'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(7893689609452097354)
,p_heading=>'Responsible'
,p_static_id=>'responsible'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893690772651097365)
,p_name=>'AUDIT_INFO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUDIT_INFO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Audit Info'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P1963151_OBJECT_NAME'',''&ROA_OBJ_NAME.'');apex.submit(''SELECT'');'
,p_link_text=>'&AUDIT_INFO.'
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
 p_id=>wwv_flow_imp.id(7893689518378097353)
,p_name=>'DEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7893104898015245843)
,p_name=>'ROA_APEX_APP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_APEX_APP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Apex App. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7893105933727245844)
,p_name=>'ROA_APEX_SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_APEX_SESSION_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'APex Session ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(7893103887191245840)
,p_name=>'ROA_APEX_WORKSPACE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_APEX_WORKSPACE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Apex Workspace Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7893093958871245826)
,p_name=>'ROA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cre. By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893096937662245830)
,p_name=>'ROA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_CRE_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Cre. Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_max_length=>75
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893097885416245832)
,p_name=>'ROA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cre. Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
,p_default_expression=>':global_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893094932850245827)
,p_name=>'ROA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cre. IP Addr.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>80
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
,p_default_expression=>':global_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893095973741245829)
,p_name=>'ROA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cre. OS User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893108975150245849)
,p_name=>'ROA_DEVICETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_DEVICETYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Devicetype'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7893106895014245846)
,p_name=>'ROA_LOC_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_LOC_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location IP Addr.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>400
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
 p_id=>wwv_flow_imp.id(7893687940650097337)
,p_name=>'ROA_NARRATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_NARRATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Narration'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>800
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
 p_id=>wwv_flow_imp.id(7893091914426245824)
,p_name=>'ROA_OBJ_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_CLIENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Client'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Standard;STD,Specific;CLT'
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
,p_default_type=>'STATIC'
,p_default_expression=>'STD'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893687847672097336)
,p_name=>'ROA_OBJ_CLIENT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_CLIENT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Client Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>800
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
 p_id=>wwv_flow_imp.id(7893088944165245818)
,p_name=>'ROA_OBJ_MODULE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_MODULE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Module'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_imp.id(7893085936024245813)
,p_name=>'ROA_OBJ_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Object Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(7893090977321245821)
,p_name=>'ROA_OBJ_OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Owner Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(7893689609452097354)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>400
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
 p_id=>wwv_flow_imp.id(7893687694921097335)
,p_name=>'ROA_OBJ_OWNER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_OWNER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Owner ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_imp.id(7893092973561245824)
,p_name=>'ROA_OBJ_REQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_REQ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Required'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Yes;Y,No;N'
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
 p_id=>wwv_flow_imp.id(7893087935241245816)
,p_name=>'ROA_OBJ_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Valid;VALID,In Valid;INVALID'
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
 p_id=>wwv_flow_imp.id(7893089955311245818)
,p_name=>'ROA_OBJ_TEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_TEAM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Team'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:PMF;P,SCM;S,FIN;F,HRM;H'
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
 p_id=>wwv_flow_imp.id(7893086965649245815)
,p_name=>'ROA_OBJ_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_OBJ_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Object Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>80
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
 p_id=>wwv_flow_imp.id(7893107957599245848)
,p_name=>'ROA_PUB_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_PUB_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Public IP Addr.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>300
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
 p_id=>wwv_flow_imp.id(7893098953118245834)
,p_name=>'ROA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Updated by'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893101979814245837)
,p_name=>'ROA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_UPD_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Updated Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_max_length=>75
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893102969599245838)
,p_name=>'ROA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Updated Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
,p_default_expression=>':global_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893099919773245835)
,p_name=>'ROA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Updated IP Addr.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>80
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
,p_default_expression=>':global_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7893100924084245837)
,p_name=>'ROA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Updated OS User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7881362701616152155)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7893083704507245782)
,p_internal_uid=>2411121868963634754
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7893083995420245787)
,p_interactive_grid_id=>wwv_flow_imp.id(7893083704507245782)
,p_static_id=>'7736619'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7893084213662245788)
,p_report_id=>wwv_flow_imp.id(7893083995420245787)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893086292852245813)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7893085936024245813)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>301
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893087366502245815)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7893086965649245815)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893088328253245816)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7893087935241245816)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893089298729245818)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7893088944165245818)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893090301226245819)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7893089955311245818)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893091325663245823)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7893090977321245821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893092343617245824)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7893091914426245824)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893093341875245826)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7893092973561245824)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893094354296245827)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7893093958871245826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893095324018245827)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7893094932850245827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893096353898245829)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7893095973741245829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893097369472245832)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7893096937662245830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893098357713245832)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7893097885416245832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893099316873245834)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7893098953118245834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893100374896245835)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7893099919773245835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893101367247245837)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7893100924084245837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893102376143245838)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7893101979814245837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893103304805245840)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7893102969599245838)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893104353802245840)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7893103887191245840)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893105297412245844)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7893104898015245843)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893106357392245844)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7893105933727245844)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893107359064245848)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7893106895014245846)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893108369849245849)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7893107957599245848)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893109345393245851)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7893108975150245849)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893121939224261552)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7881362701616152155)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893693828186097652)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7893687694921097335)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893694906686097662)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7893687847672097336)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7893695809375097669)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7893687940650097337)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7896526132049832730)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(7893689518378097353)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7897883566314402740)
,p_view_id=>wwv_flow_imp.id(7893084213662245788)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(7893690772651097365)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7893690309182097361)
,p_plug_name=>'Overall'
,p_static_id=>'overall'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119437650002107428)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Add_Object'
,p_static_id=>'add-object'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Object'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119437236768107428)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Compile_all_objects'
,p_static_id=>'compile-all-objects'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compile All Objects'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119438519177107429)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Download_object'
,p_static_id=>'download-object'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download Object'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119436497239107418)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Fetch'
,p_static_id=>'fetch'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119438101155107429)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Save_object'
,p_static_id=>'save-object'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Object'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7119436880439107426)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_button_name=>'Summary'
,p_static_id=>'summary'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Summary'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1963152:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7119444079755107456)
,p_branch_name=>'go to pahge1963153 '
,p_branch_action=>'f?p=&APP_ID.:1963153:&SESSION.::&DEBUG.::P1963153_OBJECT_NAME:&P1963151_OBJECT_NAME.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7893691796744097462)
,p_name=>'P1963151_OBJECT_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7893690309182097361)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7893706966102097555)
,p_name=>'P1963151_SHOW_NOT_FILL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7893707367120097559)
,p_name=>'P1963151_SHOW_NOT_IN_DB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7893083259499245773)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7119441258789107445)
,p_name=>'add'
,p_static_id=>'add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7119437650002107428)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7119441740320107449)
,p_event_id=>wwv_flow_imp.id(7119441258789107445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "object" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7119443074914107453)
,p_name=>'download'
,p_static_id=>'download'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7119438519177107429)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7119443614477107453)
,p_event_id=>wwv_flow_imp.id(7119443074914107453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "object" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7119442192193107453)
,p_name=>'save'
,p_static_id=>'save'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7119438101155107429)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7119442684124107453)
,p_event_id=>wwv_flow_imp.id(7119442192193107453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "object" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7119440871968107443)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Audio Info'
,p_static_id=>'audio-info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'proc_exc_sys_audit(:P1963151_OBJECT_NAME);',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SELECT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1637479036424496415
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7119440449774107442)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Compile all Objects'
,p_static_id=>'compile-all-objects'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'proc_compile_all;',
'END;',
'apex_application.g_print_success_message := ''Compiled Successfully.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7119437236768107428)
,p_internal_uid=>1637478614230496414
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7119440089676107442)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Object'
,p_static_id=>'load-object'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'proc_load_user_objects;',
'END;',
'apex_application.g_print_success_message := ''Loaded Successfully.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7119436497239107418)
,p_internal_uid=>1637478254132496414
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7119439588428107431)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7893083259499245773)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OBJECT BROWSER'
,p_static_id=>'object-browser'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'		',
'        INSERT INTO rmap_object_audit   (ROA_OBJ_NAME,',
'                                        ROA_OBJ_TYPE,',
'                                        ROA_OBJ_STATUS,',
'                                        ROA_OBJ_MODULE,',
'                                        ROA_OBJ_TEAM,',
'                                        ROA_OBJ_OWNER,',
'                                        ROA_OBJ_CLIENT,',
'                                        ROA_OBJ_REQ,',
'                                        ROA_CRE_BY,',
'                                        ROA_CRE_IP_ADDR,',
'                                        ROA_CRE_OS_USER,',
'                                        ROA_CRE_DATE,',
'                                        ROA_CRE_EMP_ID,',
'                                        ROA_APEX_WORKSPACE_NAME,',
'                                        ROA_APEX_APP_ID,',
'                                        ROA_APEX_SESSION_ID,',
'                                        ROA_LOC_IP_ADDR,',
'                                        ROA_PUB_IP_ADDR,',
'                                        ROA_DEVICETYPE',
'                                        )',
'',
'						VALUES         (:ROA_OBJ_NAME,',
'                                        :ROA_OBJ_TYPE,',
'                                        :ROA_OBJ_STATUS,',
'                                        :ROA_OBJ_MODULE,',
'                                        :ROA_OBJ_TEAM,',
'                                        :ROA_OBJ_OWNER,',
'                                        :ROA_OBJ_CLIENT,',
'                                        :ROA_OBJ_REQ,',
'                                        :Global_user,',
'                                        :Global_ip_addr,',
'                                        :Global_user,',
'                                        sysdate,',
'                                        :Global_emp_id,',
'                                        :ROA_APEX_WORKSPACE_NAME,',
'                                        :APP_ID,',
'                                        :APP_SESSION,',
'                                        :ROA_LOC_IP_ADDR,',
'                                        :ROA_PUB_IP_ADDR,',
'                                        :ROA_DEVICETYPE',
'                                        );',
' COMMIT;',
'',
'	ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'				UPDATE rmap_object_audit SET ',
'                ROA_OBJ_NAME   = :ROA_OBJ_NAME,',
'                ROA_OBJ_TYPE   = :ROA_OBJ_TYPE,',
'                ROA_OBJ_MODULE = :ROA_OBJ_MODULE,',
'                ROA_OBJ_TEAM   = :ROA_OBJ_TEAM,',
'                ROA_OBJ_OWNER  = :ROA_OBJ_OWNER,',
'                ROA_OBJ_CLIENT = :ROA_OBJ_CLIENT,',
'                ROA_OBJ_REQ    = :ROA_OBJ_REQ,',
'                ROA_UPD_BY     = :GLOBAL_USER,',
'                ROA_UPD_IP_ADDR= :GLOBAL_IP_ADDR,',
'                ROA_UPD_OS_USER= :GLOBAL_USER,',
'                ROA_UPD_DATE   = SYSDATE,',
'                ROA_UPD_EMP_ID = :GLOBAL_EMP_ID',
'           WHERE rowid =:ROWID;',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'      DELETE  rmap_object_audit ',
'       WHERE  rowid =:ROWID;',
'      ',
'				',
'	COMMIT;',
'',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1637477752884496403
);
wwv_flow_imp.component_end;
end;
/
