prompt --application/pages/page_2361300105
begin
--   Manifest
--     PAGE: 2361300105
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
 p_id=>2361300105
,p_name=>'Employee Hierarchy'
,p_alias=>'EMPLOYEE-HIERARCHY'
,p_step_title=>'Employee Hierarchy'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,600));',
'    background: #00b1e7;',
'    color: white;',
'   ',
'} */',
'',
'.addbtn{',
'                color: blue;',
'}',
'',
'.printbtn{',
'               color: rgb(211, 96, 19);',
'}',
'',
'',
'.savebtn{',
'                color: green;',
'}',
'.cancelbtn{',
'                color: red;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523872719264035467)
,p_plug_name=>'Employee Hierarchy'
,p_static_id=>'employee-hierarchy'
,p_region_name=>'EH'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WEH_BU,',
'       WEH_EMP_ID,',
'		 (SELECT (DECODE(',
'			 			(SELECT applctrl_desc_level',
'         			FROM     appl_control',
'         			WHERE    applctrl_bu = emp_bu),1,LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)),',
'    NVL(',
'        LTRIM(RTRIM(emp_first_name2)) ||  LTRIM(RTRIM(emp_middle_name2)) || LTRIM(RTRIM(emp_last_name2)),',
'        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1))))) emp_name',
'    FROM  employees',
'    WHERE emp_bu = WEH_BU',
'    AND   emp_emp_id = WEH_EMP_ID) Emp_Name,',
'       WEH_PAR_EMP_ID,',
'       WEH_DEFLT_FLAG,',
'       WEH_APPR_BU,',
'       WEH_APPR_PLNT,',
'		 (SELECT bup_name1 ',
'				FROM  bus_unit_plants',
'				where bup_bu= WEH_APPR_BU',
'				and bup_plant_id= WEH_APPR_PLNT) Unit_desc,',
'		(SELECT (DECODE(',
'			 			(SELECT applctrl_desc_level',
'         			FROM     appl_control',
'         			WHERE    applctrl_bu = emp_bu),1,LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)),',
'    NVL(',
'        LTRIM(RTRIM(emp_first_name2)) ||  LTRIM(RTRIM(emp_middle_name2)) || LTRIM(RTRIM(emp_last_name2)),',
'        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1))))) emp_name',
'    FROM  employees',
'    WHERE emp_bu = WEH_APPR_BU',
'    AND   emp_emp_id = WEH_PAR_EMP_ID) reporting_Emp_Name,			',
'       WEH_CRE_BY,',
'       WEH_CRE_IP_ADDR,',
'       WEH_CRE_OS_USER,',
'       WEH_CRE_DATE,',
'       WEH_UPD_BY,',
'       WEH_UPD_IP_ADDR,',
'       WEH_UPD_OS_USER,',
'       WEH_UPD_DATE,',
'       WEH_CRE_EMP_ID,',
'       WEH_UPD_EMP_ID',
'  from WF_EMP_HIERARCHY',
'where WEH_BU = :global_bu'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_page_header=>'Employee Hierarchy'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(7004158966764983659)
,p_heading=>'Reporting From'
,p_static_id=>'reporting-from'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(7004159040515983660)
,p_heading=>'Reporting To'
,p_static_id=>'reporting-to'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6501556255271413568)
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
 p_id=>wwv_flow_imp.id(6501556404487413569)
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
 p_id=>wwv_flow_imp.id(5583608866174820740)
,p_name=>'DELETE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span class="fa fa-trash-o" aria-hidden="true" style = "color:red;font-weight:bold;"></span>')).to_clob
,p_link_target=>'javascript:$s(''P2361300105_ROWID'',''&ROWID.'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524451369439347830)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>122
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6524452359176347840)
,p_name=>'REPORTING_EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REPORTING_EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7004159040515983660)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>122
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523873968910035470)
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
 p_id=>wwv_flow_imp.id(6524451940755347836)
,p_name=>'UNIT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7004158966764983659)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523878909611035499)
,p_name=>'WEH_APPR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_APPR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7004158966764983659)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>5
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
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523879927519035501)
,p_name=>'WEH_APPR_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_APPR_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7004158966764983659)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Unit',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6527464680236078413)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'WEH_APPR_BU'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523874937531035474)
,p_name=>'WEH_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_BU'
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
 p_id=>wwv_flow_imp.id(6523880916062035503)
