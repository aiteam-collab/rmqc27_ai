prompt --application/pages/page_211131011
begin
--   Manifest
--     PAGE: 211131011
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
 p_id=>211131011
,p_name=>'User Bus Function Access'
,p_alias=>'USER-BUS-FUNCTION-ACCESS1'
,p_step_title=>'User Bus. Function Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' h2 {',
'    font-size: 1.5rem;',
'    margin: 0 0 1.2rem;',
'} ',
' /* .display_only {',
'    border-color: transparent;',
'    background-color: transparent;',
'    font-size: 10px;',
'}  */',
' .t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'     font-size: 1.2rem; ',
'    font-family: Arial;',
'    background: #b0e2ff !important;',
'}  ',
'.t-Body-title {',
'    background-color: rgba(255, 255, 255, 0.9);',
'    color: #262626;',
'    border-bottom: 0px solid #e6e6e6;',
'    border-bottom-color: rgba(0, 0, 0, 0.178);',
'}',
'',
'',
'.t-Form-radioLabel, .t-Form-inputContainer .radio_group label, .t-Form-checkboxLabel, .t-Form-inputContainer .checkbox_group label, .t-Form-label, .u-Form-label {',
'    color: #0480e9;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9611916544250877071)
,p_plug_name=>'Bus. Func.'
,p_static_id=>'bus-func'
,p_parent_plug_id=>wwv_flow_imp.id(9611916127219877067)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9612408563341370864)
,p_plug_name=>'Bus. Func.'
,p_static_id=>'bus-func-2'
,p_region_name=>'ig_bus_func'
,p_parent_plug_id=>wwv_flow_imp.id(9611916544250877071)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'ROWID,',
'       UBFAL_BU,',
'       UBFAL_DOC_NO,',
'       UBFAL_SEQ_NO,',
'       UBFAL_BUS_FUN_ID,',
'         (SELECT ABFV_FUN_DESC1 ',
'        FROM appl_bus_fun_vert',
'       WHERE abfv_vertical_id = vertical_id AND abfv_fun_id = UBFAL_BUS_FUN_ID)bus_fun_desc,',
'       vertical_id,',
'       UBFAL_CRE_BY,',
'       UBFAL_CRE_DATE,',
'       UBFAL_CRE_EMP_ID,',
'       UBFAL_CRE_IP_ADDR,',
'       UBFAL_CRE_OS_USER,',
'       UBFAL_UPD_BY,',
'       UBFAL_UPD_DATE,',
'       UBFAL_UPD_EMP_ID,',
'       UBFAL_UPD_IP_ADDR,',
'       UBFAL_UPD_OS_USER,',
'       UBFAL_EFF_FROM,',
'       UBFAL_EFF_TO,',
'       UBFAL_BUS_FUN_TYPE,',
'       UBFAL_MODULE,',
'       Delete1',
'from',
'(',
'    select ROWID,',
'       UBFAL_BU,',
'       UBFAL_DOC_NO,',
'       UBFAL_SEQ_NO,',
'       UBFAL_BUS_FUN_ID,',
'		 func_find_bus_fun_desc(UBFAL_BU,ubfal_bus_fun_id)bus_fun_desc,',
'         (SELECT BU_VERT_ID',
'        FROM business_units',
'       WHERE BU_ID = UBFAL_BU)vertical_id,',
'       UBFAL_CRE_BY,',
'       UBFAL_CRE_DATE,',
'       UBFAL_CRE_EMP_ID,',
'       UBFAL_CRE_IP_ADDR,',
'       UBFAL_CRE_OS_USER,',
'       UBFAL_UPD_BY,',
'       UBFAL_UPD_DATE,',
'       UBFAL_UPD_EMP_ID,',
'       UBFAL_UPD_IP_ADDR,',
'       UBFAL_UPD_OS_USER,',
'       UBFAL_EFF_FROM,',
'       UBFAL_EFF_TO,',
'      --  UBFAL_BUS_FUN_TYPE,',
'		 DECODE(UBFAL_BUS_FUN_TYPE,''C'',''Configurations'',''E'',''Entry'',''Q'',''Queries'',''R'',''Reports'',''N'',''Others'')UBFAL_BUS_FUN_TYPE,',
'       UBFAL_MODULE,',
'       ''<span aria-hidden="true" class="fa fa-remove" style = "color:red;"> </span>'' Delete1',
'  from USER_BUS_FUN_ACCESS_LN',
'  where UBFAL_BU=:global_bu',
'  and UBFAL_DOC_NO=:P211131011_UBFAH_DOC_NO',
'  )'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P211131011_UBFAH_DOC_NO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P211131011_UBFAH_LOAD_FLAG'
,p_plug_read_only_when2=>'N'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bus. Func.'
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
 p_id=>wwv_flow_imp.id(9612411266078370891)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612411344028370892)
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
 p_id=>wwv_flow_imp.id(9633682243872958274)
,p_name=>'BUS_FUN_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUS_FUN_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(5874805198067251964)
,p_name=>'DELETE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P211131011_UBFAL_ROWID'',''&ROWID.'');apex.confirm(''Do you want to Delete the line?'',''delete1'');'
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
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612410521971370884)
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
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612408735092370866)
,p_name=>'UBFAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612409026713370869)
,p_name=>'UBFAL_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun.'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>15
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
 p_id=>wwv_flow_imp.id(9612410371657370882)
,p_name=>'UBFAL_BUS_FUN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_BUS_FUN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>14
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
 p_id=>wwv_flow_imp.id(9612409109882370870)
,p_name=>'UBFAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Cre By'
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
 p_id=>wwv_flow_imp.id(9612409206258370871)
,p_name=>'UBFAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ubfal Cre Date'
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(9612409309771370872)
,p_name=>'UBFAL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(9612409407070370873)
,p_name=>'UBFAL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Cre Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(9612409519776370874)
,p_name=>'UBFAL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Cre Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(9612408850661370867)
,p_name=>'UBFAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Doc No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(9612410140813370880)
,p_name=>'UBFAL_EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eff. From'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612410266210370881)
,p_name=>'UBFAL_EFF_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_EFF_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eff. To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
,p_default_type=>'STATIC'
,p_default_expression=>'31-Dec-2099'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612410462556370883)
,p_name=>'UBFAL_MODULE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_MODULE'
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
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(9612408932477370868)
,p_name=>'UBFAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(9612409656340370875)
,p_name=>'UBFAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(9612409729009370876)
,p_name=>'UBFAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ubfal Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612409860543370877)
,p_name=>'UBFAL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(9612409936483370878)
,p_name=>'UBFAL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Upd Ip Addr'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612410038109370879)
,p_name=>'UBFAL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UBFAL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ubfal Upd Os User'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5899673376056970052)
,p_name=>'VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9612408648057370865)
,p_internal_uid=>4130446812513759837
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
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9612493097166442255)
,p_interactive_grid_id=>wwv_flow_imp.id(9612408648057370865)
,p_static_id=>'20502353'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9612493223336442255)
,p_report_id=>wwv_flow_imp.id(9612493097166442255)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5879894823804488954)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(5874805198067251964)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5901171765611573848)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(5899673376056970052)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562348280718057296)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9633682243872958274)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>390
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562351706963053196)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9612411344028370892)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612493743561442262)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9612408735092370866)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612494669645442268)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9612408850661370867)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612495534430442273)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9612408932477370868)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>65
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612496449667442279)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9612409026713370869)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612497339873442282)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9612409109882370870)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612498209396442285)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9612409206258370871)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612499131185442288)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9612409309771370872)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612500032226442293)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9612409407070370873)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612500983712442296)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9612409519776370874)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612501829470442301)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9612409656340370875)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612502739630442304)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9612409729009370876)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612503683426442309)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9612409860543370877)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612504501782442312)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9612409936483370878)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612505462502442315)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9612410038109370879)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612506358890442319)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9612410140813370880)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612507273650442323)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9612410266210370881)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612508199034442326)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9612410371657370882)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612509049541442329)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9612410462556370883)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612509994562442332)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9612410521971370884)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612543389096495249)
,p_view_id=>wwv_flow_imp.id(9612493223336442255)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9612411266078370891)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7560454215152757351)
,p_plug_name=>'Header-options'
,p_static_id=>'header-options'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9611916260691877068)
,p_plug_name=>'Location Access'
,p_static_id=>'location-access'
,p_parent_plug_id=>wwv_flow_imp.id(9611916127219877067)
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
 p_id=>wwv_flow_imp.id(9611916748234877073)
,p_plug_name=>'Location Access'
,p_static_id=>'location-access-2'
,p_region_name=>'ig_unit_access'
,p_parent_plug_id=>wwv_flow_imp.id(9611916260691877068)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       AUPAL_BU,',
'       AUPAL_DOC_NO,',
'    --    AUPAL_PLANT||'' - ''||',
'       func_find_plnt_desc(AUPAL_BU,AUPAL_PLANT,1)AUPAL_PLANT,',
'       AUPAL_EFF_FROM,',
'       AUPAL_EFF_TO,',
'       AUPAL_DEFLT_FLAG,',
'       AUPAL_CRE_BY,',
'       AUPAL_CRE_DATE,',
'       AUPAL_CRE_EMP_ID,',
'       AUPAL_CRE_IP_ADDR,',
'       AUPAL_CRE_OS_USER,',
'       AUPAL_UPD_BY,',
'       AUPAL_UPD_DATE,',
'       AUPAL_UPD_EMP_ID,',
'       AUPAL_UPD_IP_ADDR,',
'       AUPAL_UPD_OS_USER,',
'       AUPAL_PLNT_LOC_ID,',
'		 (SELECT bupld_loc_name',
'	 	    FROM bus_unit_plants_loc_dtls',
'	 	   WHERE bupld_bu = AUPAL_BU',
'           and BUPLD_LOC_ID=AUPAL_PLNT_LOC_ID)Location_name,',
'		 CASE WHEN AUPAL_DEFLT_FLAG = ''Y'' THEN',
'               ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"> </span>''',
'            ELSE',
'               ''<span aria-hidden="true" class="fa fa-square-o"  style = "color:GREEN;"> </span>''',
'       END default_flag,',
'       ''<span aria-hidden="true" class="fa fa-remove"  style = "color:red;"> </span>'' Detele1',
'  from APPL_USER_PLANT_ACCESS_LN',
'  where AUPAL_BU=:global_bu',
'  and AUPAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P211131011_UBFAH_DOC_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Location Access'
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
 p_id=>wwv_flow_imp.id(9612410663619370885)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612410717931370886)
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
 p_id=>wwv_flow_imp.id(9611916996986877075)
,p_name=>'AUPAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917534251877081)
,p_name=>'AUPAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917674970877082)
,p_name=>'AUPAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Aupal Cre Date'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917799979877083)
,p_name=>'AUPAL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Cre Emp Id'
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
 p_id=>wwv_flow_imp.id(9611917870003877084)
,p_name=>'AUPAL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Cre Ip Addr'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917918750877085)
,p_name=>'AUPAL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Cre Os User'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917486009877080)
,p_name=>'AUPAL_DEFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_DEFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(9611917007559877076)
,p_name=>'AUPAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Doc No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_default_type=>'ITEM'
,p_default_expression=>'P211131011_UBFAH_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611917252837877078)
,p_name=>'AUPAL_EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-RRRR'
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
 p_id=>wwv_flow_imp.id(9611917393655877079)
,p_name=>'AUPAL_EFF_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_EFF_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-RRRR'
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
 p_id=>wwv_flow_imp.id(9611917195292877077)
,p_name=>'AUPAL_PLANT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_PLANT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(9611918500598877091)
,p_name=>'AUPAL_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_PLNT_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
  'title', 'Location',
  'width', '800')).to_clob
,p_is_required=>true
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7562355675731025228)
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
 p_id=>wwv_flow_imp.id(9611918029594877086)
,p_name=>'AUPAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Upd By'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611918114987877087)
,p_name=>'AUPAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Aupal Upd Date'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611918250981877088)
,p_name=>'AUPAL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Upd Emp Id'
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
 p_id=>wwv_flow_imp.id(9611918352741877089)
