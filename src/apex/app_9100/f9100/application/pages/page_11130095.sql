prompt --application/pages/page_11130095
begin
--   Manifest
--     PAGE: 11130095
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
 p_id=>11130095
,p_name=>'Bus. Fun. List'
,p_alias=>'WEB-APPLICATION'
,p_step_title=>'Bus. Fun. List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#addbtn{',
'        color: blue;',
'       ',
'}',
'',
'#savebtn{',
'                color: green;',
'               ',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561203547941500129)
,p_plug_name=>'Bus. Fun.'
,p_static_id=>'bus-fun'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7443201003997769395)
,p_plug_name=>'Bus. Fun.'
,p_static_id=>'bus-fun-2'
,p_region_name=>'ig_line'
,p_parent_plug_id=>wwv_flow_imp.id(7561203547941500129)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       wbf_seq_no,',
'       wbf_bus_fun_id,',
'       wbf_page_no,',
'       wbf_bus_fun_name,',
'       wbf_bus_fun_short_name,',
'       wbf_bus_fun_type,',
'       wbf_par_fun_id,',
'       (SELECT wbf_bus_fun_name',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = a.wbf_par_fun_id) Par_Desc,',
'       wbf_visible,',
'       wbf_icon,',
'       wbf_node_type,',
'       wbf_cre_by,',
'       wbf_cre_ip_addr,',
'       wbf_cre_os_user,',
'       wbf_cre_emp_id,',
'       wbf_cre_date,',
'       wbf_upd_by,',
'       wbf_upd_ip_addr,',
'       wbf_upd_os_user,',
'       wbf_upd_emp_id,',
'       wbf_upd_date,',
'       wbf_srch_flag,',
'       wbf_asgn_to,',
'       wbf_asgn_date,',
'       wbf_asgn_status,',
'       wbf_appl_no,',
'       wbf_std_vert_type,',
'       wbf_vertical_id,',
'       wbf_vert_bus_fun_name,',
'       wbf_bus_fun_narration,',
'       wbf_bus_fun_mis_name,',
'       wbf_form_loc1,',
'       wbf_form_icon,',
'       wbf_form_id,',
'       wbf_active_flag,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>''Delete1',
'  FROM wapl_bus_fun a',
' WHERE ( (INSTR(UPPER(wbf_bus_fun_id), UPPER(:P11130095_BUS_FUN_ID)) > 0)',
'         OR (INSTR(UPPER(wbf_bus_fun_name), UPPER(:P11130095_BUS_FUN_ID)) > 0 )',
'          OR :P11130095_BUS_FUN_ID IS NULL)        ',
'  --AND wbf_par_fun_id IS NOT NULL',
'  AND ( (INSTR(UPPER(wbf_form_id), UPPER(:P11130095_FORM_ID)) > 0 )',
'        OR (INSTR(UPPER(wbf_bus_fun_name), UPPER(:P11130095_FORM_ID)) > 0)',
'        OR :P11130095_FORM_ID IS NULL)',
'  AND (wbf_node_type = :P11130095_TYPE OR :P11130095_TYPE IS NULL)',
'  AND (wbf_visible = :P11130095_NODE OR :P11130095_NODE IS NULL)',
'  AND (wbf_active_flag = :P11130095_ACTIVE OR :P11130095_ACTIVE IS NULL)',
' AND (wbf_bus_fun_id IN',
'           (SELECT wbf_bus_fun_id',
'              FROM (SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE (INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0',
'                             OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0)',
'                           )',
'                       --AND wbf_node_type <> ''MOD''',
'                       --AND wbf_visible = ''Y''',
'                   UNION ALL',
'                   SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE wbf_par_fun_id IN (SELECT wbf_bus_fun_id',
'                                                FROM wapl_bus_fun',
'                                               WHERE(INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0',
'                                                     OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0)',
'                                                    )',
'                                             )',
'                       --AND wbf_node_type <> ''MOD''',
'                       --AND wbf_visible = ''Y''',
'                    UNION ALL',
'                    SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE wbf_par_fun_id IN',
'                              (SELECT wbf_bus_fun_id',
'                                 FROM wapl_bus_fun',
'                                WHERE wbf_par_fun_id IN',
'                                         (SELECT wbf_bus_fun_id',
'                                            FROM wapl_bus_fun',
'                                           WHERE (INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0',
'                                                 OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130095_PAR_BUS_FUN_ID)) > 0)',
'                                               )))',
'                           --AND wbf_node_type <> ''MOD''',
'                           --AND wbf_visible = ''Y''',
'                           ))',
'        OR :P11130095_PAR_BUS_FUN_ID IS NULL)  ',
'        ',
'        '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P11130095_BUS_FUN_ID,P11130095_FORM_ID,P11130095_TYPE,P11130095_PAR_BUS_FUN_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bus. Fun.'
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
 p_id=>wwv_flow_imp.id(7443202747696769398)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7443202258722769398)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812009106181008778)
,p_name=>'DELETE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P11130095_ROWID1'',''&ROWID.''),$s(''P11130095_BUS_FUN_ID_DEL'',''&WBF_BUS_FUN_ID.'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_link_text=>'&DELETE1.'
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
 p_id=>wwv_flow_imp.id(5934877833528688163)
,p_name=>'PAR_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par. Bus. Fun. Name'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7443203788856769399)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6599966327990015660)
,p_name=>'WBF_ACTIVE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_ACTIVE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
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
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812008594292008773)
,p_name=>'WBF_APPL_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_APPL_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Appl. #'
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
 p_id=>wwv_flow_imp.id(5812008367712008771)
,p_name=>'WBF_ASGN_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_ASGN_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wbf Asgn Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(5812008522327008772)
,p_name=>'WBF_ASGN_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_ASGN_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wbf Asgn Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812008268846008770)
,p_name=>'WBF_ASGN_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_ASGN_TO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wbf Asgn To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>250
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
 p_id=>wwv_flow_imp.id(5812006531442008752)
,p_name=>'WBF_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'autocomplete = "off"'
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ITEM_IS_NOT_NULL'
,p_readonly_condition=>'ROWID'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812008994380008777)
,p_name=>'WBF_BUS_FUN_MIS_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_MIS_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Name (Client)'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812006730671008754)
,p_name=>'WBF_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Name (STD)'
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
 p_id=>wwv_flow_imp.id(5812008861165008776)
,p_name=>'WBF_BUS_FUN_NARRATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_NARRATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Reference'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(5812006803538008755)
,p_name=>'WBF_BUS_FUN_SHORT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_SHORT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Name (Client)'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>250
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
 p_id=>wwv_flow_imp.id(5812006898983008756)
,p_name=>'WBF_BUS_FUN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_BUS_FUN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wbf Bus Fun Type'
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
 p_id=>wwv_flow_imp.id(5812007190158008759)
,p_name=>'WBF_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007633635008763)
,p_name=>'WBF_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007527914008762)
,p_name=>'WBF_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007324934008760)
,p_name=>'WBF_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007356507008761)
,p_name=>'WBF_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6192954307071721076)
,p_name=>'WBF_FORM_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_FORM_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Form Icon'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6192954338510721077)
,p_name=>'WBF_FORM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_FORM_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Form ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(6192954174797721075)
,p_name=>'WBF_FORM_LOC1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_FORM_LOC1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Form Path'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(5812007131355008758)
,p_name=>'WBF_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Icon'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(7443214188027769412)
,p_name=>'WBF_NODE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_NODE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Module;MOD,Setup;SET,Transaction;FRM,Analytics;RPT,Report;REP'
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
,p_default_expression=>'FRM'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812006623187008753)
,p_name=>'WBF_PAGE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_PAGE_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Page No.'
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
 p_id=>wwv_flow_imp.id(7443211137335769409)
,p_name=>'WBF_PAR_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_PAR_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Par. Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Par. Bus. Fun.')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6597335263583928459)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812006419648008751)
,p_name=>'WBF_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(5812008186121008769)
,p_name=>'WBF_SRCH_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_SRCH_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wbf Srch Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7443230226130769429)
,p_name=>'WBF_STD_VERT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_STD_VERT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007698297008764)
,p_name=>'WBF_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812008053353008768)
,p_name=>'WBF_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007962186008767)
,p_name=>'WBF_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007816338008765)
,p_name=>'WBF_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812007868340008766)
,p_name=>'WBF_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7443231227251769431)
,p_name=>'WBF_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERTICAL_ID'
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
 p_id=>wwv_flow_imp.id(7443232225117769432)
