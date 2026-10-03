prompt --application/pages/page_00158
begin
--   Manifest
--     PAGE: 00158
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
 p_id=>158
,p_name=>'Role Access'
,p_alias=>'ROLE-ACCESS'
,p_step_title=>'Role Access'
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
 p_id=>wwv_flow_imp.id(6850431893085724792)
,p_plug_name=>'Add Unit Access'
,p_static_id=>'add-unit-access'
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
 p_id=>wwv_flow_imp.id(5660483989556513627)
,p_plug_name=>'Button'
,p_static_id=>'button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>55
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6836677098957067472)
,p_plug_name=>'Roll_access_hd'
,p_static_id=>'roll-access-hd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>15
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WURAH_BU,',
'       WURAH_DOC_NO,',
'       WURAH_DOC_DATE,',
'       WURAH_REFERENCE,',
'       WURAH_CRE_BY,',
'       WURAH_CRE_DATE,',
'       WURAH_UPD_BY,',
'       WURAH_UPD_DATE,',
'       WURAH_USER_ID,',
'       WURAH_TYPE,',
'       WURAH_STATUS,',
'       WURAH_UPD_IP_ADDR,',
'       WURAH_UPD_OS_USER,',
'       WURAH_UPD_EMP_ID,',
'       WURAH_CRE_EMP_ID,',
'       WURAH_CRE_OS_USER,',
'       WURAH_CRE_IP_ADDR,',
'       WURAH_APPR_BY,',
'       WURAH_APPR_DATE,',
'       WURAH_FROM_USER_ID',
'  from WAPL_USER_ROLE_ACCESS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6835730405279841270)
,p_plug_name=>'Roll_access_ln'
,p_static_id=>'roll-access-ln'
,p_region_name=>'CLS_SID'
,p_region_template_options=>'#DEFAULT#:margin-top-lg'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>9
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WURAL_BU,',
'       WURAL_DOC_NO,',
'       WURAL_SEQ_NO,',
'       WURAL_DATE_FROM,',
'       WURAL_DATE_TO,',
'       WURAL_type,',
'       decode(WURAL_type,''A'',''Add'',''R'',''Remove'')type,',
'       WURAL_USER_ID,',
'       WURAL_SEL_FLAG,',
'       WURAL_SEL_USER,',
'       WURAL_CRE_BY,',
'       WURAL_CRE_DATE,',
'       WURAL_UPD_BY,',
'       WURAL_UPD_DATE,',
'       WURAL_ROLE_ID,',
'       WURAL_BENF_TYPE,',
'       WURAL_BENF_ID,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from WAPL_USER_ROLE_ACCESS_LN',
'  where WURAL_BU = :GLOBAL_BU',
'  and WURAL_DOC_NO = :P158_WURAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P158_WURAH_DOC_NO,P158_WURAH_USER_ID'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P158_WURAH_STATUS'
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
 p_id=>wwv_flow_imp.id(5660492225956517917)
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
 p_id=>wwv_flow_imp.id(5660492315594517918)
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
 p_id=>wwv_flow_imp.id(5694760741811594118)
,p_name=>'Delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''ig_line_calc'');'
,p_link_text=>'&"btn_delete".'
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
 p_id=>wwv_flow_imp.id(6845473364135676267)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5660484293454513630)
,p_name=>'WURAL_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Benf. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT process_name1, process_id',
'  FROM processes',
' WHERE process_bu = :global_bu AND :WURAL_BENF_TYPE = ''W''',
'UNION ALL',
'SELECT sa_area_desc1, sa_area',
'  FROM sales_areas',
' WHERE sa_bu = :global_bu AND :WURAL_BENF_TYPE = ''R''',
'UNION ALL',
'SELECT sat_terr_desc1, sat_terr_id',
'  FROM sales_area_terr',
' WHERE sat_bu = :global_bu AND :WURAL_BENF_TYPE = ''Z''',
'UNION ALL',
'SELECT sst_desc1, sst_sub_terr_id',
'  FROM sales_sub_terr',
' WHERE sst_bu = :global_bu AND :WURAL_BENF_TYPE = ''S'''))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'WURAL_BENF_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5660484217242513629)
,p_name=>'WURAL_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Work Centre;W,Sub Territory;S,Zone;Z,Region;R,N/A;N'
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
 p_id=>wwv_flow_imp.id(5660482748721513614)
