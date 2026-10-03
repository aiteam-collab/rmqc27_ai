prompt --application/pages/page_00083
begin
--   Manifest
--     PAGE: 00083
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
 p_id=>83
,p_name=>'Grant/Revoke Unit / Location Access'
,p_alias=>'UNIT-ACCESS-HD1'
,p_step_title=>'Grant/Revoke Unit /Location Access'
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
 p_id=>wwv_flow_imp.id(6669560030672151747)
,p_plug_name=>'Add Unit / Location  Access'
,p_static_id=>'add-unit-location-access'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>55
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6002037981231838943)
,p_plug_name=>'BACK_WF'
,p_static_id=>'back-wf'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>15
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P83_WF_NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6077301640727250349)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P83_WF_NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6655805236543494427)
,p_plug_name=>'Plant_access_hd'
,p_static_id=>'plant-access-hd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>15
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUPAH_BU,',
'       WUPAH_DOC_NO,',
'       WUPAH_DOC_DATE,',
'       WUPAH_REFERENCE,',
'       WUPAH_CRE_BY,',
'       WUPAH_CRE_DATE,',
'       WUPAH_UPD_BY,',
'       WUPAH_UPD_DATE,',
'       WUPAH_USER_ID,',
'       WUPAH_TYPE,',
'       WUPAH_STATUS,',
'       WUPAH_UPD_IP_ADDR,',
'       WUPAH_UPD_OS_USER,',
'       WUPAH_UPD_EMP_ID,',
'       WUPAH_CRE_EMP_ID,',
'       WUPAH_CRE_OS_USER,',
'       WUPAH_CRE_IP_ADDR,',
'       WUPAH_APPR_BY,',
'       WUPAH_APPR_DATE,',
'       WUPAH_FROM_USER_ID',
'  from WAPL_USER_PLNT_ACCESS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6654858542866268225)
,p_plug_name=>'Plant_access_ln'
,p_static_id=>'plant-access-ln'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#:margin-top-lg'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>45
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WUPAL_BU,',
'       WUPAL_DOC_NO,',
'       WUPAL_SEQ_NO,',
'       WUPAL_PLNT_ID,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wupal_bu',
'           AND bup_plant_id = wupal_plnt_id) wupal_plnt_desc,',
'       WUPAL_PLNT_LOC_ID,',
'       (select bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu = WUPAL_BU',
'       and bupld_loc_id = WUPAL_PLNT_LOC_ID)Loc_name,',
'       WUPAL_DATE_FROM,',
'       WUPAL_DATE_TO,',
'       wupal_type,',
'       decode(wupal_type,''A'',''Add'',''R'',''Remove'')type,',
'       WUPAL_USER_ID,',
'       WUPAL_SEL_FLAG,',
'       WUPAL_SEL_USER,',
'       ''<span aria-label="Delete"><span class="fa fa-trash" aria-hidden="true" style="color:red" title="Delete"></span></span>'' Delete1,',
'       WUPAL_CRE_BY,',
'      WUPAL_CRE_DATE,',
'       WUPAL_UPD_BY,',
'       WUPAL_UPD_DATE',
'  from WAPL_USER_PLNT_ACCESS_LN',
'  where WUPAL_BU = :GLOBAL_BU',
'  and WUPAL_DOC_NO = :P83_WUPAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P83_WUPAH_DOC_NO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P83_WUPAH_STATUS'
,p_plug_read_only_when2=>'N'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Plant_access_ln'
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
 p_id=>wwv_flow_imp.id(6654862227993268262)
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
 p_id=>wwv_flow_imp.id(6654862354305268263)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6083148843388499537)
,p_name=>'DELETE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P83_DOC_NO'',''&WUPAL_DOC_NO.''),$s(''P83_SEQ_NO'',''&WUPAL_SEQ_NO.'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_link_text=>'&DELETE.'
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
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P83_WUPAH_STATUS'
,p_display_condition2=>'N'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6664601716000103224)
,p_name=>'LOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOC_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6664601501722103222)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
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
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6654860659098268246)
,p_name=>'WUPAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_BU'
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
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6654861178584268251)
,p_name=>'WUPAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_CRE_BY'
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
 p_id=>wwv_flow_imp.id(6654861441913268254)
,p_name=>'WUPAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(6654860966373268249)
,p_name=>'WUPAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DATE_FROM'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6654861034178268250)
,p_name=>'WUPAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DATE_TO'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6654860726682268247)
,p_name=>'WUPAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6488221944208919934)
,p_name=>'WUPAL_PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>true
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6488221864659919933)
,p_name=>'WUPAL_PLNT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_PLNT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_imp.id(6654860862294268248)
,p_name=>'WUPAL_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_PLNT_LOC_ID'
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
,p_is_required=>false
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077304008904250372)
,p_name=>'WUPAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'<!--Wupal Sel Flag-->'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077304123384250373)
,p_name=>'WUPAL_SEL_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_SEL_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wupal Sel User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(6664263260107833323)
,p_name=>'WUPAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6664263130891833322)
,p_name=>'WUPAL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_TYPE'
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
 p_id=>wwv_flow_imp.id(6654861541765268255)
