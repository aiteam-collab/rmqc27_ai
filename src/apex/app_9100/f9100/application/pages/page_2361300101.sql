prompt --application/pages/page_2361300101
begin
--   Manifest
--     PAGE: 2361300101
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
 p_id=>2361300101
,p_name=>'Workflow Activities / Authorization'
,p_alias=>'WORKFLOW-ACTIVITIES-AUTHORIZATION'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P2361300101_TITLE.");'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6619618694659847329)
,p_plug_name=>'Class and Subclass'
,p_static_id=>'class-and-subclass'
,p_region_name=>'sc'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAC_BU,',
'       WFAC_WF_ID,',
'       WFAC_SEQ_NO,',
'       WFAC_SUB_SEQ_NO,',
'       WFAC_CLS_SEQ_NO,',
'       WFAC_CLS_ID,',
'       WFAC_SUBCLS_ID,',
'       WFAC_CRE_BY,',
'       WFAC_CRE_IP_ADDR,',
'       WFAC_CRE_OS_USER,',
'       WFAC_CRE_DATE,',
'       WFAC_UPD_BY,',
'       WFAC_UPD_IP_ADDR,',
'       WFAC_UPD_OS_USER,',
'       WFAC_UPD_DATE,',
'       WFAC_CRE_EMP_ID,',
'       WFAC_UPD_EMP_ID',
'  from WF_AUTHORIZATION_CLASS',
' where WFAC_BU         = :Global_bu',
'   and WFAC_WF_ID      = :P2361300101_PFX_WF_ID',
'   and WFAC_SEQ_NO     = :P2361300101_PFX_SEQ_NO',
'   and WFAC_SUB_SEQ_NO = :P2361300101_PFX_SUBSEQ_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'SC'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Class and Subclass'
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
 p_id=>wwv_flow_imp.id(6619618892836847331)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619618980729847332)
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
 p_id=>wwv_flow_imp.id(6619620846006847351)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619619194880847334)
,p_name=>'WFAC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_BU'
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
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619619676542847339)
,p_name=>'WFAC_CLS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CLS_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Class'
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
  'title', 'Class')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6620307740819257070)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(6619619625554847338)
,p_name=>'WFAC_CLS_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CLS_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(6619619863070847341)
,p_name=>'WFAC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CRE_BY'
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
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619620164505847344)
,p_name=>'WFAC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(6619620642173847349)
,p_name=>'WFAC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6619619942692847342)
,p_name=>'WFAC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CRE_IP_ADDR'
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
,p_default_expression=>':Global_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619620082502847343)
,p_name=>'WFAC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619619339459847336)
,p_name=>'WFAC_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_SEQ_NO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(6619619834059847340)
,p_name=>'WFAC_SUBCLS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_SUBCLS_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Sub Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Class')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6620340583746274088)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(6619619485636847337)
,p_name=>'WFAC_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619620323056847345)
,p_name=>'WFAC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619620593931847348)
,p_name=>'WFAC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_UPD_DATE'
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
 p_id=>wwv_flow_imp.id(6619620779478847350)
,p_name=>'WFAC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6619620433708847346)
,p_name=>'WFAC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6619620521876847347)
,p_name=>'WFAC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6619619240682847335)
,p_name=>'WFAC_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAC_WF_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6619618752489847330)
,p_internal_uid=>1137656916946236302
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
 p_id=>wwv_flow_imp.id(6619657548481855923)
,p_interactive_grid_id=>wwv_flow_imp.id(6619618752489847330)
,p_static_id=>'11376958'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6619657762888855923)
,p_report_id=>wwv_flow_imp.id(6619657548481855923)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963072386611031)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6619618980729847332)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619658246332855929)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(6619618892836847331)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619659608182855953)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6619619194880847334)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619660478377855959)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6619619240682847335)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619661403199855963)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6619619339459847336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619662266458855970)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6619619485636847337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619663165813855978)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6619619625554847338)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619664071786855987)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6619619676542847339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619664955722855993)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6619619834059847340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619665893735855998)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6619619863070847341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619666636808856012)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6619619942692847342)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619667571285856018)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6619620082502847343)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619668515727856026)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6619620164505847344)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619669416242856032)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6619620323056847345)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619670283431856038)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6619620433708847346)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619671226990856049)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6619620521876847347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619672051427856056)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6619620593931847348)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619672971259856063)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6619620642173847349)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619673893663856070)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6619620779478847350)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6619674806394856074)
,p_view_id=>wwv_flow_imp.id(6619657762888855923)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6619620846006847351)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6612560736405959055)
,p_plug_name=>'Forward Mail'
,p_static_id=>'forward-mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WF_FORWARD_MESSAGE'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'FM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6607188686959966329)
,p_plug_name=>'Internal Message'
,p_static_id=>'internal-message'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WF_INTERNAL_MESSAGE'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'IM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6607192590322966368)
,p_plug_name=>'Mail'
,p_static_id=>'mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WF_MAIL_MESSAGE'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'MM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6610009122549732231)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5682159406340309472)
,p_plug_name=>'Notify Persons'
,p_static_id=>'notify-persons'
,p_region_name=>'NP'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFNP_BU,',
'       WFNP_WF_ID,',
'       WFNP_SEQ_NO,',
'       WFNP_EMP_ID,',
'       WFNP_MAIL_FLAG,',
'       WFNP_CRE_BY,',
'       WFNP_CRE_IP_ADDR,',
'       WFNP_CRE_OS_USER,',
'       WFNP_CRE_DATE,',
'       WFNP_UPD_BY,',
'       WFNP_UPD_IP_ADDR,',
'       WFNP_UPD_OS_USER,',
'       WFNP_UPD_DATE,',
'       WFNP_CRE_EMP_ID,',
'       WFNP_UPD_EMP_ID,',
'       WFNP_SMS_FLAG,',
'       WFNP_DOC_NO,',
'       WFNP_DOC_REV,',
'       WFNP_WHATSAPP_FLAG,',
'       ''<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'' "btn_delete"',
'  from WORK_FLOW_NOTIFY_PERSONS',
'  where WFNP_BU = :global_bu',
'  and WFNP_WF_ID   =:P2361300101_WORK_FLOW_ID',
'  AND WFNP_SEQ_NO   =:P2361300101_WORK_SEQ_NO',
'  AND WFNP_DOC_NO  =:P2361300101_WORK_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2361300101_WORK_FLOW_ID,P2361300101_WORK_SEQ_NO,P2361300101_WORK_DOC_NO'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'NP'
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
 p_id=>wwv_flow_imp.id(5695257495432352444)
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
 p_id=>wwv_flow_imp.id(5695257619325352445)
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
 p_id=>wwv_flow_imp.id(5682159579786309474)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5682159708226309475)
,p_name=>'WFNP_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695256099445352430)
,p_name=>'WFNP_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Cre By'
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
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695256412108352433)
,p_name=>'WFNP_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wfnp Cre Date'
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
 p_id=>wwv_flow_imp.id(5695256853220352438)
,p_name=>'WFNP_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Cre Emp Id'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695256215421352431)
,p_name=>'WFNP_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Cre Ip Addr'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695256290207352432)
,p_name=>'WFNP_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Cre Os User'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695257161400352441)
,p_name=>'WFNP_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Doc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
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
,p_default_expression=>'P2361300101_WORK_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695257285763352442)
,p_name=>'WFNP_DOC_REV'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_DOC_REV'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Wfnp Doc Rev'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(5682159957439309478)
,p_name=>'WFNP_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Employee'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6615441604631554756)
,p_lov_display_extra=>false
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
,p_default_type=>'ITEM'
,p_default_expression=>'P2361300101_WFNP_EMP_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695256026178352429)
,p_name=>'WFNP_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail'
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
 p_id=>wwv_flow_imp.id(5682159875595309477)
,p_name=>'WFNP_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Wfnp Seq No'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_default_type=>'ITEM'
,p_default_expression=>'P2361300101_WORK_SEQ_NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695257051441352440)
,p_name=>'WFNP_SMS_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_SMS_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'SMS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(5695256463352352434)
,p_name=>'WFNP_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(5695256767627352437)
,p_name=>'WFNP_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wfnp Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(5695257008377352439)
,p_name=>'WFNP_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(5695256569090352435)
,p_name=>'WFNP_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(5695256724947352436)
,p_name=>'WFNP_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(5682159766197309476)
,p_name=>'WFNP_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_WF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Wf Id'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P2361300101_WORK_FLOW_ID'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5695257432790352443)
,p_name=>'WFNP_WHATSAPP_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFNP_WHATSAPP_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfnp Whatsapp Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5693263669586983045)
,p_name=>'btn_delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'btn_delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:del_row(''NP'');'
,p_link_text=>'&"btn_delete".'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(5682159527316309473)
,p_internal_uid=>200197691772698445
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
 p_id=>wwv_flow_imp.id(5695263443626353765)