,p_name=>'WBF_VERT_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERT_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical Description '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5812006960641008757)
,p_name=>'WBF_VISIBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VISIBLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Node'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Main;Y,Sub;N'
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
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7443201515911769396)
,p_internal_uid=>1961239680368158368
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_imp.id(7443201925569769396)
,p_interactive_grid_id=>wwv_flow_imp.id(7443201515911769396)
,p_static_id=>'19612401'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7443202094182769396)
,p_report_id=>wwv_flow_imp.id(7443201925569769396)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482050339156656514)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7443202258722769398)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5951064779560850979)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5934877833528688163)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>230
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967331647150040571)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5812006419648008751)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967332451639040581)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5812006531442008752)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967333425171040587)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5812006623187008753)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967334706129040595)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5812006730671008754)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>236
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967335631379040603)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5812006803538008755)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>174
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967336528978040609)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(5812006898983008756)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967337435083040617)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(5812006960641008757)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967338261898040624)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(5812007131355008758)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967339136861040632)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(5812007190158008759)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967340122773040638)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5812007324934008760)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967340995709040646)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(5812007356507008761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967341933925040657)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(5812007527914008762)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967342748825040667)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(5812007633635008763)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967343565936040678)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(5812007698297008764)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967344467244040687)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(5812007816338008765)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967345370815040695)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(5812007868340008766)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967346306956040701)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(5812007962186008767)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967347227139040709)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(5812008053353008768)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967348126171040717)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(5812008186121008769)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967348992402040726)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(5812008268846008770)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967349837920040737)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(5812008367712008771)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967350785085040746)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(5812008522327008772)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967351643741040754)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5812008594292008773)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967354298817040779)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(5812008861165008776)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967355158117040790)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5812008994380008777)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>316
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967356115726040799)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(5812009106181008778)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6284137921855945979)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6192954174797721075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6284138789580945996)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(6192954307071721076)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6284139660361946004)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6192954338510721077)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6607532878480650667)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(6599966327990015660)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443203152456769399)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7443202747696769398)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443204161906769401)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7443203788856769399)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443211537540769410)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7443211137335769409)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443214556758769412)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7443214188027769412)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443230566824769429)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7443230226130769429)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443231608739769431)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7443231227251769431)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7443232547083769432)
,p_view_id=>wwv_flow_imp.id(7443202094182769396)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7443232225117769432)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>153
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561207952130500173)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(7561204009349500133)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561203671861500130)
,p_plug_name=>'Select LIst'
,p_static_id=>'select-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561205970432500153)
,p_plug_name=>'Tab'
,p_static_id=>'tab'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7571214229263545331)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_parent_plug_id=>wwv_flow_imp.id(7561205970432500153)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7571529584154845456)
,p_plug_name=>'User Access1'
,p_static_id=>'user-access-2'
,p_region_name=>'ig_line5'
,p_parent_plug_id=>wwv_flow_imp.id(7571214229263545331)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUBFA_USER_ID,',
'       WUBFA_BUS_FUN_ID,',
'        (SELECT wbf_bus_fun_name',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wapl_bus_fun_desc, ',
'		 (SELECT wbf_vert_bus_fun_name',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wbf_vert_bus_fun_name,',
'		 (SELECT wbf_node_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wbf_node_type, ',
'       (SELECT wbf_bus_fun_id',
'                                  FROM wapl_bus_fun ',
'                                 WHERE wbf_bus_fun_id IN (SELECT wbf_par_fun_id',
'                                                            FROM wapl_bus_fun ',
'                                                           WHERE wbf_bus_fun_id =WUBFA_BUS_FUN_ID))wbf_par_fun_id,',
'		 /*(SELECT wbf_par_fun_id',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wbf_par_fun_id,*/',
'       (SELECT wbf_std_vert_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wbf_std_vert_type,            ',
'       (SELECT wbf_vertical_id',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID)wbf_vertical_id,',
'       (SELECT ev_vertical_desc wv_vertical_name',
'         FROM erp_vertical',
'		  WHERE ev_vertical_id= WUBFA_BUS_FUN_ID) vertical_DESC ,',
'        (SELECT wbf_bus_fun_name',
'                                  FROM wapl_bus_fun ',
'                                 WHERE wbf_bus_fun_id IN (SELECT wbf_par_fun_id',
'                                                            FROM wapl_bus_fun ',
'                                                           WHERE wbf_bus_fun_id =WUBFA_BUS_FUN_ID))Par_desc,  ',
'		 /* (SELECT wbf_bus_fun_name',
'           FROM wapl_bus_fun',
'			 WHERE WBF_BUS_FUN_ID in (SELECT wbf_par_fun_id',
'                                         FROM wapl_bus_fun',
'                                       WHERE wbf_bus_fun_id  = WUBFA_BUS_FUN_ID))Par_desc,*/',
'       WUBFA_DATE_FROM,',
'       WUBFA_DATE_TO,',
'       WUBFA_CRE_BY,',
'       WUBFA_CRE_IP_ADDR,',
'       WUBFA_CRE_OS_USER,',
'       WUBFA_CRE_EMP_ID,',
'       WUBFA_CRE_DATE,',
'       WUBFA_UPD_BY,',
'       WUBFA_UPD_IP_ADDR,',
'       WUBFA_UPD_OS_USER,',
'       WUBFA_UPD_EMP_ID,',
'       WUBFA_UPD_DATE,',
'       WUBFA_SEQ_NO',
'  from WAPL_USER_BUS_FUN_ACCS',
'  WHERE WUBFA_USER_ID IN (SELECT appluser_id',
'                            FROM appl_users ',
'                           WHERE appluser_bu = :GLOBAL_BU)',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'User Access1'
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
 p_id=>wwv_flow_imp.id(7571531370212845474)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571531465259845475)
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
 p_id=>wwv_flow_imp.id(7572181830139702034)
,p_name=>'PAR_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7571531317706845473)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7572181694891702033)
,p_name=>'VERTICAL_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERTICAL_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical Desc'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(7571531669849845477)
,p_name=>'WAPL_BUS_FUN_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAPL_BUS_FUN_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Bus. Fun.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7572181280012702029)
,p_name=>'WBF_NODE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_NODE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Setup;SET,Module;MOD,Transaction;FRM,Analytics;RPT,Report ;REP'
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
,p_default_expression=>'SET'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7572181435204702030)
,p_name=>'WBF_PAR_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_PAR_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Par.Bus.Fun'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7572181494698702031)
,p_name=>'WBF_STD_VERT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_STD_VERT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Standard;S,Vertical;V'
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
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7572181627344702032)
,p_name=>'WBF_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wbf Vertical Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7571531802897845478)
,p_name=>'WBF_VERT_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERT_BUS_FUN_NAME'
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
 p_id=>wwv_flow_imp.id(7571529893842845459)
,p_name=>'WUBFA_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>' Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Bus. Function')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7660126884491786517)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'APPLUSER_BU'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530234134845462)
,p_name=>'WUBFA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530551566845466)
,p_name=>'WUBFA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wubfa Cre Date'
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(7571530470212845465)
,p_name=>'WUBFA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530297080845463)
,p_name=>'WUBFA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530378925845464)
,p_name=>'WUBFA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571529959835845460)
,p_name=>'WUBFA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>' Eff. From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(7571530041360845461)
,p_name=>'WUBFA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>' Eff. To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(7571531203837845472)
,p_name=>'WUBFA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Seq. No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(7571530723017845467)
,p_name=>'WUBFA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(7571531038167845471)
,p_name=>'WUBFA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wubfa Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(7571530986302845470)
,p_name=>'WUBFA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530762775845468)
,p_name=>'WUBFA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571530889146845469)
,p_name=>'WUBFA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wubfa Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7571529736099845458)
,p_name=>'WUBFA_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7571529678032845457)
,p_internal_uid=>2089567842489234429
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
 p_id=>wwv_flow_imp.id(7572077591068619662)