,p_name=>'WUPAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(6654861805208268258)
,p_name=>'WUPAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_UPD_DATE'
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
 p_id=>wwv_flow_imp.id(6077301885285250351)
,p_name=>'WUPAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUPAL_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wupal User Id'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6654860542932268245)
,p_internal_uid=>1172898707388657217
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No Data Found'
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
 p_id=>wwv_flow_imp.id(6657468608923292985)
,p_interactive_grid_id=>wwv_flow_imp.id(6654860542932268245)
,p_static_id=>'5803985'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6657468878025292988)
,p_report_id=>wwv_flow_imp.id(6657468608923292985)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481964995977628539)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6083148843388499537)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077070314094160032)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6654862354305268263)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>41
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077591890616492649)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6077301885285250351)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6082335694711849681)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6077304008904250372)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6082336545916849698)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6077304123384250373)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6518128687713909632)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6488221864659919933)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6518129628036909645)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6488221944208919934)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657469370701292996)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6654860659098268246)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657470212426293010)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6654860726682268247)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657471069567293021)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6654860862294268248)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657471998568293028)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6654860966373268249)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657472807631293036)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6654861034178268250)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657473702295293044)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6654861178584268251)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657476435399293066)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6654861441913268254)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657477332448293077)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6654861541765268255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657480076259293100)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6654861805208268258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6657752348525365636)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6654862227993268262)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6664269108844833702)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6664263130891833322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6664459167059012721)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6664263260107833323)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6664607595008103617)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6664601501722103222)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6664943024911310322)
,p_view_id=>wwv_flow_imp.id(6657468878025292988)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6664601716000103224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6083149104890499539)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:176:&SESSION.::&DEBUG.:83::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6002038117804838944)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6002037981231838943)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'Javascript:history.back();'
,p_button_condition=>'P83_WF_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077301763158250350)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Back'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6488224132256919955)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_condition=>':P83_WUPAH_DOC_NO IS NOT NULL AND :P83_WUPAH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077071226601160032)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_condition=>'P83_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077304304204250375)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Entry_Completed'
,p_static_id=>'entry-completed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU=:global_bu',
'   AND WUPAL_DOC_NO=:P83_WUPAH_DOC_NO',
'   AND WUPAL_user_id=:P83_WUPAH_USER_ID',
'   AND :P83_WUPAH_STATUS = ''N''  )>0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077071586922160034)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6654858542866268225)
,p_button_name=>'LOAD'
,p_static_id=>'load'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P83_WUPAH_TYPE IN (''A'',''C'') AND :P83_WUPAH_DOC_NO IS NOT NULL AND :P83_WUPAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077301975971250352)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6654858542866268225)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P83_WUPAH_TYPE IN (''R'',''E'') AND :P83_WUPAH_DOC_NO IS NOT NULL AND :P83_WUPAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6669560544657151753)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6669560030672151747)
,p_button_name=>'New_1'
,p_static_id=>'new'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&nbsp;'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6669560482980151752)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6669560030672151747)
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
 p_id=>wwv_flow_imp.id(7378368418167317731)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.::P211132016_SHOW_DATA,P211132016_SEARCH_TYPE,P211132016_REFIND:Y,&P83_SEARCH_TYPE.,Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077070784519160031)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM dual',
' WHERE :P83_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077087088060160112)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6654858542866268225)
,p_button_name=>'Save'
,p_static_id=>'save-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO',
'   AND :P83_WUPAH_STATUS = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7378368262305317730)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6077301640727250349)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6077302222661250354)
,p_branch_name=>'Go To Page 79'
,p_branch_action=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::P79_HD_DOC_NO,P79_USER_ID,P79_ROWID:&P83_WUPAH_DOC_NO.,&P83_WUPAH_USER_ID.,&P83_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6077071586922160034)
,p_branch_sequence=>60
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6601203031225530785)
,p_branch_name=>'workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_P_DOC_NO,P236131090_P_PAGE_ID:WF_UNIT_ACCS,&P83_WUPAH_DOC_NO.,83&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P83_WF_COUNT  = ''WFM1090'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6601203314458531449)
,p_branch_name=>'Self_Approve'
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ROWID:&P83_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P83_WF_COUNT = ''WFM1091'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6669561120449151758)
,p_branch_name=>'Go To Page 79  OK'
,p_branch_action=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::P79_HD_DOC_NO,P79_USER_ID,P79_ROWID:&P83_WUPAH_DOC_NO.,&P83_WUPAH_USER_ID.,&P83_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6669560482980151752)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6083148650027499535)
,p_name=>'P83_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6654858542866268225)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6654860197099268236)
,p_name=>'P83_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6388018384061381328)
,p_name=>'P83_SEARCH_TYPE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6083148832944499536)
,p_name=>'P83_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6654858542866268225)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6601203574010535171)
,p_name=>'P83_WF_COUNT'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6002037899555838942)
,p_name=>'P83_WF_NO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669560304046151750)
,p_name=>'P83_WUPAH_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6669560030672151747)
,p_item_default=>'N'
,p_prompt=>'Wupah Add Type'
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
 p_id=>wwv_flow_imp.id(6599964793378015645)
