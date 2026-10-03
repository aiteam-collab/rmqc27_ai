prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_name=>'Current Bus. Fun. Access'
,p_alias=>'USER-BUS-FUN-ACCESS'
,p_step_title=>'Current Bus. Fun. Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6533737866653795233)
,p_plug_name=>'Find_parameteres'
,p_static_id=>'find-parameteres'
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
 p_id=>wwv_flow_imp.id(8057157381257557702)
,p_plug_name=>'User Access1'
,p_static_id=>'user-access'
,p_region_name=>'ig_line5'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       row_id_no,',
'       wubfa_user_id,',
'       wubfa_bus_fun_id,',
'       wapl_bus_fun_desc, ',
'       wbf_vert_bus_fun_name,',
'       wbf_par_fun_id,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       wbf_std_vert_type,            ',
'       wbf_vertical_id,',
'       Par_desc,  ',
'       TO_CHAR(wubfa_date_from,func_find_date_format(:GLOBAL_BU))wubfa_date_from,',
'       TO_CHAR(wubfa_date_to,func_find_date_format(:GLOBAL_BU))wubfa_date_to,',
'       wubfa_cre_by,',
'       wubfa_cre_ip_addr,',
'       wubfa_cre_os_user,',
'       wubfa_cre_emp_id,',
'       wubfa_cre_date,',
'       wubfa_upd_by,',
'       wubfa_upd_ip_addr,',
'       wubfa_upd_os_user,',
'       wubfa_upd_emp_id,',
'       wubfa_upd_date,',
'       wubfa_appr_by,',
'       wubfa_seq_no,',
'       Emp_name,',
'       Emp_id,',
'	   Designation,',
'       Department',
'	   Department,',
'       Unit_Name,',
'       Unit,',
'       User_type,',
'       wubfa_accs_doc_no,',
'       TO_CHAR(wubfa_accs_doc_date,func_find_date_format(:GLOBAL_BU))wubfa_accs_doc_date',
'FROM (',
'SELECT A.ROWID row_id_no,',
'       wubfa_user_id,',
'       wubfa_bus_fun_id,',
'       wbf_bus_fun_name wapl_bus_fun_desc, ',
'       wbf_vert_bus_fun_name wbf_vert_bus_fun_name,',
'       wbf_node_type wbf_node_type, ',
'       wbf_bus_fun_id wbf_par_fun_id,',
'       wbf_std_vert_type wbf_std_vert_type,            ',
'       wbf_vertical_id wbf_vertical_id,',
'       wbf_bus_fun_name Par_desc,  ',
'       wubfa_date_from,',
'       wubfa_date_to,',
'       wubfa_cre_by,',
'       wubfa_cre_ip_addr,',
'       wubfa_cre_os_user,',
'       wubfa_cre_emp_id,',
'       wubfa_cre_date,',
'       wubfa_upd_by,',
'       wubfa_upd_ip_addr,',
'       wubfa_upd_os_user,',
'       wubfa_upd_emp_id,',
'       wubfa_upd_date,',
'       wubfa_appr_by,',
'       wubfa_seq_no,',
'       (Select  trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          from employees',
'        where  emp_bu   = :GLOBAL_BU',
'            and emp_emp_id = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end)',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :Global_bu',
'           AND suplr_party_type = ''S''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end)   ',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :Global_bu',
'           AND suplr_party_type = ''C''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end))',
'         emp_name,',
'       case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end Emp_id,',
'       (SELECT hrpos_pos_name1',
'          FROM hr_positions',
'         WHERE hrpos_bu     = empai_bu',
'           AND hrpos_pos_id = empai_pos_id',
'           and APPLUSER_USER_TYPE not in (''C'',''S'',''O''))Designation,',
'        (SELECT dept_name1',
'           FROM departments',
'          WHERE dept_bu = empai_bu',
'            AND dept_id = empai_dept_id',
'            and APPLUSER_USER_TYPE not in (''C'',''S'',''O'')) Department,',
'        (SELECT bup_name1',
'           FROM bus_unit_plants',
'          WHERE bup_bu       = :GLOBAL_bu',
'            AND bup_plant_id = empai_plnt)Unit_Name,',
'        empai_plnt Unit,',
'        DECODE(appluser_user_type,''R'',''ERP Admin'',''E'',''ERP User'',''U'',''ESS User'',''P'',''POS User'',''C'',''Customer'',''S'',''Supplier'',''O'',''Concurrent User'')User_type ,',
'        wubfa_accs_doc_no,',
'        wubfa_accs_doc_date',
'  FROM wapl_user_bus_fun_accs A,',
'       wapl_bus_fun,',
'       appl_users,',
'       employees,',
'       emp_active_infos',
' WHERE wbf_bus_fun_id   =  wubfa_bus_fun_id',
'   AND wubfa_user_id    =  appluser_id',
'   AND appluser_bu      =  emp_bu',
'   AND appluser_emp_id  =  emp_emp_id',
'   AND emp_bu           =  empai_bu',
'   AND emp_emp_id       =  empai_emp_id',
'   AND wbf_visible      = ''Y''',
'   AND appluser_user_type    <> ''O''',
'   AND appluser_bu      = :Global_bu',
'   AND wubfa_user_id IN (SELECT appluser_id',
'                            FROM appl_users ',
'                           WHERE appluser_bu = :GLOBAL_BU',
'                             AND appluser_status = ''A''))',
'  WHERE (INSTR(UPPER(wubfa_user_id), UPPER(:P37_FIND_USER_ID)) > 0 OR :P37_FIND_USER_ID IS NULL)',
'   AND ((INSTR(UPPER(Emp_id),UPPER(TRIM(:P37_FIND_EMP_ID))) > 0 )',
'        OR (INSTR(UPPER((Emp_name)),UPPER(TRIM(:P37_FIND_EMP_ID))) > 0)',
'        OR :P37_FIND_EMP_ID IS NULL)',
'   AND (:P37_FIND_USER_TYPE IN (SELECT appluser_user_type',
'                                    FROM appl_users',
'                                   WHERE appluser_id = wubfa_user_id) OR :P37_FIND_USER_TYPE IS NULL)',
'   AND (INSTR(UPPER(Designation),UPPER(:P37_FIND_DESIGNATION)) > 0 OR :P37_FIND_DESIGNATION IS NULL)',
'   AND (INSTR(UPPER(Department),UPPER(:P37_FIND_DEPARTMENT)) > 0 OR :P37_FIND_DEPARTMENT IS NULL)',
'   AND ((INSTR(UPPER(unit),UPPER(:P40_UNIT)) > 0  OR :P37_FIND_UNIT IS NULL)',
'       OR (INSTR(UPPER((Unit_Name)),UPPER(TRIM(:P37_FIND_UNIT))) > 0))',
'   AND ((SELECT DISTINCT wbf_node_type',
'	      FROM wapl_bus_fun',
'	     WHERE wbf_bus_fun_id = wubfa_bus_fun_id) = :P37_FIND_TYPE OR :P37_FIND_TYPE IS NULL)',
'   AND ( (INSTR(UPPER(wubfa_bus_fun_id), UPPER(:P37_BUS_FUN_ID)) > 0)',
'         OR (INSTR(UPPER(wapl_bus_fun_desc), UPPER(:P37_BUS_FUN_ID)) > 0 )',
'          OR :P37_BUS_FUN_ID IS NULL)  ',
'   AND ((((TO_DATE(:P37_FIND_FROM_DATE,func_find_date_format(:Global_bu)) BETWEEN TRUNC(wubfa_date_from) AND TRUNC(wubfa_date_to)) ',
'             OR (TO_DATE(:P37_FIND_TO_FROM,func_find_date_format(:Global_bu)) BETWEEN TRUNC(wubfa_date_from) AND TRUNC(wubfa_date_to)))',
'             AND :P37_FIND_TO_FROM IS NOT NULL AND :P37_FIND_FROM_DATE IS NOT NULL)',
'         OR (TRUNC(wubfa_date_from) >= TO_DATE(:P37_FIND_FROM_DATE,func_find_date_format(:Global_bu)) AND :P37_FIND_TO_FROM IS NULL AND :P37_FIND_FROM_DATE IS NOT NULL)',
'         OR (TRUNC(wubfa_date_to) <= TO_DATE(:P37_FIND_TO_FROM,func_find_date_format(:Global_bu)) AND :P37_FIND_FROM_DATE IS NULL AND :P37_FIND_TO_FROM IS NOT NULL)',
'         OR (:P37_FIND_FROM_DATE IS NULL AND :P37_FIND_TO_FROM IS NULL))          ',
'    '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P37_FIND_USER_ID,P37_FIND_EMP_ID,P37_FIND_FROM_DATE,P37_FIND_TO_FROM,P37_FIND_USER_TYPE,P37_FIND_DESIGNATION,P37_FIND_DEPARTMENT,P37_BUS_FUN_ID'
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
 p_id=>wwv_flow_imp.id(6488225478274919969)
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
 p_id=>wwv_flow_imp.id(6488225632355919970)
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
 p_id=>wwv_flow_imp.id(6533738761258795242)
