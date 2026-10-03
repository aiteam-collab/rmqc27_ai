prompt --application/pages/page_1415130010
begin
--   Manifest
--     PAGE: 1415130010
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
 p_id=>1415130010
,p_name=>'Notifications'
,p_alias=>'NOTIFICATIONS'
,p_step_title=>'Notifications'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,500));',
'    background: #00b1e7;',
'    color: white;',
'} */',
'.a-GV-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
' .t-fht-thead {',
'    overflow: auto !important;',
' }'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8549735222039628970)
,p_plug_name=>'Notification'
,p_static_id=>'notification'
,p_region_name=>'not'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       NOTIFY_ID,',
'       NOTIFY_DESC1,',
'       NOTIFY_DESC2,',
'       NOTIFY_MOD,',
'       NOTIFY_BRIEF,',
'       NOTIFY_SOON_FLAG,',
'       NOTIFY_DAYS,',
'       NOTIFY_CALL_FORM,',
'       NOTIFY_PRIORITY,',
'       NOTIFY_SEQ_NO,',
'       NOTIFY_ROLE_TYPE,',
'       NOTIFY_MOD_SEQ_NO,',
'       NOTIFY_DAY_FLAG,',
'       NOTIFY_USED_FLAG,',
'       NOTIFY_CRE_BY,',
'       NOTIFY_CRE_IP_ADDR,',
'       NOTIFY_CRE_OS_USER,',
'       NOTIFY_CRE_DATE,',
'       NOTIFY_UPD_BY,',
'       NOTIFY_UPD_IP_ADDR,',
'       NOTIFY_UPD_OS_USER,',
'       NOTIFY_UPD_DATE,',
'       NOTIFY_CRE_EMP_ID,',
'       NOTIFY_UPD_EMP_ID,',
'       NULL NOTIFY_DELETE',
'  from NOTIFICATIONS'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Notification'
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
 p_id=>wwv_flow_imp.id(7028350208335389129)
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
 p_id=>wwv_flow_imp.id(7028350298922389130)
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
 p_id=>wwv_flow_imp.id(7023017152965524858)
,p_name=>'NOTIFY_BRIEF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_BRIEF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Notificaiton in Brief'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(7023017516592524861)
,p_name=>'NOTIFY_CALL_FORM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CALL_FORM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Call Form'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_imp.id(7023018178378524868)
,p_name=>'NOTIFY_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CRE_BY'
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
 p_id=>wwv_flow_imp.id(7023018476321524871)
,p_name=>'NOTIFY_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(7023018974518524876)
,p_name=>'NOTIFY_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7023018304281524869)
,p_name=>'NOTIFY_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7023018362031524870)
,p_name=>'NOTIFY_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(7023017408955524860)
,p_name=>'NOTIFY_DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Due Days'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023017964869524866)
,p_name=>'NOTIFY_DAY_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_DAY_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Day Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Overdue;O,Today;T,Upcoming;U'
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
,p_default_expression=>'O'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7028351924894389146)
,p_name=>'NOTIFY_DELETE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_DELETE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash" style="color:red"></span>')).to_clob
,p_link_target=>'javascript:del_row(''not'');'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023016929558524855)
,p_name=>'NOTIFY_DESC1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_DESC1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(7023017027888524856)
,p_name=>'NOTIFY_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_DESC2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023016811005524854)
,p_name=>'NOTIFY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Notification'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023017087285524857)
,p_name=>'NOTIFY_MOD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_MOD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Module'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
  'title', 'Select the Module',
  'width', '900')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7028407204781508992)
,p_lov_display_extra=>true
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
 p_id=>wwv_flow_imp.id(7023017925673524865)
,p_name=>'NOTIFY_MOD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_MOD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Notify Mod Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(7023017595917524862)
,p_name=>'NOTIFY_PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_PRIORITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Priority'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Low;L,Medium;M,High;H'
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
,p_default_expression=>'M'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023017762841524864)
,p_name=>'NOTIFY_ROLE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_ROLE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Role'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Manager;M,User;U,Both;B'
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
,p_default_expression=>'B'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023017708094524863)
,p_name=>'NOTIFY_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023017295509524859)
,p_name=>'NOTIFY_SOON_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_SOON_FLAG'
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
 p_id=>wwv_flow_imp.id(7023018566759524872)
