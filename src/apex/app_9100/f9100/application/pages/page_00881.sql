prompt --application/pages/page_00881
begin
--   Manifest
--     PAGE: 00881
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
 p_id=>881
,p_name=>'Role Access'
,p_alias=>'ROLL-ACCESS'
,p_step_title=>'Role Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function delete_line(a, b) {',
'   apex.message.confirm("Do you want to delete the line detail?",function(okPressed)',
'   {',
'     if (okPressed)',
'     {     ',
'      if (a === ''DELETE'')',
'      {',
'         apex.server.process',
'         (  ',
'            "DELETE", ',
'            {  ',
'               x01: b',
'            },',
'            {',
'                  dataType: ''text'', ',
'                  success: function (data) { ',
'                     apex.message.clearErrors();',
'                     if (data.trim() !== ''success'') {',
'                        apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                     } else {',
'                        console.log(''success'', data);',
'                        apex.region("M").refresh();',
'                        apex.message.showPageSuccess("Line Details deleted successfully.");',
'                     }',
'                  }',
'            }',
'         );',
'      }',
'',
'   }',
'   });',
'}   ',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3651677469012775035)
,p_plug_name=>'Document Managment '
,p_static_id=>'document-managment'
,p_region_name=>'DM'
,p_parent_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DMUA_BU,',
'       DMUA_USER,',
'       DMUA_DOC_TYPE,',
'       DMUA_ADD_ACCESS,',
'       DMUA_DEL_ACCESS,',
'       DMUA_VW_ACCESS,',
'       DMUA_CRE_BY,',
'       DMUA_CRE_EMP_ID,',
'       DMUA_CRE_IP_ADDR,',
'       DMUA_CRE_OS_USER,',
'       DMUA_CRE_DATE,',
'       DMUA_UPD_BY,',
'       DMUA_UPD_EMP_ID,',
'       DMUA_UPD_IP_ADDR,',
'       DMUA_UPD_OS_USER,',
'       DMUA_UPD_DATE',
'  from DOC_MGMT_USER_ACCESS',
'  where DMUA_BU = :global_bu'))
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(3651677771251775038)
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
 p_id=>wwv_flow_imp.id(3651677595048775037)
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
 p_id=>wwv_flow_imp.id(3651679949508775060)
,p_name=>'DMUA_ADD_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_ADD_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Add '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651679663159775057)
,p_name=>'DMUA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651680218703775063)
,p_name=>'DMUA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_CRE_BY'
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
 p_id=>wwv_flow_imp.id(3651680662048775067)
,p_name=>'DMUA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(3651680314842775064)
,p_name=>'DMUA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(3651680374251775065)
,p_name=>'DMUA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(3651680566817775066)
,p_name=>'DMUA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(3651680047785775061)
,p_name=>'DMUA_DEL_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_DEL_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651679869756775059)
,p_name=>'DMUA_DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Document Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651680751722775068)
,p_name=>'DMUA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_UPD_BY'
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
 p_id=>wwv_flow_imp.id(3651681164496775072)
,p_name=>'DMUA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(3651680808878775069)
,p_name=>'DMUA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(3651680940050775070)
,p_name=>'DMUA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(3651681071049775071)
,p_name=>'DMUA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(3651679749488775058)
,p_name=>'DMUA_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651680100602775062)
,p_name=>'DMUA_VW_ACCESS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMUA_VW_ACCESS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'View'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(3651681208265775073)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(3651677526542775036)
,p_internal_uid=>3579573754214587706
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
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(3653033000046290725)
,p_interactive_grid_id=>wwv_flow_imp.id(3651677526542775036)
,p_static_id=>'35809293'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(3653033213732290725)
,p_report_id=>wwv_flow_imp.id(3653033000046290725)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653033753441290730)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(3651677595048775037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653034631097290731)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(3651677771251775038)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653055880663293190)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(3651679663159775057)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653056808801293194)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(3651679749488775058)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653057752154293195)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(3651679869756775059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653058603175293197)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(3651679949508775060)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653059554799293200)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(3651680047785775061)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653060409036293201)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(3651680100602775062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653061370114293205)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(3651680218703775063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653062177961293206)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(3651680314842775064)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653063116621293209)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(3651680374251775065)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653063994208293212)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(3651680566817775066)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653064912516293214)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(3651680662048775067)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653065814006293219)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(3651680751722775068)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653066702054293222)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(3651680808878775069)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653067645684293225)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(3651680940050775070)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653068530443293228)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(3651681071049775071)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653069398690293233)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(3651681164496775072)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3653070281232293234)
,p_view_id=>wwv_flow_imp.id(3653033213732290725)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(3651681208265775073)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7055617833668104103)
,p_plug_name=>'Mobile App'
,p_static_id=>'mobile-app'
,p_region_name=>'M'
,p_parent_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       MAC_BU,',
'       MAC_SEQ_NO,',
'       MAC_MOBILE_ID,',
'       MAC_MOBILE_DESC1,',
'       MAC_MOBILE_DESC2,',
'       MAC_CRE_BY,',
'       MAC_CRE_IP_ADDR,',
'       MAC_CRE_OS_USER,',
'       MAC_CRE_DATE,',
'       MAC_UPD_BY,',
'       MAC_UPD_IP_ADDR,',
'       MAC_UPD_OS_USER,',
'       MAC_UPD_DATE,',
'       MAC_CRE_EMP_ID,',
'       MAC_UPD_EMP_ID,',
'       MAC_ACTIVE_FLAG',
'  from MOBILE_APP_CONFIG',
' where MAC_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(7055619625052104121)
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
 p_id=>wwv_flow_imp.id(7055619772666104122)
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
 p_id=>wwv_flow_imp.id(7055620508546104130)