,p_name=>'DEPARTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPARTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Department'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(6533738654345795241)
,p_name=>'DESIGNATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESIGNATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Designation'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(6533738561266795240)
,p_name=>'EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Party ID'
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
 p_id=>wwv_flow_imp.id(6533738438300795239)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Party Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>122
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
 p_id=>wwv_flow_imp.id(8057809627242414280)
,p_name=>'PAR_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAR_DESC'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(6488222445940919939)
,p_name=>'ROW_ID_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_ID_NO'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6533738944037795244)
,p_name=>'UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT'
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
 p_id=>wwv_flow_imp.id(6533738878188795243)
,p_name=>'UNIT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT_NAME'
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
 p_id=>wwv_flow_imp.id(6533739108679795245)
,p_name=>'USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(8057159466952557723)
,p_name=>'WAPL_BUS_FUN_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAPL_BUS_FUN_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Bus. Fun. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(6488223182071919946)
,p_name=>'WBF_NODE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_NODE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>11
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
 p_id=>wwv_flow_imp.id(8057809232307414276)
,p_name=>'WBF_PAR_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_PAR_FUN_ID'
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
 p_id=>wwv_flow_imp.id(8057809291801414277)
,p_name=>'WBF_STD_VERT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_STD_VERT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057809424447414278)
,p_name=>'WBF_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERTICAL_ID'
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
 p_id=>wwv_flow_imp.id(8057159600000557724)
