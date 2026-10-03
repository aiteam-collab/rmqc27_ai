prompt --application/pages/page_00167
begin
--   Manifest
--     PAGE: 00167
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
 p_id=>167
,p_name=>'ESS Bus. Fun. Access'
,p_alias=>'ESS-BUS-FUN-ACCESS1'
,p_step_title=>'ESS Bus. Fun. Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7032656110292820229)
,p_plug_name=>'Add Bus. Fun.'
,p_static_id=>'add-bus-fun'
,p_region_name=>'type'
,p_region_css_classes=>'no-close'
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
 p_id=>wwv_flow_imp.id(5863764764140849404)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_title=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6333474157101970796)
,p_plug_name=>'Bus fun'
,p_static_id=>'bus-fun'
,p_region_name=>'ig_user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       ebfal_bu,',
'       ebfal_doc_no,',
'       ebfal_seq_no,',
'       ebfal_bus_fun_id,',
'       ebfal_bus_fun_name,',
'       ebfal_date_from,',
'       ebfal_date_to,',
'       ebfal_sel_flag,',
'       ebfal_remov_type,',
'       DECODE(ebfal_bus_fun_type,''REP'',''Report'',''FRM'',''Transaction'',''RPT'',''Analytics'')ebfal_bus_fun_type,',
'       ebfal_user_id,',
'       ebfal_cre_by,',
'       ebfal_cre_date,',
'       ebfal_upd_by,',
'       ebfal_upd_date',
'    --     CASE WHEN ebfal_sel_flag = ''Y'' THEN',
'    --    ''<input type="checkbox" id="checkbox_''||ebfal_seq_no||''" checked="checked" onChange="checkanduncheck(''||ebfal_seq_no||'',''''Y'''')"/>''',
'    --    ELSE',
'    --    ''<input type="checkbox" id="checkbox_''||ebfal_seq_no||''" onChange="checkanduncheck(''||ebfal_seq_no||'',''''N'''')" />''',
'    --    END "Flag"',
'  FROM ess_bu_fun_access_ln',
' WHERE ebfal_bu = :GLOBAL_BU',
'   AND ebfal_doc_no = :P167_EBFAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P167_EBFAH_DOC_NO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P167_EBFAH_STATUS'
,p_plug_read_only_when2=>'N'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bus fun'
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
 p_id=>wwv_flow_imp.id(6333475394423970809)
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
 p_id=>wwv_flow_imp.id(6333475492088970810)
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
 p_id=>wwv_flow_imp.id(5863766765099849424)
,p_name=>'EBFAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_BU'
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
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767040524849427)
,p_name=>'EBFAL_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767119274849428)
,p_name=>'EBFAL_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767665028849433)
,p_name=>'EBFAL_BUS_FUN_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_BUS_FUN_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767820645849435)
,p_name=>'EBFAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_CRE_BY'
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
 p_id=>wwv_flow_imp.id(5863767940968849436)
,p_name=>'EBFAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(5863767258829849429)
,p_name=>'EBFAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MM-RRRR'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767358025849430)
,p_name=>'EBFAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MM-RRRR'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863766838252849425)
,p_name=>'EBFAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_DOC_NO'
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
 p_id=>wwv_flow_imp.id(5863767486466849432)
,p_name=>'EBFAL_REMOV_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_REMOV_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P167_EBFAH_TYPE'
,p_display_condition2=>'R'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863767421295849431)
,p_name=>'EBFAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P167_EBFAH_TYPE'
,p_display_condition2=>'A'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863766943202849426)
,p_name=>'EBFAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
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
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5863768032498849437)
,p_name=>'EBFAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(5863768140982849438)
,p_name=>'EBFAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(5863767762774849434)
,p_name=>'EBFAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EBFAL_USER_ID'
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
 p_id=>wwv_flow_imp.id(5863766640058849423)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6333474207666970797)
