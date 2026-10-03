prompt --application/pages/page_00197
begin
--   Manifest
--     PAGE: 00197
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
 p_id=>197
,p_name=>'Mobile App Access'
,p_alias=>'MOBILE-APP-ACCESS1'
,p_step_title=>'Mobile App Access'
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
'                        apex.region("ig_line").refresh();',
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
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6991675022705103015)
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
 p_id=>wwv_flow_imp.id(6993168066495691607)
,p_plug_name=>'Lines'
,p_static_id=>'lines'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROW_NUMBER() OVER (ORDER BY MAALN_SEQ_NO) AS "Line",',
'       ROWID,',
'       MAALN_BU,',
'       MAALN_DOC_NO,',
'       MAALN_SEQ_NO,',
'       MAALN_MOBILE,',
'       MAALN_EFF_FROM,',
'       MAALN_EFF_TO,',
'       MAALN_CRE_BY,',
'       MAALN_CRE_IP_ADDR,',
'       MAALN_CRE_OS_USER,',
'       MAALN_CRE_DATE,',
'       MAALN_UPD_BY,',
'       MAALN_UPD_IP_ADDR,',
'       MAALN_UPD_OS_USER,',
'       MAALN_UPD_DATE,',
'       MAALN_CRE_EMP_ID,',
'       MAALN_UPD_EMP_ID',
'  from MOBILE_APP_ACCESS_LN',
' where MAALN_BU = :GLOBAL_BU',
'   and MAALN_DOC_NO = :P197_MAAHD_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P197_MAAHD_DOC_NO,P197_MAAHD_USER_ID'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P197_MAAHD_STATUS'
,p_plug_read_only_when2=>'N'
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
 p_id=>wwv_flow_imp.id(6993169889536691626)
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
 p_id=>wwv_flow_imp.id(6993170020783691627)
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
 p_id=>wwv_flow_imp.id(7047530102213671106)
,p_name=>'DELETE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_link_target=>'javascript:delete_line(''DELETE'',''&ROWID.'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P197_MAAHD_STATUS'
,p_display_condition2=>'N'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7047529971220671104)
,p_name=>'Line'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Line'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(6993168236146691609)
,p_name=>'MAALN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6993168804064691615)
,p_name=>'MAALN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_CRE_BY'
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
 p_id=>wwv_flow_imp.id(6993169152875691618)
,p_name=>'MAALN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(6993169599620691623)
,p_name=>'MAALN_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6993168896372691616)
,p_name=>'MAALN_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6993169050972691617)
,p_name=>'MAALN_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6993168313053691610)
,p_name=>'MAALN_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6993168630242691613)
,p_name=>'MAALN_EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eff. From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'TO_CHAR(SYSDATE,''DD-MON-RRRR'')'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6993168740455691614)
,p_name=>'MAALN_EFF_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_EFF_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eff. To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'31-DEC-2099'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6993168531576691612)
,p_name=>'MAALN_MOBILE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_MOBILE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Mobile App'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the App',
  'width', '800')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT mac_mobile_desc1,',
'       mac_mobile_id',
'  FROM mobile_app_config',
' WHERE mac_bu = :GLOBAL_BU',
'   AND mac_active_flag = ''Y''',
' ORDER BY mac_seq_no'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
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
 p_id=>wwv_flow_imp.id(6993168450605691611)
,p_name=>'MAALN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6993169258918691619)
,p_name=>'MAALN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_UPD_BY'
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
 p_id=>wwv_flow_imp.id(6993169486658691622)
,p_name=>'MAALN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(6993169716824691624)
,p_name=>'MAALN_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6993169321903691620)
,p_name=>'MAALN_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6993169423875691621)
,p_name=>'MAALN_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAALN_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6993169804162691625)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6993168138102691608)
,p_internal_uid=>1513647154317771406
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
 p_id=>wwv_flow_imp.id(6993222813724757636)