,p_interactive_grid_id=>wwv_flow_imp.id(7571529678032845457)
,p_static_id=>'20901158'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7572077806715619663)
,p_report_id=>wwv_flow_imp.id(7572077591068619662)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481962691469611036)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7571531465259845475)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572078299533619667)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7571529736099845458)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572079225214619674)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7571529893842845459)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572080106332619679)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7571529959835845460)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572080955664619685)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7571530041360845461)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572081892143619692)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7571530234134845462)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572082655718619698)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7571530297080845463)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572083614514619704)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7571530378925845464)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572084518809619710)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7571530470212845465)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572085395116619717)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7571530551566845466)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572086315385619723)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7571530723017845467)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572087176797619729)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7571530762775845468)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572088117781619735)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7571530889146845469)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572088973222619742)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7571530986302845470)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572089920739619748)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7571531038167845471)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572090756859619753)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7571531203837845472)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>49
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572091703426619759)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7571531317706845473)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572092567871619763)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7571531370212845474)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572187651770705521)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7571531669849845477)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572188569494705528)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7571531802897845478)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>297
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572189533060705534)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7572181280012702029)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572190386010705540)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7572181435204702030)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572191330074705545)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7572181494698702031)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572192226893705551)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7572181627344702032)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572193054597705557)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7572181694891702033)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7572193946260705563)
,p_view_id=>wwv_flow_imp.id(7572077806715619663)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7572181830139702034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7572182041318702037)
,p_plug_name=>'User Access'
,p_static_id=>'user-access-3'
,p_parent_plug_id=>wwv_flow_imp.id(7571214229263545331)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID, ',
'      APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'		 DECODE(APPLUSER_USER_TYPE,''R'',''ERP Admin'',''E'',''ERP User'',''U'',''ESS User'',''P'',''POS User'',''C'',''Customer'',''S'',''Supplier'') MGMT_TYPE,',
'		 DECODE(APPLUSER_MGMT_TYPE,''S'',''Standard'',''M'',''Management'')USER_TYPE,',
'       APPLUSER_EFF_FROM,',
'       APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name           ',
'         FROM employees                                                                            ',
'        WHERE emp_bu = APPLUSER_BU                                                                  ',
'          AND emp_emp_id = APPLUSER_EMP_ID)emp_desc,',
'		(SELECT hrpos_pos_name1',
'         FROM hr_positions',
'        WHERE hrpos_bu = APPLUSER_BU',
'          AND hrpos_pos_id = APPLUSER_POS_ID)pos_desc,',
'		(SELECT dept_name1',
'         FROM departments',
'        WHERE dept_bu = APPLUSER_BU',
'          AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'',
'',
'       APPLUSER_STATUS,',
'       APPLUSER_ACTIVE_DATE,',
'       APPLUSER_DELETE_DATE,',
'       APPLUSER_LOCK_CHK,',
'       APPLUSER_CUST_ID,',
'       APPLUSER_SUPLR_ID,',
'       APPLUSER_EXCEL_OPOFF_FLAG,',
'       APPLUSER_PW_LUD,',
'       APPLUSER_SYS_ADMIN,',
'       APPLUSER_PWD_EXP_DUE,',
'       APPLUSER_PW_EXP_RQRD,',
'       APPLUSER_PW_EXP_DAYS,',
'       APPLUSER_SEARCH_LOV,',
'       APPLUSER_LABEL_CTRL,',
'       APPLUSER_LABEL_LANG,',
'       APPLUSER_MOB_USER,',
'       APPLUSER_OTP,',
'       APPLUSER_OTP_EXPIRE,',
'       APPLUSER_MIS_DEPT_TYPE,',
'       APPLUSER_CONFG_COLOR,',
'       APPLUSER_ENTRY_COLOR,',
'       APPLUSER_QUERY_COLOR,',
'       APPLUSER_REPORT_COLOR,',
'       APPLUSER_OTHERS_COLOR,',
'       APPLUSER_PREV_LOG_IN_DATE,',
'       APPLUSER_CURR_LOG_IN_DATE,',
'       APPLUSER_CRE_BY,',
'       APPLUSER_CRE_IP_ADDR,',
'       APPLUSER_CRE_OS_USER,',
'       APPLUSER_CRE_DATE,',
'       APPLUSER_UPD_BY,',
'       APPLUSER_UPD_IP_ADDR,',
'       APPLUSER_UPD_OS_USER,',
'       APPLUSER_UPD_DATE,',
'       APPLUSER_MOBILE_USER,',
'       APPLUSER_CRE_EMP_ID,',
'       APPLUSER_UPD_EMP_ID,',
'       APPLUSER_APPR_USER,',
'       APPLUSER_CSD_USER,',
'       APPLUSER_CUST_PORT_USER,',
'       APPLUSER_DASHBOARD_USER,',
'       APPLUSER_ERP_ADMIN_USER,',
'       APPLUSER_ERP_USER,',
'       APPLUSER_ESS_USER,',
'       APPLUSER_HRMS_USER,',
'       APPLUSER_MKTG_USER,',
'       APPLUSER_PROD_USER,',
'       APPLUSER_SMW_USER,',
'       APPLUSER_SUBCONTR_PORT_USER,',
'       APPLUSER_SUPLR_PORT_USER,',
'       APPLUSER_SYS_ADMIN_USER,',
'       APPLUSER_DEVICE_UUID,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_TYPE,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       APPLUSER_DEPT_ID,',
'       APPLUSER_SHOP_ID,',
'       APPLUSER_COUNTER_ID,',
'       APPLUSER_PWD_EXPIRED,',
'       APPLUSER_APEX_LANG',
'  from APPL_USERS',
'  where APPLUSER_BU =:global_bu',
'',
'',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7572182185867702038)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>2090220350324091010
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183032638702046)
,p_db_column_name=>'APPLUSER_ACTIVE_DATE'
,p_display_order=>160
,p_column_identifier=>'H'
,p_column_label=>'Appluser Active Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673209026983858)
,p_db_column_name=>'APPLUSER_APEX_LANG'
,p_display_order=>740
,p_column_identifier=>'BR'
,p_column_label=>'Appluser Apex Lang'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670651685983833)
,p_db_column_name=>'APPLUSER_APPR_USER'
,p_display_order=>520
,p_column_identifier=>'AS'
,p_column_label=>'Appluser Appr User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182238431702039)
,p_db_column_name=>'APPLUSER_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Appluser Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184905208702065)
,p_db_column_name=>'APPLUSER_CONFG_COLOR'
,p_display_order=>340
,p_column_identifier=>'AA'
,p_column_label=>'Appluser Confg Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672888562983855)
,p_db_column_name=>'APPLUSER_COUNTER_ID'
,p_display_order=>720
,p_column_identifier=>'BO'
,p_column_label=>'Appluser Counter Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185610861702072)
,p_db_column_name=>'APPLUSER_CRE_BY'
,p_display_order=>410
,p_column_identifier=>'AH'
,p_column_label=>'Appluser Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185919140702075)
,p_db_column_name=>'APPLUSER_CRE_DATE'
,p_display_order=>440
,p_column_identifier=>'AK'
,p_column_label=>'Appluser Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670467682983831)
,p_db_column_name=>'APPLUSER_CRE_EMP_ID'
,p_display_order=>500
,p_column_identifier=>'AQ'
,p_column_label=>'Appluser Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185728256702073)
,p_db_column_name=>'APPLUSER_CRE_IP_ADDR'
,p_display_order=>420
,p_column_identifier=>'AI'
,p_column_label=>'Appluser Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185779129702074)
,p_db_column_name=>'APPLUSER_CRE_OS_USER'
,p_display_order=>430
,p_column_identifier=>'AJ'
,p_column_label=>'Appluser Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670772480983834)
,p_db_column_name=>'APPLUSER_CSD_USER'
,p_display_order=>530
,p_column_identifier=>'AT'
,p_column_label=>'Appluser Csd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185444091702071)
,p_db_column_name=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_order=>400
,p_column_identifier=>'AG'
,p_column_label=>'Appluser Curr Log In Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183353665702050)
,p_db_column_name=>'APPLUSER_CUST_ID'
,p_display_order=>190
,p_column_identifier=>'L'
,p_column_label=>'Appluser Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670852092983835)
,p_db_column_name=>'APPLUSER_CUST_PORT_USER'
,p_display_order=>540
,p_column_identifier=>'AU'
,p_column_label=>'Appluser Cust Port User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670990505983836)
,p_db_column_name=>'APPLUSER_DASHBOARD_USER'
,p_display_order=>550
,p_column_identifier=>'AV'
,p_column_label=>'Appluser Dashboard User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183039253702047)
,p_db_column_name=>'APPLUSER_DELETE_DATE'
,p_display_order=>170
,p_column_identifier=>'I'
,p_column_label=>'Appluser Delete Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672691351983853)
,p_db_column_name=>'APPLUSER_DEPT_ID'
,p_display_order=>110
,p_column_identifier=>'BM'
,p_column_label=>'Department '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672061862983847)
,p_db_column_name=>'APPLUSER_DEVICE_UUID'
,p_display_order=>660
,p_column_identifier=>'BG'
,p_column_label=>'Appluser Device Uuid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182596907702042)
,p_db_column_name=>'APPLUSER_EFF_FROM'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>' Eff. From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182654008702043)
,p_db_column_name=>'APPLUSER_EFF_TO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672174418983848)
,p_db_column_name=>'APPLUSER_EMAIL_ID'
,p_display_order=>670
,p_column_identifier=>'BH'
,p_column_label=>'Appluser Email Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182791262702044)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185002894702066)
,p_db_column_name=>'APPLUSER_ENTRY_COLOR'
,p_display_order=>350
,p_column_identifier=>'AB'
,p_column_label=>'Appluser Entry Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671041790983837)
,p_db_column_name=>'APPLUSER_ERP_ADMIN_USER'
,p_display_order=>560
,p_column_identifier=>'AW'
,p_column_label=>'Appluser Erp Admin User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671204429983838)
,p_db_column_name=>'APPLUSER_ERP_USER'
,p_display_order=>570
,p_column_identifier=>'AX'
,p_column_label=>'Appluser Erp User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671327284983839)
,p_db_column_name=>'APPLUSER_ESS_USER'
,p_display_order=>580
,p_column_identifier=>'AY'
,p_column_label=>'Appluser Ess User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183617544702052)
,p_db_column_name=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_order=>210
,p_column_identifier=>'N'
,p_column_label=>'Appluser Excel Opoff Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671407594983840)
,p_db_column_name=>'APPLUSER_HRMS_USER'
,p_display_order=>590
,p_column_identifier=>'AZ'
,p_column_label=>'Appluser Hrms User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182366227702040)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User '
,p_column_link=>'f?p=&APP_ID.:11130095:&SESSION.::&DEBUG.:Y,:P11130095_USER_ID:#APPLUSER_ID#'
,p_column_linktext=>'#APPLUSER_ID#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184242247702059)
,p_db_column_name=>'APPLUSER_LABEL_CTRL'
,p_display_order=>280
,p_column_identifier=>'U'
,p_column_label=>'Appluser Label Ctrl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184387290702060)
,p_db_column_name=>'APPLUSER_LABEL_LANG'
,p_display_order=>290
,p_column_identifier=>'V'
,p_column_label=>'Appluser Label Lang'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183140973702048)
,p_db_column_name=>'APPLUSER_LOCK_CHK'
,p_display_order=>180
,p_column_identifier=>'J'
,p_column_label=>'Appluser Lock Chk'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184775060702064)
,p_db_column_name=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_order=>330
,p_column_identifier=>'Z'
,p_column_label=>'Appluser Mis Dept Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671508690983841)
,p_db_column_name=>'APPLUSER_MKTG_USER'
,p_display_order=>600
,p_column_identifier=>'BA'
,p_column_label=>'Appluser Mktg User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672241313983849)
,p_db_column_name=>'APPLUSER_MOBILE_NO'
,p_display_order=>680
,p_column_identifier=>'BI'
,p_column_label=>'Appluser Mobile No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670349420983830)
,p_db_column_name=>'APPLUSER_MOBILE_USER'
,p_display_order=>490
,p_column_identifier=>'AP'
,p_column_label=>'Appluser Mobile User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184462909702061)
,p_db_column_name=>'APPLUSER_MOB_USER'
,p_display_order=>300
,p_column_identifier=>'W'
,p_column_label=>'Appluser Mob User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185324398702069)
,p_db_column_name=>'APPLUSER_OTHERS_COLOR'
,p_display_order=>380
,p_column_identifier=>'AE'
,p_column_label=>'Appluser Others Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184547987702062)
,p_db_column_name=>'APPLUSER_OTP'
,p_display_order=>310
,p_column_identifier=>'X'
,p_column_label=>'Appluser Otp'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184642050702063)
,p_db_column_name=>'APPLUSER_OTP_EXPIRE'
,p_display_order=>320
,p_column_identifier=>'Y'
,p_column_label=>'Appluser Otp Expire'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672535029983851)
,p_db_column_name=>'APPLUSER_PARTY_ID'
,p_display_order=>700
,p_column_identifier=>'BK'
,p_column_label=>'Appluser Party Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672411460983850)
,p_db_column_name=>'APPLUSER_PARTY_TYPE'
,p_display_order=>690
,p_column_identifier=>'BJ'
,p_column_label=>'Appluser Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182493734702041)
,p_db_column_name=>'APPLUSER_PASSWORD'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Appluser Password'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672591905983852)
,p_db_column_name=>'APPLUSER_POS_ID'
,p_display_order=>90
,p_column_identifier=>'BL'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185388363702070)
,p_db_column_name=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_order=>390
,p_column_identifier=>'AF'
,p_column_label=>'Appluser Prev Log In Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671558144983842)
,p_db_column_name=>'APPLUSER_PROD_USER'
,p_display_order=>610
,p_column_identifier=>'BB'
,p_column_label=>'Appluser Prod User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672939285983856)
,p_db_column_name=>'APPLUSER_PWD_EXPIRED'
,p_display_order=>730
,p_column_identifier=>'BP'
,p_column_label=>'Appluser Pwd Expired'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183863969702055)
,p_db_column_name=>'APPLUSER_PWD_EXP_DUE'
,p_display_order=>240
,p_column_identifier=>'Q'
,p_column_label=>'Appluser Pwd Exp Due'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184039396702057)
,p_db_column_name=>'APPLUSER_PW_EXP_DAYS'
,p_display_order=>260
,p_column_identifier=>'S'
,p_column_label=>'Appluser Pw Exp Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184015592702056)
,p_db_column_name=>'APPLUSER_PW_EXP_RQRD'
,p_display_order=>250
,p_column_identifier=>'R'
,p_column_label=>'Appluser Pw Exp Rqrd'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183711719702053)
,p_db_column_name=>'APPLUSER_PW_LUD'
,p_display_order=>220
,p_column_identifier=>'O'
,p_column_label=>'Appluser Pw Lud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185037328702067)
,p_db_column_name=>'APPLUSER_QUERY_COLOR'
,p_display_order=>360
,p_column_identifier=>'AC'
,p_column_label=>'Appluser Query Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185137589702068)
,p_db_column_name=>'APPLUSER_REPORT_COLOR'
,p_display_order=>370
,p_column_identifier=>'AD'
,p_column_label=>'Appluser Report Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572184208793702058)
,p_db_column_name=>'APPLUSER_SEARCH_LOV'
,p_display_order=>270
,p_column_identifier=>'T'
,p_column_label=>'Appluser Search Lov'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572672819896983854)
,p_db_column_name=>'APPLUSER_SHOP_ID'
,p_display_order=>710
,p_column_identifier=>'BN'
,p_column_label=>'Appluser Shop Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671674767983843)
,p_db_column_name=>'APPLUSER_SMW_USER'
,p_display_order=>620
,p_column_identifier=>'BC'
,p_column_label=>'Appluser Smw User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572182873418702045)
,p_db_column_name=>'APPLUSER_STATUS'
,p_display_order=>150
,p_column_identifier=>'G'
,p_column_label=>'Appluser Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671763357983844)
,p_db_column_name=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_order=>630
,p_column_identifier=>'BD'
,p_column_label=>'Appluser Subcontr Port User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183466532702051)
,p_db_column_name=>'APPLUSER_SUPLR_ID'
,p_display_order=>200
,p_column_identifier=>'M'
,p_column_label=>'Appluser Suplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671902904983845)
,p_db_column_name=>'APPLUSER_SUPLR_PORT_USER'
,p_display_order=>640
,p_column_identifier=>'BE'
,p_column_label=>'Appluser Suplr Port User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572183779230702054)
,p_db_column_name=>'APPLUSER_SYS_ADMIN'
,p_display_order=>230
,p_column_identifier=>'P'
,p_column_label=>'Appluser Sys Admin'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572671972475983846)
,p_db_column_name=>'APPLUSER_SYS_ADMIN_USER'
,p_display_order=>650
,p_column_identifier=>'BF'
,p_column_label=>'Appluser Sys Admin User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572185954600702076)
,p_db_column_name=>'APPLUSER_UPD_BY'
,p_display_order=>450
,p_column_identifier=>'AL'
,p_column_label=>'Appluser Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670311793983829)
,p_db_column_name=>'APPLUSER_UPD_DATE'
,p_display_order=>480
,p_column_identifier=>'AO'
,p_column_label=>'Appluser Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572670604634983832)
,p_db_column_name=>'APPLUSER_UPD_EMP_ID'
,p_display_order=>510
,p_column_identifier=>'AR'
,p_column_label=>'Appluser Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572186086194702077)
,p_db_column_name=>'APPLUSER_UPD_IP_ADDR'
,p_display_order=>460
,p_column_identifier=>'AM'
,p_column_label=>'Appluser Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572186179169702078)
,p_db_column_name=>'APPLUSER_UPD_OS_USER'
,p_display_order=>470
,p_column_identifier=>'AN'
,p_column_label=>'Appluser Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673472822983861)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>120
,p_column_identifier=>'BU'
,p_column_label=>'Department   Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673318773983859)
,p_db_column_name=>'EMP_DESC'
,p_display_order=>70
,p_column_identifier=>'BS'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673561117983862)
,p_db_column_name=>'MGMT_TYPE'
,p_display_order=>130
,p_column_identifier=>'BV'
,p_column_label=>'Tree Node Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673362761983860)
,p_db_column_name=>'POS_DESC'
,p_display_order=>100
,p_column_identifier=>'BT'
,p_column_label=>'Position Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673737841983864)
,p_db_column_name=>'ROWID'
,p_display_order=>750
,p_column_identifier=>'BX'
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
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7572673715294983863)
,p_db_column_name=>'USER_TYPE'
,p_display_order=>140
,p_column_identifier=>'BW'
,p_column_label=>' Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7573014493347018163)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20910527'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'APPLUSER_ID:USER_TYPE:MGMT_TYPE:EMP_DESC:APPLUSER_POS_ID:POS_DESC:APPLUSER_DEPT_ID:DEPT_NAME:APPLUSER_EFF_FROM:APPLUSER_EFF_TO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561204009349500133)
,p_plug_name=>'Vertical '
,p_static_id=>'vertical'
,p_parent_plug_id=>wwv_flow_imp.id(7561205970432500153)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561204060202500134)
,p_plug_name=>'Vertical Bus.Fun.Asso'
,p_static_id=>'vertical-bus-fun-asso'
,p_region_name=>'ig_line1'
,p_parent_plug_id=>wwv_flow_imp.id(7561204009349500133)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WVBFA_VERTICAL_ID,',
'       WVBFA_BUS_FUN_ID,',
'		 (SELECT wbf_bus_fun_name',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wapl_bus_fun_desc, ',
'		 (SELECT wbf_vert_bus_fun_name',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wbf_vert_bus_fun_name,',
'		 (SELECT wbf_node_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wbf_node_type, ',
'		 (SELECT wbf_par_fun_id',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wbf_par_fun_id,',
'       (SELECT wbf_std_vert_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wbf_std_vert_type,            ',
'       (SELECT wbf_vertical_id',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WVBFA_BUS_FUN_ID)wbf_vertical_id,',
'       (SELECT ev_vertical_desc wv_vertical_name',
'         FROM erp_vertical',
'		  WHERE ev_vertical_id= WVBFA_VERTICAL_ID) vertical_DESC ,',
'		  (SELECT wbf_bus_fun_name',
'           FROM wapl_bus_fun',
'			 WHERE WBF_BUS_FUN_ID=WVBFA_BUS_FUN_ID)Par_desc,',
'       WVBFA_CRE_BY,',
'       WVBFA_CRE_IP_ADDR,',
'       WVBFA_CRE_OS_USER,',
'       WVBFA_CRE_EMP_ID,',
'       WVBFA_CRE_DATE,',
'       WVBFA_UPD_BY,',
'       WVBFA_UPD_IP_ADDR,',
'       WVBFA_UPD_OS_USER,',
'       WVBFA_UPD_EMP_ID,',
'       WVBFA_UPD_DATE,',
'       WVBFA_SEQ_NO,',
'		 ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>''CANCEL_SCH',
'  from WAPL_VERT_BUS_FUN_ASSO',
'  where WVBFA_VERTICAL_ID =:P11130095_VERTICAL_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P11130095_VERTICAL_ID'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Vertical Bus.Fun.Asso'
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
 p_id=>wwv_flow_imp.id(7561205721107500150)
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
 p_id=>wwv_flow_imp.id(7561205766609500151)
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
 p_id=>wwv_flow_imp.id(7567787460987578531)