,p_internal_uid=>853953223882050595
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
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
 p_id=>wwv_flow_imp.id(6334879857760473654)
,p_interactive_grid_id=>wwv_flow_imp.id(6333474207666970797)
,p_static_id=>'4687475'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6334880017709473654)
,p_report_id=>wwv_flow_imp.id(6334879857760473654)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5866132398281519285)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6333475492088970810)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970763393713353612)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5863766640058849423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970764294507353619)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5863766765099849424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970765269614353622)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5863766838252849425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970766148519353625)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5863766943202849426)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970767033480353627)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5863767040524849427)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>185
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970767930208353630)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5863767119274849428)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>481
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970768786472353633)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5863767258829849429)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970769692710353636)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5863767358025849430)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970770645748353639)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5863767421295849431)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>56.14099999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970771582722353641)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5863767486466849432)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970772396161353644)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5863767665028849433)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970773324604353647)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5863767762774849434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970774203932353650)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5863767820645849435)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970775125580353652)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5863767940968849436)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970776062246353655)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5863768032498849437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5970776962246353658)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5863768140982849438)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6334901366253492427)
,p_view_id=>wwv_flow_imp.id(6334880017709473654)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6333475394423970809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6333416985443969799)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       EBFAH_BU,',
'       EBFAH_DOC_NO,',
'       EBFAH_DOC_DATE,',
'       EBFAH_USER_ID,',
'       EBFAH_EFF_FROM,',
'       EBFAH_EFF_TO,',
'       EBFAH_TYPE,',
'       EBFAH_APPR_BY,',
'       EBFAH_APPR_DATE,',
'       EBFAH_STATUS,',
'       EBFAH_REFERENCE,',
'       EBFAH_CRE_BY,',
'       EBFAH_CRE_DATE,',
'       EBFAH_CRE_EMP_ID,',
'       EBFAH_CRE_IP_ADDR',
'       EBFAH_CRE_OS_USER,',
'       EBFAH_UPD_BY,',
'       EBFAH_UPD_DATE,',
'       EBFAH_UPD_EMP_ID,',
'       EBFAH_UPD_IP_ADDR,',
'       EBFAH_UPD_OS_USER,',
'       EBFAH_FROM_USER_ID',
'  FROM ESS_BU_FUN_ACCESS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P167_EBFAH_STATUS NOT IN (''N'') OR :P167_LINE_COUNT > 0'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863720286920828495)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:177:&SESSION.::&DEBUG.:CR,111326009501::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863719898763828494)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863721979157828495)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P167_EBFAH_DOC_NO IS NOT NULL AND :P167_EBFAH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863723930627828497)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7032656110292820229)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863721152274828495)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'INSERT'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P167_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863717261781828492)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6333474157101970796)
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
,p_button_condition=>':P167_EBFAH_TYPE IN (''A'') AND :P167_EBFAH_DOC_NO IS NOT NULL AND :P167_EBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863716837029828492)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6333474157101970796)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P167_EBFAH_TYPE IN (''R'') AND :P167_EBFAH_DOC_NO IS NOT NULL AND :P167_EBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863723577206828497)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7032656110292820229)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863721526117828495)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'POST'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'   FROM ess_bu_fun_access_ln',
'  WHERE ebfal_bu = :GLOBAL_bu',
'    AND ebfal_doc_no = :P167_EBFAH_DOC_NO',
'    AND :P167_EBFAH_STATUS = ''N'') > 0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-paper-plane-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863722699322828495)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.::P166_SHOW_DATA:Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863717593495828492)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6333474157101970796)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P167_EBFAH_DOC_NO IS NOT NULL AND :P167_EBFAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863722288669828495)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863720781557828495)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5863764764140849404)
,p_button_name=>'UPDATE'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM ess_bu_fun_access_ln',
' WHERE ebfal_bu = :GLOBAL_bu',
'   AND ebfal_doc_no = :P167_EBFAH_DOC_NO',
' UNION ALL',
'SELECT 1',
'  FROM DUAL',
' WHERE :P167_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485450542513641)
,p_name=>'P167_EBFAH_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485541738513642)
,p_name=>'P167_EBFAH_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660484736448513634)
,p_name=>'P167_EBFAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485876643513645)
,p_name=>'P167_EBFAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485927361513646)
,p_name=>'P167_EBFAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'EBFAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486028845513647)
,p_name=>'P167_EBFAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486102098513648)
,p_name=>'P167_EBFAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660484897237513636)
,p_name=>'P167_EBFAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'EBFAH_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(5660484829830513635)
,p_name=>'P167_EBFAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_prompt=>'Doc. No.'
,p_source=>'EBFAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'READONLY = READONLY tabindex="-1"'
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
 p_id=>wwv_flow_imp.id(5660485139796513638)