,p_name=>'WBF_VERT_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_VERT_BUS_FUN_NAME'
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
 p_id=>wwv_flow_imp.id(6533741047359795265)
,p_name=>'WUBFA_ACCS_DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_ACCS_DOC_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Doc. Date'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6533740949282795264)
,p_name=>'WUBFA_ACCS_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_ACCS_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Source Doc. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(6488225769580919972)
,p_name=>'WUBFA_APPR_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_APPR_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Approved By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(6488223096168919945)
,p_name=>'WUBFA_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_BUS_FUN_ID'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158031237557708)
,p_name=>'WUBFA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Created By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(8057158348669557712)
,p_name=>'WUBFA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(8057158267315557711)
,p_name=>'WUBFA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158094183557709)
,p_name=>'WUBFA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158176028557710)
,p_name=>'WUBFA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057157756938557706)
,p_name=>'WUBFA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_DATE_FROM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>' Eff. From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057157838463557707)
,p_name=>'WUBFA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_DATE_TO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>' Eff. To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057159000940557718)
,p_name=>'WUBFA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_SEQ_NO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(8057158520120557713)
,p_name=>'WUBFA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158835270557717)
,p_name=>'WUBFA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
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
 p_id=>wwv_flow_imp.id(8057158783405557716)
,p_name=>'WUBFA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158559878557714)
,p_name=>'WUBFA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057158686249557715)
,p_name=>'WUBFA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUBFA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8057157533202557704)
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
 p_id=>wwv_flow_imp.id(8057157475135557703)
