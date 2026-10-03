prompt --application/pages/page_00108
begin
--   Manifest
--     PAGE: 00108
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
 p_id=>108
,p_name=>'Notification Access'
,p_alias=>'USER-DASHBOARD-ACCESS'
,p_step_title=>'Notification Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: white;',
'    --a-checkbox-text-color: #028107;',
'    --a-button-border-radius: #00d7c9;',
'    --a-checkbox-border-color: #cd9a00;',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15609225225916247346)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15602132758366336977)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUDAH_BU,',
'       WUDAH_DOC_NO,',
'       WUDAH_DOC_DATE,',
'       WUDAH_TYPE,',
'       WUDAH_REF,',
'       WUDAH_STATUS,',
'       WUDAH_CRE_BY,',
'       WUDAH_CRE_IP_ADDR,',
'       WUDAH_CRE_OS_USER,',
'       WUDAH_CRE_EMP_ID,',
'       WUDAH_CRE_DATE,',
'       WUDAH_UPD_BY,',
'       WUDAH_UPD_IP_ADDR,',
'       WUDAH_UPD_OS_USER,',
'       WUDAH_UPD_EMP_ID,',
'       WUDAH_UPD_DATE',
'  from WAPL_USER_DABHBOARD_ACCS_HD'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15609225978230247354)
,p_plug_name=>'Line'
,p_static_id=>'line'
,p_region_name=>'line'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUDAL_BU,',
'       WUDAL_DOC_NO,',
'       WUDAL_SEQ_NO,',
'       WUDAL_USER_ID,',
'       WUDAL_PARTY_ID,',
'       (Select distinct TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          from employees,',
'               appl_users',
'         where emp_bu        = appluser_bu',
'           AND appluser_id   = WUDAL_USER_ID',
'           AND emp_bu        = :GLOBAL_BU',
'           and emp_emp_id    = WUDAL_PARTY_ID',
'           AND appluser_user_type NOT IN (''S'',''C'')',
'        UNION ALL',
'        SELECT DISTINCT suplr_name1',
'         FROM suppliers,',
'              appl_users',
'        WHERE appluser_bu   = suplr_bu',
'          AND appluser_id   = WUDAL_USER_ID',
'          AND suplr_bu      = :GLOBAL_BU',
'          AND suplr_party_type = ''S''',
'          AND suplr_suplr_id   = WUDAL_PARTY_ID',
'          AND appluser_user_type = ''S''',
'        UNION ALL',
'        SELECT DISTINCT suplr_name1',
'         FROM suppliers,',
'              appl_users',
'        WHERE appluser_bu   = suplr_bu',
'          AND appluser_id   = WUDAL_USER_ID',
'          AND suplr_bu      = :GLOBAL_BU',
'          AND suplr_party_type = ''C''',
'          AND suplr_suplr_id   = WUDAL_PARTY_ID',
'          AND appluser_user_type = ''C'') WUDAL_PARTY_NAME,',
'       WUDAL_TYPE,',
'       WUDAL_SEL_FLAG,',
'       WUDAL_CRE_BY,',
'       WUDAL_CRE_IP_ADDR,',
'       WUDAL_CRE_OS_USER,',
'       WUDAL_CRE_EMP_ID,',
'       WUDAL_CRE_DATE,',
'       WUDAL_UPD_BY,',
'       WUDAL_UPD_IP_ADDR,',
'       WUDAL_UPD_OS_USER,',
'       WUDAL_UPD_EMP_ID,',
'       WUDAL_UPD_DATE',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P108_WUDAH_DOC_NO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P108_WUDAH_STATUS'
,p_plug_read_only_when2=>'N'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Line'
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
 p_id=>wwv_flow_imp.id(15609228107627247375)
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
 p_id=>wwv_flow_imp.id(15609228235818247376)
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
 p_id=>wwv_flow_imp.id(15609227934791247373)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15609226208836247356)
,p_name=>'WUDAL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_BU'
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
 p_id=>wwv_flow_imp.id(15609226954776247363)
,p_name=>'WUDAL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_CRE_BY'
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
 p_id=>wwv_flow_imp.id(15609227348244247367)
