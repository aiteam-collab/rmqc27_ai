prompt --application/pages/page_111326009501
begin
--   Manifest
--     PAGE: 111326009501
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
 p_id=>111326009501
,p_name=>'Grant/Revoke Bus. Fun. Access'
,p_alias=>'USER-ACCESS2'
,p_step_title=>'Grant/Revoke Bus. Fun. Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'slideclose();',
'',
'function getGridModel() {',
'    var ig$ = apex.region("ig_user").widget();',
'    var grid = ig$.interactiveGrid("getViews", "grid");',
'    return grid.model;',
'}',
'',
'',
'/* Update Select All checkbox state */',
'function updateSelectAllCheckbox() {',
'',
'    var model = getGridModel();',
'',
'    var total = 0;',
'    var selected = 0;',
'',
'    model.forEach(function (record) {',
'',
'        total++;',
'',
'        if (',
'            model.getValue(',
'                record,',
'                "WBUFALN_REMOV_TYPE"',
'            ) === "Y"',
'        ) {',
'            selected++;',
'        }',
'',
'    });',
'',
'    var checkbox = document.getElementById("selectAll");',
'',
'    if (checkbox) {',
'',
'        checkbox.checked =',
'            total > 0 && selected === total;',
'',
'        checkbox.indeterminate =',
'            selected > 0 && selected < total;',
'    }',
'}',
'',
'',
'/* SELECT ALL checkbox */',
'$(document).on("change", "#selectAll", function (event) {',
'',
'    event.stopPropagation();',
'',
'    var checked = this.checked;',
'',
'    var model = getGridModel();',
'',
'    /*',
'     * IMPORTANT:',
'     * Fetch ALL Interactive Grid records.',
'     * Without this, only the currently loaded',
'     * 50 records are processed.',
'     */',
'    model.fetchAll(function (status) {',
'',
'        if (status.done) {',
'',
'            model.forEach(function (record) {',
'',
'                model.setValue(',
'                    record,',
'                    "WBUFALN_REMOV_TYPE",',
'                    checked ? "Y" : "N"',
'                );',
'',
'            });',
'',
'            updateSelectAllCheckbox();',
'',
'        }',
'',
'    });',
'',
'});',
'',
'',
'/* Individual row checkbox changed */',
'$(document).on(',
'    "change",',
'    "#ig_user input[type=''checkbox'']:not(#selectAll)",',
'    function () {',
'',
'        setTimeout(function () {',
'            updateSelectAllCheckbox();',
'        }, 50);',
'',
'    }',
');'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ig_user input[type="checkbox"] {',
'    width: 17px;',
'    height: 17px;',
'    accent-color: #004153;',
'    cursor: pointer;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6648485554689911973)
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
 p_id=>wwv_flow_imp.id(5949306547376062570)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
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
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P111326009501_WF_NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5530934481031603444)
,p_plug_name=>'BTN'
,p_static_id=>'btn'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P111326009501_WF_NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5949303601499062540)
,p_plug_name=>'Bus fun'
,p_static_id=>'bus-fun'
,p_region_name=>'ig_user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBFALN_BU,',
'       WBFALN_DOC_NO,',
'       WBFALN_SEQ_NO,',
'       WBFALN_BUS_FUN_ID,',
'       WBFALN_BUS_FUN_NAME,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       WBFALN_DATE_FROM,',
'       WBFALN_DATE_TO,',
'       WBFALN_CRE_BY,',
'       WBFALN_CRE_DATE,',
'       WBFALN_UPD_BY,',
'       WBFALN_UPD_DATE,',
'        CASE WHEN WBFALN_SEL_FLAG = ''Y'' THEN',
'       ''<input type="checkbox" id="checkbox_''||WBFALN_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''||WBFALN_SEQ_NO||'',''''Y'''')"/>''',
'       ELSE',
'       ''<input type="checkbox" id="checkbox_''||WBFALN_SEQ_NO||''" onChange="checkanduncheck(''||WBFALN_SEQ_NO||'',''''N'''')" />''',
'       END      ',
'       "Flag",',
'       WBUFALN_REMOV_TYPE,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>'' Delete1',
'  from WA_BU_FUN_ACCESS_LN A,',
'       WAPL_BUS_FUN',
' WHERE WBF_BUS_FUN_ID = WBFALN_BUS_FUN_ID',
'   AND WBFALN_BU      = :global_bu',
'   AND WBFALN_DOC_NO  = :P111326009501_WBFAHD_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P111326009501_WBFAHD_DOC_NO,P111326009501_WBFAHD_USER_ID'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P111326009501_WBFAHD_STATUS'
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
 p_id=>wwv_flow_imp.id(5949304838821062553)
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
 p_id=>wwv_flow_imp.id(5949304936486062554)
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
 p_id=>wwv_flow_imp.id(5967649584637478729)
,p_name=>'DELETE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P111326009501_WBFAHD_DOC_NO'',''&WBFALN_DOC_NO.''),$s(''P111326009501_SEQ_NO'',''&WBFALN_SEQ_NO.'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
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
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5763138947944638646)
,p_name=>'Flag'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Flag'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5949303788186062542)
,p_name=>'WBFALN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5949304090177062545)
,p_name=>'WBFALN_BUS_FUN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_BUS_FUN_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. ID'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(5949304168712062546)
,p_name=>'WBFALN_BUS_FUN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_BUS_FUN_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bus. Fun. Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>false
,p_max_length=>800
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE'
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
 p_id=>wwv_flow_imp.id(5949304454351062549)
,p_name=>'WBFALN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_CRE_BY'
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
 p_id=>wwv_flow_imp.id(5949304553254062550)
,p_name=>'WBFALN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(5949304266283062547)
,p_name=>'WBFALN_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
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
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_is_required=>false
,p_max_length=>75
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
 p_id=>wwv_flow_imp.id(5949304345124062548)
,p_name=>'WBFALN_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_is_required=>false
,p_max_length=>75
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
 p_id=>wwv_flow_imp.id(5949303864130062543)
,p_name=>'WBFALN_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_DOC_NO'
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
 p_id=>wwv_flow_imp.id(5949303956611062544)
,p_name=>'WBFALN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5949304710846062551)
,p_name=>'WBFALN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_UPD_BY'
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
 p_id=>wwv_flow_imp.id(5949304776964062552)
,p_name=>'WBFALN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBFALN_UPD_DATE'
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
 p_id=>wwv_flow_imp.id(6774358852047938074)