,p_name=>'WURAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(5660483610217513623)
,p_name=>'WURAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_CRE_BY'
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
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5660483689905513624)
,p_name=>'WURAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(5660483056622513617)
,p_name=>'WURAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
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
 p_id=>wwv_flow_imp.id(5660483125957513618)
,p_name=>'WURAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
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
 p_id=>wwv_flow_imp.id(5660482837615513615)
,p_name=>'WURAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'ITEM'
,p_default_expression=>'P158_WURAH_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5660484156314513628)
,p_name=>'WURAL_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Role ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
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
 p_id=>wwv_flow_imp.id(5660483482435513621)
,p_name=>'WURAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5660483523357513622)
,p_name=>'WURAL_SEL_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEL_USER'
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
 p_id=>wwv_flow_imp.id(5660482949405513616)
,p_name=>'WURAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
 p_id=>wwv_flow_imp.id(5660483190936513619)
,p_name=>'WURAL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_TYPE'
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
 p_id=>wwv_flow_imp.id(5660483784377513625)
,p_name=>'WURAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(5660483970368513626)
,p_name=>'WURAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(5660483376190513620)
,p_name=>'WURAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_USER_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6835732405345841290)
,p_internal_uid=>1356211421560921088
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_imp.id(6838340471336866030)
,p_interactive_grid_id=>wwv_flow_imp.id(6835732405345841290)
,p_static_id=>'5803985'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6838340740438866033)
,p_report_id=>wwv_flow_imp.id(6838340471336866030)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660567645172534328)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5660482748721513614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660568523669534334)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5660482837615513615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660569467945534337)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5660482949405513616)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660570333652534341)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5660483056622513617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660571278576534344)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5660483125957513618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660572095204534347)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5660483190936513619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660573028802534348)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5660483376190513620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660573982950534352)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5660483482435513621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660574812347534353)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5660483523357513622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660575700331534356)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5660483610217513623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660576586291534358)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5660483689905513624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660577531699534361)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5660483784377513625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5660578473955534364)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5660483970368513626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5661035858549700689)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5660484156314513628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5661036755918700695)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5660484217242513629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5661037628976700698)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5660484293454513630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695363067750902147)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5694760741811594118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5701219646507707042)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(5660492225956517917)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6845479457421676662)
,p_view_id=>wwv_flow_imp.id(6838340740438866033)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6845473364135676267)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5694760927570594120)
,p_plug_name=>'Roll_access_ln_new'
,p_static_id=>'roll-access-ln-new'
,p_region_name=>'ig_line_a'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>45
,p_plug_grid_column_span=>9
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WURAL_BU,',
'       WURAL_DOC_NO,',
'       WURAL_SEQ_NO,',
'       WURAL_DATE_FROM,',
'       WURAL_DATE_TO,',
'       WURAL_type,',
'       decode(WURAL_type,''A'',''Add'',''R'',''Remove'')type,',
'       WURAL_USER_ID,',
'       WURAL_SEL_FLAG,',
'       WURAL_SEL_USER,',
'       WURAL_CRE_BY,',
'       WURAL_CRE_DATE,',
'       WURAL_UPD_BY,',
'       WURAL_UPD_DATE,',
'       WURAL_ROLE_ID,',
'       WURAL_BENF_TYPE,',
'       WURAL_BENF_ID,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from WAPL_USER_ROLE_ACCESS_LN',
'--   where WURAL_BU = :GLOBAL_BU',
'--   and WURAL_DOC_NO = :P158_WURAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(5694763032449594141)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694763089689594142)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762973091594140)
,p_name=>'Delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
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
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694761163838594122)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694761788995594129)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762853888594139)
,p_name=>'WURAL_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Benf. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT process_name1, process_id',
'  FROM processes',
' WHERE process_bu = :global_bu AND :WURAL_BENF_TYPE = ''W''',
'UNION ALL',
'SELECT sa_area_desc1, sa_area',
'  FROM sales_areas',
' WHERE sa_bu = :global_bu AND :WURAL_BENF_TYPE = ''R''',
'UNION ALL',
'SELECT sat_terr_desc1, sat_terr_id',
'  FROM sales_area_terr',
' WHERE sat_bu = :global_bu AND :WURAL_BENF_TYPE = ''Z''',
'UNION ALL',
'SELECT sst_desc1, sst_sub_terr_id',
'  FROM sales_sub_terr',
' WHERE sst_bu = :global_bu AND :WURAL_BENF_TYPE = ''S'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'WURAL_BENF_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762747754594138)
,p_name=>'WURAL_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Work Centre;W,Sub Territory;S,Zone ;Z,Region ;R,N/A;N'
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
 p_id=>wwv_flow_imp.id(5694761283233594123)