,p_interactive_grid_id=>wwv_flow_imp.id(6993168138102691608)
,p_static_id=>'15137019'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6993223078915757636)
,p_report_id=>wwv_flow_imp.id(6993222813724757636)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5479521059531920206)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6993170020783691627)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993223513862757641)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6993168236146691609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993224456194757644)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6993168313053691610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993225343790757645)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6993168450605691611)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>74
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993226235859757647)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6993168531576691612)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>570
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993227129006757648)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6993168630242691613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993228046264757650)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6993168740455691614)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993228961759757653)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6993168804064691615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993229879082757655)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6993168896372691616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993230684252757656)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6993169050972691617)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993231591038757658)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6993169152875691618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993232562512757659)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6993169258918691619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993233436765757661)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6993169321903691620)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993234364699757662)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6993169423875691621)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993235281066757664)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6993169486658691622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993236098418757666)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6993169599620691623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993237041848757667)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6993169716824691624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993237947638757669)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6993169804162691625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6993246360746772091)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6993169889536691626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7047540648565679945)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7047529971220671104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7049960775768314280)
,p_view_id=>wwv_flow_imp.id(6993223078915757636)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7047530102213671106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6991989127443240002)
,p_plug_name=>'Mobile App Access'
,p_static_id=>'mobile-app-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MOBILE_APP_ACCESS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P197_MAAHD_STATUS'
,p_plug_read_only_when2=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6993167972276691606)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'Add_Document'
,p_static_id=>'add-document'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Document'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6993170345023691630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6993168066495691607)
,p_button_name=>'Add_ln'
,p_static_id=>'add-ln'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P197_ROWID IS NOT NULL AND :P197_MAAHD_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''ig_line'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6991675171129103016)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6999363757707426305)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to Cancel the document ? ",''CANCEL'' );'
,p_button_condition=>':P197_ROWID IS NOT NULL AND :P197_MAAHD_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6992002770964240022)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P197_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6999363843334426306)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to Post the document ? ",''POST'' );'
,p_button_condition=>':P197_ROWID IS NOT NULL AND :P197_MAAHD_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6992002356377240020)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6991675022705103015)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P197_ROWID IS NOT NULL AND :P197_MAAHD_STATUS IN (''N'')'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6993170209890691629)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6993168066495691607)
,p_button_name=>'Save_ln'
,p_static_id=>'save-ln'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P197_ROWID IS NOT NULL AND :P197_MAAHD_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''ig_line'')"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6999363974508426307)
,p_name=>'P197_LINE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6993168066495691607)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)',
'  FROM mobile_app_access_ln',
' WHERE maaln_bu = :GLOBAL_BU',
'   AND maaln_doc_no = :P197_MAAHD_DOC_NO'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991989520409240005)
,p_name=>'P197_MAAHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'MAAHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991991959186240012)
,p_name=>'P197_MAAHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991993065304240014)
,p_name=>'P197_MAAHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'MAAHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991995063895240016)
,p_name=>'P197_MAAHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991992311441240012)
,p_name=>'P197_MAAHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991992717300240012)
,p_name=>'P197_MAAHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991990364371240009)
,p_name=>'P197_MAAHD_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'MAAHD_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991989903278240008)
,p_name=>'P197_MAAHD_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991991175331240012)
,p_name=>'P197_MAAHD_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_prompt=>'Reference'
,p_source=>'MAAHD_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6991991554747240012)
,p_name=>'P197_MAAHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'MAAHD_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P,Cancelled;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991995800365240016)
,p_name=>'P197_MAAHD_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'MAAHD_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991993443536240014)
,p_name=>'P197_MAAHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991994588790240014)
,p_name=>'P197_MAAHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'MAAHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991995432086240016)
,p_name=>'P197_MAAHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991993857601240014)
,p_name=>'P197_MAAHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991994241854240014)
,p_name=>'P197_MAAHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'MAAHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991990695908240011)
,p_name=>'P197_MAAHD_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_prompt=>'User ID'
,p_source=>'MAAHD_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_MOBILE_USER_ADD'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>15
,p_colspan=>3
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
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6991674790589103013)
,p_name=>'P197_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_item_source_plug_id=>wwv_flow_imp.id(6991989127443240002)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6999607973668853304)
,p_tabular_form_region_id=>wwv_flow_imp.id(6993168066495691607)
,p_validation_name=>'MOBILE'
,p_static_id=>'mobile'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :MAALN_MOBILE IS NULL THEN',
'   RETURN (''Mobile App must be entered.'');',
'END IF;',
'',
'IF :MAALN_MOBILE IS NOT NULL THEN',
'        DECLARE',
'',
'            CURSOR c1',
'                IS',
'            SELECT maaln_mobile,',
'                   b.rowid AS row_id -- NVL(COUNT(*),0) AS v_cnt',
'              FROM mobile_app_access_hd a,',
'                   mobile_app_access_ln b',
'             WHERE a.maahd_bu      = :GLOBAL_bu',
'               AND a.maahd_bu      = b.maaln_bu',
'               AND a.maahd_doc_no  = b.maaln_doc_no',
'               AND a.maahd_user_id = :P197_MAAHD_USER_ID',
'               AND b.maaln_mobile  = :MAALN_MOBILE',
'               AND a.maahd_status  IN (''P'',''N'')',
'               AND a.maahd_type    = ''A'';',
'',
'            CURSOR c2',
'		        IS',
'            SELECT * ',
'              FROM appl_users',
'             WHERE appluser_bu = :GLOBAL_BU',
'               AND appluser_id = :P197_MAAHD_USER_ID',
'               AND appluser_user_type IN (''U'',''D'')',
'               AND appluser_status = ''A'' ;',
'',
'            CURSOR c3',
'                IS',
'            SELECT NVL(COUNT(*),0) AS v_cnt1',
'              FROM mobile_app_access_hd a,',
'                   mobile_app_access_ln b',
'             WHERE a.maahd_bu      = :GLOBAL_bu',
'               AND a.maahd_bu      = b.maaln_bu',
'               AND a.maahd_doc_no  = b.maaln_doc_no',
'               AND a.maahd_user_id = :P197_MAAHD_USER_ID',
'               AND a.maahd_status  IN (''P'',''N'')',
'               AND a.maahd_type    = ''A'';',
'',
'            cr1        		    c1%ROWTYPE;',
'	        cr2        		    c2%ROWTYPE;',
'            cr3        		    c3%ROWTYPE;',
'',
'        BEGIN',
'            ',
'            OPEN c1;',
'	        FETCH c1 INTO cr1;',
'                IF c1%FOUND THEN',
'		        -- IF cr1.v_cnt > 0 THEN',
'                IF cr1.maaln_mobile = :maaln_mobile AND cr1.row_id != :ROWID THEN',
'                   RETURN (''Cannot insert duplicate entry'');',
'                END IF;',
'                -- RETURN (cr1.maaln_mobile||''~''||cr1.row_id ||''~''||:ROWID);',
'                END IF;',
'            CLOSE c1;',
'',
'            OPEN c2;',
'	        FETCH c2 INTO cr2;',
'                IF c2%FOUND THEN',
'                   IF cr2.appluser_user_type = ''U'' AND :MAALN_MOBILE = ''EA'' THEN',
'                      RETURN (''Access Not Required User is already registered in ESS.'');',
'                   END IF;',
'                   ',
'                   OPEN c3;',
'	               FETCH c3 INTO cr3;',
'                        IF c3%FOUND THEN',
'                            IF cr3.v_cnt1 > 0 AND cr2.appluser_user_type = ''D'' THEN',
'                                RETURN (''User already mapped to a module Specific. Additional app access not allowed.'');',
'                            END IF;',
'                        END IF;',
'                   CLOSE c3;',
'                END IF;',
'            CLOSE c2;',
'',
'        END;',
'    END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'SAVE,CREATE'
,p_validation_condition_type=>'REQUEST_NOT_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'MAALN_MOBILE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6993167868158691605)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P197_MAAHD_REF IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6991991175331240012)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6993167702592691604)
,p_validation_name=>'USER'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P197_MAAHD_USER_ID IS NULL THEN',
'   RETURN (''User ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6991990695908240011)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6999363518248426303)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6993168066495691607)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6999363612660426304)
,p_event_id=>wwv_flow_imp.id(6999363518248426303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6993168066495691607)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6999364025060426308)
,p_event_id=>wwv_flow_imp.id(6999363518248426303)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P197_LINE_COUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6999364251717426310)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P197_MAAHD_STATUS IN (''N'') THEN',
'',
'    UPDATE mobile_app_access_hd',
'       SET maahd_status     = ''C'',',
'           maahd_upd_by     = :GLOBAL_USER,',
'           maahd_upd_date   = SYSDATE,',
'           maahd_upd_emp_id = :GLOBAL_EMP_ID',
'     WHERE maahd_bu         = :GLOBAL_BU',
'       AND maahd_doc_no     = :P197_MAAHD_DOC_NO;',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Cancelled.</span>'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1519843267932506108
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7047530008607671105)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE'
,p_static_id=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF APEX_APPLICATION.G_X01 IS NOT NULL THEN',
'',
'	DELETE mobile_app_access_ln ',
'     WHERE ROWID = APEX_APPLICATION.G_X01;',
'',
'   COMMIT;',
'   HTP.P(''success'');',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1568009024822750903
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6992003180145240022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6991989127443240002)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Mobile App Access'
,p_static_id=>'initialize-form-mobile-app-access'
,p_internal_uid=>1512482196360319820
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6993170098000691628)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6993168066495691607)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Lines - Save Interactive Grid Data'
,p_static_id=>'lines-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'/*',
'    IF :MAALN_MOBILE IS NOT NULL THEN',
'        DECLARE',
'',
'            CURSOR c1',
'                IS',
'            SELECT NVL(COUNT(*),0) AS v_cnt',
'              FROM mobile_app_access_hd a,',
'                   mobile_app_access_ln b',
'             WHERE a.maahd_bu      = :GLOBAL_bu',
'               AND a.maahd_bu      = b.maaln_bu',
'               AND a.maahd_doc_no  = b.maaln_doc_no',
'               AND a.maahd_user_id = :P197_MAAHD_USER_ID',
'               AND b.maaln_mobile  = :MAALN_MOBILE',
'               AND a.maahd_status  IN (''P'',''N'')',
'               AND a.maahd_type    = ''A'';',
'',
'            CURSOR c2',
'		        IS',
'            SELECT * ',
'              FROM appl_users',
'             WHERE appluser_bu = :GLOBAL_BU',
'               AND appluser_id = :P197_MAAHD_USER_ID',
'               AND appluser_user_type IN (''U'',''D'')',
'               AND appluser_status = ''A'' ;',
'',
'            CURSOR c3',
'                IS',
'            SELECT NVL(COUNT(*),0) AS v_cnt1',
'              FROM mobile_app_access_hd a,',
'                   mobile_app_access_ln b',
'             WHERE a.maahd_bu      = :GLOBAL_bu',
'               AND a.maahd_bu      = b.maaln_bu',
'               AND a.maahd_doc_no  = b.maaln_doc_no',
'               AND a.maahd_user_id = :P197_MAAHD_USER_ID',
'               AND a.maahd_status  IN (''P'',''N'')',
'               AND a.maahd_type    = ''A'';',
'',
'            cr1        		    c1%ROWTYPE;',
'	        cr2        		    c2%ROWTYPE;',
'            cr3        		    c3%ROWTYPE;',
'',
'        BEGIN',
'            ',
'            OPEN c1;',
'	        FETCH c1 INTO cr1;',
'                IF c1%FOUND THEN',
'		        IF cr1.v_cnt > 0 THEN',
'                   RAISE_APPLICATION_ERROR(-20999,''Cannot insert duplicate entry'');',
'                END IF;',
'                END IF;',
'            CLOSE c1;',
'',
'            OPEN c2;',
'	        FETCH c2 INTO cr2;',
'                IF c2%FOUND THEN',
'                   IF cr2.appluser_user_type = ''U'' AND :MAALN_MOBILE = ''EA'' THEN',
'                      RAISE_APPLICATION_ERROR(-20999,''Access Not Required User is already registered in ESS.'');',
'                   END IF;',
'                   ',
'                   OPEN c3;',
'	               FETCH c3 INTO cr3;',
'                        IF c3%FOUND THEN',
'                            IF cr3.v_cnt1 > 0 AND cr2.appluser_user_type = ''D'' THEN',
'                                RAISE_APPLICATION_ERROR(-20999,''User already mapped to a module Specific. Additional app access not allowed.'');',
'                            END IF;',
'                        END IF;',
'                   CLOSE c3;',
'                END IF;',
'            CLOSE c2;',
'',
'        END;',
'    END IF;',
'*/',
'    SELECT NVL(MAX(TO_NUMBER(maaln_seq_no)), 0) + 1',
'      INTO :maaln_seq_no',
'      FROM mobile_app_access_ln',
'     WHERE maaln_bu     = :GLOBAL_BU',
'       AND maaln_doc_no = :P197_MAAHD_DOC_NO; ',
'',
'	INSERT INTO mobile_app_access_ln (',
'				maaln_bu,',
'                maaln_doc_no,',
'                maaln_seq_no,',
'                maaln_mobile,',
'                maaln_eff_from,',
'                maaln_eff_to,',
'                maaln_cre_by,',
'                maaln_cre_ip_addr,',
'                maaln_cre_date,',
'                maaln_cre_emp_id',
'				)',
'		 VALUES(',
'				:GLOBAL_BU,             --  maaln_bu,',
'                :P197_MAAHD_DOC_NO,     --  maaln_doc_no,',
'                :maaln_seq_no,          --  maaln_seq_no,',
'                :maaln_mobile,          --  maaln_mobile,',
'                SYSDATE,                --  maaln_eff_from,',
'                ''31-DEC-2099'',          --  maaln_eff_to,',
'                :GLOBAL_USER,           --  maaln_cre_by,',
'                :GLOBAL_IP,             --  maaln_cre_ip_addr,',
'                SYSDATE,                --  maaln_cre_date,',
'                :GLOBAL_EMP_ID          --  maaln_cre_emp_id',
'				);',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span> Created successfully </span>'';',
'',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'    UPDATE mobile_app_access_ln',
'       SET maaln_mobile      = :maaln_mobile,',
'           maaln_eff_from    = :maaln_eff_from,',
'           maaln_eff_to      = :maaln_eff_to,',
'		   maaln_upd_by      = :GLOBAL_USER,',
'		   maaln_upd_date    = SYSDATE,',
'		   maaln_upd_ip_addr = :GLOBAL_IP,',
'           maaln_cre_emp_id  = :GLOBAL_EMP_ID',
'     WHERE ROWID 		     = :ROWID;',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span>Multiple Factor Updated successfully</span>'';',
'',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1513649114215771426
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6999364098796426309)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P197_MAAHD_STATUS IN (''N'') THEN',
'',
'    UPDATE mobile_app_access_hd',
'       SET maahd_status     = ''P'',',
'           maahd_upd_by     = :GLOBAL_USER,',
'           maahd_upd_date   = SYSDATE,',
'           maahd_upd_emp_id = :GLOBAL_EMP_ID',
'     WHERE maahd_bu         = :GLOBAL_BU',
'       AND maahd_doc_no     = :P197_MAAHD_DOC_NO;',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Document  Posted.</span>'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'POST'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1519843115011506107
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6991675267363103017)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P197_ROWID IS NULL THEN',
'   ',
'    SELECT (NVL(max(TO_NUMBER(maahd_doc_no)),1000000000)) + 1 ',
'      INTO :P197_MAAHD_DOC_NO',
'      FROM mobile_app_access_hd',
'     WHERE maahd_bu = :GLOBAL_BU;',
'   ',
'   :P197_MAAHD_DOC_DATE   := TRUNC(SYSDATE);',
'',
'   :P197_MAAHD_CRE_BY        := :GLOBAL_USER;',
'   :P197_MAAHD_CRE_IP_ADDR   := :GLOBAL_IP;',
'   :P197_MAAHD_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P197_MAAHD_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'',
'ELSE',
'   :P197_MAAHD_UPD_BY        := :GLOBAL_USER;',
'   :P197_MAAHD_UPD_IP_ADDR   := :GLOBAL_IP;',
'   :P197_MAAHD_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P197_MAAHD_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1512154283578182815
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6992003519450240023)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6991989127443240002)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Mobile App Access'
,p_static_id=>'process-form-mobile-app-access'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1512482535665319821
);
wwv_flow_imp.component_end;
end;
/