,p_interactive_grid_id=>wwv_flow_imp.id(5682159527316309473)
,p_static_id=>'2133017'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5695263645815353765)
,p_report_id=>wwv_flow_imp.id(5695263443626353765)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695264143994353768)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5682159579786309474)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695265042211353778)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5682159708226309475)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695266000475353784)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5682159766197309476)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695266912248353790)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5682159875595309477)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695267818300353795)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5682159957439309478)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695268672772353799)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5695256026178352429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695269621608353806)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5695256099445352430)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695270357123353810)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5695256215421352431)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695271281216353815)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5695256290207352432)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695272156971353820)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5695256412108352433)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695273049922353826)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5695256463352352434)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695273936460353831)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5695256569090352435)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695274871889353835)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5695256724947352436)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695275739031353842)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5695256767627352437)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695276704494353846)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5695256853220352438)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695277579270353851)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5695257008377352439)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695278435569353857)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5695257051441352440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695279359155353862)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5695257161400352441)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695280313830353867)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(5695257285763352442)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695281221444353871)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5695257432790352443)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695420214253436443)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(5695257495432352444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5695421063550436448)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(5695257619325352445)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5696412140350118210)
,p_view_id=>wwv_flow_imp.id(5695263645815353765)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(5693263669586983045)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6612562959882959077)
,p_plug_name=>'Notify Persons'
,p_static_id=>'notify-persons-2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WORK_FLOW_NOTIFY_PERSONS'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6614981848763441368)
,p_plug_name=>'PREFIX'
,p_static_id=>'prefix'
,p_region_name=>'pfx'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAP_BU,',
'       WFAP_WF_ID,',
'       WFAP_SEQ_NO,',
'       WFAP_SUB_SEQ_NO,',
'       WFAP_PFX_SEQ_NO,',
'       WFAP_PFX_ID,',
'       WFAP_CRE_BY,',
'       WFAP_CRE_EMP_ID,',
'       WFAP_CRE_IP_ADDR,',
'       WFAP_CRE_OS_USER,',
'       WFAP_CRE_DATE,',
'       WFAP_UPD_BY,',
'       WFAP_UPD_EMP_ID,',
'       WFAP_UPD_IP_ADDR,',
'       WFAP_UPD_OS_USER,',
'       WFAP_UPD_DATE',
'  from WF_AUTHORIZATION_PFX',
' WHERE WFAP_BU         = :Global_bu',
'   AND WFAP_WF_ID      = :P2361300101_PFX_WF_ID',
'   AND WFAP_SEQ_NO     = :P2361300101_PFX_SEQ_NO',
'   AND WFAP_SUB_SEQ_NO = :P2361300101_PFX_SUBSEQ_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'PFX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PREFIX'
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
 p_id=>wwv_flow_imp.id(6614982129557441370)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6614982223161441371)
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
 p_id=>wwv_flow_imp.id(6616152973338075039)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6614982434969441373)
,p_name=>'WFAP_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_BU'
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
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616151940291075029)
,p_name=>'WFAP_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152361008075033)
,p_name=>'WFAP_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(6616152063360075030)
,p_name=>'WFAP_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_CRE_EMP_ID'
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
,p_default_expression=>':Global_emp_id'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152224121075031)
,p_name=>'WFAP_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_CRE_IP_ADDR'
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
,p_default_expression=>':Global_ip_addr'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152256319075032)
,p_name=>'WFAP_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6614982912765441378)
,p_name=>'WFAP_PFX_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_PFX_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Prefix'
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
  'title', 'Prefix')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6617141975092745085)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(6614982759287441377)
,p_name=>'WFAP_PFX_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_PFX_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6614982571387441375)
,p_name=>'WFAP_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_SEQ_NO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(6614982651046441376)
,p_name=>'WFAP_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152531624075034)
,p_name=>'WFAP_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152884591075038)
,p_name=>'WFAP_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_UPD_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6616152595466075035)
,p_name=>'WFAP_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6616152636303075036)
,p_name=>'WFAP_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6616152756305075037)
,p_name=>'WFAP_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6614982486950441374)
,p_name=>'WFAP_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAP_WF_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6614981985167441369)
,p_internal_uid=>1133020149623830341
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
 p_id=>wwv_flow_imp.id(6616158457611076085)
,p_interactive_grid_id=>wwv_flow_imp.id(6614981985167441369)
,p_static_id=>'11341967'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6616158649435076085)
,p_report_id=>wwv_flow_imp.id(6616158457611076085)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963047839611033)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6614982223161441371)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616159220112076090)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(6614982129557441370)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616160521796076098)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6614982434969441373)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616161337183076104)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6614982486950441374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616162244951076124)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6614982571387441375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616163211275076128)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6614982651046441376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616163974515076132)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6614982759287441377)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616164878646076135)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6614982912765441378)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616165803281076140)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6616151940291075029)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616166697759076143)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6616152063360075030)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616167566128076148)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6616152224121075031)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616168501390076151)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6616152256319075032)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616169351133076154)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6616152361008075033)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616170263133076157)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6616152531624075034)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616171216566076162)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6616152595466075035)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616172100149076167)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6616152636303075036)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616172971205076170)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6616152756305075037)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616173921740076173)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6616152884591075038)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6616174824144076178)
,p_view_id=>wwv_flow_imp.id(6616158649435076085)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6616152973338075039)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6612558619636959033)
,p_plug_name=>'Return Mail'
,p_static_id=>'return-mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WF_RETURN_MESSAGE'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'RM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6619622676095847369)
,p_plug_name=>'Role'
,p_static_id=>'role'
,p_region_name=>'role'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAR_BU,',
'       WFAR_WF_TYPE,',
'       WFAR_ACT_SEQ_NO,',
'       WFAR_AUT_SEQ_NO,',
'       WFAR_SEQ_NO,',
'       WFAR_ROLE_ID,',
'       WFAR_CRE_BY,',
'       WFAR_CRE_IP_ADDR,',
'       WFAR_CRE_OS_USER,',
'       WFAR_CRE_DATE,',
'       WFAR_UPD_BY,',
'       WFAR_UPD_IP_ADDR,',
'       WFAR_UPD_OS_USER,',
'       WFAR_UPD_DATE,',
'       WFAR_CRE_EMP_ID,',
'       WFAR_UPD_EMP_ID',
'  from WORK_FLOW_AUTH_ROLE',
' where WFAR_BU         = :Global_bu',
'   and WFAR_WF_TYPE    = :P2361300101_PFX_WF_ID',
'   and WFAR_ACT_SEQ_NO = :P2361300101_PFX_SEQ_NO',
'   and WFAR_AUT_SEQ_NO = :P2361300101_PFX_SUBSEQ_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361300101_TYPE'
,p_plug_display_when_cond2=>'ROLE'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Role'
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
 p_id=>wwv_flow_imp.id(6619622923936847371)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619622944016847372)
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
 p_id=>wwv_flow_imp.id(6620538743683364240)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619623365142847376)
,p_name=>'WFAR_ACT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_ACT_SEQ_NO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(6619623507028847377)
,p_name=>'WFAR_AUT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_AUT_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6619623221991847374)
,p_name=>'WFAR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_BU'
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
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6620537820398364230)
,p_name=>'WFAR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6620538079157364233)
,p_name=>'WFAR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(6620538584607364238)
,p_name=>'WFAR_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6620537855080364231)
,p_name=>'WFAR_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6620537952179364232)
,p_name=>'WFAR_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6620537637084364229)
,p_name=>'WFAR_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_ROLE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Role'
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
  'title', 'Role')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6620642692313413843)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(6619623553413847378)
,p_name=>'WFAR_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(6620538185186364234)
,p_name=>'WFAR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6620538514886364237)
,p_name=>'WFAR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_UPD_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6620538638810364239)
,p_name=>'WFAR_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6620538262606364235)
,p_name=>'WFAR_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6620538395285364236)
,p_name=>'WFAR_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6619623247863847375)
,p_name=>'WFAR_WF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAR_WF_TYPE'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6619622758665847370)
,p_internal_uid=>1137660923122236342
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
 p_id=>wwv_flow_imp.id(6620544187540364656)
,p_interactive_grid_id=>wwv_flow_imp.id(6619622758665847370)
,p_static_id=>'11385824'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6620544373919364656)
,p_report_id=>wwv_flow_imp.id(6620544187540364656)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963086606611034)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6619622944016847372)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620544840440364659)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(6619622923936847371)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620546142858364668)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6619623221991847374)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620547099968364674)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6619623247863847375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620548002435364679)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6619623365142847376)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620548931801364685)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6619623507028847377)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620549727941364690)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6619623553413847378)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620550554949364696)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6620537637084364229)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620551528055364703)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6620537820398364230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620552434249364709)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6620537855080364231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620553254691364715)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6620537952179364232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620554225036364721)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6620538079157364233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620555089693364728)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6620538185186364234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620556028169364734)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6620538262606364235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620556864445364740)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6620538395285364236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620557790535364746)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6620538514886364237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620558663405364753)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6620538584607364238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620559597533364757)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6620538638810364239)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6620560458105364765)
,p_view_id=>wwv_flow_imp.id(6620544373919364656)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6620538743683364240)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7623614156215477091)
,p_plug_name=>'Workflow Activities'
,p_static_id=>'workflow-activities'
,p_region_name=>'act'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAA_BU,',
'       WFAA_WF_ID,',
'       WFAA_SEQ_NO,',
'       WFAA_DESC,',
'       WFAA_STATUS,',
'       WFAA_STATUS_DESC,',
'       WFAA_HOUR,',
'       WFAA_STATUS_DESC2,',
'       WFAA_PRINT_SEQ_NO,',
'       WFAA_MSG_TO,',
'       WFAA_HIER_TYPE,',
'       WFAA_CRE_BY,',
'       WFAA_CRE_IP_ADDR,',
'       WFAA_CRE_OS_USER,',
'       WFAA_CRE_DATE,',
'       WFAA_UPD_BY,',
'       WFAA_UPD_IP_ADDR,',
'       WFAA_UPD_OS_USER,',
'       WFAA_UPD_DATE,',
'       WFAA_CRE_EMP_ID,',
'       WFAA_UPD_EMP_ID,',
'       WFAA_IM_FLAG,',
'       WFAA_MAIL_FLAG,',
'       WFAA_SMS_FLAG,',
'       WFAA_SMS_TEMPLATE_ID,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">I</span>'' I ,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">M</span>'' M,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">R</span>'' R, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">F</span>'' F, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">NP</span>''NP',
'  from WORK_FLOW_APPR_ACTVT',
' where WFAA_BU =:Global_bu',
'   and WFAA_WF_ID = ''WF_PRA''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Workflow Activities'
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
 p_id=>wwv_flow_imp.id(7623616047331477097)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623615468540477096)
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
 p_id=>wwv_flow_imp.id(7631255825704124214)