,p_name=>'WURAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762199127594133)
,p_name=>'WURAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762310390594134)
,p_name=>'WURAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694761577869594126)
,p_name=>'WURAL_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date From'
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
 p_id=>wwv_flow_imp.id(5694761668599594127)
,p_name=>'WURAL_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date To'
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
 p_id=>wwv_flow_imp.id(5694761287393594124)
,p_name=>'WURAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_DOC_NO'
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
 p_id=>wwv_flow_imp.id(5694762615285594137)
,p_name=>'WURAL_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Role ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ar_role_name,ar_role_id',
'  from APPL_ROLES',
' where AR_BU =:GLOBAL_bu'))
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
 p_id=>wwv_flow_imp.id(5694762019296594131)
,p_name=>'WURAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762167057594132)
,p_name=>'WURAL_SEL_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEL_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694761422143594125)
,p_name=>'WURAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(5694761766865594128)
,p_name=>'WURAL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762422453594135)
,p_name=>'WURAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694762536505594136)
,p_name=>'WURAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5694761961347594130)
,p_name=>'WURAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WURAL_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5694761055013594121)
,p_internal_uid=>215240071228673919
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No Data Found'
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
 p_id=>wwv_flow_imp.id(5699152428579840980)
,p_interactive_grid_id=>wwv_flow_imp.id(5694761055013594121)
,p_static_id=>'2196315'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5699152649749840981)
,p_report_id=>wwv_flow_imp.id(5699152428579840980)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699153141769840986)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5694761163838594122)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699153954387840991)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5694761283233594123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699154869566840994)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5694761287393594124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699155727159840997)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5694761422143594125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699156629972841000)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5694761577869594126)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699157493972841003)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5694761668599594127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699158479114841006)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5694761766865594128)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699159343367841008)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5694761788995594129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699160226107841011)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5694761961347594130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699161089224841014)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5694762019296594131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699162047789841017)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5694762167057594132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699162976622841019)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5694762199127594133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699163830340841022)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5694762310390594134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699164772804841025)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5694762422453594135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699165642358841028)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5694762536505594136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699166573230841030)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5694762615285594137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699167393441841033)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5694762747754594138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699168367870841036)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5694762853888594139)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699169262218841039)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(5694762973091594140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5699170168569841042)
,p_view_id=>wwv_flow_imp.id(5699152649749840981)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(5694763032449594141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660394681098493284)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:158::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694763531186594146)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5694760927570594120)
,p_button_name=>'Add_1'
,p_static_id=>'add-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694759218840594103)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_button_name=>'Add_R'
,p_static_id=>'add-r'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''CLS_SID'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660393416693493278)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=800:159:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P158_WF_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660394253881493284)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Back'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660396238018493286)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P158_WURAH_DOC_NO IS NOT NULL AND :P158_WURAH_STATUS = ''N'''
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660395430412493284)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P158_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694763614281594147)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5694760927570594120)
,p_button_name=>'Down_3'
,p_static_id=>'down'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694759453143594105)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_button_name=>'Download_R'
,p_static_id=>'download-r'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>'onclick="down_row(''CLS_SID'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660395871804493284)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Entry_Completed'
,p_static_id=>'entry-completed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT COUNT(*)',
'  FROM WAPL_USER_ROLE_ACCESS_LN',
' WHERE WURAL_BU=:global_bu',
'   AND WURAL_DOC_NO=:P158_WURAH_DOC_NO',
'   AND WURAL_user_id=:P158_WURAH_USER_ID',
'   AND :P158_WURAH_STATUS = ''N''  )>0'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660406896223493302)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
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
,p_button_condition=>':P158_WUPAH_TYPE IN (''A'',''C'') AND :P158_WUPAH_DOC_NO IS NOT NULL AND :P158_WUPAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660407360940493302)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_button_name=>'Load_Existing'
,p_static_id=>'load-existing'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P158_WUPAH_TYPE IN (''R'',''E'') AND :P158_WUPAH_DOC_NO IS NOT NULL AND :P158_WUPAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660425541191493320)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6850431893085724792)
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
 p_id=>wwv_flow_imp.id(5660425170626493320)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6850431893085724792)
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
 p_id=>wwv_flow_imp.id(5660396995247493286)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.::P211132016_SHOW_DATA:Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660395076472493284)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_ROLE_ACCESS_LN',
' WHERE WURAL_BU         = :Global_bu',
'   AND WURAL_DOC_NO     = :P158_WURAH_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM dual',
' WHERE :P158_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694763741568594148)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5694760927570594120)
,p_button_name=>'Save_1'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660407711313493303)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_button_name=>'Save'
,p_static_id=>'save-3'
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
'   AND WUPAL_DOC_NO     = :P158_WUPAH_DOC_NO',
'   AND :P158_WUPAH_STATUS = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5694759293187594104)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_button_name=>'Save_R'
,p_static_id=>'save-r'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save R'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''CLS_SID'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660396584944493286)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5660483989556513627)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5660441014604493361)
,p_branch_name=>'Go To Page 79'
,p_branch_action=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::P79_HD_DOC_NO,P79_USER_ID,P79_ROWID:&P158_WUPAH_DOC_NO.,&P158_WUPAH_USER_ID.,&P158_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5660406896223493302)
,p_branch_sequence=>60
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5660441438565493362)
,p_branch_name=>'workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_P_DOC_NO,P236131090_P_PAGE_ID:WF_UNIT_ACCS,&P158_WUPAH_DOC_NO.,83&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P158_WF_COUNT  = ''WFM1090'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5660441795519493362)
,p_branch_name=>'Self_Approve'
,p_branch_action=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.::P158_ROWID:&P158_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P158_WF_COUNT = ''WFM1091'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5660442238227493362)
,p_branch_name=>'Go To Page 79  OK'
,p_branch_action=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::P79_HD_DOC_NO,P79_USER_ID,P79_ROWID:&P158_WUPAH_DOC_NO.,&P158_WUPAH_USER_ID.,&P158_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5660425170626493320)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6264035838849072636)
,p_name=>'P158_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6835749583449841343)
,p_name=>'P158_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6264036021766072637)
,p_name=>'P158_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6835730405279841270)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6782092960361108278)
,p_name=>'P158_WF_COUNT'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6182927285906412049)
,p_name=>'P158_WF_NO'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6850465289271724870)
,p_name=>'P158_WUPAH_ADD_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6850431893085724792)
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
 p_id=>wwv_flow_imp.id(6850465417335724871)
,p_name=>'P158_WUPAH_FROM_USER_ID1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6850431893085724792)
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
'   AND appluser_id <> :P158_WUPAH_USER_ID ;'))
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(5660482458922513611)
,p_name=>'P158_WURAH_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660482547054513612)
,p_name=>'P158_WURAH_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538045441099098344)
,p_name=>'P158_WURAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WURAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538045841596098348)
,p_name=>'P158_WURAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WURAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538045918774098349)
,p_name=>'P158_WURAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WURAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660482150467513608)
,p_name=>'P158_WURAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660482316678513610)
,p_name=>'P158_WURAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660482249409513609)
,p_name=>'P158_WURAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538045662711098346)
,p_name=>'P158_WURAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WURAH_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
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
 p_id=>wwv_flow_imp.id(5538045563254098345)
,p_name=>'P158_WURAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_prompt=>'Doc. No.'
,p_source=>'WURAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>120
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
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
 p_id=>wwv_flow_imp.id(5660482592246513613)
,p_name=>'P158_WURAH_FROM_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_FROM_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538045714842098347)
,p_name=>'P158_WURAH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_prompt=>'Reference'
,p_source=>'WURAH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
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
 p_id=>wwv_flow_imp.id(5660481778306513604)
,p_name=>'P158_WURAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WURAH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Draft;N,Posted ;P,Cancelled;L'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660481613405513603)
,p_name=>'P158_WURAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source=>'WURAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add Role Access;A,Remove Role Access;R'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538046026214098350)
,p_name=>'P158_WURAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WURAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538046134779098351)
,p_name=>'P158_WURAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WURAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660482042684513607)
,p_name=>'P158_WURAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660481822590513605)
,p_name=>'P158_WURAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5660481975159513606)
,p_name=>'P158_WURAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_source=>'WURAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5538046241810098352)
,p_name=>'P158_WURAH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_item_source_plug_id=>wwv_flow_imp.id(6836677098957067472)
,p_prompt=>'User'
,p_source=>'WURAH_USER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d,',
'       appluser_id r',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P158_WURAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5660431027705493347)
,p_validation_name=>'FROM_USER_ID1'
,p_static_id=>'from-user-id'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
'/*',
'IF :P158_WUPAH_FROM_USER_ID1 IS NULL AND :P158_WUPAH_ADD_TYPE = ''C'' THEN',
'  RETURN (''User must be entered.'');',
'END IF;',
'',
'IF :P158_WUPAH_FROM_USER_ID1 IS NOT NULL THEN',
'',
'		DECLARE',
'			CURSOR c1',
'			    IS',
'			SELECT *',
'			  FROM appl_users',
'			 WHERE appluser_bu     = :Global_bu',
'			   AND appluser_status = ''A''',
'			   AND appluser_user_type <> ''O''',
'			   AND appluser_id     = :P158_WUPAH_FROM_USER_ID1;',
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
'    IF :P158_WUPAH_FROM_USER_ID1 = :P158_WUPAH_USER_ID AND :P158_WUPAH_ADD_TYPE = ''C'' THEN',
'    	 RETURN (''From and To User should not be same.'');',
'    END IF;',
'',
'END IF;',
'*/'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5660425170626493320)
,p_associated_item=>wwv_flow_imp.id(6850465417335724871)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5733413499283172207)
,p_tabular_form_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>70
,p_validation=>'WURAL_DATE_FROM'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Date from must be entered.'
,p_associated_column=>'WURAL_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5733413588164172208)
,p_tabular_form_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>80
,p_validation=>'WURAL_DATE_TO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Date to must be entered.'
,p_associated_column=>'WURAL_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5733413778329172209)
,p_tabular_form_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_validation_name=>'New_2'
,p_static_id=>'new-3'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WURAL_ROLE_ID IS NULL THEN',
'  RETURN ''Role ID must be entered.'';',
'END IF;',
'RETURN NULL;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WURAL_ROLE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5660490972300517904)
,p_validation_name=>'user'
,p_static_id=>'user'
,p_validation_sequence=>60
,p_validation=>'P158_WURAH_USER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'User must be entered.'
,p_associated_item=>wwv_flow_imp.id(5538046241810098352)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660491933623517914)
,p_name=>'Assign type'
,p_static_id=>'assign-type'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_triggering_element=>'WURAL_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660492017936517915)
,p_event_id=>wwv_flow_imp.id(5660491933623517914)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WURAL_BENF_TYPE',
  'items_to_submit', 'WURAL_ROLE_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WURAL_ROLE_ID = ''WCINC'' THEN ',
    '   :WURAL_BENF_TYPE := ''W'';',
    'ELSIF :WURAL_ROLE_ID = ''STR'' THEN ',
    '   :WURAL_BENF_TYPE := ''S'';',
    'ELSIF :WURAL_ROLE_ID = ''REG'' THEN ',
    '   :WURAL_BENF_TYPE := ''R'';',
    'ELSIF :WURAL_ROLE_ID = ''ZONE'' THEN ',
    '   :WURAL_BENF_TYPE := ''Z'';',
    'ELSE',
    '   :WURAL_BENF_TYPE := ''N'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660439494494493358)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_WUPAH_FROM_USER_ID'