,p_name=>'DELETE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_link_target=>'javascript:delete_line(''DELETE'',''&MAC_MOBILE_ID.'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7055620759802104132)
,p_name=>'MAC_ACTIVE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_ACTIVE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(7055617991072104105)
,p_name=>'MAC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_BU'
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
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7055618504576104110)
,p_name=>'MAC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_CRE_BY'
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
 p_id=>wwv_flow_imp.id(7055618878355104113)
,p_name=>'MAC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(7055619290161104118)
,p_name=>'MAC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7055618674519104111)
,p_name=>'MAC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7055618737402104112)
,p_name=>'MAC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(7055618328217104108)
,p_name=>'MAC_MOBILE_DESC1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_MOBILE_DESC1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
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
 p_id=>wwv_flow_imp.id(7055618474060104109)
,p_name=>'MAC_MOBILE_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_MOBILE_DESC2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7055618184466104107)
,p_name=>'MAC_MOBILE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_MOBILE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
 p_id=>wwv_flow_imp.id(7055618097073104106)
,p_name=>'MAC_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_enable_filter=>true
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
 p_id=>wwv_flow_imp.id(7055618974064104114)
,p_name=>'MAC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_UPD_BY'
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
 p_id=>wwv_flow_imp.id(7055619193952104117)
,p_name=>'MAC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(7055619444654104119)
,p_name=>'MAC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7055619080849104115)
,p_name=>'MAC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7055619165826104116)
,p_name=>'MAC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAC_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(7055619539659104120)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7055617895574104104)
,p_internal_uid=>1576096911789183902
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
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7055631470991124411)
,p_interactive_grid_id=>wwv_flow_imp.id(7055617895574104104)
,p_static_id=>'15761105'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7055631619469124411)
,p_report_id=>wwv_flow_imp.id(7055631470991124411)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055632141810124416)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7055617991072104105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055632995716124419)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7055618097073104106)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055633915170124420)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7055618184466104107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055634788018124422)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7055618328217104108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055635735670124423)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7055618474060104109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055636643033124425)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7055618504576104110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055637541527124427)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7055618674519104111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055638470891124428)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7055618737402104112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055639341156124430)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7055618878355104113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055640139820124431)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7055618974064104114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055641026124124433)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7055619080849104115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055641967370124434)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7055619165826104116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055642791944124436)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7055619193952104117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055643738285124437)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7055619290161104118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055644608710124439)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7055619444654104119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055645555905124442)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7055619539659104120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055657727812143045)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7055619625052104121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055658646328143047)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7055619772666104122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7055963734008322856)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7055620508546104130)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7056329522813538867)
,p_view_id=>wwv_flow_imp.id(7055631619469124411)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7055620759802104132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5959692349243784273)
,p_plug_name=>'Role'
,p_static_id=>'role'
,p_region_name=>'roll'
,p_parent_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       AR_BU,',
'       AR_ROLE_ID,',
'       AR_ROLE_NAME,',
'       AR_CRE_BY,',
'       AR_CRE_EMP_ID,',
'       AR_CRE_IP_ADDR,',
'       AR_CRE_OS_USER,',
'       AR_CRE_DATE,',
'       AR_UPD_BY,',
'       AR_UPD_EMP_ID,',
'       AR_UPD_IP_ADDR,',
'       AR_UPD_OS_USER,',
'       AR_UPD_DATE',
'  from APPL_ROLES',
' where AR_BU =:GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(5959692615784784275)
,p_name=>'AR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Bu'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5959692857277784278)
,p_name=>'AR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960712024711645932)
,p_name=>'AR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ar Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960711699946645929)
,p_name=>'AR_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Cre Emp Id'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960711776988645930)
,p_name=>'AR_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(5960711919496645931)
,p_name=>'AR_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Cre Os User'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5959692731797784276)
,p_name=>'AR_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(5959692743158784277)
,p_name=>'AR_ROLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_ROLE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Role Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(5960712083616645933)
,p_name=>'AR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960712461726645937)
,p_name=>'AR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ar Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960712142226645934)
,p_name=>'AR_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(5960712322660645935)
,p_name=>'AR_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(5960712355483645936)
,p_name=>'AR_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AR_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ar Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(5960712539781645938)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5959692478691784274)
,p_internal_uid=>477730643148173246
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
 p_id=>wwv_flow_imp.id(5960723124563652584)