,p_name=>'NOTIFY_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_UPD_BY'
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
 p_id=>wwv_flow_imp.id(7023018844166524875)
,p_name=>'NOTIFY_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(7023019069137524877)
,p_name=>'NOTIFY_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(7023018710773524873)
,p_name=>'NOTIFY_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7023018766623524874)
,p_name=>'NOTIFY_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(7023018069793524867)
,p_name=>'NOTIFY_USED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFY_USED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Used Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7023019195677524878)
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7023016698215524853)
,p_internal_uid=>1541054862671913825
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7023039533804551106)
,p_interactive_grid_id=>wwv_flow_imp.id(7023016698215524853)
,p_static_id=>'15410777'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7023039694691551109)
,p_report_id=>wwv_flow_imp.id(7023039533804551106)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023040048909551124)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7023016811005524854)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023041025199551145)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7023016929558524855)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023041872799551154)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7023017027888524856)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023042798113551163)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7023017087285524857)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023043692865551170)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7023017152965524858)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023044540869551179)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7023017295509524859)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023045513189551187)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7023017408955524860)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023046351493551193)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7023017516592524861)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023047318992551199)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7023017595917524862)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023048159131551207)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7023017708094524863)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023049018610551213)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7023017762841524864)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023049887254551231)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7023017925673524865)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023050798864551240)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7023017964869524866)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023051701131551248)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7023018069793524867)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023052572280551256)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7023018178378524868)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023053489901551265)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7023018304281524869)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023054341187551276)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7023018362031524870)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023055332340551284)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7023018476321524871)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023056230003551292)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7023018566759524872)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023057118467551299)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7023018710773524873)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023058005805551307)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7023018766623524874)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023058802709551313)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7023018844166524875)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023059653887551321)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7023018974518524876)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023060615752551332)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7023019069137524877)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7023061486654551338)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7023019195677524878)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7028371882533413273)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7028350208335389129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7028372748659413293)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7028350298922389130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7028512691926780762)
,p_view_id=>wwv_flow_imp.id(7023039694691551109)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7028351924894389146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028350486919389132)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8549735222039628970)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:add_row(''not'');'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028350733594389134)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8549735222039628970)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:down_row(''not'');'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028350760595389135)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8549735222039628970)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028350610043389133)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8549735222039628970)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:save_row(''not'');'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028351591488389143)
,p_tabular_form_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_validation_name=>'NOTIFY_DAYS'
,p_static_id=>'notify-days'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :NOTIFY_DAYS < 0  THEN',
'	return(''Notify days must be greater than or equal to zero'');',
'ELSIF :NOTIFY_DAYS IS NULL THEN',
'	return(''Notify days should not be null'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'NOTIFY_DAYS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028351365190389141)
,p_tabular_form_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_validation_name=>'NOTIFY_DESC1'
,p_static_id=>'notify-desc'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :NOTIFY_DESC1 IS NULL THEN',
'	Return(''Notification description must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'NOTIFY_DESC1'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028351329948389140)
,p_tabular_form_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_validation_name=>'NOTIFY_ID'
,p_static_id=>'notify-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :NOTIFY_ID IS NULL THEN',
'	Return(''Notification ID must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'NOTIFY_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028351472272389142)
,p_tabular_form_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_validation_name=>'NOTIFY_MOD'
,p_static_id=>'notify-mod'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :NOTIFY_MOD IS NULL THEN',
'	Return(''Notification module must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'NOTIFY_MOD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028351748645389145)
,p_tabular_form_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_validation_name=>'NOTIFY_SEQ_NO'
,p_static_id=>'notify-seq-no'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :NOTIFY_SEQ_NO IS NULL THEN',
'   return(''Seq. No. must be entered.'');',
'END IF;',
'',
'IF :NOTIFY_SEQ_NO < 0 THEN',
'   return(''Seq. No. should not be negative.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'NOTIFY_SEQ_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7028350897566389136)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7028350760595389135)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7028350956599389137)
,p_event_id=>wwv_flow_imp.id(7028350897566389136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7028350433082389131)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8549735222039628970)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Notification - Save Interactive Grid Data'
,p_static_id=>'notification-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C''  THEN',
'   ',
'   SELECT NVL(MAX(notify_seq_no),0) + 1 ',
'     INTO :NOTIFY_MOD_SEQ_NO',
'     FROM notifications',
'    WHERE notify_mod = :notify_mod;',
'',
'   INSERT INTO NOTIFICATIONS(NOTIFY_ID,',
'                            NOTIFY_DESC1,',
'                            NOTIFY_DESC2,',
'                            NOTIFY_MOD,',
'                            NOTIFY_BRIEF,',
'                            NOTIFY_SOON_FLAG,',
'                            NOTIFY_DAYS,',
'                            NOTIFY_CALL_FORM,',
'                            NOTIFY_PRIORITY,',
'                            NOTIFY_SEQ_NO,',
'                            NOTIFY_ROLE_TYPE,',
'                            NOTIFY_MOD_SEQ_NO,',
'                            NOTIFY_DAY_FLAG,',
'                            NOTIFY_USED_FLAG,',
'                            NOTIFY_CRE_BY,',
'                            NOTIFY_CRE_IP_ADDR,',
'                            NOTIFY_CRE_OS_USER,',
'                            NOTIFY_CRE_DATE,',
'                            NOTIFY_CRE_EMP_ID)',
'                     VALUES(:NOTIFY_ID,',
'                            :NOTIFY_DESC1,',
'                            :NOTIFY_DESC2,',
'                            :NOTIFY_MOD,',
'                            :NOTIFY_BRIEF,',
'                            :NOTIFY_SOON_FLAG,',
'                            :NOTIFY_DAYS,',
'                            :NOTIFY_CALL_FORM,',
'                            :NOTIFY_PRIORITY,',
'                            :NOTIFY_SEQ_NO,',
'                            :NOTIFY_ROLE_TYPE,',
'                            :NOTIFY_MOD_SEQ_NO,',
'                            :NOTIFY_DAY_FLAG,',
'                            :NOTIFY_USED_FLAG,',
'                            :GLOBAL_USER,',
'                            :GLOBAL_IP,',
'                            NULL,',
'                            SYSDATE,',
'                            :GLOBAL_EMP_ID);',
'   ',
'   apex_application.g_print_success_message := ''<span>Inserted Successfully.</span>'';',
'',
'ELSIF :APEX$ROW_STATUS = ''C''  THEN',
'',
'   UPDATE NOTIFICATIONS',
'      SET NOTIFY_ID           = :NOTIFY_ID,',
'          NOTIFY_DESC1        = :NOTIFY_DESC1,',
'          NOTIFY_MOD          = :NOTIFY_MOD,',
'          NOTIFY_BRIEF        = :NOTIFY_BRIEF,',
'          NOTIFY_DAYS         = :NOTIFY_DAYS,',
'          NOTIFY_CALL_FORM    = :NOTIFY_CALL_FORM,',
'          NOTIFY_PRIORITY     = :NOTIFY_PRIORITY,',
'          NOTIFY_SEQ_NO       = :NOTIFY_SEQ_NO,',
'          NOTIFY_ROLE_TYPE    = :NOTIFY_ROLE_TYPE,',
'          NOTIFY_DAY_FLAG     = :NOTIFY_DAY_FLAG,',
'          NOTIFY_USED_FLAG    = :NOTIFY_USED_FLAG,',
'          NOTIFY_UPD_BY       = :GLOBAL_USER,',
'          NOTIFY_UPD_IP_ADDR  = :GLOBAL_IP,',
'          NOTIFY_UPD_DATE     = SYSDATE,',
'          NOTIFY_UPD_EMP_ID   = :GLOBAL_EMP_ID',
'    WHERE ROWID               = :ROWID;',
'   ',
'   apex_application.g_print_success_message := ''<span>Updated Successfully.</span>'';',
'   ',
'ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'',
'   DELETE',
'     FROM NOTIFICATIONS',
'    WHERE ROWID = :ROWID;',
'   ',
'   apex_application.g_print_success_message := ''<span>Deleted Successfully.</span>'';',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1546388597538778103
);
wwv_flow_imp.component_end;
end;
/