,p_name=>'AUPAL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Upd Ip Addr'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611918462434877090)
,p_name=>'AUPAL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUPAL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aupal Upd Os User'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9629243613512616275)
,p_name=>'DEFAULT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEFAULT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Default '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P211131011_AUPAL_DEFLT_FLAG'',''&AUPAL_DEFLT_FLAG.''),$s(''P211131011_AUPAL_DOC_NO'',''&AUPAL_DOC_NO.''),$s(''P211131011_AUPAL_ROW_ID'',''&ROWID.'');apex.submit(''Select'');'
,p_link_text=>'&DEFAULT_FLAG.'
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
 p_id=>wwv_flow_imp.id(5862164936180668258)
,p_name=>'DETELE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETELE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P211131011_AUPL_ROW_ID'',''&ROWID.'');apex.confirm(''Do you want to Delete the line?'',''locdelete'');'
,p_link_text=>'&DETELE1.'
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
 p_id=>wwv_flow_imp.id(9629243320469616272)
,p_name=>'LOCATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(9611918664042877092)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(9611916866258877074)
,p_internal_uid=>4129955030715266046
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
 p_id=>wwv_flow_imp.id(9612387673880366163)
,p_interactive_grid_id=>wwv_flow_imp.id(9611916866258877074)
,p_static_id=>'20501299'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9612387865713366163)
,p_report_id=>wwv_flow_imp.id(9612387673880366163)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5886275144401118456)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(5862164936180668258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562266503188024977)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9612410717931370886)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612388379345366166)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9611916996986877075)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612389239245366177)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9611917007559877076)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612390185115366180)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9611917195292877077)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612391046580366185)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9611917252837877078)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612391991422366191)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9611917393655877079)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612392855223366198)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9611917486009877080)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612393752648366202)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9611917534251877081)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612394604359366209)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9611917674970877082)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612395586833366215)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9611917799979877083)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612396451852366221)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9611917870003877084)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612397352942366227)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9611917918750877085)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612398296024366234)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9611918029594877086)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612399172722366237)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9611918114987877087)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612399987507366240)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9611918250981877088)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612400827312366244)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9611918352741877089)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612401784217366248)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9611918462434877090)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612402683330366252)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9611918500598877091)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612403514024366255)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9611918664042877092)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612540813089495219)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9612410663619370885)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>56
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9631763507469496969)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9629243320469616272)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9632084458626605905)
,p_view_id=>wwv_flow_imp.id(9612387865713366163)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9629243613512616275)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9611916460329877070)
,p_plug_name=>'Prefix Access'
,p_static_id=>'prefix-access'
,p_parent_plug_id=>wwv_flow_imp.id(9611916127219877067)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9611918863373877094)
,p_plug_name=>'Prefix Access'
,p_static_id=>'prefix-access-2'
,p_region_name=>'ig_prefix_access'
,p_parent_plug_id=>wwv_flow_imp.id(9611916460329877070)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT UPAL_PFX, ',
'       ROWID,',
'       UPAL_BU,',
'       UPAL_DOC_NO,',
'    --    UPAL_PFX,',
'         (SELECT ADP_DESC1',
'        FROM appl_doc_prefixes',
'       WHERE ADP_BU = UPAL_BU AND ADP_PFX = UPAL_PFX)pfx_desc,',
'       UPAL_DFLT_FLAG,',
'       UPAL_CRE_BY,',
'       UPAL_CRE_DATE,',
'       UPAL_CRE_EMP_ID,',
'       UPAL_CRE_IP_ADDR,',
'       UPAL_CRE_OS_USER,',
'       UPAL_UPD_BY,',
'       UPAL_UPD_DATE,',
'       UPAL_UPD_EMP_ID,',
'       UPAL_UPD_IP_ADDR,',
'       UPAL_UPD_OS_USER,',
'       UPAL_DOC_TYPE,',
'       UPAL_PLNT,',
'		--  func_find_plnt_desc (UPAL_BU,UPAL_PLNT,1) plnt_desc,',
'		 (SELECT bup_name1',
'        FROM bus_unit_plants',
'       WHERE bup_bu = UPAL_BU AND bup_plant_id = UPAL_PLNT)plnt_desc,',
'		 (SELECT  adp_appl',
'     FROM appl_doc_prefixes',
'    WHERE adp_bu = UPAL_BU',
'		AND adp_pfx = upal_pfx)APPL,',
'       UPAL_PLNT_LOC_ID,',
'	 	CASE WHEN UPAL_DFLT_FLAG = ''Y'' THEN',
'         ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"> </span>''',
'      ELSE',
'         ''<span aria-hidden="true" class="fa fa-square-o"  style = "color:GREEN;"> </span>''',
'      END default_flag,',
'      ''<span aria-hidden="true" class="fa fa-remove" style = "color:red;"> </span>'' Delete1',
'  from USER_PREFIX_ACCESS_LN',
'  where UPAL_BU=:GLOBAL_BU',
'  and UPAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P211131011_UBFAH_DOC_NO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Prefix Access'
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
 p_id=>wwv_flow_imp.id(9612410969200370888)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612411068565370889)
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
 p_id=>wwv_flow_imp.id(9633681076186958262)
,p_name=>'APPL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Appl'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9633685783194958309)
,p_name=>'DEFAULT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEFAULT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Default '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P211131011_UPAL_DFLT_FLAG'',''&UPAL_DFLT_FLAG.''),$s(''P211131011_UPAL_DOC_NO'',''&UPAL_DOC_NO.''),$s(''P211131011_UPAL_ROWID'',''&ROWID.''),$s(''P211131011_UPAL_DOC_TYPE'',''&UPAL_DOC_TYPE.''),$s(''P211131011_UPAL_PLNT'',''&UPAL_PLNT.''),$s(''P211131011_'
||'UPAL_PLNT_LOC_ID'',''&UPAL_PLNT_LOC_ID.'');apex.submit(''Default'');'
,p_link_text=>'&DEFAULT_FLAG.'
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
 p_id=>wwv_flow_imp.id(5874805027812251962)
,p_name=>'DELETE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P211131011_UPAL_ROWID'',''&ROWID.'');apex.confirm(''Do you want to Delete the line?'',''delete'');'
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
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9633680844096958260)
,p_name=>'PFX_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PFX_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Prefix Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(9633680976179958261)
,p_name=>'PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
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
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612408436498370863)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(9611919082727877096)
,p_name=>'UPAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Upal Bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611919474228877100)
,p_name=>'UPAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_CRE_BY'
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
 p_id=>wwv_flow_imp.id(9611919541801877101)
,p_name=>'UPAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_CRE_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611919627643877102)
,p_name=>'UPAL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(9611919715924877103)
,p_name=>'UPAL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(9611919811190877104)
,p_name=>'UPAL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
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
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611919365394877099)
,p_name=>'UPAL_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Upal Dflt Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(9611919176636877097)
,p_name=>'UPAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Upal Doc No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_default_type=>'ITEM'
,p_default_expression=>'P211131011_UBFAH_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612408127999370860)
,p_name=>'UPAL_DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Document Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Adv. Bank Guarantee - Issue;ABGI,Adv. Bank Guarantee - Receive;ABGR,Bills Discounting;BD,Credit Note - Issue;CMI,Credit Note - Receive;CMR,Stock Count Schedule  ;CYC,Demo/Exhibition;DE,Debit Note - Issue  ;DMI,Debit Note - Receive   ;DMR,Bank '
||'Voucher;BV,Contra Voucher (In);CVI,Payment Advice;PAD,EMD. Bank Guarantee - Issue;EBGI,EMD. Bank Guarantee - Receive;EBGR,Free Replacement   ;FE,Shop Floor Receipt  ;FR,Free Sample   ;FS,Goods Request  ;GR,Garments    ;GRMT,Inventory Count;IC,Invoice'
||' - Issue  ;II,Invoice Issue - Export;IIE,Invoice Issue - Manufacturing ;IIM,Invoice Issue - Trading ;IIT,Dairy Invoice - With Tax;DIW,Dairy Invoice - Without Tax;DIWO,Inspection Request;INSP,Inspection Document;INSPC,Invoice - Receive ;IR,Letter Of C'
||'redit - Issue  ;LCI,Letter Of Credit - Receive ;LCR,Load Order    ;LD,Letter Of Guarantee - Issue ;LGI,Letter Of Guarantee - Receive  ;LGR,Labor Order;LO,Labor Return;LR,Material Issue    ;MI,Material Request     ;MR,Material Receipt Voucher;MRV,Perf'
||'. Bank Guarantee - Issue;PBGI,Perf. Bank Guarantee - Receive;PBGR,Purchase Order;PCOD,Purchase Receipt;PCRPT,Purchase Request   ;PCRQ,Proforma Invoice - Receive;PFR,Payment - Issue;PI,Purchase Open Order;POO,Purchase Quotation;PQUT,Payment - Receive;'
||'PR,Quotation Request  ;QR,Return for Repair  ;RE,Request For Quotation  ;REFQ,Return for Replacement  ;RL,Stock Adjustment  ;SA,SD. Bank Guarantee - Issue;SBGI,SD. Bank Guarantee - Receive;SBFR,Subcontract Request;SCRQT,Subcontract Order  ;SCO,Subcon'
||'tract Open Order;OBO,Scrap Receipt    ;SCR,Shipping Document;SD,SO for Repair  ;SE,SO for Rejection;SJ,SO for Replacement ;SL,Sales Order  ;SO,Sales Stock Order;CO,Sales Open Order;SOO,Service Order(CRM);SORD,SO Spares  ;SP,Sales Quotation    ;SQ,Lab'
||'or Quotation;LQ,Sales Return;SR,Inventory Transaction   ;SS,Stock Transfer - Purchase ;ST,Stock Transfer - Sale (Internal);STS,Stock Transfer - Sale (External);STSE,Service Order(SO);SV,SO Spares / Warranty    ;SW,SO Trading Spares   ;TP,Traceability'
||' Plate Number ;TPN,Vehicle Invoice No.;VI,Vehicle Order Booking;VOB,Packing Credit;PC,Supplier Schedule - Purchase Request;SSPR,Supplier Schedule - Subcontract Request;SSSCR,Supplier Schedule - Purchase Order;SSPO,Supplier Schedule - Subcontract Orde'
||'r;SSSCO,Deposits;DEP,A.R.E 1 Invoice;ARE1,A.R.E 2 Invoice;ARE2,A.R.E 3 Invoice;ARE3,Stock Transfer Return;RU,Return Demo/Exhibition;RDE,Sample Return;RSR,Service Return;SER,Adjustment Voucher;AV,General Journal;GJ,Training Enquiry;TEN,Training Admiss'
||'ion;TAD,Training Fees Receipt;TFR,Delivery Challan;DC,Journal Voucher;JV,Invoice Issue - Commercial;IIC,Running Bills;RB,Gate Entry Inward;GEN,Corp. Purchase Request;CPR,Corp. Open Purchase Order;COPO,Corp. Purchase Order;CPO,Corp. Sales Order;CSO,Re'
||'curring Journal;RJ,Tender;TEND,Bill of Materials;BOM,Proforma Invoice (Glass);GPI,Labor Proforma Invoice (Glass);GLPI,Order Booking GPI;OBG,Purchase Return Invoice;PRIV,Repair Service Request;RSER,Sales Return Credit Memo(Issue);SRCM,Sales Return Deb'
||'it Memo(Receipt);SRDM,Sales Return Invoice(Receipt);SRIR,Customer Service Request;CSER,Project (Sales);PJ,Corp. Request for Quotation;CRFQ,Pre Quotation;Pre CSPQ,Post Quotation;CSOQ,Sales Order(Scrap);SOSC,Opening PO;POOP,Supplier Bills (MISC);MCSB,O'
||'pening Purchase Order;POOP,Distribution Journal;DJ,Subcontract Order - EPC;SCOE,Production Order;PRO,Production Completion;PRC,Rework Order;RWO,Rework Completion;RWC,Production Adhessive Completion;PAC,Production Coating Completion;PCC,Production Mix'
||'ing Completion;PMC,Fasteners Plan;FP,Certificate of Analysis;COA,Sales Invoice - Commercial;IIC'
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
 p_id=>wwv_flow_imp.id(9611919292990877098)
,p_name=>'UPAL_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Prefix'
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
  'title', 'Prefix',
  'width', '800')).to_clob
,p_is_required=>true
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7562357996043025229)
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
 p_id=>wwv_flow_imp.id(9612408233131370861)
