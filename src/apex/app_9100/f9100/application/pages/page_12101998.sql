prompt --application/pages/page_12101998
begin
--   Manifest
--     PAGE: 12101998
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
 p_id=>12101998
,p_name=>'POS User'
,p_alias=>'POS-USER'
,p_step_title=>'POS User'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function delete_line(a, b) {',
'   apex.message.confirm("Do you want to delete the line detail?",function(okPressed)',
'   {',
'     if (okPressed)',
'     {     ',
'      if (a === ''DELETE_LINE'')',
'      {',
'         apex.server.process',
'         (  ',
'            "DELETE_LINE_POS",',
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
'                        apex.region("poshd").refresh();',
'                        apex.region("ir_line").refresh();',
'                        apex.message.showPageSuccess("Line Details deleted successfully.");',
'                     }',
'                  }',
'            }',
'         );',
'      }',
'   }',
'   });',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5720548847991723839)
,p_plug_name=>'BTN'
,p_static_id=>'btn'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5725179803622779129)
,p_plug_name=>'POS Add Unit Access'
,p_static_id=>'pos-add-unit-access'
,p_title=>'Add Unit Access'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5720550289099723853)
,p_plug_name=>'POS Line'
,p_static_id=>'pos-line'
,p_title=>'Report'
,p_region_name=>'ir_line'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WPPALN_BU,',
'       WPPALN_DOC_NO,',
'       WPPALN_PLNT_LOC_ID,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = wppaln_bu',
'           AND bupld_loc_id = wppaln_plnt_loc_id )wppaln_loc_name,',
'       WPPALN_DATE_FROM,',
'       WPPALN_DATE_TO,',
'       WPPALN_CRE_BY,',
'       WPPALN_CRE_DATE,',
'       WPPALN_UPD_BY,',
'       WPPALN_UPD_DATE,',
'       WPPALN_TYPE,',
'       WPPALN_SEQ_NO,',
'       WPPALN_USER_ID,',
'       WPPALN_SEL_FLAG,',
'       WPPALN_SEL_USER,',
'       WPPALN_PLNT_ID,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = WPPALN_BU',
'           AND bup_plant_id = WPPALN_PLNT_ID) wppaln_plnt_desc',
'  from WAPL_POSUSER_PLNT_ACCESS_LN',
' where WPPALN_BU = :GLOBAL_BU',
'   and WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P12101998_WPPAHD_DOC_NO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(5720552257686723873)
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
 p_id=>wwv_flow_imp.id(5720552383860723874)
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
 p_id=>wwv_flow_imp.id(5729958582291086738)
,p_name=>'DELETE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-label="Delete"><span class="fa fa-trash" aria-hidden="true" style="color:red" title="Delete"></span></span>')).to_clob
,p_link_target=>'javascript:delete_line(''DELETE_LINE'',''&ROWID.'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720551992569723870)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720550512238723855)
,p_name=>'WPPALN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
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
,p_is_primary_key=>true
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720551030475723860)
,p_name=>'WPPALN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(5720551038965723861)
,p_name=>'WPPALN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wppaln Cre Date'
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
 p_id=>wwv_flow_imp.id(5720550758937723858)
,p_name=>'WPPALN_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
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
 p_id=>wwv_flow_imp.id(5720550894766723859)
,p_name=>'WPPALN_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
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
 p_id=>wwv_flow_imp.id(5720550538595723856)
,p_name=>'WPPALN_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P12101998_WPPAHD_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720552074699723871)
,p_name=>'WPPALN_LOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_LOC_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(5720552164359723872)
,p_name=>'WPPALN_PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(5720551905994723869)
,p_name=>'WPPALN_PLNT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_PLNT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(5720550699284723857)
,p_name=>'WPPALN_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_PLNT_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(5720551661825723867)
,p_name=>'WPPALN_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln Sel Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(5720551819628723868)
,p_name=>'WPPALN_SEL_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_SEL_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln Sel User'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720551506004723865)
,p_name=>'WPPALN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5720551400100723864)
,p_name=>'WPPALN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(5720551179693723862)
,p_name=>'WPPALN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln Upd By'
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
 p_id=>wwv_flow_imp.id(5720551302274723863)
