prompt --application/pages/page_00193
begin
--   Manifest
--     PAGE: 00193
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
 p_id=>193
,p_name=>'Doc. Mgmt. Bulk Upload'
,p_alias=>'DOC-MGMT-BULK-UPLOAD'
,p_step_title=>'Doc. Mgmt. Bulk Upload'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-itemWrapper {',
'    /* display: flex; */',
'    align-items: flex-start;',
'    flex-wrap: nowrap;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6843565770495834605)
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
 p_id=>wwv_flow_imp.id(6842938897898429772)
,p_plug_name=>'Doc. Mgmt. Bulk Upload'
,p_static_id=>'doc-mgmt-bulk-upload'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT_BULK_UPLOAD_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6843566499605834613)
,p_plug_name=>'Doc. Mgmt. Bulk Upload Ln'
,p_static_id=>'doc-mgmt-bulk-upload-ln'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DMBUL_BU,',
'       DMBUL_DOC_NO,',
'       DMBUL_SEQ_NO,',
'       DMBUL_DOC_TYPE,',
'       TO_CHAR(DMBUL_DUE_DATE,:GLOBAL_DATE_FORMAT)DMBUL_DUE_DATE,',
'       TO_CHAR(DMBUL_RTN_END_DATE,:GLOBAL_DATE_FORMAT)DMBUL_RTN_END_DATE,',
'       DMBUL_TAGS,',
'       DMBUL_VOU_PFX,',
'       DMBUL_VOU_TYPE,',
'       DMBUL_VOU_NO,',
'       TO_CHAR(DMBUL_VOU_DATE,:GLOBAL_DATE_FORMAT)DMBUL_VOU_DATE,',
'       DMBUL_PARTY_ID,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = DMBUL_BU ',
'           AND suplr_suplr_id = DMBUL_PARTY_ID) as dmbul_party_name,',
'       DMBUL_ITEM_ID,',
'       (SELECT (prod_desc11 || '' '' || prod_desc21)',
'          FROM products',
'         WHERE prod_bu = DMBUL_BU',
'           AND prod_id = DMBUL_ITEM_ID',
'           AND prod_rev = DMBUL_PROD_REV) AS dmbul_prod_desc,',
'       DMBUL_EMP_ID,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) AS emp_name',
'          FROM employees',
'         WHERE emp_bu = DMBUL_BU',
'           AND emp_emp_id = DMBUL_EMP_ID) emp_name,',
'       DMBUL_NOTES,',
'       DMBUL_LOC_ID,',
'       DMBUL_PLNT_ID,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = DMBUL_BU',
'           AND bupld_loc_id = DMBUL_LOC_ID ) dma_loc_dec,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = DMBUL_BU ',
'           AND bup_plant_id = DMBUL_PLNT_ID) dma_plnt_dec,',
'       DMBUL_CLOB_DATA,',
'       DMBUL_FILE_NAME,',
'       DMBUL_MIME_TYPE,',
'       DMBUL_DOC_NAME,',
'       DMBUL_CRE_BY,',
'       DMBUL_CRE_DATE,',
'       DMBUL_CRE_EMP_ID,',
'       DMBUL_CRE_OS_USER,',
'       DMBUL_CRE_IP_ADDR,',
'       DMBUL_UPD_BY,',
'       DMBUL_UPD_DATE,',
'       DMBUL_UPD_EMP_ID,',
'       DMBUL_UPD_OS_USER,',
'       DMBUL_UPD_IP_ADDR,',
'       DMBUL_FLAG,',
'       DMBUL_PROD_REV',
'  from DOC_MGMT_BULK_UPLOAD_LN',
' where DMBUL_BU = :GLOBAL_BU',
'   and DMBUL_DOC_NO = :P193_DMBUH_DOC_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P193_DMBUH_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6870324802481218807)
,p_name=>'DMA_LOC_DEC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMA_LOC_DEC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Loaction Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6870324891918218808)
,p_name=>'DMA_PLNT_DEC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMA_PLNT_DEC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>400
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843566685396834615)
,p_name=>'DMBUL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_BU'
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
 p_id=>wwv_flow_imp.id(6843568302449834631)
