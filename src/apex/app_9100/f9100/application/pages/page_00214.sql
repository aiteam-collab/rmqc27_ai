prompt --application/pages/page_00214
begin
--   Manifest
--     PAGE: 00214
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
 p_id=>214
,p_name=>'Doc. Mgmt. Access'
,p_alias=>'DOC-MGMT-ACCESS2'
,p_step_title=>'Doc. Mgmt. Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BreadcrumbRegion {',
'    padding: 0px;',
'}',
'',
'.t-Breadcrumb, .t-Breadcrumb-item, .t-BreadcrumbRegion--compactTitle .t-BreadcrumbRegion-buttons .t-Button, .u-file-icon {',
'    vertical-align: baseline;',
'}',
'',
'  /* Grid Header Column Color */',
'/*',
'  .a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'      font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,700));',
'      background: #00b1e7 !important;',
'      color: white !important;',
'}',
'*/',
'/*   PRASANTH   CheckBox Color  */',
'',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: white;',
'    --a-checkbox-text-color: #028107;',
'    --a-button-border-radius: #00d7c9;',
'    --a-checkbox-border-color: #cd9a00;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3648367274212767378)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3648365190648767357)
,p_plug_name=>'DOC_MGMT_USER_ACCESS_HD'
,p_static_id=>'doc-mgmt-user-access-hd'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT_USER_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P214_DMUAH_STATUS <> ''N'''
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3649385252497199036)
,p_plug_name=>'DOC_MGMT_USER_ACCESS_LN'
,p_static_id=>'doc-mgmt-user-access-ln'
,p_region_name=>'mgmt_ln'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DMUAL_BU,',
'       DMUAL_DOC_NO,',
'       DMUAL_SEQ_NO,',
'       DMUAL_DOC_TYPE,',
'       DMUAL_ADD_ACCESS,',
'       DMUAL_DEL_ACCESS,',
'       DMUAL_VW_ACCESS,',
'       DMUAL_CRE_BY,',
'       DMUAL_CRE_EMP_ID,',
'       DMUAL_CRE_IP_ADDR,',
'       DMUAL_CRE_OS_USER,',
'       DMUAL_CRE_DATE,',
'       DMUAL_UPD_BY,',
'       DMUAL_UPD_EMP_ID,',
'       DMUAL_UPD_IP_ADDR,',
'       DMUAL_UPD_OS_USER,',
'       DMUAL_UPD_DATE,',
'       ''<span class="fa fa-trash" aria-hidden="true" style="color:red"></span>''"Delete"',
'  from DOC_MGMT_USER_ACCESS_LN',
'  WHERE dmual_bu = :GLOBAL_BU',
'  AND dmual_doc_no = :P214_DMUAH_DOC_NO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P214_DMUAH_DOC_NO'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P214_DMUAH_STATUS <> ''N'''
,p_plug_read_only_when2=>'PLSQL'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(3649387244157199056)
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
 p_id=>wwv_flow_imp.id(3649387317401199057)
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
 p_id=>wwv_flow_imp.id(3649385840980199042)
,p_name=>'DMUAL_ADD_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_ADD_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Add '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(3649385444560199038)
,p_name=>'DMUAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'bu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3649386138031199045)
,p_name=>'DMUAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(3649386519314199049)
,p_name=>'DMUAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dmual Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(3649386248444199046)
,p_name=>'DMUAL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Cre Emp Id'
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
 p_id=>wwv_flow_imp.id(3649386365266199047)
,p_name=>'DMUAL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Cre Ip Addr'
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
 p_id=>wwv_flow_imp.id(3649386379286199048)
,p_name=>'DMUAL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Cre Os User'
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
 p_id=>wwv_flow_imp.id(3649385948173199043)