,p_name=>'CANCEL_SCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCEL_SCH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P11130095_ROWID2'',''&WVBFA_VERTICAL_ID'');apex.submit(''DELETE'');'
,p_link_text=>'&CANCEL_SCH.'
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
 p_id=>wwv_flow_imp.id(7561206997276500163)
,p_name=>'PAR_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7561204319861500136)
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
 p_id=>wwv_flow_imp.id(7561206837647500162)
,p_name=>'VERTICAL_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERTICAL_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(7561206796208500161)
,p_name=>'WAPL_BUS_FUN_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAPL_BUS_FUN_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Display Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7561206396160500157)
,p_name=>'WBF_NODE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_NODE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Module;MOD,Setup; SET,Transaction;FRM,Analytics;RPT,Report;REP'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561206531983500158)
,p_name=>'WBF_PAR_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_PAR_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Par.Bus.Fun'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561206535962500159)
,p_name=>'WBF_STD_VERT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_STD_VERT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Vertical;V,Standard;S'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561206696268500160)
,p_name=>'WBF_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561206269555500156)
,p_name=>'WBF_VERT_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERT_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'tabindex="-1" READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7561204468844500138)
,p_name=>'WVBFA_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Bus. Fun. '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Bus. Fun.')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7568323044868821731)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'WVBFA_VERTICAL_ID'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204607617500139)
,p_name=>'WVBFA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204991449500143)
,p_name=>'WVBFA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wvbfa Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204923893500142)
,p_name=>'WVBFA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204646072500140)
,p_name=>'WVBFA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Cre Ip Addr'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204762970500141)
,p_name=>'WVBFA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Cre Os User'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561205624299500149)
,p_name=>'WVBFA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq. '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(7561205052229500144)
,p_name=>'WVBFA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(7561205462694500148)
,p_name=>'WVBFA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wvbfa Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(7561205415324500147)
,p_name=>'WVBFA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561205201699500145)
,p_name=>'WVBFA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Upd Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561205239818500146)
,p_name=>'WVBFA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Upd Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561204411886500137)
,p_name=>'WVBFA_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WVBFA_VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wvbfa Vertical Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7561204164931500135)
,p_internal_uid=>2079242329387889107
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
 p_id=>wwv_flow_imp.id(7561344838618668751)