,p_name=>'UPAL_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9612408341211370862)
,p_name=>'UPAL_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_PLNT_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7562359895738025232)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'UPAL_PFX'
,p_ajax_items_to_submit=>'UPAL_PFX'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611919970491877105)
,p_name=>'UPAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(9611920070164877106)
,p_name=>'UPAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(9611920111668877107)
,p_name=>'UPAL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(9611920293820877108)
,p_name=>'UPAL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_UPD_IP_ADDR'
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
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9611920362293877109)
,p_name=>'UPAL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPAL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
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
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9611918957110877095)
,p_internal_uid=>4129957121567266067
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
 p_id=>wwv_flow_imp.id(9612414076222371232)
,p_interactive_grid_id=>wwv_flow_imp.id(9611918957110877095)
,p_static_id=>'20501563'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9612414279437371232)
,p_report_id=>wwv_flow_imp.id(9612414076222371232)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5879803158119433782)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(5874805027812251962)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7562266231899024977)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9612411068565370889)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612414790126371235)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9611919082727877096)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612415523549371241)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9611919176636877097)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612416485406371248)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9611919292990877098)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612417346977371252)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9611919365394877099)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612418294881371259)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9611919474228877100)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612419150964371265)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9611919541801877101)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612420033907371271)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9611919627643877102)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612420924980371276)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9611919715924877103)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612421834981371282)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9611919811190877104)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612422748890371287)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9611919970491877105)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612423613267371290)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9611920070164877106)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612424587986371293)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9611920111668877107)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612425401138371299)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9611920293820877108)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612426395135371302)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9611920362293877109)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612427272849371307)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9612408127999370860)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612428126347371312)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9612408233131370861)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612429007274371315)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9612408341211370862)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>206
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612429980640371319)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9612408436498370863)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9612542038309495238)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9612410969200370888)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9633690495358963901)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9633680844096958260)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>292
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9633821240068025949)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9633680976179958261)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9634025248883243044)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(9633681076186958262)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9640739766757166532)
,p_view_id=>wwv_flow_imp.id(9612414279437371232)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(9633685783194958309)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13709269335957627557)
,p_plug_name=>'<span style="color:#003968; font-weight:bold;">&P211131011_DISASPLAY.</span>'
,p_static_id=>'span-style-color-003968-font-weight-bold-p211131011-disasplay-span'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'USER_BUS_FUN_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P211131011_USER_ACCESS_COUNT > 0 OR :P211131011_PREFIX_ACCES_COUNT >0 OR :P211131011_BUS_FUNC_COUNT >0'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9611916127219877067)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P211131011_ROWID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562301575550025088)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562303618149025092)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Add_Bus_Func'
,p_static_id=>'add-bus-func'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Bus. Func.'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:211131013:&SESSION.::&DEBUG.::P211131013_UBFAH_DOC_NO,P211131013_UBFAT_USER,P211131013_UBFAH_EFF_FROM,P211131013_UBFAH_EFF_TO,P211131013_HEADER_ROWID:&P211131011_UBFAH_DOC_NO.,&P211131011_UBFAH_USER.,&P211131011_UBFAH_EFF_FROM.,&P211131011_UBFAH_EFF_TO.,&P211131011_ROWID.'
,p_button_condition=>'P211131011_UBFAH_LOAD_FLAG'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562304805284025095)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131010:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562298544108025082)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_button_name=>'Bus_func_add'
,p_static_id=>'bus-func-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562299279528025084)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_button_name=>'Bus_func_Download'
,p_static_id=>'bus-func-download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562298854495025084)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_button_name=>'Bus_func_Save'
,p_static_id=>'bus-func-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562304391832025095)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_condition=>'P211131011_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562284519462025038)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_button_name=>'Copy_1'
,p_static_id=>'copy'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copy'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:211131014:&SESSION.::&DEBUG.::P211131014_USER,P211131014_UBFAH_DOC_NO,P211131014_ROWID,P211131014_TYPE,P211131014_PLNT,P211131014_PLNT_LOC_ID:&P211131011_UBFAH_USER.,&P211131011_UBFAH_DOC_NO.,&P211131011_ROWID.,PFX,&P211131011_UPAL_PLNT.,&P211131011_UPAL_PLNT_LOC_ID.'
,p_button_condition=>':P211131011_PREFIX_ACCES_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-copy'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562299689611025084)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_button_name=>'Copy'
,p_static_id=>'copy-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Copy'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:211131015:&SESSION.::&DEBUG.::P211131015_USER,P211131015_UBFAH_DOC_NO,P211131015_TYPE,P211131015_PLNT,P211131015_PLNT_LOC_ID,P211131015_ROWID:&P211131011_UBFAH_USER.,&P211131011_UBFAH_DOC_NO.,BUS,&P211131011_UPAL_PLNT.,&P211131011_UPAL_PLNT_LOC_ID.,&P211131011_ROWID.'
,p_button_condition=>':P211131011_BUS_FUNC_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-copy'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562302429610025090)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P211131011_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562284854226025040)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_button_name=>'Delete_All'
,p_static_id=>'delete-all'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete All'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P211131011_PREFIX_ACCES_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7694119520711857050)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_button_name=>'Delete_all_bus_fun'
,p_static_id=>'delete-all-bus-fun'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete All '
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P211131011_BUS_FUNC_COUNT > 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562305208772025095)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'First'
,p_static_id=>'first'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'First'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&GLOBAL_FIRST_ROWID.'
,p_icon_css_classes=>'fa-angle-double-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562306336039025096)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Last'
,p_static_id=>'last'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Last'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&GLOBAL_LAST_ROWID.'
,p_icon_css_classes=>'fa-angle-double-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562302737856025090)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Load_Existing_N'
,p_static_id=>'load-existing-n'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load Existing '
,p_button_position=>'EDIT'
,p_button_condition=>':P211131011_UBFAH_LOAD_FLAG =''N'' and :P211131011_ROWID is not null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562303216797025090)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Load_Existing_Y'
,p_static_id=>'load-existing-y'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load Existing '
,p_button_position=>'EDIT'
,p_button_condition=>':P211131011_UBFAH_LOAD_FLAG =''Y'' and :P211131011_ROWID is not null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check-square'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562305972817025096)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&GLOBAL_NEXT_ROWID.'
,p_button_condition=>'GLOBAL_NEXT_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562303986008025092)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
,p_button_condition=>'P211131011_UBFAH_LOAD_FLAG'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562283310141025038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_button_name=>'Prefix_access_Add'
,p_static_id=>'prefix-access-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562284036965025038)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_button_name=>'Prefix_access_Download'
,p_static_id=>'prefix-access-download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562283639090025038)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_button_name=>'Prefix_access_Save'
,p_static_id=>'prefix-access-save'
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
 p_id=>wwv_flow_imp.id(7562305593943025095)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'Previous'
,p_static_id=>'previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&GLOBAL_PREV_ROWID.'
,p_button_condition=>'GLOBAL_PREV_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562302016830025090)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7560454215152757351)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P211131011_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562268405421025001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_button_name=>'Unit_Access_Add'
,p_static_id=>'unit-access-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'style="background-color: blue;"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562269226804025003)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_button_name=>'Unit_Access_Download'
,p_static_id=>'unit-access-download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562268768245025003)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_button_name=>'Unit_Access_Save'
,p_static_id=>'unit-access-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5618841250260638932)
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&P211131011_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7562302429610025090)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7562353604879025218)
,p_branch_name=>'Go To Page 236131090'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_P_DOC_NO,P236131090_P_PAGE_ID:WF_UBFA,&P211131011_UBFAH_DOC_NO.,211131010&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P211131011_WF_COUNT = ''F'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7562353942088025218)
,p_branch_name=>'Go To Page 2111310'
,p_branch_action=>'f?p=&APP_ID.:2111310:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P211131011_WF_COUNT = ''A'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7648352450358061643)
,p_branch_name=>'Go To Page 2111310'
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7562304391832025095)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562269627103025003)
,p_name=>'P211131011_AUPAL_DEFLT_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562269945474025007)
,p_name=>'P211131011_AUPAL_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562270396267025007)
,p_name=>'P211131011_AUPAL_ROW_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5862165054510668259)
,p_name=>'P211131011_AUPL_ROW_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5707061952399309263)
,p_name=>'P211131011_BUS_FUNC_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)',
'  from USER_BUS_FUN_ACCESS_LN',
'  where UBFAL_BU=:global_bu',
'  and UBFAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562306832786025096)
,p_name=>'P211131011_DISASPLAY'
,p_item_sequence=>10
,p_item_display_point=>'LEGACY_ORPHAN_COMPONENTS'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7620701339640413042)
,p_name=>'P211131011_LINE_COUNT'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from APPL_USER_PLANT_ACCESS_LN',
'  where AUPAL_BU=:global_bu',
'  and AUPAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5707061808386309261)
,p_name=>'P211131011_PREFIX_ACCES_COUNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select count(*)',
'  from USER_PREFIX_ACCESS_LN',
'  where UPAL_BU=:GLOBAL_BU',
'  and UPAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562310326162025109)
,p_name=>'P211131011_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562311062142025110)
,p_name=>'P211131011_UBFAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':global_bu'
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
 p_id=>wwv_flow_imp.id(7562311860194025110)
,p_name=>'P211131011_UBFAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':global_user'
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
 p_id=>wwv_flow_imp.id(7562312313395025113)
,p_name=>'P211131011_UBFAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'sysdate'
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
 p_id=>wwv_flow_imp.id(7562312715850025113)
,p_name=>'P211131011_UBFAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_source=>'UBFAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562313107224025113)
,p_name=>'P211131011_UBFAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':GLOBAL_IP_ADDR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562313505026025115)
,p_name=>'P211131011_UBFAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':GLOBAL_OS_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7694118855283857044)
,p_name=>'P211131011_UBFAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<span style="color:#0480e9; ">Doc. Date</span>'
,p_source=>'UBFAH_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_css_classes=>'display_item'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562309464993025107)
,p_name=>'P211131011_UBFAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_source=>'UBFAH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700643136534551943)
,p_name=>'P211131011_UBFAH_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<span style="color:#0480e9; ">Eff. From</span>'
,p_format_mask=>'DD-MON-RRRR'
,p_source=>'UBFAH_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_css_classes=>'display_item'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700684034662555257)
,p_name=>'P211131011_UBFAH_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'31-Dec-2099'
,p_prompt=>'<span style="color:#0480e9; ">Eff. To</span>'
,p_format_mask=>'DD-MON-RRRR'
,p_source=>'UBFAH_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_css_classes=>'display_item'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562310664278025109)
,p_name=>'P211131011_UBFAH_LOAD_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'N'
,p_source=>'UBFAH_LOAD_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562309051371025106)
,p_name=>'P211131011_UBFAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_prompt=>'<span style="color:#0480e9; ">Reference</span>'
,p_source=>'UBFAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562311526588025110)
,p_name=>'P211131011_UBFAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'N'
,p_source=>'UBFAH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562315879002025120)
,p_name=>'P211131011_UBFAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'D'
,p_source=>'UBFAH_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562313910698025117)
,p_name=>'P211131011_UBFAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':global_user'
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
 p_id=>wwv_flow_imp.id(7562314326997025117)
,p_name=>'P211131011_UBFAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>'sysdate'
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
 p_id=>wwv_flow_imp.id(7562314645608025118)
,p_name=>'P211131011_UBFAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_source=>'UBFAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562315051517025118)
,p_name=>'P211131011_UBFAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':GLOBAL_IP_ADDR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562315504398025118)
,p_name=>'P211131011_UBFAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':GLOBAL_OS_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'UBFAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562307518842025098)
,p_name=>'P211131011_UBFAH_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_prompt=>'<span style="color:#0480e9; ">User</span>'
,p_source=>'UBFAH_USER'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER(UAM1010)'
,p_cSize=>32
,p_cMaxlength=>15
,p_colspan=>2
,p_read_only_when=>'P211131011_UBFAH_LOAD_FLAG'
,p_read_only_when2=>'Y'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-user-circle-o'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
  'title', 'User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562308728105025106)
,p_name=>'P211131011_UBFAH_VERT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_source_plug_id=>wwv_flow_imp.id(13709269335957627557)
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
 p_id=>wwv_flow_imp.id(5874805254122251965)