,p_name=>'P167_EBFAH_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'EBFAH_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(5660485188965513639)
,p_name=>'P167_EBFAH_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'EBFAH_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(5863768314694849440)
,p_name=>'P167_EBFAH_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_FROM_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485751530513644)
,p_name=>'P167_EBFAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_prompt=>'Reference'
,p_source=>'EBFAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
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
 p_id=>wwv_flow_imp.id(5660485664946513643)
,p_name=>'P167_EBFAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'EBFAH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P,Cancelled;L'
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
 p_id=>wwv_flow_imp.id(5660485363452513640)
,p_name=>'P167_EBFAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_prompt=>'Type'
,p_source=>'EBFAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486194280513649)
,p_name=>'P167_EBFAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486347712513650)
,p_name=>'P167_EBFAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'EBFAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486435095513651)
,p_name=>'P167_EBFAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660486574544513652)
,p_name=>'P167_EBFAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5863764610269849403)
,p_name=>'P167_EBFAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'EBFAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660485003085513637)
,p_name=>'P167_EBFAH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_prompt=>'User ID'
,p_source=>'EBFAH_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT appluser_id D,',
'        appluser_id R',
'   FROM appl_users',
'  WHERE appluser_bu = :GLOBAL_bu',
'    AND (appluser_user_type IN (''U'',''R'') OR (appluser_user_type = ''E'' AND appluser_erp_admin_user = ''Y'') OR (appluser_user_type = ''E'' AND appluser_erp_admin_user = ''N''))',
'    AND appluser_emp_id is not null',
'    AND appluser_status = ''A'';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User ID',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5863768395398849441)
,p_name=>'P167_LINE_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6333474157101970796)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)  FROM ess_bu_fun_access_ln',
' WHERE ebfal_bu = :GLOBAL_BU',
'   AND ebfal_doc_no = :P167_EBFAH_DOC_NO'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6333474431898970789)
,p_name=>'P167_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_item_source_plug_id=>wwv_flow_imp.id(6333416985443969799)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6351846663161387020)
,p_name=>'P167_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6333474157101970796)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7032689150881820271)
,p_name=>'P167_WBFAHD_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7032656110292820229)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Add;N,Copy;C'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7032689253515820272)
,p_name=>'P167_WBFAHD_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7032656110292820229)
,p_use_cache_before_default=>'NO'
,p_prompt=>'From User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'ESS_COPY_USER_ACCESS'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P167_EBFAH_USER_ID'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the From User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5863718541262828494)
,p_tabular_form_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_validation_name=>'Line Date From'
,p_static_id=>'line-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :EBFAL_DATE_FROM IS NULL THEN',
'   RETURN(''From date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE(:EBFAL_DATE_FROM,''DD-MM-YYYY'') > TO_DATE(:EBFAL_DATE_TO,''DD-MM-YYYY'') THEN',
'  RETURN(''From date should be less than or equal to To date. '');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5863718945282828494)
,p_tabular_form_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_validation_name=>'Line Date To'
,p_static_id=>'line-date-to'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :EBFAL_DATE_TO IS NULL THEN',
'   RETURN(''To date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE (:EBFAL_DATE_TO,''DD-MM-YYYY'') < TO_DATE (:EBFAL_DATE_FROM,''DD-MM-YYYY'') THEN',
'   RETURN(''To date should be greater than equal to From date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5863764860929849405)
,p_validation_name=>'P167_EBFAH_USER_ID'
,p_static_id=>'p167-ebfah-user-id'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P167_EBFAH_USER_ID IS NULL THEN',
'   RETURN (''User ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(5660485003085513637)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5863729716557828503)
,p_validation_name=>'WBFAHD_FROM_USER_ID1'
,p_static_id=>'wbfahd-from-user-id'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P167_WBFAHD_FROM_USER_ID1 IS NULL  THEN',
'	IF :P167_WBFAHD_ADD_TYPE = ''C'' THEN',
'        RETURN (''User must be entered.'');',
'    END IF;',
'END IF;',
'',
'IF :P167_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM appl_users',
'		 WHERE appluser_bu     = :GLOBAL_bu',
'		   AND appluser_user_type <> ''O''',
'		   AND appluser_id     = :P167_WBFAHD_FROM_USER_ID1;',
'',
'		cr1				    c1%ROWTYPE;',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		  IF c1%NOTFOUND THEN',
'		  	 RETURN (''User not found.'');',
'		  END IF;',
'		CLOSE c1;',
'	END;',
'',
'    IF :P167_WBFAHD_FROM_USER_ID1 = :P167_EBFAH_USER_ID AND :P167_WBFAHD_ADD_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7032689253515820272)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863744852996828512)
,p_name=>'Add Bus Fun'
,p_static_id=>'add-bus-fun'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5863723930627828497)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863745311386828512)
,p_event_id=>wwv_flow_imp.id(5863744852996828512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7032656110292820229)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863739724292828511)
,p_name=>'ADD_TYPE'
,p_static_id=>'add-type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P167_WBFAHD_ADD_TYPE'
,p_condition_element=>'P167_WBFAHD_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863740701419828511)
,p_event_id=>wwv_flow_imp.id(5863739724292828511)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863740282979828511)
,p_event_id=>wwv_flow_imp.id(5863739724292828511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863745782790828514)
,p_name=>'Bus Fun'
,p_static_id=>'bus-fun'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863746260225828514)
,p_event_id=>wwv_flow_imp.id(5863745782790828514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863742049795828511)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P167_WBFAHD_FROM_USER_ID'
,p_condition_element=>'P167_WBFAHD_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863743047791828512)
,p_event_id=>wwv_flow_imp.id(5863742049795828511)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863742559175828512)
,p_event_id=>wwv_flow_imp.id(5863742049795828511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863737442587828509)
,p_name=>'Ig_save'
,p_static_id=>'ig-save'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5863717593495828492)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863737925938828509)
,p_event_id=>wwv_flow_imp.id(5863737442587828509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863738376071828509)
,p_name=>'LOAD  AC'
,p_static_id=>'load-ac'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5863717261781828492)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863738876253828511)
,p_event_id=>wwv_flow_imp.id(5863738376071828509)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7032656110292820229)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863739381225828511)
,p_event_id=>wwv_flow_imp.id(5863738376071828509)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_ADD_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863736566741828509)
,p_name=>'Region Refresh'
,p_static_id=>'region-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863737033413828509)
,p_event_id=>wwv_flow_imp.id(5863736566741828509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863734225534828508)
,p_name=>'WBFAHD_ADD_TYPE'
,p_static_id=>'wbfahd-add-type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P167_WBFAHD_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863734753796828508)
,p_event_id=>wwv_flow_imp.id(5863734225534828508)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P167_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863719211358828494)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6333474157101970796)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bus fun - Save Interactive Grid Data'
,p_static_id=>'bus-fun-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'',
'    UPDATE ess_bu_fun_access_ln',
'       SET ebfal_date_from  = TO_DATE(:ebfal_date_from,:GLOBAL_DATE_FORMAT),',
'           ebfal_date_to    = TO_DATE(:ebfal_date_to,:GLOBAL_DATE_FORMAT),',
'           ebfal_remov_type = :ebfal_remov_type,',
'           ebfal_sel_flag   = :ebfal_sel_flag,',
'        --    ebfal_sel_flag   = CASE WHEN :ebfal_sel_flag =''Y'' THEN :GLOBAL_user ELSE NULL END,',
'           ebfal_upd_by     = :GLOBAL_user,',
'           ebfal_upd_date   = SYSDATE',
'     WHERE ebfal_bu         = :GLOBAL_bu',
'       AND ebfal_seq_no     = :ebfal_seq_no',
'       AND ebfal_doc_no     = :P167_EBFAH_DOC_NO;',
'    COMMIT;          ',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>384198227573908292
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863732399127828506)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE ess_bu_fun_access_hd',
'   SET ebfah_status  	 = ''L'',',
'       ebfah_upd_by	     = :GLOBAL_user,',
'       ebfah_upd_ip_addr = :GLOBAL_IP,',
'       ebfah_upd_os_user = NULL,',
'       ebfah_upd_emp_id  = :GLOBAL_EMP_ID,',
'       ebfah_upd_date    = SYSDATE',
' WHERE ebfah_bu     	 = :GLOBAL_bu',
'   AND ebfah_doc_no  	 = :P167_EBFAH_DOC_NO;',
'',
' COMMIT;',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863721979157828495)
,p_internal_uid=>384211415342908304
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863730836694828505)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P167_ROWID IS NULL THEN',
'',
'    SELECT NVL (MAX ((TO_NUMBER(ebfah_doc_no))), 1000000000) + 1',
'      INTO :P167_EBFAH_DOC_NO',
'      FROM ess_bu_fun_access_hd',
'     WHERE ebfah_bu = :GLOBAL_bu;',
'',
'    :P167_EBFAH_DOC_DATE := TRUNC(SYSDATE);',
'    ',
'    :P167_EBFAH_BU            := :GLOBAL_bu;',
'    :P167_EBFAH_CRE_BY        := :GLOBAL_USER;',
'    :P167_EBFAH_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P167_EBFAH_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'ELSE',
'    :P167_EBFAH_UPD_BY        := :GLOBAL_USER;',
'    :P167_EBFAH_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P167_EBFAH_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P167_EBFAH_UPD_IP_ADDR   := :GLOBAL_IP;',
'END IF;',
'    ',
'IF :P167_EBFAH_REFERENCE IS NULL THEN',
'    IF :P167_EBFAH_TYPE =''A'' THEN',
'       :P167_EBFAH_REFERENCE := ''Add Bus. Fun.'';',
'    ELSE',
'       :P167_EBFAH_REFERENCE := ''Remove Bus. Fun.'';',
'    END IF;',
'END IF;          '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>384209852909908303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863707706632828475)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6333416985443969799)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Access'
,p_static_id=>'initialize-form-user-access'
,p_internal_uid=>384186722847908273
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863732018912828506)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P167_WBFAHD_ADD_TYPE = ''N'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT bfa_menu_id,',
'   		   bfa_menu_desc,',
'   		   bfa_type',
'   	  FROM bus_fun_apex',
'   	 WHERE bfa_menu_id NOT IN (SELECT bfraa_menu_id',
'   		                         FROM bus_fun_role_access_apex',
'   		                        WHERE bfraa_user_id = :P167_EBFAH_USER_ID',
'   		                        UNION ALL',
'   		                       SELECT ebfal_bus_fun_id',
'   				                 FROM ess_bu_fun_access_ln',
'   				                WHERE ebfal_bu 	   = :GLOBAL_bu',
'   				                  AND ebfal_doc_no = :P167_EBFAH_DOC_NO)',
'         AND bfa_visible_flag = ''Y''',
'         AND bfa_par_menu_id NOT IN (''MASTER'')',
'         AND bfa_par_menu_id IN (''MA_MY_INFO_MAS'',''MA_LEAVE'',''MA_ATTEN'',''MA_LOAN'',''MA_TDS'',''MA_TRAVE'',''MA_TDS'',''MA_TRAVE'',''MA_COMPLAINT'',''MA_TERMI'',''MA_COMPLAINT'',''MA_WFM'')',
'         AND bfa_type IN (''FRM'',''REP'',''RPT'');',
'',
'   		 v_seq_no     VARCHAR2(5);                             ',
'   BEGIN',
'',
'    -- IF (:P167_EBFAH_FROM_USER_ID <> :P167_WBFAHD_FROM_USER_ID1) OR ',
'    --    (:P167_EBFAH_FROM_USER_ID IS NULL AND :P167_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'    --    (:P167_EBFAH_FROM_USER_ID IS NOT NULL AND :P167_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'    ',
'   	    DELETE',
'   	      FROM ess_bu_fun_access_ln',
'   	     WHERE ebfal_bu 	= :GLOBAL_bu',
'   	       AND ebfal_doc_no = :P167_EBFAH_DOC_NO;',
'',
'    -- END IF;',
'    -- COMMIT;',
'    ',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	    SELECT NVL (MAX (TO_NUMBER (ebfal_seq_no)), 0) + 1',
'   	      INTO v_seq_no',
'   	      FROM ess_bu_fun_access_ln',
'   	     WHERE ebfal_bu     = :GLOBAL_bu',
'   	       AND ebfal_doc_no = :P167_EBFAH_DOC_NO;',
'   	    ',
'            INSERT INTO ess_bu_fun_access_ln (',
'                        ebfal_bu,',
'                        ebfal_doc_no,',
'                        ebfal_seq_no,',
'                        ebfal_bus_fun_id,',
'                        ebfal_bus_fun_name,',
'                        ebfal_date_from,',
'                        ebfal_date_to,',
'                        ebfal_sel_flag,',
'                        ebfal_remov_type,',
'                        ebfal_bus_fun_type,',
'                        ebfal_user_id,',
'                        ebfal_cre_by,',
'                        ebfal_cre_date,',
'                        ebfal_upd_by,',
'                        ebfal_upd_date',
'                        ) ',
'                VALUES (',
'                        :GLOBAL_BU,',
'                        :P167_EBFAH_DOC_NO,',
'                        v_seq_no,',
'                        cr1.bfa_menu_id,',
'                        cr1.bfa_menu_desc,',
'                        TO_DATE(:P167_EBFAH_EFF_FROM,''DD-MM-RRRR''),',
'                        TO_DATE(:P167_EBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        ''N'',',
'                        cr1.bfa_type,',
'                        :P167_EBFAH_USER_ID,',
'                        :GLOBAL_user,',
'                        SYSDATE,',
'                        NULL,',
'                        NULL',
'                        );',
'',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'IF :P167_WBFAHD_ADD_TYPE = ''C'' AND :P167_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE	',
'		CURSOR c1',
'		IS',
'		SELECT bfa_menu_id,',
'   		       bfa_menu_desc,',
'   		       bfa_type',
'		  FROM bus_fun_apex,',
'		       bus_fun_role_access_apex ',
'		 WHERE bfa_menu_id   = bfraa_menu_id',
'		   AND bfraa_user_id = :P167_WBFAHD_FROM_USER_ID1',
'		   AND bfa_menu_id NOT IN (SELECT ebfal_bus_fun_id',
'         							 FROM ess_bu_fun_access_ln',
'         							WHERE ebfal_bu 	   = :GLOBAL_bu',
'         							  AND ebfal_doc_no = :P167_EBFAH_DOC_NO)',
'           AND bfa_menu_id NOT IN (SELECT bfraa_menu_id',
'			         	   		     FROM bus_fun_role_access_apex',
'									WHERE bfraa_user_id = :P167_EBFAH_USER_ID)																	   ',
'		   AND bfa_visible_flag = ''Y''',
'           AND bfa_par_menu_id NOT IN (''MASTER'')',
'           AND bfa_par_menu_id IN (''MA_MY_INFO_MAS'',''MA_LEAVE'',''MA_ATTEN'',''MA_LOAN'',''MA_TDS'',''MA_TRAVE'',''MA_TDS'',''MA_TRAVE'',''MA_COMPLAINT'',''MA_TERMI'',''MA_COMPLAINT'',''MA_WFM'')',
'		   AND bfa_type IN (''FRM'',''REP'',''RPT'');',
'',
'		v_seq_no     VARCHAR2(5);                             ',
'	BEGIN	',
'    -- RAISE_APPLICATION_ERROR(-20999,:P167_EBFAH_FROM_USER_ID||''~''||:P167_WBFAHD_FROM_USER_ID1);',
'    IF (:P167_EBFAH_FROM_USER_ID <> :P167_WBFAHD_FROM_USER_ID1) OR ',
'       (:P167_EBFAH_FROM_USER_ID IS NULL AND :P167_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'       (:P167_EBFAH_FROM_USER_ID IS NOT NULL AND :P167_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'	    DELETE',
'		  FROM ess_bu_fun_access_ln',
'		 WHERE ebfal_bu 	= :GLOBAL_bu',
'		   AND ebfal_doc_no = :P167_EBFAH_DOC_NO;',
'',
'    END IF;',
'',
'	COMMIT;',
'    ',
'		FOR cr1 IN c1',
'		LOOP',
'		    SELECT NVL (MAX (TO_NUMBER (ebfal_seq_no)), 0) + 1',
'		      INTO v_seq_no',
'		      FROM ess_bu_fun_access_ln',
'		     WHERE ebfal_bu     = :GLOBAL_bu',
'		       AND ebfal_doc_no = :P167_EBFAH_DOC_NO;',
'		    ',
'		    INSERT INTO ess_bu_fun_access_ln (',
'                        ebfal_bu,',
'                        ebfal_doc_no,',
'                        ebfal_seq_no,',
'                        ebfal_bus_fun_id,',
'                        ebfal_bus_fun_name,',
'                        ebfal_date_from,',
'                        ebfal_date_to,',
'                        ebfal_sel_flag,',
'                        ebfal_remov_type,',
'                        ebfal_bus_fun_type,',
'                        ebfal_user_id,',
'                        ebfal_cre_by,',
'                        ebfal_cre_date,',
'                        ebfal_upd_by,',
'                        ebfal_upd_date',
'                        ) ',
'                VALUES (',
'                        :GLOBAL_BU,',
'                        :P167_EBFAH_DOC_NO,',
'                        v_seq_no,',
'                        cr1.bfa_menu_id,',
'                        cr1.bfa_menu_desc,',
'                        TO_DATE(:P167_EBFAH_EFF_FROM,''DD-MM-RRRR''),',
'                        TO_DATE(:P167_EBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        ''N'',',
'                        cr1.bfa_type,',
'                        :P167_EBFAH_USER_ID,',
'                        :GLOBAL_user,',
'                        SYSDATE,',
'                        NULL,',
'                        NULL',
'                        );',
'   	END LOOP;',
'	END;  ',
'',
'END IF;	',
'',
'    UPDATE ess_bu_fun_access_hd',
'       SET ebfah_from_user_id = :P167_WBFAHD_FROM_USER_ID1,',
'           ebfah_upd_by       = :GLOBAL_user,',
'           ebfah_upd_date     = SYSDATE',
'     WHERE ebfah_bu           = :GLOBAL_BU',
'       AND ebfah_doc_no       = :P167_EBFAH_DOC_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863723577206828497)
,p_internal_uid=>384211035127908304
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863731202401828505)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing'
,p_static_id=>'load-existing'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P167_EBFAH_TYPE = ''R'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT *',
'		  FROM bus_fun_role_access_apex,',
'		       bus_fun_apex',
'		 WHERE bfa_menu_id   = bfraa_menu_id',
'           AND bfraa_user_id = :P167_EBFAH_USER_ID',
'           -- AND bfa_par_menu_id IN (''MA_MY_INFO_MAS'',''MA_LEAVE'',''MA_ATTEN'',''MA_LOAN'',''MA_TDS'',''MA_TRAVE'',''MA_TDS'',''MA_TRAVE'',''MA_COMPLAINT'',''MA_TERMI'',''MA_COMPLAINT'',''MA_WFM'')',
'		   AND bfa_visible_flag = ''Y'';',
'		 ',
'		cr1                  c1%ROWTYPE;',
'		v_seq_no             VARCHAR2(5);',
'		v_res		         VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM ess_bu_fun_access_ln',
'		 WHERE ebfal_bu      = :GLOBAL_bu',
'		   AND ebfal_doc_no  = :P167_EBFAH_DOC_NO',
'		   AND ebfal_user_id = :P167_EBFAH_USER_ID;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		    SELECT NVL(MAX(TO_NUMBER(ebfal_seq_no)), 0) + 1',
'		      INTO v_seq_no',
'		      FROM ess_bu_fun_access_ln',
'		     WHERE ebfal_bu     = :GLOBAL_bu',
'		       AND ebfal_doc_no = :P167_EBFAH_DOC_NO;',
'',
'		    INSERT INTO ess_bu_fun_access_ln(',
'                        ebfal_bu,',
'                        ebfal_doc_no,',
'                        ebfal_seq_no,',
'                        ebfal_bus_fun_id,',
'                        ebfal_bus_fun_name,',
'                        ebfal_date_from,',
'                        ebfal_date_to,',
'                        ebfal_sel_flag,',
'                        ebfal_bus_fun_type,',
'                        ebfal_user_id,',
'                        ebfal_cre_by,',
'                        ebfal_cre_date',
'                        )',
'				 VALUES(',
'                        :GLOBAL_bu,',
'				        :P167_EBFAH_DOC_NO,',
'				        v_seq_no,',
'				        cr1.bfa_menu_id,',
'				        cr1.bfa_menu_desc,',
'				        TO_DATE(:P167_EBFAH_EFF_FROM,''DD-MM-RRRR''),',
'				        TO_DATE(:P167_EBFAH_EFF_TO,''DD-MM-RRRR''),',
'                        ''N'',',
'                        cr1.bfa_type,',
'                        :P167_EBFAH_USER_ID,',
'				        :GLOBAL_USER,',
'				        SYSDATE',
'                        );',
'',
'            v_res := ''Y'';',
'',
'		END LOOP;',
'    ',
'		IF v_res = ''Y'' THEN',
'           apex_application.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           apex_application.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'',
'	END; 	',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863716837029828492)
,p_internal_uid=>384210218616908303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863730448293828503)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_res           VARCHAR2(1);',
'BEGIN',
'    ',
'    proc_ess_bus_fun_accs_dtl(:GLOBAL_bu,:P167_EBFAH_DOC_NO,:GLOBAL_user,v_res);',
'',
'    IF v_res = ''Y'' THEN',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'    ELSE',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document is Not Approved</span>''||''~''||:P167_EBFAH_DOC_NO; ',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863721526117828495)
,p_internal_uid=>384209464508908301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863708130441828475)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6333416985443969799)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form ESS User Access Insert'
,p_static_id=>'process-form-ess-user-access-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863721152274828495)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>384187146656908273
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863708563760828475)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6333416985443969799)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form ESS User Access Update'
,p_static_id=>'process-form-ess-user-access-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863720781557828495)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>384187579975908273
);
wwv_flow_imp.component_end;
end;
/