,p_name=>'F'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'F'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631255471647124211)
,p_name=>'I'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'I'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631255575091124212)
,p_name=>'M'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'M'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631255935972124215)
,p_name=>'NP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631255745427124213)
,p_name=>'R'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'R'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623617029489477099)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623617962379477103)
,p_name=>'WFAA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_BU'
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
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623629048459477125)
,p_name=>'WFAA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_BY'
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
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623632044829477130)
,p_name=>'WFAA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623636975183477136)
,p_name=>'WFAA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7623629988432477127)
,p_name=>'WFAA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7623631047401477128)
,p_name=>'WFAA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(7623620988651477110)
,p_name=>'WFAA_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Process Desc.'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623627955070477124)
,p_name=>'WFAA_HIER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HIER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Hierarchical Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Emp. Hierarchy;E,Organization Chart ;O,User Defined;U'
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
,p_default_expression=>'E'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623623993855477116)
,p_name=>'WFAA_HOUR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HOUR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hours'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623638963368477147)
,p_name=>'WFAA_IM_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_IM_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'IM'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
 p_id=>wwv_flow_imp.id(7623639972237477149)
,p_name=>'WFAA_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
 p_id=>wwv_flow_imp.id(7623627025630477122)
,p_name=>'WFAA_MSG_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MSG_TO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Notify To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Creator;C,Receiver;R,All;A'
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
,p_default_expression=>'A'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623626010305477121)
,p_name=>'WFAA_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_PRINT_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(7623619959435477108)
,p_name=>'WFAA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(7623640959289477150)
,p_name=>'WFAA_SMS_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'SMS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
 p_id=>wwv_flow_imp.id(7623642031370477153)
,p_name=>'WFAA_SMS_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_TEMPLATE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'SMS Template ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'SMS Template')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT satc_template_id,',
'       satc_template_id b',
'  FROM sms_api_template_config,',
'       sms_api_param_config',
' WHERE satc_template_id = sapc_template_no',
'   AND sapc_bu = :GLOBAL_bu',
'   AND sapc_wf_type = :P2361300101_WF_BUS_PROC_ID'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
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
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623621982895477111)
,p_name=>'WFAA_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(7623622981781477114)
,p_name=>'WFAA_STATUS_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Code Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_SEQ_NO,P2361300101_WF_TYPE:&WFAA_SEQ_NO.,&WFAA_WF_ID.'
,p_link_text=>'&WFAA_STATUS_DESC.'
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
 p_id=>wwv_flow_imp.id(7623624976288477117)
,p_name=>'WFAA_STATUS_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC2'
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
 p_id=>wwv_flow_imp.id(7623632955590477130)
,p_name=>'WFAA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_BY'
,p_data_type=>'VARCHAR2'
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
,p_default_expression=>':Global_User'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7623636029328477135)
,p_name=>'WFAA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(7623638024485477146)
,p_name=>'WFAA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(7623634024889477132)
,p_name=>'WFAA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(7623634984270477133)
,p_name=>'WFAA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(7623618972725477105)
,p_name=>'WFAA_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_WF_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7623614658603477094)
,p_internal_uid=>2141652823059866066
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
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7623615096240477096)
,p_interactive_grid_id=>wwv_flow_imp.id(7623614658603477094)
,p_static_id=>'10418643'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7623615279077477096)
,p_report_id=>wwv_flow_imp.id(7623615096240477096)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6581752042326069517)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7623615468540477096)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623616438851477097)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7623616047331477097)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623617395933477099)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7623617029489477099)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623618435277477105)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7623617962379477103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623619392225477107)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7623618972725477105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623620369124477108)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7623619959435477108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623621377384477110)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7623620988651477110)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111.3438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623622356424477111)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7623621982895477111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623623355816477114)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7623622981781477114)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623624368271477117)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7623623993855477116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623625358258477119)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7623624976288477117)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623626396668477121)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7623626010305477121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623627444302477122)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7623627025630477122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86.3438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623628406813477124)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7623627955070477124)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623629406193477125)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7623629048459477125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623630409571477127)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7623629988432477127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623631420190477128)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7623631047401477128)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623632419269477130)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7623632044829477130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623633404686477132)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7623632955590477130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623634406741477132)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7623634024889477132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623635423467477135)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7623634984270477133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623636390047477136)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7623636029328477135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623637426150477144)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7623636975183477136)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623638422322477147)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7623638024485477146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623639383941477149)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7623638963368477147)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623640423778477149)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7623639972237477149)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623641426940477152)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7623640959289477150)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7623642428028477153)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7623642031370477153)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113.3438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631650734480339780)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(7631255471647124211)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631651566842339785)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(7631255575091124212)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631652466902339791)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(7631255745427124213)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631653372950339797)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(7631255825704124214)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631654186610339802)
,p_view_id=>wwv_flow_imp.id(7623615279077477096)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(7631255935972124215)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7631255961058124216)
,p_plug_name=>'Workflow_Auth'
,p_static_id=>'workflow-auth'
,p_region_name=>'auth'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFDA_BU,',
'       WFDA_TYPE,',
'       WFDA_POSITION,',
'		 ''pos_desc'',',
'		 ''emp_desc'',',
'		 ''dept_id'',',
'		 ''dept_desc'',',
'		 ''position'',',
'       WFDA_DATE_FROM,',
'       WFDA_DATE_TO,',
'       WFDA_SEQ_NO,',
'       WFDA_VALUE,',
'       WFDA_AOD_FLAG,',
'       WFDA_MOBILE_NO,',
'       WFDA_PLNT,',
'       WFDA_SUB_SEQ_NO,',
'       WFDA_APPR_BU,',
'       WFDA_DISC_PCT,',
'       WFDA_DFLT_FLAG,',
'       WFDA_CRE_BY,',
'       WFDA_CRE_IP_ADDR,',
'       WFDA_CRE_OS_USER,',
'       WFDA_CRE_DATE,',
'       WFDA_UPD_BY,',
'       WFDA_UPD_IP_ADDR,',
'       WFDA_UPD_OS_USER,',
'       WFDA_UPD_DATE,',
'       WFDA_CRE_EMP_ID,',
'       WFDA_UPD_EMP_ID,',
'       WFDA_MAIL_OPT_FLAG,',
'       WFDA_SENDER_MAIL,',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">Pfx.</span>'' pfx, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">CS</span>''cs, ',
'		 ''<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">RL</span>''rl',
'  from WF_DIRECT_AUTHORIZATION',
' where WFDA_BU = :Global_bu',
'--	and wfda_type = :P2361300101_WF_TYPE   ',
'   and wfda_type = ''WF_CUSTA''',
'	and wfda_seq_no = :P2361300101_SEQ_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Workflow_Auth'
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
 p_id=>wwv_flow_imp.id(7632057916647481424)
,p_name=>'''DEPT_DESC'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''DEPT_DESC'''
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632057769763481423)
,p_name=>'''DEPT_ID'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''DEPT_ID'''
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632057653343481422)
,p_name=>'''EMP_DESC'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''EMP_DESC'''
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632057957554481425)
,p_name=>'''POSITION'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''POSITION'''
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632057626160481421)
,p_name=>'''POS_DESC'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''POS_DESC'''
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631259916655124255)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631259983275124256)
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
 p_id=>wwv_flow_imp.id(7632058454163481430)
,p_name=>'CS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Cs'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632058441548481429)
,p_name=>'PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Pfx'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7632058630498481431)
,p_name=>'RL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Rl'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631258789571124244)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631256948001124225)
,p_name=>'WFDA_AOD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_AOD_FLAG'
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
 p_id=>wwv_flow_imp.id(7631257349660124229)
,p_name=>'WFDA_APPR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_APPR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Entity')).to_clob
,p_is_required=>true
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581793269360069601)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(7631256234932124218)
,p_name=>'WFDA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631257602555124232)
,p_name=>'WFDA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_BY'
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
 p_id=>wwv_flow_imp.id(7631257924323124235)
,p_name=>'WFDA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(7631258360510124240)
,p_name=>'WFDA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7631257667060124233)
,p_name=>'WFDA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7631257792726124234)
,p_name=>'WFDA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(7631256531386124221)
,p_name=>'WFDA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_FROM'
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
,p_is_required=>true
,p_max_length=>9
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
 p_id=>wwv_flow_imp.id(7631256604366124222)
,p_name=>'WFDA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_TO'
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
 p_id=>wwv_flow_imp.id(7631257499739124231)
,p_name=>'WFDA_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631257427648124230)
,p_name=>'WFDA_DISC_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DISC_PCT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Disc. Pct.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(7631258564677124242)
,p_name=>'WFDA_MAIL_OPT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MAIL_OPT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631257034636124226)
,p_name=>'WFDA_MOBILE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MOBILE_NO'
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
 p_id=>wwv_flow_imp.id(7631257054040124227)
,p_name=>'WFDA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7631256363412124220)
,p_name=>'WFDA_POSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_POSITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp. / Pos.'
,p_heading_alignment=>'LEFT'
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
  'title', 'Employee / Position',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581794790389069604)
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
 p_id=>wwv_flow_imp.id(7631258706113124243)
,p_name=>'WFDA_SENDER_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SENDER_MAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sender Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(7631256741484124223)
,p_name=>'WFDA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SEQ_NO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_imp.id(7631257183697124228)
,p_name=>'WFDA_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(7631256293234124219)
,p_name=>'WFDA_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_TYPE'
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
 p_id=>wwv_flow_imp.id(7631257961488124236)
,p_name=>'WFDA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_BY'
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
 p_id=>wwv_flow_imp.id(7631258299745124239)
,p_name=>'WFDA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_DATE'
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
 p_id=>wwv_flow_imp.id(7631258530119124241)
,p_name=>'WFDA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(7631258120975124237)
,p_name=>'WFDA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(7631258194410124238)
,p_name=>'WFDA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(7631256818744124224)
,p_name=>'WFDA_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_VALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7631256063432124217)
,p_internal_uid=>2149294227888513189
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
 p_id=>wwv_flow_imp.id(7631803727351391153)