,p_name=>'WEH_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_CRE_BY'
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523883839825035504)
,p_name=>'WEH_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_CRE_DATE'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523888888307035507)
,p_name=>'WEH_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523881845335035503)
,p_name=>'WEH_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6523882868894035504)
,p_name=>'WEH_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6523878008713035498)
,p_name=>'WEH_DEFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_DEFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
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
 p_id=>wwv_flow_imp.id(6523875955492035476)
,p_name=>'WEH_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_EMP_ID'
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
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6525246450096276962)
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
 p_id=>wwv_flow_imp.id(6523876988542035476)
,p_name=>'WEH_PAR_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_PAR_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7004159040515983660)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Responsible to Employee',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6528110832563336393)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'WEH_APPR_BU,WEH_EMP_ID'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523884848386035506)
,p_name=>'WEH_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_UPD_BY'
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523887921485035507)
,p_name=>'WEH_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_UPD_DATE'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523889911993035509)
,p_name=>'WEH_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6523885907350035506)
,p_name=>'WEH_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6523886884647035506)
,p_name=>'WEH_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEH_UPD_OS_USER'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6523873233781035470)
,p_internal_uid=>1041911398237424442
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_imp.id(6523873629602035470)
,p_interactive_grid_id=>wwv_flow_imp.id(6523873233781035470)
,p_static_id=>'10419118'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6523873824122035470)
,p_report_id=>wwv_flow_imp.id(6523873629602035470)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5627272982132865732)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5583608866174820740)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523874374164035471)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6523873968910035470)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523875397111035474)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6523874937531035474)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523876421672035476)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6523875955492035476)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523877435131035478)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6523876988542035476)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523878239278035499)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6523878008713035498)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523879254243035501)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6523878909611035499)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523880285922035501)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6523879927519035501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523881246674035503)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6523880916062035503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122.6406
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523882308895035503)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6523881845335035503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102.6406
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523883245753035504)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6523882868894035504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97.6406
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523884249353035504)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6523883839825035504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109.6406
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523885260501035506)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6523884848386035506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97.6406
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523886327351035506)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6523885907350035506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523887329059035506)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6523886884647035506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523888334626035507)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6523887921485035507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523889282912035509)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6523888888307035507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523890332141035509)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6523889911993035509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6523914708007061607)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6501556255271413568)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6525385496919369913)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6524451369439347830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6527695098290175017)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6524451940755347836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6529672537819902742)
,p_view_id=>wwv_flow_imp.id(6523873824122035470)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6524452359176347840)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>225
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6501556573920413571)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6523872719264035467)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''EH'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6501556766673413573)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6523872719264035467)
,p_button_name=>'Download'
,p_static_id=>'download'
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
 p_id=>wwv_flow_imp.id(6501556683297413572)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6523872719264035467)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''EH'')"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583608696482820738)