,p_name=>'WBF_NODE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBF_NODE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(6034226949916332644)
,p_name=>'WBUFALN_REMOV_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WBUFALN_REMOV_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'<input type="checkbox"        id="selectAll"        onclick="event.stopPropagation();"        onmousedown="event.stopPropagation();">'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P111326009501_WBFAHD_TYPE IN (''R'',''E'')'
,p_display_condition2=>'PLSQL'
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5949303652064062541)
,p_internal_uid=>467341816520451513
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(5950709302157565398)
,p_interactive_grid_id=>wwv_flow_imp.id(5949303652064062541)
,p_static_id=>'4687475'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5950709462106565398)
,p_report_id=>wwv_flow_imp.id(5950709302157565398)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961842678611029)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5949304936486062554)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5488925659697705347)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6034226949916332644)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5829723410489951084)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5763138947944638646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950710014901565406)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5949303788186062542)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950710899711565413)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5949303864130062543)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950711832698565421)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5949303956611062544)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950712728567565429)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5949304090177062545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950713613372565440)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5949304168712062546)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>638
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950714497586565449)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5949304266283062547)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950715385359565457)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5949304345124062548)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950716333484565465)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5949304454351062549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950717169670565473)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5949304553254062550)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950718112030565481)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5949304710846062551)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950719024998565488)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5949304776964062552)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5950730810650584171)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5949304838821062553)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5967655965686480992)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5967649584637478729)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6778911619104024137)
,p_view_id=>wwv_flow_imp.id(5950709462106565398)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6774358852047938074)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5949246429841061543)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WBFAHD_BU,',
'       WBFAHD_DOC_NO,',
'       WBFAHD_USER_ID,',
'       WBFAHD_FROM_USER_ID,',
'       WBFAHD_EFF_FROM,',
'       WBFAHD_EFF_TO,',
'       WBFAHD_STATUS,',
'       WBFAHD_REFERENCE,',
'       WBFAHD_CRE_BY,',
'       WBFAHD_CRE_DATE,',
'       WBFAHD_UPD_BY,',
'       WBFAHD_UPD_DATE,',
'       WBFAHD_DOC_DATE,',
'       WBFAHD_TYPE,',
'       WBFAHD_UPD_IP_ADDR,',
'       WBFAHD_UPD_OS_USER,',
'       WBFAHD_UPD_EMP_ID,',
'       WBFAHD_CRE_EMP_ID,',
'       WBFAHD_CRE_OS_USER,',
'       WBFAHD_CRE_IP_ADDR,',
'       WBFAHD_APPR_BY,',
'       WBFAHD_APPR_DATE',
'  from WA_BU_FUN_ACCESS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P111326009501_ROWID IS NOT NULL'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6034226799018332642)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.:CR,173,111326009501::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949306654222062571)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:87:P87_SHOW_DATA:N'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5530934562888603445)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5530934481031603444)
,p_button_name=>'Back_WF'
,p_static_id=>'back-wf'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=800:236131010:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6488223724462919951)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_condition=>':P111326009501_WBFAHD_DOC_NO IS NOT NULL AND :P111326009501_WBFAHD_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6669558170054151729)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6648485554689911973)
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
 p_id=>wwv_flow_imp.id(5949255804869061593)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P111326009501_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949302954867062534)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5949303601499062540)
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
,p_button_condition=>':P111326009501_WBFAHD_TYPE IN (''A'',''C'',''M'') AND :P111326009501_WBFAHD_DOC_NO IS NOT NULL AND :P111326009501_WBFAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949306760449062572)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5949303601499062540)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P111326009501_WBFAHD_TYPE IN (''R'',''E'',''O'') AND :P111326009501_WBFAHD_DOC_NO IS NOT NULL AND :P111326009501_WBFAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6648486086019911978)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6648485554689911973)
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
 p_id=>wwv_flow_imp.id(5812004444543008732)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'POST'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'  FROM WA_BU_FUN_ACCESS_LN',
' WHERE WBFALN_BU=:global_bu',
'   AND WBFALN_DOC_NO=:P111326009501_WBFAHD_DOC_NO',
'   AND :P111326009501_WBFAHD_STATUS = ''N'')>0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-paper-plane'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7355141391620293968)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.::P87_SHOW_DATA,P87_SEARCH_TYPE,P87_REFIND:Y,&P111326009501_SEARCH_TYPE.,Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949255432563061593)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WA_BU_FUN_ACCESS_LN',
' WHERE WBFALN_BU=:global_bu',
'   AND WBFALN_DOC_NO=:P111326009501_WBFAHD_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM DUAL',
' WHERE :P111326009501_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5949305794430062562)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5949303601499062540)
,p_button_name=>'Save'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P111326009501_WBFAHD_DOC_NO IS NOT NULL AND :P111326009501_WBFAHD_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7355141290555293967)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5949306547376062570)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6053673115576233229)
,p_branch_name=>'workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_P_DOC_NO,P236131090_P_PAGE_ID:WF_BUS_FUN_ACCS,&P111326009501_WBFAHD_DOC_NO.,111326009501&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P111326009501_WF_COUNT  = ''WFM1090'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6488223600811919950)
,p_branch_name=>'Self_Approve'
,p_branch_action=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.::P111326009501_ROWID:&P111326009501_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P111326009501_WF_COUNT = ''WFM1091'''
,p_branch_condition_text=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6669558763341151735)
,p_branch_name=>'gotopage_add_copy'
,p_branch_action=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:CR,71:P71_HD_DOC_NO,P71_USER_ID,P71_ROWID:&P111326009501_WBFAHD_DOC_NO.,&P111326009501_WBFAHD_USER_ID.,&P111326009501_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6648486086019911978)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5812004677096008734)
,p_name=>'P111326009501_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WBFAHD_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_attributes=>'readonly="true" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(6488222977315919944)
,p_name=>'P111326009501_RETURN_PAGE_NO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949302516124062529)
,p_name=>'P111326009501_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6388020166571381345)
,p_name=>'P111326009501_SEARCH_TYPE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5967649649694478730)
,p_name=>'P111326009501_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5949303601499062540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6648485841047911976)
,p_name=>'P111326009501_WBFAHD_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6648485554689911973)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Wbfahd Add Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Add'' d, ''N'' r FROM DUAL WHERE :P111326009501_WBFAHD_TYPE <> ''M''',
'UNION ALL',
'SELECT ''Copy'' d, ''C'' r FROM DUAL WHERE :P111326009501_WBFAHD_TYPE <> ''M''',
'UNION ALL',
'SELECT ''MRM'' d, ''M'' r FROM DUAL WHERE :P111326009501_WBFAHD_TYPE = ''M'''))
,p_lov_cascade_parent_items=>'P111326009501_WBFAHD_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>6
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488225334874919967)
,p_name=>'P111326009501_WBFAHD_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488225366442919968)
,p_name=>'P111326009501_WBFAHD_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949246678491061543)
,p_name=>'P111326009501_WBFAHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WBFAHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949249504104061576)
,p_name=>'P111326009501_WBFAHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P111326009501_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949249891189061578)
,p_name=>'P111326009501_WBFAHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WBFAHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P111326009501_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488224948388919964)
,p_name=>'P111326009501_WBFAHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488225225842919966)
,p_name=>'P111326009501_WBFAHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488225101006919965)
,p_name=>'P111326009501_WBFAHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949247080722061559)
,p_name=>'P111326009501_WBFAHD_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_prompt=>'Doc. No.'
,p_source=>'WBFAHD_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'Readonly=readonly tabindex="-1" '
,p_begin_on_new_line=>'N'
,p_colspan=>1
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
 p_id=>wwv_flow_imp.id(5949247919931061570)