,p_name=>'DMBUL_CLOB_DATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CLOB_DATA'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Dmbul Clob Data'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843568712691834635)
,p_name=>'DMBUL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Cre By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(6843568800203834636)
,p_name=>'DMBUL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dmbul Cre Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(6843568889864834637)
,p_name=>'DMBUL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Cre Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(6843569141616834639)
,p_name=>'DMBUL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Cre Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(6843569001593834638)
,p_name=>'DMBUL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Cre Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(6843568631171834634)
,p_name=>'DMBUL_DOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_DOC_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_imp.id(6843566824250834616)
,p_name=>'DMBUL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P193_DMBUH_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843567016935834618)
,p_name=>'DMBUL_DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(6843567100942834619)
,p_name=>'DMBUL_DUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_DUE_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Due Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(6843567952294834627)
,p_name=>'DMBUL_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. ID'
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
 p_id=>wwv_flow_imp.id(6843568457674834632)
,p_name=>'DMBUL_FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'File Path'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_imp.id(6843569732936834645)
,p_name=>'DMBUL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
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
 p_id=>wwv_flow_imp.id(6843567821840834626)
,p_name=>'DMBUL_ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_ITEM_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(6843568087780834629)
,p_name=>'DMBUL_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Loc. ID'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843568512364834633)
,p_name=>'DMBUL_MIME_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_MIME_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mime Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_imp.id(6843568077410834628)
,p_name=>'DMBUL_NOTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_NOTES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Notes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_imp.id(6843567745442834625)
,p_name=>'DMBUL_PARTY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_PARTY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_imp.id(6870324401924218803)
,p_name=>'DMBUL_PARTY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_PARTY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843568251022834630)
,p_name=>'DMBUL_PLNT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_PLNT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(6870324596545218805)
,p_name=>'DMBUL_PROD_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_PROD_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Item Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>301
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6870324716239218806)
,p_name=>'DMBUL_PROD_REV'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_PROD_REV'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Item Rev.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
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
 p_id=>wwv_flow_imp.id(6843567221779834620)