,p_name=>'P83_WUPAH_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964896171015646)
,p_name=>'P83_WUPAH_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655807385649494440)
,p_name=>'P83_WUPAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUPAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655808918005494457)
,p_name=>'P83_WUPAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655810107030494459)
,p_name=>'P83_WUPAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WUPAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964535401015642)
,p_name=>'P83_WUPAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964644058015644)
,p_name=>'P83_WUPAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964594179015643)
,p_name=>'P83_WUPAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655808186912494452)
,p_name=>'P83_WUPAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WUPAH_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P83_WUPAH_DOC_NO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655807754789494448)
,p_name=>'P83_WUPAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_prompt=>'Doc. No.'
,p_source=>'WUPAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>120
,p_tag_attributes=>'Readonly=readonly tabindex="-1" '
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
 p_id=>wwv_flow_imp.id(6657341545183645472)
,p_name=>'P83_WUPAH_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_prompt=>'Copy From  User'
,p_source=>'WUPAH_FROM_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT auba_user_id',
'  FROM appl_user_plant_access,',
'       appl_users',
' WHERE auba_bu     = appluser_bu',
'   AND appluser_id = auba_user_id',
'   AND appluser_bu = :Global_bu',
'   AND appluser_status = ''A''',
'   AND appluser_user_type <> ''O''',
'   AND appluser_id <> :P83_WUPAH_USER_ID'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P83_WUPAH_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>60
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'User',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669560432110151751)
,p_name=>'P83_WUPAH_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6669560030672151747)
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
'   AND appluser_user_type <> ''O''',
'   AND appluser_id <> :P83_WUPAH_USER_ID ;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P83_WUPAH_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
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
 p_id=>wwv_flow_imp.id(6655808565497494457)