,p_interactive_grid_id=>wwv_flow_imp.id(7561204164931500135)
,p_static_id=>'20793831'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7561345078394668751)
,p_report_id=>wwv_flow_imp.id(7561344838618668751)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481970991242611062)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7561205766609500151)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5483262927968308405)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7567787460987578531)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561345634684668756)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7561204319861500136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561346437422668763)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7561204411886500137)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561347352932668770)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7561204468844500138)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561348239715668774)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7561204607617500139)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561349151705668782)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7561204646072500140)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561350057456668787)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7561204762970500141)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561350897982668806)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7561204923893500142)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561351833388668812)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7561204991449500143)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561352636522668817)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7561205052229500144)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561353599735668823)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7561205201699500145)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561354524076668829)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7561205239818500146)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561355419644668835)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7561205415324500147)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561356295766668842)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7561205462694500148)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561357173938668846)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7561205624299500149)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561383634783694373)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7561205721107500150)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562465293262052759)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7561206269555500156)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562466659925052763)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7561206396160500157)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562468058073052768)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7561206531983500158)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562469487849052771)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7561206535962500159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562470891552052778)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7561206696268500160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7563588033606571220)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7561206796208500161)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>207
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7563809781815679995)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7561206837647500162)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>358
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7563811138880680003)
,p_view_id=>wwv_flow_imp.id(7561345078394668751)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7561206997276500163)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>273
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7259418913202571176)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_button_name=>'add_Line'
,p_static_id=>'add-line'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Line'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:CR,86::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7567788147259578538)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7561204060202500134)
,p_button_name=>'Add_Line2'
,p_static_id=>'add-line-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Line2'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7572674377368983870)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_button_name=>'Add_Line5'
,p_static_id=>'add-line-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Line5'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7567790480441578561)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_button_name=>'Copy'
,p_static_id=>'copy'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copy'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1113009501:&SESSION.::&DEBUG.::P1113009501_BL_TO_VERT_ID,P1113009501_ANALYTICS,P1113009501_BL_TO_VERT_DESC,P1113009501_REPORTS,P1113009501_SETUP,P1113009501_TRANSACTIONS,P1113009501_STD_VERT_TYPE,P1113009501_BL_BUS_FUN_VERT:&P11130095_VERTICAL_ID.,&P11130095_ANALYTICS.,&P11130095_VERTICAL_DESC.,&P11130095_REPORTS.,&P11130095_SETUP.,&P11130095_TRANSACTIONS.,&P11130095_STD_VERT_TYPE.,&P11130095_BL_BUS_FUN_VERT.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7579147060589752777)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7561204060202500134)
,p_button_name=>'Delete_all1'
,p_static_id=>'delete-all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete All'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7579146982906752776)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_button_name=>'Delete_All'
,p_static_id=>'delete-all-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete All'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6545450495034346367)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7443201003997769395)
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
 p_id=>wwv_flow_imp.id(7572674547679983872)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_button_name=>'Download5'
,p_static_id=>'download-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download5'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6500234953792867257)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_button_name=>'FIND'
,p_static_id=>'find'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:11130004:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7572673890519983865)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7572182041318702037)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.: 1113009502:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7575586972821081750)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7572182041318702037)
,p_button_name=>'Load_All'
,p_static_id=>'load-all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load All'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949306045478062565)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_button_name=>'Load_new'
,p_static_id=>'load-new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.: 111326009501:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6545450422548346366)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:11130095:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7446617791554902729)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_button_name=>'Save_Line'
,p_static_id=>'save-line'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Line'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7567788374923578540)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7561204060202500134)
,p_button_name=>'Save_Line2'
,p_static_id=>'save-line-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Line2'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7572674500769983871)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_button_name=>'Save_Line5'
,p_static_id=>'save-line-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Line5'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593320825686119461)
,p_name=>'P11130095_ACTIVE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791577874578572)
,p_name=>'P11130095_ANALYTICS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7634527566398718533)
,p_name=>'P11130095_APPLUSER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7572182041318702037)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790741120578564)
,p_name=>'P11130095_BL_BUS_FUN_VERT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'B'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791040601578567)
,p_name=>'P11130095_BL_FROM_VERT_DESC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791007230578566)
,p_name=>'P11130095_BL_FROM_VERT_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791285685578569)
,p_name=>'P11130095_BL_TO_VERT_DESC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791208063578568)
,p_name=>'P11130095_BL_TO_VERT_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500235110496867258)
,p_name=>'P11130095_BUS_FUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318039583119434)
,p_name=>'P11130095_BUS_FUN_ID_DEL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7561203856346500132)
,p_name=>'P11130095_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7561203671861500130)
,p_item_default=>'WA'
,p_prompt=>'Filter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Web Application;WA,Vertical ;V'
,p_cHeight=>1
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500235305589867260)
,p_name=>'P11130095_FORM_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593320660416119460)
,p_name=>'P11130095_NODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500235201106867259)
,p_name=>'P11130095_PAR_BUS_FUN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791644927578573)
,p_name=>'P11130095_REPORTS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7561208484216500178)
,p_name=>'P11130095_ROWID1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567787733216578533)
,p_name=>'P11130095_ROWID2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7561204060202500134)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791393216578570)
,p_name=>'P11130095_SETUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567790926234578565)
,p_name=>'P11130095_STD_VERT_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'S'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567791517226578571)
,p_name=>'P11130095_TRANSACTIONS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500235389238867261)
,p_name=>'P11130095_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7443201003997769395)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7592420210563319538)
,p_name=>'P11130095_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7571529584154845456)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7561207198834500165)
,p_name=>'P11130095_VERTICAL_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_prompt=>'&nbsp'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7561207044876500164)
,p_name=>'P11130095_VERTICAL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7561207952130500173)
,p_prompt=>'Vertical '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BUS_FUN_VERT'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
  'title', 'Vertical',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446619297759902744)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Appl.#'