,p_interactive_grid_id=>wwv_flow_imp.id(7631256063432124217)
,p_static_id=>'10500529'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7631803945455391153)
,p_report_id=>wwv_flow_imp.id(7631803727351391153)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6581756478977069518)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7631259983275124256)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631804404556391155)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7631256234932124218)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631805266510391158)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7631256293234124219)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631806156657391161)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7631256363412124220)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631807110034391164)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7631256531386124221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631807985264391167)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7631256604366124222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631808898767391171)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7631256741484124223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631809809059391174)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7631256818744124224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631810735265391177)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7631256948001124225)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631811555230391180)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7631257034636124226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631812532091391189)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7631257054040124227)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631813391773391192)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7631257183697124228)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87.141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631814249290391199)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7631257349660124229)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631815066340391203)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7631257427648124230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631816019688391205)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7631257499739124231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631816926971391208)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7631257602555124232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631817811465391211)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7631257667060124233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631818697519391214)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7631257792726124234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631819553828391217)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7631257924323124235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631820511180391221)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7631257961488124236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631821383909391224)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7631258120975124237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631822351800391227)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7631258194410124238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631823157461391228)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7631258299745124239)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631824112758391232)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7631258360510124240)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631825006833391235)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7631258530119124241)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631825904886391238)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7631258564677124242)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631826768714391241)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7631258706113124243)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7631827698828391244)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7631258789571124244)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7632039994199477627)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7631259916655124255)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7633738414267633728)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(7632057626160481421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7633739795119633736)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(7632057653343481422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7633741222530633742)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(7632057769763481423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7633749337459640864)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(7632057916647481424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7633778362061656324)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(7632057957554481425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7634138756823897796)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(7632058441548481429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7634140183209897802)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(7632058454163481430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7634141580560897808)
,p_view_id=>wwv_flow_imp.id(7631803945455391153)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(7632058630498481431)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5695257993796352449)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''NP'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581785062390069585)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7623614156215477091)
,p_button_name=>'Add_act'
,p_static_id=>'add-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581766937169069548)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7631255961058124216)
,p_button_name=>'add_auth'
,p_static_id=>'add-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6616153115963075040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6614981848763441368)
,p_button_name=>'Add_Pfx'
,p_static_id=>'add-pfx'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Pfx'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6620538918599364241)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6619622676095847369)
,p_button_name=>'Add_Role'
,p_static_id=>'add-role'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Role'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6619621246322847355)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6619618694659847329)
,p_button_name=>'ADD_SC'
,p_static_id=>'add-sc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Sc'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6610008886523732229)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_button_name=>'Create_im'
,p_static_id=>'create-im'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create '
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612558185731959029)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_button_name=>'Create_mm'
,p_static_id=>'create-mm'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_MM'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6614981363941441363)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_button_name=>'Create_Np'
,p_static_id=>'create-np'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Np'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_NP'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612560449505959052)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_button_name=>'CREATE_RM'
,p_static_id=>'create-rm'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create '
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_RM'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612562541453959073)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_button_name=>'Create_RR'
,p_static_id=>'create-rr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_FF'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581785835991069587)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7623614156215477091)
,p_button_name=>'down_act'
,p_static_id=>'down-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581767818805069551)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7631255961058124216)
,p_button_name=>'down_auth'
,p_static_id=>'down-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6616153268182075042)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6614981848763441368)
,p_button_name=>'Down_Pfx'
,p_static_id=>'down-pfx'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Pfx'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6620539104109364243)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6619622676095847369)
,p_button_name=>'Down_Role'
,p_static_id=>'down-role'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Role'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6619621476657847357)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6619618694659847329)
,p_button_name=>'DOWN_SC'
,p_static_id=>'down-sc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Sc'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5695258216316352451)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_button_name=>'DOWNLOAD'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
,p_button_cattributes=>' onclick="download_row(''NP'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5695258114963352450)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''NP'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581785509970069585)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7623614156215477091)
,p_button_name=>'save_act'
,p_static_id=>'save-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Act'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6581767384531069549)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7631255961058124216)
,p_button_name=>'save_auth'
,p_static_id=>'save-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Auth'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6610008980418732230)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_button_name=>'Save_im'
,p_static_id=>'save-im'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612558271952959030)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_button_name=>'save_mm'
,p_static_id=>'save-mm'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save '
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_MM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6614981513252441364)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_button_name=>'Save_NP'
,p_static_id=>'save-np'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Np'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_NP'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6616153226193075041)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6614981848763441368)
,p_button_name=>'Save_Pfx'
,p_static_id=>'save-pfx'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Pfx'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612560627054959053)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_button_name=>'SAVE_RM'
,p_static_id=>'save-rm'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save '
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_RM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6620538951436364242)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6619622676095847369)
,p_button_name=>'Save_Role'
,p_static_id=>'save-role'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Role'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6612562695228959074)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_button_name=>'SAVE_RR'
,p_static_id=>'save-rr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P2361300101_ROWID_FF'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6619621425825847356)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6619618694659847329)
,p_button_name=>'SAVE_SC'
,p_static_id=>'save-sc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Sc'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6607190880252966351)
,p_branch_name=>'GOTO_236130010'
,p_branch_action=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6616154103434075050)
,p_name=>'P2361300101_PFX_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6610009122549732231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6616154180624075051)
,p_name=>'P2361300101_PFX_SUBSEQ_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6610009122549732231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6616153987590075049)
,p_name=>'P2361300101_PFX_WF_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6610009122549732231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190558246966348)
,p_name=>'P2361300101_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562478392959072)
,p_name=>'P2361300101_ROWID_FF'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611186363791242635)
,p_name=>'P2361300101_ROWID_MM'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614979605703441345)
,p_name=>'P2361300101_ROWID_NP'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612560290624959050)
,p_name=>'P2361300101_ROWID_RM'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581768578651069553)
,p_name=>'P2361300101_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7631255961058124216)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6902816912507671603)
,p_name=>'P2361300101_TITLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6610009122549732231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611186572275242637)
,p_name=>'P2361300101_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6610009122549732231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561286915959060)
,p_name=>'P2361300101_WFFM_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_prompt=>'Body'
,p_source=>'WFFM_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>1000
,p_cHeight=>17
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561018989959057)
,p_name=>'P2361300101_WFFM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_default=>':Global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFFM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561519696959062)
,p_name=>'P2361300101_WFFM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFFM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561776718959065)
,p_name=>'P2361300101_WFFM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFFM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562258315959070)
,p_name=>'P2361300101_WFFM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561579517959063)
,p_name=>'P2361300101_WFFM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561666953959064)
,p_name=>'P2361300101_WFFM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561372408959061)
,p_name=>'P2361300101_WFFM_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561179677959059)
,p_name=>'P2361300101_WFFM_SUBJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_prompt=>'Subject'
,p_source=>'WFFM_SUBJECT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
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
 p_id=>wwv_flow_imp.id(6612561108685959058)