,p_internal_uid=>2575195639591946675
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_imp.id(8057705388171331908)
,p_interactive_grid_id=>wwv_flow_imp.id(8057157475135557703)
,p_static_id=>'20901158'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8057705603818331909)
,p_report_id=>wwv_flow_imp.id(8057705388171331908)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961949262611084)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(6488225632355919970)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534591619502669742)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6533738438300795239)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534592417807669760)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6533738561266795240)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534593307670669770)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(6533738654345795241)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534594231575669779)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(6533738761258795242)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534595126240669790)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(6533738878188795243)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534595980180669799)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(6533738944037795244)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6534596877623669809)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6533739108679795245)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>131
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6535241673711759443)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(6533740949282795264)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6535242487694759453)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(6533741047359795265)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6545107432249119168)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(6488222445940919939)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6546659598820205003)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6488223096168919945)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6546660599198205012)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(6488223182071919946)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6599842208044903792)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6488225478274919969)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6599870359785917256)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(6488225769580919972)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057706096636331913)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8057157533202557704)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057707903435331925)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(8057157756938557706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057708752767331931)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(8057157838463557707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057709689246331938)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8057158031237557708)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057710452821331944)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8057158094183557709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057711411617331950)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8057158176028557710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057712315912331956)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8057158267315557711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057713192219331963)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8057158348669557712)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057714112488331969)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8057158520120557713)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057714973900331975)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8057158559878557714)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057715914884331981)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8057158686249557715)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057716770325331988)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8057158783405557716)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057717717842331994)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8057158835270557717)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057718553962331999)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(8057159000940557718)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>107
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057815448873417767)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8057159466952557723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>315
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057816366597417774)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8057159600000557724)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>297
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057818183113417786)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8057809232307414276)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057819127177417791)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8057809291801414277)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057820023996417797)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8057809424447414278)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8057821743363417809)
,p_view_id=>wwv_flow_imp.id(8057705603818331909)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8057809627242414280)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>175
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5967650165647478735)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(8057157381257557702)
,p_button_name=>'clear'
,p_static_id=>'clear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:37::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548960751465077217)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(8057157381257557702)
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
 p_id=>wwv_flow_imp.id(5967602492473323428)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8057157381257557702)
,p_button_name=>'Load_new'
,p_static_id=>'load-new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.::P111326009501_RETURN_PAGE_NO:37'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5967611534578334229)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8057157381257557702)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6547239918440092937)
,p_name=>'P37_BUS_FUN_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740270250795257)
,p_name=>'P37_FIND_DEPARTMENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740227380795256)
,p_name=>'P37_FIND_DESIGNATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533738433672795238)
,p_name=>'P37_FIND_EMP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740628987795260)
,p_name=>'P37_FIND_FROM_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740664013795261)
,p_name=>'P37_FIND_TO_FROM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740399069795258)
,p_name=>'P37_FIND_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740885091795263)
,p_name=>'P37_FIND_UNIT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533738026990795234)
,p_name=>'P37_FIND_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533740494445795259)
,p_name=>'P37_FIND_USER_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6533737866653795233)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5967611578807334230)
,p_name=>'P37_USER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8057157381257557702)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8078061218875031939)
,p_name=>'P37_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8057157381257557702)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6488224148034919956)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548960751465077217)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6488224241018919957)
,p_event_id=>wwv_flow_imp.id(6488224148034919956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line5" ).call( "getActions" ).lookup("show-download-dialog").action(); ')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6488225669594919971)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8057157381257557702)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'User Access1 - Save Interactive Grid Data'
,p_static_id=>'user-access1-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1006263834051308943
);
wwv_flow_imp.component_end;
end;
/