,p_name=>'DMUAL_DEL_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_DEL_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Delete '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(3649385551245199039)
,p_name=>'DMUAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'doc. no'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3649385675458199041)
,p_name=>'DMUAL_DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Doc. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DMDT_DESC from DOC_MGMT_DOC_TYPE',
'WHERE DMDT_BU = :GLOBAL_BU'))
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3649385663289199040)
,p_name=>'DMUAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3649386591311199050)
,p_name=>'DMUAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(3649387029059199054)
,p_name=>'DMUAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dmual Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(3649386676458199051)
,p_name=>'DMUAL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Upd Emp Id'
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
 p_id=>wwv_flow_imp.id(3649386785045199052)
,p_name=>'DMUAL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Upd Ip Addr'
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
 p_id=>wwv_flow_imp.id(3649386886097199053)
,p_name=>'DMUAL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmual Upd Os User'
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
 p_id=>wwv_flow_imp.id(3649386006519199044)
,p_name=>'DMUAL_VW_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUAL_VW_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'View '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(3651677020794775031)
,p_name=>'Delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P214_DMUAL_SEQ_NO'',''&DMUAL_SEQ_NO.''), $s(''P214_ROWID1'',''&ROWID.'');apex.submit(''CANCEL'');'
,p_link_text=>'&"Delete".'
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
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P214_DMUAH_STATUS = ''N'''
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3649387076768199055)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(3649385277896199037)
,p_internal_uid=>3577281505568011707
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
 p_id=>wwv_flow_imp.id(3649504518747323809)
,p_interactive_grid_id=>wwv_flow_imp.id(3649385277896199037)
,p_static_id=>'35774008'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(3649504685569323811)
,p_report_id=>wwv_flow_imp.id(3649504518747323809)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649505179598323817)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(3649385444560199038)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649506082128323828)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(3649385551245199039)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649507019876323830)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(3649385663289199040)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649507950725323831)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(3649385675458199041)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233.986
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649508820782323833)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(3649385840980199042)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649509770632323834)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(3649385948173199043)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649510611999323836)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(3649386006519199044)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97.9792
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649511524902323839)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(3649386138031199045)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649512452041323840)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(3649386248444199046)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649513356753323842)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(3649386365266199047)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649514195808323844)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(3649386379286199048)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649515107416323845)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(3649386519314199049)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649516062195323847)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(3649386591311199050)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649516932665323848)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(3649386676458199051)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649517784877323850)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(3649386785045199052)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649518682587323851)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(3649386886097199053)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649519572507323855)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(3649387029059199054)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649520538649323856)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(3649387076768199055)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649523424059331365)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(3649387244157199056)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3649524315335331369)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(3649387317401199057)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3651682830659775450)
,p_view_id=>wwv_flow_imp.id(3649504685569323811)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(3651677020794775031)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140.01411645507812
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3683232574461028531)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649387561967199059)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3649385252497199036)
,p_button_name=>'Add_row'
,p_static_id=>'add-row'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P214_DMUAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''mgmt_ln'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649385073738199035)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'approve_hd'
,p_static_id=>'approve-hd'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'NEXT'
,p_button_condition=>':P214_DMUAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3648367483750767380)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649384753503199031)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'cancel_hd'
,p_static_id=>'cancel-hd'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_button_condition=>':P214_DMUAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649387716099199061)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(3649385252497199036)
,p_button_name=>'down_row'
,p_static_id=>'down-row'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''mgmt_ln'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3742970831753649839)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Record_Find'
,p_static_id=>'record-find'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find Record'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::P500_REFIND:Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3648367469314767379)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Save_hd'
,p_static_id=>'save-hd'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Hd'
,p_button_position=>'NEXT'
,p_button_condition=>':P214_DMUAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649387661635199060)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3649385252497199036)
,p_button_name=>'save_row'
,p_static_id=>'save-row'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P214_DMUAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''mgmt_ln'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3742970874977649840)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3755363481256536332)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(3648367274212767378)
,p_button_name=>'Wf_LOG'
,p_static_id=>'wf-log'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'WF Log'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&GLOBAL_MAIN_APP.:235130060:&SESSION.::&DEBUG.:235130060:P235130060_P_DOC_NO,P235130060_P_WF_TYPE:&P214_DMUAH_DOC_NO.,WF_DMA'
,p_button_condition=>':P214_DMUAH_STATUS <> ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-history'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3742970052372649831)
,p_branch_name=>'Go To Page 236131090 '
,p_branch_action=>'f?p=&GLOBAL_MAIN_APP.:236131090:&SESSION.::&DEBUG.:236131090:P236131090_P_WF_TYPE,P236131090_P_PAGE_ID,P236131090_P_DOC_NO,P236131090_WF_MODULE:WF_DMA,500,&P214_DMUAH_DOC_NO.,ICM&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(3649385073738199035)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P214_WF_TYPE'
,p_branch_condition_text=>'FORWARD'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3742970138985649832)
,p_branch_name=>'Go To  DIRECT'
,p_branch_action=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:236131090::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(3649385073738199035)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P214_WF_TYPE'
,p_branch_condition_text=>'DIRECT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3742970177585649833)
,p_branch_name=>'Go To Page 236131090'
,p_branch_action=>'f?p=&GLOBAL_MAIN_APP.:236131090:&SESSION.::&DEBUG.:236131090:P236131090_P_WF_TYPE,P236131090_P_PAGE_ID,P236131090_P_DOC_NO,P236131090_WF_MODULE,P236131090_P_CTRL_PERSON,P236131090_P_WF_NO:WF_DMA,214,&P214_DMUAH_DOC_NO.,ICM,&P214_WF_CTRL_PERSON.,&P214_WF_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(3649385073738199035)
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3743914362156443831)
,p_branch_name=>'Go TO PAge'
,p_branch_action=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3774787904276401432)
,p_branch_name=>'GO TO FIND'
,p_branch_action=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(3649384753503199031)
,p_branch_sequence=>60
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365428498767359)
,p_name=>'P214_DMUAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366031630767365)
,p_name=>'P214_DMUAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366375662767369)
,p_name=>'P214_DMUAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366166303767366)
,p_name=>'P214_DMUAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366181005767367)
,p_name=>'P214_DMUAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366360577767368)
,p_name=>'P214_DMUAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365661371767361)
,p_name=>'P214_DMUAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'DMUAH_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365525891767360)
,p_name=>'P214_DMUAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_prompt=>'Doc No.'
,p_source=>'DMUAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365822594767363)
,p_name=>'P214_DMUAH_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_prompt=>'Reference'
,p_source=>'DMUAH_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365945080767364)
,p_name=>'P214_DMUAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'DMUAH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366535015767370)
,p_name=>'P214_DMUAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DMUAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366881175767374)
,p_name=>'P214_DMUAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DMUAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366599218767371)
,p_name=>'P214_DMUAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_default=>':GLOBAL_EMP_ID'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DMUAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366753138767372)
,p_name=>'P214_DMUAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_default=>':GLOBAL_IP_ADDR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DMUAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648366779935767373)
,p_name=>'P214_DMUAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_default=>':GLOBAL_OS_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DMUAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648365737669767362)
,p_name=>'P214_DMUAH_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_prompt=>'User'
,p_source=>'DMUAH_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3651677109327775032)
,p_name=>'P214_DMUAL_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3649385252497199036)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648367051218767375)
,p_name=>'P214_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_item_source_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3651677208850775033)
,p_name=>'P214_ROWID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3649385252497199036)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3648367121637767376)
,p_name=>'P214_STATUS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_prompt=>'Status'
,p_source=>'SELECT DECODE(:P214_DMUAH_STATUS,''N'',''Draft'',''C'',''Cancelled'',''A'',''Approved'',''E'',''Entry Completed'',:P214_DMUAH_STATUS) FROM DUAL;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3742744224249538033)
,p_name=>'P214_WF_APPR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3742744109939538032)
,p_name=>'P214_WF_CTRL_PERSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3742744348194538034)
,p_name=>'P214_WF_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3742744027408538031)
,p_name=>'P214_WF_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3648365190648767357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(3742970529511649836)
,p_tabular_form_region_id=>wwv_flow_imp.id(3649385252497199036)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :DMUAL_DOC_TYPE IS NULL THEN ',
'  RETURN (''Document Type must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'DMUAL_DOC_TYPE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3648812086999980781)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P214_WUPAH_FROM_USER_ID'
,p_condition_element=>'P214_WUPAH_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3648813098267980781)
,p_event_id=>wwv_flow_imp.id(3648812086999980781)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P214_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3648812593843980781)
,p_event_id=>wwv_flow_imp.id(3648812086999980781)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P214_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3648808950824980780)
,p_name=>'P214_WUPAH_ADD_TYPE'
,p_static_id=>'p214-wupah-add-type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P214_WUPAH_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3648809451835980780)
,p_event_id=>wwv_flow_imp.id(3648808950824980780)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P214_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3649387780044199062)
,p_name=>'Refresh '
,p_static_id=>'refresh'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3649385252497199036)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3649387893174199063)
,p_event_id=>wwv_flow_imp.id(3649387780044199062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3649385252497199036)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3648810735386980780)
,p_name=>'WUPAH_ADD_TYPE'
,p_static_id=>'wupah-add-type'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P214_WUPAH_ADD_TYPE'
,p_condition_element=>'P214_WUPAH_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3648811689132980781)
,p_event_id=>wwv_flow_imp.id(3648810735386980780)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P214_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3648811218315980780)
,p_event_id=>wwv_flow_imp.id(3648810735386980780)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P214_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3649384983125199034)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Approve'
,p_static_id=>'approve'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* DECLARE',
'    v_appr_res	VARCHAR2(1);',
'    v_appr_msg	VARCHAR2(1);',
'   ',
'  BEGIN',
'                    proc_self_wf_appr(:GLOBAL_bu,',
'                                      ''WF_DMA'',',
'                                      :GLOBAL_user,',
'                                      1,',
'                                      v_appr_res,',
'                                      v_appr_msg,',
'            			     p_doc_no => :P214_DMUAH_DOC_NO',
'              	                     );',
'   ',
'    IF v_appr_res = ''N'' THEN',
'	   :P214_WF_TYPE := ''FORWARD'';',
'',
'    ELSE',
'     :P214_WF_TYPE := ''DIRECT'';',
'      apex_application.g_print_success_message := ''<span style="color:WHITE"> Item activated.</span>'';',
'	 END IF;',
'     ',
'EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      proc_apex_err_msg_log (9313003, SQLERRM);',
'',
'  END; */',
'',
'',
'',
'',
'  DECLARE',
'    v_appr_res  VARCHAR2(1);',
'    v_appr_msg  VARCHAR2(1);',
'    v_cnt       NUMBER;',
'BEGIN',
'',
'    -- Check whether at least one Doc Type line exists',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM DOC_MGMT_USER_ACCESS_LN',
'     WHERE DMUAL_DOC_NO = :P214_DMUAH_DOC_NO',
'       AND DMUAL_DOC_TYPE IS NOT NULL;',
'',
'    IF v_cnt = 0 THEN',
'    RAISE_APPLICATION_ERROR(-20999,''Line Details not found.'');',
'    END IF;',
'',
'',
'    -- Existing approval procedure',
'    proc_self_wf_appr(',
'        :GLOBAL_bu,',
'        ''WF_DMA'',',
'        :GLOBAL_user,',
'        1,',
'        v_appr_res,',
'        v_appr_msg,',
'        p_doc_no => :P214_DMUAH_DOC_NO',
'    );',
'',
'    IF v_appr_res = ''N'' THEN',
'',
'        :P214_WF_TYPE := ''FORWARD'';',
'',
'    ELSE',
'',
'        :P214_WF_TYPE := ''DIRECT'';',
'',
'        apex_application.g_print_success_message :=',
'            ''<span style="color:WHITE">Item activated.</span>'';',
'',
'    END IF;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        proc_apex_err_msg_log(9313003, SQLERRM);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3649385073738199035)
,p_internal_uid=>3577281210797011704
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3649384894083199033)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE DOC_MGMT_USER_ACCESS_HD',
'SET dmuah_status = ''C''',
'WHERE dmuah_bu = :GLOBAL_BU',
'AND dmuah_doc_no = :P214_DMUAH_DOC_NO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3649384753503199031)
,p_process_success_message=>'Document Cancelled.'
,p_internal_uid=>3577281121755011703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3649387420127199058)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(3649385252497199036)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOC_MGMT_USER_ACCESS_LN - Save Interactive Grid Data'
,p_static_id=>'doc-mgmt-user-access-ln-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'DECLARE',
'v_cnt NUMBER;',
'BEGIN',
'SELECT count(*) INTO v_cnt FROM doc_mgmt_user_access_ln',
'WHERE dmual_bu = :GLOBAL_BU',
'AND dmual_doc_no = :P214_DMUAH_DOC_NO',
'AND dmual_doc_type = :dmual_doc_type;',
'',
'IF v_cnt > 0 THEN',
'RAISE_APPLICATION_ERROR(-20999,''Document Type already Exists.'');',
'END IF;',
'END;',
'',
'',
'',
'DECLARE',
'v_cnt NUMBER;',
'BEGIN',
'SELECT count(*) INTO v_cnt FROM doc_mgmt_user_access_hd,doc_mgmt_user_access_ln',
'WHERE dmuah_bu = dmual_bu',
'AND dmuah_doc_no = dmual_doc_no ',
'AND dmual_bu = :GLOBAL_BU',
'AND dmuah_user = :P214_DMUAH_USER',
'AND dmual_doc_type = :dmual_doc_type',
'AND dmuah_status IN (''N'',''E'');',
'IF v_cnt > 0 THEN',
'RAISE_APPLICATION_ERROR(-20999,''Document Type already in process for this user.'');',
'END IF;',
'END;',
'',
'',
'',
'     SELECT NVL(MAX(TO_NUMBER(dmual_seq_no)), 0) + 1',
'       INTO :dmual_seq_no',
'       FROM DOC_MGMT_USER_ACCESS_LN',
'      WHERE dmual_bu = :global_bu',
'        AND dmual_doc_no = :P214_DMUAH_DOC_NO;',
'',
'',
'',
'',
'       INSERT INTO DOC_MGMT_USER_ACCESS_LN',
'       (',
'        DMUAL_BU,',
'DMUAL_DOC_NO,',
'DMUAL_SEQ_NO,',
'DMUAL_DOC_TYPE,',
'DMUAL_ADD_ACCESS,',
'DMUAL_DEL_ACCESS,',
'DMUAL_VW_ACCESS,',
'DMUAL_CRE_BY,',
'DMUAL_CRE_EMP_ID,',
'DMUAL_CRE_IP_ADDR,',
'DMUAL_CRE_OS_USER,',
'DMUAL_CRE_DATE',
'       )',
'        VALUES',
'        (',
'           :GLOBAL_BU,',
':P214_DMUAH_DOC_NO,',
':DMUAL_SEQ_NO,',
':DMUAL_DOC_TYPE,',
':DMUAL_ADD_ACCESS,',
':DMUAL_DEL_ACCESS,',
':DMUAL_VW_ACCESS,',
':GLOBAL_USER,',
':GLOBAL_EMP_ID,',
':GLOBAL_IP_ADDR,',
':GLOBAL_OS_USER,',
'SYSDATE',
'        );',
'END IF;',
'',
'',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'',
'UPDATE DOC_MGMT_USER_ACCESS_LN',
'SET DMUAL_DOC_TYPE = :DMUAL_DOC_TYPE,',
'DMUAL_ADD_ACCESS = :DMUAL_ADD_ACCESS,',
'DMUAL_DEL_ACCESS = :DMUAL_DEL_ACCESS,',
'DMUAL_VW_ACCESS = :DMUAL_VW_ACCESS,',
'DMUAL_UPD_BY = :GLOBAL_USER,',
'DMUAL_UPD_EMP_ID = :GLOBAL_EMP_ID,',
'DMUAL_UPD_IP_ADDR = :GLOBAL_IP_ADDR,',
'DMUAL_UPD_OS_USER = :GLOBAL_OS_USER,',
'DMUAL_UPD_DATE = SYSDATE',
'WHERE dmual_bu = :GLOBAL_BU',
'AND dmual_doc_no = :P214_DMUAH_DOC_NO',
'AND dmual_seq_no = :dmual_seq_no;',
'',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3577283647799011728
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3648365343579767358)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(3648365190648767357)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Doc. Mgmt. Access'
,p_static_id=>'initialize-form-doc-mgmt-access'
,p_internal_uid=>3576261571251580028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3651677363027775034)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Line Delete'
,p_static_id=>'line-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DELETE   ',
'      FROM DOC_MGMT_USER_ACCESS_LN',
'	WHERE  dmual_bu			=:GLOBAL_BU',
'	AND   dmual_doc_no       = :P214_DMUAH_DOC_NO',
'	AND   DMUAL_SEQ_NO      = :P214_DMUAL_SEQ_NO',
'	AND ROWID =:P214_ROWID1;',
'COMMIT;',
'APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''Line Deleted.'';             ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCEL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>3579573590699587704
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3648367250593767377)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post Query'
,p_static_id=>'post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'SELECT DECODE(:P214_DMUAH_STATUS,''N'',''Draft'',''C'',''Cancelled'',''A'',''Approved'',''E'',''Entry Completed'',:P214_DMUAH_STATUS) INTO :P214_STATUS FROM DUAL;',
'EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3576263478265580047
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3649384794315199032)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(3648365190648767357)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form DOC_MGMT_USER_ACCESS_HD'
,p_static_id=>'process-form-doc-mgmt-user-access-hd'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3648367469314767379)
,p_internal_uid=>3577281021987011702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3742744418671538035)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow1'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P36702001001_WF_NO IS NOT NULL THEN',
'        SELECT  WFDC_DOC_NO,WFDC_CTRL_PERSON',
'          into :P214_DMUAH_DOC_NO,:P214_WF_CTRL_PERSON',
'           FROM work_flow_doc_control',
'        WHERE WFDC_WF_NO = :P36702001001_WF_NO;',
'END IF;',
'EXCEPTION',
'   WHEN NO_DATA_FOUND',
'   THEN',
'      NULL;',
'END;',
'',
'BEGIN	',
'	IF :P214_DMUAH_DOC_NO IS NOT NULL  THEN',
'		SELECT rowid',
'        INTO :P214_ROWID ',
'	  	  FROM prod_request',
'		 WHERE pr_bu   = :Global_bu',
'			AND pr_doc_no = :P214_DMUAH_DOC_NO;',
'END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN ',
'  NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3670640646343350705
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3648805093623980775)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WORKFOLW'
,p_static_id=>'workfolw'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'SELECT ROWID',
'  INTO :P214_ROWID',
'  FROM DOC_MGMT_USER_ACCESS_HD',
' WHERE DMUAH_BU = :GLOBAL_bu',
'   AND DMUAH_DOC_NO = :P214_DMUAH_DOC_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3576701321295793445
);
wwv_flow_imp.component_end;
end;
/