,p_interactive_grid_id=>wwv_flow_imp.id(5959692478691784274)
,p_static_id=>'4787613'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5960723244555652584)
,p_report_id=>wwv_flow_imp.id(5960723124563652584)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960723758893652587)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5959692615784784275)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960724699117652596)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5959692731797784276)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109.156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960725591088652603)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5959692743158784277)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960726448718652607)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5959692857277784278)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960727416400652613)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5960711699946645929)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960728252153652618)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5960711776988645930)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960729184906652623)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5960711919496645931)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960729993313652629)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5960712024711645932)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960730887097652634)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5960712083616645933)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960731824499652638)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5960712142226645934)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960732653027652645)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5960712322660645935)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960733603726652649)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5960712355483645936)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960734492067652654)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5960712461726645937)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960735362086652660)
,p_view_id=>wwv_flow_imp.id(5960723244555652584)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5960712539781645938)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5959692172634784271)
,p_plug_name=>'Role Access'
,p_static_id=>'role-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5960713317056645945)
,p_plug_name=>'Role Access'
,p_static_id=>'role-access-2'
,p_region_name=>'rolla'
,p_parent_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       AURA_BU,',
'       AURA_USER_ID,',
'       AURA_ROLE_ID,',
'       AURA_BENF_TYPE,',
'       AURA_BENF_ID,',
'       AURA_DATE_FROM,',
'       AURA_DATE_TO,',
'       AURA_CRE_BY,',
'       AURA_CRE_EMP_ID,',
'       AURA_CRE_IP_ADDR,',
'       AURA_CRE_OS_USER,',
'       AURA_CRE_DATE,',
'       AURA_UPD_BY,',
'       AURA_UPD_EMP_ID,',
'       AURA_UPD_IP_ADDR,',
'       AURA_UPD_OS_USER,',
'       AURA_UPD_DATE',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(5960713850975645951)
,p_name=>'AURA_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Benf. Name'
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
  'title', 'Benf. ID')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT process_name1, process_id',
'  FROM processes',
' WHERE process_bu = :global_bu AND :aura_benf_type = ''W''',
'UNION ALL',
'SELECT sa_area_desc1, sa_area',
'  FROM sales_areas',
' WHERE sa_bu = :global_bu AND :aura_benf_type = ''R''',
'UNION ALL',
'SELECT sat_terr_desc1, sat_terr_id',
'  FROM sales_area_terr',
' WHERE sat_bu = :global_bu AND :aura_benf_type = ''Z''',
'UNION ALL',
'SELECT sst_desc1, sst_sub_terr_id',
'  FROM sales_sub_terr',
' WHERE sst_bu = :global_bu AND :aura_benf_type = ''S'''))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'AURA_BENF_TYPE'
,p_ajax_optimize_refresh=>true
,p_static_id=>'benf'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960713770970645950)
,p_name=>'AURA_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Work Centre;W,Sub Territory;S,Zone;Z,Region;R,N/A;N'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'type'
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
 p_id=>wwv_flow_imp.id(5960713533206645947)
,p_name=>'AURA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Bu'
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
,p_default_expression=>':GLOBAL_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714204223645954)
,p_name=>'AURA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714614775645958)
,p_name=>'AURA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Aura Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714320368645955)
,p_name=>'AURA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_default_expression=>':GLOBAL_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714383294645956)
,p_name=>'AURA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Cre Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  :AURA_CRE_IP_ADDR := SYS_CONTEXT (''USERENV'', ''SESSION_USER'');',
'  RETURN ',
'      :AURA_CRE_IP_ADDR;',
'END;'))
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714507721645957)
,p_name=>'AURA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Cre Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960713978228645952)
,p_name=>'AURA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(5960714056496645953)
,p_name=>'AURA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(5960713671289645949)
,p_name=>'AURA_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Role'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Role')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ar_role_name,ar_role_id',
'  from APPL_ROLES',
' where AR_BU =:GLOBAL_bu'))
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
 p_id=>wwv_flow_imp.id(5960714640782645959)
,p_name=>'AURA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960715075931645963)
,p_name=>'AURA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Aura Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714781988645960)
,p_name=>'AURA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_default_expression=>':GLOBAL_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960714864707645961)
,p_name=>'AURA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Upd Ip Addr'
,p_heading_alignment=>'CENTER'
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
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  :AURA_UPD_IP_ADDR := SYS_CONTEXT (''USERENV'', ''SESSION_USER'');',
'  RETURN ',
'      :AURA_UPD_IP_ADDR;',
'END;'))
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960715018026645962)
,p_name=>'AURA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Aura Upd Os User'
,p_heading_alignment=>'CENTER'
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5960713584860645948)
,p_name=>'AURA_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AURA_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'User'
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
  'title', 'User')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select appluser_id r,appluser_id s',