,p_name=>'P2361300105_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6523872719264035467)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6524451491935347831)
,p_tabular_form_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_validation_name=>'Employee'
,p_static_id=>'employee'
,p_validation_sequence=>10
,p_validation=>'WEH_EMP_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Employee must be entered.'
,p_associated_column=>'WEH_EMP_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6524451777593347834)
,p_tabular_form_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_validation_name=>'Entity'
,p_static_id=>'entity'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :WEH_APPR_BU IS NULL THEN',
'	return(''Entity must be entered.'');',
'end if;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WEH_APPR_BU'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6524452300724347839)
,p_tabular_form_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_validation_name=>'Report_Emp'
,p_static_id=>'report-emp'
,p_validation_sequence=>40
,p_validation=>'WEH_PAR_EMP_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Employee must be entered.'
,p_associated_column=>'WEH_PAR_EMP_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6524451891585347835)
,p_tabular_form_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_validation_name=>'Unit'
,p_static_id=>'unit'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :WEH_APPR_PLNT is null then',
'return(''Unit must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WEH_APPR_PLNT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5580767035040481251)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6501556766673413573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5580767092256481252)
,p_event_id=>wwv_flow_imp.id(5580767035040481251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "EH" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6524451571861347832)
,p_name=>'Emp_Name'
,p_static_id=>'emp-name'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_triggering_element=>'WEH_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6524451646831347833)
,p_event_id=>wwv_flow_imp.id(6524451571861347832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'EMP_NAME',
  'items_to_submit', 'WEH_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT',
    '    (DECODE',
    '       (',
    '        (SELECT applctrl_desc_level',
    '         FROM     appl_control',
    '         WHERE    applctrl_bu = emp_bu),1,',
    '        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)),',
    '    NVL(',
    '        LTRIM(RTRIM(emp_first_name2)) ||  LTRIM(RTRIM(emp_middle_name2)) || LTRIM(RTRIM(emp_last_name2)),',
    '        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1))))) into :EMP_NAME',
    '    FROM  employees',
    '    WHERE emp_bu = :GLOBAL_BU',
    '    AND   emp_emp_id = :WEH_EMP_ID;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6524452696526347843)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6524452787822347844)
,p_event_id=>wwv_flow_imp.id(6524452696526347843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6524452497189347841)
,p_name=>'Reporting_Emp'
,p_static_id=>'reporting-emp'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_triggering_element=>'WEH_PAR_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6524452616116347842)
,p_event_id=>wwv_flow_imp.id(6524452497189347841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'REPORTING_EMP_NAME',
  'items_to_submit', 'WEH_APPR_BU,WEH_PAR_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :WEH_PAR_EMP_ID is not null then',
    'SELECT (DECODE(',
    '			 			(SELECT applctrl_desc_level',
    '         			FROM     appl_control',
    '         			WHERE    applctrl_bu = emp_bu),1,LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)),',
    '    NVL(',
    '        LTRIM(RTRIM(emp_first_name2)) ||  LTRIM(RTRIM(emp_middle_name2)) || LTRIM(RTRIM(emp_last_name2)),',
    '        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)))))',
    '		  into :REPORTING_EMP_NAME',
    '    FROM  employees',
    '    WHERE emp_bu = :WEH_APPR_BU',
    '    AND   emp_emp_id = :WEH_PAR_EMP_ID;',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6524452066937347837)
,p_name=>'Unit_Desc'
,p_static_id=>'unit-desc'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_triggering_element=>'WEH_APPR_PLNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6524452143751347838)
,p_event_id=>wwv_flow_imp.id(6524452066937347837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'UNIT_DESC',
  'items_to_submit', 'WEH_APPR_BU,WEH_APPR_PLNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :WEH_APPR_PLNT is not null then',
    'SELECT bup_name1 into :UNIT_DESC',
    '				FROM  bus_unit_plants',
    '				where bup_bu= :WEH_APPR_BU',
    '				and bup_plant_id= :WEH_APPR_PLNT;',
    'end if;				')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5583608627355820737)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE'