,p_name=>'DMBUL_RTN_END_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_RTN_END_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Retention End Date'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(6843566908807834617)
,p_name=>'DMBUL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_SEQ_NO'
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
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(6843567329930834621)
,p_name=>'DMBUL_TAGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_TAGS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tags'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_imp.id(6843569247915834640)
,p_name=>'DMBUL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Upd By'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(6843569360566834641)
,p_name=>'DMBUL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dmbul Upd Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(6843569476648834642)
,p_name=>'DMBUL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Upd Emp Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(6843569666298834644)
,p_name=>'DMBUL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Upd Ip Addr'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(6843569520990834643)
,p_name=>'DMBUL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dmbul Upd Os User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(6843567619536834624)
,p_name=>'DMBUL_VOU_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_VOU_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Vou. Date'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(6843567565655834623)
,p_name=>'DMBUL_VOU_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_VOU_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(6242171488439628185)
,p_name=>'DMBUL_VOU_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_VOU_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou. Pfx.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>410
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6843567419690834622)
,p_name=>'DMBUL_VOU_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DMBUL_VOU_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub. Vou. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(6870324553411218804)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(6843569836325834646)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6843566634775834614)
,p_internal_uid=>1364045650990914412
,p_is_editable=>false
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
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6844153834635261762)
,p_interactive_grid_id=>wwv_flow_imp.id(6843566634775834614)
,p_static_id=>'13646329'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6844154032278261762)
,p_report_id=>wwv_flow_imp.id(6844153834635261762)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6242177122008628421)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6242171488439628185)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844154561690261767)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6843566685396834615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844155433739261770)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6843566824250834616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844156297588261772)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6843566908807834617)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844157273162261773)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6843567016935834618)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844158164984261775)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6843567100942834619)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844159022738261777)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6843567221779834620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844159939029261778)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6843567329930834621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844160814194261780)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6843567419690834622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844161715349261783)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6843567565655834623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844162595214261784)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6843567619536834624)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844163542911261786)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6843567745442834625)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844164456595261787)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6843567821840834626)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844165328358261789)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6843567952294834627)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844166234107261791)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6843568077410834628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844167088309261792)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6843568087780834629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844168006347261794)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6843568251022834630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844168947663261797)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(6843568302449834631)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844169828954261800)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(6843568457674834632)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>500
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844170770085261802)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(6843568512364834633)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844171602779261803)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(6843568631171834634)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844172546269261805)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(6843568712691834635)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844173470635261806)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(6843568800203834636)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844174332937261808)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(6843568889864834637)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844175258610261809)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(6843569001593834638)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844176183257261812)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(6843569141616834639)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844177066118261814)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(6843569247915834640)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844177896807261816)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(6843569360566834641)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844178869281261817)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(6843569476648834642)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844179703562261820)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(6843569520990834643)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844180646624261822)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(6843569666298834644)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844181578153261823)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(6843569732936834645)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6844182470020261825)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(6843569836325834646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870330262111219127)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6870324401924218803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>288
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870331178857219130)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6870324553411218804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870336726624240309)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6870324596545218805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>324
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870337593435240311)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(6870324716239218806)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870352120938272525)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6870324802481218807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>298
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6870353040462272530)
,p_view_id=>wwv_flow_imp.id(6844154032278261762)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(6870324891918218808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>242
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6844303787234531705)
,p_plug_name=>'UPLOAD'
,p_static_id=>'upload'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6870325653725218815)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.::P193_ROWID:'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6843565873342834606)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6843570236033834650)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to Cancel the document ? ",''CANCEL'' );'
,p_button_condition=>':P193_ROWID IS NOT NULL AND :P193_DMBUH_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6842951208956429792)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P193_DMBUH_BU is null or :P193_DMBUH_DOC_NO is null'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6843570345132834651)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
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
,p_button_condition=>':P193_ROWID IS NOT NULL AND :P193_DMBUH_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6842950838257429792)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P193_ROWID IS NOT NULL AND :P193_DMBUH_STATUS IN (''N'') AND :P193_LINE_COUNT < 0'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6846315047257406303)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'Template'
,p_static_id=>'template'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Template'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P193_ROWID IS NOT NULL AND :P193_DMBUH_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6844303714340531704)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6843565770495834605)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P193_ROWID IS NOT NULL AND :P193_DMBUH_STATUS IN (''N'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6844304034837531707)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6844303787234531705)
,p_button_name=>'UPLOAD_MUTI'
,p_static_id=>'upload-muti'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6846315227352406305)
,p_branch_name=>'for Template'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6846315047257406303)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842939295001429773)
,p_name=>'P193_DMBUH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842941286853429783)
,p_name=>'P193_DMBUH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842941744695429783)
,p_name=>'P193_DMBUH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'DMBUH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842942109087429783)
,p_name=>'P193_DMBUH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842942906369429783)
,p_name=>'P193_DMBUH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842942569006429783)
,p_name=>'P193_DMBUH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842940088285429780)
,p_name=>'P193_DMBUH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_default=>'TO_CHAR(SYSDATE,:GLOBAL_DATE_FORMAT)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'DMBUH_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'READONLY=READONLY tabindex="-1"'
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
 p_id=>wwv_flow_imp.id(6842939691192429777)
,p_name=>'P193_DMBUH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842940516479429781)
,p_name=>'P193_DMBUH_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_default=>'Attachment'
,p_prompt=>'Reference'
,p_source=>'DMBUH_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6842940950685429783)
,p_name=>'P193_DMBUH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_default=>'N'
,p_source=>'DMBUH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842943343445429784)
,p_name=>'P193_DMBUH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842943779291429784)
,p_name=>'P193_DMBUH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'DMBUH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842944139683429784)
,p_name=>'P193_DMBUH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842944932580429784)
,p_name=>'P193_DMBUH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6842944509961429784)
,p_name=>'P193_DMBUH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'DMBUH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6870325532228218814)
,p_name=>'P193_LINE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6843566499605834613)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(*)',
'  FROM doc_mgmt_bulk_upload_ln',
' WHERE dmbul_bu = :GLOBAL_BU',
'   AND dmbul_doc_no = :P193_DMBUH_DOC_NO'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6843565541857834603)
,p_name=>'P193_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_item_source_plug_id=>wwv_flow_imp.id(6842938897898429772)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844303924485531706)
,p_name=>'P193_UPLOAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6844303787234531705)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'Y',
  'display_as', 'DROPZONE_INLINE',
  'max_file_size', '100000',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6843566002677834608)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P193_DMBUH_REF IS NULL THEN ',