'  FROM appl_users',
' WHERE appluser_bu =:GLOBAL_bu'))
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
 p_id=>wwv_flow_imp.id(5960715210270645964)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5960713347672645946)
,p_internal_uid=>478751512129034918
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
 p_id=>wwv_flow_imp.id(5960749640621666942)
,p_interactive_grid_id=>wwv_flow_imp.id(5960713347672645946)
,p_static_id=>'4787879'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5960749855722666942)
,p_report_id=>wwv_flow_imp.id(5960749640621666942)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960750743294666946)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5960713533206645947)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960751647448666953)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5960713584860645948)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960752583549666957)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5960713671289645949)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960753502994666963)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5960713770970645950)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960754381728666968)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5960713850975645951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960755304167666974)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5960713978228645952)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960756161858666979)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5960714056496645953)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112.49
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960757122932666985)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5960714204223645954)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960757974057666990)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5960714320368645955)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960758874005666996)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5960714383294645956)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960759824652667001)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5960714507721645957)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960760657348667007)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5960714614775645958)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960761607127667012)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5960714640782645959)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960762514200667018)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5960714781988645960)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960763344682667028)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5960714864707645961)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960764219988667035)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5960715018026645962)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960765055130667042)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5960715075931645963)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5960766023991667046)
,p_view_id=>wwv_flow_imp.id(5960749855722666942)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5960715210270645964)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6338958546265612343)
,p_plug_name=>'Vertical'
,p_static_id=>'vertical'
,p_region_name=>'vertical'
,p_parent_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'ERP_VERTICAL'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'EV_VERTICAL_ID'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IG'
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
 p_id=>wwv_flow_imp.id(6458432103654337308)
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
 p_id=>wwv_flow_imp.id(6458432208729337309)
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
 p_id=>wwv_flow_imp.id(6338958907497612347)