,p_static_id=>'appl'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_APPL_NO IS NULL THEN',
'	 RETURN(''Application No. should not be null.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_APPL_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446618542878902737)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Bus. Fun.'
,p_static_id=>'bus-fun'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_BUS_FUN_ID IS NULL AND :WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Bus. Fun. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_BUS_FUN_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446618658025902738)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Business Function(MIS)'
,p_static_id=>'business-function-mis'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_BUS_FUN_NAME IS NULL THEN',
'	 RETURN(''Description must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_BUS_FUN_MIS_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446618436021902736)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Business Function(Std.)'
,p_static_id=>'business-function-std'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_BUS_FUN_NAME IS NULL THEN',
'	 RETURN(''Description must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_BUS_FUN_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7554926031151502271)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_CLIENT_ID IS NULL THEN',
'	 RETURN(''Client must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_associated_column=>'WBF_CLIENT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7554926113408502272)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>110
,p_validation=>'WBF_ICON'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must be entered.'
,p_validation_condition_type=>'NEVER'
,p_associated_column=>'WBF_ICON'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7554926223093502273)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'New_2'
,p_static_id=>'new-3'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_BUS_FUN_NARRATION IS NULL THEN',
'	 RETURN(''Caption must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_BUS_FUN_NARRATION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7567788106143578537)
,p_tabular_form_region_id=>wwv_flow_imp.id(7561204060202500134)
,p_validation_name=>'New_3'
,p_static_id=>'new-4'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WVBFA_SEQ_NO IS NULL THEN',
'	 RAISE_APPLICATION_ERROR(-20999,''Seq. No. should not be null.'');',
'END IF;',
'',
'IF :WVBFA_SEQ_NO < 0 THEN',
'	 RAISE_APPLICATION_ERROR(-20999,''Seq. No. should not be negative.'');',
'END IF;',
'',
'IF :WVBFA_SEQ_NO = 0 THEN',
'	 RAISE_APPLICATION_ERROR(-20999,''Seq. No. should be greater than Zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WVBFA_SEQ_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7572673951070983866)
,p_tabular_form_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_validation_name=>'New_4'
,p_static_id=>'new-5'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WUBFA_BUS_FUN_ID IS NULL THEN',
'	 RETURN(''Bus. Fun. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUBFA_BUS_FUN_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7572674040901983867)
,p_tabular_form_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_validation_name=>'New_5'
,p_static_id=>'new-6'
,p_validation_sequence=>150
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WUBFA_DATE_FROM IS NULL THEN',
'	 RETURN(''Effective From must be entered.'');',
'END IF;',
'',
'IF TO_DATE(:WUBFA_DATE_FROM) > TRUNC(SYSDATE) THEN',
'	 RETURN(''Effective From should be less than or equal to Current Date.'');',
'END IF;',
'',
'IF TO_DATE(:WUBFA_DATE_FROM) > TO_DATE(:WUBFA_DATE_TO) THEN',
'	 RETURN(''Effective From should be less than or equal to Effective To.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUBFA_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7572674142270983868)
,p_tabular_form_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_validation_name=>'New_6'
,p_static_id=>'new-7'
,p_validation_sequence=>160
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WUBFA_DATE_TO IS NULL THEN',
'	 RETURN(''Effective To must be entered.'');',
'END IF;',
'',
'IF TO_DATE(:WUBFA_DATE_FROM) > TO_DATE(:WUBFA_DATE_TO) THEN',
'	 RETURN(''Effective To should be greater than or equal to Effective From.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUBFA_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7572674291819983869)
,p_tabular_form_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_validation_name=>'New_7'
,p_static_id=>'new-8'
,p_validation_sequence=>170
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WUBFA_SEQ_NO IS NULL THEN',
'	 RETURN(''Seq. No. should not be null.'');',
'END IF;',
'',
'IF :WUBFA_SEQ_NO < 0 THEN',
'	 RETURN(''Seq. No. should not be negative.'');',
'END IF;',
'',
'IF :WUBFA_SEQ_NO = 0 THEN',
'	 RETURN(''Seq. No. should be greater than Zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUBFA_SEQ_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446618973650902741)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Page No.'
,p_static_id=>'page-no'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_PAGE_NO IS NULL AND :WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Page No. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_PAGE_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446619056186902742)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Par.Bus.Fun.'
,p_static_id=>'par-bus-fun'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_PAR_FUN_ID IS NULL AND :WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Par. Bus. Fun. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_PAR_FUN_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7446619164633902743)
,p_tabular_form_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_validation_name=>'Seq.No.'
,p_static_id=>'seq-no'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBF_SEQ_NO IS NULL THEN',
'	 RETURN(''Seq. No. should not be null.'');',
'END IF;',
'',
'IF :WBF_SEQ_NO < 0 THEN',
'	 RETURN(''Seq. No. should not be negative.'');',
'END IF;',
'',
'IF :WBF_SEQ_NO = 0 THEN',
'	 RETURN(''Seq. No. should be greater than Zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WBF_SEQ_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6545450591734346368)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6545450495034346367)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6545450734006346369)
,p_event_id=>wwv_flow_imp.id(6545450591734346368)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7634527242057718530)
,p_name=>'drill_down'
,p_static_id=>'drill-down'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7572182041318702037)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7634527390899718531)
,p_event_id=>wwv_flow_imp.id(7634527242057718530)
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
    '      i_empids = model.getValue( this.data.selectedRecords[i], "APPLUSER_ID") ;',
    '     }',
    'apex.item( "P11130095_USER_ID" ).setValue (i_empids); ',
    '',
    '',
    '',
    ' ')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7634527448790718532)
,p_event_id=>wwv_flow_imp.id(7634527242057718530)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7554926335342502274)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_triggering_element=>'WBF_BUS_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7554926340886502275)
,p_event_id=>wwv_flow_imp.id(7554926335342502274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WBF_PAGE_NO',
  'items_to_submit', 'WBF_BUS_FUN_ID,WBF_NODE_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WBF_BUS_FUN_ID IS NOT NULL AND :WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
    '	 ',
    '	 DECLARE',
    '	 	  v_letter						VARCHAR2(100);',
    '	 	  v_form_no						VARCHAR2(150);',
    '	 BEGIN',
    '      ',
    '      FOR i IN 1..LENGTH(:WBF_BUS_FUN_ID)	  ',
    '      LOOP',
    '      	 ',
    '      	 v_letter := UPPER(SUBSTR(:WBF_BUS_FUN_ID, i, 1));',
    '      	 ',
    '      	 IF ASCII(v_letter) NOT BETWEEN 48 AND 57 THEN',
    '      	 	  v_form_no := v_form_no||TO_CHAR(ASCII(v_letter) - 64);',
    '      	 ELSE',
    '      	 	  v_form_no := v_form_no||v_letter;',
    '      	 END IF;',
    '      	 ',
    '      END LOOP i;',
    '      	 ',
    '      :WBF_PAGE_NO := v_form_no;',
    '	 	  ',
    '	 END;',
    '',
    'ELSE',
    '   :WBF_PAGE_NO := NULL;      	 	',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7561207635666500170)
,p_name=>'New_3'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11130095_VERTICAL_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7561207746351500171)
,p_event_id=>wwv_flow_imp.id(7561207635666500170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P11130095_VERTICAL_DESC',
  'items_to_submit', 'P11130095_VERTICAL_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P11130095_VERTICAL_ID IS NOT NULL THEN',
    '   ',
    '   DECLARE',
    '   	  ',
    '   	  CURSOR c1',
    '   	      IS',
    '   	  SELECT ev_vertical_desc,',
    '             ev_vertical_id',
    '        FROM erp_vertical ',
    '       WHERE ev_vertical_id = :P11130095_VERTICAL_ID;',
    '       ',
    '       cr1															c1%ROWTYPE; ',
    '   	  ',
    '   BEGIN',
    '      ',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '         ',
    '         IF c1%FOUND THEN',
    '         	  :P11130095_VERTICAL_DESC := cr1.ev_vertical_desc;',
    '         END IF;',
    '         ',
    '      CLOSE c1;',
    '      	',
    '   END;',
    '   ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7561207835803500172)
,p_event_id=>wwv_flow_imp.id(7561207635666500170)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7561204060202500134)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7567787912814578535)
,p_name=>'New_4'
,p_static_id=>'new-3'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7561204060202500134)
,p_triggering_element=>'WVBFA_BUS_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7567787937480578536)
,p_event_id=>wwv_flow_imp.id(7567787912814578535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WAPL_BUS_FUN_DESC,WBF_VERT_BUS_FUN_NAME,WBF_VERTICAL_ID,VERTICAL_DESC,WVBFA_SEQ_NO',
  'items_to_submit', 'WVBFA_BUS_FUN_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WVBFA_BUS_FUN_ID IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT wbf_bus_fun_name,',
    '	 	  			 wbf_vert_bus_fun_name,',
    '             wbf_bus_fun_id,',
    '             wbf_std_vert_type,',
    '             wbf_seq_no,',
    '             wbf_vertical_id',
    '        FROM wapl_bus_fun',
    '       WHERE wbf_bus_fun_id  = :WVBFA_BUS_FUN_ID',
    '         AND wbf_node_type  IN (''FRM'', ''RPT'', ''SET'', ''REP'');',
    '         ',
    '         cr1													c1%ROWTYPE;',
    '         ',
    '      /* CURSOR c2(c_vertical_id					VARCHAR2)',
    '          IS',
    '      SELECT *',
    '        FROM erp_vertical',
    '       WHERE ev_vertical_id = c_vertical_id;',
    '       ',
    '     -- cr2															c2%ROWTYPE; */',
    '	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Bus. Fun. not found.'');',
    '	 	     ELSE',
    '	 	     	  ',
    '	 	     	  --OPEN c2(cr1.wbf_vertical_id);',
    '	 	     	 -- FETCH c2 INTO cr2;',
    '	 	     	 -- CLOSE c2;',
    '	 	     	  ',
    '	 	     	  :WAPL_BUS_FUN_DESC 			:= cr1.wbf_bus_fun_name;',
    '	 	     	  :WBF_VERT_BUS_FUN_NAME := cr1.wbf_vert_bus_fun_name;',
    '						:WBF_STD_VERT_TYPE     := cr1.wbf_std_vert_type;',
    '						:WVBFA_SEQ_NO				    := cr1.wbf_seq_no;',
    '						:WBF_VERTICAL_ID		:= cr1.wbf_vertical_id;',
    '					--	:VERTICAL_DESC	:= cr2.ev_vertical_desc;',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7567788495901578541)