,p_name=>'P211131011_UBFAL_ROWID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9612408563341370864)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562285330301025042)
,p_name=>'P211131011_UPAL_DFLT_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562285699618025042)
,p_name=>'P211131011_UPAL_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562286507352025043)
,p_name=>'P211131011_UPAL_DOC_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562286914540025046)
,p_name=>'P211131011_UPAL_PLNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562287275688025046)
,p_name=>'P211131011_UPAL_PLNT_LOC_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562286092104025043)
,p_name=>'P211131011_UPAL_ROWID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9611918863373877094)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5707061927581309262)
,p_name=>'P211131011_USER_ACCESS_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9611916748234877073)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)',
'  from APPL_USER_PLANT_ACCESS_LN',
'  where AUPAL_BU=:global_bu',
'  and AUPAL_DOC_NO=:P211131011_UBFAH_DOC_NO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7604591914672412833)
,p_name=>'P211131011_VERTICAL_ID_NB'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_item_default=>':GLOBAL_VERTICAL'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<span style="color:#0480e9; ">Vertical</span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
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
 p_id=>wwv_flow_imp.id(7562316299805025120)
,p_name=>'P211131011_WF_COUNT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(13709269335957627557)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562271285816025010)
,p_tabular_form_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_validation_name=>'Assign_eff_from_ln'
,p_static_id=>'assign-eff-from-ln'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AUPAL_EFF_FROM IS NULL THEN',
'	 return(''Eff. From must be entered.'');',
'-- ELSIF TO_DATE(:AUPAL_EFF_FROM,''DD-MON-RRRR'') < TO_DATE(:AUPAL_EFF_TO,''DD-MON-RRRR'') THEN',
'--     return(''From date should be less than or equal to To date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AUPAL_EFF_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562271683976025010)
,p_tabular_form_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_validation_name=>'Assign_eff_to_ln'
,p_static_id=>'assign-eff-to-ln'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AUPAL_EFF_TO IS NULL THEN',
'	 return(''Eff. To must be entered.'');',
'',
'ELSIF TO_DATE(:AUPAL_EFF_TO,''DD-MON-RRRR'') < TO_DATE(:AUPAL_EFF_FROM,''DD-MON-RRRR'') THEN',
'return(''To date should be greater than or equal to From date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AUPAL_EFF_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562270908973025009)
,p_tabular_form_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_validation_name=>'Assign_loc_id'
,p_static_id=>'assign-loc-id'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AUPAL_PLNT_LOC_ID IS NULL THEN ',
'	 return(''Unit Location must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AUPAL_PLNT_LOC_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562287759040025048)
,p_tabular_form_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_validation_name=>'Assign_loc_id_pf'
,p_static_id=>'assign-loc-id-pf'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :UPAL_PLNT_LOC_ID is NULL THEN ',
'	 return(''Location must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UPAL_PLNT_LOC_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7694119362223857049)
,p_validation_name=>'Assign_refrence'
,p_static_id=>'assign-refrence'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P211131011_UBFAH_REFERENCE is null then',
'	return(''Refrence Must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7562309051371025106)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562329090029025156)
,p_validation_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UBFAH_USER IS NULL THEN',
'	return(''User must be entered.'');',
'ELSE',
'',
'	DECLARE',
'	',
'	CURSOR c1',
'	IS',
'	SELECT 1',
'	 FROM APPL_USERS',
'	WHERE APPLUSER_BU =:GLOBAL_bu',
'	  AND appluser_id = :P211131011_UBFAH_USER;',
'	',
'	cr1			c1%ROWTYPE;',
'		',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		',
'		IF c1%NOTFOUND THEN',
'			return(''User does not exist.'');',
'		END IF;	',
'		',
'		CLOSE c1;',
'		',
'	END;	',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7562302429610025090)
,p_associated_item=>wwv_flow_imp.id(7562307518842025098)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7694119005942857045)
,p_validation_name=>'Eff_from'
,p_static_id=>'eff-from'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UBFAH_EFF_FROM IS NULL THEN',
'	return(''Effective from date must be entered.'');',
'ELSE ',
'	IF to_date(:P211131011_UBFAH_EFF_TO,''DD-MON-RRRR'') < TO_DATE(:P211131011_UBFAH_EFF_FROM,''DD-MON-RRRR'')  THEN',
'		return(''Effective from date should be lesser than or equal to effective to date.'');',
'	END IF;	',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7700643136534551943)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7694119093480857046)
,p_validation_name=>'Eff to'
,p_static_id=>'eff-to'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UBFAH_EFF_TO IS NULL THEN',
'	return(''Effective to date must be entered.'');',
'END IF;	',
'',
'IF :P211131011_UBFAH_EFF_TO < :P211131011_UBFAH_EFF_FROM THEN',
'	return('' Effective to date should be greater than or equal to effective from date.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7700684034662555257)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562300233368025085)
,p_tabular_form_region_id=>wwv_flow_imp.id(9612408563341370864)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :UBFAL_EFF_FROM IS NULL THEN',
'	RETURN(''Eff From  date must be entered.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UBFAL_EFF_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7562300555321025085)
,p_tabular_form_region_id=>wwv_flow_imp.id(9612408563341370864)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :UBFAL_EFF_TO IS NULL THEN',
'	return(''Eff to date must be entererd.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UBFAL_EFF_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562346799463025204)
,p_name=>'Add_unit_acces'
,p_static_id=>'add-unit-acces'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562268405421025001)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562347269935025204)
,p_event_id=>wwv_flow_imp.id(7562346799463025204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_unit_access" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562352210980025217)
,p_name=>'Assign_bus_fun_id'
,p_static_id=>'assign-bus-fun-id'
,p_event_sequence=>190
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9612408563341370864)
,p_triggering_element=>'UBFAL_BUS_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562352689669025217)
,p_event_id=>wwv_flow_imp.id(7562352210980025217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'BUS_FUN_DESC',
  'items_to_submit', 'UBFAL_BUS_FUN_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :ubfal_bus_fun_id IS NOT NULL THEN		',
    '	:bus_fun_desc:=func_find_bus_fun_desc(:GLOBAL_bu,:ubfal_bus_fun_id);',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562345857633025204)