,p_name=>'EV_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Cre By'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6338959282562612350)
,p_name=>'EV_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ev Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6458431810883337305)
,p_name=>'EV_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
,p_default_expression=>':GLOBAL_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6338959018544612348)
,p_name=>'EV_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_default_expression=>':GLOBAL_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6338959153990612349)
,p_name=>'EV_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6458432049246337307)
,p_name=>'EV_OLD_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_OLD_VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Old Vertical Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(6338959329629612351)
,p_name=>'EV_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6458431702432337304)
,p_name=>'EV_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ev Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6458431978548337306)
,p_name=>'EV_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Upd Emp Id'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6338959415878612352)
,p_name=>'EV_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Upd Ip Addr'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6458431635625337303)
,p_name=>'EV_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ev Upd Os User'
,p_heading_alignment=>'LEFT'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6338958848717612346)
,p_name=>'EV_VERTICAL_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_VERTICAL_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vertical Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(6338958747339612345)
,p_name=>'EV_VERTICAL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EV_VERTICAL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vertical '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(6458432457779337311)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6338958669832612344)
,p_internal_uid=>859437686047692142
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
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6458553492483356044)
,p_interactive_grid_id=>wwv_flow_imp.id(6338958669832612344)
,p_static_id=>'9790326'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6458553718156356045)
,p_report_id=>wwv_flow_imp.id(6458553492483356044)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458554282892356050)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6338958747339612345)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458555131642356053)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6338958848717612346)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458555993163356055)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6338958907497612347)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458556953563356056)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6338959018544612348)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458557818596356058)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6338959153990612349)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458558761839356059)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6338959282562612350)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458559636316356061)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6338959329629612351)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458560551623356064)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6338959415878612352)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458561465244356066)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6458431635625337303)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458562298166356067)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6458431702432337304)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458563252418356069)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6458431810883337305)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458564140531356072)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6458431978548337306)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458564994465356073)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6458432049246337307)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458565887019356075)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6458432103654337308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458566811312356077)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6458432208729337309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6458567761959356077)
,p_view_id=>wwv_flow_imp.id(6458553718156356045)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6458432457779337311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960715577030645968)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5959692349243784273)
,p_button_name=>'add'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''roll'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960715908032645971)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5960713317056645945)
,p_button_name=>'add1'
,p_static_id=>'add-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''rolla'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6458432630738337313)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6338958546265612343)
,p_button_name=>'Add'
,p_static_id=>'add-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''vertical'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960715778584645970)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5959692349243784273)
,p_button_name=>'download'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''roll'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960716063459645973)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5960713317056645945)
,p_button_name=>'download1'
,p_static_id=>'download-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''rolla'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3651681470638775075)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(3651677469012775035)
,p_button_name=>'download_1'
,p_static_id=>'download-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''DM'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6458432798202337315)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6338958546265612343)
,p_button_name=>'Download'
,p_static_id=>'download-4'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''vertical'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7055619888291104124)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7055617833668104103)
,p_button_name=>'Mobile_ADD'
,p_static_id=>'mobile-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''M'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7055620057411104125)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7055617833668104103)
,p_button_name=>'Mobile_Save'
,p_static_id=>'mobile-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''M'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960715697017645969)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5959692349243784273)
,p_button_name=>'save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''roll'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5960716007249645972)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5960713317056645945)
,p_button_name=>'Save1'
,p_static_id=>'save-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''rolla'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6458432780673337314)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6338958546265612343)
,p_button_name=>'Save'
,p_static_id=>'save-3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5653951718958886385)
,p_name=>'P881_MAIN_TAB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5959692271808784272)
,p_name=>'P881_RADIO_BTN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5959692172634784271)
,p_item_default=>'NVL(:P881_MAIN_TAB,''R'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Radio Btn'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Role;R,Role Access;A,Vertical;V,Mobile App Config.;M,Doc. Mgmt. Access;DM'
,p_colspan=>5
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6458433054358337317)
,p_tabular_form_region_id=>wwv_flow_imp.id(6338958546265612343)
,p_validation_name=>'EV_VERTICAL_ID'
,p_static_id=>'ev-vertical-id'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :EV_VERTICAL_ID IS NULL THEN',
'    RETURN(''Vertical Id must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6458432630738337313)
,p_associated_column=>'EV_VERTICAL_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7055620266713104127)
,p_tabular_form_region_id=>wwv_flow_imp.id(7055617833668104103)
,p_validation_name=>'Mobile Desc.'
,p_static_id=>'mobile-desc'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :MAC_MOBILE_DESC1 IS NULL THEN',
'   RETURN (''Mobile Desc. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'MAC_MOBILE_DESC1'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7055620144783104126)
,p_tabular_form_region_id=>wwv_flow_imp.id(7055617833668104103)
,p_validation_name=>'Mobile ID'
,p_static_id=>'mobile-id'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :MAC_MOBILE_ID IS NULL THEN',
'   RETURN (''Mobile ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'MAC_MOBILE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960716350682645976)
,p_tabular_form_region_id=>wwv_flow_imp.id(5959692349243784273)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AR_ROLE_ID IS NULL THEN',
'RETURN(''Role must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AR_ROLE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960716504408645977)
,p_tabular_form_region_id=>wwv_flow_imp.id(5959692349243784273)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AR_ROLE_NAME IS NULL THEN ',
'RETURN(''Role Name must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AR_ROLE_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960964530340877829)
,p_tabular_form_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_validation_name=>'New_2'
,p_static_id=>'new-3'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AURA_USER_ID IS NULL THEN ',
'RETURN(''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AURA_USER_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960964563067877830)
,p_tabular_form_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_validation_name=>'New_3'
,p_static_id=>'new-4'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AURA_ROLE_ID IS NULL THEN ',
'RETURN(''Role must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AURA_ROLE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960964705274877831)
,p_tabular_form_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_validation_name=>'New_4'
,p_static_id=>'new-5'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AURA_BENF_TYPE <> ''N'' AND :AURA_BENF_ID IS NULL THEN ',
'RETURN(''Benf. ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AURA_BENF_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960964745849877832)
,p_tabular_form_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_validation_name=>'New_5'
,p_static_id=>'new-6'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:AURA_DATE_FROM,''DD-MON-YYYY'') IS NULL THEN ',
'RETURN(''Date From must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AURA_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5960964865088877833)
,p_tabular_form_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_validation_name=>'New_6'
,p_static_id=>'new-7'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:AURA_DATE_TO,''DD-MON-YYYY'') IS NULL THEN ',
'RETURN(''Date To must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'AURA_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5960964946091877834)
,p_name=>'Assign Type'
,p_static_id=>'assign-type'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_triggering_element=>'AURA_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5960965125182877835)
,p_event_id=>wwv_flow_imp.id(5960964946091877834)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'AURA_BENF_TYPE',
  'items_to_submit', 'AURA_ROLE_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :AURA_ROLE_ID = ''WCINC'' THEN ',
    '   :AURA_BENF_TYPE := ''W'';',
    'ELSIF :AURA_ROLE_ID = ''STR'' THEN ',
    '   :AURA_BENF_TYPE := ''S'';',
    'ELSIF :AURA_ROLE_ID = ''REG'' THEN ',
    '   :AURA_BENF_TYPE := ''R'';',
    'ELSIF :AURA_ROLE_ID = ''ZONE'' THEN ',
    '   :AURA_BENF_TYPE := ''Z'';',
    'ELSE',
    '   :AURA_BENF_TYPE := ''N'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5960713033740645942)
,p_name=>'Change Access'
,p_static_id=>'change-access'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P881_RADIO_BTN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5653951863881886386)
,p_event_id=>wwv_flow_imp.id(5960713033740645942)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P881_MAIN_TAB',
  'items_to_submit', 'P881_RADIO_BTN',
  'language', 'PLSQL',
  'plsql_code', ':P881_MAIN_TAB:= :P881_RADIO_BTN;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5960713127124645943)