,p_name=>'P111326009501_WBFAHD_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WBFAHD_EFF_FROM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949248274545061573)
,p_name=>'P111326009501_WBFAHD_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WBFAHD_EFF_TO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6600026295733079345)
,p_name=>'P111326009501_WBFAHD_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_prompt=>'From User'
,p_source=>'WBFAHD_FROM_USER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(6648485943681911977)
,p_name=>'P111326009501_WBFAHD_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6648485554689911973)
,p_use_cache_before_default=>'NO'
,p_prompt=>'From User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wubfa_user_id',
'  FROM wapl_user_bus_fun_accs,',
'       appl_users',
' WHERE appluser_bu = wubfa_bu',
'   AND appluser_id = wubfa_user_id',
'   AND appluser_bu = :GLOBAL_bu',
'   AND appluser_id <> :P111326009501_WBFAHD_USER_ID'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P111326009501_WBFAHD_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the From User',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949249059244061576)
,p_name=>'P111326009501_WBFAHD_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_prompt=>'Reference'
,p_source=>'WBFAHD_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(5949248675497061574)
,p_name=>'P111326009501_WBFAHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WBFAHD_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P,Cancelled;L'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034226704663332641)
,p_name=>'P111326009501_WBFAHD_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'WBFAHD_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R,Extend Duration;E,MRM;M,Remove MRM;O'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949250328495061578)
,p_name=>'P111326009501_WBFAHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P111326009501_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949250650756061579)
,p_name=>'P111326009501_WBFAHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WBFAHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P111326009501_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488224863299919963)
,p_name=>'P111326009501_WBFAHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488224657285919961)
,p_name=>'P111326009501_WBFAHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488224777316919962)
,p_name=>'P111326009501_WBFAHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source=>'WBFAHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5949247493267061563)
,p_name=>'P111326009501_WBFAHD_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_item_source_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_prompt=>'User'
,p_source=>'WBFAHD_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT appluser_id d,appluser_id r',
'   FROM appl_users',
' WHERE appluser_bu=:global_bu ',
'    AND appluser_status=''A''',
'    '))
,p_cSize=>20
,p_cMaxlength=>15
,p_colspan=>2
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
  'title', 'Select the Users',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6488222897923919943)
,p_name=>'P111326009501_WF_COUNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5530934256390603442)
,p_name=>'P111326009501_WF_NO'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(5949246429841061543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5949305261032062557)
,p_tabular_form_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_validation_name=>'Line Date From'
,p_static_id=>'line-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBFALN_DATE_FROM IS NULL THEN',
'   RETURN(''From date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE(:WBFALN_DATE_FROM,''DD-MM-YYYY'') > TO_DATE(:WBFALN_DATE_TO,''DD-MM-YYYY'') THEN',
'  RETURN(''From date should be less than or equal to To date. '');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5949305444149062559)
,p_tabular_form_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_validation_name=>'Line Date To'
,p_static_id=>'line-date-to'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WBFALN_DATE_TO IS NULL THEN',
'   RETURN(''To date must be entered.'');',
'END IF;',
'   ',
'IF TO_DATE (:WBFALN_DATE_TO,''DD-MM-YYYY'') < TO_DATE (:WBFALN_DATE_FROM,''DD-MM-YYYY'') THEN',
'   RETURN(''To date should be greater than equal to From date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'WBFALN_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6074162869356303729)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P111326009501_WBFAHD_REFERENCE is null then',
'return(''Reference must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(5949249059244061576)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5949302599714062530)
,p_validation_name=>'User'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_WBFAHD_USER_ID IS NULL THEN',
'RETURN(''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(5949247493267061563)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6652928356168884577)
,p_validation_name=>'WBFAHD_FROM_USER_ID'
,p_static_id=>'wbfahd-from-user-id'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_WBFAHD_FROM_USER_ID IS NULL  THEN',
'	IF :P111326009501_WBFAHD_TYPE = ''C'' AND 1=2 THEN',
'      RETURN (''User must be entered.'');',
'    END IF;',
'END IF;',
'',
'IF :P111326009501_WBFAHD_FROM_USER_ID IS NOT NULL THEN',
'		',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM appl_users',
'		 WHERE appluser_bu     = :Global_bu',
'		   AND appluser_user_type <> ''O''',
'		   AND appluser_id     = :P111326009501_WBFAHD_FROM_USER_ID;',
'		   ',
'		   cr1				c1%ROWTYPE;',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		  IF c1%NOTFOUND THEN',
'		  	RETURN (''User not found.'');',
'		  END IF;',
'		CLOSE c1;',
'	END;',
'   ',
'    IF :P111326009501_WBFAHD_FROM_USER_ID = :P111326009501_WBFAHD_USER_ID AND :P111326009501_WBFAHD_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'    ',
'END IF;		',
'			  	',
'			  	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6600026295733079345)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6669558652125151734)
,p_validation_name=>'WBFAHD_FROM_USER_ID1'
,p_static_id=>'wbfahd-from-user-id-2'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_WBFAHD_FROM_USER_ID1 IS NULL  THEN',
'	IF :P111326009501_WBFAHD_ADD_TYPE = ''C'' THEN',
'        RETURN (''User must be entered.'');',
'    END IF;',
'END IF;',
'',
'IF :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM appl_users',
'		 WHERE appluser_bu     = :GLOBAL_bu',
'		   AND appluser_user_type <> ''O''',
'		   AND appluser_id     = :P111326009501_WBFAHD_FROM_USER_ID1;',
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
'    IF :P111326009501_WBFAHD_FROM_USER_ID1 = :P111326009501_WBFAHD_USER_ID AND :P111326009501_WBFAHD_ADD_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6648485943681911977)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6779090649595106849)
,p_name=>'Add Bus Fun'
,p_static_id=>'add-bus-fun'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6669558170054151729)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6779090804507106850)
,p_event_id=>wwv_flow_imp.id(6779090649595106849)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6648485554689911973)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669558318311151730)
,p_name=>'ADD_TYPE'
,p_static_id=>'add-type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111326009501_WBFAHD_ADD_TYPE'
,p_condition_element=>'P111326009501_WBFAHD_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669558560356151733)
,p_event_id=>wwv_flow_imp.id(6669558318311151730)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669558372504151731)
,p_event_id=>wwv_flow_imp.id(6669558318311151730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6779090849883106851)
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
 p_id=>wwv_flow_imp.id(6779090991737106852)