,p_name=>'WPPALN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wppaln Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(5720551571844723866)
,p_name=>'WPPALN_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WPPALN_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wppaln User Id'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5720550378919723854)
,p_internal_uid=>238588543376112826
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
,p_no_data_found_message=>'No Data Found.'
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
 p_id=>wwv_flow_imp.id(5724463791199532870)
,p_interactive_grid_id=>wwv_flow_imp.id(5720550378919723854)
,p_static_id=>'2425020'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5724464001880532871)
,p_report_id=>wwv_flow_imp.id(5724463791199532870)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724464448203532884)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5720550512238723855)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724465388927532895)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5720550538595723856)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724466284066532904)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5720550699284723857)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724467182774532917)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5720550758937723858)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724468120087532924)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5720550894766723859)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724469001628532932)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5720551030475723860)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724469874572532938)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5720551038965723861)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724470810268532948)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5720551179693723862)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724471703545532957)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5720551302274723863)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724472588359532963)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5720551400100723864)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724473450184532971)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5720551506004723865)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724474352301532979)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5720551571844723866)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724475290983532987)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5720551661825723867)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724476192062532993)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5720551819628723868)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724477024223533001)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5720551905994723869)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724477911050533010)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5720551992569723870)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724628430774650645)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5720552074699723871)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724629237472650654)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5720552164359723872)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724803021944677206)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(5720552257686723873)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5724803924407677213)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5720552383860723874)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5731865569933306181)
,p_view_id=>wwv_flow_imp.id(5724464001880532871)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(5729958582291086738)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5720685167564917709)
,p_plug_name=>'POS User'
,p_static_id=>'pos-user'
,p_region_name=>'poshd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WAPL_POSUSER_PLNT_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720549067285723841)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720548974662723840)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:1171997:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720549498808723845)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P12101998_ROWID IS NOT NULL AND :P12101998_WPPAHD_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720700792461917892)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12101998_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'  fa-check '
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720552778431723878)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5720550289099723853)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P12101998_WPPAHD_TYPE IN (''A'',''C'') AND :P12101998_WPPAHD_DOC_NO IS NOT NULL AND :P12101998_WPPAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720552698792723877)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5720550289099723853)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P12101998_WPPAHD_TYPE IN (''R'',''E'') AND :P12101998_WPPAHD_DOC_NO IS NOT NULL AND :P12101998_WPPAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5725180729383779138)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5725179803622779129)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'&nbsp;'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5725180571452779137)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5725179803622779129)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720552578659723876)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5720550289099723853)
,p_button_name=>'POS_Line_Save'
,p_static_id=>'pos-line-save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_bu',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO',
'   AND :P12101998_WPPAHD_STATUS = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720549354906723844)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'  FROM wapl_posuser_plnt_access_ln',
' WHERE wppaln_bu      = :GLOBAL_BU',
'   AND wppaln_doc_no  = :P12101998_WPPAHD_DOC_NO',
'   AND wppaln_user_id = :P12101998_WPPAHD_USER_ID',
'   AND :P12101998_WPPAHD_STATUS = ''N'' )> 0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720549701330723847)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1171997:&SESSION.::&DEBUG.::P1171997_SHOW_DATA:Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720700426899917890)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :Global_bu',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM dual',
' WHERE :P12101998_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'  fa-check '
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5720549592228723846)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5720548847991723839)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1171997:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5725181308349779144)
,p_branch_name=>'Self_Approve'
,p_branch_action=>'f?p=&APP_ID.:12101998:&SESSION.::&DEBUG.::P12101998_ROWID:&P12101998_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5725181809144779149)
,p_branch_name=>'Go to page POS Unit Access OK (1171210)'
,p_branch_action=>'f?p=&APP_ID.:1171210:&SESSION.::&DEBUG.::P1171210_HD_DOC_NO,P1171210_USER_ID,P1171210_ROWID:&P12101998_WPPAHD_DOC_NO.,&P12101998_WPPAHD_USER_ID.,&P12101998_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5725180571452779137)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725179893512779130)
,p_name=>'P12101998_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5725179803622779129)
,p_item_default=>'N'
,p_prompt=>'Add Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Add;N,Copy;C'
,p_colspan=>8
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725179960885779131)
,p_name=>'P12101998_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5725179803622779129)
,p_prompt=>'From User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT auba_user_id',
'  FROM appl_user_plant_access,',
'       appl_users',
' WHERE auba_bu      = appluser_bu',
'   AND appluser_id = auba_user_id',
'   AND appluser_bu = :GLOBAL_bu',
'   AND appluser_user_type not in (''O'') --,''P'')',
'   AND appluser_id <> :P12101998_WPPAHD_USER_ID ;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P12101998_WPPAHD_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720548507249723835)
,p_name=>'P12101998_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725181574112779147)
,p_name=>'P12101998_WF_COUNT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720692193541917845)
,p_name=>'P12101998_WPPAHD_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720692614269917851)
,p_name=>'P12101998_WPPAHD_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720685450005917717)
,p_name=>'P12101998_WPPAHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WPPAHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720687008560917835)
,p_name=>'P12101998_WPPAHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720687363576917837)
,p_name=>'P12101998_WPPAHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WPPAHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720690956848917843)
,p_name=>'P12101998_WPPAHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720691777168917845)
,p_name=>'P12101998_WPPAHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720691340630917843)
,p_name=>'P12101998_WPPAHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720686259599917781)
,p_name=>'P12101998_WPPAHD_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'DD.MM.RRRR'
,p_source=>'WPPAHD_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>'P12101998_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720685915867917768)
,p_name=>'P12101998_WPPAHD_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_prompt=>'Doc. No.'
,p_source=>'WPPAHD_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_BU',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720693000699917851)
,p_name=>'P12101998_WPPAHD_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_prompt=>'Copy From  User'
,p_source=>'WPPAHD_FROM_USER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_BU',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720686577507917834)
,p_name=>'P12101998_WPPAHD_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_prompt=>'Reference'
,p_source=>'WPPAHD_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>250
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_BU',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720689391437917840)
,p_name=>'P12101998_WPPAHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WPPAHD_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P,Cancelled;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720689009098917840)
,p_name=>'P12101998_WPPAHD_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'WPPAHD_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Unit Access;A,Remove Unit Access;R,Extend Duration;E'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_BU',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720687771979917837)
,p_name=>'P12101998_WPPAHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720688185319917838)
,p_name=>'P12101998_WPPAHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WPPAHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720690615337917843)
,p_name=>'P12101998_WPPAHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720689741538917840)
,p_name=>'P12101998_WPPAHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720690156849917842)
,p_name=>'P12101998_WPPAHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_source=>'WPPAHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5720688629059917838)
,p_name=>'P12101998_WPPAHD_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_item_source_plug_id=>wwv_flow_imp.id(5720685167564917709)
,p_prompt=>'User ID'
,p_source=>'WPPAHD_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d,',
'       appluser_id r',
'  FROM appl_users',
' WHERE appluser_bu = :GLOBAL_BU',
'   AND appluser_user_type = ''P'''))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>15
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_POSUSER_PLNT_ACCESS_LN',
' WHERE WPPALN_BU     = :GLOBAL_BU',
'   AND WPPALN_DOC_NO = :P12101998_WPPAHD_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User ',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5725180761634779139)
,p_validation_name=>'From User'
,p_static_id=>'from-user'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_FROM_USER_ID1 IS NULL AND :P12101998_ADD_TYPE = ''C'' THEN',
'   RETURN (''User must be entered.'');',
'END IF;',
'',
'IF :P12101998_FROM_USER_ID1 IS NOT NULL THEN',
'',
'    DECLARE',
'      CURSOR c1',
'          IS',
'      SELECT *',
'        FROM appl_users',
'       WHERE appluser_bu     = :Global_bu',
'         AND appluser_status = ''A''',
'         AND appluser_user_type <> ''O''',
'         AND appluser_id     = :P12101998_FROM_USER_ID1;',
'',
'        cr1            c1%ROWTYPE;',
'    BEGIN',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'        IF c1%NOTFOUND THEN',
'           RETURN (''User not found.'');',
'        END IF;',
'      CLOSE c1;',
'    END;',
'',
'    IF :P12101998_FROM_USER_ID1 = :P12101998_WPPAHD_USER_ID AND :P12101998_ADD_TYPE = ''C'' THEN',
'        RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5725180571452779137)
,p_associated_item=>wwv_flow_imp.id(5725179960885779131)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5720550148753723852)
,p_validation_name=>'REFERENCE'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_WPPAHD_REFERENCE IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(5720686577507917834)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5720550122112723851)
,p_validation_name=>'User ID'
,p_static_id=>'user-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_WPPAHD_USER_ID IS NULL THEN',
'   RETURN (''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(5720688629059917838)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5725180329800779134)
,p_name=>'Add Type'
,p_static_id=>'add-type'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12101998_ADD_TYPE'
,p_condition_element=>'P12101998_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5725180471397779136)
,p_event_id=>wwv_flow_imp.id(5725180329800779134)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12101998_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5725180396570779135)
,p_event_id=>wwv_flow_imp.id(5725180329800779134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12101998_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5725180928072779140)
,p_name=>'Add Type Clear'
,p_static_id=>'add-type-clear'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12101998_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5725180956988779141)
,p_event_id=>wwv_flow_imp.id(5725180928072779140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12101998_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5720548582536723836)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12101998_WPPAHD_FROM_USER_ID'
,p_condition_element=>'P12101998_WPPAHD_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5720548783447723838)
,p_event_id=>wwv_flow_imp.id(5720548582536723836)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12101998_WPPAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5720548645668723837)
,p_event_id=>wwv_flow_imp.id(5720548582536723836)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12101998_WPPAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5725180046117779132)
,p_name=>'Open Region'
,p_static_id=>'open-region'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5720552778431723878)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5725180159393779133)
,p_event_id=>wwv_flow_imp.id(5725180046117779132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5725179803622779129)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5725181218531779143)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE wapl_posuser_plnt_access_hd',
'   SET wppahd_status      = ''L'',',
'       wppahd_upd_by      = :GLOBAL_USER,',
'       wppahd_upd_ip_addr = :GLOBAL_IP,',
'       wppahd_upd_emp_id  = :GLOBAL_EMP_ID,',
'       wppahd_upd_date    = SYSDATE',
' WHERE wppahd_bu          = :GLOBAL_BU',
'   AND wppahd_doc_no      = :P12101998_WPPAHD_DOC_NO;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5720549498808723845)
,p_internal_uid=>243219382988168115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729958652460086739)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_LINE_POS'
,p_static_id=>'delete-line-pos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF APEX_APPLICATION.G_X01 IS NOT NULL THEN',
'    DELETE',
'      FROM wapl_posuser_plnt_access_ln',
'     WHERE ROWID = APEX_APPLICATION.G_X01;',
'',
'      COMMIT;',
'        HTP.P(''success'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247996816916475711
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5720701164399917896)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(5720685167564917709)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form POS User'
,p_static_id=>'initialize-form-pos-user'
,p_internal_uid=>238739328856306868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5725181721590779148)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_ADD_TYPE = ''N'' THEN',
'',
'    DECLARE',
'        CURSOR c1',
'            IS',
'        SELECT *',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu  = :GLOBAL_bu',
'           AND bupld_actv_loc_flag = ''Y''',
'           AND bupld_plnt||''-''||bupld_loc_id NOT IN (SELECT auba_plant||''-''||auba_plnt_loc_id',
'                                                       FROM appl_user_plant_access',
'                                                      WHERE auba_bu      = :GLOBAL_bu',
'                                                        AND auba_user_id = :P12101998_WPPAHD_USER_ID',
'                                                      UNION ALL',
'                                                     SELECT wppaln_plnt_id||''-''||wppaln_plnt_loc_id',
'                                                       FROM wapl_posuser_plnt_access_ln',
'                                                      WHERE wppaln_bu     = :GLOBAL_bu',
'                                                        AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO);',
'    v_seq_no            VARCHAR2(5);',
'    v_cnt               NUMBER(5);',
'',
'    BEGIN',
'',
'    DELETE',
'      FROM wa_bu_posplnt_access_temp',
'     WHERE wbpat_bu      = :GLOBAL_bu',
'       AND wbpat_doc_no  = :P12101998_WPPAHD_DOC_NO;',
'',
'    IF (:P12101998_WPPAHD_USER_ID <> :P12101998_FROM_USER_ID1) OR ',
'       (:P12101998_WPPAHD_USER_ID IS NULL AND :P12101998_FROM_USER_ID1 IS NOT NULL) OR',
'       (:P12101998_WPPAHD_USER_ID IS NOT NULL AND :P12101998_FROM_USER_ID1 IS NULL) THEN',
'',
'        DELETE',
'          FROM wapl_user_plnt_access_ln',
'          WHERE wupal_bu      = :GLOBAL_bu',
'            AND wupal_doc_no  = :P12101998_WPPAHD_DOC_NO;',
'    END IF;',
'',
'    COMMIT;',
'',
'    FOR cr1 IN c1',
'    LOOP',
'       SELECT NVL (MAX (TO_NUMBER (wbpat_seq_no)), 0) + 1',
'         INTO v_seq_no',
'         FROM wa_bu_posplnt_access_temp',
'        WHERE wbpat_bu     = :GLOBAL_bu',
'          AND wbpat_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        INSERT INTO wa_bu_posplnt_access_temp(',
'                    wbpat_bu,',
'                    wbpat_doc_no,',
'                    wbpat_seq_no,',
'                    wbpat_plnt_id,',
'                    wbpat_plnt_loc_id,',
'                    wbpat_date_from,',
'                    wbpat_date_to,',
'                    wbpat_cre_by,',
'                    wbpat_cre_date,',
'                    wbpat_sel_flag,',
'                    wbpat_sel_user,',
'                    wbpat_user_id ',
'                    )',
'             VALUES(',
'                    :GLOBAL_bu,',
'                    :P12101998_WPPAHD_DOC_NO,',
'                    v_seq_no,',
'                    cr1.bupld_plnt,',
'                    cr1.bupld_loc_id,',
'                    TRUNC(SYSDATE),',
'                    TO_DATE (''31-DEC-2099''),',
'                    :GLOBAL_user,',
'                    SYSDATE,',
'                    ''N'',',
'                    :GLOBAL_user,',
'                    :P12101998_WPPAHD_USER_ID',
'                    );',
'    END LOOP;',
'        COMMIT;',
'',
'    END;',
'END IF;',
'',
'IF :P12101998_ADD_TYPE = ''C'' AND :P12101998_FROM_USER_ID1 IS NOT NULL THEN',
'',
'    DECLARE',
'        CURSOR c1',
'            IS',
'        SELECT auba_plant,',
'               auba_deflt_flag, ',
'               auba_plnt_loc_id',
'          FROM appl_user_plant_access',
'         WHERE auba_bu      = :GLOBAL_bu',
'           AND auba_user_id = :P12101998_FROM_USER_ID1',
'           AND auba_plant||''-''||auba_plnt_loc_id NOT IN (SELECT auba_plant||''-''||auba_plnt_loc_id',
'                                                           FROM appl_user_plant_access',
'                                                          WHERE auba_bu      = :GLOBAL_bu',
'                                                            AND auba_user_id = :P12101998_WPPAHD_USER_ID',
'                                                          UNION ALL',
'                                                         SELECT wppaln_plnt_id||''-''||wppaln_plnt_loc_id',
'                                                           FROM wapl_posuser_plnt_access_ln',
'                                                          WHERE wppaln_bu     = :GLOBAL_bu',
'                                                            AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO);',
'',
'    v_seq_no            VARCHAR2(5);',
'    v_cnt               NUMBER(5);',
'',
'    BEGIN',
'',
'        DELETE',
'          FROM wa_bu_posplnt_access_temp',
'         WHERE wbpat_bu     = :GLOBAL_bu',
'           AND wbpat_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        IF (:P12101998_WPPAHD_USER_ID <> :P12101998_FROM_USER_ID1) OR ',
'           (:P12101998_WPPAHD_USER_ID IS NULL AND :P12101998_FROM_USER_ID1 IS NOT NULL) OR',
'           (:P12101998_WPPAHD_USER_ID IS NOT NULL AND :P12101998_FROM_USER_ID1 IS NULL) THEN ',
'',
'        DELETE',
'          FROM wapl_posuser_plnt_access_ln',
'         WHERE wppaln_bu     = :GLOBAL_bu',
'           AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        END IF;',
'',
'        COMMIT;',
'',
'        FOR cr1 IN c1',
'        LOOP',
'            SELECT NVL (MAX (TO_NUMBER (wbpat_seq_no)), 0) + 1',
'              INTO v_seq_no',
'              FROM wa_bu_plnt_access_temp',
'             WHERE wbpat_bu     = :GLOBAL_bu',
'               AND wbpat_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        INSERT INTO wa_bu_posplnt_access_temp(',
'                    wbpat_bu,',
'                    wbpat_doc_no,',
'                    wbpat_seq_no,',
'                    wbpat_plnt_id,',
'                    wbpat_plnt_loc_id,',
'                    wbpat_date_from,',
'                    wbpat_date_to,',
'                    wbpat_cre_by,',
'                    wbpat_cre_date,',
'                    wbpat_sel_flag,',
'                    wbpat_sel_user,',
'                    wbpat_user_id',
'                    )',
'             VALUES(',
'                    :GLOBAL_bu,',
'                    :P12101998_WPPAHD_DOC_NO,',
'                    v_seq_no,',
'                    cr1.auba_plant,',
'                    cr1.auba_plnt_loc_id,',
'                    TRUNC(SYSDATE),',
'                    TO_DATE (''31-DEC-2099''),',
'                    :GLOBAL_user,',
'                    SYSDATE,',
'                    ''N'',',
'                    :GLOBAL_user,',
'                    :P12101998_WPPAHD_USER_ID);',
'        END LOOP;',
'        COMMIT;',
'',
'    END;',
'END IF;',
'',
'--:P83_WUPAH_FROM_USER_ID := :P83_WUPAH_FROM_USER_ID1;',
'',
'UPDATE wapl_posuser_plnt_access_hd',
'   SET wppahd_from_user_id = :P12101998_FROM_USER_ID1,',
'       wppahd_upd_by       = :Global_user,',
'       wppahd_upd_date     = SYSDATE  ',
' WHERE wppahd_bu           = :GLOBAL_BU',
'   AND wppahd_doc_no       = :P12101998_WPPAHD_DOC_NO;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5725180571452779137)
,p_internal_uid=>243219886047168120
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5725181379063779145)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing'
,p_static_id=>'load-existing'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_WPPAHD_TYPE = ''R'' THEN',
'',
'    DECLARE',
'      CURSOR c1',
'          IS',
'      SELECT auba_plant,',
'             auba_deflt_flag, ',
'             auba_plnt_loc_id',
'        FROM appl_user_plant_access',
'       WHERE auba_bu      = :GLOBAL_bu',
'         AND auba_user_id = :P83_WUPAH_USER_ID',
'       ORDER BY auba_plant;',
'',
'    cr1                 c1%ROWTYPE;',
'    v_seq_no            VARCHAR2(5);',
'    v_res               VARCHAR2(1) := ''N'';',
'',
'    BEGIN',
'      DELETE',
'        FROM wapl_posuser_plnt_access_ln',
'       WHERE wppaln_bu     = :GLOBAL_bu',
'         AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        COMMIT;',
'',
'      FOR cr1 IN c1',
'      LOOP',
'           SELECT NVL (MAX (TO_NUMBER (wppaln_seq_no)), 0) + 1',
'             INTO v_seq_no',
'             FROM wapl_posuser_plnt_access_ln',
'            WHERE wppaln_bu     = :GLOBAL_bu',
'              AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'           INSERT INTO wapl_posuser_plnt_access_ln(',
'                       wppaln_bu,',
'                       wppaln_doc_no,',
'                       wppaln_seq_no,',
'                       wppaln_plnt_id,',
'                       wppaln_plnt_loc_id,',
'                       wppaln_date_from,',
'                       wppaln_date_to,',
'                       wppaln_type,',
'                       wppaln_user_id,',
'                       wppaln_sel_flag,',
'                       wppaln_sel_user,',
'                       wppaln_cre_by,',
'                       wppaln_cre_date )',
'                VALUES (',
'                       :GLOBAL_bu,',
'                       :P12101998_WPPAHD_DOC_NO,',
'                       v_seq_no,',
'                       cr1.auba_plant,',
'                       cr1.auba_plnt_loc_id,',
'                       trunc(SYSDATE),',
'                       TO_DATE (''31-12-2099'',:GLOBAL_DATE_FORMAT),',
'                       ''R'',',
'                       :P12101998_WPPAHD_USER_ID,',
'                       ''N'',',
'                       :GLOBAL_USER,',
'                       :GLOBAL_USER,',
'                       SYSDATE',
'                       );',
'',
'            v_res := ''Y'';',
'      END LOOP;',
'',
'    COMMIT;',
'',
'    IF v_res = ''Y'' THEN',
'         APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'    ELSE',
'         APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'    END IF;',
'',
'    END;',
'',
'END IF;',
'',
'IF :P12101998_WPPAHD_TYPE = ''E'' THEN',
'',
'     DECLARE',
'        CURSOR c1',
'            IS',
'        SELECT auba_plant,',
'               auba_deflt_flag, ',
'               auba_plnt_loc_id',
'          FROM appl_user_plant_access',
'         WHERE auba_bu      = :GLOBAL_bu',
'           AND auba_user_id = :P12101998_WPPAHD_USER_ID',
'         ORDER BY auba_plant;',
'',
'    cr1                 c1%ROWTYPE;',
'    v_seq_no            VARCHAR2(5);',
'    v_res               VARCHAR2(1) := ''N'';',
'',
'    BEGIN',
'        DELETE',
'          FROM wapl_posuser_plnt_access_ln',
'         WHERE wppaln_bu     = :GLOBAL_bu',
'           AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'    COMMIT;',
'',
'      FOR cr1 IN c1',
'      LOOP',
'        SELECT NVL (MAX (TO_NUMBER (wppaln_seq_no)), 0) + 1',
'          INTO v_seq_no',
'          FROM wapl_posuser_plnt_access_ln',
'         WHERE wppaln_bu     = :GLOBAL_bu',
'           AND wppaln_doc_no = :P12101998_WPPAHD_DOC_NO;',
'',
'        INSERT INTO wapl_posuser_plnt_access_ln(',
'                    wppaln_bu,',
'                    wppaln_doc_no,',
'                    wppaln_seq_no,',
'                    wppaln_plnt_id,',
'                    wppaln_plnt_loc_id,',
'                    wppaln_date_from,',
'                    wppaln_date_to,',
'                    wppaln_type,',
'                    wppaln_user_id,',
'                    wppaln_sel_flag,',
'                    wppaln_sel_user,',
'                    wppaln_cre_by,',
'                    wppaln_cre_date',
'                    )',
'             VALUES (',
'                    :GLOBAL_bu,',
'                    :P12101998_WPPAHD_DOC_NO,',
'                    v_seq_no,',
'                    cr1.auba_plant,',
'                    cr1.auba_plnt_loc_id,',
'                    trunc(SYSDATE),',
'                    TO_DATE (''31-12-2099'',:GLOBAL_DATE_FORMAT),',
'                    ''E'',',
'                    :P12101998_WPPAHD_USER_ID,',
'                    ''N'',',
'                    :GLOBAL_USER,',
'                    :GLOBAL_USER,',
'                    SYSDATE',
'                    );',
'            v_res := ''Y'';',
'      END LOOP;',
'    COMMIT;',
'    IF v_res = ''Y'' THEN',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'    ELSE',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'    END IF;',
'',
'    END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5720552698792723877)
,p_internal_uid=>243219543520168117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5720552440805723875)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5720550289099723853)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'POS Line - Save Interactive Grid Data'
,p_static_id=>'pos-line-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>238590605262112847
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5725181116914779142)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5720550289099723853)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POS Line - Save Interactive Grid Data Update'
,p_static_id=>'pos-line-save-interactive-grid-data-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'',
'   update wapl_posuser_plnt_access_ln',
'      set wppaln_date_from  = TO_DATE(:wppaln_date_from,''DD-MM-RRRR''),',
'          wppaln_date_to    = TO_DATE(:wppaln_date_to,:GLOBAL_DATE_FORMAT),',
'          wppaln_sel_flag   = :wppaln_sel_flag, ---:APEX$ROW_SELECTOR,',
'          wppaln_type       = :wppaln_type,',
'          wppaln_sel_user   = CASE WHEN :wppaln_sel_flag =''Y'' THEN :GLOBAL_USER ELSE NULL END,',
'          wppaln_upd_by     = :GLOBAL_USER,',
'          wppaln_upd_date   = SYSDATE',
'    where wppaln_bu         = :GLOBAL_bu',
'      and wppaln_doc_no     = :P12101998_WPPAHD_DOC_NO',
'      and wppaln_seq_no     = :wppaln_seq_no;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5720552578659723876)
,p_internal_uid=>243219281371168114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5720549749859723848)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P12101998_ROWID IS NULL THEN',
'   SELECT (NVL(max(TO_NUMBER(WPPAHD_DOC_NO)),1000000000)) + 1 ',
'     INTO :P12101998_WPPAHD_DOC_NO',
'     FROM wapl_posuser_plnt_access_hd',
'    WHERE wppahd_bu = :global_bu;',
'',
'   :P12101998_WPPAHD_DOC_DATE   := TRUNC(SYSDATE);',
'',
'   :P12101998_WPPAHD_CRE_BY        := :GLOBAL_USER;',
'   :P12101998_WPPAHD_CRE_IP_ADDR   := :GLOBAL_IP;',
'   :P12101998_WPPAHD_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P12101998_WPPAHD_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'',
'ELSE',
'   :P12101998_WPPAHD_UPD_BY        := :GLOBAL_USER;',
'   :P12101998_WPPAHD_UPD_IP_ADDR   := :GLOBAL_IP;',
'   :P12101998_WPPAHD_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P12101998_WPPAHD_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>238587914316112820
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5725181489976779146)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Insert User Plant Access (Post)'
,p_static_id=>'process-for-insert-user-plant-access-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res           VARCHAR2(1);',
'    v_appr_msg           VARCHAR2(1000);',
'    v_cnt                NUMBER(5);',
'BEGIN',
'',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM wapl_posuser_plnt_access_ln',
'     WHERE wppaln_bu       =:GLOBAL_bu',
'       AND wppaln_doc_no   =:P12101998_WPPAHD_DOC_NO',
'       AND wppaln_sel_flag = ''Y'';',
'',
'    IF v_cnt = 0 AND :P12101998_WPPAHD_TYPE <> ''E'' THEN',
'       RAISE_APPLICATION_ERROR(-20010,''Select the Unit.'');',
'    ELSE',
'',
'    UPDATE wapl_posuser_plnt_access_hd',
'       SET wppahd_status      = ''P'',',
'           wppahd_upd_by      = :GLOBAL_USER,',
'           wppahd_upd_ip_addr = :GLOBAL_IP,',
'           wppahd_upd_emp_id  = :GLOBAL_EMP_ID,',
'           wppahd_upd_date    = SYSDATE',
'     WHERE wppahd_bu          = :GLOBAL_BU',
'       AND wppahd_doc_no      = :P12101998_WPPAHD_DOC_NO;',
'    COMMIT;',
'    APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>'';',
'/*',
'    proc_self_wf_appr(:GLOBAL_bu,',
'                      ''WF_UNIT_ACCS'',',
'                      :GLOBAL_user,',
'                      1,',
'                      v_appr_res,',
'                      v_appr_msg,',
'                      p_plnt => NULL,',
'                      p_doc_date => NULL,',
'                      p_doc_pfx => NULL,',
'                      p_doc_no => :P12101998_WPPAHD_DOC_NO',
'                      );',
'',
'    IF v_appr_res = ''Y'' THEN',
'       :P12101998_WF_COUNT := ''WFM1091'';',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>'';',
'    ELSE',
'       :P12101998_WF_COUNT := ''WFM1090'';',
'    END IF;',
'*/',
'    COMMIT;',
'',
'  END IF;',
'',
'END;',
'',
'',
'',
' ',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5720549354906723844)
,p_internal_uid=>243219654433168118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5720701605734917906)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5720685167564917709)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form POS User'
,p_static_id=>'process-form-pos-user'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>238739770191306878
);
wwv_flow_imp.component_end;
end;
/