,p_name=>'P83_WUPAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_prompt=>'Reference'
,p_source=>'WUPAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669017748492655239)
,p_name=>'P83_WUPAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WUPAH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P,Cancelled;L'
,p_cHeight=>1
,p_tag_attributes=>'tabindex="-1" '
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669017687113655238)
,p_name=>'P83_WUPAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'WUPAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Unit / Location  Access;A,Remove Unit / Location Access;R,Extend Duration;E'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655810557227494460)
,p_name=>'P83_WUPAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6655811725413494462)
,p_name=>'P83_WUPAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WUPAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964414553015641)
,p_name=>'P83_WUPAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964233368015639)
,p_name=>'P83_WUPAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599964271300015640)
,p_name=>'P83_WUPAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_source=>'WUPAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669017553086655237)
,p_name=>'P83_WUPAH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_item_source_plug_id=>wwv_flow_imp.id(6655805236543494427)
,p_prompt=>'User'
,p_source=>'WUPAH_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d,',
'       appluser_id r',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu',
' and APPLUSER_USER_TYPE =''E'''))
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P83_WUPAH_DOC_NO'))
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
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6669561007555151757)
,p_validation_name=>'FROM_USER_ID1'
,p_static_id=>'from-user-id'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_WUPAH_FROM_USER_ID1 IS NULL AND :P83_WUPAH_ADD_TYPE = ''C'' THEN',
'  RETURN (''User must be entered.'');',
'END IF;',
'',
'IF :P83_WUPAH_FROM_USER_ID1 IS NOT NULL THEN',
'',
'		DECLARE',
'			CURSOR c1',
'			    IS',
'			SELECT *',
'			  FROM appl_users',
'			 WHERE appluser_bu     = :Global_bu',
'			   AND appluser_status = ''A''',
'			   AND appluser_user_type <> ''O''',
'			   AND appluser_id     = :P83_WUPAH_FROM_USER_ID1;',
'',
'			   cr1				c1%ROWTYPE;',
'		BEGIN',
'			OPEN c1;',
'			FETCH c1 INTO cr1;',
'			  IF c1%NOTFOUND THEN',
'			  	 RETURN (''User not found.'');',
'			  END IF;',
'			CLOSE c1;',
'		END;',
'',
'    IF :P83_WUPAH_FROM_USER_ID1 = :P83_WUPAH_USER_ID AND :P83_WUPAH_ADD_TYPE = ''C'' THEN',
'    	 RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6669560482980151752)
,p_associated_item=>wwv_flow_imp.id(6669560432110151751)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6657342092455645477)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_WUPAH_FROM_USER_ID IS NULL AND :P83_WUPAH_TYPE = ''C'' THEN',
'    RETURN (''User must be entered.'');',
'END IF;',
'',
'IF :P83_WUPAH_FROM_USER_ID IS NOT NULL THEN',
'',
'		DECLARE',
'			CURSOR c1',
'			    IS',
'			SELECT *',
'			  FROM appl_users',
'			 WHERE appluser_bu     = :GLOBAL_bu',
'			   AND appluser_status = ''A''',
'			   AND appluser_user_type <> ''O''',
'			   AND appluser_id     = :P83_WUPAH_FROM_USER_ID;',
'			   ',
'			   cr1				c1%ROWTYPE;',
'		BEGIN',
'			OPEN c1;',
'			FETCH c1 INTO cr1;',
'			  IF c1%NOTFOUND THEN',
'			  	 RETURN (''User not found.'');',
'			  END IF;',
'			CLOSE c1;',
'		END;',
'   ',
'    IF :P83_WUPAH_FROM_USER_ID = :P83_WUPAH_USER_ID AND :P83_WUPAH_TYPE = ''C'' THEN',
'    	RETURN (''From and To User should not be same.'');',
'    END IF;',
'    ',
'END IF;		',
'			  	',
'			  	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_imp.id(6657341545183645472)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6748703432904633048)
,p_tabular_form_region_id=>wwv_flow_imp.id(6654858542866268225)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WUPAL_DATE_TO IS NULL THEN',
'  RETURN(''To From must be entered.'');',
'END IF;',
'',
'IF  to_date(:WUPAL_DATE_TO,''DD-MM-RRRR'') <  to_date(:WUPAL_DATE_FROM,''DD-MM-RRRR'') THEN',
'   RETURN(''To Date should be greater than From Date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUPAL_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6077088204041160126)
,p_validation_name=>'User'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>'P83_WUPAH_USER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'User must be entered.'
,p_associated_item=>wwv_flow_imp.id(6669017553086655237)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6971627594815328054)
,p_validation_name=>'WUPAH_REFERENCE'
,p_static_id=>'wupah-reference'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_WUPAH_REFERENCE IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6655808565497494457)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6748703331978633047)
,p_tabular_form_region_id=>wwv_flow_imp.id(6654858542866268225)
,p_validation_name=>'WUPAL_DATE_FROM'
,p_static_id=>'wupal-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF to_date(:WUPAL_DATE_FROM,''DD-MM-RRRR'') IS NULL THEN',
'  RETURN(''Date From must be entered.'');',
'END IF;',
'',
'IF  to_date(:WUPAL_DATE_FROM,''DD-MM-RRRR'') >  to_date(:WUPAL_DATE_TO,''DD-MM-RRRR'') THEN',
'   RETURN(''From Date should be less than To Date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WUPAL_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669561221301151759)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P83_WUPAH_FROM_USER_ID'
,p_condition_element=>'P83_WUPAH_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669561390749151761)
,p_event_id=>wwv_flow_imp.id(6669561221301151759)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669561318106151760)
,p_event_id=>wwv_flow_imp.id(6669561221301151759)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669560106341151748)
,p_name=>'OPEN REG'
,p_static_id=>'open-reg'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6077071586922160034)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669560174652151749)
,p_event_id=>wwv_flow_imp.id(6669560106341151748)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6669560030672151747)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7376054600822745544)
,p_name=>'P83_WUPAH_ADD_TYPE'
,p_static_id=>'p83-wupah-add-type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P83_WUPAH_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7376054693953745545)
,p_event_id=>wwv_flow_imp.id(7376054600822745544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6077304358720250376)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6654858542866268225)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6077304525354250377)
,p_event_id=>wwv_flow_imp.id(6077304358720250376)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6654858542866268225)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6077089308580160131)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6077087088060160112)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6077089818327160134)
,p_event_id=>wwv_flow_imp.id(6077089308580160131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6669560735468151754)
,p_name=>'WUPAH_ADD_TYPE'
,p_static_id=>'wupah-add-type'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P83_WUPAH_ADD_TYPE'
,p_condition_element=>'P83_WUPAH_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669560862931151756)
,p_event_id=>wwv_flow_imp.id(6669560735468151754)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6669560799214151755)
,p_event_id=>wwv_flow_imp.id(6669560735468151754)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P83_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6601207668954561207)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
' UPDATE wapl_user_plnt_access_hd',
'    SET wupah_status  		= ''L'',',
'        wupah_upd_by		= :Global_user,',
'        wupah_upd_ip_addr   = :Global_ip,',
'        wupah_upd_emp_id    = :Global_emp_id,',
'        wupah_upd_date      = SYSDATE',
'  WHERE wupah_bu     		= :Global_bu',
'    AND wupah_doc_no  	    = :P83_WUPAH_DOC_NO;',
'',
'  COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6488224132256919955)
,p_internal_uid=>1119245833410950179
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6083149010077499538)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete_Line'
,p_static_id=>'delete-line'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU=:global_bu',
'   AND WUPAL_DOC_NO =:P83_DOC_NO',
'   AND WUPAL_SEQ_NO =:P83_SEQ_NO;',
' COMMIT;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>601187174533888510
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077088525910160128)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_No'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_ROWID IS NULL THEN',
'   ',
'   select (NVL(max(TO_NUMBER(WUPAH_DOC_NO)),1000000000)) + 1 ',
'     into :P83_WUPAH_DOC_NO',
'     from WAPL_USER_PLNT_ACCESS_HD',
'    where wupah_bu = :global_bu;',
'   ',
'   :P83_WUPAH_DOC_DATE   := TRUNC(SYSDATE);',
'',
'   :P83_WUPAH_CRE_BY        := :GLOBAL_USER;',
'   :P83_WUPAH_CRE_IP_ADDR   := :GLOBAL_IP_ADDR;',
'   :P83_WUPAH_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P83_WUPAH_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'',
'ELSE',
'   :P83_WUPAH_UPD_BY        := :GLOBAL_USER;',
'   :P83_WUPAH_UPD_IP_ADDR   := :GLOBAL_IP_ADDR;',
'   :P83_WUPAH_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P83_WUPAH_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>595126690366549100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077079332099160070)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6655805236543494427)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Plant_access_hd'
,p_static_id=>'initialize-form-plant-access-hd'
,p_internal_uid=>595117496555549042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077302088538250353)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_WUPAH_ADD_TYPE = ''N'' THEN',
'		',
'	DECLARE',
'		CURSOR c1',
'			  IS',
'		SELECT *',
'		  FROM bus_unit_plants_loc_dtls',
'		 WHERE bupld_bu           = :GLOBAL_bu',
'	     AND bupld_actv_loc_flag = ''Y''',
'	     AND bupld_plnt||''-''||bupld_loc_id NOT IN (SELECT auba_plant||''-''||auba_plnt_loc_id',
'                                                    FROM appl_user_plant_access',
'                                                   WHERE auba_bu      = :GLOBAL_bu',
'                                                     AND auba_user_id = :P83_WUPAH_USER_ID',
'                                                   UNION ALL',
'                                                  SELECT wupal_plnt_id||''-''||wupal_plnt_loc_id',
'																	 FROM wapl_user_plnt_access_ln',
'																	WHERE wupal_bu     = :GLOBAL_bu',
'																	  AND wupal_doc_no = :P83_WUPAH_DOC_NO);',
'		',
'		   v_seq_no     VARCHAR2(5);                                ',
'		   v_cnt		    NUMBER(5);',
'	BEGIN',
'    ',
'     DELETE ',
'       FROM wa_bu_plnt_access_temp',
'	    WHERE wbpat_bu      = :GLOBAL_bu',
'	      AND wbpat_doc_no  = :P83_WUPAH_DOC_NO;',
'',
'     IF (:P83_WUPAH_USER_ID <> :P83_WUPAH_FROM_USER_ID1) OR ',
'     	  (:P83_WUPAH_USER_ID IS NULL AND :P83_WUPAH_FROM_USER_ID1 IS NOT NULL) OR',
'     	  (:P83_WUPAH_USER_ID IS NOT NULL AND :P83_WUPAH_FROM_USER_ID1 IS NULL) THEN ',
'',
'	     DELETE ',
'	       FROM wapl_user_plnt_access_ln',
'		    WHERE wupal_bu      = :GLOBAL_bu',
'		      AND wupal_doc_no  = :P83_WUPAH_DOC_NO;	      ',
'',
'     END IF;',
'',
'	   COMMIT;',
'',
'	   FOR cr1 IN c1',
'	   LOOP',
'	      SELECT NVL (MAX (TO_NUMBER (wbpat_seq_no)), 0) + 1',
'	        INTO v_seq_no',
'	        FROM wa_bu_plnt_access_temp',
'	       WHERE wbpat_bu     = :GLOBAL_bu',
'	         AND wbpat_doc_no = :P83_WUPAH_DOC_NO;',
'',
'	      INSERT INTO wa_bu_plnt_access_temp(wbpat_bu,',
'				                                wbpat_doc_no,',
'				                                wbpat_seq_no,',
'				                                wbpat_plnt_id,',
'				                                wbpat_plnt_loc_id,',
'				                                wbpat_date_from,',
'				                                wbpat_date_to,',
'				                                wbpat_cre_by,',
'				                                wbpat_cre_date,',
'				                                wbpat_sel_flag,',
'				                                wbpat_sel_user,',
'				                                wbpat_user_id)',
'							                VALUES(:GLOBAL_bu,',
'							                       :P83_WUPAH_DOC_NO,',
'							                       v_seq_no,',
'							                       cr1.bupld_plnt,',
'							                       cr1.bupld_loc_id,',
'							                       TRUNC(SYSDATE),',
'							                       TO_DATE (''31-DEC-2099''),',
'							                       :GLOBAL_user,',
'							                       SYSDATE,',
'							                       ''N'',',
'							                       :GLOBAL_user,',
'							                       :P83_WUPAH_USER_ID);              ',
'	   END LOOP;',
'	   COMMIT;',
'',
'	END; ',
'END IF;	',
'',
'IF :P83_WUPAH_ADD_TYPE = ''C'' AND :P83_WUPAH_FROM_USER_ID1 IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'			  IS',
'		SELECT auba_plant,',
'		       auba_deflt_flag, ',
'		       auba_plnt_loc_id',
'		  FROM appl_user_plant_access',
'       WHERE auba_bu      = :GLOBAL_bu',
'         AND auba_user_id = :P83_WUPAH_FROM_USER_ID1',
'	      AND auba_plant||''-''||auba_plnt_loc_id NOT IN (SELECT auba_plant||''-''||auba_plnt_loc_id',
'		                                                   FROM appl_user_plant_access',
'		                                                  WHERE auba_bu      = :GLOBAL_bu',
'		                                                    AND auba_user_id = :P83_WUPAH_USER_ID',
'		                                                  UNION ALL',
'		                                                 SELECT wupal_plnt_id||''-''||wupal_plnt_loc_id',
'																			FROM wapl_user_plnt_access_ln',
'																		  WHERE wupal_bu     = :GLOBAL_bu',
'																			 AND wupal_doc_no = :P83_WUPAH_DOC_NO);',
'',
'		   v_seq_no     VARCHAR2(5);                                ',
'		   v_cnt		    NUMBER(5);                               ',
'	BEGIN',
'',
'     DELETE ',
'       FROM wa_bu_plnt_access_temp',
'	    WHERE wbpat_bu      = :GLOBAL_bu',
'	      AND wbpat_doc_no  = :P83_WUPAH_DOC_NO;',
'',
'     IF (:P83_WUPAH_USER_ID <> :P83_WUPAH_FROM_USER_ID1) OR ',
'     	  (:P83_WUPAH_USER_ID IS NULL AND :P83_WUPAH_FROM_USER_ID1 IS NOT NULL) OR',
'     	  (:P83_WUPAH_USER_ID IS NOT NULL AND :P83_WUPAH_FROM_USER_ID1 IS NULL) THEN ',
'     	  ',
'		     DELETE ',
'		       FROM wapl_user_plnt_access_ln',
'			    WHERE wupal_bu      = :GLOBAL_bu',
'			      AND wupal_doc_no  = :P83_WUPAH_DOC_NO;		      ',
'	   ',
'     END IF;',
'     ',
'	  COMMIT;',
'  ',
'	   FOR cr1 IN c1',
'	   LOOP',
'	      SELECT NVL (MAX (TO_NUMBER (wbpat_seq_no)), 0) + 1',
'	        INTO v_seq_no',
'	        FROM wa_bu_plnt_access_temp',
'	       WHERE wbpat_bu     = :GLOBAL_bu',
'	         AND wbpat_doc_no = :P83_WUPAH_DOC_NO;',
'',
'	      INSERT INTO wa_bu_plnt_access_temp(wbpat_bu,',
'				                                wbpat_doc_no,',
'				                                wbpat_seq_no,',
'				                                wbpat_plnt_id,',
'				                                wbpat_plnt_loc_id,',
'				                                wbpat_date_from,',
'				                                wbpat_date_to,',
'				                                wbpat_cre_by,',
'				                                wbpat_cre_date,',
'				                                wbpat_sel_flag,',
'				                                wbpat_sel_user,',
'				                                wbpat_user_id)',
'							                VALUES(:GLOBAL_bu,',
'							                       :P83_WUPAH_DOC_NO,',
'							                       v_seq_no,',
'							                       cr1.auba_plant,',
'							                       cr1.auba_plnt_loc_id,',
'							                       TRUNC(SYSDATE),',
'							                       TO_DATE (''31-DEC-2099''),',
'							                       :GLOBAL_user,',
'							                       SYSDATE,',
'							                       ''N'',',
'							                       :GLOBAL_user,',
'							                       :P83_WUPAH_USER_ID);              ',
'	   END LOOP;',
'	   COMMIT;',
'',
' 		END;',
'END IF;	',
'',
'--:P83_WUPAH_FROM_USER_ID := :P83_WUPAH_FROM_USER_ID1;',
' UPDATE wapl_user_plnt_access_hd',
'    SET wupah_from_user_id  = :P83_WUPAH_FROM_USER_ID1,',
'        wupah_upd_by        = :Global_user,',
'        wupah_upd_date      = SYSDATE  ',
'  WHERE wupah_bu     		= :Global_bu',
'    AND wupah_doc_no  	    = :P83_WUPAH_DOC_NO;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6669560482980151752)
,p_internal_uid=>595340252994639325
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077088919532160128)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing'
,p_static_id=>'load-existing'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P83_WUPAH_TYPE = ''R'' THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT auba_plant,',
'		       auba_deflt_flag, ',
'		       auba_plnt_loc_id',
'		  FROM appl_user_plant_access',
'     WHERE auba_bu      = :GLOBAL_bu',
'       AND auba_user_id = :P83_WUPAH_USER_ID',
'     ORDER BY auba_plant;',
'		   ',
'		cr1               c1%ROWTYPE;',
'		v_seq_no          VARCHAR2(5);',
'		v_res		      VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM wapl_user_plnt_access_ln',
'		 WHERE wupal_bu      = :GLOBAL_bu',
'		   AND wupal_doc_no  = :P83_WUPAH_DOC_NO;',
'',
'	    COMMIT;',
'	   ',
'		FOR cr1 IN c1',
'		LOOP',
'		     SELECT NVL (MAX (TO_NUMBER (wupal_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wapl_user_plnt_access_ln',
'		       WHERE wupal_bu     = :GLOBAL_bu',
'		         AND wupal_doc_no = :P83_WUPAH_DOC_NO;',
'		    ',
'		     INSERT INTO wapl_user_plnt_access_ln(wupal_bu,',
'				                                  wupal_doc_no,',
'				                                  wupal_seq_no,',
'				                                  wupal_plnt_id,',
'				                                  wupal_plnt_loc_id,',
'				                                  wupal_date_from,',
'				                                  wupal_date_to,',
'				                                  wupal_type,',
'				                                  wupal_user_id,',
'				                                  wupal_sel_flag,',
'				                                  wupal_sel_user,',
'				                                  wupal_cre_by,',
'				                                  wupal_cre_date )',
'										  VALUES (:GLOBAL_bu,',
'						                          :P83_WUPAH_DOC_NO,',
'						                          v_seq_no,',
'						                          cr1.auba_plant,',
'						                          cr1.auba_plnt_loc_id,',
'						                          trunc(SYSDATE),',
'						                          TO_DATE (''31-12-2099'',:GLOBAL_DATE_FORMAT),',
'						                          ''R'',',
'						                          :P83_WUPAH_USER_ID,',
'						                          ''N'',',
'						                          :GLOBAL_USER,',
'						                          :GLOBAL_USER,',
'						                          SYSDATE);				   ',
'				v_res := ''Y'';				           ',
'		END LOOP;',
'		COMMIT;',
'',
'		IF v_res = ''Y'' THEN',
'           APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'',
'	END; 	',
'',
'END IF;',
'',
'IF :P83_WUPAH_TYPE = ''E'' THEN',
'',
'	DECLARE',
'		CURSOR c1',
'	     	IS',
'		SELECT auba_plant,',
'		       auba_deflt_flag, ',
'		       auba_plnt_loc_id',
'		  FROM appl_user_plant_access',
'     WHERE auba_bu      = :GLOBAL_bu',
'       AND auba_user_id = :P83_WUPAH_USER_ID',
'     ORDER BY auba_plant;',
'		   ',
'		cr1                 c1%ROWTYPE;',
'		v_seq_no            VARCHAR2(5);',
'		v_res		        VARCHAR2(1) := ''N'';',
'		',
'	BEGIN',
'		DELETE ',
'		  FROM wapl_user_plnt_access_ln',
'		 WHERE wupal_bu      = :GLOBAL_bu',
'		   AND wupal_doc_no  = :P83_WUPAH_DOC_NO;',
'',
'	    COMMIT;',
'	   ',
'		FOR cr1 IN c1',
'		LOOP',
'		     SELECT NVL (MAX (TO_NUMBER (wupal_seq_no)), 0) + 1',
'		        INTO v_seq_no',
'		        FROM wapl_user_plnt_access_ln',
'		       WHERE wupal_bu     = :GLOBAL_bu',
'		         AND wupal_doc_no = :P83_WUPAH_DOC_NO;',
'',
'		     INSERT INTO wapl_user_plnt_access_ln(wupal_bu,',
'				                                  wupal_doc_no,',
'				                                  wupal_seq_no,',
'				                                  wupal_plnt_id,',
'				                                  wupal_plnt_loc_id,',
'				                                  wupal_date_from,',
'				                                  wupal_date_to,',
'				                                  wupal_type,',
'				                                  wupal_user_id,',
'				                                  wupal_sel_flag,',
'				                                  wupal_sel_user,',
'				                                  wupal_cre_by,',
'				                                  wupal_cre_date)',
'										  VALUES (:GLOBAL_bu,',
'						                          :P83_WUPAH_DOC_NO,',
'						                          v_seq_no,',
'						                          cr1.auba_plant,',
'						                          cr1.auba_plnt_loc_id,',
'						                          trunc(SYSDATE),',
'						                          TO_DATE (''31-12-2099'',:GLOBAL_DATE_FORMAT),',
'						                          ''E'',',
'						                          :P83_WUPAH_USER_ID,',
'						                          ''N'',',
'						                          :GLOBAL_USER,',
'						                          :GLOBAL_USER,',
'						                          SYSDATE);				   ',
'				v_res := ''Y'';				           ',
'		END LOOP;',
'		COMMIT;',
'        IF v_res = ''Y'' THEN',
'           APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Loaded Successfully. </span>'';',
'		ELSE',
'           APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Not Loaded. </span>'';',
'		END IF;',
'',
'	END; 	',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6077301975971250352)
,p_internal_uid=>595127083988549100
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077087567438160113)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6654858542866268225)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Plant_access_ln - Save Interactive Grid Data'
,p_static_id=>'plant-access-ln-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS =''U'' THEN',
'   ',
'   UPDATE wapl_user_plnt_access_ln',
'      SET wupal_date_from       = TO_DATE(:WUPAL_DATE_FROM,''DD-MM-RRRR''),',
'          wupal_date_to         = TO_DATE(:WUPAL_DATE_TO,:GLOBAL_DATE_FORMAT),',
'          wupal_sel_flag        = :WUPAL_SEL_FLAG,---:APEX$ROW_SELECTOR,',
'          wupal_type            = :wupal_type,',
'          wupal_sel_user        = CASE WHEN :WUPAL_SEL_FLAG =''Y'' THEN :global_user ELSE NULL END,',
'          wupal_upd_by          = :global_user,',
'          wupal_upd_date        = sysdate',
'    where wupal_bu      = :global_bu',
'      and wupal_doc_no  = :P83_WUPAH_DOC_NO',
'      and wupal_seq_no  = :WUPAL_SEQ_NO;',
'      ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6077087088060160112)
,p_internal_uid=>595125731894549085
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077304169016250374)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Insert User Plant Access'
,p_static_id=>'process-for-insert-user-plant-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res                    VARCHAR2(1);',
'    v_appr_msg                    VARCHAR2(1000);',
'    v_cnt		    			  NUMBER(5);',
'BEGIN',
'',
'  SELECT COUNT(*)',
'    INTO v_cnt',
'    FROM wapl_user_plnt_access_ln',
'   WHERE wupal_bu       =:GLOBAL_bu',
'     AND wupal_doc_no   =:P83_WUPAH_DOC_NO',
'     AND wupal_sel_flag = ''Y'';',
'  ',
'  IF v_cnt = 0 AND :P83_WUPAH_TYPE <> ''E'' THEN',
'  	 RAISE_APPLICATION_ERROR(-20010,''Select the Unit.'');',
'  ELSE ',
'   /*',
'    proc_self_wf_appr(:GLOBAL_bu,',
'                      ''WF_UNIT_ACCS'',',
'                      :GLOBAL_user,',
'                      1,',
'                      v_appr_res,',
'                      v_appr_msg,',
'	                  p_plnt => NULL,',
'	                  p_doc_date => NULL,',
'	                  p_doc_pfx => NULL,',
'	                  p_doc_no => :P83_WUPAH_DOC_NO',
'	                );',
'    */',
'     proc_ins_user_accs_dtl(:GLOBAL_bu,''WF_UNIT_ACCS'',:P83_WUPAH_DOC_NO,:GLOBAL_user,v_appr_res);',
'    IF v_appr_res = ''Y'' THEN',
'      ---- :P83_WF_COUNT := ''WFM1091'';',
'      ',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'    ELSE',
'      --- :P83_WF_COUNT  := ''WFM1090'';',
'      RAISE_APPLICATION_ERROR(-20010,:P83_WF_COUNT );',
'    END IF;',
'      ',
'    COMMIT;',
'  ',
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
,p_process_when_button_id=>wwv_flow_imp.id(6077304304204250375)
,p_internal_uid=>595342333472639346
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077079669841160071)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6655805236543494427)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Plant_access_hd Insert'
,p_static_id=>'process-form-plant-access-hd-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6077071226601160032)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>595117834297549043
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077301515902250347)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6655805236543494427)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Plant_access_hd Update'
,p_static_id=>'process-form-plant-access-hd-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6077070784519160031)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>595339680358639319
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6002037808172838941)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WORKFOLW'
,p_static_id=>'workfolw'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P83_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P83_WUPAH_DOC_NO',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P83_WF_NO;',
'END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P83_ROWID',
'  FROM WAPL_USER_PLNT_ACCESS_HD',
' WHERE WUPAH_BU = :GLOBAL_bu',
'   AND WUPAH_DOC_NO = :P83_WUPAH_DOC_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>520075972629227913
);
wwv_flow_imp.component_end;
end;
/