,p_name=>'Assign_doc_type'
,p_static_id=>'assign-doc-type'
,p_event_sequence=>180
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_triggering_element=>'UPAL_DOC_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562346379418025204)
,p_event_id=>wwv_flow_imp.id(7562345857633025204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'APPL',
  'items_to_submit', 'UPAL_DOC_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :upal_DOC_TYPE IN (''DMR'',''CMR'',''DMI'',''CMI'',''II'',''IR'',''LCI'',''LGI'',''LCR'',''LGR'',''IIM'',''IIT'',''PV'',''PAD'',''RV'',''OV'',''PR'',''PI'',''DV'',''IIE'',''ABGI'',''PBGI'',''SBGI'',''EBGI'',''ABGR'',''PBGR'',''SBGR'',''EBGR'',''PC'',''DEP'') THEN',
    '	:APPL := ''FIN'';',
    'ELSIF :upal_DOC_TYPE IN (''SD'',''SO'',''SQ'',''SR'',''DE'',''FS'',''FE'',''TP'',''SW'',''TPNSL'',''SE'',''SJ'',''SP'',''RW'',''RL'',''RE'',''GR'',''SL'',''QR'',''SV'',''STS'',''SOO'',''VI'',''RU'',''STSE'') THEN',
    '	:APPL := ''SOM'';',
    'ELSIF :upal_DOC_TYPE IN (''PREQ'',''PQUT'',''PORD'',''PRPT'',''PRNR'',''PLND'',''PCRPT'',''PCRQ'',''PRTN'',''PCOD'',''ST'',''OS'',''OR'',''REFQ'',''SC'',''SRPT'',''SREQ'',''SCDC'',''POO'',''SSPR'',''SSSCR'',''SSPO'',''SSSCO'',''SCRQT'') THEN',
    '	:APPL := ''POM'';',
    'ELSIF :upal_DOC_TYPE IN (''INSP'',''INSPC'') THEN',
    ':APPL := ''TQM'';',
    'ELSIF :upal_DOC_TYPE IN (''PINV'',''SORD'',''PMWO'') THEN',
    '	:APPL := ''CRM'';',
    'ELSIF :upal_DOC_TYPE IN (''SA'',''MR'',''MI'',''IC'',''SS'',''FR'',''CYC'',''SCR'') THEN',
    '	:APPL := ''ICM'';',
    'ELSIF :upal_DOC_TYPE IN (''LD'')THEN',
    ':APPL := ''FLM'';',
    'ELSIF :upal_DOC_TYPE IN (''GEN'')THEN',
    ':APPL := ''GEM'';',
    'ELSIF :upal_DOC_TYPE IN (''FP'')THEN',
    ':APPL := ''SFM'';',
    'ELSE',
    '	NULL;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562340471186025193)
,p_name=>'Assign_loc_id'
,p_static_id=>'assign-loc-id'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_triggering_element=>'AUPAL_PLNT_LOC_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562341007166025196)
,p_event_id=>wwv_flow_imp.id(7562340471186025193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'LOCATION_NAME,AUPAL_PLANT',
  'items_to_submit', 'AUPAL_PLNT_LOC_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :AUPAL_PLNT_LOC_ID IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM bus_unit_plants_loc_dtls',
    '	 	   WHERE bupld_bu = :GLOBAL_bu',
    '           and BUPLD_LOC_ID=:AUPAL_PLNT_LOC_ID;',
    '	 	   --   AND bupld_loc_name = :APPL_USER_PLANT_ACCESS_LN.AUPAL_PLNT_LOC_DESC;',
    '	 	     ',
    '	 	   cr1						c1%ROWTYPE;',
    '	 	   ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	  ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  raise_application_error(-20999,''Unit Location not found.'');',
    '	 	     ELSE',
    '	 	     	',
    '	 	     	--   IF (:APPL_USER_PLANT_ACCESS_LN.AUPAL_PLNT_LOC_ID IS NULL OR GET_ITEM_PROPERTY(''APPL_USER_PLANT_ACCESS_LN.AUPAL_PLNT_LOC_ID'', DATABASE_VALUE) <> cr1.bupld_loc_id) THEN',
    '	 	     	     :Location_name := cr1.bupld_loc_name;',
    '					  :AUPAL_PLANT   := cr1.bupld_plnt;',
    '	 	     	--   END IF;',
    '	 	     	  ',
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
 p_id=>wwv_flow_imp.id(7562344113681025201)
,p_name=>'Assign_loc_id_pf'
,p_static_id=>'assign-loc-id-pf'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_triggering_element=>'UPAL_PLNT_LOC_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562344535761025203)
,p_event_id=>wwv_flow_imp.id(7562344113681025201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'UPAL_PLNT',
  'items_to_submit', 'UPAL_PLNT_LOC_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :UPAL_PLNT_LOC_ID IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM bus_unit_plants_loc_dtls,',
    '	 	    		 appl_doc_pfx_loc',
    '	 	   WHERE bupld_bu = :GLOBAL_bu',
    '	 	     AND bupld_bu = adpl_bu',
    '	 	     --AND bupld_pfx = adpl_pfx',
    '	 	     AND adpl_pfx   = :UPAL_PFX',
    '	 	     AND bupld_plnt = adpl_plnt',
    '	 	     AND adpl_loc_id = bupld_loc_id',
    '	 	     AND bupld_loc_id = :UPAL_PLNT_LOC_ID;',
    '	 	     ',
    '	 	   cr1						c1%ROWTYPE;',
    '	 	   ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	  ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  raise_application_error(-20999,''Location not found.'');',
    '	 	     ELSE',
    '	 	     	',
    '	 	     	--   IF (:USER_PREFIX_ACCESS_LN.UPAL_PLNT_LOC_ID IS NULL OR GET_ITEM_PROPERTY(''USER_PREFIX_ACCESS_LN.UPAL_PLNT_LOC_ID'', DATABASE_VALUE) <> cr1.bupld_loc_id) THEN',
    '	 	     	   --   :USER_PREFIX_ACCESS_LN.UPAL_PLNT_LOC_ID := cr1.bupld_loc_id;',
    '	 	     	     :UPAL_PLNT 		   := cr1.bupld_plnt;',
    '	 	     	--   END IF;',
    '	 	     	  ',
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
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5707061621476309259)
,p_name=>'Assign_Pfx_1'
,p_static_id=>'assign-pfx'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_triggering_element=>'UPAL_PFX'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5707061723819309260)
,p_event_id=>wwv_flow_imp.id(5707061621476309259)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Assign Pfx.'
,p_static_id=>'assign-pfx'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PFX_DESC,UPAL_DOC_TYPE,APPL,UPAL_PLNT,PLNT_DESC,UPAL_PLNT_LOC_ID',
  'items_to_submit', 'UPAL_PFX',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE ',
    '	CURSOR c1 ',
    '	is ',
    '	 SELECT cadp_desc1',
    '        FROM corp_appl_doc_prefixes',
    '       WHERE cadp_bu = :global_bu AND cadp_pfx =  :UPAL_PFX;',
    '       ',
    '       CURSOR c2 ',
    '       IS ',
    '        SELECT adp_desc1, adp_desc2',
    '        FROM appl_doc_prefixes',
    '       WHERE adp_bu = :GLOBAL_BU AND adp_pfx =  :UPAL_PFX;  ',
    '       ',
    '       cr1 c1%ROWTYPE;',
    '       cr2 c2%ROWTYPE;',
    '      ',
    'BEGIN ',
    '	OPEN c1;',
    '	FETCH c1 INTO cr1;',
    '	IF c1%FOUND THEN ',
    '		OPEN c2;',
    '		IF c2%FOUND THEN ',
    '			raise_application_error(-20999,''Corparate purchase request pfx and Standard request pfx should not be same'');',
    '		ELSE ',
    '			IF :UPAL_PFX IS NOT NULL THEN',
    '					:pfx_desc:=func_find_c_appl_prefix_desc(:global_bu,:UPAL_PFX,1);',
    '			            SELECT cadp_doc_type',
    '     				        INTO :upal_doc_type',
    '     				    FROM corp_appl_doc_prefixes',
    '    			       WHERE cadp_bu = :global_bu',
    '    			       AND cadp_pfx = :upal_pfx;',
    '    ',
    '    ELSE',
    '			raise_application_error(-20999,''Prefix must be entered.'');',
    'END IF;',
    '			END IF;',
    '			CLOSE C2;',
    '    ELSE ',
    '    		IF :UPAL_PFX IS NOT NULL THEN',
    '			 :pfx_desc:=func_find_appl_prefix_desc(:global_bu,:UPAL_PFX,1);',
    '    ',
    '  SELECT adp_doc_type, adp_appl, adp_plnt,func_find_plnt_desc (adp_bu,adp_plnt,1) plnt_desc,  ',
    '                     (SELECT bupld_loc_id',
    '                        FROM bus_unit_plants_loc_dtls,appl_doc_pfx_loc',
    '                           WHERE  bupld_bu = adpl_bu',
    '                            AND bupld_plnt = adpl_plnt',
    '                            AND adpl_loc_id = bupld_loc_id',
    '                           AND ADPL_BU=adp_bu',
    '                           AND adpl_pfx   = adp_pfx',
    '                           AND adpl_plnt = adp_plnt)LOCATION_ID',
    '     INTO :upal_doc_type, :appl, :upal_plnt,:PLNT_DESC ,:UPAL_PLNT_LOC_ID',
    '     FROM appl_doc_prefixes',
    '    WHERE adp_bu = :global_bu',
    '    AND   adp_pfx = :UPAL_PFX;  ',
    '      ',
    '    ',
    '    ',
    '		ELSE',
    '		raise_application_error(-20999,''Prefix must be entered.'');',
    '	END IF;',
    'CLOSE C1;',
    'END IF;',
    'END ;',
    '		',
    '			',
    '       ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562338142519025190)
,p_name=>'Bus_fun_refresh'
,p_static_id=>'bus-fun-refresh'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9612408563341370864)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562338712184025192)
,p_event_id=>wwv_flow_imp.id(7562338142519025190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562334610898025174)
,p_name=>'Bus_func_add'
,p_static_id=>'bus-func-add'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562298544108025082)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562335080695025176)
,p_event_id=>wwv_flow_imp.id(7562334610898025174)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_bus_func" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562336385099025178)
,p_name=>'Bus_func_Download'
,p_static_id=>'bus-func-download'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562299279528025084)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562336870159025185)
,p_event_id=>wwv_flow_imp.id(7562336385099025178)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_bus_func" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562335486020025176)
,p_name=>'Bus_func_Save'
,p_static_id=>'bus-func-save'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562298854495025084)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562335994047025178)
,p_event_id=>wwv_flow_imp.id(7562335486020025176)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_bus_func" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562348633706025206)
,p_name=>'Download_Unit_Access'
,p_static_id=>'download-unit-access'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562269226804025003)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562349074695025207)
,p_event_id=>wwv_flow_imp.id(7562348633706025206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_unit_access" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562349483389025207)
,p_name=>'Enable/Disable(load_Y)'
,p_static_id=>'enable-disable-load-y'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562303618149025092)
,p_condition_element=>'P211131011_UBFAH_LOAD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562349939213025207)
,p_event_id=>wwv_flow_imp.id(7562349483389025207)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7562303618149025092)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562344964180025203)
,p_name=>'Enable/Disable(St_new)'
,p_static_id=>'enable-disable-st-new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562303618149025092)
,p_condition_element=>'P211131011_UBFAH_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562345461107025203)
,p_event_id=>wwv_flow_imp.id(7562344964180025203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7562303618149025092)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562339068264025192)
,p_name=>'Enable/Disable(Status_New)'
,p_static_id=>'enable-disable-status-new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562303986008025092)
,p_condition_element=>'P211131011_UBFAH_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562339588592025192)
,p_event_id=>wwv_flow_imp.id(7562339068264025192)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7562303986008025092)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562340123034025193)
,p_event_id=>wwv_flow_imp.id(7562339068264025192)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7562303986008025092)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P211131011_UBFAH_LOAD_FLAG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562341343407025198)
,p_name=>'Prefix_access_Add'
,p_static_id=>'prefix-access-add'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562283310141025038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562341848675025198)
,p_event_id=>wwv_flow_imp.id(7562341343407025198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_prefix_access" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562343138474025199)
,p_name=>'Prefix_access_Download'
,p_static_id=>'prefix-access-download'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562284036965025038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562343670372025201)
,p_event_id=>wwv_flow_imp.id(7562343138474025199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_prefix_access" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562351281902025210)
,p_name=>'Prefix_access_refresh'
,p_static_id=>'prefix-access-refresh'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562351814151025217)
,p_event_id=>wwv_flow_imp.id(7562351281902025210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562342274973025198)
,p_name=>'Prefix_access_Save'
,p_static_id=>'prefix-access-save'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562283639090025038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562342818901025199)
,p_event_id=>wwv_flow_imp.id(7562342274973025198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_prefix_access" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562347680296025206)
,p_name=>'Save_unit_Access'
,p_static_id=>'save-unit-access'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7562268768245025003)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562348219193025206)
,p_event_id=>wwv_flow_imp.id(7562347680296025206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_unit_access" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7562337328150025185)
,p_name=>'Unit_access_Refresh'
,p_static_id=>'unit-access-refresh'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7562337788167025190)
,p_event_id=>wwv_flow_imp.id(7562337328150025185)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562300849987025085)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9612408563341370864)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bus. Func. - Save Interactive Grid Data'
,p_static_id=>'bus-func-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'SELECT NVL(MAX(ubfal_seq_no),0) + 1',
'  INTO :ubfal_seq_no',
'  FROM USER_BUS_FUN_ACCESS_LN',
' WHERE ubfal_bu = :GLOBAL_bu',
'   AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO; ',
'INSERT INTO user_bus_fun_access_ln',
'											(ubfal_bu,',
'											 ubfal_doc_no,',
'											 ubfal_seq_no,',
'											 ubfal_bus_fun_id,',
'											 ubfal_cre_by,',
'											 ubfal_cre_date,',
'											 ubfal_cre_emp_id,',
'											 ubfal_cre_ip_addr,',
'											 ubfal_cre_os_user)',
'VALUES',
'											(:GLOBAL_BU,',
'											 :P211131011_UBFAH_DOC_NO,',
'											 :UBFAL_SEQ_NO,',
'											 :UBFAL_BUS_FUN_ID,',
'											 :GLOBAL_USER,',
'											 SYSDATE,',
'											 :UBFAL_CRE_EMP_ID,',
'											 :GLOBAL_IP_ADDR,',
'											 :GLOBAL_OS_USER);',
'elsIF :APEX$ROW_STATUS = ''U'' THEN',
'UPDATE user_bus_fun_access_ln',
'SET',
'			ubfal_bus_fun_id				=:UBFAL_BUS_FUN_ID,',
'			ubfal_upd_by					=:GLOBAL_USER,',
'			ubfal_upd_date					=SYSDATE',
'',
'	  WHERE UBFAL_BU					    =:GLOBAL_BU',
'		AND UBFAL_DOC_NO 				  	=:P211131011_UBFAH_DOC_NO',
'		AND UBFAL_SEQ_NO					=:UBFAL_SEQ_NO;',
'ELSE ',
'DELETE FROM  user_bus_fun_access_ln',
'	  WHERE   ubfal_bu					   =:GLOBAL_BU',
'		AND    ubfal_doc_no 				  	=:P211131011_UBFAH_DOC_NO',
'		AND    ubfal_seq_no					=:UBFAL_SEQ_NO;',
'',
'COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2080339014443414057
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562332140157025165)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'	update USER_BUS_FUN_ACCESS_HD',
'		set ubfah_status =''C''',
' 	where UBFAH_BU=:global_bu',
'	and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
' ',
' COMMIT;',
' ',
' 	  apex_application.g_print_success_message := ''Document cancelled.'';',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562304391832025095)
,p_internal_uid=>2080370304613414137
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562333812095025173)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Default_flg_Prefix_Access'
,p_static_id=>'default-flg-prefix-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UPAL_DFLT_FLAG = ''N'' THEN',
'    :P211131011_UPAL_DFLT_FLAG := ''Y'';',
'else',
'    :P211131011_UPAL_DFLT_FLAG := ''N'';',
'end if;',
'',
'IF :P211131011_UPAL_DFLT_FLAG = ''Y'' AND ',
'	 :P211131011_UPAL_DOC_TYPE NOT IN (''BV'',''CMI'',''DMI'',''CMR'',''DMR'',''PI'',''PR'',''JV'')',
'	THEN',
'	',
'DECLARE',
'	v_cnt NUMBER;',
'BEGIN',
'    SELECT COUNT(1) ',
'      INTO v_cnt      ',
'      FROM user_prefix_access_ln,',
'           appl_doc_prefixes,',
'           appl_doc_pfx_loc',
'     WHERE upal_bu = adp_bu',
'       AND upal_pfx = adp_pfx',
'       AND upal_dflt_flag = ''Y''',
'       AND adp_bu = adpl_bu',
'       AND adp_plnt = adpl_plnt',
'       AND adp_pfx  = adpl_pfx',
'       AND upal_bu = :GLOBAL_bu',
'       AND upal_doc_no = :P211131011_UPAL_DOC_NO       ',
'       AND adp_plnt = :P211131011_UPAL_PLNT',
'       AND adpl_loc_id = :P211131011_UPAL_PLNT_LOC_ID',
'       AND adp_doc_type = :P211131011_UPAL_DOC_TYPE; ',
'',
'IF v_cnt > 1 THEN',
'	:P211131011_UPAL_DFLT_FLAG := ''N'';',
'	COMMIT;',
'	raise_application_error(-20999,''Multiple Prefix cannot be set as Default for the Document Type.'');',
'END IF;	',
'',
'END;	',
'END IF;	',
'IF :P211131011_UPAL_DFLT_FLAG = ''Y'' then',
' update USER_PREFIX_ACCESS_LN',
'	set UPAL_DFLT_FLAG =''Y''',
'	where ROWID =:P211131011_UPAL_ROWID;',
'COMMIT;',
'END IF;',
'IF :P211131011_UPAL_DFLT_FLAG = ''N'' then',
' update USER_PREFIX_ACCESS_LN',
'	set UPAL_DFLT_FLAG =''N''',
'	where ROWID =:P211131011_UPAL_ROWID;',
'COMMIT;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Default'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2080371976551414145
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562332968665025171)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Default_flg_Unit_access'
,p_static_id=>'default-flg-unit-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_AUPAL_DEFLT_FLAG = ''N'' THEN',
'    :P211131011_AUPAL_DEFLT_FLAG := ''Y'';',
'else',
'    :P211131011_AUPAL_DEFLT_FLAG := ''N'';',
'end if;',
'',
'',
'IF :P211131011_AUPAL_DEFLT_FLAG = ''Y'' THEN',
'	 ',
'	 DECLARE',
'	    v_cnt     NUMBER(5):= 0;',
'	 BEGIN',
'	    SELECT COUNT(1) ',
'	      INTO v_cnt',
'	      FROM APPL_USER_PLANT_ACCESS_LN',
'	     WHERE aupal_bu         = :GLOBAL_bu',
'	       AND aupal_doc_no    = :P211131011_AUPAL_DOC_NO',
'	       AND aupal_deflt_flag = ''Y'';',
'	       ',
'	    IF v_cnt <> 0 THEN',
'	    	 :P211131011_AUPAL_DEFLT_FLAG := ''N'';',
'	    	 COMMIT;',
'	    	 raise_application_error(-20999,''Default Unit should be single.'');',
'	    END IF;',
'	    ',
'	  END;',
'	    ',
'END IF;',
'	    	 ',
'commit;',
'IF :P211131011_AUPAL_DEFLT_FLAG = ''Y'' THEN',
'',
'update APPL_USER_PLANT_ACCESS_LN ',
'	set AUPAL_DEFLT_FLAG=''Y''',
'WHERE ROWID =:P211131011_AUPAL_ROW_ID;',
'commit;',
'end if;',
'IF :P211131011_AUPAL_DEFLT_FLAG = ''N'' THEN',
'',
'update APPL_USER_PLANT_ACCESS_LN ',
'	set AUPAL_DEFLT_FLAG=''N''',
'WHERE ROWID =:P211131011_AUPAL_ROW_ID;',
'commit;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Select'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2080371133121414143
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7694119570934857051)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete all Bus. Func.'
,p_static_id=>'delete-all-bus-func'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'  Delete   from USER_BUS_FUN_ACCESS_LN',
'  where UBFAL_BU=:global_bu',
'  and UBFAL_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'  commit;',
'  apex_application.g_print_success_message := ''Bus. Func. Access cleared.'';',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7694119520711857050)
,p_internal_uid=>2212157735391246023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562334164233025173)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete_All_Prefix_Access'
,p_static_id=>'delete-all-prefix-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM user_prefix_access_ln',
'	  WHERE upal_bu	=:GLOBAL_BU',
'		AND upal_doc_no =:P211131011_UBFAH_DOC_NO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562284854226025040)
,p_internal_uid=>2080372328689414145
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562330135739025157)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disaplay'
,p_static_id=>'disaplay'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_ROWID IS NULL THEN',
'   :P211131011_DISASPLAY :=''User Bus. Function Access'';',
'ELSIF :P211131011_ROWID IS NOT NULL  THEN  ',
'    :P211131011_DISASPLAY :=''Doc. No :''||'' ''||:P211131011_UBFAH_DOC_NO||''(''||:P211131011_UBFAH_USER||'')'';',
'END IF; '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2080368300195414129
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562330559027025157)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No Autogenerate'
,p_static_id=>'doc-no-autogenerate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(ubfah_doc_no),10000) + 1',
'  INTO :P211131011_UBFAH_DOC_NO',
'  FROM USER_BUS_FUN_ACCESS_HD',
' WHERE ubfah_bu = :GLOBAL_bu; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562302429610025090)
,p_internal_uid=>2080368723483414129
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562323310944025132)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(13709269335957627557)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Bus. Function Access'
,p_static_id=>'initialize-form-user-bus-function-access'
,p_internal_uid=>2080361475400414104
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5862165206677668260)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Line_delete_loac_access'
,p_static_id=>'line-delete-loac-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from APPL_USER_PLANT_ACCESS_LN',
'where rowid=:P211131011_AUPL_ROW_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'locdelete'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>380203371134057232
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5874805381303251966)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'line_wise_Delete_bus_fun'
,p_static_id=>'line-wise-delete-bus-fun'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete FROM USER_BUS_FUN_ACCESS_LN',
'where rowid=:P211131011_UBFAL_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'delete1'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>392843545759640938
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5874805127473251963)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'line_wise_delete_prefix_access'
,p_static_id=>'line-wise-delete-prefix-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM user_prefix_access_ln',
'where rowid =:P211131011_UPAL_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'delete'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>392843291929640935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562331373595025159)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load_existing_N'
,p_static_id=>'load-existing-n'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UBFAH_LOAD_FLAG = ''N'' THEN',
'    :P211131011_UBFAH_LOAD_FLAG :=''Y'';',
'else ',
'	:P211131011_UBFAH_LOAD_FLAG :=''N'';',
'end if;',
'',
'-- raise_application_error(-20999,:P211131011_UBFAH_LOAD_FLAG);',
'IF :P211131011_UBFAH_DOC_NO IS NOT NULL AND',
'	 :P211131011_UBFAH_USER  IS NOT NULL AND',
'	 :P211131011_UBFAH_LOAD_FLAG = ''Y''',
'	THEN',
'	-- raise_application_error(-20999,:P211131011_UBFAH_DOC_NO||''-''||:P211131011_UBFAH_USER||''-''||:P211131011_UBFAH_LOAD_FLAG);',
'		DELETE FROM USER_BUS_FUN_ACCESS_LN',
'		 WHERE ubfal_bu = :GLOBAL_BU',
'			 AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO;',
'		commit;',
'	',
'		DECLARE ',
'			v_seq_no	NUMBER;	',
'		BEGIN',
'			FOR cr1 IN (SELECT ubfa_bus_fun_id,ubfa_date_from,ubfa_date_to,apbuf_bus_fun_type,apbuf_module',
'                    FROM user_bus_fun_access,appl_bus_fun',
'                   WHERE apbuf_fun_id = ubfa_bus_fun_id',
'                     AND ubfa_bu = :GLOBAL_BU',
'                     AND ubfa_user_id = :P211131011_UBFAH_USER ',
'										 AND EXISTS (SELECT 1',
'			                             FROM appl_bus_fun_vert',
'			                            WHERE abfv_vertical_id = :GLOBAL_VERTICAL',
'			                              AND abfv_fun_id = ubfa_bus_fun_id ',
'			                              AND abfv_file_type IN (''FRM'',''RPT''))',
'			             ORDER BY TO_NUMBER(DECODE(apbuf_bus_fun_type,''C'',1,''E'',2,''Q'',3,''R'',4,5)),ubfa_bus_fun_id)',
'		  LOOP',
'		  	',
'		  	SELECT NVL(MAX(ubfal_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM USER_BUS_FUN_ACCESS_LN',
'				 WHERE ubfal_bu = :GLOBAL_BU',
'				   AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO; ',
'		  	',
'				INSERT INTO USER_BUS_FUN_ACCESS_LN (  UBFAL_BU,',
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
'																						  UBFAL_CRE_OS_USER)',
'																						VALUES',
'																						( :GLOBAL_BU,',
'																						  :P211131011_UBFAH_DOC_NO,',
'																						  v_seq_no,',
'																						  cr1.ubfa_bus_fun_id,',
'																						  cr1.apbuf_bus_fun_type,',
'																						  :P211131011_UBFAH_EFF_FROM,',
'																						  :P211131011_UBFAH_EFF_TO,',
'																						  cr1.apbuf_module,',
'																						  :GLOBAL_USER,',
'																						  SYSDATE,',
'																						--   :GLOBAL_EMP_ID,',
'																						  :UBFAL_CRE_EMP_ID,',
'																						  :GLOBAL_IP_ADDR,',
'																						  :GLOBAL_OS_USER);',
'		  END LOOP;',
'		  ',
'		  PROC_COMMIT;',
'		  ',
'		END;',
'		',
'		DELETE FROM USER_PREFIX_ACCESS_LN',
'		 WHERE upal_bu = :GLOBAL_BU',
'			 AND upal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	',
'		BEGIN',
'			FOR cr1 IN (SELECT upa_pfx,upa_dflt_flag,adp_plnt,adp_doc_type, upa_plnt_loc_id',
'                    FROM user_prefix_access,appl_doc_prefixes',
'                   WHERE upa_bu = adp_bu',
'                     AND upa_pfx = adp_pfx',
'                     AND upa_plnt = adp_plnt',
'                     AND upa_bu = :GLOBAL_BU',
'                     AND upa_user_id = :P211131011_UBFAH_USER ',
'			             ORDER BY upa_pfx)',
'		  LOOP',
'				INSERT INTO USER_PREFIX_ACCESS_LN  ( UPAL_BU,',
'																						  UPAL_DOC_NO,',
'																						  UPAL_PFX,',
'																						  UPAL_PLNT,',
'																						  UPAL_PLNT_LOC_ID,',
'																						  UPAL_DOC_TYPE,',
'																						  UPAL_DFLT_FLAG,',
'																						  UPAL_CRE_BY,',
'																						  UPAL_CRE_DATE,',
'																						  UPAL_CRE_EMP_ID,',
'																						  UPAL_CRE_IP_ADDR,',
'																						  UPAL_CRE_OS_USER)',
'																						VALUES',
'																						( :GLOBAL_BU,',
'																						  :P211131011_UBFAH_DOC_NO,',
'																						  cr1.upa_pfx,',
'																						  cr1.adp_plnt,',
'																						  cr1.upa_plnt_loc_id,',
'																						  cr1.adp_doc_type,',
'																						  cr1.upa_dflt_flag,',
'																						  :GLOBAL_user,',
'																						  SYSDATE,',
'																						  :UPAL_CRE_EMP_ID,',
'																						  :GLOBAL_IP_ADDR,',
'																						  :GLOBAL_OS_USER);',
'		  END LOOP;',
'		  ',
'		  PROC_COMMIT;',
'		  ',
'		END;		',
'		',
'		',
'		DELETE FROM APPL_USER_PLANT_ACCESS_LN',
'		 WHERE aupal_bu = :GLOBAL_BU',
'			 AND aupal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	',
'		BEGIN',
'			FOR cr1 IN (SELECT auba_plant,auba_deflt_flag, auba_plnt_loc_id',
'                    FROM appl_user_plant_access',
'                   WHERE auba_bu = :GLOBAL_BU',
'                     AND auba_user_id = :P211131011_UBFAH_USER ',
'			             ORDER BY auba_plant)',
'		  LOOP',
'				INSERT INTO APPL_USER_PLANT_ACCESS_LN(AUPAL_BU,',
'																						  AUPAL_DOC_NO,',
'																						  AUPAL_PLANT,',
'																						  AUPAL_PLNT_LOC_ID,',
'																						  AUPAL_DEFLT_FLAG,',
'																						  AUPAL_EFF_FROM,',
'																						  AUPAL_EFF_TO,',
'																						  AUPAL_CRE_BY,',
'																						  AUPAL_CRE_DATE,',
'																						  AUPAL_CRE_EMP_ID,',
'																						  AUPAL_CRE_IP_ADDR,',
'																						  AUPAL_CRE_OS_USER)',
'																						VALUES',
'																						( :GLOBAL_BU,',
'																						  :P211131011_UBFAH_DOC_NO,',
'																						  cr1.auba_plant,',
'																						  cr1.auba_plnt_loc_id,',
'																						  cr1.auba_deflt_flag,',
'																						  :P211131011_UBFAH_EFF_FROM,',
'																						  :P211131011_UBFAH_EFF_TO,																						  ',
'																						  :GLOBAL_user,',
'																						  SYSDATE,',
'																						  :GLOBAL_EMP_ID,',
'																						  :GLOBAL_IP_ADDR,',
'																						  :GLOBAL_OS_USER);',
'		  END LOOP;',
'		  ',
'		  PROC_COMMIT;',
'		  ',
'		END;		',
'',
' COMMIT;',
'END IF;	  ',
'',
'',
'IF :P211131011_UBFAH_LOAD_FLAG = ''Y'' THEN',
'',
'	UPDATE USER_BUS_FUN_ACCESS_HD',
'	   SET UBFAH_LOAD_FLAG = ''Y''',
'	 where UBFAH_BU=:global_bu',
'		and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'	   ',
'	-- APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Exception details not found.</span>'';',
'	commit;',
'			',
'ELSIF :P211131011_UBFAH_LOAD_FLAG = ''N'' THEN',
'',
'	UPDATE USER_BUS_FUN_ACCESS_HD',
'	   SET UBFAH_LOAD_FLAG = ''N''',
'	 where UBFAH_BU=:global_bu',
'		and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'   commit;',
'END IF;	',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562302737856025090)
,p_internal_uid=>2080369538051414131
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562332627683025165)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load_existing_Y'
,p_static_id=>'load-existing-y'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,''test'');',
'IF :P211131011_UBFAH_LOAD_FLAG = ''Y'' THEN',
'    :P211131011_UBFAH_LOAD_FLAG :=''N'';',
'else ',
'	:P211131011_UBFAH_LOAD_FLAG :=''Y'';',
'end if;',
'-- raise_Application_error(-20999,:P211131011_UBFAH_LOAD_FLAG);',
'',
'IF :P211131011_UBFAH_DOC_NO IS NOT NULL AND',
'	 :P211131011_UBFAH_USER  IS NOT NULL AND',
'	 :P211131011_UBFAH_LOAD_FLAG = ''N''',
'	THEN',
'	',
'		DELETE FROM USER_BUS_FUN_ACCESS_LN',
'		 WHERE ubfal_bu = :GLOBAL_BU',
'			 AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	',
'		-- DECLARE ',
'		-- 	v_seq_no	NUMBER;	',
'		-- BEGIN',
'		-- 	FOR cr1 IN (SELECT ubfa_bus_fun_id,ubfa_date_from,ubfa_date_to,apbuf_bus_fun_type,apbuf_module',
'        --             FROM user_bus_fun_access,appl_bus_fun',
'        --            WHERE apbuf_fun_id = ubfa_bus_fun_id',
'        --              AND ubfa_bu = :GLOBAL_BU',
'        --              AND ubfa_user_id = :P211131011_UBFAH_USER ',
'		-- 								 AND EXISTS (SELECT 1',
'		-- 	                             FROM appl_bus_fun_vert',
'		-- 	                            WHERE abfv_vertical_id = :GLOBAL_VERTICAL',
'		-- 	                              AND abfv_fun_id = ubfa_bus_fun_id ',
'		-- 	                              AND abfv_file_type IN (''FRM'',''RPT''))',
'		-- 	             ORDER BY TO_NUMBER(DECODE(apbuf_bus_fun_type,''C'',1,''E'',2,''Q'',3,''R'',4,5)),ubfa_bus_fun_id)',
'		--   LOOP',
'		  	',
'		--   	SELECT NVL(MAX(ubfal_seq_no),0) + 1',
'		-- 		  INTO v_seq_no',
'		-- 		  FROM USER_BUS_FUN_ACCESS_LN',
'		-- 		 WHERE ubfal_bu = :GLOBAL_BU',
'		-- 		   AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO; ',
'		  	',
'		-- 		INSERT INTO USER_BUS_FUN_ACCESS_LN (  UBFAL_BU,',
'		-- 																				  UBFAL_DOC_NO,',
'		-- 																				  UBFAL_SEQ_NO,',
'		-- 																				  UBFAL_BUS_FUN_ID,',
'		-- 																				  UBFAL_BUS_FUN_TYPE,',
'		-- 																				  UBFAL_EFF_FROM,',
'		-- 																				  UBFAL_EFF_TO,',
'		-- 																				  UBFAL_MODULE,',
'		-- 																				  UBFAL_CRE_BY,',
'		-- 																				  UBFAL_CRE_DATE,',
'		-- 																				  UBFAL_CRE_EMP_ID,',
'		-- 																				  UBFAL_CRE_IP_ADDR,',
'		-- 																				  UBFAL_CRE_OS_USER)',
'		-- 																				VALUES',
'		-- 																				( :GLOBAL_BU,',
'		-- 																				  :P211131011_UBFAH_DOC_NO,',
'		-- 																				  v_seq_no,',
'		-- 																				  cr1.ubfa_bus_fun_id,',
'		-- 																				  cr1.apbuf_bus_fun_type,',
'		-- 																				  :P211131011_UBFAH_EFF_FROM,',
'		-- 																				  :P211131011_UBFAH_EFF_TO,',
'		-- 																				  cr1.apbuf_module,',
'		-- 																				  :GLOBAL_USER,',
'		-- 																				  SYSDATE,',
'		-- 																				--   :GLOBAL_EMP_ID,',
'		-- 																				  :UBFAL_CRE_EMP_ID,',
'		-- 																				  :GLOBAL_IP_ADDR,',
'		-- 																				  :GLOBAL_OS_USER);',
'		--   END LOOP;',
'		  ',
'		--   PROC_COMMIT;',
'		  ',
'		-- END;',
'		',
'		DELETE FROM USER_PREFIX_ACCESS_LN',
'		 WHERE upal_bu = :GLOBAL_BU',
'			 AND upal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	',
'		-- BEGIN',
'		-- 	FOR cr1 IN (SELECT upa_pfx,upa_dflt_flag,adp_plnt,adp_doc_type, upa_plnt_loc_id',
'        --             FROM user_prefix_access,appl_doc_prefixes',
'        --            WHERE upa_bu = adp_bu',
'        --              AND upa_pfx = adp_pfx',
'        --              AND upa_plnt = adp_plnt',
'        --              AND upa_bu = :GLOBAL_BU',
'        --              AND upa_user_id = :P211131011_UBFAH_USER ',
'		-- 	             ORDER BY upa_pfx)',
'		--   LOOP',
'		-- 		INSERT INTO USER_PREFIX_ACCESS_LN  (  UPAL_BU,',
'		-- 																				  UPAL_DOC_NO,',
'		-- 																				  UPAL_PFX,',
'		-- 																				  UPAL_PLNT,',
'		-- 																				  UPAL_PLNT_LOC_ID,',
'		-- 																				  UPAL_DOC_TYPE,',
'		-- 																				  UPAL_DFLT_FLAG,',
'		-- 																				  UPAL_CRE_BY,',
'		-- 																				  UPAL_CRE_DATE,',
'		-- 																				  UPAL_CRE_EMP_ID,',
'		-- 																				  UPAL_CRE_IP_ADDR,',
'		-- 																				  UPAL_CRE_OS_USER)',
'		-- 																				VALUES',
'		-- 																				( :GLOBAL_BU,',
'		-- 																				  :P211131011_UBFAH_DOC_NO,',
'		-- 																				  cr1.upa_pfx,',
'		-- 																				  cr1.adp_plnt,',
'		-- 																				  cr1.upa_plnt_loc_id,',
'		-- 																				  cr1.adp_doc_type,',
'		-- 																				  cr1.upa_dflt_flag,',
'		-- 																				  :GLOBAL_user,',
'		-- 																				  SYSDATE,',
'		-- 																				  :UPAL_CRE_EMP_ID,',
'		-- 																				  :GLOBAL_IP_ADDR,',
'		-- 																				  :GLOBAL_OS_USER);',
'		--   END LOOP;',
'		  ',
'		--   PROC_COMMIT;',
'		  ',
'		-- END;		',
'		',
'		',
'		DELETE FROM APPL_USER_PLANT_ACCESS_LN',
'		 WHERE aupal_bu = :GLOBAL_BU',
'			 AND aupal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	',
'		-- BEGIN',
'		-- 	FOR cr1 IN (SELECT auba_plant,auba_deflt_flag, auba_plnt_loc_id',
'        --             FROM appl_user_plant_access',
'        --            WHERE auba_bu = :GLOBAL_BU',
'        --              AND auba_user_id = :P211131011_UBFAH_USER ',
'		-- 	             ORDER BY auba_plant)',
'		--   LOOP',
'		-- 		INSERT INTO APPL_USER_PLANT_ACCESS_LN(AUPAL_BU,',
'		-- 																				  AUPAL_DOC_NO,',
'		-- 																				  AUPAL_PLANT,',
'		-- 																				  AUPAL_PLNT_LOC_ID,',
'		-- 																				  AUPAL_DEFLT_FLAG,',
'		-- 																				  AUPAL_EFF_FROM,',
'		-- 																				  AUPAL_EFF_TO,',
'		-- 																				  AUPAL_CRE_BY,',
'		-- 																				  AUPAL_CRE_DATE,',
'		-- 																				  AUPAL_CRE_EMP_ID,',
'		-- 																				  AUPAL_CRE_IP_ADDR,',
'		-- 																				  AUPAL_CRE_OS_USER)',
'		-- 																				VALUES',
'		-- 																				( :GLOBAL_BU,',
'		-- 																				  :P211131011_UBFAH_DOC_NO,',
'		-- 																				  cr1.auba_plant,',
'		-- 																				  cr1.auba_plnt_loc_id,',
'		-- 																				  cr1.auba_deflt_flag,',
'		-- 																				  :P211131011_UBFAH_EFF_FROM,',
'		-- 																				  :P211131011_UBFAH_EFF_TO,																						  ',
'		-- 																				  :GLOBAL_BU$user,',
'		-- 																				  SYSDATE,',
'		-- 																				  :GLOBAL_EMP_ID,',
'		-- 																				  :GLOBAL_IP_ADDR,',
'		-- 																				  :GLOBAL_OS_USER);',
'		--   END LOOP;',
'		  ',
'		--   PROC_COMMIT;',
'		  ',
'		-- END;		',
'',
' COMMIT;',
'END IF;	  ',
'IF :P211131011_UBFAH_LOAD_FLAG = ''Y'' THEN',
'',
'	UPDATE USER_BUS_FUN_ACCESS_HD',
'	   SET UBFAH_LOAD_FLAG = ''Y''',
'	 where UBFAH_BU=:global_bu',
'		and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'	   ',
'	-- APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Exception details not found.</span>'';',
'	commit;',
'			',
'ELSIF :P211131011_UBFAH_LOAD_FLAG = ''N'' THEN',
'',
'	UPDATE USER_BUS_FUN_ACCESS_HD',
'	   SET UBFAH_LOAD_FLAG = ''N''',
'	 where UBFAH_BU=:global_bu',
'		and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'   commit;',
'END IF;	',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562303216797025090)
,p_internal_uid=>2080370792139414137
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562330993524025157)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Next/Prev'
,p_static_id=>'next-prev'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        nextrowid,',
'        prevrowid',
'    INTO',
'        :global_next_rowid,',
'        :global_prev_rowid',
'    FROM(',
'            SELECT',
'                ROWID ,',
'                LEAD(ROWID)',
'                OVER(',
'                    order by UBFAH_DOC_NO desc',
'                )            nextrowid,',
'                LAG(ROWID)',
'                OVER(',
'                   order by UBFAH_DOC_NO desc',
'                )            prevrowid',
'  from USER_BUS_FUN_ACCESS_HD',
'  WHERE UBFAH_BU=:GLOBAL_BU',
'  and UBFAH_STATUS=''N''',
'  order by UBFAH_DOC_NO desc',
'        )',
'    WHERE',
'        ROWID =:P211131011_ROWID;',
'',
'		select rowid  INTO :GLOBAL_FIRST_ROWID from(SELECT *',
'  from USER_BUS_FUN_ACCESS_HD',
'  WHERE UBFAH_BU=:GLOBAL_BU',
'  and UBFAH_STATUS = ''N''',
'  order by (UBFAH_DOC_NO) desc )where  rownum =1;',
'',
'   select rowid INTO :GLOBAL_LAST_ROWID from(SELECT *',
'  from USER_BUS_FUN_ACCESS_HD',
'  WHERE UBFAH_BU=:GLOBAL_BU',
'  and UBFAH_STATUS =''N''',
'  order by (UBFAH_DOC_NO) asc )where  rownum =1;',
'EXCEPTION WHEN OTHERS THEN',
'        NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2080369157980414129
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562331747973025163)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131011_UBFAH_EFF_FROM IS NULL THEN',
'	raise_application_error(-20999,''Effective from date must be entered.'');',
'END IF;	',
'',
'IF :P211131011_UBFAH_EFF_TO IS NULL THEN',
'	raise_application_error(-20999,''Effective to date must be entered.'');',
'END IF;	',
'',
'IF :P211131011_UBFAH_EFF_TO < :P211131011_UBFAH_EFF_FROM THEN',
'	raise_application_error(-20999,'' Effective to date  should be greater than or equal to effective from date.'');',
'END IF;	',
'',
'DECLARE ',
'	v_cnt		NUMBER;',
'BEGIN',
'	SELECT COUNT(1) ',
'	  INTO v_cnt',
'	  FROM user_bus_fun_access_ln',
'	 WHERE ubfal_bu = :GLOBAL_BU',
'	   AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	-- raise_application_error(-20999,v_cnt);   ',
'	IF v_cnt = 0 THEN',
'		raise_Application_error(-20999,''Kindly add Business Functions to provide access to the User.'');',
'	END IF;',
'	',
'END;	',
'',
'DECLARE',
'	CURSOR c1',
'	IS',
'	SELECT MIN(ubfal_eff_from) from_date,',
'	       MAX(ubfal_eff_to) to_date',
'	  FROM user_bus_fun_access_ln',
'	 WHERE ubfal_bu = :GLOBAL_BU',
'	   AND ubfal_doc_no = :P211131011_UBFAH_DOC_NO;',
'	   ',
'	   cr1		c1%ROWTYPE;      ',
'BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		',
'		IF c1%FOUND AND (cr1.from_date < :P211131011_UBFAH_EFF_FROM ',
'			            OR cr1.to_date > :P211131011_UBFAH_EFF_TO) THEN',
'			raise_application_error(-20999,''Effective from /to date does not match with line details.'');',
'		END IF;',
'		',
'		CLOSE c1;',
'END;	',
'	',
'DECLARE',
'	v_pfx VARCHAR2(500);	',
'BEGIN',
'	FOR cr1 IN (SELECT adp_doc_type,',
'										 adp_plnt,',
'										 adpl_loc_id,',
'										 COUNT(1) cnt',
'					      FROM user_prefix_access_ln,',
'					      		 appl_doc_prefixes,',
'					      		 appl_doc_pfx_loc',
'					     WHERE upal_bu = adp_bu',
'					       AND upal_pfx = adp_pfx',
'					       AND upal_dflt_flag = ''Y''',
'					       AND upal_bu = :GLOBAL_BU',
'					       AND adp_bu = adpl_bu',
'					       AND adp_plnt = adpl_plnt',
'					       AND adp_pfx  = adpl_pfx',
'					       AND upal_doc_no = :P211131011_UBFAH_DOC_NO',
'					       AND adp_doc_type NOT IN (''BV'',''CMI'',''DMI'',''CMR'',''DMR'',''PI'',''PR'',''JV'')',
'					     GROUP BY adp_doc_type,',
'					              adp_plnt, ',
'					              adpl_loc_id',
'					     HAVING COUNT(1) > 1)',
'	LOOP					      ',
'',
'		FOR cr2 IN (SELECT upal_pfx',
'		              FROM user_prefix_access_ln,',
'		              		 appl_doc_prefixes',
'						     WHERE upal_bu = adp_bu',
'						       AND upal_pfx = adp_pfx',
'						       AND upal_dflt_flag = ''Y''',
'						       AND upal_bu = :GLOBAL_BU',
'						       AND upal_doc_no = :P211131011_UBFAH_DOC_NO',
'		          		 AND adp_doc_type = cr1.adp_doc_type',
'		          		 AND adp_plnt = cr1.adp_plnt)',
'		LOOP',
'			v_pfx := v_pfx||'',''||cr2.upal_pfx;',
'		END LOOP;',
'		',
'		IF cr1.cnt > 1 THEN',
'			raise_application_error(-20999,''Multiple Prefixes ''||LTRIM(v_pfx,'','')||'' cannot be set as Default for the Document Type with unit ''||',
'								func_find_plnt_desc(:GLOBAL_BU,cr1.adp_plnt,1));',
'		END IF;	',
'',
'	END LOOP;',
'	',
'END;	',
'	',
'	',
'	',
'DECLARE',
'	v_doc_no	VARCHAR2(10)	:= :P211131011_UBFAH_DOC_NO;',
'	v_status	VARCHAR2(1);',
'BEGIN',
'	DECLARE',
'   			v_appr_res	VARCHAR2(1);',
'   ',
'			BEGIN      ',
'      				proc_self_wf_appr(:Global_bu,',
'                        				''WF_UBFA'',',
'                        				:P211131011_UBFAH_USER,',
'                        				1,',
'                        				v_appr_res,',
'	                    					p_plnt => NULL,',
'	                    					p_doc_date =>:P211131011_UBFAH_DOC_DATE,',
'	                    					p_doc_pfx => NULL,',
'	                    					p_doc_no => :P211131011_UBFAH_DOC_NO);',
'--   raise_application_error(-20999,v_appr_res);',
'  IF v_appr_res = ''Y'' THEN',
'  :P211131011_WF_COUNT :=''A'';',
'   apex_application.g_print_success_message := ''Document No''||''-''||:P211131011_UBFAH_DOC_NO||'' ''||''is Approved'';',
'  ELSE',
'   :P211131011_WF_COUNT :=''F'';',
'  -- apex_application.g_print_success_message := ''Self approval not possible please Forward The Document'';',
'  END IF;',
'  COMMIT;',
'END;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562303986008025092)
,p_internal_uid=>2080369912429414135
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562333363059025171)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P211131011_UBFAH_DOC_NO is not null then',
'			select UBFAH_VERT_ID||'' - ''||',
'				(SELECT ev_vertical_desc',
'			FROM erp_vertical',
'			WHERE ev_vertical_id = UBFAH_VERT_ID) Vertical_name',
'			into :P211131011_VERTICAL_ID_NB',
'			from USER_BUS_FUN_ACCESS_HD',
'			where UBFAH_BU=:global_bu',
'			and UBFAH_DOC_NO=:P211131011_UBFAH_DOC_NO;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2080371527515414143
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562288125825025048)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9611918863373877094)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Prefix Access - Save Interactive Grid Data'
,p_static_id=>'prefix-access-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'INSERT INTO user_prefix_access_ln',
'											(upal_bu,',
'											 upal_doc_no,',
'											 upal_pfx,',
'											 upal_dflt_flag,',
'											 upal_cre_by,',
'											 upal_cre_date,',
'											 upal_cre_emp_id,',
'											 upal_cre_ip_addr,',
'											 upal_cre_os_user,',
'											 upal_doc_type,',
'											 upal_plnt,',
'											 upal_plnt_loc_id)',
'VALUES',
'											(:global_bu,',
'											 :P211131011_UBFAH_DOC_NO,',
'											 :UPAL_PFX,',
'											 ''N'',',
'											 :GLOBAL_USER,',
'											 SYSDATE,',
'											 :UPAL_CRE_EMP_ID,',
'											 :GLOBAL_IP_ADDR,',
'											 :GLOBAL_OS_USER,',
'											 :UPAL_DOC_TYPE,',
'											 :UPAL_PLNT,',
'											 :UPAL_PLNT_LOC_ID);',
'elsIF :APEX$ROW_STATUS = ''U'' THEN',
'UPDATE user_prefix_access_ln',
'SET',
'					upal_dflt_flag			=:UPAL_DFLT_FLAG,',
'					upal_upd_by				=:GLOBAL_USER,',
'					upal_upd_date			=SYSDATE,',
'					upal_upd_emp_id		=:UPAL_UPD_EMP_ID,',
'					upal_upd_ip_addr		=:GLOBAL_IP_ADDR,',
'					upal_upd_os_user		=:GLOBAL_OS_USER,',
'					upal_doc_type			=:UPAL_DOC_TYPE,',
'					upal_pfx					=:UPAL_PFX',
'		-- WHERE rowid                   =:ROWID;',
'',
'	  WHERE upal_bu					     	=:GLOBAL_BU',
'		AND upal_doc_no 				  	=:P211131011_UBFAH_DOC_NO',
'		-- AND upal_pfx						=:UPAL_PFX',
'		AND upal_plnt  					=:UPAL_PLNT',
'		AND upal_plnt_loc_id          =:UPAL_PLNT_LOC_ID;',
'			',
'			',
'',
'',
'',
'',
'',
'ELSE ',
'DELETE FROM user_prefix_access_ln',
'	  WHERE rowid                   =:ROWID; ',
'	--   WHERE upal_bu					     	=:GLOBAL_BU',
'	-- 	AND upal_doc_no 				  	=:P211131011_UBFAH_DOC_NO',
'	-- 	-- AND upal_pfx						=:UPAL_PFX',
'	-- 	AND upal_plnt  					 	=:UPAL_PLNT',
'	-- 	AND upal_plnt_loc_id                =:UPAL_PLNT_LOC_ID;',
'',
'COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2080326290281414020
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562323652088025134)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13709269335957627557)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Bus. Function Access'
,p_static_id=>'process-form-user-bus-function-access'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562302429610025090)
,p_process_success_message=>'User Bus. Function Access Created Successfully. Doc. No: &P211131011_UBFAH_DOC_NO.'
,p_internal_uid=>2080361816544414106
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562324071071025134)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13709269335957627557)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Bus. Function Access_1'
,p_static_id=>'process-form-user-bus-function-access-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562302016830025090)
,p_process_success_message=>'User Bus. Function Access Updated Successfully. Doc. No: &P211131011_UBFAH_DOC_NO.'
,p_internal_uid=>2080362235527414106
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562271947912025012)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9611916748234877073)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unit Access - Save Interactive Grid Data'
,p_static_id=>'unit-access-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'-----------------Check Duplicate entry-------------------------',
'declare ',
'-- v_loc_id           VARCHAR2(10);',
'-- begin',
'CURSOR c1',
'IS',
'		select AUPAL_PLNT_LOC_ID ',
'			from appl_user_plant_access_ln',
'				where aupal_bu		    =:GLOBAL_BU',
'                AND aupal_doc_no 	    =:P211131011_UBFAH_DOC_NO;',
'cr1     c1%ROWTYPE;',
'BEGIN',
'OPEN c1;',
'     FETCH c1 INTO cr1;',
'       IF c1%FOUND  and cr1.aupal_plnt_loc_id =:AUPAL_PLNT_LOC_ID then ',
'        raise_application_error(-20999,''Cannot insert duplicate entry.'');',
'       END IF;',
'     CLOSE c1;',
'',
'END;',
'INSERT INTO appl_user_plant_access_ln',
'											(aupal_bu,',
'											 aupal_doc_no,',
'											 aupal_plant,',
'											 aupal_eff_from,',
'											 aupal_eff_to,',
'											 aupal_deflt_flag,',
'											 aupal_cre_by,',
'											 aupal_cre_date,',
'											 aupal_cre_emp_id,',
'											 aupal_cre_ip_addr,',
'											 aupal_cre_os_user,',
'											 aupal_plnt_loc_id)',
'VALUES',
'											(:GLOBAL_BU,',
'											:P211131011_UBFAH_DOC_NO,',
'											:AUPAL_PLANT,',
'											:AUPAL_EFF_FROM,',
'											:AUPAL_EFF_TO,',
'											:AUPAL_DEFLT_FLAG,',
'											:global_user,',
'											 sysdate,',
'											:AUPAL_CRE_EMP_ID,',
'											:GLOBAL_IP_ADDR,',
'											:GLOBAL_OS_USER,',
'											:AUPAL_PLNT_LOC_ID);',
'elsIF :APEX$ROW_STATUS = ''U'' THEN',
'UPDATE appl_user_plant_access_ln',
'SET',
'			aupal_eff_from					 =:AUPAL_EFF_FROM,',
'			aupal_eff_to					 =:AUPAL_EFF_TO,',
'			aupal_deflt_flag	          =:AUPAL_DEFLT_FLAG,',
'			aupal_upd_by					 =:GLOBAL_USER,',
'			aupal_upd_date	             =SYSDATE,',
'			aupal_upd_emp_id				 =:AUPAL_UPD_EMP_ID,',
'			aupal_upd_ip_addr				 =:GLOBAL_IP_ADDR,',
'			aupal_upd_os_user				 =:GLOBAL_OS_USER',
'	  WHERE rowid							 =:ROWID;',
'	   --  aupal_bu					    =:GLOBAL_BU',
'		-- --  AND aupal_doc_no 				 =:P211131011_UBFAH_DOC_NO',
'		--  AND aupal_plant  				 =:AUPAL_PLANT',
'		--  AND aupal_plnt_loc_id         =:AUPAL_PLNT_LOC_ID;',
'',
'ELSE ',
'DELETE FROM appl_user_plant_access_ln',
'     WHERE rowid							 =:ROWID;',
'	--  WHERE  aupal_bu                  =:GLOBAL_BU',
'	-- 	--  AND aupal_doc_no 				 =:P211131011_UBFAH_DOC_NO',
'	-- 	 AND aupal_plant  				 =:AUPAL_PLANT',
'	-- 	 AND aupal_plnt_loc_id			 =:AUPAL_PLNT_LOC_ID;',
'',
'COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2080310112368413984
);
wwv_flow_imp.component_end;
end;
/