,p_static_id=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE',
'  FROM WF_EMP_HIERARCHY',
' WHERE ROWID = :P2361300105_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>101646791812209709
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6501556445686413570)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6523872719264035467)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Employee Hierarchy - Save Interactive Grid Data'
,p_static_id=>'employee-hierarchy-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'DECLARE',
'  CURSOR c1(c_emp_id   VARCHAR2)',
'  IS ',
'     SELECT weh_par_emp_id',
'	   FROM wf_emp_hierarchy ',
'	  WHERE weh_bu = :global_bu',
'        AND weh_emp_id = c_emp_id;',
'',
'  cr1   c1%ROWTYPE;		',
'BEGIN',
'  OPEN c1(:weh_emp_id);',
'  ',
'  FETCH c1 INTO cr1;',
'  ',
'     IF c1%FOUND THEN',
'	    raise_application_error(-20999,''Already this Employee Hierarchy is exist for reporting from - ''||cr1.weh_par_emp_id);',
'	 END IF;',
'',
'  CLOSE c1;',
'END;',
'*/',
'',
'IF :APEX$ROW_STATUS = ''C'' THEN',
'IF :WEH_DEFLT_FLAG = ''Y'' THEN',
'DECLARE',
'CURSOR c1',
'IS',
'SELECT weh_emp_id',
'  FROM wf_emp_hierarchy',
' WHERE weh_bu		= :GLOBAL_bu',
'   AND weh_emp_id	= :WEH_EMP_ID',
' GROUP BY weh_emp_id; ',
' ',
'CURSOR c2(c_emp_id VARCHAR2) ',
'IS',
'SELECT COUNT(*) v_cnt',
'  FROM wf_emp_hierarchy',
' WHERE weh_bu			= :GLOBAL_bu',
'   AND weh_emp_id	= c_emp_id  ',
'   AND weh_deflt_flag	= ''Y'';',
'',
'	cr2				c2%ROWTYPE;',
'',
'BEGIN',
'',
'FOR cr1 IN c1 ',
'LOOP',
'		OPEN c2(cr1.weh_emp_id);',
'		FETCH c2 INTO cr2;',
'		',
'		/*IF c2%FOUND THEN',
'	',
'		IF cr2.v_cnt >= 1 THEN',
'				raise_application_error(-20999,''Multiple Authority not allowed for employee''||cr1.weh_emp_id);',
'		END IF;',
'		',
'		END IF;*/',
'		',
'		CLOSE c2;',
'END LOOP;',
'',
'END;',
'',
'END IF;',
'',
'INSERT INTO WF_EMP_HIERARCHY(',
'										 	WEH_BU,',
'											WEH_EMP_ID,',
'											WEH_PAR_EMP_ID,',
'											WEH_DEFLT_FLAG,',
'											WEH_APPR_BU,',
'											WEH_APPR_PLNT,',
'											WEH_CRE_BY,',
'											WEH_CRE_IP_ADDR,',
'											WEH_CRE_OS_USER,',
'											WEH_CRE_DATE,',
'											WEH_UPD_BY,',
'											WEH_UPD_IP_ADDR,',
'											WEH_UPD_OS_USER,',
'											WEH_UPD_DATE,',
'											WEH_CRE_EMP_ID,',
'											WEH_UPD_EMP_ID',
'											)				',
'				VALUES (',
'							:WEH_BU,',
'							:WEH_EMP_ID,',
'							:WEH_PAR_EMP_ID,',
'							:WEH_DEFLT_FLAG,',
'							:WEH_APPR_BU,',
'							:WEH_APPR_PLNT,',
'							:WEH_CRE_BY,',
'							:WEH_CRE_IP_ADDR,',
'							:WEH_CRE_OS_USER,',
'							:WEH_CRE_DATE,',
'							:WEH_UPD_BY,',
'							:WEH_UPD_IP_ADDR,',
'							:WEH_UPD_OS_USER,',
'							:WEH_UPD_DATE,',
'							:WEH_CRE_EMP_ID,',
'							:WEH_UPD_EMP_ID',
'							);',
'elsIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'IF :WEH_DEFLT_FLAG = ''Y'' THEN',
'DECLARE',
'CURSOR c1',
'IS',
'SELECT weh_emp_id',
'  FROM wf_emp_hierarchy',
' WHERE weh_bu		= :GLOBAL_bu',
'   AND weh_emp_id	= :WEH_EMP_ID',
' GROUP BY weh_emp_id; ',
' ',
'CURSOR c2(c_emp_id VARCHAR2) ',
'IS',
'SELECT COUNT(*) v_cnt',
'  FROM wf_emp_hierarchy',
' WHERE weh_bu			= :GLOBAL_bu',
'   AND weh_emp_id	= c_emp_id  ',
'   AND weh_deflt_flag	= ''Y'';',
'',
'	cr2				c2%ROWTYPE;',
'',
'BEGIN',
'',
'FOR cr1 IN c1 ',
'LOOP',
'		OPEN c2(cr1.weh_emp_id);',
'		FETCH c2 INTO cr2;',
'		',
'		IF c2%FOUND THEN',
'	',
'		IF cr2.v_cnt >= 1 THEN',
'				raise_application_error(-20999,''Multiple Authority not allowed for employee''||cr1.weh_emp_id);',
'		END IF;',
'	',
'		END IF;',
'		',
'		CLOSE c2;',
'END LOOP;',
'',
'END;',
'',
'END IF;',
'',
'update WF_EMP_HIERARCHY set 	WEH_EMP_ID 			= :WEH_EMP_ID,',
'										WEH_PAR_EMP_ID 	= :WEH_PAR_EMP_ID,',
'										WEH_DEFLT_FLAG 	= :WEH_DEFLT_FLAG,',
'										WEH_APPR_BU 		= :WEH_APPR_BU,',
'										WEH_APPR_PLNT 		= :WEH_APPR_PLNT,',
'										WEH_UPD_BY 			= :WEH_UPD_BY,',
'										WEH_UPD_IP_ADDR 	= :WEH_UPD_IP_ADDR,',
'										WEH_UPD_OS_USER 	= :WEH_UPD_OS_USER,',
'										WEH_UPD_DATE 		= :WEH_UPD_DATE,',
'										WEH_UPD_EMP_ID		= :WEH_UPD_EMP_ID',
'WHERE WEH_BU = :GLOBAL_BU',
'AND WEH_CRE_BY = :GLOBAL_USER',
'AND ROWID = :ROWID; ',
'',
'elsIF :APEX$ROW_STATUS = ''D'' THEN',
'	',
'	DELETE FROM WF_EMP_HIERARCHY ',
'				WHERE WEH_BU = :GLOBAL_BU',
'				AND WEH_CRE_BY = :GLOBAL_USER',
'				AND ROWID = :ROWID;',
'				',
'END IF;',
'commit;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1019594610142802542
);
wwv_flow_imp.component_end;
end;
/