'   RETURN (''Reference must be entred.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'SAVE,CREATE,Post'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(6842940516479429781)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6844304327690531710)
,p_validation_name=>'UPLOAD'
,p_static_id=>'upload'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P193_UPLOAD IS NULL THEN',
'   RETURN (''File must be selected.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6844304034837531707)
,p_associated_item=>wwv_flow_imp.id(6844303924485531706)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6844304136610531708)
,p_name=>'Open Region'
,p_static_id=>'open-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6844303714340531704)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6844304235312531709)
,p_event_id=>wwv_flow_imp.id(6844304136610531708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6844303787234531705)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6875504561319689203)
,p_name=>'POST'
,p_static_id=>'post'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_LINE_COUNT'
,p_condition_element=>'P193_LINE_COUNT'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6875504847712689206)
,p_event_id=>wwv_flow_imp.id(6875504561319689203)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6843570345132834651)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6875504615507689204)
,p_event_id=>wwv_flow_imp.id(6875504561319689203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6843570345132834651)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6844945058674261206)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bulk Upload'
,p_static_id=>'bulk-upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_file        UTL_FILE.file_type;',
'    l_buffer      RAW(32767);',
'    l_amount      BINARY_INTEGER := 32767;',
'    l_pos         INTEGER;',
'',
'    l_blob        BLOB;',
'    l_filename    VARCHAR2(255);',
'    l_storedname  VARCHAR2(255);',
'    l_path        VARCHAR2(500) := ''D:\Roadmap\Apex_attachments\'';',
'    v_seq_no      NUMBER(12,3);',
'BEGIN',
'    FOR rec IN (',
'        SELECT *',
'        FROM apex_application_temp_files',
'        WHERE name IN (',
'            SELECT column_value',
'            FROM apex_string.split(:P193_UPLOAD, '':'')',
'        )',
'    )',
'    LOOP',
'        l_blob     := rec.blob_content;',
'        l_filename := rec.filename;',
'',
'        l_storedname :=',
'            TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') || ''_'' ||',
'            DBMS_RANDOM.STRING(''X'',6) || ''_'' ||',
'            l_filename;',
'',
'        l_file := UTL_FILE.fopen(''APEX_ATTACH_DIR'', l_storedname, ''wb'', 32767);',
'',
'        l_pos := 1;',
'        WHILE l_pos <= DBMS_LOB.getlength(l_blob)',
'        LOOP',
'            DBMS_LOB.read(l_blob, l_amount, l_pos, l_buffer);',
'            UTL_FILE.put_raw(l_file, l_buffer, TRUE);',
'            l_pos := l_pos + l_amount;',
'        END LOOP;',
'',
'        UTL_FILE.fclose(l_file);',
'',
'        -- INSERT INTO apex_file_attachments (',
'        --     original_name,',
'        --     stored_name,',
'        --     file_path,',
'        --     mime_type,',
'        --     file_size,',
'        --     uploaded_by',
'        -- )',
'        -- VALUES (',
'        --     l_filename,',
'        --     l_storedname,',
'        --     l_path || l_storedname,',
'        --     rec.mime_type,',
'        --     rec.file_size,',
'        --     :APP_USER',
'        -- );',
'',
'    SELECT NVL(MAX(TO_NUMBER(DMBUL_SEQ_NO)), 0) + 1',
'      INTO v_seq_no',
'      FROM DOC_MGMT_BULK_UPLOAD_LN',
'     WHERE DMBUL_BU = :GLOBAL_bu',
'       AND DMBUL_DOC_NO = :P193_DMBUH_DOC_NO;',
'',
'    INSERT INTO DOC_MGMT_BULK_UPLOAD_LN (',
'			    DMBUL_BU,',
'                DMBUL_DOC_NO,',
'                DMBUL_SEQ_NO,',
'                DMBUL_DOC_TYPE,',
'                DMBUL_DUE_DATE,',
'                DMBUL_RTN_END_DATE,',
'                DMBUL_TAGS,',
'                DMBUL_VOU_TYPE,',
'                DMBUL_VOU_NO,',
'                DMBUL_VOU_DATE,',
'                DMBUL_PARTY_ID,',
'                DMBUL_ITEM_ID,',
'                DMBUL_EMP_ID,',
'                DMBUL_NOTES,',
'                DMBUL_LOC_ID,',
'                DMBUL_PLNT_ID,',
'                DMBUL_FILE_NAME,',
'                DMBUL_MIME_TYPE,',
'                DMBUL_DOC_NAME,',
'                DMBUL_CRE_BY,',
'                DMBUL_CRE_DATE,',
'                DMBUL_CRE_EMP_ID,',
'                DMBUL_FLAG',
'			    )',
'		 VALUES( ',
'                :GLOBAL_BU,',
'                :P193_DMBUH_DOC_NO,',
'                v_seq_no,',
'                :DMBUL_DOC_TYPE,',
'                :DMBUL_DUE_DATE,',
'                :DMBUL_RTN_END_DATE,',
'                :DMBUL_TAGS,',
'                :DMBUL_VOU_TYPE,',
'                :DMBUL_VOU_NO,',
'                :DMBUL_VOU_DATE,',
'                :DMBUL_PARTY_ID,',
'                :DMBUL_ITEM_ID,',
'                :DMBUL_EMP_ID,',
'                l_path || l_storedname,--:DMBUL_NOTES,',
'                :DMBUL_LOC_ID,',
'                :DMBUL_PLNT_ID,',
'                 l_filename,',
'                 rec.mime_type,',
'                l_storedname,--:DMBUL_DOC_NAME,',
'                :GLOBAL_USER,',
'                SYSDATE,',
'                :GLOBAL_EMP_ID,',
'                ''N''',
'			    );',
'',
'    END LOOP;',
'',
'    -- Correct cleanup',
'    DELETE FROM apex_application_temp_files',
'    WHERE name IN (',
'        SELECT column_value',
'        FROM apex_string.split(:P1_FILES, '':'')',
'    );',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6844304034837531707)
,p_process_when_type=>'NEVER'
,p_internal_uid=>1365424074889341004
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6852335171902882903)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bulk Upload_1'
,p_static_id=>'bulk-upload-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20010,''hrm''||''-''||:P193_DMBUH_DOC_NO);',
'',
'declare',
'',
'    v_seq_no          number;',
'',
'CURSOR c1',
'    IS',
'SELECT *',
'  FROM DOC_MGMT_BULK_UPLOAD_LN',
' WHERE DMBUL_BU     = :global_bu',
'   AND DMBUL_doc_no = :P193_DMBUH_DOC_NO;',
'',
'   cr1          c1%ROWTYPE;',
'',
'BEGIN',
'    DELETE ',
'      FROM DOC_MGMT_BULK_UPLOAD_LN',
'     WHERE DMBUL_BU     = :global_bu',
'       AND DMBUL_doc_no = :P193_DMBUH_DOC_NO;',
'',
'      FOR p IN (SELECT line_number,',
'                    col001,',
'                    col002,',
'                    col003,',
'                    col004,',
'                    col005,',
'                    col006,',
'                    col007,',
'					col008,',
'					col009,',
'					col010,',
'					col011,',
'					col012,',
'					col013,',
'					col014,',
'                    col015',
'               FROM apex_application_temp_files f,',
'                    TABLE (apex_data_parser.parse (',
'                              p_content                       => f.blob_content,',
'                              p_add_headers_row               => ''Y'',',
'                              p_max_rows                      => 10000,',
'                              p_skip_rows                     => 1,',
'                              p_store_profile_to_collection   => ''FILE_PARSER_COLLECTION'',',
'                              p_file_name                     => f.filename)) p',
'              WHERE f.name = :P193_UPLOAD)',
'      LOOP',
'        -- IF (p.col001 IS NULL AND p.col002 IS NULL AND p.col003 IS NULL AND p.col004 IS NULL AND p.col005 IS NULL AND ',
'        --     p.col006 IS NULL AND p.col007 IS NULL AND p.col008 IS NULL AND p.col009 IS NULL AND p.col010 IS NULL AND ',
'        --     p.col011 IS NULL AND p.col012 IS NULL AND p.col013 IS NULL AND p.col014 IS NULL AND p.col015 IS NULL AND',
'        --     p.col016 IS NULL AND p.col017 IS NULL) THEN',
'',
'        --    EXIT;',
'',
'        -- END IF;',
'',
'    SELECT NVL(MAX(TO_NUMBER(DMBUL_SEQ_NO)), 0) + 1',
'      INTO v_seq_no',
'      FROM DOC_MGMT_BULK_UPLOAD_LN',
'     WHERE DMBUL_BU = :GLOBAL_bu',
'       AND DMBUL_DOC_NO = :P193_DMBUH_DOC_NO;',
'',
' INSERT INTO DOC_MGMT_BULK_UPLOAD_LN(',
'             DMBUL_BU,',
'             DMBUL_DOC_NO,',
'             DMBUL_SEQ_NO,',
'             DMBUL_DOC_TYPE,',
'             DMBUL_DUE_DATE,',
'             DMBUL_RTN_END_DATE,',
'             DMBUL_TAGS,',
'             DMBUL_VOU_PFX,',
'             DMBUL_VOU_TYPE,',
'             DMBUL_VOU_NO,',
'             DMBUL_VOU_DATE,',
'             DMBUL_PARTY_ID,',
'             DMBUL_ITEM_ID,',
'             DMBUL_EMP_ID,',
'             DMBUL_NOTES,',
'             DMBUL_LOC_ID,',
'             DMBUL_PLNT_ID,',
'             DMBUL_FILE_NAME,',
'             DMBUL_CRE_BY,',
'             DMBUL_CRE_DATE,',
'             DMBUL_CRE_EMP_ID',
'             )',
'      VALUES(',
'             :GLOBAL_BU,            --  DMBUL_BU,',
'             :P193_DMBUH_DOC_NO,    --  DMBUL_DOC_NO,',
'             v_seq_no,              --  DMBUL_SEQ_NO,',
'             UPPER(p.col001),       --  DMBUL_DOC_TYPE,',
'             CASE WHEN SUBSTR(:P193_UPLOAD,INSTR(:P193_UPLOAD,''.'',1)+1) = ''xlsx'' ',
'                                         THEN TO_DATE(p.col002, ''YYYY-MM-DD'')',
'                                         ELSE TO_DATE (p.col002, ''DD-MON-YYYY'')',
'             END,       --  DMBUL_DUE_DATE,',
'             CASE WHEN SUBSTR(:P193_UPLOAD,INSTR(:P193_UPLOAD,''.'',1)+1) = ''xlsx'' ',
'                                         THEN TO_DATE(p.col003, ''YYYY-MM-DD'')',
'                                         ELSE TO_DATE(p.col003, ''DD-MON-YYYY'')',
'             END,       --  DMBUL_RTN_END_DATE,',
'             UPPER(p.col004),       --  DMBUL_TAGS,',
'             UPPER(p.col005),',
'             UPPER(p.col006),       --  DMBUL_VOU_TYPE,',
'             UPPER(p.col007),       --  DMBUL_VOU_NO,',
'             CASE WHEN SUBSTR(:P193_UPLOAD,INSTR(:P193_UPLOAD,''.'',1)+1) = ''xlsx'' ',
'                                         THEN TO_DATE(p.col008, ''YYYY-MM-DD'')',
'                                         ELSE TO_DATE(p.col008, ''DD-MON-YYYY'')',
'             END,       --  DMBUL_VOU_DATE,',
'             UPPER(p.col009),       --  DMBUL_PARTY_ID,',
'             UPPER(p.col010),       --  DMBUL_ITEM_ID,',
'             UPPER(p.col011),       --  DMBUL_EMP_ID,',
'             UPPER(p.col012),       --  DMBUL_NOTES,',
'             UPPER(p.col013),       --  DMBUL_LOC_ID,',
'             UPPER(p.col014),       --  DMBUL_PLNT_ID,',
'             UPPER(p.col015),       --  DMBUL_FILE_NAME,',
'             :GLOBAL_USER,          --  DMBUL_CRE_BY,',
'             SYSDATE,               --  DMBUL_CRE_DATE,',
'             :GLOBAL_EMP_ID         --  DMBUL_CRE_EMP_ID',
'             );',
'      END LOOP;',
'',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'        IF c1%FOUND THEN',
'            apex_application.g_print_success_message := ''<span>Loaded successfully.</span>'';',
'        ELSE',
'            apex_application.g_print_success_message := ''<span>Not Loaded.</span>'';',
'        END IF;',
'      CLOSE c1;',
'',
'COMMIT;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6844304034837531707)
,p_internal_uid=>1372814188117962701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6844303648285531703)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel  Process'
,p_static_id=>'cancel-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P193_DMBUH_STATUS IN (''N'') THEN',
'    ',
'    UPDATE doc_mgmt_bulk_upload_hd',
'       SET dmbuh_status = ''C'',',
'           dmbuh_upd_by = :GLOBAL_USER,',
'           dmbuh_upd_date = SYSDATE,',
'           dmbuh_upd_emp_id = :GLOBAL_EMP_ID',
'     WHERE dmbuh_bu = :GLOBAL_BU',
'       AND dmbuh_doc_no = :P193_DMBUH_DOC_NO;',
'',
'    APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Document cancelled.</span>'';',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CANCEL'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1364782664500611501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6842952039400429794)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6842938897898429772)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Doc. Mgmt. Bulk Upload'
,p_static_id=>'initialize-form-doc-mgmt-bulk-upload'
,p_internal_uid=>1363431055615509592
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6843570449137834652)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post Process'
,p_static_id=>'post-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_res           VARCHAR2(1);',
'BEGIN',
'    proc_doc_mgmt_bulk_uploda(:GLOBAL_BU,:P193_DMBUH_DOC_NO,:GLOBAL_USER,v_res);',
'',
'    IF v_res = ''Y'' THEN',
'',
'        UPDATE doc_mgmt_bulk_upload_hd',
'           SET dmbuh_status = ''P'',',
'               dmbuh_upd_by = :GLOBAL_USER,',
'               dmbuh_upd_date = SYSDATE,',
'               dmbuh_upd_emp_id = :GLOBAL_EMP_ID',
'         WHERE dmbuh_bu = :GLOBAL_BU',
'           AND dmbuh_doc_no = :P193_DMBUH_DOC_NO;',
'',
'       COMMIT;',
'',
'        APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Document Posted</span>'';',
'',
'    END IF;	',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'POST'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1364049465352914450
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6843565647213834604)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P193_ROWID IS NULL THEN',
'   ',
'    SELECT (NVL(max(TO_NUMBER(dmbuh_doc_no)),1000000000)) + 1 ',
'      INTO :P193_DMBUH_DOC_NO',
'      FROM doc_mgmt_bulk_upload_hd',
'     WHERE dmbuh_bu = :GLOBAL_BU;',
'    ',
'   :P193_DMBUH_BU            := :GLOBAL_BU;',
'   :P193_DMBUH_CRE_BY        := :GLOBAL_USER;',
'   :P193_DMBUH_CRE_IP_ADDR   := :GLOBAL_IP;',
'   :P193_DMBUH_CRE_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P193_DMBUH_CRE_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'',
'ELSE',
'   :P193_DMBUH_UPD_BY        := :GLOBAL_USER;',
'   :P193_DMBUH_UPD_IP_ADDR   := :GLOBAL_IP;',
'   :P193_DMBUH_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P193_DMBUH_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1364044663428914402
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6842952410926429795)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6842938897898429772)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Doc. Mgmt. Bulk Upload_Create'
,p_static_id=>'process-form-doc-mgmt-bulk-upload-create'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6842951208956429792)
,p_internal_uid=>1363431427141509593
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6843565935546834607)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6842938897898429772)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Doc. Mgmt. Bulk Upload_Save'
,p_static_id=>'process-form-doc-mgmt-bulk-upload-save'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6842950838257429792)
,p_internal_uid=>1364044951761914405
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6846315087466406304)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Template Downlead'
,p_static_id=>'template-downlead'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PROC_DOC_MGMT_BULK_TEMP(:GLOBAL_BU,:GLOBAL_USER,''DOC0020'',:GLOBAL_FILE_NAME);',
'  COMMIT;',
'',
'END;  ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6846315047257406303)
,p_internal_uid=>1366794103681486102
);
wwv_flow_imp.component_end;
end;
/