,p_name=>'New_5'
,p_static_id=>'new-4'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7567788147259578538)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7567788617384578542)
,p_event_id=>wwv_flow_imp.id(7567788495901578541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7567788696399578543)
,p_name=>'New_6'
,p_static_id=>'new-5'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7567788374923578540)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7567788802419578544)
,p_event_id=>wwv_flow_imp.id(7567788696399578543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7572674696390983873)
,p_name=>'New_8'
,p_static_id=>'new-6'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7572674377368983870)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7572674793777983874)
,p_event_id=>wwv_flow_imp.id(7572674696390983873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line5" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7572674835706983875)
,p_name=>'New_9'
,p_static_id=>'new-7'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7572674500769983871)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7572674981703983876)
,p_event_id=>wwv_flow_imp.id(7572674835706983875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line5" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7572675066920983877)
,p_name=>'New_10'
,p_static_id=>'new-8'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7572674547679983872)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7572675231471983878)
,p_event_id=>wwv_flow_imp.id(7572675066920983877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line5" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7259418693582571174)
,p_name=>'Par.Bus.Fun.'
,p_static_id=>'par-bus-fun'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_triggering_element=>'WBF_PAR_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7259418783441571175)
,p_event_id=>wwv_flow_imp.id(7259418693582571174)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PAR_DESC',
  'items_to_submit', 'WBF_PAR_FUN_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WBF_PAR_FUN_ID IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM wapl_bus_fun',
    '	 	   WHERE wbf_node_type IN (''MOD'')',
    '	 	     AND wbf_bus_fun_id = :WBF_PAR_FUN_ID;',
    '	 	     ',
    '	 	     cr1															c1%ROWTYPE;',
    '	 	   ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	 raise_application_error(-20999,''Par. Bus. Fun. not found.'');	',
    '	 	  	     	  ',
    '	 	     ELSE',
    '	 	     	     :PAR_DESC := cr1.wbf_bus_fun_name;	 ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7567791745212578574)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Copy'
,p_static_id=>'copy'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  :P11130095_STD_VERT_TYPE := ''S'';',
':P11130095_BL_BUS_FUN_VERT := ''B'';',
'-- :P11130095_VERTICAL_ID     :=   :P11130095_VERTICAL_ID ;',
'-- :P11130095_VERTICAL_DESC   :=   :P11130095_VERTICAL_DESC ;',
':P11130095_BL_FROM_VERT_ID  := NULL;',
':P11130095_BL_FROM_VERT_DESC   := NULL;',
'',
':P11130095_SETUP   		  := ''Y'';',
':P11130095_TRANSACTIONS   := ''Y'';',
':P11130095_ANALYTICS      := ''Y'';',
':P11130095_REPORTS        := ''Y'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7567790480441578561)
,p_internal_uid=>2085829909668967546
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7567787426408578530)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE'
,p_static_id=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_cnt NUMBER (10);',
'    BEGIN',
'	    SELECT COUNT(*)',
'	      INTO v_cnt',
'	      FROM wapl_user_bus_fun_accs',
'	     WHERE wubfa_bus_fun_id = :P11130095_BUS_FUN_ID_DEL;',
'	    ',
'	    IF v_cnt <> 0 THEN',
'	    	 RAISE_APPLICATION_ERROR(-20999,''Cannot Delete. Since child record exists.'');',
'	    ELSE',
'		  	DELETE ',
'			    FROM wapl_bus_fun',
'			   WHERE wbf_bus_fun_id = :P11130095_BUS_FUN_ID_DEL;',
'		',
'		  END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2085825590864967502
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7567787536652578532)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE1'
,p_static_id=>'delete-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM  WAPL_VERT_BUS_FUN_ASSO',
'WHERE WVBFA_VERTICAL_ID =:P11130095_ROWID2;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>2085825701108967504
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7579146850595752775)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE ALL'
,p_static_id=>'delete-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE wapl_user_bus_fun_accs',
' WHERE wubfa_user_id = :APPLUSER_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7579146982906752776)
,p_internal_uid=>2097185015052141747
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7579147153573752778)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE ALL1'
,p_static_id=>'delete-all-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE wapl_vert_bus_fun_asso',
' WHERE wvbfa_vertical_id = :EV_VERTICAL_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7579147060589752777)
,p_process_when_type=>'NEVER'
,p_internal_uid=>2097185318030141750
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7575587086586081751)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load_all'
,p_static_id=>'load-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APPLUSER_ID IS NOT NULL THEN',
'	 ',
'	 DECLARE',
'	 	  ',
'	 	  CURSOR c0',
'	 	      IS',
'	 	  SELECT bu_vert_id',
'	 	    FROM appl_users,',
'	 	         business_units',
'	 	   WHERE appluser_id = :APPLUSER_ID',
'	 	     AND appluser_bu = bu_id',
'	 	     AND appluser_status = ''A'';',
'	 	     ',
'	 	     cr0													c0%ROWTYPE;',
'	 	  ',
'	 	  CURSOR c1(c_vert_id							VARCHAR2)',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM wapl_vert_bus_fun_asso',
'	 	   WHERE wvbfa_vertical_id = c_vert_id;',
'	 	   ',
'	 	     cr1													c1%ROWTYPE;',
'	 	     ',
'	 	  v_res														VARCHAR2(1) := ''N'';',
'	 	   ',
'	 BEGIN',
'	 	  ',
'	 	  OPEN c0;',
'	 	  FETCH c0 INTO cr0;',
'	 	  ',
'	 	     IF c0%NOTFOUND THEN',
'	 	     	  RAISE_APPLICATION_ERROR(-20999,''Vertical not defined for this User.'');',
'	 	     ELSE',
'	 	     	  ',
'	 	     	  DELETE wapl_user_bus_fun_accs',
'	 	     	   WHERE wubfa_user_id = :APPLUSER_ID;',
'	 	     	  ',
'	 	     	  FOR cr1 IN c1(cr0.bu_vert_id)',
'	 	     	  LOOP',
'	 	     	  	 ',
'	 	     	  	 INSERT INTO wapl_user_bus_fun_accs(wubfa_user_id			,',
'							                                    wubfa_bus_fun_id	,',
'							                                    wubfa_date_from		,',
'							                                    wubfa_date_to			,',
'							                                    wubfa_cre_by			,',
'							                                    wubfa_cre_ip_addr	,',
'							                                    wubfa_cre_os_user	,',
'							                                    wubfa_cre_emp_id	,',
'							                                    wubfa_cre_date		)',
'																				   VALUES(:APPLUSER_ID,',
'																					        cr1.wvbfa_bus_fun_id,',
'																					    		TRUNC(SYSDATE)		,',
'																					    		''01-Apr-2099''			,',
'																					    		:GLOBAL_USER		,',
'																					        :GLOBAL_IP_ADDR,',
'																					    		:GLOBAL_USER		,',
'																					    		:GLOBAL_EMP_ID,',
'																					    		SYSDATE						);',
'	 	     	     ',
'	 	     	     v_res := ''Y'';',
'	 	     	     	 ',
'	 	     	  END LOOP c1;',
'	 	     	  ',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c0;',
'	 	  ',
'		  PROC_COMMIT;',
'		 ',
'		  IF v_res = ''Y'' THEN',
'				  apex_application.g_print_success_message := ''Loaded Successfully.''; ',
'		  ELSE',
'		   apex_application.g_print_success_message := ''Not Loaded.'';',
'		  END IF;	 	  ',
'	 	  ',
'	 END;',
'	 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7575586972821081750)
,p_process_when_type=>'NEVER'
,p_internal_uid=>2093625251042470723
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5934877920563688164)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'SELECT wbf_bus_fun_name',
'into :PAR_DESC',
'	 	    FROM wapl_bus_fun',
'	 	   WHERE wbf_node_type IN (''MOD'')',
'	 	     AND wbf_bus_fun_id = :WBF_PAR_FUN_ID;',
'	 	  ',
'exception when others then',
'null; ',
'           end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>452916085020077136
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7571531589846845476)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7571529584154845456)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New - Save Interactive Grid Data'
,p_static_id=>'new-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :APEX$ROW_STATUS =''C'' THEN',
'        INSERT INTO WAPL_USER_BUS_FUN_ACCS (WUBFA_USER_ID,',
'                                            WUBFA_BUS_FUN_ID,',
'                                            WUBFA_DATE_FROM,',
'                                            WUBFA_DATE_TO,',
'                                            WUBFA_CRE_BY,',
'                                            WUBFA_CRE_IP_ADDR,',
'                                            WUBFA_CRE_OS_USER,',
'                                            WUBFA_CRE_EMP_ID,',
'                                            WUBFA_CRE_DATE,',
'        									WUBFA_SEQ_NO)',
'        						     VALUES(:WUBFA_USER_ID,		 ',
'                                            :WUBFA_BUS_FUN_ID,',
'                                            :WUBFA_DATE_FROM,',
'                                            :WUBFA_DATE_TO,',
'        							        :GLOBAL_USER,		',
'                                            :GLOBAL_IP_ADDR,',
'                                            :GLOBAL_USER,     ',
'                                            :GLOBAL_EMP_ID,',
'                                            SYSDATE,',
'        									:WUBFA_SEQ_NO);',
'    ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'        UPDATE WAPL_USER_BUS_FUN_ACCS',
'           SET WUBFA_USER_ID	  = :WUBFA_USER_ID,									   ',
'               WUBFA_BUS_FUN_ID   = :WUBFA_BUS_FUN_ID, ',
'               WUBFA_DATE_FROM    = :WUBFA_DATE_FROM,  ',
'               WUBFA_DATE_TO      = :WUBFA_DATE_TO,    ',
'               WUBFA_UPD_BY       =  :GLOBAL_USER,	',
'               WUBFA_UPD_IP_ADDR  =  :GLOBAL_IP_ADDR,',
'               WUBFA_UPD_OS_USER  =  :GLOBAL_USER,   ',
'               WUBFA_UPD_EMP_ID   =  :GLOBAL_EMP_ID,',
'               WUBFA_UPD_DATE     =  SYSDATE,',
'               WUBFA_SEQ_NO       =  :WUBFA_SEQ_NO',
'        WHERE 	WUBFA_USER_ID  = :WUBFA_USER_ID',
'        AND  WUBFA_BUS_FUN_ID  =  :WUBFA_BUS_FUN_ID; ',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2089569754303234448
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7561205896333500152)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Vertical Bus.Fun.Asso - Save Interactive Grid Data'
,p_static_id=>'vertical-bus-fun-asso-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS =''C'' THEN',
'INSERT INTO WAPL_VERT_BUS_FUN_ASSO(WVBFA_VERTICAL_ID,',
'                                   WVBFA_BUS_FUN_ID,',
'                                   WVBFA_CRE_BY,',
'                                   WVBFA_CRE_IP_ADDR,',
'                                   WVBFA_CRE_OS_USER,',
'                                   WVBFA_CRE_EMP_ID,',
'                                   WVBFA_CRE_DATE,',
'                                   WVBFA_SEQ_NO)',
'						   VALUES(:WVBFA_VERTICAL_ID,',
'                                  :WVBFA_BUS_FUN_ID,',
'                                  :GLOBAL_USER,									  ',
'                                  :GLOBAL_IP_ADDR,',
'                                  :GLOBAL_USER,                                  ',
'                                  :GLOBAL_EMP_ID,',
'								  SYSDATE,',
'								  :WVBFA_SEQ_NO);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'UPDATE WAPL_VERT_BUS_FUN_ASSO',
'   SET 							  ',
'       WVBFA_SEQ_NO       = :WVBFA_SEQ_NO,',
'       WVBFA_UPD_BY	      = :GLOBAL_USER,		',
'       WVBFA_UPD_IP_ADDR  = :GLOBAL_IP_ADDR,',
'       WVBFA_UPD_OS_USER  = :GLOBAL_USER,   ',
'       WVBFA_UPD_EMP_ID   = :GLOBAL_EMP_ID,',
'       WVBFA_UPD_DATE     = SYSDATE',
'WHERE WVBFA_VERTICAL_ID  = :WVBFA_VERTICAL_ID',
'AND   WVBFA_BUS_FUN_ID   = :WVBFA_BUS_FUN_ID;',
'END IF;',
'END; 		   ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>2079244060789889124
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7443236186187769437)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7443201003997769395)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Web Application - Save Interactive Grid Data'
,p_static_id=>'web-application-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :APEX$ROW_STATUS =''C'' THEN',
'',
'        IF : WBF_NODE_TYPE = ''MOD'' THEN	 ',
'    	    SELECT NVL(MAX(TO_NUMBER(wbf_bus_fun_id)), 1000000)+ 1 ',
'    	      INTO :WBF_BUS_FUN_ID',
'    	      FROM wapl_bus_fun',
'    	     WHERE wbf_node_type = ''MOD''',
'               AND WBF_BUS_FUN_ID =:WBF_BUS_FUN_ID;	 ',
'        END IF;',
'',
'        INSERT INTO wapl_bus_fun(',
'                    wbf_seq_no,',
'                    wbf_bus_fun_id,',
'                    wbf_page_no,',
'                    wbf_bus_fun_name,',
'                    wbf_bus_fun_short_name,',
'                    wbf_bus_fun_type,',
'                    wbf_par_fun_id,',
'                    wbf_visible,',
'                    wbf_icon,',
'                    wbf_node_type, ',
'                    wbf_srch_flag,',
'                    wbf_asgn_to,',
'                    wbf_asgn_date,',
'                    wbf_asgn_status,',
'                    wbf_appl_no,',
'                    wbf_std_vert_type,',
'                    wbf_vertical_id,',
'                    wbf_vert_bus_fun_name,',
'                    wbf_client_id,',
'                    wbf_bus_fun_narration,',
'                    wbf_bus_fun_mis_name,',
'        			wbf_cre_by,',
'                    wbf_cre_ip_addr,',
'                    wbf_cre_os_user,',
'                    wbf_cre_emp_id,',
'                    wbf_cre_date,',
'                    wbf_form_loc1,',
'                    wbf_form_icon,',
'                    wbf_form_id,',
'                    wbf_active_flag)',
'        	 VALUES(	',
'                   :wbf_seq_no,',
'                   :wbf_bus_fun_id,',
'                   :wbf_page_no,',
'                   :wbf_bus_fun_name,',
'                   :wbf_bus_fun_short_name,',
'                   :wbf_bus_fun_type,',
'                   :wbf_par_fun_id,',
'                   :wbf_visible,',
'                   :wbf_icon,',
'                   :wbf_node_type, ',
'                   ''N'',',
'                   :wbf_asgn_to,',
'                   :wbf_asgn_date,',
'                   :wbf_asgn_status,',
'                   :wbf_appl_no,',
'                   :wbf_std_vert_type,',
'                   :wbf_vertical_id,',
'                   :wbf_vert_bus_fun_name,',
'                   :wbf_client_id,',
'                   :wbf_bus_fun_narration,',
'                   :wbf_bus_fun_mis_name,',
'                   :GLOBAL_user,      ',
'                   :GLOBAL_IP_ADDR,   ',
'                   :GLOBAL_USER,      ',
'                   :GLOBAL_EMP_IP,    ',
'                    SYSDATE,',
'                    :wbf_form_loc1,',
'                    :wbf_form_icon,',
'                    :wbf_form_id,',
'                    :wbf_active_flag); ',
'',
'    ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'        UPDATE WAPL_BUS_FUN',
'           SET WBF_SEQ_NO               =:WBF_SEQ_NO,',
'               WBF_PAGE_NO              =:WBF_PAGE_NO,',
'               WBF_BUS_FUN_NAME         =:WBF_BUS_FUN_NAME,',
'               WBF_BUS_FUN_SHORT_NAME   =:WBF_BUS_FUN_SHORT_NAME,',
'               WBF_BUS_FUN_TYPE         =:WBF_BUS_FUN_TYPE,',
'               WBF_PAR_FUN_ID           =:WBF_PAR_FUN_ID,',
'               WBF_VISIBLE              =:WBF_ACTIVE_FLAG,',
'               WBF_ICON                 =:WBF_ICON,',
'               WBF_NODE_TYPE            =:WBF_NODE_TYPE,',
'               WBF_UPD_BY               =:GLOBAL_USER,',
'               WBF_UPD_IP_ADDR          =:GLOBAL_IP_ADDR,',
'               WBF_UPD_OS_USER          =:GLOBAL_USER,',
'               WBF_UPD_EMP_ID           =:GLOBAL_EMP_ID,',
'               WBF_UPD_DATE             =SYSDATE,',
'               WBF_SRCH_FLAG            =:WBF_SRCH_FLAG,',
'               WBF_ASGN_TO              =:WBF_ASGN_TO,',
'               WBF_ASGN_DATE            =:WBF_ASGN_DATE,',
'               WBF_ASGN_STATUS          =:WBF_ASGN_STATUS,',
'               WBF_APPL_NO              =:WBF_APPL_NO,',
'               WBF_STD_VERT_TYPE        =:WBF_STD_VERT_TYPE,',
'               WBF_VERTICAL_ID	        =:WBF_VERTICAL_ID,',
'               WBF_VERT_BUS_FUN_NAME    =:WBF_VERT_BUS_FUN_NAME,',
'               WBF_CLIENT_ID            =:WBF_CLIENT_ID,',
'               WBF_BUS_FUN_NARRATION    =:WBF_BUS_FUN_NARRATION,',
'               WBF_BUS_FUN_MIS_NAME     =:WBF_BUS_FUN_MIS_NAME	,',
'               WBF_FORM_LOC1            =:WBF_FORM_LOC1,',
'               WBF_FORM_ICON            =:WBF_FORM_ICON,',
'               WBF_FORM_ID              =:WBF_FORM_ID	,',
'               WBF_ACTIVE_FLAG          =:WBF_ACTIVE_FLAG ',
'        WHERE WBF_BUS_FUN_ID = :WBF_BUS_FUN_ID',
'          and rowid = rowid ;',
'      END IF;',
'END;               ',
'               ',
'               ',
'               ',
'              			   ',
'			   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1961274350644158409
);
wwv_flow_imp.component_end;
end;
/