,p_condition_element=>'P158_WUPAH_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660440534757493358)
,p_event_id=>wwv_flow_imp.id(5660439494494493358)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660439991671493358)
,p_event_id=>wwv_flow_imp.id(5660439494494493358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_WUPAH_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5694763318290594144)
,p_name=>'New_3'
,p_static_id=>'new'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(5694760927570594120)
,p_triggering_element=>'WURAL_ROLE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5694763412935594145)
,p_event_id=>wwv_flow_imp.id(5694763318290594144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WURAL_BENF_TYPE',
  'items_to_submit', 'WURAL_ROLE_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WURAL_ROLE_ID = ''WCINC'' THEN ',
    '   :WURAL_BENF_TYPE := ''W'';',
    'ELSIF :WURAL_ROLE_ID = ''STR'' THEN ',
    '   :WURAL_BENF_TYPE := ''S'';',
    'ELSIF :WURAL_ROLE_ID = ''REG'' THEN ',
    '   :WURAL_BENF_TYPE := ''R'';',
    'ELSIF :WURAL_ROLE_ID = ''ZONE'' THEN ',
    '   :WURAL_BENF_TYPE := ''Z'';',
    'ELSE',
    '   :WURAL_BENF_TYPE := ''N'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5694763837135594149)
,p_name=>'New_4'
,p_static_id=>'new-2'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5694763531186594146)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5694763963280594150)
,p_event_id=>wwv_flow_imp.id(5694763837135594149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_a" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5694764027627594151)
,p_name=>'New_5'
,p_static_id=>'new-3'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5694763741568594148)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5694764112195594152)
,p_event_id=>wwv_flow_imp.id(5694764027627594151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_a" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5700391389514426903)
,p_name=>'New_6'
,p_static_id=>'new-4'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5694763614281594147)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5700391538929426904)
,p_event_id=>wwv_flow_imp.id(5700391389514426903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_a" ).call( "getActions" ).lookup("show-download-dialog").action(); ')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660437266223493356)
,p_name=>'OPEN REG'
,p_static_id=>'open-reg'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660406896223493302)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660437763357493356)
,p_event_id=>wwv_flow_imp.id(5660437266223493356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6850431893085724792)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660436312120493356)
,p_name=>'P158_WUPAH_ADD_TYPE'
,p_static_id=>'p158-wupah-add-type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_WUPAH_ADD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660436862723493356)
,p_event_id=>wwv_flow_imp.id(5660436312120493356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660435458031493355)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660435943882493356)
,p_event_id=>wwv_flow_imp.id(5660435458031493355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660434491852493350)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660407711313493303)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660435041756493355)
,p_event_id=>wwv_flow_imp.id(5660434491852493350)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660438095099493356)
,p_name=>'WUPAH_ADD_TYPE'
,p_static_id=>'wupah-add-type'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P158_WUPAH_ADD_TYPE'
,p_condition_element=>'P158_WUPAH_ADD_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660439174895493358)
,p_event_id=>wwv_flow_imp.id(5660438095099493356)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660438632184493358)
,p_event_id=>wwv_flow_imp.id(5660438095099493356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P158_WUPAH_FROM_USER_ID1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660434174627493350)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' UPDATE wapl_user_role_access_hd',
'    SET wurah_status  		= ''L'',',
'        wurah_upd_by		= :Global_user,',
'        wurah_upd_ip_addr   = :Global_ip,',
'        wurah_upd_emp_id    = :Global_emp_id,',
'        wurah_upd_date      = SYSDATE',
'  WHERE wurah_bu     		= :Global_bu',
'    AND wurah_doc_no  	    = :P158_WURAH_DOC_NO;',
'',
'  COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5660396238018493286)
,p_internal_uid=>180913190842573148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660433771052493350)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete_Line'
,p_static_id=>'delete-line'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU=:global_bu',
'   AND WUPAL_DOC_NO =:P158_DOC_NO',
'   AND WUPAL_SEQ_NO =:P158_SEQ_NO;',
' COMMIT;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>180912787267573148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660432099392493347)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_No'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P158_ROWID IS NULL THEN',
'   ',
'   select (NVL(max(TO_NUMBER(WURAH_DOC_NO)),1000000000)) + 1 ',
'     into :P158_WURAH_DOC_NO',
'     from WAPL_USER_ROLE_ACCESS_HD',
'    where wurah_bu = :global_bu;',
'   ',
'   :P158_WURAH_DOC_DATE   := TRUNC(SYSDATE);',
'',
'   :P158_WURAH_CRE_BY        := :GLOBAL_USER;',
'   :P158_WURAH_CRE_IP_ADDR   := :GLOBAL_IP;',
'   :P158_WURAH_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P158_WURAH_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'',
'ELSE',
'   :P158_WURAH_UPD_BY        := :GLOBAL_USER;',
'   :P158_WURAH_UPD_IP_ADDR   := :GLOBAL_IP;',
'   :P158_WURAH_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P158_WURAH_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>180911115607573145
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660423624098493320)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6836677098957067472)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Plant_access_hd'
,p_static_id=>'initialize-form-plant-access-hd'
,p_internal_uid=>180902640313573118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5694763267524594143)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5694760927570594120)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'New - Save Interactive Grid Data'
,p_static_id=>'new-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5694763741568594148)
,p_process_when_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_internal_uid=>215242283739673941
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660433289712493348)
,p_process_sequence=>60
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
'    FROM wapl_user_role_access_ln',
'   WHERE wural_bu       =:GLOBAL_bu',
'     AND wural_doc_no   =:P158_WURAH_DOC_NO',
'     AND wural_sel_flag = ''Y'';',
'  ',
'  IF v_cnt = 0 THEN',
'  	 RAISE_APPLICATION_ERROR(-20010,''Select the Line.'');',
'  ELSE ',
'  ',
'    proc_ins_user_role_accs_dtl(:GLOBAL_bu,:P158_WURAH_DOC_NO,:GLOBAL_user,v_appr_res);',
'    IF v_appr_res = ''Y'' THEN',
'      ---- :P158_WF_COUNT := ''WFM1091'';',
'      ',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document Approved</span>''; ',
'    ELSE',
'      --- :P158_WF_COUNT  := ''WFM1090'';',
'      RAISE_APPLICATION_ERROR(-20010,:P158_WF_COUNT );',
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
,p_process_when_button_id=>wwv_flow_imp.id(5660395871804493284)
,p_internal_uid=>180912305927573146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660424068382493320)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6836677098957067472)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Roll_access_hd Insert'
,p_static_id=>'process-form-roll-access-hd-insert'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5660395430412493284)
,p_process_success_message=>'Document Created.'
,p_internal_uid=>180903084597573118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660424399681493320)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6836677098957067472)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Roll_access_hd Update'
,p_static_id=>'process-form-roll-access-hd-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5660395076472493284)
,p_process_success_message=>'Document Saved.'
,p_internal_uid=>180903415896573118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660492398621517919)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6835730405279841270)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Roll_access_ln - Save Interactive Grid Data'
,p_static_id=>'roll-access-ln-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :apex$ROW_STATUS = ''C'' THEN',
'     SELECT NVL(MAX(TO_NUMBER(wural_seq_no)), 0) + 1',
'       INTO :WURAL_SEQ_NO',
'       FROM wapl_user_role_access_ln',
'      WHERE wural_bu = :global_bu',
'        AND wural_doc_no = :P158_WURAH_DOC_NO;',
'',
'',
'     INSERT INTO wapl_user_role_access_ln (',
'         WURAL_BU,',
'         WURAL_DOC_NO,',
'         WURAL_USER_ID,',
'         WURAL_ROLE_ID,',
'         WURAL_BENF_TYPE,',
'         WURAL_BENF_ID,',
'         WURAL_DATE_FROM,',
'         WURAL_DATE_TO,',
'         WURAL_CRE_BY,',
'         WURAL_CRE_DATE,',
'         WURAL_TYPE,',
'         WURAL_SEQ_NO,',
'         WURAL_SEL_FLAG,',
'         WURAL_SEL_USER',
'     ) VALUES (',
'         :global_bu,',
'         :P158_WURAH_DOC_NO,',
'         :P158_WURAH_USER_ID,',
'         :WURAL_ROLE_ID,',
'         :WURAL_BENF_TYPE,',
'         :WURAL_BENF_ID,',
'         :WURAL_DATE_FROM,',
'         :WURAL_DATE_TO,',
'         :global_user,',
'         SYSDATE,',
'         :WURAL_TYPE,',
'         :WURAL_SEQ_NO,',
'         :WURAL_SEL_FLAG,',
'         :WURAL_SEL_USER',
'     );',
'',
'  ELSIF :apex$ROW_STATUS = ''U'' THEN',
'     UPDATE wapl_user_role_access_ln',
'        SET WURAL_DATE_FROM   = TO_DATE(:WURAL_DATE_FROM, ''DD-MM-RRRR''),',
'            WURAL_DATE_TO     = TO_DATE(:WURAL_DATE_TO, :GLOBAL_DATE_FORMAT),',
'            WURAL_SEL_FLAG    = :WURAL_SEL_FLAG,',
'            WURAL_TYPE        = :WURAL_TYPE,',
'            WURAL_SEL_USER    = CASE WHEN :WURAL_SEL_FLAG = ''Y'' THEN :global_user ELSE NULL ',
'                                END,',
'            WURAL_UPD_BY      = :global_user,',
'            WURAL_UPD_DATE    = SYSDATE',
'      WHERE WURAL_BU      = :global_bu',
'        AND WURAL_DOC_NO  = :P158_WURAH_DOC_NO',
'        AND WURAL_SEQ_NO  = :WURAL_SEQ_NO;',
'',
'  ELSIF :apex$ROW_STATUS = ''D'' THEN',
'     DELETE FROM wapl_user_role_access_ln',
'      WHERE WURAL_BU     = :global_bu',
'        AND WURAL_DOC_NO = :P158_WURAH_DOC_NO',
'        AND WURAL_SEQ_NO = :WURAL_SEQ_NO;',
'',
'     apex_application.g_print_success_message := ',
'         ''<span style="color:WHITE">Row deleted</span>'';',
'  END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>180971414836597717
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5660431696493493347)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WORKFOLW'
,p_static_id=>'workfolw'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P158_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P158_WUPAH_DOC_NO',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P158_WF_NO;',
'END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P158_ROWID',
'  FROM WAPL_USER_PLNT_ACCESS_HD',
' WHERE WUPAH_BU = :GLOBAL_bu',
'   AND WUPAH_DOC_NO = :P158_WUPAH_DOC_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>180910712708573145
);
wwv_flow_imp.component_end;
end;
/