,p_name=>'WUDAL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(15609227225442247366)
,p_name=>'WUDAL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(15609227064438247364)
,p_name=>'WUDAL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(15609227153249247365)
,p_name=>'WUDAL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(15609226364341247357)
,p_name=>'WUDAL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_DOC_NO'
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
 p_id=>wwv_flow_imp.id(15609226614751247360)
,p_name=>'WUDAL_PARTY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_PARTY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party/Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(15609228866013247383)
,p_name=>'WUDAL_PARTY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_PARTY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party/Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>122
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
 p_id=>wwv_flow_imp.id(15609226786630247362)
,p_name=>'WUDAL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(15609226384550247358)
,p_name=>'WUDAL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15609226719040247361)
,p_name=>'WUDAL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Dashboard Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:None;N,Purchase;P,Purchase Manager;PM,Sales;S,Sales Manager;SM,Inventory;I,Inventory Manager;IM,HR Manager;HRM,Finance;F,Finance Manager;FM,Quality;Q,Quality Inspector;QM,Production;PR,Production Manager;PRM,Maintenance;MD,Maintenance  Manage'
||'r;MMD'
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
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15609227406054247368)
,p_name=>'WUDAL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_UPD_BY'
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
 p_id=>wwv_flow_imp.id(15609227781517247372)
,p_name=>'WUDAL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_UPD_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(15609227744352247371)
,p_name=>'WUDAL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(15609227480102247369)
,p_name=>'WUDAL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(15609227598225247370)
,p_name=>'WUDAL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(15609226472529247359)
,p_name=>'WUDAL_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WUDAL_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>60
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
 p_id=>wwv_flow_imp.id(15609226139295247355)
,p_internal_uid=>10127264303751636327
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
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
 p_id=>wwv_flow_imp.id(15609624659239563383)
,p_interactive_grid_id=>wwv_flow_imp.id(15609226139295247355)
,p_static_id=>'24933588'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>15
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(15609624810358563389)
,p_report_id=>wwv_flow_imp.id(15609624659239563383)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(13116265921094482146)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(15609228235818247376)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609625211080563402)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(15609226208836247356)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609626123913563419)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(15609226364341247357)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609627023630563430)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(15609226384550247358)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609627885875563442)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(15609226472529247359)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609628777176563450)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(15609226614751247360)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609629686785563459)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(15609226719040247361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609630658361563470)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(15609226786630247362)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609631469041563478)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(15609226954776247363)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609632292301563486)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(15609227064438247364)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609633220189563500)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(15609227153249247365)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609634067253563511)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(15609227225442247366)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609635020710563519)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(15609227348244247367)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609635869403563527)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(15609227406054247368)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609636796340563534)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(15609227480102247369)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609637749892563548)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(15609227598225247370)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609638635600563555)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(15609227744352247371)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609639562084563563)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(15609227781517247372)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609640389582563570)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(15609227934791247373)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15609657146977579770)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(15609228107627247375)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15610108916479773148)
,p_view_id=>wwv_flow_imp.id(15609624810358563389)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(15609228866013247383)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026778221117594067)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:108::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026777777435594065)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026780599048594085)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P108_ROWID IS NOT NULL AND :P108_WUDAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026778616269594082)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P108_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026779795602594084)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P108_ROWID IS NOT NULL AND :P108_WUDAH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026780150564594085)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO',
'   and :P108_WUDAH_STATUS = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-send'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026779351569594084)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Save_Line'
,p_static_id=>'save-line'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Line'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO',
'   and :P108_WUDAH_STATUS = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026778956793594082)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(15609225225916247346)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO',
'UNION ALL',
'SELECT 1',
'  FROM DUAL',
' WHERE :P108_ROWID IS NULL'))
,p_button_condition_type=>'NOT_EXISTS'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8026794524562594192)
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8026780599048594085)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609226296424247358)
,p_name=>'P108_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134171909336993)
,p_name=>'P108_WUDAH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WUDAH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134691039336998)
,p_name=>'P108_WUDAH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602135019190337002)
,p_name=>'P108_WUDAH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_format_mask=>'DD-MON-RRRR HH24:MI:SS'
,p_source=>'WUDAH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134931044337001)
,p_name=>'P108_WUDAH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134787099336999)
,p_name=>'P108_WUDAH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134884233337000)
,p_name=>'P108_WUDAH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609226333208247359)
,p_name=>'P108_WUDAH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WUDAH_DOC_DATE'
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
 p_id=>wwv_flow_imp.id(15602134315342336994)