,p_event_id=>wwv_flow_imp.id(6779090849883106851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6671768998070366053)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6669558170054151729)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671769059717366054)
,p_event_id=>wwv_flow_imp.id(6671768998070366053)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'closeModal(''type''); ')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671769216085366055)
,p_event_id=>wwv_flow_imp.id(6671768998070366053)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5949303249208062537)
,p_name=>'Enable/Disable'
,p_static_id=>'enable-disable'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949303453481062539)
,p_event_id=>wwv_flow_imp.id(5949303249208062537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_name=>'Disable'
,p_static_id=>'disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5949302954867062534)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P111326009501_WBFAHD_TYPE'
,p_client_condition_expression=>'R'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949303424930062538)
,p_event_id=>wwv_flow_imp.id(5949303249208062537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'Enable'
,p_static_id=>'enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5949302954867062534)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P111326009501_WBFAHD_TYPE'
,p_client_condition_expression=>'A'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5949306898422062573)
,p_name=>'Enable/Disable_1'
,p_static_id=>'enable-disable-2'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949307061738062575)
,p_event_id=>wwv_flow_imp.id(5949306898422062573)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_name=>'Disable'
,p_static_id=>'disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5949306760449062572)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P111326009501_WBFAHD_TYPE'
,p_client_condition_expression=>'A'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949306966060062574)
,p_event_id=>wwv_flow_imp.id(5949306898422062573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'Enable'
,p_static_id=>'enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5949306760449062572)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P111326009501_WBFAHD_TYPE'
,p_client_condition_expression=>'R'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669559323791151740)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111326009501_WBFAHD_FROM_USER_ID'
,p_condition_element=>'P111326009501_WBFAHD_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669559527753151742)
,p_event_id=>wwv_flow_imp.id(6669559323791151740)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669559343333151741)
,p_event_id=>wwv_flow_imp.id(6669559323791151740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5949305883629062563)
,p_name=>'Ig_save'
,p_static_id=>'ig-save'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5949305794430062562)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949305976481062564)
,p_event_id=>wwv_flow_imp.id(5949305883629062563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6648485719534911974)
,p_name=>'LOAD  AC'
,p_static_id=>'load-ac'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5949302954867062534)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6648485763609911975)
,p_event_id=>wwv_flow_imp.id(6648485719534911974)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6648485554689911973)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669559623425151743)
,p_event_id=>wwv_flow_imp.id(6648485719534911974)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_ADD_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6779091415204106856)
,p_name=>'OK'
,p_static_id=>'ok'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6648486086019911978)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6779091468835106857)
,p_event_id=>wwv_flow_imp.id(6779091415204106856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6648485554689911973)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5949305578444062560)
,p_name=>'Region Refresh'
,p_static_id=>'region-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5949305664679062561)
,p_event_id=>wwv_flow_imp.id(5949305578444062560)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6671768223880366045)
,p_name=>'WBFAHD_ADD_TYPE'
,p_static_id=>'wbfahd-add-type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111326009501_WBFAHD_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671768303144366046)
,p_event_id=>wwv_flow_imp.id(6671768223880366045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111326009501_WBFAHD_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669558885198151736)
,p_name=>'WBFAHD_FROM_USER_ID1'
,p_static_id=>'wbfahd-from-user-id'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P111326009501_WBFAHD_FROM_USER_ID1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669559003430151737)
,p_event_id=>wwv_flow_imp.id(6669558885198151736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P111326009501_WBFAHD_FROM_USER_ID',
  'items_to_submit', 'P111326009501_WBFAHD_FROM_USER_ID1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
    '   :P111326009501_WBFAHD_FROM_USER_ID := :P111326009501_WBFAHD_FROM_USER_ID1;',
    '   COMMIT;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5949305127353062555)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5949303601499062540)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bus fun - Save Interactive Grid Data'
,p_static_id=>'bus-fun-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'',
'UPDATE wa_bu_fun_access_ln',
'   SET wbfaln_date_from   = TO_DATE(:wbfaln_date_from,:GLOBAL_DATE_FORMAT),',
'       wbfaln_date_to     = TO_DATE(:wbfaln_date_to,:GLOBAL_DATE_FORMAT),',
'       wbfaln_sel_flag    = :wbfaln_sel_flag,',
'       WBUFALN_REMOV_TYPE = :WBUFALN_REMOV_TYPE,',
'       wbfaln_sel_user    = CASE WHEN :wbfaln_sel_user =''Y'' THEN :global_user ELSE NULL END,',
'       wbfaln_upd_by      = :global_user,',
'       wbfaln_upd_date    = SYSDATE',
' WHERE wbfaln_bu          = :global_bu',
'   AND wbfaln_seq_no      = :wbfaln_seq_no',
'   AND wbfaln_doc_no      = :P111326009501_WBFAHD_DOC_NO;',
'',
'   COMMIT;          ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>467343291809451527
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6488223808355919952)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' UPDATE wa_bu_fun_access_hd',
'    SET wbfahd_status  		= ''L'',',
'        wbfahd_upd_by		= :Global_user,',
'        wbfahd_upd_ip_addr  = :Global_ip,',
'        wbfahd_upd_os_user  = NULL,',
'        wbfahd_upd_emp_id   = :Global_emp_id,',
'        wbfahd_upd_date     = SYSDATE',
'  WHERE wbfahd_bu     		= :Global_bu',
'   AND wbfahd_doc_no  	    = :P111326009501_WBFAHD_DOC_NO;',
'',
'  COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6488223724462919951)
,p_internal_uid=>1006261972812308924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5967649784315478731)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Line'
,p_static_id=>'delete-line'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM WA_BU_FUN_ACCESS_LN',
' WHERE WBFALN_bu=:global_bu',
'   AND wbfaln_doc_no=:P111326009501_WBFAHD_DOC_NO',
'   AND wbfaln_seq_no=:P111326009501_SEQ_NO',
'   AND wbfaln_user_id=:P111326009501_WBFAHD_USER_ID;',
' COMMIT;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>485687948771867703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5949302755804062532)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_ROWID IS NULL THEN',
'',
'    SELECT NVL (MAX ((TO_NUMBER(wbfahd_doc_no))), 1000000000) + 1',
'      INTO :P111326009501_WBFAHD_DOC_NO',
'      FROM wa_bu_fun_access_hd',
'     WHERE wbfahd_bu = :global_bu;',
'',
'    :P111326009501_DOC_DATE := TRUNC(SYSDATE);',
'    ',
'    :P111326009501_WBFAHD_CRE_BY        := :GLOBAL_USER;',
'    :P111326009501_WBFAHD_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P111326009501_WBFAHD_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P111326009501_WBFAHD_CRE_IP_ADDR   := :GLOBAL_IP;',
'ELSE',
'    :P111326009501_WBFAHD_UPD_BY        := :GLOBAL_USER;',
'    :P111326009501_WBFAHD_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'    :P111326009501_WBFAHD_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'    :P111326009501_WBFAHD_UPD_IP_ADDR   := :GLOBAL_IP;',
'END IF;',
'    ',
'IF :P111326009501_WBFAHD_REFERENCE IS NULL THEN',
'   IF :P111326009501_WBFAHD_TYPE =''A'' THEN',
'      :P111326009501_WBFAHD_REFERENCE := ''Add Bus. Fun.'';',
'   ELSE',
'      :P111326009501_WBFAHD_REFERENCE := ''Remove Bus. Fun.'';',
'   END IF;',
'END IF;          '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>467340920260451504
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5949256545732061599)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(5949246429841061543)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Access'
,p_static_id=>'initialize-form-user-access'
,p_internal_uid=>467294710188450571
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6034226069213332635)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_WBFAHD_ADD_TYPE = ''N'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT wbf_bus_fun_id,',
'   		   wbf_bus_fun_name,',
'   		   wbf_node_type',
'   	  FROM wapl_bus_fun --,',
'        --    business_vertical',
'   	 WHERE wbf_bus_fun_id NOT IN (SELECT wubfa_bus_fun_id',
'   		                            FROM wapl_user_bus_fun_accs',
'   		                           WHERE wubfa_bu    = :Global_bu',
'                                      AND wubfa_user_id   = :P111326009501_WBFAHD_USER_ID',
'   		                           UNION ALL',
'   		                          SELECT wbfaln_bus_fun_id',
'   				                     FROM wa_bu_fun_access_ln',
'   				                    WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   				                      AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_visible = ''Y''',
'        --  AND bv_bu = :GLOBAL_BU',
'        --  AND bv_vert_id = wbf_vertical_id',
'         AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'         AND wbf_std_vert_type = ''S''',
'    UNION',
'    SELECT wbf_bus_fun_id,',
'   		   wbf_bus_fun_name,',
'   		   wbf_node_type',
'   	  FROM wapl_bus_fun,',
'           business_vertical',
'   	 WHERE wbf_bus_fun_id NOT IN (SELECT wubfa_bus_fun_id',
'   		                            FROM wapl_user_bus_fun_accs',
'   		                           WHERE wubfa_bu    = :Global_bu',
'                                      AND wubfa_user_id   = :P111326009501_WBFAHD_USER_ID',
'   		                           UNION ALL',
'   		                          SELECT wbfaln_bus_fun_id',
'   				                     FROM wa_bu_fun_access_ln',
'   				                    WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   				                      AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_visible = ''Y''',
'         AND bv_bu = :GLOBAL_BU',
'         AND bv_vert_id = wbf_vertical_id',
'         AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'         AND wbf_std_vert_type = ''V'';',
'',
'   		 v_seq_no     VARCHAR2(5);                             ',
'   BEGIN	',
'   	DELETE ',
'   	  FROM wa_bu_fun_access_temp',
'   	 WHERE wbfat_bu      = :GLOBAL_bu',
'   	   AND wbfat_doc_no  = :P111326009501_WBFAHD_DOC_NO;',
'',
'      IF (:P111326009501_WBFAHD_FROM_USER_ID <> :P111326009501_WBFAHD_FROM_USER_ID1) OR ',
'          (:P111326009501_WBFAHD_FROM_USER_ID IS NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'          (:P111326009501_WBFAHD_FROM_USER_ID IS NOT NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'   	   DELETE',
'   		  FROM wa_bu_fun_access_ln',
'   		 WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   		   AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'',
'      END IF;',
'      COMMIT; ',
'      ',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	      SELECT NVL (MAX (TO_NUMBER (wbfat_seq_no)), 0) + 1',
'   	        INTO v_seq_no',
'   	        FROM wa_bu_fun_access_temp',
'   	       WHERE wbfat_bu     = :GLOBAL_bu',
'   	         AND wbfat_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'   	      ',
'   	      INSERT INTO wa_bu_fun_access_temp(wbfat_bu,',
'   	                                  	    wbfat_doc_no,',
'   	                                  	    wbfat_seq_no,',
'   	                                  	    wbfat_bus_fun_id,',
'   	                                  	    wbfat_bus_fun_name,',
'   	                                  	    wbfat_bus_fun_type,',
'   	                                  	    wbfat_date_from,',
'   	                                  	    wbfat_date_to,',
'   	                                  	    wbfat_cre_by,',
'   	                                  	    wbfat_cre_date,',
'   	                                  	    wbfat_sel_flag,',
'   	                                  	    wbfat_sel_user,',
'   	                                  	    wbfat_user_id)',
'      					                  VALUES(:GLOBAL_bu,',
'      						                      :P111326009501_WBFAHD_DOC_NO,',
'      						                      v_seq_no,',
'      						                      cr1.wbf_bus_fun_id,',
'      						                      cr1.wbf_bus_fun_name,',
'      						                      cr1.wbf_node_type,',
'      						                      TRUNC(SYSDATE),',
'      						                      TO_DATE(''31-DEC-2099''),',
'      						                      :GLOBAL_user,',
'      						                      SYSDATE,',
'      						                      ''N'',',
'      						                      :GLOBAL_user,',
'      						                      :P111326009501_WBFAHD_USER_ID);              ',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'',
'IF :P111326009501_WBFAHD_ADD_TYPE = ''C'' AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE	',
'		CURSOR c1',
'		IS',
'		SELECT wbf_bus_fun_id,',
'		       wbf_bus_fun_name ,',
'		       wbf_node_type',
'		  FROM wapl_bus_fun,',
'		       wapl_user_bus_fun_accs --,',
'            --    business_vertical',
'		 WHERE wubfa_bu        = :Global_bu',
'        --  AND bv_bu = wubfa_bu',
'        --  AND bv_vert_id = wbf_vertical_id',
'         AND wbf_bus_fun_id  = wubfa_bus_fun_id',
'		   AND wubfa_user_id   = :P111326009501_WBFAHD_FROM_USER_ID1',
'		   AND wbf_bus_fun_id NOT IN (SELECT wbfaln_bus_fun_id',
'         										FROM wa_bu_fun_access_ln',
'         									  WHERE wbfaln_bu 	 = :GLOBAL_bu',
'         									    AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_bus_fun_id NOT IN (SELECT wubfa_bus_fun_id',
'			         						  FROM wapl_user_bus_fun_accs',
'									          WHERE wubfa_bu   = :Global_bu',
'                                       AND wubfa_user_id = :P111326009501_WBFAHD_USER_ID)																	   ',
'		   AND wbf_visible = ''Y''',
'		   AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'           AND wbf_std_vert_type = ''S''',
'        UNION',
'        SELECT wbf_bus_fun_id,',
'		       wbf_bus_fun_name ,',
'		       wbf_node_type',
'		  FROM wapl_bus_fun,',
'		       wapl_user_bus_fun_accs,',
'               business_vertical ',
'		 WHERE wubfa_bu  = :Global_bu',
'         AND wbf_bus_fun_id  = wubfa_bus_fun_id',
'         AND bv_bu = wubfa_bu',
'         AND bv_vert_id = wbf_vertical_id',
'		   AND wubfa_user_id   = :P111326009501_WBFAHD_FROM_USER_ID1',
'		   AND wbf_bus_fun_id NOT IN (SELECT wbfaln_bus_fun_id',
'         										FROM wa_bu_fun_access_ln',
'         									  WHERE wbfaln_bu 	 = :GLOBAL_bu',
'         									    AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_bus_fun_id NOT IN (SELECT wubfa_bus_fun_id',
'			         						  FROM wapl_user_bus_fun_accs',
'									          WHERE wubfa_bu   = :Global_bu',
'                                       AND wubfa_user_id = :P111326009501_WBFAHD_USER_ID)																	   ',
'		   AND wbf_visible = ''Y''',
'		   AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'           AND wbf_std_vert_type = ''V'';',
'',
'		 v_seq_no     VARCHAR2(5);                             ',
'	BEGIN	',
'		DELETE ',
'		  FROM wa_bu_fun_access_temp',
'		 WHERE wbfat_bu     = :GLOBAL_bu',
'		   AND wbfat_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'',
'    IF (:P111326009501_WBFAHD_FROM_USER_ID <> :P111326009501_WBFAHD_FROM_USER_ID1) OR ',
'       (:P111326009501_WBFAHD_FROM_USER_ID IS NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'       (:P111326009501_WBFAHD_FROM_USER_ID IS NOT NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'	    DELETE',
'		  FROM wa_bu_fun_access_ln',
'		 WHERE wbfaln_bu 	 = :GLOBAL_bu',
'		   AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'',
'    END IF;',
'',
'	COMMIT;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		      SELECT NVL (MAX (TO_NUMBER (wbfat_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wa_bu_fun_access_temp',
'		       WHERE wbfat_bu     = :GLOBAL_bu',
'		         AND wbfat_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'		      ',
'		      INSERT INTO wa_bu_fun_access_temp(wbfat_bu,',
'		                                  		wbfat_doc_no,',
'		                                  		wbfat_seq_no,',
'		                                  		wbfat_bus_fun_id,',
'		                                  		wbfat_bus_fun_name,',
'		                                  		wbfat_bus_fun_type,',
'		                                  		wbfat_date_from,',
'		                                  		wbfat_date_to,',
'		                                  		wbfat_cre_by,',
'		                                  		wbfat_cre_date,',
'		                                  		wbfat_sel_flag,',
'		                                  		wbfat_sel_user,',
'		                                  		wbfat_user_id)',
'   							             VALUES(:GLOBAL_bu,',
'   							                    :P111326009501_WBFAHD_DOC_NO,',
'   							                    v_seq_no,',
'   							                    cr1.wbf_bus_fun_id,',
'   							                    cr1.wbf_bus_fun_name,',
'   							                    cr1.wbf_node_type,',
'   							                    TRUNC(SYSDATE),',
'   							                    TO_DATE(''31-DEC-2099''),',
'   							                    :GLOBAL_user,',
'   							                    SYSDATE,',
'   							                    ''N'',',
'   							                    :GLOBAL_user,',
'   							                    :P111326009501_WBFAHD_FROM_USER_ID);              ',
'   	END LOOP;',
'	END;  ',
'',
'END IF;	',
'',
'IF :P111326009501_WBFAHD_ADD_TYPE = ''M'' THEN',
'',
'   DECLARE	',
'   	CURSOR c1',
'   		IS',
'   	SELECT wbf_bus_fun_id,',
'   		   wbf_bus_fun_name,',
'   		   wbf_node_type',
'   	  FROM wapl_bus_fun --,',
'        --    business_vertical',
'   	 WHERE wbf_bus_fun_id  IN (SELECT wubfa_bus_fun_id',
'   		                            FROM wapl_user_bus_fun_accs',
'   		                           WHERE wubfa_bu    = :Global_bu',
'                                      AND wubfa_user_id   = :P111326009501_WBFAHD_USER_ID',
'   		                           UNION ALL',
'   		                          SELECT wbfaln_bus_fun_id',
'   				                     FROM wa_bu_fun_access_ln',
'   				                    WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   				                      AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_visible = ''Y''',
'        --  AND bv_bu = :GLOBAL_BU',
'        --  AND bv_vert_id = wbf_vertical_id',
'         AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'         AND wbf_std_vert_type = ''S''',
'    UNION',
'    SELECT wbf_bus_fun_id,',
'   		   wbf_bus_fun_name,',
'   		   wbf_node_type',
'   	  FROM wapl_bus_fun,',
'           business_vertical',
'   	 WHERE wbf_bus_fun_id  IN (SELECT wubfa_bus_fun_id',
'   		                            FROM wapl_user_bus_fun_accs',
'   		                           WHERE wubfa_bu    = :Global_bu',
'                                      AND wubfa_user_id   = :P111326009501_WBFAHD_USER_ID',
'   		                           UNION ALL',
'   		                          SELECT wbfaln_bus_fun_id',
'   				                     FROM wa_bu_fun_access_ln',
'   				                    WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   				                      AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO)',
'         AND wbf_visible = ''Y''',
'         AND bv_bu = :GLOBAL_BU',
'         AND bv_vert_id = wbf_vertical_id',
'         AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'',''MIG'')',
'         AND wbf_std_vert_type = ''V'';',
'',
'   		 v_seq_no     VARCHAR2(5);                             ',
'   BEGIN	',
'   	DELETE ',
'   	  FROM wa_bu_fun_access_temp',
'   	 WHERE wbfat_bu      = :GLOBAL_bu',
'   	   AND wbfat_doc_no  = :P111326009501_WBFAHD_DOC_NO;',
'',
'      IF (:P111326009501_WBFAHD_FROM_USER_ID <> :P111326009501_WBFAHD_FROM_USER_ID1) OR ',
'          (:P111326009501_WBFAHD_FROM_USER_ID IS NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NOT NULL) OR',
'          (:P111326009501_WBFAHD_FROM_USER_ID IS NOT NULL AND :P111326009501_WBFAHD_FROM_USER_ID1 IS NULL) THEN ',
'',
'   	   DELETE',
'   		  FROM wa_bu_fun_access_ln',
'   		 WHERE wbfaln_bu 	   = :GLOBAL_bu',
'   		   AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'',
'      END IF;',
'      COMMIT; ',
'      ',
'   	FOR cr1 IN c1',
'   	LOOP',
'   	      SELECT NVL (MAX (TO_NUMBER (wbfat_seq_no)), 0) + 1',
'   	        INTO v_seq_no',
'   	        FROM wa_bu_fun_access_temp',
'   	       WHERE wbfat_bu     = :GLOBAL_bu',
'   	         AND wbfat_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'   	      ',
'   	      INSERT INTO wa_bu_fun_access_temp(wbfat_bu,',
'   	                                  	    wbfat_doc_no,',
'   	                                  	    wbfat_seq_no,',
'   	                                  	    wbfat_bus_fun_id,',
'   	                                  	    wbfat_bus_fun_name,',
'   	                                  	    wbfat_bus_fun_type,',
'   	                                  	    wbfat_date_from,',
'   	                                  	    wbfat_date_to,',
'   	                                  	    wbfat_cre_by,',
'   	                                  	    wbfat_cre_date,',
'   	                                  	    wbfat_sel_flag,',
'   	                                  	    wbfat_sel_user,',
'   	                                  	    wbfat_user_id)',
'      					                  VALUES(:GLOBAL_bu,',
'      						                      :P111326009501_WBFAHD_DOC_NO,',
'      						                      v_seq_no,',
'      						                      cr1.wbf_bus_fun_id,',
'      						                      cr1.wbf_bus_fun_name,',
'      						                      cr1.wbf_node_type,',
'      						                      TRUNC(SYSDATE),',
'      						                      TO_DATE(''31-DEC-2099''),',
'      						                      :GLOBAL_user,',
'      						                      SYSDATE,',
'      						                      ''N'',',
'      						                      :GLOBAL_user,',
'      						                      :P111326009501_WBFAHD_USER_ID);              ',
'   	END LOOP;',
'',
'   END;  ',
'',
'END IF;',
'',
'',
'UPDATE WA_BU_FUN_ACCESS_HD',
'   SET WBFAHD_FROM_USER_ID    = :P111326009501_WBFAHD_FROM_USER_ID1,',
'       WBFAHD_UPD_BY          = :GLOBAL_USER,',
'       WBFAHD_UPD_DATE        = SYSDATE',
' WHERE WBFAHD_BU              = :GLOBAL_BU',
'   AND WBFAHD_DOC_NO          = :P111326009501_WBFAHD_DOC_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6648486086019911978)
,p_internal_uid=>552264233669721607
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5949307152324062576)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing'
,p_static_id=>'load-existing'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P111326009501_WBFAHD_TYPE = ''R'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT *',
'		  FROM wapl_user_bus_fun_accs,',
'		       wapl_bus_fun',
'		 WHERE wubfa_bu       = :Global_bu',
'         AND wubfa_user_id  = :P111326009501_WBFAHD_USER_ID',
'		   AND wbf_bus_fun_id = wubfa_bus_fun_id',
'		   AND wbf_visible    = ''Y'';',
'		   ',
'		cr1           c1%ROWTYPE;',
'		v_seq_no      VARCHAR2(5);',
'		v_res		  VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM wa_bu_fun_access_ln',
'		 WHERE wbfaln_bu      = :GLOBAL_bu',
'		   AND wbfaln_doc_no  = :P111326009501_WBFAHD_DOC_NO',
'		   AND wbfaln_user_id = :P111326009501_WBFAHD_USER_ID;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		     SELECT NVL (MAX (TO_NUMBER (wbfaln_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wa_bu_fun_access_ln',
'		       WHERE wbfaln_bu     = :GLOBAL_bu',
'		         AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'		    ',
'		     INSERT INTO wa_bu_fun_access_ln(wbfaln_bu,',
'		                                     wbfaln_doc_no,',
'		                                     wbfaln_seq_no,',
'		                                     wbfaln_bus_fun_id,',
'		                                     wbfaln_bus_fun_name,',
'		                                     wbfaln_date_from,',
'		                                     wbfaln_date_to,',
'		                                     wbfaln_cre_by,',
'		                                     wbfaln_cre_date,',
'		                                     wbfaln_user_id,',
'		                                     wbufaln_remov_type)',
'				                      VALUES(:GLOBAL_bu,',
'				                             :P111326009501_WBFAHD_DOC_NO,',
'				                             v_seq_no,',
'				                             cr1.wbf_bus_fun_id,',
'				                             cr1.wbf_bus_fun_name,',
'				                             cr1.wubfa_date_from,',
'				                             cr1.wubfa_date_to,',
'				                             :GLOBAL_USER,',
'				                             SYSDATE,',
'				                             :P111326009501_WBFAHD_USER_ID,',
'				                             ''N'');      ',
'				   v_res := ''Y'';',
'				           ',
'		 END LOOP;',
'        ',
'		IF v_res = ''Y'' THEN',
'           apex_application.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           apex_application.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'',
'	END; 	',
'',
'END IF;',
'',
'',
'IF :P111326009501_WBFAHD_TYPE = ''E'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT *',
'		  FROM wapl_user_bus_fun_accs,',
'		       wapl_bus_fun',
'		 WHERE wubfa_bu       = :Global_bu',
'         AND wubfa_user_id  = :P111326009501_WBFAHD_USER_ID',
'		   AND wbf_bus_fun_id = wubfa_bus_fun_id',
'		   AND wbf_visible    = ''Y'';',
'		   ',
'		cr1                 c1%ROWTYPE;',
'		v_seq_no            VARCHAR2(5);',
'		v_res		        VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM wa_bu_fun_access_ln',
'		 WHERE wbfaln_bu      = :GLOBAL_bu',
'		   AND wbfaln_doc_no  = :P111326009501_WBFAHD_DOC_NO',
'		   AND wbfaln_user_id = :P111326009501_WBFAHD_USER_ID;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		     SELECT NVL (MAX (TO_NUMBER (wbfaln_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wa_bu_fun_access_ln',
'		       WHERE wbfaln_bu     = :GLOBAL_bu',
'		         AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'		    ',
'		     INSERT INTO wa_bu_fun_access_ln(wbfaln_bu,',
'		                                     wbfaln_doc_no,',
'		                                     wbfaln_seq_no,',
'		                                     wbfaln_bus_fun_id,',
'		                                     wbfaln_bus_fun_name,',
'		                                     wbfaln_date_from,',
'		                                     wbfaln_date_to,',
'		                                     wbfaln_cre_by,',
'		                                     wbfaln_cre_date,',
'		                                     wbfaln_user_id)',
'				                      VALUES(:GLOBAL_bu,',
'				                             :P111326009501_WBFAHD_DOC_NO,',
'				                             v_seq_no,',
'				                             cr1.wbf_bus_fun_id,',
'				                             cr1.wbf_bus_fun_name,',
'				                             cr1.wubfa_date_from,',
'				                             cr1.wubfa_date_to,',
'				                             :GLOBAL_USER,',
'				                             SYSDATE,',
'				                             :P111326009501_WBFAHD_USER_ID);      ',
'				   v_res := ''Y'';',
'          ',
'		END LOOP;',
'',
'		IF v_res = ''Y'' THEN',
'           apex_application.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           apex_application.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'	',
'	END; 	',
'',
'END IF;',
'',
'IF :P111326009501_WBFAHD_TYPE = ''O'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT *',
'		  FROM wapl_user_bus_fun_accs,',
'		       wapl_bus_fun,wa_bu_fun_access_hd, wa_bu_fun_access_ln',
'		 WHERE wubfa_bu       = :Global_bu',
'           AND wubfa_user_id  = :P111326009501_WBFAHD_USER_ID',
'		   AND wbf_bus_fun_id = wubfa_bus_fun_id',
'		   AND wbf_visible    = ''Y''',
'           AND wbfahd_bu = wbfaln_bu',
'           AND wbfahd_doc_no = wbfaln_doc_no',
'           AND wbfahd_status = ''P''',
'           AND wbfahd_type = ''M''',
'           AND wbfahd_user_id = wbfaln_user_id',
'           AND wbfahd_bu = :global_bu',
'           AND WBFAHD_USER_ID = :global_user',
'           AND (TRUNC (SYSDATE) BETWEEN WBFAHD_EFF_FROM AND WBFAHD_EFF_TO)',
'           AND wbf_visible = ''Y''',
'           AND wbf_node_type IN (''SET'',''FRM'',''REP'',''RPT'');',
'		   ',
'		cr1                 c1%ROWTYPE;',
'		v_seq_no            VARCHAR2(5);',
'		v_res		        VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM wa_bu_fun_access_ln',
'		 WHERE wbfaln_bu      = :GLOBAL_bu',
'		   AND wbfaln_doc_no  = :P111326009501_WBFAHD_DOC_NO',
'		   AND wbfaln_user_id = :P111326009501_WBFAHD_USER_ID;',
'',
'		FOR cr1 IN c1',
'		LOOP',
'		     SELECT NVL (MAX (TO_NUMBER (wbfaln_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wa_bu_fun_access_ln',
'		       WHERE wbfaln_bu     = :GLOBAL_bu',
'		         AND wbfaln_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'		    ',
'		     INSERT INTO wa_bu_fun_access_ln(wbfaln_bu,',
'		                                     wbfaln_doc_no,',
'		                                     wbfaln_seq_no,',
'		                                     wbfaln_bus_fun_id,',
'		                                     wbfaln_bus_fun_name,',
'		                                     wbfaln_date_from,',
'		                                     wbfaln_date_to,',
'		                                     wbfaln_cre_by,',
'		                                     wbfaln_cre_date,',
'		                                     wbfaln_user_id)',
'				                      VALUES(:GLOBAL_bu,',
'				                             :P111326009501_WBFAHD_DOC_NO,',
'				                             v_seq_no,',
'				                             cr1.wbf_bus_fun_id,',
'				                             cr1.wbf_bus_fun_name,',
'				                             cr1.wubfa_date_from,',
'				                             cr1.wubfa_date_to,',
'				                             :GLOBAL_USER,',
'				                             SYSDATE,',
'				                             :P111326009501_WBFAHD_USER_ID);      ',
'				   v_res := ''Y'';',
'          ',
'		END LOOP;',
'',
'		IF v_res = ''Y'' THEN',
'           apex_application.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           apex_application.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'	',
'	END; 	',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5949306760449062572)
,p_internal_uid=>467345316780451548
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5812004360794008731)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res                    VARCHAR2(1);',
'    v_appr_msg                    VARCHAR2(1000);',
'    v_cnt		    			  NUMBER(5);',
'BEGIN',
'',
'  SELECT COUNT(*)',
'    INTO v_cnt',
'    FROM wa_bu_fun_access_ln',
'   WHERE wbfaln_bu       = :GLOBAL_bu',
'     AND wbfaln_doc_no   = :P111326009501_WBFAHD_DOC_NO',
'     AND ((:P111326009501_WBFAHD_TYPE IN (''A'',''C'') AND wbfaln_sel_flag = ''Y'')',
'           OR (:P111326009501_WBFAHD_TYPE IN (''R'') AND wbufaln_remov_type = ''Y'')  -- OR (:P111326009501_WBFAHD_TYPE IN (''R'',''E'') AND wbufaln_remov_type = ''Y'')',
'         );',
'',
'  /*IF v_cnt = 0 AND :P111326009501_WBFAHD_TYPE <> ''E'' THEN',
'  	RAISE_APPLICATION_ERROR(-20010,''Select the Bus. Fun.'');',
'  ELSE */',
'/*',
'    proc_self_wf_appr(:GLOBAL_bu,',
'                      ''WF_BUS_FUN_ACCS'',',
'                      :GLOBAL_user,',
'                      1,',
'                      v_appr_res,',
'                      v_appr_msg,',
'	                  p_plnt => NULL,',
'	                  p_doc_date => NULL,',
'	                  p_doc_pfx => NULL,',
'	                  p_doc_no => :P111326009501_WBFAHD_DOC_NO',
'	                );*/',
'',
'      if :P111326009501_WBFAHD_TYPE <> ''M'' THEN',
'       proc_ins_user_accs_dtl(:GLOBAL_bu,''WF_BUS_FUN_ACCS'',:P111326009501_WBFAHD_DOC_NO,:GLOBAL_user,v_appr_res);   ',
'',
'      else',
'',
'       UPDATE wa_bu_fun_access_hd',
'           SET wbfahd_status       = ''P'',',
'               wbfahd_upd_by       = :GLOBAL_user,',
'               wbfahd_upd_emp_id   = :global_emp_id,',
'               wbfahd_upd_date     = SYSDATE,',
'               wbfahd_appr_by      = :GLOBAL_user,',
'               wbfahd_appr_date    = SYSDATE',
'         WHERE wbfahd_bu           = :GLOBAL_bu',
'           AND wbfahd_doc_no       = :P111326009501_WBFAHD_DOC_NO;',
'',
'           v_appr_res := ''Y'';',
'      ',
'      end if;      ',
'   ',
' ----RAISE_APPLICATION_ERROR(-20999,v_appr_res||''~''||v_appr_msg||''~''||:P111326009501_WBFAHD_DOC_NO);',
'    IF v_appr_res = ''Y'' THEN',
'      ---- :P111326009501_WF_COUNT := ''WFM1091'';',
'        APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'       ',
'    ELSE',
'       RAISE_APPLICATION_ERROR(-20999,v_appr_res||''~''||v_appr_msg||''~''||:P111326009501_WBFAHD_DOC_NO);----:P111326009501_WF_COUNT  := ''WFM1090'';',
'    END IF;',
'      ',
'    COMMIT;',
'  ',
' ---- END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5812004444543008732)
,p_internal_uid=>330042525250397703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5949256980456061601)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5949246429841061543)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Access Insert'
,p_static_id=>'process-form-user-access-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5949255804869061593)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>467295144912450573
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6034226923223332643)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5949246429841061543)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Access Update'
,p_static_id=>'process-form-user-access-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5949255432563061593)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>552265087679721615
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5530934413083603443)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P111326009501_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P111326009501_WBFAHD_DOC_NO',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P111326009501_WF_NO;',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P111326009501_ROWID',
'  FROM wa_bu_fun_access_hd',
' WHERE wbfahd_bu     = :GLOBAL_bu',
'   AND wbfahd_doc_no = :P111326009501_WBFAHD_DOC_NO;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>48972577539992415
);
wwv_flow_imp.component_end;
end;
/