,p_name=>'P2361300101_WFFM_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612561918532959066)
,p_name=>'P2361300101_WFFM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFFM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562218190959069)
,p_name=>'P2361300101_WFFM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFFM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562382544959071)
,p_name=>'P2361300101_WFFM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562029309959067)
,p_name=>'P2361300101_WFFM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612562036471959068)
,p_name=>'P2361300101_WFFM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_item_source_plug_id=>wwv_flow_imp.id(6612560736405959055)
,p_source=>'WFFM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189501069966337)
,p_name=>'P2361300101_WFIM_APPR_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_prompt=>'Appr. Message'
,p_source=>'WFIM_APPR_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189362244966336)
,p_name=>'P2361300101_WFIM_APPR_SUBJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_prompt=>'Appr. Subject'
,p_source=>'WFIM_APPR_SUBJECT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189266041966335)
,p_name=>'P2361300101_WFIM_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_prompt=>'To Body'
,p_source=>'WFIM_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607188857018966331)
,p_name=>'P2361300101_WFIM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_default=>':Global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFIM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189635130966338)
,p_name=>'P2361300101_WFIM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFIM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189891029966341)
,p_name=>'P2361300101_WFIM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFIM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190381490966346)
,p_name=>'P2361300101_WFIM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189649404966339)
,p_name=>'P2361300101_WFIM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189742281966340)
,p_name=>'P2361300101_WFIM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189093058966333)
,p_name=>'P2361300101_WFIM_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189231883966334)
,p_name=>'P2361300101_WFIM_SUBJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_prompt=>'To Subject'
,p_source=>'WFIM_SUBJECT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607188967427966332)
,p_name=>'P2361300101_WFIM_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607189964041966342)
,p_name=>'P2361300101_WFIM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFIM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190321726966345)
,p_name=>'P2361300101_WFIM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFIM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190494718966347)
,p_name=>'P2361300101_WFIM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190068893966343)
,p_name=>'P2361300101_WFIM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607190203232966344)
,p_name=>'P2361300101_WFIM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_item_source_plug_id=>wwv_flow_imp.id(6607188686959966329)
,p_source=>'WFIM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193084556966373)
,p_name=>'P2361300101_WFMM_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_prompt=>'Body'
,p_source=>'WFMM_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>1000
,p_cHeight=>17
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607192745179966370)
,p_name=>'P2361300101_WFMM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_default=>':Global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193322796966375)
,p_name=>'P2361300101_WFMM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193548523966378)
,p_name=>'P2361300101_WFMM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611186139248242633)
,p_name=>'P2361300101_WFMM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193363036966376)
,p_name=>'P2361300101_WFMM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193529347966377)
,p_name=>'P2361300101_WFMM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607193165100966374)
,p_name=>'P2361300101_WFMM_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607192938921966372)
,p_name=>'P2361300101_WFMM_SUBJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_prompt=>'Subject'
,p_source=>'WFMM_SUBJECT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607192933854966371)
,p_name=>'P2361300101_WFMM_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611185796053242629)
,p_name=>'P2361300101_WFMM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_default=>':Global_User'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611186054328242632)
,p_name=>'P2361300101_WFMM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611186309054242634)
,p_name=>'P2361300101_WFMM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611185893638242630)
,p_name=>'P2361300101_WFMM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6611185962267242631)
,p_name=>'P2361300101_WFMM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_item_source_plug_id=>wwv_flow_imp.id(6607192590322966368)
,p_source=>'WFMM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614979788714441347)
,p_name=>'P2361300101_WFNP_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFNP_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980323844441352)
,p_name=>'P2361300101_WFNP_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFNP_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980596189441355)
,p_name=>'P2361300101_WFNP_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFNP_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614981107942441360)
,p_name=>'P2361300101_WFNP_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980379739441353)
,p_name=>'P2361300101_WFNP_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980496054441354)
,p_name=>'P2361300101_WFNP_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980046755441350)
,p_name=>'P2361300101_WFNP_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_prompt=>'Employee'
,p_source=>'WFNP_EMP_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_EMP_NP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980152233441351)
,p_name=>'P2361300101_WFNP_MAIL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>'N'
,p_prompt=>'Mail'
,p_source=>'WFNP_MAIL_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614979951040441349)
,p_name=>'P2361300101_WFNP_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614981292270441362)
,p_name=>'P2361300101_WFNP_SMS_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>'N'
,p_prompt=>'SMS'
,p_source=>'WFNP_SMS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>11
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980701793441356)
,p_name=>'P2361300101_WFNP_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFNP_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614981007124441359)
,p_name=>'P2361300101_WFNP_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFNP_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614981160440441361)
,p_name=>'P2361300101_WFNP_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980742577441357)
,p_name=>'P2361300101_WFNP_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614980882837441358)
,p_name=>'P2361300101_WFNP_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6614979884571441348)
,p_name=>'P2361300101_WFNP_WF_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_item_source_plug_id=>wwv_flow_imp.id(6612562959882959077)
,p_source=>'WFNP_WF_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559111105959038)
,p_name=>'P2361300101_WFRM_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_prompt=>'Body'
,p_source=>'WFRM_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>1000
,p_cHeight=>17
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612558783112959035)
,p_name=>'P2361300101_WFRM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_default=>':Global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFRM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559324952959040)
,p_name=>'P2361300101_WFRM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFRM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559612714959043)
,p_name=>'P2361300101_WFRM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFRM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612560125447959048)
,p_name=>'P2361300101_WFRM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559402949959041)
,p_name=>'P2361300101_WFRM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559450295959042)
,p_name=>'P2361300101_WFRM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559210935959039)
,p_name=>'P2361300101_WFRM_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559030588959037)
,p_name=>'P2361300101_WFRM_SUBJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_prompt=>'Subject'
,p_source=>'WFRM_SUBJECT'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612558862740959036)
,p_name=>'P2361300101_WFRM_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559640870959044)
,p_name=>'P2361300101_WFRM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFRM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559935698959047)
,p_name=>'P2361300101_WFRM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFRM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612560235010959049)
,p_name=>'P2361300101_WFRM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559750870959045)
,p_name=>'P2361300101_WFRM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6612559920330959046)
,p_name=>'P2361300101_WFRM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_item_source_plug_id=>wwv_flow_imp.id(6612558619636959033)
,p_source=>'WFRM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581786316161069587)
,p_name=>'P2361300101_WF_BUS_PROC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7623614156215477091)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6581768174231069551)
,p_name=>'P2361300101_WF_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7631255961058124216)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5692546689323634539)
,p_name=>'P2361300101_WORK_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5692546469947634537)
,p_name=>'P2361300101_WORK_FLOW_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5692546541686634538)
,p_name=>'P2361300101_WORK_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5682159406340309472)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8131199088449929729)
,p_tabular_form_region_id=>wwv_flow_imp.id(6614981848763441368)
,p_validation_name=>'Prefix'
,p_static_id=>'prefix'
,p_validation_sequence=>50
,p_validation=>'WFAP_PFX_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Prefix must be entered.'
,p_associated_column=>'WFAP_PFX_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581786788796069588)
,p_tabular_form_region_id=>wwv_flow_imp.id(7623614156215477091)
,p_validation_name=>'WFAA_STATUS'
,p_static_id=>'wfaa-status'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFAA_STATUS IS NULL THEN',
'   Return(''Status must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFAA_STATUS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581769036428069554)
,p_tabular_form_region_id=>wwv_flow_imp.id(7631255961058124216)
,p_validation_name=>'WFDA_APPR_BU'
,p_static_id=>'wfda-appr-bu'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_APPR_BU IS NULL THEN',
'   Return(''Entity must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_APPR_BU'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581769906155069554)
,p_tabular_form_region_id=>wwv_flow_imp.id(7631255961058124216)
,p_validation_name=>'WFDA_DATE_FROM'
,p_static_id=>'wfda-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_DATE_FROM IS NULL THEN',
'   Return(''From Date must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6581769498990069554)
,p_tabular_form_region_id=>wwv_flow_imp.id(7631255961058124216)
,p_validation_name=>'WFDA_POSITION'
,p_static_id=>'wfda-position'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_POSITION IS NULL THEN',
'    Return(''Employee / Position must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_POSITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581789637098069593)
,p_name=>'Add_act'
,p_static_id=>'add-act'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581785062390069585)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581790137977069593)
,p_event_id=>wwv_flow_imp.id(6581789637098069593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581790554340069593)
,p_name=>'add_auth'
,p_static_id=>'add-auth'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581766937169069548)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581791098029069595)
,p_event_id=>wwv_flow_imp.id(6581790554340069593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6616153434745075043)
,p_name=>'Add_Pfx'
,p_static_id=>'add-pfx'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6616153115963075040)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6616153532909075044)
,p_event_id=>wwv_flow_imp.id(6616153434745075043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("pfx").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6620539170861364244)
,p_name=>'Add_Role'
,p_static_id=>'add-role'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6620538918599364241)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6620539272435364245)
,p_event_id=>wwv_flow_imp.id(6620539170861364244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("role").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6619621633739847358)
,p_name=>'add_sc'
,p_static_id=>'add-sc'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6619621246322847355)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6619621644534847359)
,p_event_id=>wwv_flow_imp.id(6619621633739847358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("sc").widget().interactiveGrid("getActions").invoke("selection-add-row");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6619622289512847365)
,p_name=>'custom_prefix'
,p_static_id=>'custom-prefix'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6614981848763441368)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6619622383277847366)
,p_event_id=>wwv_flow_imp.id(6619622289512847365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6614981848763441368)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6620539881193364251)
,p_name=>'custom_role'
,p_static_id=>'custom-role'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6619622676095847369)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6620539970708364252)
,p_event_id=>wwv_flow_imp.id(6620539881193364251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6619622676095847369)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6619622483412847367)
,p_name=>'custom_sc'
,p_static_id=>'custom-sc'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6619618694659847329)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6619622591620847368)
,p_event_id=>wwv_flow_imp.id(6619622483412847367)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6619618694659847329)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581791511436069596)
,p_name=>'down_act'
,p_static_id=>'down-act'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581785835991069587)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581791941441069598)
,p_event_id=>wwv_flow_imp.id(6581791511436069596)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581792353380069598)
,p_name=>'down_auth'
,p_static_id=>'down-auth'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581767818805069551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581792915317069599)
,p_event_id=>wwv_flow_imp.id(6581792353380069598)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6616153777780075047)
,p_name=>'Down_Pfx'
,p_static_id=>'down-pfx'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6616153268182075042)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6616153851737075048)
,p_event_id=>wwv_flow_imp.id(6616153777780075047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("pfx").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6620539622781364248)
,p_name=>'Down_Save'
,p_static_id=>'down-save'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6620539104109364243)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6620539699056364249)
,p_event_id=>wwv_flow_imp.id(6620539622781364248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("role").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6619622075279847363)
,p_name=>'down_sc'
,p_static_id=>'down-sc'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6619621476657847357)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6619622235089847364)
,p_event_id=>wwv_flow_imp.id(6619622075279847363)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("sc").call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581787838991069592)
,p_name=>'save_act'
,p_static_id=>'save-act'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581785509970069585)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581788359636069592)
,p_event_id=>wwv_flow_imp.id(6581787838991069592)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("act").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6581788754307069592)
,p_name=>'save_auth'
,p_static_id=>'save-auth'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6581767384531069549)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6581789259651069593)
,p_event_id=>wwv_flow_imp.id(6581788754307069592)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("auth").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6616153565777075045)
,p_name=>'Save_Pfx'
,p_static_id=>'save-pfx'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6616153226193075041)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6616153689914075046)
,p_event_id=>wwv_flow_imp.id(6616153565777075045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("pfx").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6620539426971364246)
,p_name=>'Save_Role'
,p_static_id=>'save-role'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6620538951436364242)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6620539472162364247)
,p_event_id=>wwv_flow_imp.id(6620539426971364246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("role").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6619621926922847361)
,p_name=>'save_sc'
,p_static_id=>'save-sc'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6619621425825847356)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6619621937874847362)
,p_event_id=>wwv_flow_imp.id(6619621926922847361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("sc").widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6619619065442847333)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6619618694659847329)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Class and Subclass - Save Interactive Grid Data'
,p_static_id=>'class-and-subclass-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1137657229899236305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6619621013871847352)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6619618694659847329)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Class_Subclass'
,p_static_id=>'class-subclass'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'    SELECT NVL(MAX(wfac_cls_seq_no),0)+1',
'      INTO :wfac_cls_seq_no',
'      FROM wf_authorization_class',
'     WHERE wfac_bu 	       = :GLOBAL_BU',
'       AND wfac_wf_id 	   = :P2361300101_PFX_WF_ID',
'       AND wfac_seq_no 	   = :P2361300101_PFX_SEQ_NO',
'       AND wfac_sub_seq_no = :P2361300101_PFX_SUBSEQ_NO  ; ',
'     INSERT INTO wf_authorization_class(wfac_bu,',
'                                        wfac_wf_id,',
'                                        wfac_seq_no,',
'                                        wfac_sub_seq_no,',
'                                        wfac_cls_seq_no,',
'                                        wfac_cls_id,',
'                                        wfac_subcls_id,',
'                                        wfac_cre_by,',
'                                        wfac_cre_ip_addr,',
'                                        wfac_cre_os_user,',
'                                        wfac_cre_date,',
'                                        wfac_upd_by,',
'                                        wfac_upd_ip_addr,',
'                                        wfac_upd_os_user,',
'                                        wfac_upd_date,',
'                                        wfac_cre_emp_id,',
'                                        wfac_upd_emp_id   )  ',
'                               VALUES (:Global_bu,',
'                                       :P2361300101_PFX_WF_ID,',
'                                       :P2361300101_PFX_SEQ_NO,',
'                                       :P2361300101_PFX_SUBSEQ_NO,',
'                                       :wfac_cls_seq_no,',
'                                       :wfac_cls_id,',
'                                       :wfac_subcls_id,',
'                                       :Global_user,',
'                                       :wfac_cre_ip_addr,',
'                                       :wfac_cre_os_user,',
'                                       SYSDATE,',
'                                       :Global_user,',
'                                       :wfac_upd_ip_addr,',
'                                       :wfac_upd_os_user,',
'                                       SYSDATE,',
'                                       :wfac_cre_emp_id,',
'                                       :wfac_upd_emp_id);',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN    ',
'      UPDATE wf_authorization_class',
'         SET wfac_cls_id      = :wfac_cls_id,',
'             wfac_subcls_id   = :wfac_subcls_id,',
'             wfac_cre_ip_addr = :wfac_cre_ip_addr,',
'             wfac_cre_os_user = :wfac_cre_os_user,',
'             wfac_upd_by      = :wfac_upd_by,',
'             wfac_upd_ip_addr = :wfac_upd_ip_addr,',
'             wfac_upd_os_user = :wfac_upd_os_user,',
'             wfac_upd_date    = :wfac_upd_date,',
'             wfac_cre_emp_id  = :wfac_cre_emp_id,',
'             wfac_upd_emp_id  = :wfac_upd_emp_id ',
'       WHERE wfac_bu 	       = :GLOBAL_BU',
'         AND wfac_wf_id 	   = :P2361300101_PFX_WF_ID',
'         AND wfac_seq_no 	   = :P2361300101_PFX_SEQ_NO',
'         AND wfac_sub_seq_no   = :P2361300101_PFX_SUBSEQ_NO  ',
'         AND wfac_cls_seq_no   = :wfac_cls_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	  DELETE',
'        FROM wf_authorization_class',
'	   WHERE wfac_bu         = :Global_bu',
'         AND wfac_wf_id      = :P2361300101_PFX_WF_ID',
'         AND wfac_seq_no     = :P2361300101_PFX_SEQ_NO',
'         AND wfac_sub_seq_no = :P2361300101_PFX_SUBSEQ_NO',
'         AND wfac_cls_seq_no = :wfac_cls_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1137659178328236324
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6612562905602959076)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6612560736405959055)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Forward Message'
,p_static_id=>'forward-message'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612562541453959073)
,p_process_success_message=>'Saved.'
,p_internal_uid=>1130601070059348048
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5773495992629480345)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6612560736405959055)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Forward Message_1'
,p_static_id=>'forward-message-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612562695228959074)
,p_process_success_message=>'Saved.'
,p_internal_uid=>291534157085869317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6612560845981959056)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6612560736405959055)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Forward Message'
,p_static_id=>'initialize-form-forward-message'
,p_internal_uid=>1130599010438348028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6607192651635966369)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6607192590322966368)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form MAIL'
,p_static_id=>'initialize-form-mail'
,p_internal_uid=>1125230816092355341
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6612563100599959078)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6612562959882959077)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Notify Persons'
,p_static_id=>'initialize-form-notify-persons'
,p_internal_uid=>1130601265056348050
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6612558686112959034)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6612558619636959033)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Return Message'
,p_static_id=>'initialize-form-return-message'
,p_internal_uid=>1130596850569348006
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6607188830736966330)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6607188686959966329)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Workflow Activities / Authorization'
,p_static_id=>'initialize-form-workflow-activities-authorization'
,p_internal_uid=>1125226995193355302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6607190726680966349)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6607188686959966329)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize Internal Message'
,p_static_id=>'initialize-internal-message'
,p_internal_uid=>1125228891137355321
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6607190755681966350)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6607188686959966329)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Internal Message'
,p_static_id=>'internal-message'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6610008886523732229)
,p_process_success_message=>'Saved.'
,p_internal_uid=>1125228920138355322
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5773495610307480341)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6607188686959966329)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Internal Message_1'
,p_static_id=>'internal-message-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6610008980418732230)
,p_process_success_message=>'Saved.'
,p_internal_uid=>291533774763869313
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6611186510937242636)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6607192590322966368)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Mail Message'
,p_static_id=>'mail-message'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612558185731959029)
,p_process_success_message=>'Saved.'
,p_internal_uid=>1129224675393631608
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5773495816602480343)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6607192590322966368)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Mail Message_1'
,p_static_id=>'mail-message-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612558271952959030)
,p_process_success_message=>'Saved.'
,p_internal_uid=>291533981058869315
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6614979733164441346)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6612562959882959077)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Notify Persons'
,p_static_id=>'notify-persons'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1133017897620830318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5695257687421352446)
,p_process_sequence=>200
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5682159406340309472)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Notify Persons - Save Interactive Grid Data'
,p_static_id=>'notify-persons-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>213295851877741418
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6614982317719441372)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6614981848763441368)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'PREFIX - Save Interactive Grid Data'
,p_static_id=>'prefix-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1133020482175830344
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6616154397357075053)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6614981848763441368)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PRFIX_DML'
,p_static_id=>'prfix-dml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'    SELECT NVL(MAX(wfap_pfx_seq_no),0) + 1',
'      INTO :wfap_pfx_seq_no',
'      FROM wf_authorization_pfx',
'     WHERE wfap_bu         = :GLOBAL_bu',
'       AND wfap_wf_id      = :P2361300101_PFX_WF_ID',
'       AND wfap_seq_no     = :P2361300101_PFX_SEQ_NO',
'       AND wfap_sub_seq_no = :P2361300101_PFX_SUBSEQ_NO;',
'     INSERT INTO wf_authorization_pfx(wfap_bu,',
'                                      wfap_wf_id,',
'                                      wfap_seq_no,',
'                                      wfap_sub_seq_no,',
'                                      wfap_pfx_seq_no,',
'                                      wfap_pfx_id,',
'                                      wfap_cre_by,',
'                                      wfap_cre_emp_id,',
'                                      wfap_cre_ip_addr,',
'                                      wfap_cre_os_user,',
'                                      wfap_cre_date,',
'                                      wfap_upd_by,',
'                                      wfap_upd_emp_id,',
'                                      wfap_upd_ip_addr,',
'                                      wfap_upd_os_user,',
'                                      wfap_upd_date )  ',
'                             VALUES (:Global_bu,',
'                                     :P2361300101_PFX_WF_ID,',
'                                     :P2361300101_PFX_SEQ_NO,',
'                                     :P2361300101_PFX_SUBSEQ_NO,',
'                                     :wfap_pfx_seq_no,',
'                                     :wfap_pfx_id,',
'                                     :Global_User,',
'                                     :Global_emp_id,',
'                                     :wfap_cre_ip_addr,',
'                                     :wfap_cre_os_user,',
'                                     SYSDATE,',
'                                     :Global_User,',
'                                     :wfap_upd_emp_id,',
'                                     :wfap_upd_ip_addr,',
'                                     :wfap_upd_os_user,',
'                                     SYSDATE);',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'      UPDATE wf_authorization_pfx',
'         SET wfap_pfx_id      = :wfap_pfx_id,',
'             wfap_cre_emp_id  = :wfap_cre_emp_id,',
'             wfap_cre_ip_addr = :wfap_cre_ip_addr,',
'             wfap_cre_os_user = :wfap_cre_os_user,',
'             wfap_upd_by      = :wfap_upd_by,',
'             wfap_upd_emp_id  = :wfap_upd_emp_id,',
'             wfap_upd_ip_addr = :wfap_upd_ip_addr,',
'             wfap_upd_os_user = :wfap_upd_os_user,',
'             wfap_upd_date    = :wfap_upd_date',
'       WHERE wfap_bu         = :Global_bu',
'         AND wfap_wf_id      = :P2361300101_PFX_WF_ID',
'         AND wfap_seq_no     = :P2361300101_PFX_SEQ_NO',
'         AND wfap_sub_seq_no = :P2361300101_PFX_SUBSEQ_NO',
'         AND wfap_pfx_seq_no     = :wfap_pfx_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	   DELETE',
'        FROM wf_authorization_pfx',
'	    WHERE wfap_bu         = :Global_bu',
'         AND wfap_wf_id      = :P2361300101_PFX_WF_ID',
'         AND wfap_seq_no     = :P2361300101_PFX_SEQ_NO',
'         AND wfap_sub_seq_no = :P2361300101_PFX_SUBSEQ_NO',
'         AND wfap_pfx_seq_no     = :wfap_pfx_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1134192561813464025
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5695257908756352448)
,p_process_sequence=>210
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for NP'
,p_static_id=>'process-for-np'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN',
'    INSERT INTO WORK_FLOW_NOTIFY_PERSONS(  WFNP_BU,',
'                                           WFNP_WF_ID,',
'                                           WFNP_SEQ_NO,',
'                                           WFNP_EMP_ID,',
'                                           WFNP_MAIL_FLAG,',
'                                           WFNP_CRE_BY,',
'                                           WFNP_CRE_IP_ADDR,',
'                                           WFNP_CRE_OS_USER,',
'                                           WFNP_CRE_DATE,',
'                                           WFNP_CRE_EMP_ID,',
'                                           WFNP_SMS_FLAG,',
'                                           WFNP_DOC_NO,',
'                                           WFNP_DOC_REV,',
'                                           WFNP_WHATSAPP_FLAG',
'                                          )',
'                                 VALUES(',
'                                          :GLOBAL_BU,',
'                                          :WFNP_WF_ID,',
'                                          :WFNP_SEQ_NO,',
'                                          :WFNP_EMP_ID,',
'                                          :WFNP_MAIL_FLAG,',
'                                          :GLOBAL_USER,',
'                                          :global_ip_addr,',
'                                          :global_os_user,',
'                                          :WFNP_CRE_DATE,',
'                                          :global_emp_id,',
'                                          :WFNP_SMS_FLAG,',
'                                          :WFNP_DOC_NO,',
'                                          :WFNP_DOC_REV,',
'                                          :WFNP_WHATSAPP_FLAG',
'                                      ',
'                                       );',
'             apex_application.g_print_success_message := ''<span style="color:WHITE"> Line created.</span>'';',
'',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'		UPDATE WORK_FLOW_NOTIFY_PERSONS SET',
'			WFNP_BU = :GLOBAL_BU,',
'			WFNP_WF_ID = :WFNP_WF_ID,',
'			WFNP_SEQ_NO = :WFNP_SEQ_NO,',
'			WFNP_EMP_ID = :WFNP_EMP_ID,',
'            WFNP_MAIL_FLAG = :WFNP_MAIL_FLAG,',
'            WFNP_SMS_FLAG = :WFNP_SMS_FLAG,',
'            WFNP_DOC_NO = :WFNP_DOC_NO,',
'            WFNP_DOC_REV = :WFNP_DOC_REV,',
'            WFNP_WHATSAPP_FLAG = :WFNP_WHATSAPP_FLAG,',
'             WFNP_UPD_BY       =  :global_user,',
'            WFNP_UPD_IP_ADDR   = :global_ip_addr,',
'            WFNP_UPD_OS_USER   =:global_os_user,',
'            WFNP_UPD_DATE      =sysdate,',
'            WFNP_UPD_EMP_ID    =:global_emp_id',
'		WHERE ROWID = :ROWID',
'        AND WFNP_BU = :GLOBAL_BU',
'        AND WFNP_SEQ_NO = :WFNP_SEQ_NO',
'        AND WFNP_EMP_ID = :WFNP_EMP_ID',
'        AND WFNP_DOC_NO = :WFNP_DOC_NO;',
'        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line updated.</span>'';',
'',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'',
'                DELETE from WORK_FLOW_NOTIFY_PERSONS',
'                  WHERE ROWID = :ROWID',
'                    AND WFNP_BU = :GLOBAL_BU',
'                    AND WFNP_SEQ_NO = :WFNP_SEQ_NO',
'                    AND WFNP_EMP_ID = :WFNP_EMP_ID',
'                    AND WFNP_DOC_NO = :WFNP_DOC_NO;',
'                        apex_application.g_print_success_message := ''<span style="color:WHITE"> Line Deleted.</span>'';    ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>213296073212741420
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5773495657273480342)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Rowid'
,p_static_id=>'process-for-rowid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'SELECT ROWID',
'  INTO :P2361300101_ROWID',
'  FROM wf_internal_message',
' WHERE wfim_bu     = :GLOBAL_BU',
'   AND wfim_type   = :P2361300101_WFIM_TYPE',
'   AND wfim_seq_no = :P2361300101_WFIM_SEQ_NO',
'   AND ROWNUM      = 1;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P2361300101_ROWID_MM',
'  FROM wf_mail_message',
' WHERE Wfmm_Bu     = :GLOBAL_BU',
'   AND wfmm_type   = :P2361300101_WFMM_TYPE',
'   AND wfmm_seq_no = :P2361300101_WFMM_SEQ_NO',
'   AND ROWNUM      = 1;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P2361300101_ROWID_RM',
'  FROM wf_return_message',
' WHERE Wfrm_Bu     = :GLOBAL_BU',
'   AND wfrm_type   = :P2361300101_WFRM_TYPE',
'   AND wfrm_seq_no = :P2361300101_WFRM_SEQ_NO',
'   AND ROWNUM      = 1;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P2361300101_ROWID_FF',
'  FROM wf_forward_message',
' WHERE Wffm_Bu     = :GLOBAL_BU',
'   AND wffm_type   = :P2361300101_WFFM_TYPE',
'   AND wffm_seq_no = :P2361300101_WFFM_SEQ_NO',
'   AND ROWNUM      = 1;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'  NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>291533821729869314
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6612560414702959051)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6612558619636959033)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Return Mail'
,p_static_id=>'return-mail'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612560627054959053)
,p_process_when=>'CREATE_RM,SAVE_RM'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Saved.'
,p_internal_uid=>1130598579159348023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5773496114262480346)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6612558619636959033)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Return Mail_1'
,p_static_id=>'return-mail-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6612560449505959052)
,p_process_success_message=>'Saved.'
,p_internal_uid=>291534278718869318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6620539754638364250)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6619622676095847369)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ROLE'
,p_static_id=>'role'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'      SELECT NVL(MAX(wfar_seq_no),0) + 1',
'        INTO :wfar_seq_no',
'        FROM work_flow_auth_role',
'       WHERE wfar_bu         = :GLOBAL_BU',
'         AND wfar_wf_type    = :P2361300101_PFX_WF_ID',
'         AND wfar_act_seq_no = :P2361300101_PFX_SEQ_NO',
'         AND wfar_aut_seq_no = :P2361300101_PFX_SUBSEQ_NO;',
'',
'     INSERT INTO work_flow_auth_role(wfar_bu,',
'                                     wfar_wf_type,',
'                                     wfar_act_seq_no,',
'                                     wfar_aut_seq_no,',
'                                     wfar_role_id,',
'                                     wfar_seq_no,',
'                                     wfar_cre_by,',
'                                     wfar_cre_ip_addr,',
'                                     wfar_cre_os_user,',
'                                     wfar_cre_date,',
'                                     wfar_upd_by,',
'                                     wfar_upd_ip_addr,',
'                                     wfar_upd_os_user,',
'                                     wfar_upd_date,',
'                                     wfar_cre_emp_id,',
'                                     wfar_upd_emp_id  )  ',
'                             VALUES (:Global_bu,',
'                                     :P2361300101_PFX_WF_ID,',
'                                     :P2361300101_PFX_SEQ_NO,',
'                                     :P2361300101_PFX_SUBSEQ_NO,',
'                                     :wfar_role_id,',
'                                     :wfar_seq_no,',
'                                     :Global_user,',
'                                     :wfar_cre_ip_addr,',
'                                     :wfar_cre_os_user,',
'                                     SYSDATE,',
'                                     :Global_user,',
'                                     :wfar_upd_ip_addr,',
'                                     :wfar_upd_os_user,',
'                                     SYSDATE,',
'                                     :wfar_cre_emp_id,',
'                                     :wfar_upd_emp_id);',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN    ',
'      UPDATE work_flow_auth_role',
'         SET wfar_role_id     = :wfar_role_id,',
'             wfar_cre_ip_addr = :wfar_cre_ip_addr,',
'             wfar_cre_os_user = :wfar_cre_os_user,',
'             wfar_upd_by      = :wfar_upd_by,',
'             wfar_upd_ip_addr = :wfar_upd_ip_addr,',
'             wfar_upd_os_user = :wfar_upd_os_user,',
'             wfar_upd_date    = :wfar_upd_date,',
'             wfar_cre_emp_id  = :wfar_cre_emp_id,',
'             wfar_upd_emp_id  = :wfar_upd_emp_id',
'       WHERE wfar_bu         = :GLOBAL_BU',
'         AND wfar_wf_type    = :P2361300101_PFX_WF_ID',
'         AND wfar_act_seq_no = :P2361300101_PFX_SEQ_NO',
'         AND wfar_aut_seq_no = :P2361300101_PFX_SUBSEQ_NO',
'         AND wfar_seq_no     = :wfar_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	  DELETE',
'        FROM work_flow_auth_role',
'	   WHERE wfar_bu         = :GLOBAL_BU',
'         AND wfar_wf_type    = :P2361300101_PFX_WF_ID',
'         AND wfar_act_seq_no = :P2361300101_PFX_SEQ_NO',
'         AND wfar_aut_seq_no = :P2361300101_PFX_SUBSEQ_NO',
'         AND wfar_seq_no     = :wfar_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;			  ',
'',
'',
'',
'',
'',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1138577919094753222
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6619623102046847373)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6619622676095847369)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Role - Save Interactive Grid Data'
,p_static_id=>'role-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1137661266503236345
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581787080264069588)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7623614156215477091)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Workflow Activities / Authorization - Save Interactive Grid Data'
,p_static_id=>'workflow-activities-authorization-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_internal_uid=>1099825244720458560
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581787525593069590)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7623614156215477091)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_activity'
,p_static_id=>'workflow-activity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'      SELECT NVL(MAX(wfaa_seq_no),0)+1',
'        INTO :wfaa_seq_no',
'        FROM work_flow_appr_actvt',
'       WHERE wfaa_bu    = :Global_bu',
'         AND wfaa_wf_id = :wfaa_wf_id;',
'',
'      INSERT INTO work_flow_appr_actvt(wfaa_bu,',
'                                       wfaa_wf_id,',
'                                       wfaa_seq_no,',
'                                       wfaa_desc,',
'                                       wfaa_status,',
'                                       wfaa_status_desc,',
'                                       wfaa_hour,',
'                                       wfaa_status_desc2,',
'                                       wfaa_print_seq_no,',
'                                       wfaa_msg_to,',
'                                       wfaa_hier_type,',
'                                       wfaa_cre_by,',
'                                       wfaa_cre_ip_addr,',
'                                       wfaa_cre_os_user,',
'                                       wfaa_cre_date,',
'                                       wfaa_upd_by,',
'                                       wfaa_upd_ip_addr,',
'                                       wfaa_upd_os_user,',
'                                       wfaa_upd_date,',
'                                       wfaa_cre_emp_id,',
'                                       wfaa_upd_emp_id,',
'                                       wfaa_im_flag,',
'                                       wfaa_mail_flag,',
'                                       wfaa_sms_flag,',
'                                       wfaa_sms_template_id)        ',
'                               VALUES (:Global_bu,',
'                                       :wfaa_wf_id,',
'                                       :wfaa_seq_no,',
'                                       :wfaa_desc,',
'                                       :wfaa_status,',
'                                       :wfaa_status_desc,',
'                                       :wfaa_hour,',
'                                       :wfaa_status_desc2,',
'                                       :wfaa_print_seq_no,',
'                                       :wfaa_msg_to,',
'                                       :wfaa_hier_type,',
'                                       :Global_user,',
'                                       :wfaa_cre_ip_addr,',
'                                       :wfaa_cre_os_user,',
'                                       SYSDATE,',
'                                       :Global_user,',
'                                       :wfaa_upd_ip_addr,',
'                                       :wfaa_upd_os_user,',
'                                       SYSDATE,',
'                                       :wfaa_cre_emp_id,',
'                                       :wfaa_upd_emp_id,',
'                                       :wfaa_im_flag,',
'                                       :wfaa_mail_flag,',
'                                       :wfaa_sms_flag,',
'                                       :wfaa_sms_template_id );',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'      UPDATE work_flow_appr_actvt',
'         SET wfaa_desc         = :wfaa_desc,',
'             wfaa_status       = :wfaa_status,',
'             wfaa_status_desc  = :wfaa_status_desc,',
'             wfaa_hour         = :wfaa_hour,',
'             wfaa_status_desc2 = :wfaa_status_desc2,',
'             wfaa_print_seq_no = :wfaa_print_seq_no,',
'             wfaa_msg_to       = :wfaa_msg_to,',
'             wfaa_hier_type    = :wfaa_hier_type,',
'             wfaa_cre_ip_addr  = :wfaa_cre_ip_addr,',
'             wfaa_cre_os_user  = :wfaa_cre_os_user,',
'             wfaa_upd_by       = :wfaa_upd_by,',
'             wfaa_upd_ip_addr  = :wfaa_upd_ip_addr,',
'             wfaa_upd_os_user  = :wfaa_upd_os_user,',
'             wfaa_upd_date     = :wfaa_upd_date,',
'             wfaa_cre_emp_id   = :wfaa_cre_emp_id,',
'             wfaa_upd_emp_id   = :wfaa_upd_emp_id,',
'             wfaa_im_flag      = :wfaa_im_flag,',
'             wfaa_mail_flag    = :wfaa_mail_flag,',
'             wfaa_sms_flag     = :wfaa_sms_flag,',
'             wfaa_sms_template_id = :wfaa_sms_template_id',
'       WHERE wfaa_bu         = :Global_bu ',
'         AND wfaa_wf_id      = :wfaa_wf_id',
'         AND wfaa_seq_no     = :wfaa_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	  DELETE',
'        FROM work_flow_appr_actvt',
'	   WHERE wfaa_bu         = :Global_bu ',
'         AND wfaa_wf_id      = :wfaa_wf_id',
'         AND wfaa_seq_no     = :wfaa_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1099825690049458562
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581770595762069556)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7631255961058124216)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_Auth'
,p_static_id=>'workflow-auth'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'     SELECT NVL(MAX(wfda_sub_seq_no),0) + 1',
'       INTO :wfda_sub_seq_no',
'       FROM wf_direct_authorization',
'      WHERE wfda_bu = :GLOBAL_BU',
'        AND wfda_type = :P2361300101_WF_TYPE',
'        AND wfda_seq_no = :P2361300101_SEQ_NO;',
'',
'      INSERT INTO wf_direct_authorization(wfda_bu,',
'                                          wfda_type,',
'                                          wfda_position,',
'                                          wfda_date_from,',
'                                          wfda_date_to,',
'                                          wfda_seq_no,',
'                                          wfda_value,',
'                                          wfda_aod_flag,',
'                                          wfda_mobile_no,',
'                                          wfda_plnt,',
'                                          wfda_sub_seq_no,',
'                                          wfda_appr_bu,',
'                                          wfda_disc_pct,',
'                                          wfda_dflt_flag,',
'                                          wfda_cre_by,',
'                                          wfda_cre_ip_addr,',
'                                          wfda_cre_os_user,',
'                                          wfda_cre_date,',
'                                          wfda_upd_by,',
'                                          wfda_upd_ip_addr,',
'                                          wfda_upd_os_user,',
'                                          wfda_upd_date,',
'                                          wfda_cre_emp_id,',
'                                          wfda_upd_emp_id,',
'                                          wfda_mail_opt_flag,',
'                                          wfda_sender_mail)        ',
'                                   VALUES (:Global_bu,',
'                                           :P2361300101_WF_TYPE,',
'                                           :wfda_position,',
'                                           :wfda_date_from,',
'                                           :wfda_date_to,',
'                                           :P2361300101_SEQ_NO,',
'                                           :wfda_value,',
'                                           ''N'',',
'                                           :wfda_mobile_no,',
'                                           :wfda_plnt,',
'                                           :wfda_sub_seq_no,',
'                                           :wfda_appr_bu,',
'                                           :wfda_disc_pct,',
'                                           ''N'',',
'                                           :Global_User,',
'                                           :wfda_cre_ip_addr,',
'                                           :wfda_cre_os_user,',
'                                           SYSDATE,',
'                                           :Global_User,',
'                                           :wfda_upd_ip_addr,',
'                                           :wfda_upd_os_user,',
'                                           SYSDATE,',
'                                           :wfda_cre_emp_id,',
'                                           :wfda_upd_emp_id,',
'                                           ''N'',',
'                                           :wfda_sender_mail     ',
'                                           );',
'		IF :WFDA_POSITION IS NOT NULL THEN',
'   IF :wf_auth_type = ''P'' THEN',
'	 proc_find_emp_details(:wfda_appr_bu,',
'		                    NULL,',
'		                    :wfda_position,',
'		                    NULL,',
'		                    :wfda_plnt,',
'		                    :wfda_emp_id,',
'		                    :EMP_DESC,',
'		                    :DEPT_ID,',
'		                    :DEPT_DESC,',
'		                    :position,',
'		                    :POS_DESC,',
'		                    1);',
'		 ',
'',
'    ELSIF :wf_auth_type = ''E'' THEN',
'			proc_find_emp_details(:wfda_appr_bu,',
'                                  :wfda_position,',
'                                  NULL,',
'                                  NULL,',
'                                  :wfda_plnt,',
'                                  :position,',
'                                  :POS_DESC,',
'                                  :DEPT_ID,',
'                                  :DEPT_DESC,',
'                                  :wfda_emp_id,',
'                                  :EMP_DESC,',
'                                  1);',
'	END IF;',
'',
'END IF;												 ',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'      UPDATE wf_direct_authorization',
'         SET wfda_position  = :wfda_position,',
'             wfda_date_from = :wfda_date_from,',
'             wfda_date_to   = :wfda_date_to,',
'             wfda_value     = :wfda_value,',
'             wfda_aod_flag  = :wfda_aod_flag,',
'             wfda_mobile_no = :wfda_mobile_no,',
'             wfda_plnt      = :wfda_plnt,',
'             wfda_sub_seq_no = :wfda_sub_seq_no,',
'             wfda_appr_bu   = :wfda_appr_bu, ',
'             wfda_disc_pct  = :wfda_disc_pct,',
'             wfda_dflt_flag = :wfda_dflt_flag,',
'             wfda_cre_ip_addr = :wfda_cre_ip_addr,',
'             wfda_cre_os_user = :wfda_cre_os_user,',
'             wfda_cre_date   = :wfda_cre_date,',
'             wfda_upd_by   = :wfda_upd_by,',
'             wfda_upd_ip_addr = :wfda_upd_ip_addr,',
'             wfda_upd_os_user = :wfda_upd_os_user,',
'             wfda_upd_date = :wfda_upd_date,',
'             wfda_cre_emp_id = :wfda_cre_emp_id,',
'             wfda_upd_emp_id = :wfda_upd_emp_id,',
'             wfda_mail_opt_flag = :wfda_mail_opt_flag,',
'             wfda_sender_mail = :wfda_sender_mail ',
'       WHERE wfda_bu         = :Global_bu ',
'         AND wfda_type       = :P2361300101_WF_TYPE',
'         AND wfda_seq_no     = :P2361300101_SEQ_NO',
'         AND wfda_sub_seq_no = :wfda_sub_seq_no;',
' ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'	  DELETE',
'        FROM wf_direct_authorization',
'	   WHERE wfda_bu          = :Global_bu ',
'         AND wfda_type       = :P2361300101_WF_TYPE',
'         AND wfda_seq_no     = :P2361300101_SEQ_NO',
'         AND wfda_sub_seq_no = :wfda_sub_seq_no;',
'            COMMIT;',
'   END IF;',
'',
'   COMMIT;',
'END;			  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1099808760218458528
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6581770163130069554)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7631255961058124216)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Workflow_Auth - Save Interactive Grid Data'
,p_static_id=>'workflow-auth-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1099808327586458526
);
wwv_flow_imp.component_end;
end;
/