,p_event_id=>wwv_flow_imp.id(5960713033740645942)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''R'' : ''roll'',',
    '  ''A'' : ''rolla'',',
    '  ''V'' : ''vertical'',',
    '  ''M'' : ''M'',',
    '  ''DM'': ''DM''',
    '};',
    '',
    '',
    'const selectedTab = $v("P881_RADIO_BTN");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7055620301831104128)
,p_name=>'Mobile Refrash'
,p_static_id=>'mobile-refrash'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7055617833668104103)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7055620387830104129)
,p_event_id=>wwv_flow_imp.id(7055620301831104128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7055617833668104103)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5960716172930645974)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_triggering_element=>'AURA_BENF_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5960716329135645975)
,p_event_id=>wwv_flow_imp.id(5960716172930645974)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var dis = apex.item(''type'').getValue();',
    '',
    'if (dis == ''N''){',
    '  apex.item(''benf'').disable();',
    '  }',
    '  else{',
    '    apex.item(''benf'').enable();',
    '  }',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7055620649596104131)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE'
,p_static_id=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF APEX_APPLICATION.G_X01 IS NOT NULL THEN',
'',
'    DECLARE',
'        v_alert             NUMBER;',
'        mobile_count        NUMBER;',
'    BEGIN',
'',
'	    SELECT COUNT(maaln_mobile)',
'	      INTO mobile_count	',
'          FROM mobile_app_access_hd a,',
'               mobile_app_access_ln b',
'         WHERE a.maahd_bu      = :GLOBAL_bu',
'           AND a.maahd_bu      = b.maaln_bu',
'           AND a.maahd_doc_no  = b.maaln_doc_no',
'           AND a.maahd_status  IN (''P'',''N'')',
'           AND a.maahd_type    = ''A''',
'           AND b.maaln_mobile  = APEX_APPLICATION.G_X01;',
'',
'        IF mobile_count > 0 THEN	 ',
'           HTP.P(''Cannot delete since child records exists.''); ',
'        ELSE',
'            DELETE mobile_app_config ',
'             WHERE mac_bu        = :GLOBAL_BU',
'               AND mac_mobile_id = APEX_APPLICATION.G_X01;',
'         COMMIT;',
'         HTP.P(''success'');',
'        END IF;',
'    END;',
'',
'END IF;   ',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1576099665811183929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7055619879507104123)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7055617833668104103)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Mobile App - Save Interactive Grid Data'
,p_static_id=>'mobile-app-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :mac_mobile_id IS NOT NULL THEN',
'        DECLARE',
'',
'            CURSOR c1',
'                IS',
'            SELECT ROWID AS row_id,',
'			       mac_mobile_id,',
'                   mac_mobile_desc1',
'              FROM mobile_app_config',
'             WHERE mac_bu = :GLOBAL_bu;',
'',
'            cr1        		    c1%ROWTYPE;',
'',
'        BEGIN',
'            OPEN c1;',
'	        FETCH c1 INTO cr1;',
'                IF c1%FOUND THEN',
'				',
'                IF cr1.mac_mobile_id = :mac_mobile_id AND cr1.row_id != :ROWID THEN',
'                   RAISE_APPLICATION_ERROR(-20999,''Mobile ID already exists. Duplicate values are not allowed'');',
'                END IF;',
'',
'                IF cr1.mac_mobile_desc1 = :mac_mobile_desc1 AND cr1.row_id != :ROWID THEN',
'                   RAISE_APPLICATION_ERROR(-20999,''Mobile Desc. already exists. Duplicate values are not allowed'');',
'                END IF;',
'				',
'                END IF;',
'            CLOSE c1;',
'        END;',
'END IF;',
'',
'IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'    SELECT NVL(MAX(TO_NUMBER(mac_seq_no)), 0000) + 1',
'      INTO :mac_seq_no',
'      FROM mobile_app_config',
'     WHERE mac_bu     = :GLOBAL_BU; ',
'',
'	INSERT INTO mobile_app_config (',
'				mac_bu,',
'                mac_seq_no,',
'                mac_mobile_id,',
'                mac_mobile_desc1,',
'                mac_active_flag,',
'                mac_cre_by,',
'                mac_cre_ip_addr,',
'                mac_cre_date,',
'                mac_cre_emp_id',
'				)',
'		 VALUES(',
'				:GLOBAL_BU,             --  mac_bu,',
'                :mac_seq_no,            --  mac_seq_no,',
'                :mac_mobile_id,         --  mac_mobile_id,',
'                :mac_mobile_desc1,      --  mac_mobile_desc1,',
'                ''Y'',                    --  mac_active_flag,',
'                :GLOBAL_USER,           --  mac_cre_by,',
'                :GLOBAL_IP,             --  mac_cre_ip_addr,',
'                SYSDATE,                --  mac_cre_date,',
'                :GLOBAL_EMP_ID          --  mac_cre_emp_id',
'				);',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span> Created successfully </span>'';',
'',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'    UPDATE mobile_app_config',
'       SET mac_mobile_desc1 = :mac_mobile_desc1,',
'           mac_active_flag  = :mac_active_flag,',
'		   mac_upd_by       = :GLOBAL_USER,',
'		   mac_upd_date     = SYSDATE,',
'		   mac_upd_ip_addr  = :GLOBAL_IP,',
'           mac_upd_emp_id   = :GLOBAL_EMP_ID',
'     WHERE ROWID 		    = :ROWID;',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span> Updated successfully </span>'';',
'',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1576098895722183921
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6458432926110337316)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process_for_Rollacess'
,p_static_id=>'process-for-rollacess'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* DECLARE',
'      v_cnt       NUMBER(5);',
'    BEGIN  ',
'',
'        SELECT COUNT(*)',
'          INTO v_cnt',
'          FROM ERP_VERTICAL',
'         WHERE EV_VERTICAL_ID  = :EV_VERTICAL_ID;',
'',
'        IF v_cnt > 0 THEN',
'           RAISE_APPLICATION_ERROR(-20999,''Duplicate ID Found'');',
'        END IF;   ',
'       END;',
'*/',
'',
'',
'',
'IF :APEX$ROW_STATUS = ''C'' THEN',
'  RAISE_APPLICATION_ERROR(-20999,:EV_VERTICAL_ID);',
'   INSERT INTO ERP_VERTICAL (',
'				EV_VERTICAL_ID,',
'				EV_VERTICAL_DESC,',
'				EV_CRE_BY,',
'				EV_CRE_IP_ADDR,',
'				EV_CRE_OS_USER,',
'				EV_CRE_DATE,',
'				EV_CRE_EMP_ID,',
'				EV_OLD_VERTICAL_ID)',
'			VALUES(',
'			    :EV_VERTICAL_ID,',
'				:EV_VERTICAL_DESC,',
'				:GLOBAL_USER,',
'				:GLOBAL_IP,',
'				 NULL,',
'				 SYSDATE,',
'				:GLOBAL_EMP_ID,',
'				:EV_OLD_VERTICAL_ID);',
'',
'	apex_application.g_print_success_message := ''<span>Row Inserted</span>''; ',
'END IF;',
'',
'',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'',
'   UPDATE ERP_VERTICAL',
'       SET EV_VERTICAL_ID   =   :EV_VERTICAL_ID ,',
'           EV_VERTICAL_DESC =   :EV_VERTICAL_DESC,',
'           EV_UPD_BY        =   :GLOBAL_USER,',
'           EV_UPD_IP_ADDR   =   :GLOBAL_IP,',
'           EV_UPD_OS_USER   =   NULL,',
'           EV_UPD_DATE      =   SYSDATE',
'     WHERE ROWID            =   :ROWID;	',
'	 ',
'	 apex_application.g_print_success_message := ''<span>Row Updated</span>''; ',
'',
'END IF;		'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Add,Save'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>978911942325417114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5960715477318645967)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Roll Access - Save Interactive Grid Data'
,p_static_id=>'roll-access-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>478753641775034939
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5960712881464645941)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5959692349243784273)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Roll - Save Interactive Grid Data'
,p_static_id=>'roll-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>478751045921034913
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6094030874004561335)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5960713317056645945)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VALIDATION'
,p_static_id=>'validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'CURSOR C1',
'IS  ',
'SELECT ',
' AURA_USER_ID,',
'AURA_ROLE_ID , COUNT(*)  ROLE_ID ',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu',
' AND AURA_BENF_TYPE =''N''',
'  AND AURA_USER_ID =:AURA_USER_ID',
' AND AURA_ROLE_ID =:AURA_ROLE_ID',
' AND TRUNC(SYSDATE)BETWEEN AURA_DATE_FROM AND AURA_DATE_TO',
'  GROUP BY  AURA_USER_ID ,AURA_ROLE_ID',
' HAVING COUNT(*) > 1;',
' ',
' CURSOR C2',
'IS  ',
'SELECT ',
' AURA_USER_ID,',
'AURA_ROLE_ID, COUNT(*)  ROLE_ID  ',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu',
' AND AURA_BENF_TYPE =''W''',
'  AND AURA_USER_ID =:AURA_USER_ID',
' AND AURA_ROLE_ID =:AURA_ROLE_ID',
' AND TRUNC(SYSDATE)BETWEEN AURA_DATE_FROM AND AURA_DATE_TO',
'  GROUP BY  AURA_USER_ID ,AURA_ROLE_ID',
' HAVING COUNT(*) > 1;',
'',
' CURSOR C3',
'IS  ',
'SELECT ',
' AURA_USER_ID,',
'AURA_ROLE_ID , COUNT(*)  ROLE_ID ',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu',
' AND AURA_BENF_TYPE =''S''',
' AND TRUNC(SYSDATE)BETWEEN AURA_DATE_FROM AND AURA_DATE_TO',
' AND AURA_USER_ID =:AURA_USER_ID',
' AND AURA_ROLE_ID =:AURA_ROLE_ID',
'  GROUP BY  AURA_USER_ID ,AURA_ROLE_ID',
' HAVING COUNT(*) > 1;',
'',
'',
' CURSOR C4',
'IS  ',
'SELECT ',
' AURA_USER_ID,',
'AURA_ROLE_ID, COUNT(*)  ROLE_ID  ',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu',
' AND AURA_BENF_TYPE =''Z''',
' AND TRUNC(SYSDATE)BETWEEN AURA_DATE_FROM AND AURA_DATE_TO',
'  AND AURA_USER_ID =:AURA_USER_ID',
' AND AURA_ROLE_ID =:AURA_ROLE_ID',
'  GROUP BY  AURA_USER_ID ,AURA_ROLE_ID',
' HAVING COUNT(*) > 1;',
' ',
' CURSOR C5',
'IS  ',
'SELECT ',
' AURA_USER_ID,',
'AURA_ROLE_ID , COUNT(*)  ROLE_ID ',
'  from APPL_USER_ROLE_ACCESS',
' where AURA_BU =:GLOBAL_bu',
' AND AURA_BENF_TYPE =''R''',
'  AND AURA_USER_ID =:AURA_USER_ID',
' AND AURA_ROLE_ID =:AURA_ROLE_ID',
' AND TRUNC(SYSDATE)BETWEEN AURA_DATE_FROM AND AURA_DATE_TO',
'  GROUP BY  AURA_USER_ID ,AURA_ROLE_ID',
' HAVING COUNT(*) > 1; ',
' ',
'CR1 C1%ROWTYPE;',
'CR2 C2%ROWTYPE;',
'CR3 C3%ROWTYPE;',
'CR4 C4%ROWTYPE;',
'CR5 C5%ROWTYPE;',
'',
' BEGIN ',
' OPEN C1;',
'  FETCH c1 INTO cr1;',
' IF C1%FOUND THEN',
' IF CR1.ROLE_ID >1  THEN',
' raise_application_error(-20999,''Role access already exists for the user'');',
' END IF;',
'  END IF;',
' CLOSE C1;',
' ',
'  OPEN C2;',
'  FETCH c2 INTO cr2;',
' IF C2%FOUND THEN  ',
' IF CR2.ROLE_ID >1   THEN',
' raise_application_error(-20999,''Role access already exists for the user'');',
' END IF;',
'  END IF;',
' CLOSE C2;',
' ',
' ',
'  OPEN C3;',
'FETCH c3 INTO cr3;    ',
' IF C3%FOUND THEN   ',
' IF CR3.ROLE_ID >1   THEN',
' raise_application_error(-20999,''Role access already exists for the user'');',
' END IF;',
'  END IF;',
' CLOSE C3;',
' ',
'  OPEN C4;  ',
'FETCH c4 INTO cr4;  ',
' IF C4%FOUND THEN ',
' IF CR4.ROLE_ID >1  THEN',
' raise_application_error(-20999,''Role access already exists for the user'');',
' END IF;',
'  END IF;',
' CLOSE C4;',
' ',
' ',
'OPEN C5;',
'FETCH c5 INTO cr5;  ',
' IF C5%FOUND THEN',
' IF CR5.ROLE_ID >1    THEN',
' raise_application_error(-20999,''Role access already exists for the user'');',
' END IF;',
'  END IF;',
' CLOSE C5;',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>612069038460950307
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6458432355797337310)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6338958546265612343)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Vertical - Save Interactive Grid Data'
,p_static_id=>'vertical-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'	SELECT NVL(MAX(TO_NUMBER(ev_vertical_id)), 20000) + 1',
'	  INTO :EV_VERTICAL_ID ',
'      FROM erp_vertical;',
'',
'INSERT INTO erp_vertical (',
'			ev_vertical_id,',
'			ev_vertical_desc,',
'			ev_cre_by,',
'			ev_cre_ip_addr,',
'			ev_cre_date,',
'			ev_cre_emp_id',
'			)',
'	 VALUES(',
'			:EV_VERTICAL_ID,',
'			:EV_VERTICAL_DESC,',
'			:GLOBAL_USER,',
'			:GLOBAL_IP,',
'			SYSDATE,',
'			:GLOBAL_EMP_ID',
'			);',
'',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'	UPDATE erp_vertical ',
'	   SET ev_vertical_desc = :EV_VERTICAL_DESC,',
'	       ev_upd_by 		= :GLOBAL_USER,',
'		   ev_upd_ip_addr	= :GLOBAL_IP,',
'		   ev_upd_date		= SYSDATE,',
'		   ev_upd_emp_id	= :GLOBAL_EMP_ID',
'	 WHERE ROWID 			= :ROWID;',
'	',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>978911372012417108
);
wwv_flow_imp.component_end;
end;
/