,p_name=>'P108_WUDAH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_prompt=>'Doc. No.'
,p_source=>'WUDAH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>40
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_imp.id(15602134489606336996)
,p_name=>'P108_WUDAH_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_prompt=>'Reference'
,p_source=>'WUDAH_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134586643336997)
,p_name=>'P108_WUDAH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'WUDAH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P,Cancel;L'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15602134378010336995)
,p_name=>'P108_WUDAH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_prompt=>'Type'
,p_source=>'WUDAH_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add;A,Modify;M'
,p_cHeight=>1
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from WAPL_USER_DASHBOARD_ACCS_LN',
' where WUDAL_BU     = :GLOBAL_BU',
'   and WUDAL_DOC_NO = :P108_WUDAH_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609225786509247353)
,p_name=>'P108_WUDAH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609226180702247357)
,p_name=>'P108_WUDAH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_format_mask=>'DD-MON-RRRR HH24:MI:SS'
,p_source=>'WUDAH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609226097813247356)
,p_name=>'P108_WUDAH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609225907207247354)
,p_name=>'P108_WUDAH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15609226016005247355)
,p_name=>'P108_WUDAH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_item_source_plug_id=>wwv_flow_imp.id(15602132758366336977)
,p_source=>'WUDAH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8026793502795594188)
,p_name=>'Line'
,p_static_id=>'line'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(15609225978230247354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8026793938029594190)
,p_event_id=>wwv_flow_imp.id(8026793502795594188)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15609225978230247354)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8026792613086594182)
,p_name=>'Save_Line'
,p_static_id=>'save-line'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8026779351569594084)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8026793105305594185)
,p_event_id=>wwv_flow_imp.id(8026792613086594182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026792226770594182)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE wapl_user_dabhboard_accs_hd',
'   SET wudah_status         = ''L'',',
'       wudah_upd_by         = :Global_user,',
'       wudah_upd_ip_addr    = :Global_ip,',
'       wudah_upd_emp_id     = :Global_cc_emp_id',
' WHERE wudah_bu             = :Global_bu',
'   AND wudah_doc_no         = :P108_WUDAH_DOC_NO;',
'COMMIT;',
'apex_application.g_print_success_message := ''<span>Document Cancelled Successfully.</span>'';  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8026780599048594085)
,p_internal_uid=>2544830391226983154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026776662424594060)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(15602132758366336977)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Dashboard Access'
,p_static_id=>'initialize-form-user-dashboard-access'
,p_internal_uid=>2544814826880983032
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026790506572594179)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(15609225978230247354)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Line - Save Interactive Grid Data'
,p_static_id=>'line-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2544828671028983151
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026791427162594181)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c1',
'        IS',
'    SELECT *',
'      FROM appl_users ',
'     WHERE appluser_bu      = :Global_bu',
'       AND appluser_status  = ''A''',
'       AND appluser_user_type <> ''R''',
'       AND appluser_id NOT IN (SELECT uwdm_user_id',
'                                 FROM user_web_dashboard_master',
'                                WHERE uwdm_bu   = :Global_bu);',
'    ',
'    CURSOR c2',
'        IS',
'    SELECT *',
'      FROM user_web_dashboard_master,',
'           appl_users',
'     WHERE uwdm_bu          = appluser_bu',
'       AND uwdm_user_id     = appluser_id',
'       AND uwdm_bu          = :Global_bu',
'       AND appluser_status  = ''A''',
'       AND appluser_user_type <> ''R'';',
'',
'    v_seq_no        NUMBER(5);',
'BEGIN',
'    IF :P108_WUDAH_TYPE = ''A'' THEN',
'',
'        DELETE ',
'          FROM wapl_user_dashboard_accs_ln',
'         WHERE wudal_bu     = :Global_bu',
'           AND wudal_doc_no = :P108_WUDAH_DOC_NO;',
'',
'        FOR cr1 IN c1',
'        LOOP',
'            SELECT NVL(MAX(wudal_seq_no),0) + 1',
'              INTO v_seq_no',
'              FROM wapl_user_dashboard_accs_ln',
'             WHERE wudal_bu     = :Global_bu',
'               AND wudal_doc_no = :P108_WUDAH_DOC_NO;',
'',
'            INSERT INTO wapl_user_dashboard_accs_ln(wudal_bu,',
'                                                    wudal_doc_no	,',
'                                                    wudal_seq_no	,',
'                                                    wudal_user_id	,',
'                                                    wudal_party_id	,',
'                                                    wudal_type	    ,',
'                                                    wudal_sel_flag	,',
'                                                    wudal_cre_by	,',
'                                                    wudal_cre_ip_addr	,',
'                                                    wudal_cre_os_user	,',
'                                                    wudal_cre_emp_id	,',
'                                                    wudal_cre_date	)',
'                                            VALUES(:Global_bu,',
'                                                   :P108_WUDAH_DOC_NO,',
'                                                   v_seq_no,',
'                                                   cr1.appluser_id,',
'                                                   cr1.appluser_party_id,',
'                                                   ''N'',',
'                                                   ''Y'',',
'                                                   :Global_user,',
'                                                   :Global_ip,',
'                                                   NULL,',
'                                                   :Global_cc_emp_id,',
'                                                   SYSDATE);',
'        END LOOP;',
'    ',
'    ELSIF :P108_WUDAH_TYPE = ''M'' THEN',
'',
'        DELETE ',
'          FROM wapl_user_dashboard_accs_ln',
'         WHERE wudal_bu     = :Global_bu',
'           AND wudal_doc_no = :P108_WUDAH_DOC_NO;',
'',
'        FOR cr2 IN c2',
'        LOOP',
'            SELECT NVL(MAX(wudal_seq_no),0) + 1',
'              INTO v_seq_no',
'              FROM wapl_user_dashboard_accs_ln',
'             WHERE wudal_bu     = :Global_bu',
'               AND wudal_doc_no = :P108_WUDAH_DOC_NO;',
'',
'            INSERT INTO wapl_user_dashboard_accs_ln(wudal_bu,',
'                                                    wudal_doc_no	,',
'                                                    wudal_seq_no	,',
'                                                    wudal_user_id	,',
'                                                    wudal_party_id	,',
'                                                    wudal_type	    ,',
'                                                    wudal_sel_flag	,',
'                                                    wudal_cre_by	,',
'                                                    wudal_cre_ip_addr	,',
'                                                    wudal_cre_os_user	,',
'                                                    wudal_cre_emp_id	,',
'                                                    wudal_cre_date	)',
'                                            VALUES(:Global_bu,',
'                                                   :P108_WUDAH_DOC_NO,',
'                                                   v_seq_no,',
'                                                   cr2.appluser_id,',
'                                                   cr2.appluser_party_id,',
'                                                   cr2.uwdm_type,',
'                                                   ''Y'',',
'                                                   :Global_user,',
'                                                   :Global_ip,',
'                                                   NULL,',
'                                                   :Global_cc_emp_id,',
'                                                   SYSDATE);',
'        END LOOP;',
'',
'    END IF;',
'    COMMIT;',
'END;                                                                '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8026779795602594084)
,p_internal_uid=>2544829591618983153
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026791749894594182)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post'
,p_static_id=>'post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_cnt            NUMBER(5);',
'    v_accs_cnt       NUMBER(5);',
'',
'    CURSOR c1',
'        IS',
'    SELECT *',
'     FROM wapl_user_dashboard_accs_ln',
'    WHERE wudal_bu     = :Global_bu',
'      AND wudal_doc_no = :P108_WUDAH_DOC_NO',
'      AND wudal_sel_flag = ''Y'';     ',
'BEGIN',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM wapl_user_dashboard_accs_ln',
'     WHERE wudal_bu     = :Global_bu',
'       AND wudal_doc_no = :P108_WUDAH_DOC_NO',
'       AND wudal_sel_flag = ''Y'';',
'',
'    IF v_cnt = 0 THEN ',
'        RAISE_APPLICATION_ERROR(-20999,''Select the Line Detail.'');',
'    END IF;',
'',
'    FOR cr1 IN c1',
'    LOOP',
'        SELECT COUNT(*)',
'          INTO v_accs_cnt',
'          FROM user_web_dashboard_master',
'         WHERE uwdm_bu      = :Global_bu',
'           AND uwdm_user_id = cr1.wudal_user_id;',
'        ',
'        IF v_accs_cnt = 0 THEN',
'            INSERT INTO user_web_dashboard_master(uwdm_bu	,	',
'                                                  uwdm_user_id,	',
'                                                  uwdm_party_id,	',
'                                                  uwdm_type	,',
'                                                  uwdm_cre_by	,',
'                                                  uwdm_cre_ip_addr	,',
'                                                  uwdm_cre_os_user	,',
'                                                  uwdm_cre_emp_id	,',
'                                                  uwdm_cre_date	',
'                                                )',
'                                          VALUES(:Global_bu,',
'                                                 cr1.wudal_user_id,',
'                                                 cr1.wudal_party_id,',
'                                                 cr1.wudal_type,',
'                                                 :GLOBAL_USER,',
'                                                 :GLOBAL_IP,',
'                                                 NULL,',
'                                                 :GLOBAL_CC_EMP_ID,',
'                                                 SYSDATE);                                                                        ',
'        ELSE                                                 ',
'            UPDATE user_web_dashboard_master',
'               SET uwdm_type        = cr1.wudal_type,',
'                   uwdm_upd_by      = :Global_user,',
'                   uwdm_upd_ip_addr = :Global_ip,',
'                   uwdm_upd_emp_id  = :Global_cc_emp_id',
'             WHERE uwdm_bu      = :Global_bu',
'               AND uwdm_user_id = cr1.wudal_user_id;',
'                         ',
'        END IF;',
'        ',
'        UPDATE wapl_user_dabhboard_accs_hd',
'           SET wudah_status         = ''P'',',
'               wudah_upd_by         = :Global_user,',
'               wudah_upd_ip_addr    = :Global_ip,',
'               wudah_upd_emp_id     = :Global_cc_emp_id',
'         WHERE wudah_bu             = :Global_bu',
'           AND wudah_doc_no         = :P108_WUDAH_DOC_NO;',
'        COMMIT;',
'        apex_application.g_print_success_message := ''<span>Document Posted Successfully.</span>'';  ',
'        ',
'    END LOOP;',
'END;    ',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8026780150564594085)
,p_internal_uid=>2544829914350983154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026790938075594179)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P108_ROWID IS NULL THEN',
'     ',
'    SELECT NVL(MAX(TO_NUMBER(WUDAH_DOC_NO)),''1000000000'') +1',
'      INTO :P108_WUDAH_DOC_NO',
'      FROM WAPL_USER_DABHBOARD_ACCS_HD',
'     WHERE WUDAH_BU         =   :GLOBAL_BU;',
'       ',
'    :P108_WUDAH_CRE_BY          := :GLOBAL_USER;',
'    :P108_WUDAH_CRE_IP_ADDR     := :GLOBAL_IP;',
'    :P108_WUDAH_CRE_EMP_ID      := :GLOBAL_CC_EMP_ID;',
'    :P108_WUDAH_CRE_DATE        := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');',
'ELSE',
'    :P108_WUDAH_UPD_BY          := :GLOBAL_USER;',
'    :P108_WUDAH_UPD_IP_ADDR     := :GLOBAL_IP;',
'    :P108_WUDAH_UPD_EMP_ID      := :GLOBAL_CC_EMP_ID;',
'    :P108_WUDAH_UPD_DATE        := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');    ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>2544829102531983151
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8026777104892594063)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(15602132758366336977)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Header'
,p_static_id=>'process-form-header'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Document -&P108_WUDAH_DOC_NO. Created'
,p_internal_uid=>2544815269348983035
);
wwv_flow_imp.component_end;
end;
/
