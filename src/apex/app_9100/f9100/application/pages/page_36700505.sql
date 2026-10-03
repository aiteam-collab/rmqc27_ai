prompt --application/pages/page_36700505
begin
--   Manifest
--     PAGE: 36700505
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
 p_id=>36700505
,p_name=>'Update Customer Details'
,p_alias=>'UPDATE-CUSTOMER-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Update Customer Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {                                    ',
'      border-collapse: collapse;  ',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'650'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210742493953983818)
,p_plug_name=>'Address'
,p_static_id=>'address'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P36700505_TYPE IN (''AD'',''OT'')'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11223237463014994525)
,p_plug_name=>'Bank A/C '
,p_static_id=>'bank-a-c'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'BA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11224835277753810708)
,p_plug_name=>'Contact'
,p_static_id=>'contact'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'CO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11220205123881405317)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'CU'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210744234549983836)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value'
,p_parent_plug_id=>wwv_flow_imp.id(11210742493953983818)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210746116143983854)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-2'
,p_parent_plug_id=>wwv_flow_imp.id(11210745986355983853)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       ssl_bu,',
'       ssl_suplr_id,',
'       ssl_loc_name1,',
'       ssl_loc_name2,',
'       ssl_addr1,',
'       ssl_addr2,',
'       ssl_addr3,',
'       ssl_po_box,',
'       ssl_city,',
'       (SELECT city_name1',
'          FROM cities',
'         WHERE city_bu = ssl_bu',
'           AND city_id = ssl_city) City_name,',
'       (SELECT state_code',
'          FROM states',
'         WHERE state_bu = ssl_bu',
'           AND state_id = ssl_state) state_code,',
'       ssl_state,',
'       ssl_country,',
'       ssl_zip,',
'       ssl_tele,',
'       ssl_mob_no,',
'       ssl_fax,',
'       ssl_email,',
'       ssl_website,',
'       ssl_port,',
'       (SELECT exprt_port_desc',
'          FROM exp_port',
'         WHERE exprt_bu          = :GLOBAL_bu',
'           AND exprt_port        = ssl_port',
'           AND exprt_active_flag = ''Y'') Port_desc,',
'       ssl_tin_no,',
'       ssl_ecc_no,',
'       ssl_ser_tax,',
'       ssl_comm_rate,',
'       ssl_ref1,',
'       ssl_ref2,',
'       ssl_cons,',
'       ssl_cst,',
'       ssl_dflt_flg,',
'       CASE ssl_dflt_flg WHEN ''B'' THEN ''Default Bill''',
'                         WHEN ''S'' THEN ''Default Ship''',
'                         WHEN ''D'' THEN ''Default Bill/Ship''',
'                         WHEN ''I'' THEN ''Bill''',
'                         WHEN ''H'' THEN ''Ship''',
'                         WHEN ''P'' THEN ''Bill/Ship''',
'         END Loc_type,',
'       ssl_bill_frm,',
'       ssl_ship_frm,',
'       ssl_gst_no,',
'       ssl_gst_type,',
'       CASE ssl_gst_type WHEN ''R'' THEN ''Registered''',
'                         WHEN ''U'' THEN ''Unregistered''',
'                         WHEN ''C'' THEN ''Composition''',
'                         WHEN ''S'' THEN ''Casual Person''',
'                         WHEN ''N'' THEN ''Non-Resident''',
'        END GST_TYPE,',
'       ssl_type,',
'       CASE ssl_type WHEN ''L'' THEN ''Local''',
'                     WHEN ''I'' THEN ''Inter-State''',
'                     WHEN ''U'' THEN ''Union Territory''',
'                     WHEN ''S'' THEN ''SEZ-Unit''',
'                     WHEN ''D'' THEN ''SEZ-Developer''',
'                     WHEN ''M'' THEN ''Import''',
'        END gst_Clsf,',
'       ssl_scheme,',
'       CASE ssl_scheme WHEN ''E'' THEN ''EOU''',
'                       WHEN ''O'' THEN ''General''',
'                       WHEN ''S'' THEN ''SEZ''',
'        END Scheme,',
'       ssl_vat_clsfn,',
'       ssl_vat_type,',
'       ssl_pin_no,',
'       ssl_user_sid,',
'       ssl_seq_no,',
'       ssl_temp_status,',
'       ssl_trk_type,',
'       CASE ssl_trk_type WHEN ''M'' THEN ''Modify''',
'                         WHEN ''A'' THEN ''Add''',
'                         WHEN ''D'' THEN ''Delete''',
'        END Type_,',
'       ssl_cre_by,',
'       ssl_cre_ip_addr,',
'       ssl_cre_os_user,',
'       ssl_cre_date,',
'       ssl_upd_by,',
'       ssl_upd_ip_addr,',
'       ssl_upd_os_user,',
'       ssl_upd_date,',
'       ssl_ln_seq_no,',
'       ssl_cre_emp_id,',
'       ssl_upd_emp_id',
'  FROM suplr_ship_loc_edit_temp',
' WHERE ssl_bu          = :global_bu ',
'   AND ssl_suplr_id    = :P36700505_ID',
'   AND ssl_temp_status = ''C'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11219331399854510331)
,p_name=>'CITY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CITY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'City'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219333842871510356)
,p_name=>'GST_CLSF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GST_CLSF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GST Clsf.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(11219333772929510355)
,p_name=>'GST_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GST_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GST Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>13
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
 p_id=>wwv_flow_imp.id(11219333353081510351)
,p_name=>'LOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Loc. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>17
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
 p_id=>wwv_flow_imp.id(11219332461602510342)
,p_name=>'PORT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Port'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11219330409384510321)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219334808774513907)
,p_name=>'SCHEME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCHEME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scheme'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>7
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
 p_id=>wwv_flow_imp.id(11219330922647510326)
,p_name=>'SSL_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(11219331014680510327)
,p_name=>'SSL_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 2'
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
 p_id=>wwv_flow_imp.id(11219331049444510328)
,p_name=>'SSL_ADDR3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 3'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11219333488370510352)
,p_name=>'SSL_BILL_FRM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_BILL_FRM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Bill Frm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(11219330487635510322)
,p_name=>'SSL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11219331246369510330)
,p_name=>'SSL_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl City'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(11219332867857510346)
,p_name=>'SSL_COMM_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_COMM_RATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Comm Rate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(11219333162690510349)
,p_name=>'SSL_CONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CONS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cons'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11219331673054510334)
,p_name=>'SSL_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(11219335582793513915)
,p_name=>'SSL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
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
 p_id=>wwv_flow_imp.id(11219335897074513918)
,p_name=>'SSL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ssl Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
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
 p_id=>wwv_flow_imp.id(11219336519173513924)
,p_name=>'SSL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
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
 p_id=>wwv_flow_imp.id(11219335632150513916)
,p_name=>'SSL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
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
 p_id=>wwv_flow_imp.id(11219335787622513917)
,p_name=>'SSL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
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
 p_id=>wwv_flow_imp.id(11219333226099510350)
,p_name=>'SSL_CST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CST'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cst'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11219336649964513926)
,p_name=>'SSL_DFLT_FLG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_DFLT_FLG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Dflt Flg'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
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
 p_id=>wwv_flow_imp.id(11219332697035510344)
,p_name=>'SSL_ECC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ECC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ecc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11219332137692510339)
,p_name=>'SSL_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219332050619510338)
,p_name=>'SSL_FAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_FAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fax'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219333668556510354)
,p_name=>'SSL_GST_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_GST_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GSTIN No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
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
 p_id=>wwv_flow_imp.id(11219336727980513927)
,p_name=>'SSL_GST_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_GST_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Gst Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>570
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
 p_id=>wwv_flow_imp.id(11219336349068513923)
,p_name=>'SSL_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ssl Ln Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>530
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
 p_id=>wwv_flow_imp.id(11219330642302510324)
,p_name=>'SSL_LOC_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LOC_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11219330758417510325)
,p_name=>'SSL_LOC_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LOC_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Loc Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(11219332008882510337)
,p_name=>'SSL_MOB_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_MOB_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Mob No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219335044132513910)
,p_name=>'SSL_PIN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PIN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Pin No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
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
 p_id=>wwv_flow_imp.id(11219332355429510341)
,p_name=>'SSL_PORT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PORT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Port'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(11219331146622510329)
,p_name=>'SSL_PO_BOX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PO_BOX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Po Box'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219332924057510347)
,p_name=>'SSL_REF1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_REF1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ref1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11219333101905510348)
,p_name=>'SSL_REF2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_REF2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ref2'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11219336942120513929)
,p_name=>'SSL_SCHEME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SCHEME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Scheme'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>590
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
 p_id=>wwv_flow_imp.id(11219335298781513912)
,p_name=>'SSL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ssl Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(11219332772886510345)
,p_name=>'SSL_SER_TAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SER_TAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ser Tax'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11219333585114510353)
,p_name=>'SSL_SHIP_FRM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SHIP_FRM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ship Frm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
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
 p_id=>wwv_flow_imp.id(11219331573926510333)
,p_name=>'SSL_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl State'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11219330569165510323)
,p_name=>'SSL_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Suplr Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11219331825908510336)
,p_name=>'SSL_TELE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TELE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Telephone'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11219335401454513913)
,p_name=>'SSL_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Temp Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(11219332562874510343)
,p_name=>'SSL_TIN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TIN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Tin No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11219337159184513931)
,p_name=>'SSL_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Trk Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>610
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
 p_id=>wwv_flow_imp.id(11219336913693513928)
,p_name=>'SSL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>580
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
 p_id=>wwv_flow_imp.id(11219335928323513919)
,p_name=>'SSL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
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
 p_id=>wwv_flow_imp.id(11219336266126513922)
,p_name=>'SSL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ssl Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
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
 p_id=>wwv_flow_imp.id(11219336560650513925)
,p_name=>'SSL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
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
 p_id=>wwv_flow_imp.id(11219336025068513920)
,p_name=>'SSL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
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
 p_id=>wwv_flow_imp.id(11219336156255513921)
,p_name=>'SSL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
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
 p_id=>wwv_flow_imp.id(11219335153590513911)
,p_name=>'SSL_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ssl User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(11219334920153513908)
,p_name=>'SSL_VAT_CLSFN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_VAT_CLSFN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Vat Clsfn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
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
 p_id=>wwv_flow_imp.id(11219335001244513909)
,p_name=>'SSL_VAT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_VAT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Vat Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
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
 p_id=>wwv_flow_imp.id(11219332305066510340)
,p_name=>'SSL_WEBSITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_WEBSITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Website'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11219331751680510335)
,p_name=>'SSL_ZIP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ZIP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'ZIP/PIN Code'
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
 p_id=>wwv_flow_imp.id(11219331459933510332)
,p_name=>'STATE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATE_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'State Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(11219337064482513930)
,p_name=>'TYPE_'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE_'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>600
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11219330305236510320)
,p_internal_uid=>5737368469692899292
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11219340959104514327)
,p_interactive_grid_id=>wwv_flow_imp.id(11219330305236510320)
,p_static_id=>'15597904'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11219341211139514327)
,p_report_id=>wwv_flow_imp.id(11219340959104514327)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659555873598211758)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11219337064482513930)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659556627313208927)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(11219336649964513926)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659557700339208939)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(11219336727980513927)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659558691256208950)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(11219336913693513928)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659559656534208961)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(11219336942120513929)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659561003709216953)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(11219337159184513931)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219341672714514343)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11219330409384510321)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219342531589514362)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11219330487635510322)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219343361145514382)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11219330569165510323)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219344225547514393)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11219330642302510324)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219345204503514402)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11219330758417510325)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219346093036514413)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11219330922647510326)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219346947693514424)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11219331014680510327)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219347899838514435)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11219331049444510328)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>169
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219348819224514445)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11219331146622510329)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219349693957514454)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11219331246369510330)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219350614509514465)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11219331399854510331)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219351365684514474)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11219331459933510332)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219352283521514487)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11219331573926510333)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219353160978514499)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11219331673054510334)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219354122246514510)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11219331751680510335)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219355093822514520)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11219331825908510336)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219355950775514538)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11219332008882510337)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219356852198514549)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11219332050619510338)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219357797670514559)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11219332137692510339)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219358559202514568)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11219332305066510340)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219359424117514579)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11219332355429510341)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219360410600514596)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11219332461602510342)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219361311465514609)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11219332562874510343)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219362154285514621)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11219332697035510344)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219363106144514631)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11219332772886510345)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219363954360514641)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(11219332867857510346)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219364864650514654)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(11219332924057510347)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219365765575514663)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(11219333101905510348)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219366571955514673)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(11219333162690510349)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219367467081514684)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(11219333226099510350)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219368395096514693)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11219333353081510351)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219369247020514704)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(11219333488370510352)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219370155989514716)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(11219333585114510353)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219371070055514729)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11219333668556510354)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>131
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219371941210514745)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11219333772929510355)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219372847091514754)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11219333842871510356)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219373762045514763)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11219334808774513907)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219374586402514774)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(11219334920153513908)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219375437133514782)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(11219335001244513909)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219376356081514793)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(11219335044132513910)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219377251255514804)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(11219335153590513911)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219378126358514813)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(11219335298781513912)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219379098900514823)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(11219335401454513913)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219380844186514843)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(11219335582793513915)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219381814757514852)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(11219335632150513916)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219382716386514862)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(11219335787622513917)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219383482660514871)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(11219335897074513918)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219384326735514881)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(11219335928323513919)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219385247716514890)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(11219336025068513920)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219386202903514899)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(11219336156255513921)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219387065393514910)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(11219336266126513922)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219387946405514920)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(11219336349068513923)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219388856240514931)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(11219336519173513924)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219389775482514941)
,p_view_id=>wwv_flow_imp.id(11219341211139514327)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(11219336560650513925)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11220205256062405318)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-3'
,p_parent_plug_id=>wwv_flow_imp.id(11220205123881405317)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       scb_bu,',
'       scb_suplr_id,',
'       scb_currency,',
'       (SELECT curcy_desc1',
'          FROM currencies ',
'         WHERE curcy_bu      = :GLOBAL_BU',
'           AND curcy_id      = scb_currency',
'           AND curcy_usg_flg =''Y'') curcy_name,',
'       scb_crd_lmt,',
'       scb_pend_inv_amt,',
'       scb_cur_bal,',
'       scb_unapp_amt,',
'       scb_adv_amt,',
'       CASE scb_trk_type WHEN ''M'' THEN ''Modify''',
'                         WHEN ''A'' THEN ''Add''',
'                         WHEN ''D'' THEN ''Delete''',
'         END type_,',
'       scb_seq_no,',
'       scb_temp_status,',
'       scb_cre_by,',
'       scb_cre_ip_addr,',
'       scb_cre_os_user,',
'       scb_cre_date,',
'       scb_upd_by,',
'       scb_upd_ip_addr,',
'       scb_upd_os_user,',
'       scb_upd_date,',
'       scb_ln_seq_no,',
'       scb_cre_emp_id,',
'       scb_upd_emp_id',
'  FROM suplr_curr_bal_edit_temp',
' WHERE scb_bu          = :GLOBAL_BU',
'   AND scb_suplr_id    = :P36700505_ID',
'   AND scb_temp_status = ''C'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11220207798551405343)
,p_name=>'CURCY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CURCY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220205454952405320)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220206314422405328)
,p_name=>'SCB_ADV_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_ADV_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Adv Amt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(11220205579222405321)
,p_name=>'SCB_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220205842669405324)
,p_name=>'SCB_CRD_LMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRD_LMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Crd Lmt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(11220206691445405332)
,p_name=>'SCB_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11220206966545405335)
,p_name=>'SCB_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Scb Cre Date'
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
 p_id=>wwv_flow_imp.id(11220207603391405341)
,p_name=>'SCB_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11220206791587405333)
,p_name=>'SCB_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Ip Addr'
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
 p_id=>wwv_flow_imp.id(11220206923774405334)
,p_name=>'SCB_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Os User'
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
 p_id=>wwv_flow_imp.id(11220205742524405323)
,p_name=>'SCB_CURRENCY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CURRENCY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Allowed Curr.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(11220206093914405326)
,p_name=>'SCB_CUR_BAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CUR_BAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Cur Bal'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(11220207431825405340)
,p_name=>'SCB_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Ln Seq No'
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
 p_id=>wwv_flow_imp.id(11220205957829405325)
,p_name=>'SCB_PEND_INV_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_PEND_INV_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Pend Inv Amt'
,p_heading_alignment=>'RIGHT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220206449454405330)
,p_name=>'SCB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(11220205692390405322)
,p_name=>'SCB_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220206595438405331)
,p_name=>'SCB_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220206171376405327)
,p_name=>'SCB_UNAPP_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UNAPP_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Unapp Amt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11220207026568405336)
,p_name=>'SCB_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11220207334343405339)
,p_name=>'SCB_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Scb Upd Date'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220207636523405342)
,p_name=>'SCB_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11220207202402405337)
,p_name=>'SCB_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Ip Addr'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220207278282405338)
,p_name=>'SCB_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Os User'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220207888530405344)
,p_name=>'TYPE_'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE_'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11220205409553405319)
,p_internal_uid=>5738243574009794291
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11220578741835458763)
,p_interactive_grid_id=>wwv_flow_imp.id(11220205409553405319)
,p_static_id=>'15610282'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11220578928419458765)
,p_report_id=>wwv_flow_imp.id(11220578741835458763)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220579429367458773)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11220205454952405320)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220580344305458781)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11220205579222405321)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220581300662458787)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11220205692390405322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220582173083458795)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11220205742524405323)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220583083542458802)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11220205842669405324)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220583979771458809)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11220205957829405325)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220584825595458816)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11220206093914405326)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220585816167458823)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11220206171376405327)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220586719293458829)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11220206314422405328)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220587555845458835)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11220206449454405330)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220588477154458841)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11220206595438405331)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220589413852458848)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11220206691445405332)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220590150238458854)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11220206791587405333)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220591038077458859)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11220206923774405334)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220591983329458863)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11220206966545405335)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220592829268458873)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11220207026568405336)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220593746909458877)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11220207202402405337)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220594629182458882)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11220207278282405338)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220595555348458888)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11220207334343405339)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220596463927458899)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11220207431825405340)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220597398630458904)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11220207603391405341)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220598227449458909)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11220207636523405342)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220599223060458915)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11220207798551405343)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220600111047458921)
,p_view_id=>wwv_flow_imp.id(11220578928419458765)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11220207888530405344)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11220620859956518834)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-4'
,p_parent_plug_id=>wwv_flow_imp.id(11220620759456518833)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       sgg_bu,',
'       sgg_suplr_id,',
'       sgg_code,',
'       (SELECT atc_disp_desc',
'         FROM acct_type_codes',
'        WHERE atc_bu          = sgg_bu',
'          AND atc_code        = sgg_code',
'          AND atc_acct_type IN (''SAP'', ''SAD'', ''SSD'', ''STLL'', ''LTLL'')',
'          AND atc_sys_def_flg = ''Y''',
'          AND atc_rqrd_type <> ''N''',
'       UNION ALL',
'       SELECT atc_disp_desc',
'         FROM acct_type_codes',
'        WHERE atc_bu        = sgg_bu',
'          AND atc_code      = sgg_code',
'          AND atc_sup_cust_type = ''S''',
'          AND atc_sys_def_flg = ''N''',
'          AND atc_rqrd_type <> ''N'') Code_desc,',
'       sgg_cl_id,',
'       (SELECT gacl_desc1',
'          FROM gl_account_classes',
'         WHERE gacl_bu = sgg_bu',
'           AND gacl_id = sgg_cl_id) Gl_group,',
'       sgg_seq_no,',
'       sgg_temp_status,',
'       sgg_trk_type,',
'       sgg_cre_by,',
'       sgg_cre_ip_addr,',
'       sgg_cre_os_user,',
'       sgg_cre_date,',
'       sgg_upd_by,',
'       sgg_upd_ip_addr,',
'       sgg_upd_os_user,',
'       sgg_upd_date,',
'       sgg_cre_emp_id,',
'       sgg_upd_emp_id,',
'       sgg_code_old,',
'       sgg_cl_id_old,',
'       spla_user_sid',
'  FROM suplr_gl_group_edit_temp',
' WHERE sgg_bu          = :GLOBAL_BU',
'   AND sgg_suplr_id    = :P36700505_ID',
'   AND sgg_temp_status = ''C'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11222665719725783307)
,p_name=>'CODE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CODE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11222665805441783308)
,p_name=>'GL_GROUP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GL_GROUP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GL Group'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11220623106835518856)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220621054834518836)
,p_name=>'SGG_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220621384651518839)
,p_name=>'SGG_CL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GL Group ID'
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
 p_id=>wwv_flow_imp.id(11220622907912518854)
,p_name=>'SGG_CL_ID_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CL_ID_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cl Id Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11220621291757518838)
,p_name=>'SGG_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>5
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220622800307518853)
,p_name=>'SGG_CODE_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CODE_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(11220621813417518843)
,p_name=>'SGG_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11220622087397518846)
,p_name=>'SGG_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sgg Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(11220622555011518851)
,p_name=>'SGG_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11220621879092518844)
,p_name=>'SGG_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(11220621947576518845)
,p_name=>'SGG_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(11220621500680518840)
,p_name=>'SGG_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sgg Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(11220621131603518837)
,p_name=>'SGG_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220621558360518841)
,p_name=>'SGG_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220621711978518842)
,p_name=>'SGG_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Trk Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(11220622135534518847)
,p_name=>'SGG_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(11220622496660518850)
,p_name=>'SGG_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sgg Upd Date'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220622646928518852)
,p_name=>'SGG_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Emp Id'
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
 p_id=>wwv_flow_imp.id(11220622284373518848)
,p_name=>'SGG_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Ip Addr'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220622336556518849)
,p_name=>'SGG_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Os User'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220623020709518855)
,p_name=>'SPLA_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11220621010953518835)
,p_internal_uid=>5738659175409907807
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11222573966630601946)
,p_interactive_grid_id=>wwv_flow_imp.id(11220621010953518835)
,p_static_id=>'15630234'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11222574142091601951)
,p_report_id=>wwv_flow_imp.id(11222573966630601946)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659577719734237867)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11222665719725783307)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222574693221601970)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11220621054834518836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222575527475601984)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11220621131603518837)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222576504901601993)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11220621291757518838)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222577391378602004)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11220621384651518839)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222578202700602012)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11220621500680518840)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222579071018602018)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11220621558360518841)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222579956495602026)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11220621711978518842)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222580851280602032)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11220621813417518843)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222581727002602041)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11220621879092518844)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222582708354602048)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11220621947576518845)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222583533130602056)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11220622087397518846)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222584494746602062)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11220622135534518847)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222585383389602070)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11220622284373518848)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222586316088602081)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11220622336556518849)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222587146257602088)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11220622496660518850)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222588025358602099)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11220622555011518851)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222588832776602107)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11220622646928518852)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222589745889602115)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11220622800307518853)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102.094
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222590694373602123)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11220622907912518854)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222591535101602132)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11220623020709518855)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222592520510602141)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11220623106835518856)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222696322857928304)
,p_view_id=>wwv_flow_imp.id(11222574142091601951)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11222665805441783308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11222669424579783345)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-5'
,p_parent_plug_id=>wwv_flow_imp.id(11222669419250783344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       spla_bu,',
'       spla_suplr_id,',
'       spla_lgr_type,',
'       (SELECT atc_disp_desc',
'          FROM acct_type_codes',
'         WHERE atc_bu          = spla_bu',
'           AND atc_acct_type IN (''SAP'', ''SAD'', ''SSD'', ''STLL'', ''LTLL'')',
'           AND atc_sys_def_flg = ''Y''',
'           AND atc_code        = spla_lgr_type',
'      UNION ALL',
'        SELECT atc_disp_desc',
'          FROM acct_type_codes',
'         WHERE atc_bu            = spla_bu',
'           AND atc_sup_cust_type = ''S''',
'           AND atc_sys_def_flg   = ''N''',
'           AND atc_code          = spla_lgr_type) Acct_class,',
'       spla_acct,',
'       (SELECT glac_acct_desc1',
'          FROM gl_accts',
'         WHERE glac_bu   = spla_bu',
'           AND glac_acct = spla_acct) acct_description,',
'       spla_flag,',
'       spla_cl_id,',
'       spla_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu       = spla_bu',
'           AND bup_plant_id = spla_plnt) unit,',
'       spla_user_sid,',
'       spla_trk_type,',
'       spla_seq_no,',
'       spla_temp_status,',
'       spla_cre_by,',
'       spla_cre_ip_addr,',
'       spla_cre_os_user,',
'       spla_cre_date,',
'       spla_upd_by,',
'       spla_upd_ip_addr,',
'       spla_upd_os_user,',
'       spla_upd_date,',
'       spla_ln_seq_no,',
'       spla_cre_emp_id,',
'       spla_upd_emp_id,',
'       spla_lgr_type_old,',
'       spla_acct_old,',
'       spla_flag_old,',
'       spla_cl_id_old,',
'       spla_plnt_old',
'  FROM suplr_plant_accts_edit_temp',
' WHERE spla_bu          = :GLOBAL_BU',
'   AND spla_suplr_id    = :P36700505_ID',
'   AND spla_temp_status = ''C'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11223153993153839725)
,p_name=>'ACCT_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11223154064275839726)
,p_name=>'ACCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Account Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11222669663252783347)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222670053367783351)
,p_name=>'SPLA_ACCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_ACCT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Account'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(11223153566389839721)
,p_name=>'SPLA_ACCT_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_ACCT_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Acct Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11222669732509783348)
,p_name=>'SPLA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(11222670294289783353)
,p_name=>'SPLA_CL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cl Id'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223153753116839723)
,p_name=>'SPLA_CL_ID_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CL_ID_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cl Id Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11223152329089839709)
,p_name=>'SPLA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11223152678335839712)
,p_name=>'SPLA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spla Cre Date'
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
 p_id=>wwv_flow_imp.id(11223153231005839718)
,p_name=>'SPLA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11223152463522839710)
,p_name=>'SPLA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Ip Addr'
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
 p_id=>wwv_flow_imp.id(11223152529657839711)
,p_name=>'SPLA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Os User'
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
 p_id=>wwv_flow_imp.id(11222670211846783352)
,p_name=>'SPLA_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(11223153650014839722)
,p_name=>'SPLA_FLAG_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_FLAG_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Flag Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(11222669943297783350)
,p_name=>'SPLA_LGR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LGR_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11223153506160839720)
,p_name=>'SPLA_LGR_TYPE_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LGR_TYPE_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Lgr Type Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11223153151278839717)
,p_name=>'SPLA_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla Ln Seq No'
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
 p_id=>wwv_flow_imp.id(11222670422112783354)
,p_name=>'SPLA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Plnt'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11223153895920839724)
,p_name=>'SPLA_PLNT_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_PLNT_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Plnt Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(11223152220213839707)
,p_name=>'SPLA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(11222669910248783349)
,p_name=>'SPLA_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Suplr Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(11223152315002839708)
,p_name=>'SPLA_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Temp Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(11222670579292783356)
,p_name=>'SPLA_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Trk Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(11223152803499839713)
,p_name=>'SPLA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11223153070669839716)
,p_name=>'SPLA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spla Upd Date'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223153391765839719)
,p_name=>'SPLA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11223152923741839714)
,p_name=>'SPLA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Ip Addr'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223152963968839715)
,p_name=>'SPLA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Os User'
,p_heading_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222670492599783355)
,p_name=>'SPLA_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(11223154132577839727)
,p_name=>'UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11222669580508783346)
,p_internal_uid=>5740707744965172318
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11223158887614845977)
,p_interactive_grid_id=>wwv_flow_imp.id(11222669580508783346)
,p_static_id=>'15636083'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11223159049714845981)
,p_report_id=>wwv_flow_imp.id(11223158887614845977)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223159568656845991)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11222669663252783347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223160421417846001)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11222669732509783348)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223161240921846006)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11222669910248783349)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223162145455846012)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11222669943297783350)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79.656
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223163107631846018)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11222670053367783351)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223164017154846023)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11222670211846783352)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223164839147846029)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11222670294289783353)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223165741035846038)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11222670422112783354)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223166713805846046)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11222670492599783355)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223167573991846052)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11222670579292783356)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223168501112846059)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11223152220213839707)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223169406993846065)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11223152315002839708)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223170270372846074)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11223152329089839709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223171175130846082)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11223152463522839710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223172054972846090)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11223152529657839711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223172870596846098)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11223152678335839712)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223173734274846112)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11223152803499839713)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223174679672846121)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11223152923741839714)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223175569431846129)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11223152963968839715)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223176491287846137)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11223153070669839716)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223177350118846152)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11223153151278839717)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223178233424846160)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11223153231005839718)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223179136761846184)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11223153391765839719)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223180035912846191)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11223153506160839720)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223180912538846199)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11223153566389839721)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223181735277846209)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11223153650014839722)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223182635874846216)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11223153753116839723)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223183553976846223)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11223153895920839724)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223195963288892435)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11223153993153839725)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223196879502892445)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11223154064275839726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223197769175892452)
,p_view_id=>wwv_flow_imp.id(11223159049714845981)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11223154132577839727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11223237596545994526)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-6'
,p_parent_plug_id=>wwv_flow_imp.id(11223237463014994525)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       spbd_bu,',
'       spbd_branch_desc,',
'       spbd_bank_city,',
'       spbd_bank_addr1,',
'       spbd_bank_addr2,',
'       spbd_bank_ifsc_code,',
'       spbd_bank_acc_no,',
'       spbd_dflt_flag,',
'       spbd_suplr_id,',
'       CASE spbd_pay_acct_type WHEN ''SB'' THEN ''SB''',
'                               WHEN ''CB'' THEN ''CB''',
'                               WHEN ''RD'' THEN ''RD''',
'                               WHEN ''FD'' THEN ''FD''',
'                               WHEN ''CC'' THEN ''CC''',
'                               WHEN ''OD'' THEN ''OD''',
'         END A_C_TYPE,',
'       spbd_swift_bic,',
'       spbd_iban_no,',
'       spbd_pay_bank_name,',
'       spbd_pay_to_name,',
'       spbd_city_id,',
'       spbd_user_sid,',
'       spbd_trk_type,',
'       spbd_seq_no,',
'       spbd_temp_status,',
'       spbd_cre_by,',
'       spbd_cre_ip_addr,',
'       spbd_cre_os_user,',
'       spbd_cre_date,',
'       spbd_upd_by,',
'       spbd_upd_ip_addr,',
'       spbd_upd_os_user,',
'       spbd_upd_date,',
'       spbd_ln_seq_no,',
'       spbd_cre_emp_id,',
'       spbd_upd_emp_id',
'  FROM suplr_pay_bank_dtls_ed_temp',
' WHERE spbd_bu          = :global_bu',
'   AND spbd_suplr_id    = :P36700505_ID',
'   AND spbd_temp_status = ''C''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11224524742985224809)
,p_name=>'A_C_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'A_C_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'A/C Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
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
,p_default_type=>'STATIC'
,p_default_expression=>'SB'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223237823672994528)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223238473043994535)
,p_name=>'SPBD_BANK_ACC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ACC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bank A/C No.'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223238204375994532)
,p_name=>'SPBD_BANK_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11223238252865994533)
,p_name=>'SPBD_BANK_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11223238043908994531)
,p_name=>'SPBD_BANK_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank City'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11223238381002994534)
,p_name=>'SPBD_BANK_IFSC_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_IFSC_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IFSC Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11223237935669994530)
,p_name=>'SPBD_BRANCH_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BRANCH_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Branch'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223237913049994529)
,p_name=>'SPBD_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223239284187994543)
,p_name=>'SPBD_CITY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CITY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd City Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11223239735046994548)
,p_name=>'SPBD_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(11223240118900994551)
,p_name=>'SPBD_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spbd Cre Date'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11224524592289224807)
,p_name=>'SPBD_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11223239859430994549)
,p_name=>'SPBD_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11223239942119994550)
,p_name=>'SPBD_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11223238527783994536)
,p_name=>'SPBD_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
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
 p_id=>wwv_flow_imp.id(11223239008220994540)
,p_name=>'SPBD_IBAN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_IBAN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IBAN No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11223240543395994556)
,p_name=>'SPBD_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spbd Ln Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11223239067068994541)
,p_name=>'SPBD_PAY_BANK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_PAY_BANK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bank Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(11223239211862994542)
,p_name=>'SPBD_PAY_TO_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_PAY_TO_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Pay To Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(11223239556686994546)
,p_name=>'SPBD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spbd Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11223238708800994537)
,p_name=>'SPBD_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223238827956994539)
,p_name=>'SPBD_SWIFT_BIC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SWIFT_BIC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SWIFT BIC/Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(11223239698295994547)
,p_name=>'SPBD_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_TEMP_STATUS'
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
 p_id=>wwv_flow_imp.id(11223239494236994545)
,p_name=>'SPBD_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Trk Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(11223240143769994552)
,p_name=>'SPBD_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11223240448774994555)
,p_name=>'SPBD_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spbd Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(11224524667322224808)
,p_name=>'SPBD_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(11223240301813994553)
,p_name=>'SPBD_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(11223240341163994554)
,p_name=>'SPBD_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11223239343425994544)
,p_name=>'SPBD_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spbd User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11223237635119994527)
,p_internal_uid=>5741275799576383499
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11224548763880234123)
,p_interactive_grid_id=>wwv_flow_imp.id(11223237635119994527)
,p_static_id=>'15649982'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11224548950606234134)
,p_report_id=>wwv_flow_imp.id(11224548763880234123)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224549506788234148)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11223237823672994528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224550371400234173)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11223237913049994529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224551226613234179)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11223237935669994530)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176.891
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224552123061234190)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11223238043908994531)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224552986241234199)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11223238204375994532)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224553902832234207)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11223238252865994533)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224554792589234213)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11223238381002994534)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224555676210234223)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11223238473043994535)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134.812
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224556606916234231)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11223238527783994536)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66.0781
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224557518105234237)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11223238708800994537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224559128936234296)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11223238827956994539)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224560111529234302)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11223239008220994540)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224560936130234310)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11223239067068994541)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200.828
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224561840197234318)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11223239211862994542)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182.812
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224562796817234324)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11223239284187994543)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224563660707234332)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11223239343425994544)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224564617004234338)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11223239494236994545)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224565460155234345)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11223239556686994546)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224566363023234351)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11223239698295994547)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224567235642234357)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11223239735046994548)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224568195186234363)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11223239859430994549)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224569075565234371)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11223239942119994550)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224569986864234381)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11223240118900994551)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224570731702234387)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11223240143769994552)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224571678060234395)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11223240301813994553)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224572570489234402)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11223240341163994554)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224573499937234423)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11223240448774994555)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224574349926234431)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11223240543395994556)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224575279159234438)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11224524592289224807)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224576201337234446)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11224524667322224808)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224596046985269476)
,p_view_id=>wwv_flow_imp.id(11224548950606234134)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11224524742985224809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71.125
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11224835510560810710)
,p_plug_name=>'Current Value'
,p_static_id=>'current-value-7'
,p_parent_plug_id=>wwv_flow_imp.id(11224835277753810708)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       sci_bu,',
'       sci_suplr_id,',
'       sci_seq_id,',
'       CASE sci_person_pfx WHEN ''Mr.'' THEN ''Mr.''',
'                           WHEN ''Ms.'' THEN ''Ms.''',
'                           WHEN ''Ms.'' THEN ''Ms.''',
'         END salut,',
'       sci_person_first_name1,',
'       sci_person_middle_name1,',
'       sci_person_last_name1,',
'       sci_person_first_name2,',
'       sci_person_middle_name2,',
'       sci_person_last_name2,',
'       sci_addr1,',
'       sci_addr2,',
'       sci_addr3,',
'       sci_po_box,',
'       sci_city,',
'       sci_state,',
'       sci_country,',
'       sci_zip,',
'       sci_tele1,',
'       sci_tele2,',
'       sci_fax1,',
'       sci_fax2,',
'       sci_email1,',
'       sci_email2,',
'       sci_position_name,',
'       sci_priority,',
'       sci_mail_flag,',
'       sci_key_person_flag,',
'       sci_department,',
'       sci_user_sid,',
'       sci_trk_type,',
'       sci_seq_no,',
'       sci_temp_status,',
'       sci_cre_by,',
'       sci_cre_ip_addr,',
'       sci_cre_os_user,',
'       sci_cre_date,',
'       sci_upd_by,',
'       sci_upd_ip_addr,',
'       sci_upd_os_user,',
'       sci_upd_date,',
'       sci_ln_seq_no,',
'       sci_cre_emp_id,',
'       sci_upd_emp_id',
'  FROM suplr_contact_info_edit_temp',
' WHERE sci_bu          = :global_bu',
'   AND sci_suplr_id    = :P36700505_ID',
'   AND sci_temp_status = ''C'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Value'
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
 p_id=>wwv_flow_imp.id(11224835692371810712)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226123136860253607)
,p_name=>'SALUT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALUT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Salut.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(11224836795625810723)
,p_name=>'SCI_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11224836888993810724)
,p_name=>'SCI_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11224837016822810725)
,p_name=>'SCI_ADDR3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr3'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224835745768810713)
,p_name=>'SCI_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224837124399810727)
,p_name=>'SCI_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci City'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11224837383472810729)
,p_name=>'SCI_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11224839103938810746)
,p_name=>'SCI_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
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
 p_id=>wwv_flow_imp.id(11224839366971810749)
,p_name=>'SCI_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sci Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
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
 p_id=>wwv_flow_imp.id(11224839985733810755)
,p_name=>'SCI_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
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
 p_id=>wwv_flow_imp.id(11224839182336810747)
,p_name=>'SCI_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(11224839262795810748)
,p_name=>'SCI_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
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
 p_id=>wwv_flow_imp.id(11224838584562810741)
,p_name=>'SCI_DEPARTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_DEPARTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Department'
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
 p_id=>wwv_flow_imp.id(11224837997634810735)
,p_name=>'SCI_EMAIL1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_EMAIL1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11224838084196810736)
,p_name=>'SCI_EMAIL2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_EMAIL2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Email2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11224837778168810733)
,p_name=>'SCI_FAX1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_FAX1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Fax1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224837853041810734)
,p_name=>'SCI_FAX2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_FAX2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Fax2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224838510943810740)
,p_name=>'SCI_KEY_PERSON_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_KEY_PERSON_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Key Person Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11224839874599810754)
,p_name=>'SCI_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Ln Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(11224838356199810739)
,p_name=>'SCI_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Mail Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(11224836174212810717)
,p_name=>'SCI_PERSON_FIRST_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_FIRST_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11224836508521810720)
,p_name=>'SCI_PERSON_FIRST_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_FIRST_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person First Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224836383462810719)
,p_name=>'SCI_PERSON_LAST_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_LAST_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Last Name1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224836634121810722)
,p_name=>'SCI_PERSON_LAST_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_LAST_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Last Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224836243067810718)
,p_name=>'SCI_PERSON_MIDDLE_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_MIDDLE_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Middle Name1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224836609711810721)
,p_name=>'SCI_PERSON_MIDDLE_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_MIDDLE_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Middle Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224838162713810737)
,p_name=>'SCI_POSITION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_POSITION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Designation'
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
 p_id=>wwv_flow_imp.id(11224837037097810726)
,p_name=>'SCI_PO_BOX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PO_BOX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Po Box'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11224838259792810738)
,p_name=>'SCI_PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PRIORITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Priority'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11224836016349810715)
,p_name=>'SCI_SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224838831279810744)
,p_name=>'SCI_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
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
 p_id=>wwv_flow_imp.id(11224837228202810728)
,p_name=>'SCI_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci State'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(11224835913809810714)
,p_name=>'SCI_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224837550604810731)
,p_name=>'SCI_TELE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TELE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Telephone'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224837705771810732)
,p_name=>'SCI_TELE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TELE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224838997849810745)
,p_name=>'SCI_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224838815310810743)
,p_name=>'SCI_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Trk Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(11224839494296810750)
,p_name=>'SCI_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
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
 p_id=>wwv_flow_imp.id(11224839782830810753)
,p_name=>'SCI_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sci Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(11224840085050810756)
,p_name=>'SCI_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
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
 p_id=>wwv_flow_imp.id(11224839612666810751)
,p_name=>'SCI_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
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
 p_id=>wwv_flow_imp.id(11224839625069810752)
,p_name=>'SCI_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(11224838634660810742)
,p_name=>'SCI_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(11224837432215810730)
,p_name=>'SCI_ZIP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ZIP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Zip'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11224835586314810711)
,p_internal_uid=>5742873750771199683
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(11226077255116233282)
,p_interactive_grid_id=>wwv_flow_imp.id(11224835586314810711)
,p_static_id=>'15665267'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11226077449575233293)
,p_report_id=>wwv_flow_imp.id(11226077255116233282)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226077980919233309)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11224835692371810712)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226078893098233320)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11224835745768810713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226079782155233326)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11224835913809810714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226080703607233334)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11224836016349810715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226082487578233345)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11224836174212810717)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226083285305233352)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11224836243067810718)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226084209185233365)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11224836383462810719)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226085048320233373)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11224836508521810720)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226086014223233381)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11224836609711810721)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226086868603233388)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11224836634121810722)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226087776732233396)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11224836795625810723)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226088668135233409)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11224836888993810724)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226089549674233421)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11224837016822810725)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226090761614233427)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11224837037097810726)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226091948627233434)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11224837124399810727)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226092826873233440)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11224837228202810728)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226093814125233446)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11224837383472810729)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226094714280233452)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11224837432215810730)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226095537000233457)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11224837550604810731)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129.25
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226096485755233463)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11224837705771810732)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.172
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226097405287233468)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11224837778168810733)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226098283618233474)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11224837853041810734)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226099190939233481)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11224837997634810735)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166.188
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226100024108233487)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11224838084196810736)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226100965603233491)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11224838162713810737)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226101897602233501)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11224838259792810738)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226102820856233509)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11224838356199810739)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226103719690233516)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11224838510943810740)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226104602511233523)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11224838584562810741)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226105493424233537)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11224838634660810742)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226106255244233546)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(11224838815310810743)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226107203562233557)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(11224838831279810744)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226108096237233563)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(11224838997849810745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226108977006233570)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(11224839103938810746)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226109868794233576)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(11224839182336810747)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226110776531233582)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(11224839262795810748)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226111662099233588)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(11224839366971810749)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226112526558233595)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(11224839494296810750)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226113512975233601)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(11224839612666810751)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226114379694233607)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(11224839625069810752)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226115295297233613)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(11224839782830810753)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226116131600233621)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(11224839874599810754)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226117108164233627)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(11224839985733810755)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226118011528233634)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(11224840085050810756)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226129131912254841)
,p_view_id=>wwv_flow_imp.id(11226077449575233293)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11226123136860253607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>47
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11222669419250783344)
,p_plug_name=>'GL Account'
,p_static_id=>'gl-account'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'GA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11220620759456518833)
,p_plug_name=>'GL Group'
,p_static_id=>'gl-group'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'GG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210745986355983853)
,p_plug_name=>'Location'
,p_static_id=>'location'
,p_parent_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'LO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11233532848747892026)
,p_plug_name=>'MSME Details'
,p_static_id=>'msme-details'
,p_parent_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'OT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11233532391260892021)
,p_plug_name=>'MSME Details'
,p_static_id=>'msme-details-2'
,p_parent_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P36700505_TYPE'
,p_plug_display_when_cond2=>'OT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210742216821983815)
,p_plug_name=>'New Value'
,p_static_id=>'new-value'
,p_parent_plug_id=>wwv_flow_imp.id(11210742493953983818)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SUPPLIERS_EDIT_TEMP'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'suplr_bu = :global_bu',
'AND SUPLR_SUPLR_ID = :P36700505_ID',
'AND suplr_temp_status = ''N'''))
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P36700505_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11215360407698277926)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-2'
,p_region_name=>'suplr_loc'
,p_parent_plug_id=>wwv_flow_imp.id(11210745986355983853)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       ssl_bu,',
'       ssl_suplr_id,',
'       ssl_loc_name1,',
'       ssl_loc_name2,',
'       ssl_addr1,',
'       ssl_addr2,',
'       ssl_addr3,',
'       ssl_po_box,',
'       ssl_city,',
'       ssl_state,',
'       ssl_country,',
'       ssl_zip,',
'       ssl_tele,',
'       ssl_mob_no,',
'       ssl_fax,',
'       ssl_email,',
'       ssl_website,',
'       ssl_port,',
'       ssl_tin_no,',
'       ssl_ecc_no,',
'       ssl_ser_tax,',
'       ssl_comm_rate,',
'       ssl_ref1,',
'       ssl_ref2,',
'       ssl_cons,',
'       ssl_cst,',
'       ssl_dflt_flg,',
'       ssl_bill_frm,',
'       ssl_ship_frm,',
'       ssl_gst_no,',
'       ssl_gst_type,',
'       ssl_type,',
'       ssl_scheme,',
'       ssl_vat_clsfn,',
'       ssl_vat_type,',
'       ssl_pin_no,',
'       ssl_user_sid,',
'       ssl_seq_no,',
'       ssl_temp_status,',
'       ssl_trk_type,',
'       ssl_cre_by,',
'       ssl_cre_ip_addr,',
'       ssl_cre_os_user,',
'       ssl_cre_date,',
'       ssl_upd_by,',
'       ssl_upd_ip_addr,',
'       ssl_upd_os_user,',
'       ssl_upd_date,',
'       ssl_ln_seq_no,',
'       ssl_cre_emp_id,',
'       ssl_upd_emp_id,',
'       (SELECT state_code',
'          FROM states',
'         WHERE state_bu = ssl_bu',
'           AND state_id = ssl_state) state_code',
'  FROM suplr_ship_loc_edit_temp',
' WHERE ssl_bu       = :global_bu',
'   AND ssl_suplr_id = :P36700505_ID',
'   AND ssl_temp_status = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11219577999715759645)
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
 p_id=>wwv_flow_imp.id(11219578079794759646)
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
 p_id=>wwv_flow_imp.id(11216921287770410434)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216921811448410439)
,p_name=>'SSL_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11216921825487410440)
,p_name=>'SSL_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 2'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216922003832410441)
,p_name=>'SSL_ADDR3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ADDR3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Address 3'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(11216924392489411715)
,p_name=>'SSL_BILL_FRM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_BILL_FRM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Bill Frm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11216921336167410435)
,p_name=>'SSL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216922182574410443)
,p_name=>'SSL_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'City'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'City')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(8020286322841029440)
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
 p_id=>wwv_flow_imp.id(11216923730481411709)
,p_name=>'SSL_COMM_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_COMM_RATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Comm Rate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11216924106918411712)
,p_name=>'SSL_CONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CONS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cons'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(11216922609481410447)
,p_name=>'SSL_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(11216925684167411728)
,p_name=>'SSL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
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
 p_id=>wwv_flow_imp.id(11216925956139411731)
,p_name=>'SSL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ssl Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(11216926558681411737)
,p_name=>'SSL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
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
 p_id=>wwv_flow_imp.id(11216925770086411729)
,p_name=>'SSL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(11216925832473411730)
,p_name=>'SSL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(11216924189096411713)
,p_name=>'SSL_CST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_CST'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Cst'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11216926813162411739)
,p_name=>'SSL_DFLT_FLG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_DFLT_FLG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Loc. Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Default Bill;B,Default Ship;S,Default Bill/Ship;D,Bill;I,Ship;H,Bill/Ship;P'
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
,p_default_expression=>'D'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216923575299411707)
,p_name=>'SSL_ECC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ECC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ecc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11216923086798410452)
,p_name=>'SSL_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216922994711410451)
,p_name=>'SSL_FAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_FAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fax'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216924574241411717)
,p_name=>'SSL_GST_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_GST_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'GSTIN No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(11216926863667411740)
,p_name=>'SSL_GST_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_GST_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'GST Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Registered;R,Unregistered;U,Composition;C,Casual Person;S,Non-Resident;N'
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
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216926464858411736)
,p_name=>'SSL_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>480
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216921573617410437)
,p_name=>'SSL_LOC_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LOC_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216921628725410438)
,p_name=>'SSL_LOC_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_LOC_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Loc Name2'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216922839264410450)
,p_name=>'SSL_MOB_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_MOB_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Mob No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216925221715411723)
,p_name=>'SSL_PIN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PIN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Pin No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
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
 p_id=>wwv_flow_imp.id(11216923320132410454)
,p_name=>'SSL_PORT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PORT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Port'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Port')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT exprt_port_desc,',
'       exprt_port',
'  FROM exp_port',
' WHERE exprt_bu          = :GLOBAL_bu',
'   AND exprt_active_flag = ''Y'''))
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
 p_id=>wwv_flow_imp.id(11216922096968410442)
,p_name=>'SSL_PO_BOX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_PO_BOX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Po Box'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216923843940411710)
,p_name=>'SSL_REF1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_REF1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ref1'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11216924002954411711)
,p_name=>'SSL_REF2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_REF2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ref2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11216927028591411742)
,p_name=>'SSL_SCHEME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SCHEME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Scheme'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:EOU;E,General;O,SEZ;S'
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
,p_default_expression=>'O'
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216925403119411725)
,p_name=>'SSL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216923644999411708)
,p_name=>'SSL_SER_TAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SER_TAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ser Tax'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11216924484003411716)
,p_name=>'SSL_SHIP_FRM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SHIP_FRM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Ship Frm'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(11216922425206410446)
,p_name=>'SSL_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl State'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11216921428714410436)
,p_name=>'SSL_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216922793645410449)
,p_name=>'SSL_TELE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TELE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Telephone'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216925477367411726)
,p_name=>'SSL_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216923470352410456)
,p_name=>'SSL_TIN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TIN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Tin No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11216925555863411727)
,p_name=>'SSL_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete ;D'
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
 p_id=>wwv_flow_imp.id(11216926979399411741)
,p_name=>'SSL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'GST Clsf.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Local;L,Inter-State;I,Union Territory;U,Import;M,SEZ-Unit;S,SEZ-Developer;D'
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
,p_default_expression=>'L'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216926028302411732)
,p_name=>'SSL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
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
 p_id=>wwv_flow_imp.id(11216926385644411735)
,p_name=>'SSL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Ssl Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
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
 p_id=>wwv_flow_imp.id(11216926661592411738)
,p_name=>'SSL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
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
 p_id=>wwv_flow_imp.id(11216926176884411733)
,p_name=>'SSL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
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
 p_id=>wwv_flow_imp.id(11216926271064411734)
,p_name=>'SSL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
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
 p_id=>wwv_flow_imp.id(11216925321134411724)
,p_name=>'SSL_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ssl User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(11216925004186411721)
,p_name=>'SSL_VAT_CLSFN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_VAT_CLSFN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Vat Clsfn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
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
,p_default_expression=>'L'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216925075568411722)
,p_name=>'SSL_VAT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_VAT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Vat Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
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
,p_default_expression=>'R'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11216923144960410453)
,p_name=>'SSL_WEBSITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_WEBSITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ssl Website'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11216922660417410448)
,p_name=>'SSL_ZIP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SSL_ZIP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'ZIP/PIN Code '
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
 p_id=>wwv_flow_imp.id(11219577857184759644)
,p_name=>'STATE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATE_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'State Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>550
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11216921169879410433)
,p_internal_uid=>5734959334335799405
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
 p_id=>wwv_flow_imp.id(11216951292126450916)
,p_interactive_grid_id=>wwv_flow_imp.id(11216921169879410433)
,p_static_id=>'15574007'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11216951492567450916)
,p_report_id=>wwv_flow_imp.id(11216951292126450916)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216951927482450926)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11216921287770410434)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216952837244450935)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11216921336167410435)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216953762421450941)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11216921428714410436)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216954700795450948)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11216921573617410437)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216955565498450959)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11216921628725410438)
,p_is_visible=>false
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216956405007450966)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11216921811448410439)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>187
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216957230736450974)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11216921825487410440)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216958173745450982)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11216922003832410441)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216959117747450991)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11216922096968410442)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216959992781450999)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11216922182574410443)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216960889278451009)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11216922425206410446)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216961788031451018)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11216922609481410447)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216962724811451026)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11216922660417410448)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216963688199451034)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11216922793645410449)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216964538058451041)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11216922839264410450)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216965508570451049)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11216922994711410451)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216966374154451057)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11216923086798410452)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216967126892451063)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11216923144960410453)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216968102874451071)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11216923320132410454)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216968935382451077)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11216923470352410456)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216969861717451090)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11216923575299411707)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216970750431451096)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11216923644999411708)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216971693008451106)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11216923730481411709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216972622150451112)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11216923843940411710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216973437042451118)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11216924002954411711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216974380473451127)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11216924106918411712)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216975238717451134)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(11216924189096411713)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216976141703451143)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(11216924392489411715)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216977092899451149)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(11216924484003411716)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216977977725451157)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11216924574241411717)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>131
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216979547968451171)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(11216925004186411721)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216980801794451177)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(11216925075568411722)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216981640745451184)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(11216925221715411723)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216982618397451190)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(11216925321134411724)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216983495487451198)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(11216925403119411725)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216984379134451206)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(11216925477367411726)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216985319278451213)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11216925555863411727)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>72
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216986208953451223)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(11216925684167411728)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216987057163451231)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(11216925770086411729)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216988275791451238)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(11216925832473411730)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216989141849451246)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(11216925956139411731)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216990103697451252)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(11216926028302411732)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216991011333451259)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(11216926176884411733)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216991832127451265)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(11216926271064411734)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216992732179451271)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(11216926385644411735)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216993654273451282)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(11216926464858411736)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216994543361451291)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(11216926558681411737)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216995432232451301)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(11216926661592411738)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216996339315451309)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(11216926813162411739)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216997318519451316)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11216926863667411740)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216998144667451324)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11216926979399411741)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11216999082011451331)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(11216927028591411742)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219691147308839981)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11219577857184759644)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219911599007039457)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(11219577999715759645)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11219912402556039463)
,p_view_id=>wwv_flow_imp.id(11216951492567450916)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(11219578079794759646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11220207938855405345)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-3'
,p_region_name=>'suplr_curr'
,p_parent_plug_id=>wwv_flow_imp.id(11220205123881405317)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       scb_bu,',
'       scb_suplr_id,',
'       scb_currency,',
'       (SELECT curcy_desc1',
'          FROM currencies ',
'         WHERE curcy_bu      = :GLOBAL_BU',
'           AND curcy_id      = scb_currency',
'           AND curcy_usg_flg =''Y'') curcy_name,',
'       scb_crd_lmt,',
'       scb_pend_inv_amt,',
'       scb_cur_bal,',
'       scb_unapp_amt,',
'       scb_adv_amt,',
'       scb_trk_type,',
'       scb_seq_no,',
'       scb_temp_status,',
'       scb_cre_by,',
'       scb_cre_ip_addr,',
'       scb_cre_os_user,',
'       scb_cre_date,',
'       scb_upd_by,',
'       scb_upd_ip_addr,',
'       scb_upd_os_user,',
'       scb_upd_date,',
'       scb_ln_seq_no,',
'       scb_cre_emp_id,',
'       scb_upd_emp_id',
'  FROM suplr_curr_bal_edit_temp',
' WHERE scb_bu          = :GLOBAL_BU',
'   AND scb_suplr_id    = :P36700505_ID',
'   AND scb_temp_status = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11220619683257518822)
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
 p_id=>wwv_flow_imp.id(11220619782831518823)
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
 p_id=>wwv_flow_imp.id(11220619341139518819)
,p_name=>'CURCY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CURCY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220208218341405347)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220209015139405355)
,p_name=>'SCB_ADV_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_ADV_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Adv Amt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220208236080405348)
,p_name=>'SCB_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220208572630405351)
,p_name=>'SCB_CRD_LMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRD_LMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Crd Lmt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220618302119518808)
,p_name=>'SCB_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre By'
,p_heading_alignment=>'LEFT'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220618573170518811)
,p_name=>'SCB_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Scb Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11220619174838518817)
,p_name=>'SCB_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11220618337332518809)
,p_name=>'SCB_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(11220618519447518810)
,p_name=>'SCB_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11220208428709405350)
,p_name=>'SCB_CURRENCY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CURRENCY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Allowed Curr.'
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
  'title', 'Currency')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT curcy_id d, curcy_id r',
'  FROM currencies ',
' WHERE curcy_bu      = :global_bu',
'   AND curcy_usg_flg = ''Y''',
'GROUP BY curcy_id'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220208751164405353)
,p_name=>'SCB_CUR_BAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_CUR_BAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Cur Bal'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220619049456518816)
,p_name=>'SCB_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Ln Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11220208627001405352)
,p_name=>'SCB_PEND_INV_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_PEND_INV_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Pend Inv Amt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220209052259405356)
,p_name=>'SCB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220208405068405349)
,p_name=>'SCB_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220618134781518807)
,p_name=>'SCB_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_TEMP_STATUS'
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
 p_id=>wwv_flow_imp.id(11220619621191518821)
,p_name=>'SCB_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete;D'
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
 p_id=>wwv_flow_imp.id(11220208915342405354)
,p_name=>'SCB_UNAPP_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UNAPP_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Scb Unapp Amt'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11220618642616518812)
,p_name=>'SCB_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(11220618981037518815)
,p_name=>'SCB_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Scb Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(11220619286870518818)
,p_name=>'SCB_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11220618766297518813)
,p_name=>'SCB_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11220618895866518814)
,p_name=>'SCB_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCB_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Scb Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11220208034874405346)
,p_internal_uid=>5738246199330794318
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
 p_id=>wwv_flow_imp.id(11220624995355532560)
,p_interactive_grid_id=>wwv_flow_imp.id(11220208034874405346)
,p_static_id=>'15610744'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11220625218220532560)
,p_report_id=>wwv_flow_imp.id(11220624995355532560)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220625633709532568)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11220208218341405347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220626541009532581)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11220208236080405348)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220627444332532590)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11220208405068405349)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220628326563532598)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11220208428709405350)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220629254424532606)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11220208572630405351)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220630135677532618)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11220208627001405352)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220631068474532629)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11220208751164405353)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220631978115532641)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11220208915342405354)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220632918583532652)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11220209015139405355)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220633641281532659)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11220209052259405356)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220634528647532670)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11220618134781518807)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220635470346532681)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11220618302119518808)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220636324105532693)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11220618337332518809)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220637283759532702)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11220618519447518810)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220638188278532712)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11220618573170518811)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220639110245532720)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11220618642616518812)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220640016061532735)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11220618766297518813)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220640876991532745)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11220618895866518814)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220641707667532759)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11220618981037518815)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220642528225532770)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11220619049456518816)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220643449544532781)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11220619174838518817)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220644336290532791)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11220619286870518818)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220645255177532801)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11220619341139518819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220646223653532812)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11220619621191518821)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73.2969
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220649102499542929)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11220619683257518822)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11220650014636542938)
,p_view_id=>wwv_flow_imp.id(11220625218220532560)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11220619782831518823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11222665849697783309)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-4'
,p_region_name=>'GL_Group'
,p_parent_plug_id=>wwv_flow_imp.id(11220620759456518833)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       sgg_bu,',
'       sgg_suplr_id,',
'       sgg_code,',
'       sgg_cl_id,',
'       sgg_seq_no,',
'       sgg_temp_status,',
'       sgg_trk_type,',
'       sgg_cre_by,',
'       sgg_cre_ip_addr,',
'       sgg_cre_os_user,',
'       sgg_cre_date,',
'       sgg_upd_by,',
'       sgg_upd_ip_addr,',
'       sgg_upd_os_user,',
'       sgg_upd_date,',
'       sgg_cre_emp_id,',
'       sgg_upd_emp_id,',
'       sgg_code_old,',
'       sgg_cl_id_old,',
'       spla_user_sid',
'  FROM suplr_gl_group_edit_temp',
' WHERE sgg_bu          = :GLOBAL_BU',
'   AND sgg_suplr_id    = :P36700505_ID',
'   AND sgg_temp_status = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11222668326081783334)
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
 p_id=>wwv_flow_imp.id(11222668431867783335)
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
 p_id=>wwv_flow_imp.id(11222668112826783331)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222666035095783311)
,p_name=>'SGG_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222666393315783314)
,p_name=>'SGG_CL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'GL Group'
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
  'title', 'GL Group')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT gacl_desc1,gacl_id',
'  FROM gl_account_classes',
' WHERE gacl_bu             = :global_bu',
'   AND gacl_acct_type_code = :sgg_code',
'   AND gacl_acct_cls       = ''S'''))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'SGG_CODE'
,p_ajax_items_to_submit=>'SGG_CODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222667862700783329)
,p_name=>'SGG_CL_ID_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CL_ID_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cl Id Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
 p_id=>wwv_flow_imp.id(11222666252533783313)
,p_name=>'SGG_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Acct. Class')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT atc_disp_desc,atc_code',
'  FROM acct_type_codes',
' WHERE atc_bu          = :global_bu',
'   AND atc_acct_type IN (''SAP'', ''SAD'', ''SSD'', ''STLL'', ''LTLL'')',
'   AND atc_sys_def_flg = ''Y''',
'   AND atc_rqrd_type <> ''N''',
' UNION ALL',
' SELECT atc_disp_desc,atc_code',
'   FROM acct_type_codes',
'  WHERE atc_bu        = :global_bu',
'    AND atc_sup_cust_type = ''S''',
'    AND atc_sys_def_flg = ''N''',
'    AND atc_rqrd_type <> ''N'''))
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222667800150783328)
,p_name=>'SGG_CODE_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CODE_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Acct. Class'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11222666786186783318)
,p_name=>'SGG_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre By'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11222667078636783321)
,p_name=>'SGG_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sgg Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11222667560370783326)
,p_name=>'SGG_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Emp Id'
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
 p_id=>wwv_flow_imp.id(11222666875862783319)
,p_name=>'SGG_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(11222666964027783320)
,p_name=>'SGG_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(11222666498089783315)
,p_name=>'SGG_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222666208979783312)
,p_name=>'SGG_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222666527028783316)
,p_name=>'SGG_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_TEMP_STATUS'
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
 p_id=>wwv_flow_imp.id(11222666673249783317)
,p_name=>'SGG_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete;D'
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
 p_id=>wwv_flow_imp.id(11222667135548783322)
,p_name=>'SGG_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd By'
,p_heading_alignment=>'LEFT'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11222667511741783325)
,p_name=>'SGG_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sgg Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11222667716107783327)
,p_name=>'SGG_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11222667250657783323)
,p_name=>'SGG_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(11222667342883783324)
,p_name=>'SGG_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGG_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sgg Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11222668009300783330)
,p_name=>'SPLA_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11222665999758783310)
,p_internal_uid=>5740704164215172282
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
 p_id=>wwv_flow_imp.id(11222718038839979124)
,p_interactive_grid_id=>wwv_flow_imp.id(11222665999758783310)
,p_static_id=>'15631675'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11222718290219979124)
,p_report_id=>wwv_flow_imp.id(11222718038839979124)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222718772033979131)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11222666035095783311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222719668734979143)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11222666208979783312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222720530779979151)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11222666252533783313)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222721444871979159)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11222666393315783314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222722402324979165)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11222666498089783315)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222723314439979173)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11222666527028783316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222724197314979179)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11222666673249783317)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222725067694979187)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11222666786186783318)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222725956497979193)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11222666875862783319)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222726834384979201)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11222666964027783320)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222727653685979210)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11222667078636783321)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222728550978979218)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11222667135548783322)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222729523731979226)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11222667250657783323)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222730396082979232)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11222667342883783324)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222731546129979240)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11222667511741783325)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222732483481979248)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11222667560370783326)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222733387896979259)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11222667716107783327)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222734302872979268)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11222667800150783328)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87.0903
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222735159737979274)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11222667862700783329)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222736109090979281)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11222668009300783330)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222736967621979287)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11222668112826783331)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222751379171999859)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11222668326081783334)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11222752270623999866)
,p_view_id=>wwv_flow_imp.id(11222718290219979124)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11222668431867783335)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11223154407570839729)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-5'
,p_region_name=>'GL_Acct'
,p_parent_plug_id=>wwv_flow_imp.id(11222669419250783344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       spla_bu,',
'       spla_suplr_id,',
'       spla_lgr_type,',
'       spla_acct,',
'       (SELECT glac_acct_desc1',
'          FROM gl_accts',
'         WHERE glac_bu   = spla_bu',
'           AND glac_acct = spla_acct) acct_description,',
'       spla_flag,',
'       spla_cl_id,',
'       spla_plnt,',
'       spla_user_sid,',
'       spla_trk_type,',
'       spla_seq_no,',
'       spla_temp_status,',
'       spla_cre_by,',
'       spla_cre_ip_addr,',
'       spla_cre_os_user,',
'       spla_cre_date,',
'       spla_upd_by,',
'       spla_upd_ip_addr,',
'       spla_upd_os_user,',
'       spla_upd_date,',
'       spla_ln_seq_no,',
'       spla_cre_emp_id,',
'       spla_upd_emp_id,',
'       spla_lgr_type_old,',
'       spla_acct_old,',
'       spla_flag_old,',
'       spla_cl_id_old,',
'       spla_plnt_old',
'  FROM suplr_plant_accts_edit_temp',
' WHERE spla_bu          = :GLOBAL_BU',
'   AND spla_suplr_id    = :P36700505_ID',
'   AND spla_temp_status = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11223235941415994510)
,p_name=>'ACCT_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Account Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Account')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(8020284012362029429)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'SPLA_LGR_TYPE'
,p_ajax_items_to_submit=>'SPLA_LGR_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223236194350994512)
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
 p_id=>wwv_flow_imp.id(11223236309253994513)
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
 p_id=>wwv_flow_imp.id(11223154527280839731)
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
 p_id=>wwv_flow_imp.id(11223154954993839735)
,p_name=>'SPLA_ACCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_ACCT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Account'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223156985428839755)
,p_name=>'SPLA_ACCT_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_ACCT_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223154723357839732)
,p_name=>'SPLA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223155133263839737)
,p_name=>'SPLA_CL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cl Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(11223235686832994507)
,p_name=>'SPLA_CL_ID_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CL_ID_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cl Id Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11223155810979839743)
,p_name=>'SPLA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre By'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11223156058808839746)
,p_name=>'SPLA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spla Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(11223156698952839752)
,p_name=>'SPLA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11223155864742839744)
,p_name=>'SPLA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11223155931147839745)
,p_name=>'SPLA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11223155075414839736)
,p_name=>'SPLA_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(11223157057850839756)
,p_name=>'SPLA_FLAG_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_FLAG_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Flag Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(11223154910571839734)
,p_name=>'SPLA_LGR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LGR_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Acct. Class'
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
  'title', 'Acct. Class')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT atc_disp_desc D ,atc_code R',
'  FROM acct_type_codes',
' WHERE atc_bu = :global_bu',
'       AND atc_acct_type IN',
'              (''SAP'', ''SAD'', ''SSD'', ''STLL'', ''LTLL'')',
'      AND atc_rqrd_type <> ''N'' ',
'       AND atc_sys_def_flg = ''Y''',
'UNION ALL',
'SELECT atc_disp_desc D,atc_code R',
'  FROM acct_type_codes',
' WHERE     atc_bu = :global_bu',
'       AND atc_sup_cust_type = ''S''',
'      AND atc_rqrd_type <> ''N'' ',
'       AND atc_sys_def_flg = ''N'''))
,p_lov_display_extra=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'AP'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223156849396839754)
,p_name=>'SPLA_LGR_TYPE_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LGR_TYPE_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223156560313839751)
,p_name=>'SPLA_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223155224371839738)
,p_name=>'SPLA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(11223235755553994508)
,p_name=>'SPLA_PLNT_OLD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_PLNT_OLD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Plnt Old'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11223155607185839741)
,p_name=>'SPLA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11223154798716839733)
,p_name=>'SPLA_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223155694235839742)
,p_name=>'SPLA_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Temp Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
,p_is_primary_key=>true
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223155429054839740)
,p_name=>'SPLA_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete;D'
,p_lov_display_extra=>true
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
 p_id=>wwv_flow_imp.id(11223156200578839747)
,p_name=>'SPLA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11223156438706839750)
,p_name=>'SPLA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spla Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(11223156819238839753)
,p_name=>'SPLA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Emp Id'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11223156290714839748)
,p_name=>'SPLA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11223156361992839749)
,p_name=>'SPLA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spla Upd Os User'
,p_heading_alignment=>'LEFT'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11223155406072839739)
,p_name=>'SPLA_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPLA_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spla User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11223154474670839730)
,p_internal_uid=>5741192639127228702
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
 p_id=>wwv_flow_imp.id(11223241761644996241)
,p_interactive_grid_id=>wwv_flow_imp.id(11223154474670839730)
,p_static_id=>'15636912'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11223241997249996241)
,p_report_id=>wwv_flow_imp.id(11223241761644996241)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659634485996251659)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11223236194350994512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659635515615251667)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11223236309253994513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223242486826996246)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11223154527280839731)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223243334220996257)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11223154723357839732)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223244245685996268)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11223154798716839733)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223245130364996279)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11223154910571839734)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223246048030996288)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11223154954993839735)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223246840372996298)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11223155075414839736)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223247774428996312)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11223155133263839737)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223248709387996327)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11223155224371839738)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223249550048996335)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11223155406072839739)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223250455377996341)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11223155429054839740)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223251330050996346)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11223155607185839741)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223252289957996352)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11223155694235839742)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223253143442996363)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11223155810979839743)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223254119951996377)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11223155864742839744)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223255015415996385)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11223155931147839745)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223255897152996393)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11223156058808839746)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223256711171996402)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11223156200578839747)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223257530334996410)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11223156290714839748)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223258428941996420)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11223156361992839749)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223259388832996427)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11223156438706839750)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223260300716996435)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11223156560313839751)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223261163278996443)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11223156698952839752)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223262119872996465)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11223156819238839753)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223262939896996473)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11223156849396839754)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223263830124996481)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11223156985428839755)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223264730731996488)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11223157057850839756)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223265596061996496)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11223235686832994507)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223266470777996504)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11223235755553994508)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11223268268325996520)
,p_view_id=>wwv_flow_imp.id(11223241997249996241)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11223235941415994510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11224524878171224810)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-6'
,p_region_name=>'bank'
,p_parent_plug_id=>wwv_flow_imp.id(11223237463014994525)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       spbd_bu,',
'       spbd_branch_desc,',
'       spbd_bank_city,',
'       spbd_bank_addr1,',
'       spbd_bank_addr2,',
'       spbd_bank_ifsc_code,',
'       spbd_bank_acc_no,',
'       spbd_dflt_flag,',
'       spbd_suplr_id,',
'       spbd_pay_acct_type,',
'       spbd_swift_bic,',
'       spbd_iban_no,',
'       spbd_pay_bank_name,',
'       spbd_pay_to_name,',
'       spbd_city_id,',
'       spbd_user_sid,',
'       spbd_trk_type,',
'       spbd_seq_no,',
'       spbd_temp_status,',
'       spbd_cre_by,',
'       spbd_cre_ip_addr,',
'       spbd_cre_os_user,',
'       spbd_cre_date,',
'       spbd_upd_by,',
'       spbd_upd_ip_addr,',
'       spbd_upd_os_user,',
'       spbd_upd_date,',
'       spbd_ln_seq_no,',
'       spbd_cre_emp_id,',
'       spbd_upd_emp_id',
'  FROM suplr_pay_bank_dtls_ed_temp',
' WHERE spbd_bu          = :global_bu',
'   AND spbd_suplr_id    = :P36700505_ID',
'   AND spbd_temp_status = ''N''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11224528131852224843)
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
 p_id=>wwv_flow_imp.id(11224528225851224844)
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
 p_id=>wwv_flow_imp.id(11224525041844224812)
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
 p_id=>wwv_flow_imp.id(11224525785559224819)
,p_name=>'SPBD_BANK_ACC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ACC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bank A/C No.'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(11224525442014224816)
,p_name=>'SPBD_BANK_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11224525531773224817)
,p_name=>'SPBD_BANK_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank Addr2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11224525405493224815)
,p_name=>'SPBD_BANK_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Bank City'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11224525626788224818)
,p_name=>'SPBD_BANK_IFSC_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BANK_IFSC_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IFSC Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>150
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
 p_id=>wwv_flow_imp.id(11224525247229224814)
,p_name=>'SPBD_BRANCH_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BRANCH_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Branch'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Branch')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sbb_name',
'  FROM suplr_bank_branch',
' WHERE sbb_active_flag = ''Y''',
' GROUP BY sbb_name'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224525134433224813)
,p_name=>'SPBD_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224526448237224826)
,p_name=>'SPBD_CITY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CITY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd City Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11224526949614224831)
,p_name=>'SPBD_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre By'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224527273612224834)
,p_name=>'SPBD_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spbd Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11224527872781224840)
,p_name=>'SPBD_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(11224527090722224832)
,p_name=>'SPBD_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(11224527160145224833)
,p_name=>'SPBD_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
 p_id=>wwv_flow_imp.id(11224525884385224820)
,p_name=>'SPBD_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(11224526181839224823)
,p_name=>'SPBD_IBAN_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_IBAN_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'IBAN No.'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224527815587224839)
,p_name=>'SPBD_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224528063636224842)
,p_name=>'SPBD_PAY_ACCT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_PAY_ACCT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'A/C Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:SB;SB,CB;CB,RD;RD,FD;FD,CC;CC,OD;OD'
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
,p_default_expression=>'SB'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224526239297224824)
,p_name=>'SPBD_PAY_BANK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_PAY_BANK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Bank Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Bank Name')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT suplrb_bank_name1 ',
'  FROM suplr_banks',
' WHERE suplrb_active_flag=''Y''',
'GROUP BY suplrb_bank_name1'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224526413897224825)
,p_name=>'SPBD_PAY_TO_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_PAY_TO_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Pay To Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(11224526728448224829)
,p_name=>'SPBD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spbd Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11224525939617224821)
,p_name=>'SPBD_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224526120615224822)
,p_name=>'SPBD_SWIFT_BIC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_SWIFT_BIC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SWIFT BIC/Code'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(11224526836452224830)
,p_name=>'SPBD_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11224526662421224828)
,p_name=>'SPBD_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete;D'
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
 p_id=>wwv_flow_imp.id(11224527406437224835)
,p_name=>'SPBD_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
 p_id=>wwv_flow_imp.id(11224527656138224838)
,p_name=>'SPBD_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Spbd Upd Date'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11224527997300224841)
,p_name=>'SPBD_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(11224527442542224836)
,p_name=>'SPBD_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Ip Addr'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11224527547098224837)
,p_name=>'SPBD_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Spbd Upd Os User'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11224526529934224827)
,p_name=>'SPBD_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPBD_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Spbd User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(11224524937862224811)
,p_internal_uid=>5742563102318613783
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
 p_id=>wwv_flow_imp.id(11224687602292350943)
,p_interactive_grid_id=>wwv_flow_imp.id(11224524937862224811)
,p_static_id=>'15651370'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11224687729416350945)
,p_report_id=>wwv_flow_imp.id(11224687602292350943)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659550690586180111)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(11224528225851224844)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224688288089350949)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11224525041844224812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224689212496350959)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11224525134433224813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224690118827350965)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11224525247229224814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182.594
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224690964232350973)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11224525405493224815)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224691878570350981)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11224525442014224816)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224692624266350987)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11224525531773224817)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224693548835350993)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11224525626788224818)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105.43799999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224694523219351001)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11224525785559224819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224695379593351007)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(11224525884385224820)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58.593999999999994
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224696303713351012)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11224525939617224821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224697174017351018)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11224526120615224822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107.438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224698058516351034)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11224526181839224823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224699041537351046)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11224526239297224824)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175.438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224699943802351052)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11224526413897224825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154.594
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224700868999351057)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11224526448237224826)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224701809846351066)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11224526529934224827)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224702641586351074)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11224526662421224828)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62.5938
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224703572912351082)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11224526728448224829)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224704342822351088)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11224526836452224830)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224705245522351096)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11224526949614224831)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224706178439351102)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11224527090722224832)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224707045008351110)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11224527160145224833)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224707943447351115)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11224527273612224834)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224708885288351126)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11224527406437224835)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224709749985351132)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11224527442542224836)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224710706809351138)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11224527547098224837)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224711533508351145)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11224527656138224838)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224712433644351152)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11224527815587224839)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224713413872351159)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11224527872781224840)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224714293952351166)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11224527997300224841)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224715281876351176)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11224528063636224842)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69.43799999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11224721785045368284)
,p_view_id=>wwv_flow_imp.id(11224687729416350945)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11224528131852224843)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11226123231708253608)
,p_plug_name=>'New Value'
,p_static_id=>'new-value-7'
,p_region_name=>'suplr_con'
,p_parent_plug_id=>wwv_flow_imp.id(11224835277753810708)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       sci_bu,',
'       sci_suplr_id,',
'       sci_seq_id,',
'       sci_person_pfx,',
'       sci_person_first_name1,',
'       sci_person_middle_name1,',
'       sci_person_last_name1,',
'       sci_person_first_name2,',
'       sci_person_middle_name2,',
'       sci_person_last_name2,',
'       sci_addr1,',
'       sci_addr2,',
'       sci_addr3,',
'       sci_po_box,',
'       sci_city,',
'       sci_state,',
'       sci_country,',
'       sci_zip,',
'       sci_tele1,',
'       sci_tele2,',
'       sci_fax1,',
'       sci_fax2,',
'       sci_email1,',
'       sci_email2,',
'       sci_position_name,',
'       sci_priority,',
'       sci_mail_flag,',
'       sci_key_person_flag,',
'       sci_department,',
'       sci_user_sid,',
'       sci_trk_type,',
'       sci_seq_no,',
'       sci_temp_status,',
'       sci_cre_by,',
'       sci_cre_ip_addr,',
'       sci_cre_os_user,',
'       sci_cre_date,',
'       sci_upd_by,',
'       sci_upd_ip_addr,',
'       sci_upd_os_user,',
'       sci_upd_date,',
'       sci_ln_seq_no,',
'       sci_cre_emp_id,',
'       sci_upd_emp_id',
'  FROM suplr_contact_info_edit_temp',
' WHERE sci_bu          = :global_bu',
'   AND sci_suplr_id    = :P36700505_ID',
'   AND sci_temp_status = ''N'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36700505_ID'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New Value'
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
 p_id=>wwv_flow_imp.id(11226128056953253656)
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
 p_id=>wwv_flow_imp.id(11226213021542435007)
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
 p_id=>wwv_flow_imp.id(11226123469045253610)
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
 p_id=>wwv_flow_imp.id(11226124469656253620)
,p_name=>'SCI_ADDR1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(11226124574048253621)
,p_name=>'SCI_ADDR2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr2'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226124675510253622)
,p_name=>'SCI_ADDR3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ADDR3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Addr3'
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
 p_id=>wwv_flow_imp.id(11226123526568253611)
,p_name=>'SCI_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226124910934253624)
,p_name=>'SCI_CITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci City'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(11226125064136253626)
,p_name=>'SCI_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(11226126797581253643)
,p_name=>'SCI_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(11226127099999253646)
,p_name=>'SCI_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sci Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
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
 p_id=>wwv_flow_imp.id(11226127652504253652)
,p_name=>'SCI_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
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
 p_id=>wwv_flow_imp.id(11226126891581253644)
,p_name=>'SCI_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
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
 p_id=>wwv_flow_imp.id(11226126985595253645)
,p_name=>'SCI_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
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
 p_id=>wwv_flow_imp.id(11226126295328253638)
,p_name=>'SCI_DEPARTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_DEPARTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Department'
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
 p_id=>wwv_flow_imp.id(11226125650208253632)
,p_name=>'SCI_EMAIL1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_EMAIL1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(11226125793911253633)
,p_name=>'SCI_EMAIL2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_EMAIL2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Email2'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11226125425021253630)
,p_name=>'SCI_FAX1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_FAX1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Fax1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226125573266253631)
,p_name=>'SCI_FAX2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_FAX2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Fax2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226126206576253637)
,p_name=>'SCI_KEY_PERSON_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_KEY_PERSON_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Key Person Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(11226127617605253651)
,p_name=>'SCI_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_LN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Ln Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>440
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
 p_id=>wwv_flow_imp.id(11226126047877253636)
,p_name=>'SCI_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Mail Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(11226123923549253614)
,p_name=>'SCI_PERSON_FIRST_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_FIRST_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(11226124159062253617)
,p_name=>'SCI_PERSON_FIRST_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_FIRST_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person First Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226124115777253616)
,p_name=>'SCI_PERSON_LAST_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_LAST_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Last Name1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226124416957253619)
,p_name=>'SCI_PERSON_LAST_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_LAST_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Last Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226123933671253615)
,p_name=>'SCI_PERSON_MIDDLE_NAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_MIDDLE_NAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Middle Name1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226124293985253618)
,p_name=>'SCI_PERSON_MIDDLE_NAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_MIDDLE_NAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Person Middle Name2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226127983444253655)
,p_name=>'SCI_PERSON_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PERSON_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Salut.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>470
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Mr.;Mr.,Ms.;Ms.,Dr.;Dr.'
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
,p_default_expression=>'Mr.'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226125863648253634)
,p_name=>'SCI_POSITION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_POSITION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Designation'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_imp.id(11226124807100253623)
,p_name=>'SCI_PO_BOX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PO_BOX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Po Box'
,p_heading_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(11226125931811253635)
,p_name=>'SCI_PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_PRIORITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Priority'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>280
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
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226123735913253613)
,p_name=>'SCI_SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226126552200253641)
,p_name=>'SCI_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
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
 p_id=>wwv_flow_imp.id(11226124951728253625)
,p_name=>'SCI_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci State'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(11226123702693253612)
,p_name=>'SCI_SUPLR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_SUPLR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226125251790253628)
,p_name=>'SCI_TELE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TELE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Telephone'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226125326675253629)
,p_name=>'SCI_TELE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TELE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226126638629253642)
,p_name=>'SCI_TEMP_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TEMP_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11226126470336253640)
,p_name=>'SCI_TRK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_TRK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Modify;M,Add;A,Delete;D'
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
 p_id=>wwv_flow_imp.id(11226127181217253647)
,p_name=>'SCI_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
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
 p_id=>wwv_flow_imp.id(11226127460644253650)
,p_name=>'SCI_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Sci Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(11226127773480253653)
,p_name=>'SCI_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
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
 p_id=>wwv_flow_imp.id(11226127315431253648)
,p_name=>'SCI_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(11226127342273253649)
,p_name=>'SCI_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(11226126409502253639)
,p_name=>'SCI_USER_SID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_USER_SID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sci User Sid'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>320
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
 p_id=>wwv_flow_imp.id(11226125147251253627)
,p_name=>'SCI_ZIP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCI_ZIP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sci Zip'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(11226123401448253609)
,p_internal_uid=>5744161565904642581
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
 p_id=>wwv_flow_imp.id(11226136627534291526)
,p_interactive_grid_id=>wwv_flow_imp.id(11226123401448253609)
,p_static_id=>'15665861'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(11226136900937291526)
,p_report_id=>wwv_flow_imp.id(11226136627534291526)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659552137086183123)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(11226127983444253655)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>45
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659586634593304009)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(11226128056953253656)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9659587657834304017)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(11226213021542435007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226137398541291534)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(11226123469045253610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226138270006291541)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(11226123526568253611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226139053273291551)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(11226123702693253612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226140021113291559)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(11226123735913253613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226140902768291566)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(11226123923549253614)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>225
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226141750581291574)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(11226123933671253615)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226142680049291584)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(11226124115777253616)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226143574901291595)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(11226124159062253617)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226144462950291602)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(11226124293985253618)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226145336093291609)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(11226124416957253619)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226146226125291616)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(11226124469656253620)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226147194901291624)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(11226124574048253621)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226148122808291631)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(11226124675510253622)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226148923843291637)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(11226124807100253623)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226149850682291643)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(11226124910934253624)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226150650472291649)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(11226124951728253625)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226151565443291656)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(11226125064136253626)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226152440350291662)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(11226125147251253627)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226153345122291670)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(11226125251790253628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120.73400000000001
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226154247982291677)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(11226125326675253629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130.625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226155151756291687)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(11226125425021253630)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226156036099291695)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(11226125573266253631)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226156988092291702)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(11226125650208253632)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123.14099999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226157918005291710)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(11226125793911253633)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226158774072291721)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(11226125863648253634)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226159633863291729)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(11226125931811253635)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226160586804291735)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(11226126047877253636)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226161462936291743)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(11226126206576253637)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226162317706291749)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(11226126295328253638)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226163200959291756)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(11226126409502253639)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226164103125291762)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11226126470336253640)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226165018440291768)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(11226126552200253641)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226165923145291776)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(11226126638629253642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226166799189291784)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(11226126797581253643)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226167711153291790)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(11226126891581253644)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226168597681291799)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(11226126985595253645)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226169498146291804)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(11226127099999253646)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226170332219291809)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(11226127181217253647)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226171249615291815)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(11226127315431253648)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226172123931291820)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(11226127342273253649)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226173029409291826)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(11226127460644253650)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226173943010291831)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(11226127617605253651)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226174891263291837)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(11226127652504253652)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(11226175761923291846)
,p_view_id=>wwv_flow_imp.id(11226136900937291526)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(11226127773480253653)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11210742036438983814)
,p_plug_name=>'Update Suppliers Details'
,p_static_id=>'update-suppliers-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020071481498028368)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11224524878171224810)
,p_button_name=>'Add_bank'
,p_static_id=>'add-bank'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''bank'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020149116685028731)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11226123231708253608)
,p_button_name=>'Add_con'
,p_static_id=>'add-con'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''suplr_con'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020250084543029085)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11220207938855405345)
,p_button_name=>'Add_Curr'
,p_static_id=>'add-curr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''suplr_curr'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020026405186028173)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11223154407570839729)
,p_button_name=>'Add_GA'
,p_static_id=>'add-ga'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''GL_Acct'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020192635528028871)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11222665849697783309)
,p_button_name=>'Add_GL'
,p_static_id=>'add-gl'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''GL_Group'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020099839523028457)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11215360407698277926)
,p_button_name=>'Add_loc'
,p_static_id=>'add-loc'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'onclick="add_row(''suplr_loc'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020209328544028940)
,p_button_sequence=>1750
,p_button_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020072300780028370)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11224524878171224810)
,p_button_name=>'Post_bank'
,p_static_id=>'post-bank'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020149926900028734)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11226123231708253608)
,p_button_name=>'Post_con'
,p_static_id=>'post-con'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020249778379029085)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11220207938855405345)
,p_button_name=>'Post_Cur'
,p_static_id=>'post-cur'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020027176134028179)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11223154407570839729)
,p_button_name=>'Post_GA'
,p_static_id=>'post-ga'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020193014047028873)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11222665849697783309)
,p_button_name=>'Post_GL'
,p_static_id=>'post-gl'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020099504169028456)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11215360407698277926)
,p_button_name=>'Post_loc'
,p_static_id=>'post-loc'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020209714332028940)
,p_button_sequence=>1740
,p_button_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020071910645028370)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11224524878171224810)
,p_button_name=>'Save_bank'
,p_static_id=>'save-bank'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''bank'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020149482725028734)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11226123231708253608)
,p_button_name=>'Save_con'
,p_static_id=>'save-con'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''suplr_con'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020250464688029087)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11220207938855405345)
,p_button_name=>'Save_Curr'
,p_static_id=>'save-curr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''suplr_curr'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020026754210028179)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11223154407570839729)
,p_button_name=>'Save_GA'
,p_static_id=>'save-ga'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''GL_Acct'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020192157228028871)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11222665849697783309)
,p_button_name=>'Save_gl'
,p_static_id=>'save-gl'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''GL_Group'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8020100283864028457)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11215360407698277926)
,p_button_name=>'Save_loc'
,p_static_id=>'save-loc'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''suplr_loc'')"'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8020280817080029317)
,p_branch_name=>'Go to Supplier Screen'
,p_branch_action=>'f?p=&APP_ID.:367005007:&SESSION.::&DEBUG.::P367005007_SUPLR_SUPLR_ID:&P36700505_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':REQUEST IN (''Post'',''Post_loc'',''Post_GL'',''Post_GA'',''Post_Cur'',''Post_bank'',''Post_con'')'
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211109567326985675)
,p_name=>'P36700505_ADDRESS1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Address 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211109705950985676)
,p_name=>'P36700505_ADDRESS2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Address 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211109823819985677)
,p_name=>'P36700505_ADDRESS3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Address 3'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>6
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233920301686893941)
,p_name=>'P36700505_APPLICABLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11233532391260892021)
,p_item_default=>'N'
,p_prompt=>'Applicable'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11227567244948484645)
,p_name=>'P36700505_BILL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Bill'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211109854990985678)
,p_name=>'P36700505_CITY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'City'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211135749705985766)
,p_name=>'P36700505_COUNTRY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Country'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211110147377985680)
,p_name=>'P36700505_COUNTRY_CV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Country'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110894251985688)
,p_name=>'P36700505_CRDT_LMT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Credit Limit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110648338985686)
,p_name=>'P36700505_CUST_CODE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Customer Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233920361960893942)
,p_name=>'P36700505_DECLARE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11233532391260892021)
,p_prompt=>'Declaration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110521433985684)
,p_name=>'P36700505_EMAIL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Email'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110332019985682)
,p_name=>'P36700505_FAX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Fax'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226582132244436884)
,p_name=>'P36700505_FORWARD_FLAG'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Forward'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226582316751436886)
,p_name=>'P36700505_GENERAL_FLAG'
,p_is_required=>true
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'General'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226579809401436861)
,p_name=>'P36700505_GROUP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11227567498941484648)
,p_name=>'P36700505_GST_RND'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'GST Rnd. Off '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11227567550535484649)
,p_name=>'P36700505_HOLD_REAS'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Hold Reason'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226583093750436894)
,p_name=>'P36700505_HOL_ORD'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Hold Order'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226583003964436893)
,p_name=>'P36700505_HOL_PAY'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Hold Payment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11210745164410984128)
,p_name=>'P36700505_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226579875491436862)
,p_name=>'P36700505_INCO_TERM'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'INCO Term'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110440614985683)
,p_name=>'P36700505_MOBILE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Mobile'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233920470227893943)
,p_name=>'P36700505_MSME_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11233532391260892021)
,p_prompt=>'MSME No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11227589933320484728)
,p_name=>'P36700505_MSME_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11233532391260892021)
,p_prompt=>'MSME Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233896862535893852)
,p_name=>'P36700505_PARENT_FLAG'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Parent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Independent;N,Parent Supplier;Y,Child Supplier;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110958384985689)
,p_name=>'P36700505_PARNT_SUPLR_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Parent Suplr. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233897026092893853)
,p_name=>'P36700505_PARNT_SUPLR_NAME'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Parent Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226580101725436864)
,p_name=>'P36700505_PAYMENT_TER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Payment Term'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11227567743877484650)
,p_name=>'P36700505_PRINT_CAP'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Print Caption'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226581792818436881)
,p_name=>'P36700505_PUR_FLAG'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Purchase'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211193808948224028)
,p_name=>'P36700505_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226581978754436883)
,p_name=>'P36700505_SALES_FLAG'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Sales'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226580184808436865)
,p_name=>'P36700505_SHIP_VIA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Ship Via'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211135587808985765)
,p_name=>'P36700505_STATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211109978536985679)
,p_name=>'P36700505_STATE_CV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226581940598436882)
,p_name=>'P36700505_SUBCONT_FLAG'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Subcontract'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226579009769436853)
,p_name=>'P36700505_SUB_GROUP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Sub Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211374344696223365)
,p_name=>'P36700505_SUPLR_ADDR1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Address 1'
,p_source=>'SUPLR_ADDR1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211374459496223366)
,p_name=>'P36700505_SUPLR_ADDR2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Address 2'
,p_source=>'SUPLR_ADDR2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211374502860223367)
,p_name=>'P36700505_SUPLR_ADDR3'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Address 3'
,p_source=>'SUPLR_ADDR3'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_colspan=>6
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226607468773436967)
,p_name=>'P36700505_SUPLR_BILL_RND'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'0'
,p_prompt=>'Bill'
,p_source=>'SUPLR_BILL_RND'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211373136953223353)
,p_name=>'P36700505_SUPLR_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'SUPLR_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211374778468223369)
,p_name=>'P36700505_SUPLR_CITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'City'
,p_source=>'SUPLR_CITY'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_CITY3'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'null',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'City')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11221013630653520777)
,p_name=>'P36700505_SUPLR_COUNTRY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'SUPLR_COUNTRY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211374276019223364)
,p_name=>'P36700505_SUPLR_CREDIT_LIMIT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Credit Limit'
,p_source=>'SUPLR_CREDIT_LIMIT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9884572097281801789)
,p_name=>'P36700505_SUPLR_CURRENCY'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211381753234225063)
,p_name=>'P36700505_SUPLR_CUST_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Customer Code'
,p_source=>'SUPLR_CUST_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211375586730223377)
,p_name=>'P36700505_SUPLR_EMAIL1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Email'
,p_source=>'SUPLR_EMAIL1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211375378926223375)
,p_name=>'P36700505_SUPLR_FAX1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Fax'
,p_source=>'SUPLR_FAX1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226609216994436985)
,p_name=>'P36700505_SUPLR_FRWD_FLG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Forward'
,p_source=>'SUPLR_FRWD_FLG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226606903509436962)
,p_name=>'P36700505_SUPLR_GROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'SUPLR_GROUP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226610469610436997)
,p_name=>'P36700505_SUPLR_GROUP_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Group'
,p_source=>'SUPLR_GROUP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226608268041436975)
,p_name=>'P36700505_SUPLR_GST_ROF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'0'
,p_prompt=>'GST Rnd. Off'
,p_source=>'SUPLR_GST_ROF'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608511404436978)
,p_name=>'P36700505_SUPLR_HOLD_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Hold Payment'
,p_source=>'SUPLR_HOLD_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608689878436980)
,p_name=>'P36700505_SUPLR_HOLD_REASON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Hold Reason'
,p_source=>'SUPLR_HOLD_REASON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226607197712436965)
,p_name=>'P36700505_SUPLR_INCO_TERM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'INCO Term'
,p_source=>'SUPLR_FOB_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT fob_desc1,fob_fob_id',
'  FROM FOBS',
' WHERE fob_bu = :global_bu ',
'GROUP BY fob_fob_id,fob_desc1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'INCO Term')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226609436039436987)
,p_name=>'P36700505_SUPLR_MODE_GEN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'General'
,p_source=>'SUPLR_MODE_GEN'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608927632436982)
,p_name=>'P36700505_SUPLR_MODE_PUR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Purchase'
,p_source=>'SUPLR_MODE_PUR'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226609136386436984)
,p_name=>'P36700505_SUPLR_MODE_SAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Sales'
,p_source=>'SUPLR_MODE_SAL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608992031436983)
,p_name=>'P36700505_SUPLR_MODE_SC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Subcontract'
,p_source=>'SUPLR_MODE_SC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233978023359894156)
,p_name=>'P36700505_SUPLR_MSME_APPL_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11233532848747892026)
,p_item_default=>'N'
,p_prompt=>'Applicable'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233978065602894157)
,p_name=>'P36700505_SUPLR_MSME_DECL_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11233532848747892026)
,p_item_default=>'N'
,p_prompt=>'Declaration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233978219029894158)
,p_name=>'P36700505_SUPLR_MSME_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11233532848747892026)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'MSME No.'
,p_source=>'SUPLR_MSME_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(11226660167324437158)
,p_name=>'P36700505_SUPLR_MSME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11233532848747892026)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'NA'
,p_prompt=>'MSME Type'
,p_source=>'SUPLR_MSME_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Medium;M,Small;S,Micro;O,Large;L,Not Applicable;NA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608640964436979)
,p_name=>'P36700505_SUPLR_ORD_HOLD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Hold Order'
,p_source=>'SUPLR_ORD_HOLD_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233925011065893963)
,p_name=>'P36700505_SUPLR_PARENT_NAME'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Parent Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211384740317225093)
,p_name=>'P36700505_SUPLR_PARENT_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Parent Suplr. ID'
,p_source=>'SUPLR_PARENT_SUPLR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUPLR_SUPLR_ID,SUPLR_NAME1 ',
'  FROM SUPPLIERS',
' WHERE SUPLR_BU=:GLOBAL_BU ',
'   AND SUPLR_STATUS    = ''A'' ',
'   AND SUPLR_PART_FLAG = ''N''',
'   AND SUPLR_SUPLR_ID NOT IN :P36700505_SUPLR_SUPLR_ID'))
,p_lov_cascade_parent_items=>'P36700505_SUPLR_SUPLR_ID'
,p_ajax_items_to_submit=>'P36700505_SUPLR_SUPLR_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Parent Suplr. ID')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11233924866129893961)
,p_name=>'P36700505_SUPLR_PART_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Parent'
,p_source=>'SUPLR_PART_FLAG'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Independent;N,Parent Supplier;Y,Child Supplier;C'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226606998240436963)
,p_name=>'P36700505_SUPLR_PAY_TERM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Payment Term'
,p_source=>'SUPLR_TERM_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT term_desc1,',
'       TERM_TERM_ID',
'  FROM TERMS_HD ',
' where term_bu=:global_bu',
'  and term_status=''A'' ',
'  and TERM_SUPLR_FLAG = ''Y'''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Payment Term')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608809914436981)
,p_name=>'P36700505_SUPLR_PRNT_CAPN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Print Caption'
,p_source=>'SUPLR_PRNT_CAPN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226607287431436966)
,p_name=>'P36700505_SUPLR_SHIP_VIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Ship Via'
,p_source=>'SUPLR_SHIPVIA_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sv_desc1,',
'       SV_SHIPVIA_ID',
'  FROM SHIP_VIAS',
' where sv_bu=:global_bu '))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Ship Via')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11221013553541520776)
,p_name=>'P36700505_SUPLR_STATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'SUPLR_STATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211373365684223355)
,p_name=>'P36700505_SUPLR_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'E'
,p_source=>'SUPLR_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226606868562436961)
,p_name=>'P36700505_SUPLR_SUB_GROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Sub Group'
,p_source=>'SUPLR_SUBGROUP'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SUB_GRP_UPD(CFG0050)'
,p_cSize=>30
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'null',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Group')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211373252163223354)
,p_name=>'P36700505_SUPLR_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_source=>'SUPLR_SUPLR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226608080898436973)
,p_name=>'P36700505_SUPLR_TCS_ROF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'TCS'
,p_source=>'SUPLR_TCS_ROF'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211375132795223373)
,p_name=>'P36700505_SUPLR_TELE1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Telephone'
,p_source=>'SUPLR_TELE1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211375195990223374)
,p_name=>'P36700505_SUPLR_TELE2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Mobile'
,p_source=>'SUPLR_TELE2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11226607173368436964)
,p_name=>'P36700505_SUPLR_TERR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Territory'
,p_source=>'SUPLR_TERR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ST_TERR_DESC,ST_TERR_ID',
'  FROM SUPLR_TERR',
' WHERE ST_BU = :GLOBAL_BU'))
,p_cSize=>30
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Territory')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226609364365436986)
,p_name=>'P36700505_SUPLR_TRANSPORT_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_default=>'N'
,p_prompt=>'Transport'
,p_source=>'SUPLR_TRANSPORT_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211375760617223379)
,p_name=>'P36700505_SUPLR_WEB_SITE1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'Website'
,p_source=>'SUPLR_WEB_SITE1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11211375022630223372)
,p_name=>'P36700505_SUPLR_ZIP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_item_source_plug_id=>wwv_flow_imp.id(11210742216821983815)
,p_prompt=>'ZIP/PIN'
,p_source=>'SUPLR_ZIP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(11227567263850484646)
,p_name=>'P36700505_TCS'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'TCS'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110168267985681)
,p_name=>'P36700505_TELEPHONE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Telephone'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226579956179436863)
,p_name=>'P36700505_TERRITORY'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Territory'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11226582214664436885)
,p_name=>'P36700505_TRANSPORT_FLAG'
,p_is_required=>true
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_item_default=>'N'
,p_prompt=>'Transport'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'OT'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11210743470628984111)
,p_name=>'P36700505_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11210742036438983814)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110641221985685)
,p_name=>'P36700505_WEBSITE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'Website'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211110752405985687)
,p_name=>'P36700505_ZIP_PIN'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11210744234549983836)
,p_prompt=>'ZIP/PIN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_display_when=>'P36700505_TYPE'
,p_display_when2=>'AD'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020027980080028182)
,p_tabular_form_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_validation_name=>'Account Description'
,p_static_id=>'account-description'
,p_validation_sequence=>70
,p_validation=>'ACCT_DESCRIPTION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Account Description must be entered.'
,p_associated_column=>'ACCT_DESCRIPTION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020193851822028873)
,p_tabular_form_region_id=>wwv_flow_imp.id(11222665849697783309)
,p_validation_name=>'Acct. Class'
,p_static_id=>'acct-class'
,p_validation_sequence=>50
,p_validation=>'SGG_CODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Acct. Class must be entered.'
,p_associated_column=>'SGG_CODE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020028394092028187)
,p_tabular_form_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_validation_name=>'Acct. Class type'
,p_static_id=>'acct-class-type'
,p_validation_sequence=>80
,p_validation=>'SPLA_LGR_TYPE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Acct. Class must be entered.'
,p_associated_column=>'SPLA_LGR_TYPE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020102766822028462)
,p_tabular_form_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_validation_name=>'Address 1'
,p_static_id=>'address'
,p_validation_sequence=>150
,p_validation=>'SSL_ADDR1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Address 1 must be entered.'
,p_associated_column=>'SSL_ADDR1'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020073206095028378)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'Bank A/C No.'
,p_static_id=>'bank-a-c-no'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF func_find_apm_bank_flg(:GLOBAL_BU) = ''Y'' THEN',
'	IF :SPBD_BANK_ACC_NO IS NULL THEN',
'		RETURN(''Bank Account must be entered.'');',
'	END IF;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_BANK_ACC_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020074808546028382)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'Bank Name'
,p_static_id=>'bank-name'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :SPBD_PAY_BANK_NAME IS NULL THEN',
'IF func_find_apm_bank_flg(:GLOBAL_BU) = ''Y'' THEN',
'		Return(''Bank must be entered.'');',
'END IF;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_PAY_BANK_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020075111894028382)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'Branch'
,p_static_id=>'branch'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :SPBD_BRANCH_DESC IS NULL THEN',
'	 Return(''Branch must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_BRANCH_DESC'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020101568630028460)
,p_tabular_form_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_validation_name=>'City'
,p_static_id=>'city'
,p_validation_sequence=>20
,p_validation=>'SSL_CITY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'City must be entered.'
,p_associated_column=>'SSL_CITY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020194273834028874)
,p_tabular_form_region_id=>wwv_flow_imp.id(11222665849697783309)
,p_validation_name=>'GL Group'
,p_static_id=>'gl-group'
,p_validation_sequence=>60
,p_validation=>'SGG_CL_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'GL Group must be entered.'
,p_associated_column=>'SGG_CL_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020102029391028460)
,p_tabular_form_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_validation_name=>'GST Type'
,p_static_id=>'gst-type'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :SSL_GST_TYPE IN(''N'') AND :SSL_TYPE IN (''L'') THEN',
'	Return(''For Local Classification Non-Resident type is not allowed.'');',
'END IF;	',
'',
'IF :SSL_GST_TYPE NOT IN(''U'',''N'') AND :SSL_TYPE IN (''M'') THEN',
'	Return(''For Import Classification Non-Resident and Unregistered type only allowed.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SSL_GST_TYPE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020102373551028460)
,p_tabular_form_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_validation_name=>'GSTIN No.'
,p_static_id=>'gstin-no'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :SSL_GST_NO IS NULL AND :SSL_GST_TYPE = ''R'' THEN ',
'   Return(''GSTIN No. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SSL_GST_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020074394647028381)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'IBAN No.'
,p_static_id=>'iban-no'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF func_find_apm_bank_flg(:GLOBAL_BU) = ''Y'' AND :SUPLR_CURRENCY2 <> ''INR'' THEN',
'	IF :SPBD_IBAN_NO IS NULL THEN',
'		Return(''IBAN No. must be entered.'');',
'	END IF;	',
'END IF;	 	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_IBAN_NO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020073546959028381)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'IFSC Code'
,p_static_id=>'ifsc-code'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF func_find_apm_bank_flg(:GLOBAL_BU) = ''Y'' THEN',
'	IF :SPBD_BANK_IFSC_CODE IS NULL THEN',
'		Return(''IFSC Code must be entered.'');',
'	END IF;',
'END IF;',
'',
'IF :SPBD_BANK_IFSC_CODE IS NOT NULL AND LENGTH(:SPBD_BANK_IFSC_CODE) <> ''11'' THEN',
'		 Return(''IFSC Code length should be 11 digit.'');',
'END IF;',
'',
'IF :SPBD_BANK_IFSC_CODE IS NOT NULL THEN',
'proc_isalphanumeric(:SPBD_BANK_IFSC_CODE);',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_BANK_IFSC_CODE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020101187254028460)
,p_tabular_form_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_validation_name=>'Location'
,p_static_id=>'location'
,p_validation_sequence=>10
,p_validation=>'SSL_LOC_NAME1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Location must be entered.'
,p_associated_column=>'SSL_LOC_NAME1'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8020073978360028381)
,p_tabular_form_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_validation_name=>'swift bic'
,p_static_id=>'swift-bic'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF func_find_apm_bank_flg(:GLOBAL_BU) = ''Y'' AND :SUPLR_CURRENCY2 <> ''INR'' THEN',
'	IF :SPBD_SWIFT_BIC IS NULL THEN',
'		Return(''SWIFT BIC/Code must be entered.'');',
'	END IF;	',
'END IF;',
' 	  	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SPBD_SWIFT_BIC'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020276998756029301)
,p_name=>'Account Desc.'
,p_static_id=>'account-desc'
,p_event_sequence=>70
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_triggering_element=>'ACCT_DESCRIPTION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ACCT_DESCRIPTION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020277499658029301)
,p_event_id=>wwv_flow_imp.id(8020276998756029301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SPLA_CL_ID,SPLA_ACCT',
  'items_to_submit', 'ACCT_DESCRIPTION,SPLA_LGR_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :ACCT_DESCRIPTION IS NOT NULL THEN',
    '   DECLARE',
    '    CURSOR c1',
    '          IS',
    '       SELECT glac_acct_desc1,',
    '              glac_acct,',
    '              glac_cl_id ',
    '         FROM gl_accts, ',
    '              glm_control ',
    '        WHERE glac_bu = glmctrl_bu',
    '          AND glac_bu = :GLOBAL_bu',
    '          AND glac_acct_status = ''A''',
    '          AND glac_acct_type_code = :spla_lgr_type',
    '          AND glac_acct_desc1     = :ACCT_DESCRIPTION',
    '   UNION ALL',
    '       SELECT glac_acct_desc1, ',
    '              glac_acct,',
    '              glac_cl_id',
    '         FROM gl_accts,',
    '              glm_control',
    '        WHERE glac_bu = glmctrl_bu',
    '          AND glac_bu = :GLOBAL_bu',
    '          AND glac_acct_status = ''A''',
    '          AND glac_acct_type_code = :spla_lgr_type',
    '          AND glac_acct_desc1     = :ACCT_DESCRIPTION;',
    '    cr1 c1%ROWTYPE;',
    '   BEGIN',
    '    OPEN c1;',
    '    FETCH c1 INTO cr1;',
    '    IF c1%FOUND THEN',
    '         :SPLA_ACCT  := cr1.glac_acct;',
    '         :SPLA_CL_ID :=	cr1.glac_cl_id;',
    '   END IF;',
    '   CLOSE c1;',
    '   END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020266617141029273)
,p_name=>'City'
,p_static_id=>'city'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36700505_SUPLR_CITY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020267111077029282)
,p_event_id=>wwv_flow_imp.id(8020266617141029273)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P36700505_STATE_CV,P36700505_COUNTRY_CV,P36700505_COUNTRY,P36700505_STATE',
  'items_to_submit', 'P36700505_SUPLR_CITY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P36700505_SUPLR_CITY IS NOT NULL THEN',
    '  SELECT state_id,',
    '         state_name1,     ',
    '         cntry_id, ',
    '         cntry_name1,',
    '			cntry_curcy ',
    '    INTO :P36700505_SUPLR_STATE,',
    '         :P36700505_STATE,',
    '         :P36700505_SUPLR_COUNTRY,',
    '         :P36700505_COUNTRY,',
    '			:P36700505_SUPLR_CURRENCY',
    '    FROM cities, states, countries',
    '   WHERE CITY_BU = STATE_BU',
    '     AND CITY_BU = CNTRY_BU',
    '     AND CITY_BU = :GLOBAL_BU',
    '     AND city_id = :P36700505_SUPLR_CITY ',
    '     AND city_state_id = state_id ',
    '     AND state_cntry_id = cntry_id',
    'ORDER BY 1 ASC;',
    'ELSIF :P36700505_SUPLR_CITY IS NULL THEN',
    '         :P36700505_SUPLR_STATE    :=NULL;',
    '         :P36700505_STATE     :=NULL;',
    '         :P36700505_SUPLR_COUNTRY  :=NULL;',
    '         :P36700505_COUNTRY  :=NULL;',
    '			:P36700505_SUPLR_CURRENCY  :=NULL;',
    'END IF;',
    '',
    '--Raise_Application_Error(-20999,:P36700505_COUNTRY||''/''||:P36700505_STATE);')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020268247108029288)
,p_name=>'City_Loc'
,p_static_id=>'city-loc'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_triggering_element=>'SSL_CITY'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'SSL_CITY'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020268825884029290)
,p_event_id=>wwv_flow_imp.id(8020268247108029288)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SSL_STATE,SSL_COUNTRY,STATE_CODE,SSL_TYPE,SSL_GST_NO',
  'items_to_submit', 'SSL_CITY,SSL_STATE,SSL_COUNTRY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :SSL_CITY IS NOT NULL THEN',
    'DECLARE',
    ' CURSOR c1 ',
    '     IS',
    '      SELECT city_id,',
    '      	    state_id,',
    '      	    state_code state_cod,',
    '      	    DECODE(1,1,state_name1,NVL(state_name2,state_name1)) AS state_desc,',
    '	     		 cntry_id,',
    '      	    DECODE(1,1,cntry_name1,NVL(cntry_name2,cntry_name1)) AS country_desc,',
    '             cntry_curcy',
    '        FROM cities, states, countries',
    '       WHERE city_state_id = state_id ',
    '         AND state_cntry_id = cntry_id',
    '         AND city_id = :SSL_CITY;',
    'cr1 c1%ROWTYPE;',
    'BEGIN',
    '	OPEN c1;',
    '	FETCH c1 INTO cr1;',
    '	-- Raise_Application_Error(-20999,cr1.state_cod);',
    '   IF c1%NOTFOUND THEN',
    '		Raise_Application_Error(-20999,''City not found.'');',
    '	ELSE',
    '		   :SSL_STATE   :=cr1.state_id;',
    '		   :SSL_COUNTRY :=cr1.cntry_id;',
    '		   :STATE_CODE  := cr1.state_cod;',
    '	END IF;',
    '	CLOSE c1;',
    'END;',
    'END IF;',
    '',
    '',
    'IF :SSL_CITY IS NOT NULL THEN ',
    '	DECLARE',
    '		CURSOR C1',
    '		IS',
    '	SELECT bu_country v_bu_country',
    '     FROM business_units',
    '     WHERE bu_id = :global_bu;',
    '		',
    '		CR1   C1%ROWTYPE;',
    '		',
    '	CURSOR C2',
    '		IS',
    '		SELECT bu_state v_bu_state',
    '     FROM business_units',
    '     WHERE bu_id = :global_bu;',
    '		',
    '		CR2   C2%ROWTYPE;',
    '		',
    '	CURSOR C3',
    '		IS',
    '		  SELECT state_type  v_ut_flag',
    '          FROM states',
    '         WHERE state_id= :SSL_STATE;',
    '		',
    '		CR3   C3%ROWTYPE;',
    '		',
    '	BEGIN',
    '		',
    '		for cr1 in c1',
    '		loop',
    '			for cr2 in c2',
    '			loop',
    '				for cr3 in c3',
    '				loop',
    '					',
    '		',
    '		  IF :SSL_COUNTRY <> cr1.v_bu_country',
    '   THEN',
    '      :SSL_TYPE :=''M'';',
    '      :SSL_GST_NO := NULL;',
    '  ELSE',
    '      IF cr3.v_ut_flag = ''Y''',
    '      THEN',
    '         :SSL_TYPE := ''U'';',
    '         :SSL_GST_NO := NULL;',
    '      ELSE',
    '         IF cr2.v_bu_state <> :SSL_STATE',
    '         THEN',
    '            :SSL_TYPE :=''I'';',
    '            :SSL_GST_NO := NULL;',
    '         ELSIF cr2.v_bu_state = :SSL_STATE',
    '         THEN',
    '            :SSL_TYPE :=''L'';',
    '            :SSL_GST_NO := NULL;',
    '         END IF;',
    '     END IF;',
    '   END IF;',
    '			END LOOP;',
    '			END LOOP;',
    '			END LOOP;',
    '	END ;	',
    'END IF;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020274669766029296)
,p_name=>'Curr_Refersh'
,p_static_id=>'curr-refersh'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11220207938855405345)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020275219187029298)
,p_event_id=>wwv_flow_imp.id(8020274669766029296)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11220207938855405345)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020275701728029299)
,p_event_id=>wwv_flow_imp.id(8020274669766029296)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11220205256062405318)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020276057449029299)
,p_name=>'Currency'
,p_static_id=>'currency'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(11220207938855405345)
,p_triggering_element=>'SCB_CURRENCY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020276565505029299)
,p_event_id=>wwv_flow_imp.id(8020276057449029299)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'CURCY_NAME',
  'items_to_submit', 'SCB_CURRENCY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :scb_currency IS NOT NULL THEN  ',
    'DECLARE ',
    '   CURSOR C1 ',
    '         IS   ',
    '       SELECT curcy_desc1',
    '         FROM currencies',
    '        WHERE curcy_bu      = :global_bu',
    '          AND curcy_id      = :scb_currency',
    '          AND curcy_usg_flg = ''Y'';',
    'cr1 C1%ROWTYPE;',
    'BEGIN',
    '    OPEN C1;',
    '    FETCH C1 INTO CR1;',
    '    IF C1%FOUND THEN  ',
    '        :CURCY_NAME   := cr1.curcy_desc1;',
    '    ELSE ',
    '       Raise_Application_Error(-20999,''Allowed Curr. not found.'');',
    '    END IF;',
    '    CLOSE C1;',
    'END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020277846273029303)
,p_name=>'GL Account '
,p_static_id=>'gl-account'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020278390017029304)
,p_event_id=>wwv_flow_imp.id(8020277846273029303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020278859709029306)
,p_event_id=>wwv_flow_imp.id(8020277846273029303)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11222669424579783345)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020270542545029292)
,p_name=>'GL Group'
,p_static_id=>'gl-group'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11222665849697783309)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020271117054029292)
,p_event_id=>wwv_flow_imp.id(8020270542545029292)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11222665849697783309)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020271623172029293)
,p_event_id=>wwv_flow_imp.id(8020270542545029292)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11220620859956518834)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020273814925029296)
,p_name=>'Group'
,p_static_id=>'group'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36700505_SUPLR_GROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020274299866029296)
,p_event_id=>wwv_flow_imp.id(8020273814925029296)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P36700505_SUPLR_GROUP_DESC',
  'items_to_submit', 'P36700505_SUPLR_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P36700505_SUPLR_GROUP IS NOT NULL THEN',
    'DECLARE ',
    '     CURSOR C1 ',
    '           IS ',
    '         SELECT SUPGRP_DESC1',
    '            FROM supplier_groups',
    '           WHERE SUPGRP_BU = :GLOBAL_bu',
    '             AND SUPGRP_GROUP_ID = :P36700505_SUPLR_GROUP;',
    'CR1 C1%ROWTYPE;',
    'BEGIN',
    '   OPEN C1;',
    '   FETCH C1 INTO CR1;',
    '   IF C1%FOUND THEN ',
    '        :P36700505_SUPLR_GROUP_DESC := CR1.SUPGRP_DESC1;',
    '   END IF;',
    '   CLOSE C1;',
    'END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020271970491029293)
,p_name=>'GST Clsg.'
,p_static_id=>'gst-clsg'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_triggering_element=>'SSL_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020272523983029295)
,p_event_id=>wwv_flow_imp.id(8020271970491029293)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SSL_GST_TYPE',
  'items_to_submit', 'SSL_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :SSL_TYPE IN(''M'') THEN',
    '	:SSL_GST_TYPE := ''U'';',
    'ELSIF :SSL_TYPE IN(''D'',''S'') THEN	',
    '	:SSL_GST_TYPE := ''R'';',
    'END IF;	',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020272894435029295)
,p_name=>'GST Type'
,p_static_id=>'gst-type'
,p_event_sequence=>50
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_triggering_element=>'SSL_GST_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020273379648029295)
,p_event_id=>wwv_flow_imp.id(8020272894435029295)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SSL_GST_NO',
  'items_to_submit', 'SSL_GST_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :SSL_GST_TYPE =''U'' THEN',
    '	:SSL_GST_NO := NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020279293217029306)
,p_name=>'Loc_refersh'
,p_static_id=>'loc-refersh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020280267343029310)
,p_event_id=>wwv_flow_imp.id(8020279293217029306)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020279805714029310)
,p_event_id=>wwv_flow_imp.id(8020279293217029306)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11210746116143983854)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020269215549029290)
,p_name=>'Refersh_bank'
,p_static_id=>'refersh-bank'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020269692051029290)
,p_event_id=>wwv_flow_imp.id(8020269215549029290)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020270230769029292)
,p_event_id=>wwv_flow_imp.id(8020269215549029290)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11223237596545994526)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020267421469029282)
,p_name=>'Refresh_Contact'
,p_static_id=>'refresh-contact'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11226123231708253608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegrid'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020267851794029285)
,p_event_id=>wwv_flow_imp.id(8020267421469029282)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11226123231708253608)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8020265655688029237)
,p_name=>'Sub Group'
,p_static_id=>'sub-group'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36700505_SUPLR_SUB_GROUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8020266200330029267)
,p_event_id=>wwv_flow_imp.id(8020265655688029237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P36700505_SUPLR_GROUP',
  'items_to_submit', 'P36700505_SUPLR_SUB_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P36700505_SUPLR_SUB_GROUP IS NOT NULL THEN',
    'DECLARE ',
    '     CURSOR C1 ',
    '           IS ',
    '         SELECT DECODE( (SELECT applctrl_desc_level',
    '                           FROM appl_control',
    '                          WHERE applctrl_bu = :global_bu),1, supsubgroup_desc1,',
    '                 NVL (supsubgroup_desc2, supsubgroup_desc1))',
    '            subgroup_name,',
    '         supsubgroup_type_id,',
    '         SUPSUBGROUP_GROUP_ID,',
    '         (SELECT SUPGRP_DESC1',
    '            FROM supplier_groups',
    '           WHERE SUPGRP_BU = supsubgroup_bu',
    '             AND SUPGRP_GROUP_ID = SUPSUBGROUP_GROUP_ID',
    '           ) group_desc',
    '    FROM supplier_subgroup',
    '   WHERE supsubgroup_bu = :global_bu',
    '     AND supsubgroup_type_id = :P36700505_SUPLR_SUB_GROUP;',
    'CR1 C1%ROWTYPE;',
    'BEGIN',
    '   OPEN C1;',
    '   FETCH C1 INTO CR1;',
    '   IF C1%FOUND THEN ',
    '        :P36700505_SUPLR_GROUP := CR1.SUPSUBGROUP_GROUP_ID;',
    '   END IF;',
    '   CLOSE C1;',
    'END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020264840075029221)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bank - Post'
,p_static_id=>'bank-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    CURSOR C1 ',
'          IS   ',
'       SELECT * ',
'         FROM suplr_pay_bank_dtls_ed_temp',
'        WHERE spbd_bu = :GLOBAL_BU',
'          AND spbd_suplr_id    = :P36700505_ID',
'          AND spbd_temp_status = ''C'';',
'    ',
'    CURSOR C2(v_seq_no NUMBER) ',
'          IS   ',
'       SELECT * ',
'         FROM suplr_pay_bank_dtls_ed_temp',
'        WHERE spbd_bu = :GLOBAL_BU',
'          AND spbd_suplr_id    = :P36700505_ID',
'          AND spbd_seq_no      = v_seq_no',
'          AND spbd_temp_status = ''N'';',
'CR2   C2%ROWTYPE;',
'BEGIN ',
'   FOR CR1 IN C1',
'   LOOP ',
'       OPEN C2(CR1.spbd_seq_no);',
'       FETCH C2 INTO CR2;',
'       IF CR2.SPBD_TRK_TYPE = ''A'' THEN  ',
'            ',
'          INSERT INTO SUPLR_PAY_BANK_DTLS(spbd_bu,',
'	                                	      spbd_ln_seq_no,',
'		                                    spbd_branch_desc,',
'		                                    spbd_bank_ifsc_code,',
'	                                       spbd_bank_acc_no,',
'	                                       spbd_dflt_flag,',
'   	                                    spbd_suplr_id,',
'   	                                    spbd_pay_acct_type,',
'   	                                    spbd_swift_bic,',
'   	                                    spbd_iban_no,',
'   	                                    spbd_pay_bank_name,',
'   	                                    spbd_pay_to_name,',
'   	                                    spbd_cre_by,',
'   	                                    spbd_cre_date,',
'   	                                    spbd_active_flag)',
'      	                          VALUES(:GLOBAL_BU,',
'      	                                 CR2.SPBD_LN_SEQ_NO,',
'      	                                 CR2.SPBD_BRANCH_DESC,',
'      	                                 CR2.SPBD_BANK_IFSC_CODE,',
'      	                                 CR2.SPBD_BANK_ACC_NO,',
'      	                                 CR2.SPBD_DFLT_FLAG,',
'      	                                 CR2.SPBD_SUPLR_ID,',
'      	                                 CR2.SPBD_PAY_ACCT_TYPE,',
'      	                                 CR2.SPBD_SWIFT_BIC,',
'      	                                 CR2.SPBD_IBAN_NO,',
'      	                                 CR2.SPBD_PAY_BANK_NAME,',
'      	                                 CR2.SPBD_PAY_TO_NAME,',
'      	                                 :global_user,',
'      	                                 SYSDATE,',
'      	                                 ''N'');',
'        ELSIF CR2.SPBD_TRK_TYPE = ''M'' THEN',
'             UPDATE SUPLR_PAY_BANK_DTLS',
'         		 SET spbd_pay_bank_name   = cr2.spbd_pay_bank_name,',
'         		     spbd_branch_desc     = cr2.spbd_branch_desc,',
'         		     spbd_bank_ifsc_code  = cr2.spbd_bank_ifsc_code,',
'         		     spbd_pay_acct_type   = cr2.spbd_pay_acct_type,',
'         		     spbd_bank_acc_no     = cr2.spbd_bank_acc_no,',
'         		     spbd_swift_bic       = cr2.spbd_swift_bic,',
'         		     spbd_iban_no         = cr2.spbd_iban_no,',
'         		     spbd_pay_to_name     = cr2.spbd_pay_to_name,',
'         		     spbd_upd_by          = :global_user,',
'         	        spbd_upd_date         = SYSDATE',
'              WHERE spbd_bu           = :GLOBAL_BU',
'         		 AND spbd_suplr_id     = :P36700505_ID',
'                AND spbd_ln_seq_no    = CR1.spbd_ln_seq_no;',
'        END IF;',
'      CLOSE C2;',
'    END LOOP;',
'  COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020072300780028370)
,p_internal_uid=>2538303004531418193
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020075410692028382)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11224524878171224810)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Bank - Save Interactive Grid Data'
,p_static_id=>'bank-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS = ''C'' THEN ',
'   ',
'  IF :SPBD_BANK_ACC_NO IS NOT NULL THEN',
'     proc_isalphanumeric(:SPBD_BANK_ACC_NO);',
'  END IF;',
'',
'  IF :SPBD_BANK_IFSC_CODE IS NOT NULL THEN',
'     proc_isalphanumeric(:SPBD_BANK_IFSC_CODE);',
'  END IF;',
'',
'      SELECT NVL(MAX(spbd_seq_no),0) + 1',
'        INTO :spbd_seq_no',
'        FROM suplr_pay_bank_dtls_ed_temp',
'       WHERE spbd_bu       = :GLOBAL_BU',
'         AND spbd_suplr_id = :P36700505_ID;',
'',
'      INSERT INTO suplr_pay_bank_dtls_ed_temp (spbd_bu,',
'                                               spbd_branch_desc,',
'                                               spbd_bank_city,',
'                                               spbd_bank_addr1,',
'                                               spbd_bank_addr2,',
'                                               spbd_bank_ifsc_code,',
'                                               spbd_bank_acc_no,',
'                                               spbd_cre_by,',
'                                               spbd_cre_date,',
'                                               spbd_upd_by,',
'                                               spbd_upd_date,',
'                                               spbd_dflt_flag,',
'                                               spbd_suplr_id,',
'                                               spbd_pay_acct_type,',
'                                               spbd_swift_bic,',
'                                               spbd_iban_no,',
'                                               spbd_pay_bank_name,',
'                                               spbd_pay_to_name,',
'                                               spbd_city_id,',
'                                               spbd_user_sid,',
'                                               spbd_trk_type,',
'                                               spbd_seq_no,',
'                                               spbd_temp_status,',
'                                               spbd_ln_seq_no)',
'                                       VALUES (:GLOBAL_BU,',
'                                               :spbd_branch_desc,',
'                                               :spbd_bank_city,',
'                                               :spbd_bank_addr1,',
'                                               :spbd_bank_addr2,',
'                                               :spbd_bank_ifsc_code,',
'                                               :spbd_bank_acc_no,',
'                                               :GLOBAL_user,',
'                                               SYSDATE,',
'                                               NULL,',
'                                               NULL,',
'                                               :spbd_dflt_flag,',
'                                               :spbd_suplr_id,',
'                                               :spbd_pay_acct_type,',
'                                               :spbd_swift_bic,',
'                                               :spbd_iban_no,',
'                                               :spbd_pay_bank_name,',
'                                               :spbd_pay_to_name,',
'                                               :spbd_city_id,',
'                                               :GLOBAL_sid,',
'                                               ''A'',',
'                                               :spbd_seq_no,',
'                                               ''N'',',
'                                               :spbd_ln_seq_no);',
'      INSERT INTO suplr_pay_bank_dtls_ed_temp (spbd_bu,',
'                                               spbd_branch_desc,',
'                                               spbd_bank_city,',
'                                               spbd_bank_addr1,',
'                                               spbd_bank_addr2,',
'                                               spbd_bank_ifsc_code,',
'                                               spbd_bank_acc_no,',
'                                               spbd_cre_by,',
'                                               spbd_cre_date,',
'                                               spbd_upd_by,',
'                                               spbd_upd_date,',
'                                               spbd_dflt_flag,',
'                                               spbd_suplr_id,',
'                                               spbd_pay_acct_type,',
'                                               spbd_swift_bic,',
'                                               spbd_iban_no,',
'                                               spbd_pay_bank_name,',
'                                               spbd_pay_to_name,',
'                                               spbd_city_id,',
'                                               spbd_user_sid,',
'                                               spbd_trk_type,',
'                                               spbd_seq_no,',
'                                               spbd_temp_status,',
'                                               spbd_ln_seq_no)',
'                                       VALUES (:GLOBAL_BU,',
'                                               :spbd_branch_desc,',
'                                               :spbd_bank_city,',
'                                               :spbd_bank_addr1,',
'                                               :spbd_bank_addr2,',
'                                               :spbd_bank_ifsc_code,',
'                                               :spbd_bank_acc_no,',
'                                               :GLOBAL_user,',
'                                               SYSDATE,',
'                                               NULL,',
'                                               NULL,',
'                                               :spbd_dflt_flag,',
'                                               :spbd_suplr_id,',
'                                               :spbd_pay_acct_type,',
'                                               :spbd_swift_bic,',
'                                               :spbd_iban_no,',
'                                               :spbd_pay_bank_name,',
'                                               :spbd_pay_to_name,',
'                                               :spbd_city_id,',
'                                               :GLOBAL_sid,',
'                                               ''A'',',
'                                               :spbd_seq_no,',
'                                               ''C'',',
'                                               :spbd_ln_seq_no);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN ',
'      UPDATE suplr_pay_bank_dtls_ed_temp',
'         SET SPBD_PAY_BANK_NAME   = :SPBD_PAY_BANK_NAME,',
'      	    SPBD_BRANCH_DESC     = :SPBD_BRANCH_DESC,',
'      	    SPBD_BANK_IFSC_CODE  = :SPBD_BANK_IFSC_CODE,',
'      	    SPBD_PAY_ACCT_TYPE   = :SPBD_PAY_ACCT_TYPE,',
'      	    SPBD_BANK_ACC_NO     = :SPBD_BANK_ACC_NO,',
'      	    SPBD_SWIFT_BIC       = :SPBD_SWIFT_BIC,',
'      	    SPBD_IBAN_NO         = :SPBD_IBAN_NO,',
'      	    SPBD_PAY_TO_NAME     = :SPBD_PAY_TO_NAME,',
'      	    SPBD_UPD_BY          = :global_user,',
'             SPBD_UPD_DATE        = SYSDATE',
'       WHERE SPBD_BU              = :GLOBAL_BU',
'      	AND SPBD_SUPLR_ID        = :P36700505_ID',
'      	AND spbd_seq_no          = :spbd_seq_no;',
'END IF;',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538113575148417354
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020150683563028735)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11226123231708253608)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Contact - Save Interactive Grid Data'
,p_static_id=>'contact-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C'' THEN  ',
'    SELECT NVL(MAX(sci_seq_no),0) + 1',
'      INTO :SCI_SEQ_NO',
'      FROM suplr_contact_info_edit_temp',
'     WHERE sci_bu       = :GLOBAL_BU',
'       AND sci_suplr_id = :P36700505_ID;',
'     INSERT INTO suplr_contact_info_edit_temp(sci_bu,',
'                                              sci_suplr_id,',
'                                              sci_seq_id,',
'                                              sci_person_pfx,',
'                                              sci_person_first_name1,',
'                                              sci_person_middle_name1,',
'                                              sci_person_last_name1,',
'                                              sci_person_first_name2,',
'                                              sci_person_middle_name2,',
'                                              sci_person_last_name2,',
'                                              sci_addr1,',
'                                              sci_addr2,',
'                                              sci_addr3,',
'                                              sci_po_box,',
'                                              sci_city,',
'                                              sci_state,',
'                                              sci_country,',
'                                              sci_zip,',
'                                              sci_tele1,',
'                                              sci_tele2,',
'                                              sci_fax1,',
'                                              sci_fax2,',
'                                              sci_email1,',
'                                              sci_email2,',
'                                              sci_position_name,',
'                                              sci_priority,',
'                                              sci_cre_by,',
'                                              sci_cre_date,',
'                                              sci_upd_by,',
'                                              sci_upd_date,',
'                                              sci_mail_flag,',
'                                              sci_key_person_flag,',
'                                              sci_department,',
'                                              sci_user_sid,',
'                                              sci_trk_type,',
'                                              sci_seq_no,',
'                                              sci_temp_status,',
'                                              sci_ln_seq_no)',
'                                      VALUES (:sci_bu,',
'                                              :sci_suplr_id,',
'                                              :sci_seq_id,',
'                                              :sci_person_pfx,',
'                                              :sci_person_first_name1,',
'                                              :sci_person_middle_name1,',
'                                              :sci_person_last_name1,',
'                                              :sci_person_first_name2,',
'                                              :sci_person_middle_name2,',
'                                              :sci_person_last_name2,',
'                                              :sci_addr1,',
'                                              :sci_addr2,',
'                                              :sci_addr3,',
'                                              :sci_po_box,',
'                                              :sci_city,',
'                                              :sci_state,',
'                                              :sci_country,',
'                                              :sci_zip,',
'                                              :sci_tele1,',
'                                              :sci_tele2,',
'                                              :sci_fax1,',
'                                              :sci_fax2,',
'                                              :sci_email1,',
'                                              :sci_email2,',
'                                              :sci_position_name,',
'                                              :sci_priority,',
'                                              :global_user,',
'                                              SYSDATE,',
'                                              NULL,',
'                                              NULL,',
'                                              :sci_mail_flag,',
'                                              :sci_key_person_flag,',
'                                              :sci_department,',
'                                              :global_sid,',
'                                              :sci_trk_type,',
'                                              :sci_seq_no,',
'                                              ''N'',',
'                                              :sci_ln_seq_no);',
'     INSERT INTO suplr_contact_info_edit_temp(sci_bu,',
'                                              sci_suplr_id,',
'                                              sci_seq_id,',
'                                              sci_person_pfx,',
'                                              sci_person_first_name1,',
'                                              sci_person_middle_name1,',
'                                              sci_person_last_name1,',
'                                              sci_person_first_name2,',
'                                              sci_person_middle_name2,',
'                                              sci_person_last_name2,',
'                                              sci_addr1,',
'                                              sci_addr2,',
'                                              sci_addr3,',
'                                              sci_po_box,',
'                                              sci_city,',
'                                              sci_state,',
'                                              sci_country,',
'                                              sci_zip,',
'                                              sci_tele1,',
'                                              sci_tele2,',
'                                              sci_fax1,',
'                                              sci_fax2,',
'                                              sci_email1,',
'                                              sci_email2,',
'                                              sci_position_name,',
'                                              sci_priority,',
'                                              sci_cre_by,',
'                                              sci_cre_date,',
'                                              sci_upd_by,',
'                                              sci_upd_date,',
'                                              sci_mail_flag,',
'                                              sci_key_person_flag,',
'                                              sci_department,',
'                                              sci_user_sid,',
'                                              sci_trk_type,',
'                                              sci_seq_no,',
'                                              sci_temp_status,',
'                                              sci_ln_seq_no)',
'                                      VALUES (:sci_bu,',
'                                              :sci_suplr_id,',
'                                              :sci_seq_id,',
'                                              :sci_person_pfx,',
'                                              :sci_person_first_name1,',
'                                              :sci_person_middle_name1,',
'                                              :sci_person_last_name1,',
'                                              :sci_person_first_name2,',
'                                              :sci_person_middle_name2,',
'                                              :sci_person_last_name2,',
'                                              :sci_addr1,',
'                                              :sci_addr2,',
'                                              :sci_addr3,',
'                                              :sci_po_box,',
'                                              :sci_city,',
'                                              :sci_state,',
'                                              :sci_country,',
'                                              :sci_zip,',
'                                              :sci_tele1,',
'                                              :sci_tele2,',
'                                              :sci_fax1,',
'                                              :sci_fax2,',
'                                              :sci_email1,',
'                                              :sci_email2,',
'                                              :sci_position_name,',
'                                              :sci_priority,',
'                                              :global_user,',
'                                              SYSDATE,',
'                                              NULL,',
'                                              NULL,',
'                                              :sci_mail_flag,',
'                                              :sci_key_person_flag,',
'                                              :sci_department,',
'                                              :global_sid,',
'                                              :sci_trk_type,',
'                                              :sci_seq_no,',
'                                              ''C'',',
'                                              :sci_ln_seq_no);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN  ',
'      UPDATE suplr_contact_info_edit_temp',
'         SET sci_person_pfx         = :sci_person_pfx,',
'      	    sci_person_first_name1 = :sci_person_first_name1,',
'      	    sci_position_name      = :sci_position_name,',
'      	    sci_department         = :sci_department,',
'      	    sci_email1             = :sci_email1,',
'      	    sci_tele1              = :sci_tele1,',
'      	    sci_tele2              = :sci_tele2,',
'      	    sci_upd_by             = :global_user,',
'             sci_upd_date           = SYSDATE',
'	    WHERE sci_bu                 = :GLOBAL_BU',
'	      AND sci_suplr_id           = :P36700505_ID',
'	      AND sci_seq_id             = :sci_seq_id;',
'END IF;',
'COMMIT;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538188848019417707
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020265280831029226)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Contacts - Post'
,p_static_id=>'contacts-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'   CURSOR C1 ',
'         IS   ',
'      SELECT *',
'        FROM suplr_contact_info_edit_temp',
'       WHERE sci_bu          = :global_bu',
'         AND sci_suplr_id    = :P36700505_ID',
'         AND sci_temp_status = ''C'';',
'   ',
'   CURSOR C2(v_seq_no    NUMBER)',
'         IS   ',
'      SELECT *',
'        FROM suplr_contact_info_edit_temp',
'       WHERE sci_bu          = :global_bu',
'         AND sci_suplr_id    = :P36700505_ID',
'         AND sci_seq_id      = v_seq_no',
'         AND sci_temp_status = ''N'';',
'      ',
'   CURSOR C3',
'         IS   ',
'       SELECT * ',
'         FROM suppliers ',
'        WHERE suplr_bu       = :global_bu',
'          AND suplr_suplr_id = :P36700505_ID;',
'CR2  C2%ROWTYPE;',
'CR3  C3%ROWTYPE;',
'BEGIN',
'   FOR CR1 IN C1',
'   LOOP',
'        OPEN C2(CR1.SCI_SEQ_ID);',
'        FETCH C2 INTO CR2;',
'        OPEN C3;',
'        FETCH C3 INTO CR3;',
'         IF CR2.SCI_TRK_TYPE = ''A'' THEN  ',
'                 SELECT NVL(MAX(SCI_SEQ_ID),0)+1  ',
'         		   INTO :SCI_SEQ_ID',
'         		   FROM suplr_contact_info ',
'         		  WHERE sci_bu       = :global_bu',
'                   AND sci_suplr_id = :P36700505_ID;',
'         		',
'         		   SELECT NVL(MAX(SCI_LN_SEQ_NO),0) + 1 ',
'         		     INTO :SCI_LN_SEQ_NO',
'         	        FROM SUPLR_CONTACT_INFO',
'         	       WHERE sci_bu       = :GLOBAL_bu',
'         	         AND sci_suplr_id = :P36700505_ID;',
'',
'            INSERT INTO suplr_contact_info(sci_bu,',
'                                           sci_suplr_id,',
'                                           sci_seq_id,',
'                                           sci_person_pfx,',
'                                           sci_person_first_name1,',
'                                           sci_position_name,',
'                                           sci_addr1,',
'                                           sci_addr2,',
'                                           sci_addr3,',
'                                           sci_city,',
'                                           sci_state,',
'                                           sci_country,',
'                                           sci_zip,',
'                                           sci_priority,',
'                                           sci_mail_flag,',
'                                           sci_key_person_flag,',
'                                           sci_department,',
'                                           sci_cre_by,',
'                                           sci_cre_date,',
'                                           sci_ln_seq_no,',
'                                           sci_active_flag,',
'                                           sci_sms_flag,',
'                                           sci_whatsapp_flag)',
'                                    VALUES(:GLOBAL_BU,',
'                                           CR2.SCI_SUPLR_ID,',
'                                           :SCI_SEQ_ID,',
'                                           CR2.SCI_PERSON_PFX,',
'                                           CR2.SCI_PERSON_FIRST_NAME1,',
'                                           CR2.SCI_POSITION_NAME,',
'                                           CR3.SUPLR_ADDR1,',
'                                           CR3.SUPLR_ADDR2,',
'                                           CR3.SUPLR_ADDR3,',
'                                           CR3.SUPLR_CITY,',
'                                           CR3.SUPLR_STATE,',
'                                           CR3.SUPLR_COUNTRY,',
'                                           CR3.SUPLR_ZIP,',
'                                           1,',
'                                          ''N'',',
'                                          ''N'',',
'                                          CR2.SCI_DEPARTMENT,',
'                                          :GLOBAL_USER,',
'                                          SYSDATE,',
'                                          :SCI_LN_SEQ_NO,',
'                                          ''N'',',
'                                          ''N'',',
'                                          ''N'');',
'         ELSIF CR2.SCI_TRK_TYPE = ''M'' THEN  ',
'               UPDATE suplr_contact_info',
'                  SET sci_person_pfx         = CR2.sci_person_pfx,',
'               	    sci_person_first_name1 = CR2.sci_person_first_name1,',
'               	    sci_position_name      = CR2.sci_position_name,',
'               	    sci_department         = CR2.sci_department,',
'               	    sci_email1             = CR2.sci_email1,',
'               	    sci_tele1              = CR2.sci_tele1,',
'               	    sci_tele2              = CR2.sci_tele2,',
'               	    SCI_UPD_BY             = :global_user,',
'                      sci_upd_date           = SYSDATE',
'                WHERE sci_bu                 = :GLOBAL_BU',
'                  AND sci_suplr_id           = :P36700505_ID',
'                  AND sci_seq_id             = CR1.sci_seq_id;',
'         END IF;',
'        CLOSE C2;',
'        CLOSE C3;',
'   END LOOP;',
'   COMMIT;',
'END;',
'         '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020149926900028734)
,p_internal_uid=>2538303445287418198
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020263685350029213)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Currency - Post'
,p_static_id=>'currency-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Raise_Application_Error(-20999,:SCB_LN_SEQ_NO);',
'DECLARE',
'   CURSOR C1 (c_curr VARCHAR2)',
'         IS   ',
'     SELECT * ',
'       FROM suplr_curr_bal_edit_temp',
'      WHERE scb_bu          = :GLOBAL_BU',
'        AND scb_suplr_id    = :P36700505_ID',
'      --   AND scb_ln_seq_no   = c_seq_no',
'        AND scb_currency    = c_curr',
'        AND scb_temp_status = ''N'';',
'   ',
'   CURSOR C2',
'         IS   ',
'     SELECT * ',
'       FROM suplr_curr_bal_edit_temp',
'      WHERE scb_bu          = :GLOBAL_BU',
'        AND scb_suplr_id    = :P36700505_ID',
'      --   AND scb_ln_seq_no   = :scb_ln_seq_no',
'        AND scb_temp_status = ''C'';',
'CR1 C1%ROWTYPE;',
'BEGIN',
'   ',
'   FOR CR2 IN C2',
'   LOOP',
'     OPEN C1(cr2.scb_currency);',
'   FETCH C1 INTO CR1;',
'   IF CR1.SCB_TRK_TYPE = ''M'' THEN',
'          UPDATE suplr_curr_bal',
'             SET scb_currency    = CR1.scb_currency,',
'                 scb_upd_by      = :global_user,',
'                 scb_upd_date    = SYSDATE',
'           WHERE scb_bu          = :GLOBAL_BU',
'             AND scb_suplr_id    = :P36700505_ID',
'             AND scb_currency    = CR2.scb_currency',
'             AND scb_ln_seq_no   = CR2.scb_ln_seq_no;',
'   ELSIF CR1.SCB_TRK_TYPE = ''A'' THEN',
'           INSERT INTO SUPLR_CURR_BAL(SCB_BU,',
'                                      SCB_SUPLR_ID,',
'                                      SCB_CURRENCY,',
'                                      SCB_CRD_LMT,',
'                                      SCB_PEND_INV_AMT,',
'                                      SCB_CUR_BAL,',
'                                      SCB_UNAPP_AMT,',
'                                      SCB_ADV_AMT,',
'                                      SCB_LN_SEQ_NO,',
'                                      SCB_CRE_BY,',
'                                      SCB_CRE_DATE,',
'                                      SCB_ACTIVE_FLAG)',
'                               VALUES(:GLOBAL_BU,',
'                                      :P36700505_ID,',
'                                      CR1.scb_currency,',
'                                      CR1.scb_crd_lmt,',
'                                      CR1.scb_pend_inv_amt,',
'                                      CR1.scb_cur_bal,',
'                                      CR1.scb_unapp_amt,',
'                                      CR1.scb_adv_amt,',
'                                      CR1.scb_ln_seq_no,',
'                                      :global_user,',
'                                      SYSDATE,',
'                                      ''N'');',
'   END IF;',
'   CLOSE C1;',
'   END LOOP;',
' COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020249778379029085)
,p_internal_uid=>2538301849806418185
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020250976452029087)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11220207938855405345)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Currency - Save Interactive Grid Data'
,p_static_id=>'currency-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS = ''C'' THEN  ',
'    SELECT NVL(MAX(scb_seq_no),0) + 1',
'      INTO :scb_seq_no',
'      FROM suplr_curr_bal_edit_temp',
'     WHERE scb_bu = :GLOBAL_BU',
'       AND scb_suplr_id = :P36700505_ID;',
'   INSERT INTO suplr_curr_bal_edit_temp(scb_adv_amt,',
'                                        scb_bu,',
'                                        scb_crd_lmt,',
'                                        scb_cre_by,',
'                                        scb_cre_date,',
'                                        scb_cre_emp_id,',
'                                        scb_cre_ip_addr,',
'                                        scb_cre_os_user,',
'                                        scb_currency,',
'                                        scb_cur_bal,',
'                                        scb_ln_seq_no,',
'                                        scb_pend_inv_amt,',
'                                        scb_seq_no,',
'                                        scb_suplr_id,',
'                                        scb_temp_status,',
'                                        scb_trk_type,',
'                                        scb_unapp_amt,',
'                                        scb_upd_by,',
'                                        scb_upd_date,',
'                                        scb_upd_emp_id,',
'                                        scb_upd_ip_addr,',
'                                        scb_upd_os_user',
'                                       )',
'                                 VALUES(:scb_adv_amt,',
'                                        :GLOBAL_BU,',
'                                        :scb_crd_lmt,',
'                                        :GLOBAL_USER,',
'                                        SYSDATE,',
'                                        :scb_cre_emp_id,',
'                                        :scb_cre_ip_addr,',
'                                        :scb_cre_os_user,',
'                                        :scb_currency,',
'                                        :scb_cur_bal,',
'                                        :scb_ln_seq_no,',
'                                        :scb_pend_inv_amt,',
'                                        :scb_seq_no,',
'                                        :P36700505_ID,',
'                                        ''N'',',
'                                        ''A'',',
'                                        :scb_unapp_amt,',
'                                        :scb_upd_by,',
'                                        :scb_upd_date,',
'                                        :scb_upd_emp_id,',
'                                        :scb_upd_ip_addr,',
'                                        :scb_upd_os_user',
'                                       );',
'   INSERT INTO suplr_curr_bal_edit_temp(scb_adv_amt,',
'                                        scb_bu,',
'                                        scb_crd_lmt,',
'                                        scb_cre_by,',
'                                        scb_cre_date,',
'                                        scb_cre_emp_id,',
'                                        scb_cre_ip_addr,',
'                                        scb_cre_os_user,',
'                                        scb_currency,',
'                                        scb_cur_bal,',
'                                        scb_ln_seq_no,',
'                                        scb_pend_inv_amt,',
'                                        scb_seq_no,',
'                                        scb_suplr_id,',
'                                        scb_temp_status,',
'                                        scb_trk_type,',
'                                        scb_unapp_amt,',
'                                        scb_upd_by,',
'                                        scb_upd_date,',
'                                        scb_upd_emp_id,',
'                                        scb_upd_ip_addr,',
'                                        scb_upd_os_user',
'                                       )',
'                                 VALUES(:scb_adv_amt,',
'                                        :GLOBAL_BU,',
'                                        :scb_crd_lmt,',
'                                        :GLOBAL_USER,',
'                                        SYSDATE,',
'                                        :scb_cre_emp_id,',
'                                        :scb_cre_ip_addr,',
'                                        :scb_cre_os_user,',
'                                        :scb_currency,',
'                                        :scb_cur_bal,',
'                                        :scb_ln_seq_no,',
'                                        :scb_pend_inv_amt,',
'                                        :scb_seq_no,',
'                                        :P36700505_ID,',
'                                        ''C'',',
'                                        ''A'',',
'                                        :scb_unapp_amt,',
'                                        :scb_upd_by,',
'                                        :scb_upd_date,',
'                                        :scb_upd_emp_id,',
'                                        :scb_upd_ip_addr,',
'                                        :scb_upd_os_user',
'                                       );',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN  ',
'     ',
'     UPDATE suplr_curr_bal_edit_temp',
'        SET scb_currency    = :scb_currency,',
'            scb_upd_by      = :global_user,',
'            scb_upd_date    = SYSDATE',
'      WHERE scb_bu          = :GLOBAL_BU',
'        AND scb_suplr_id    = :P36700505_ID',
'        AND scb_seq_no      = :scb_seq_no ',
'        AND scb_temp_status = ''N'';',
'END IF;',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538289140908418059
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020264439443029218)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GL Account - Post'
,p_static_id=>'gl-account-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'   CURSOR C1',
'         IS   ',
'       SELECT *',
'         FROM suplr_plant_accts_edit_temp',
'        WHERE spla_bu          = :global_bu',
'          AND spla_suplr_id    = :P36700505_ID',
'          AND spla_temp_status = ''C'';',
'   ',
'   CURSOR C2(v_acct   VARCHAR2)',
'         IS   ',
'       SELECT *',
'         FROM suplr_plant_accts_edit_temp',
'        WHERE spla_bu          = :global_bu',
'          AND spla_suplr_id    = :P36700505_ID',
'          AND spla_acct        = v_acct',
'          AND spla_temp_status = ''N'';',
'CR2   C2%ROWTYPE;',
'BEGIN',
'    FOR CR1 IN C1',
'    LOOP',
'         OPEN C2(CR1.SPLA_ACCT);',
'         FETCH C2 INTO CR2;',
'         IF CR2.SPLA_TRK_TYPE = ''A'' THEN',
'               SELECT NVL(MAX(SPLA_LN_SEQ_NO), 0) + 1',
'                 INTO :SPLA_LN_SEQ_NO',
'                 FROM SUPLR_PLANT_ACCTS',
'                WHERE SPLA_BU = :GLOBAL_BU',
'                  AND SPLA_SUPLR_ID = :P36700505_ID;',
'               INSERT INTO SUPLR_PLANT_ACCTS(spla_bu,',
'            	                              spla_suplr_id,',
'            	                              spla_lgr_type,',
'            	                              spla_acct,',
'            	                              spla_flag,',
'            	                              spla_cl_id,',
'            	                              spla_plnt,',
'            	                              spla_ln_seq_no,',
'            	                              spla_cre_by,',
'                                             spla_cre_date,',
'                                             spla_active_flag)',
'                                      VALUES(:GLOBAL_BU,',
'                                             :P36700505_ID,',
'                                             CR2.SPLA_LGR_TYPE,',
'                                             CR2.SPLA_ACCT,',
'                                             ''N'',',
'                                             CR2.SPLA_CL_ID,',
'                                             CR2.SPLA_PLNT,',
'                                             CR2.SPLA_LN_SEQ_NO,',
'                                             :global_user,',
'                                             SYSDATE,',
'                                             ''N'');',
'         ELSIF CR2.SPLA_TRK_TYPE = ''M'' THEN',
'                UPDATE suplr_plant_accts',
'               	 SET spla_cl_id     = CR2.SPLA_CL_ID,',
'               	     spla_acct      = CR2.SPLA_ACCT,',
'               	     spla_upd_by    = :global_user,',
'                       spla_upd_date  = SYSDATE',
'                 WHERE spla_bu        = :global_bu',
'               	 AND spla_suplr_id  = :P36700505_ID',
'                   AND spla_ln_seq_no = cr1.spla_ln_seq_no;',
'         END IF;',
'       CLOSE C2;',
'    END LOOP;',
'    COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020027176134028179)
,p_internal_uid=>2538302603899418190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020028714169028188)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11223154407570839729)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GL Account - Save Interactive Grid Data'
,p_static_id=>'gl-account-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'      SELECT NVL(MAX(spla_seq_no),0) + 1',
'        INTO :spla_seq_no',
'        FROM suplr_plant_accts_edit_temp',
'       WHERE spla_bu = :GLOBAL_BU',
'         AND spla_suplr_id = :P36700505_ID;',
'       INSERT INTO suplr_plant_accts_edit_temp(spla_bu,',
'                                               spla_suplr_id,',
'                                               spla_lgr_type,',
'                                               spla_acct,',
'                                               spla_cre_by,',
'                                               spla_cre_date,',
'                                               spla_upd_by,',
'                                               spla_upd_date,',
'                                               spla_flag,',
'                                               spla_cl_id,',
'                                               spla_plnt,',
'                                               spla_user_sid,',
'                                               spla_trk_type,',
'                                               spla_seq_no,',
'                                               spla_temp_status,',
'                                               spla_ln_seq_no,',
'                                               spla_lgr_type_old,',
'                                               spla_acct_old,',
'                                               spla_flag_old,',
'                                               spla_cl_id_old,',
'                                               spla_plnt_old)',
'                                       VALUES (:GLOBAL_BU,',
'                                               :P36700505_ID,',
'                                               :spla_lgr_type,',
'                                               :spla_acct,',
'                                               :GLOBAL_USER,',
'                                               SYSDATE,',
'                                               NULL,',
'                                               NULL,',
'                                               :spla_flag,',
'                                               :spla_cl_id,',
'                                               :spla_plnt,',
'                                               :GLOBAL_sid,',
'                                               ''A'',',
'                                               :spla_seq_no,',
'                                               ''N'',',
'                                               :spla_ln_seq_no,',
'                                               :spla_lgr_type,',
'                                               :spla_acct,',
'                                               :spla_flag,',
'                                               :spla_cl_id,',
'                                               :spla_plnt);',
'       INSERT INTO suplr_plant_accts_edit_temp(spla_bu,',
'                                               spla_suplr_id,',
'                                               spla_lgr_type,',
'                                               spla_acct,',
'                                               spla_cre_by,',
'                                               spla_cre_date,',
'                                               spla_upd_by,',
'                                               spla_upd_date,',
'                                               spla_flag,',
'                                               spla_cl_id,',
'                                               spla_plnt,',
'                                               spla_user_sid,',
'                                               spla_trk_type,',
'                                               spla_seq_no,',
'                                               spla_temp_status,',
'                                               spla_ln_seq_no,',
'                                               spla_lgr_type_old,',
'                                               spla_acct_old,',
'                                               spla_flag_old,',
'                                               spla_cl_id_old,',
'                                               spla_plnt_old)',
'                                       VALUES (:GLOBAL_BU,',
'                                               :P36700505_ID,',
'                                               :spla_lgr_type,',
'                                               :spla_acct,',
'                                               :GLOBAL_USER,',
'                                               SYSDATE,',
'                                               NULL,',
'                                               NULL,',
'                                               :spla_flag,',
'                                               :spla_cl_id,',
'                                               :spla_plnt,',
'                                               :GLOBAL_sid,',
'                                               ''A'',',
'                                               :spla_seq_no,',
'                                               ''C'',',
'                                               :spla_ln_seq_no,',
'                                               :spla_lgr_type,',
'                                               :spla_acct,',
'                                               :spla_flag,',
'                                               :spla_cl_id,',
'                                               :spla_plnt);',
'   ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'        UPDATE suplr_plant_accts_edit_temp',
'           SET spla_lgr_type    = :spla_lgr_type,',
'               spla_acct        = :spla_acct,',
'               spla_plnt        = :spla_plnt,',
'               spla_cl_id       = :spla_cl_id,',
'               spla_upd_by      = :global_user,',
'               spla_upd_date    = sysdate',
'         WHERE spla_bu          = :global_bu',
'           AND spla_suplr_id    = :P36700505_ID',
'           AND spla_seq_no      = :spla_seq_no',
'           AND spla_temp_status = ''N'';',
'   END IF;',
' COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538066878625417160
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020264041943029215)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GL Group - Post'
,p_static_id=>'gl-group-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    CURSOR C1 ',
'          IS   ',
'        SELECT *',
'          FROM suplr_gl_group_edit_temp',
'         WHERE sgg_bu          = :global_bu',
'           AND sgg_suplr_id    = :P36700505_ID',
'           AND sgg_temp_status = ''C'';',
'    CURSOR C2(v_code   VARCHAR2)',
'            IS   ',
'          SELECT *',
'            FROM suplr_gl_group_edit_temp',
'           WHERE sgg_bu          = :global_bu',
'             AND sgg_suplr_id    = :P36700505_ID',
'             AND sgg_code        = v_code',
'             AND sgg_temp_status = ''N'';',
'CR2  C2%ROWTYPE;',
'BEGIN',
'     FOR CR1 IN C1',
'     LOOP ',
'        OPEN C2(CR1.SGG_CODE);',
'        FETCH C2 INTO CR2;',
'          IF CR2.SGG_TRK_TYPE = ''M'' THEN',
'               UPDATE SUPLR_GL_GROUP',
'            	   SET sgg_code     = CR2.sgg_code,',
'            	       sgg_cl_id    = CR2.sgg_cl_id,',
'            	       sgg_upd_by   = :global_user,',
'                      sgg_upd_date = sysdate',
'            	 WHERE sgg_bu       = :global_bu',
'            	   AND sgg_suplr_id = CR1.sgg_suplr_id',
'            	   AND sgg_code     = CR1.sgg_code;',
'          ELSIF CR2.SGG_TRK_TYPE = ''A'' THEN',
'                INSERT INTO SUPLR_GL_GROUP(sgg_bu,',
'            	                            sgg_suplr_id,',
'            	                            sgg_code,',
'            	                            sgg_cl_id,',
'            	                            sgg_cre_by,',
'                                           sgg_cre_date,',
'                                           sgg_active_flag)',
'                                    VALUES(:GLOBAL_BU,',
'                                           CR2.SGG_SUPLR_ID,',
'                                           CR2.SGG_CODE,',
'            	                            CR2.SGG_CL_ID,',
'            	                            :global_user,',
'            	                            SYSDATE,',
'            	                            ''N'');',
'          END IF;',
'        CLOSE C2;',
'     END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020193014047028873)
,p_internal_uid=>2538302206399418187
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020194628743028874)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11222665849697783309)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GL Group - Save Interactive Grid Data'
,p_static_id=>'gl-group-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS = ''C'' THEN  ',
'              SELECT NVL(MAX (sgg_seq_no), 0) + 1',
'                INTO :sgg_seq_no',
'                FROM suplr_gl_group_edit_temp',
'               WHERE sgg_bu = :GLOBAL_BU',
'                 AND sgg_suplr_id = :P36700505_ID;',
'    INSERT INTO suplr_gl_group_edit_temp(sgg_bu,',
'                                         sgg_suplr_id,',
'                                         sgg_code,',
'                                         sgg_cl_id,',
'                                         sgg_seq_no,',
'                                         sgg_temp_status,',
'                                         sgg_trk_type,',
'                                         sgg_cre_by,',
'                                         sgg_cre_ip_addr,',
'                                         sgg_cre_os_user,',
'                                         sgg_cre_date,',
'                                         sgg_code_old,',
'                                         sgg_cl_id_old,',
'                                         spla_user_sid)',
'                                VALUES (:GLOBAL_BU,',
'                                        :P36700505_ID,',
'                                        :sgg_code,',
'                                        :sgg_cl_id,',
'                                        :sgg_seq_no, --v_seq_no,',
'                                        ''N'',',
'                                        ''A'',',
'                                        :GLOBAL_USER,',
'                                        NULL,',
'                                        NULL,',
'                                        SYSDATE,',
'                                        :sgg_cl_id_old,',
'                                        :sgg_cl_id_old,',
'                                        :GLOBAL_SID);',
'    INSERT INTO suplr_gl_group_edit_temp(sgg_bu,',
'                                         sgg_suplr_id,',
'                                         sgg_code,',
'                                         sgg_cl_id,',
'                                         sgg_seq_no,',
'                                         sgg_temp_status,',
'                                         sgg_trk_type,',
'                                         sgg_cre_by,',
'                                         sgg_cre_ip_addr,',
'                                         sgg_cre_os_user,',
'                                         sgg_cre_date,',
'                                         sgg_code_old,',
'                                         sgg_cl_id_old,',
'                                         spla_user_sid)',
'                                VALUES (:GLOBAL_BU,',
'                                        :P36700505_ID,',
'                                        :sgg_code,',
'                                        :sgg_cl_id,',
'                                        :sgg_seq_no, --v_seq_no,',
'                                        ''C'',',
'                                        ''A'',',
'                                        :GLOBAL_USER,',
'                                        NULL,',
'                                        NULL,',
'                                        SYSDATE,',
'                                        :sgg_cl_id_old,',
'                                        :sgg_cl_id_old,',
'                                        :GLOBAL_SID);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN  ',
'      UPDATE suplr_gl_group_edit_temp',
'         SET sgg_code     = :sgg_code,',
'             sgg_cl_id    = :sgg_cl_id,',
'             sgg_upd_by   = :global_user,',
'             sgg_upd_date = sysdate',
'       WHERE sgg_bu          = :GLOBAL_BU',
'         AND sgg_suplr_id    = :P36700505_ID',
'         AND sgg_code        = :sgg_code',
'         AND sgg_temp_status = ''N'';',
'END IF;',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538232793199417846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020235358617029046)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11210742216821983815)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Update Supplier Details'
,p_static_id=>'initialize-form-update-supplier-details'
,p_internal_uid=>2538273523073418018
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020263249981029210)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Location - Post'
,p_static_id=>'location-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    CURSOR C1(v_loc_name   VARCHAR2)',
'          IS   ',
'       SELECT *',
'         FROM suplr_ship_loc_edit_temp',
'        WHERE ssl_bu          = :GLOBAL_BU',
'          AND ssl_suplr_id    = :P36700505_ID',
'          AND ssl_loc_name1   = v_loc_name',
'          AND ssl_temp_status = ''N'';',
'     ',
'     CURSOR C2',
'          IS   ',
'       SELECT *',
'         FROM suplr_ship_loc_edit_temp',
'        WHERE ssl_bu          = :GLOBAL_BU',
'          AND ssl_suplr_id    = :P36700505_ID',
'          AND ssl_temp_status = ''C'';',
'CR1  C1%ROWTYPE;',
'BEGIN  ',
'  FOR CR2 IN C2',
'  LOOP ',
'      OPEN C1(CR2.ssl_loc_name1);',
'      FETCH C1 INTO CR1;',
'   IF CR1.SSL_TRK_TYPE = ''A'' THEN ',
'         INSERT INTO SUPLR_SHIP_LOC(SSL_BU,',
'      	                           SSL_SUPLR_ID,',
'      	                           SSL_LOC_NAME1,',
'      	                           SSL_ADDR1,',
'      	                           SSL_ADDR2,',
'      	                           SSL_ADDR3,',
'      	                           SSL_CITY,',
'      	                           SSL_STATE,',
'      	                           SSL_COUNTRY,',
'      	                           SSL_ZIP,',
'      	                           SSL_TELE,',
'      	                           SSL_MOB_NO,',
'      	                           SSL_FAX,',
'      	                           SSL_EMAIL,',
'      	                           SSL_PORT,',
'      	                           SSL_DFLT_FLG,',
'                                    SSL_GST_NO,',
'                                    SSL_GST_TYPE,',
'                                    SSL_TYPE,',
'                                    SSL_SCHEME,',
'                                    SSL_STATE_CODE,',
'                                    SSL_VAT_CLSFN,',
'                                    SSL_VAT_TYPE,',
'                                    SSL_NO_OF_ACRES,',
'                                    SSL_LEAD_TIME,',
'                                    SSL_CONS,',
'                                    SSL_LN_SEQ_NO,',
'                                    SSL_ACTIVE_FLAG,',
'                                    SSL_CRE_BY,',
'                                    SSL_CRE_DATE)',
'                             VALUES(:GLOBAL_BU,',
'                                    CR1.SSL_SUPLR_ID,',
'                                    CR1.SSL_LOC_NAME1,',
'                                    CR1.SSL_ADDR1,',
'                                    CR1.SSL_ADDR2,',
'                                    CR1.SSL_ADDR3,',
'                                    CR1.SSL_CITY,',
'                                    CR1.SSL_STATE,',
'                                    CR1.SSL_COUNTRY,',
'                                    CR1.SSL_ZIP,',
'                                    CR1.SSL_TELE,',
'                                    CR1.SSL_MOB_NO,',
'                                    CR1.SSL_FAX,',
'                                    CR1.SSL_EMAIL,',
'                                    CR1.SSL_PORT,',
'                                    CR1.SSL_DFLT_FLG,',
'                                    CR1.SSL_GST_NO,',
'                                    CR1.SSL_GST_TYPE,',
'                                    CR1.SSL_TYPE,',
'                                    CR1.SSL_SCHEME,',
'                                    (SELECT STATE_CODE',
'                                       FROM STATES  ',
'                                      WHERE STATE_BU = :GLOBAL_BU',
'                                        AND STATE_ID = CR1.SSL_STATE),',
'                                    CR1.SSL_VAT_CLSFN,',
'                                    CR1.SSL_VAT_TYPE,',
'                                    0,',
'                                    1,',
'                                    CR1.SSL_CONS,',
'                                    CR1.SSL_LN_SEQ_NO,',
'                                    ''N'',',
'                                    :global_user,',
'                                    SYSDATE);',
'',
'   ELSIF CR1.SSL_TRK_TYPE = ''M'' THEN ',
'    UPDATE suplr_ship_loc',
'       SET ssl_loc_name1   = CR1.ssl_loc_name1,',
'           ssl_city        = CR1.ssl_city,',
'           ssl_type        = CR1.ssl_type,',
'           ssl_gst_type    = CR1.ssl_gst_type,',
'           ssl_gst_no      = CR1.ssl_gst_no,',
'           ssl_addr1       = CR1.ssl_addr1,',
'           ssl_addr2       = CR1.ssl_addr2,',
'           ssl_addr3       = CR1.ssl_addr3,',
'           ssl_port        = CR1.ssl_port,',
'           ssl_email       = CR1.ssl_email,',
'           ssl_tele        = CR1.ssl_tele,',
'           ssl_fax         = CR1.ssl_fax,',
'           ssl_zip         = CR1.ssl_zip,',
'           ssl_scheme      = CR1.ssl_scheme,',
'           ssl_dflt_flg    = CR1.ssl_dflt_flg',
'     WHERE ssl_bu          = :GLOBAL_BU',
'       AND ssl_suplr_id    = :P36700505_ID',
'       AND ssl_loc_name1   = CR2.ssl_loc_name1;',
'   END IF;',
' CLOSE C1;',
' END LOOP;',
' COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020099504169028456)
,p_internal_uid=>2538301414437418182
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020103059829028462)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11215360407698277926)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Location - Save Interactive Grid Data'
,p_static_id=>'location-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN  ',
'IF :APEX$ROW_STATUS = ''C'' THEN',
'    SELECT NVL(MAX(ssl_seq_no),0) + 1',
'      INTO :ssl_seq_no',
'      FROM suplr_ship_loc_edit_temp',
'     WHERE ssl_bu       = :GLOBAL_BU',
'       AND ssl_suplr_id = :P36700505_ID;',
'    ',
'    SELECT NVL(MAX(ssl_ln_seq_no),0) + 1',
'      INTO :ssl_ln_seq_no',
'      FROM suplr_ship_loc_edit_temp',
'     WHERE ssl_bu       = :GLOBAL_BU',
'       AND ssl_suplr_id = :P36700505_ID;',
'',
'   INSERT INTO suplr_ship_loc_edit_temp(ssl_bu,',
'                                        ssl_suplr_id,',
'                                        ssl_loc_name1,',
'                                        ssl_loc_name2,',
'                                        ssl_addr1,',
'                                        ssl_addr2,',
'                                        ssl_addr3,',
'                                        ssl_po_box,',
'                                        ssl_city,',
'                                        ssl_state,',
'                                        ssl_country,',
'                                        ssl_zip,',
'                                        ssl_tele,',
'                                        ssl_mob_no,',
'                                        ssl_fax,',
'                                        ssl_email,',
'                                        ssl_website,',
'                                        ssl_port,',
'                                        ssl_tin_no,',
'                                        ssl_ecc_no,',
'                                        ssl_ser_tax,',
'                                        ssl_comm_rate,',
'                                        ssl_ref1,',
'                                        ssl_ref2,',
'                                        ssl_cons,',
'                                        ssl_cre_by,',
'                                        ssl_cre_date,',
'                                        ssl_upd_by,',
'                                        ssl_upd_date,',
'                                        ssl_cst,',
'                                        ssl_dflt_flg,',
'                                        ssl_gst_no,',
'                                        ssl_gst_type,',
'                                        ssl_type,',
'                                        ssl_scheme,',
'                                        ssl_vat_clsfn,',
'                                        ssl_vat_type,',
'                                        ssl_pin_no,',
'                                        ssl_user_sid,',
'                                        ssl_trk_type,',
'                                        ssl_seq_no,',
'                                        ssl_temp_status,',
'                                        ssl_ln_seq_no)',
'                                 VALUES(:global_bu,',
'                                        :P36700505_ID,',
'                                        :ssl_loc_name1,',
'                                        :ssl_loc_name2,',
'                                        :ssl_addr1,',
'                                        :ssl_addr2,',
'                                        :ssl_addr3,',
'                                        :ssl_po_box,',
'                                        :ssl_city,',
'                                        :ssl_state,',
'                                        :ssl_country,',
'                                        :ssl_zip,',
'                                        :ssl_tele,',
'                                        :ssl_mob_no,',
'                                        :ssl_fax,',
'                                        :ssl_email,',
'                                        :ssl_website,',
'                                        :ssl_port,',
'                                        :ssl_tin_no,',
'                                        :ssl_ecc_no,',
'                                        :ssl_ser_tax,',
'                                        :ssl_comm_rate,',
'                                        :ssl_ref1,',
'                                        :ssl_ref2,',
'                                        :ssl_cons,',
'                                        :global_user,',
'                                        sysdate,',
'                                        :ssl_upd_by,',
'                                        :ssl_upd_date,',
'                                        :ssl_cst,',
'                                        :ssl_dflt_flg,',
'                                        :ssl_gst_no,',
'                                        :ssl_gst_type,',
'                                        :ssl_type,',
'                                        :ssl_scheme,',
'                                        :ssl_vat_clsfn,',
'                                        :ssl_vat_type,',
'                                        :ssl_pin_no,',
'                                        :global_sid,',
'                                        ''A'',',
'                                        :ssl_seq_no,',
'                                        ''N'',',
'                                        :ssl_ln_seq_no',
'                                       );',
'   INSERT INTO suplr_ship_loc_edit_temp(ssl_bu,',
'                                        ssl_suplr_id,',
'                                        ssl_loc_name1,',
'                                        ssl_loc_name2,',
'                                        ssl_addr1,',
'                                        ssl_addr2,',
'                                        ssl_addr3,',
'                                        ssl_po_box,',
'                                        ssl_city,',
'                                        ssl_state,',
'                                        ssl_country,',
'                                        ssl_zip,',
'                                        ssl_tele,',
'                                        ssl_mob_no,',
'                                        ssl_fax,',
'                                        ssl_email,',
'                                        ssl_website,',
'                                        ssl_port,',
'                                        ssl_tin_no,',
'                                        ssl_ecc_no,',
'                                        ssl_ser_tax,',
'                                        ssl_comm_rate,',
'                                        ssl_ref1,',
'                                        ssl_ref2,',
'                                        ssl_cons,',
'                                        ssl_cre_by,',
'                                        ssl_cre_date,',
'                                        ssl_upd_by,',
'                                        ssl_upd_date,',
'                                        ssl_cst,',
'                                        ssl_dflt_flg,',
'                                        ssl_gst_no,',
'                                        ssl_gst_type,',
'                                        ssl_type,',
'                                        ssl_scheme,',
'                                        ssl_vat_clsfn,',
'                                        ssl_vat_type,',
'                                        ssl_pin_no,',
'                                        ssl_user_sid,',
'                                        ssl_trk_type,',
'                                        ssl_seq_no,',
'                                        ssl_temp_status,',
'                                        ssl_ln_seq_no)',
'                                 VALUES(:global_bu,',
'                                        :P36700505_ID,',
'                                        :ssl_loc_name1,',
'                                        :ssl_loc_name2,',
'                                        :ssl_addr1,',
'                                        :ssl_addr2,',
'                                        :ssl_addr3,',
'                                        :ssl_po_box,',
'                                        :ssl_city,',
'                                        :ssl_state,',
'                                        :ssl_country,',
'                                        :ssl_zip,',
'                                        :ssl_tele,',
'                                        :ssl_mob_no,',
'                                        :ssl_fax,',
'                                        :ssl_email,',
'                                        :ssl_website,',
'                                        :ssl_port,',
'                                        :ssl_tin_no,',
'                                        :ssl_ecc_no,',
'                                        :ssl_ser_tax,',
'                                        :ssl_comm_rate,',
'                                        :ssl_ref1,',
'                                        :ssl_ref2,',
'                                        :ssl_cons,',
'                                        :global_user,',
'                                        sysdate,',
'                                        :ssl_upd_by,',
'                                        :ssl_upd_date,',
'                                        :ssl_cst,',
'                                        :ssl_dflt_flg,',
'                                        :ssl_gst_no,',
'                                        :ssl_gst_type,',
'                                        :ssl_type,',
'                                        :ssl_scheme,',
'                                        :ssl_vat_clsfn,',
'                                        :ssl_vat_type,',
'                                        :ssl_pin_no,',
'                                        :global_sid,',
'                                        ''A'',',
'                                        :ssl_seq_no,',
'                                        ''C'',',
'                                        :ssl_ln_seq_no',
'                                       );',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN ',
'    UPDATE suplr_ship_loc_edit_temp',
'       SET ssl_loc_name1   = :ssl_loc_name1,',
'           ssl_city        = :ssl_city,',
'           ssl_state       = :ssl_state,',
'           ssl_country     = :ssl_country,',
'           ssl_type        = :ssl_type,',
'           ssl_gst_type    = :ssl_gst_type,',
'           ssl_gst_no      = :ssl_gst_no,',
'           ssl_addr1       = :ssl_addr1,',
'           ssl_addr2       = :ssl_addr2,',
'           ssl_addr3       = :ssl_addr3,',
'           ssl_port        = :ssl_port,',
'           ssl_email       = :ssl_email,',
'           ssl_tele        = :ssl_tele,',
'           ssl_fax         = :ssl_fax,',
'           ssl_zip         = :ssl_zip,',
'           ssl_scheme      = :ssl_scheme,',
'           ssl_dflt_flg    = :ssl_dflt_flg,',
'           ssl_upd_by      = :global_user,',
'           ssl_upd_date    = SYSDATE',
'     WHERE ssl_bu          = :GLOBAL_BU',
'       AND ssl_suplr_id    = :P36700505_ID',
'       AND ssl_seq_no      = :ssl_seq_no',
'      --  AND ssl_ln_seq_no   = :ssl_ln_seq_no',
'      --  AND ssl_loc_name1   = :ssl_loc_name1',
'       AND ssl_temp_status = ''N'';',
'END IF;',
' COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2538141224285417434
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020262871972029207)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Post Query'
,p_static_id=>'process-for-post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P36700505_SUPLR_CITY IS NOT NULL THEN',
'BEGIN',
'  SELECT state_name1, ',
'         cntry_name1,',
'         state_name1,',
'         cntry_name1,',
'         city_name1',
'    INTO :P36700505_STATE,',
'         :P36700505_COUNTRY,',
'         :P36700505_STATE_CV,',
'         :P36700505_COUNTRY_CV,',
'         :P36700505_CITY',
'    FROM cities, states, countries',
'   WHERE CITY_BU = STATE_BU',
'     AND CITY_BU = CNTRY_BU',
'     AND CITY_BU = :GLOBAL_BU',
'     AND city_id = :P36700505_SUPLR_CITY ',
'     AND city_state_id = state_id ',
'     AND state_cntry_id = cntry_id;',
'END;',
'END IF;',
'IF :P36700505_SUPLR_GROUP IS NOT NULL THEN',
'DECLARE ',
'     CURSOR C1 ',
'           IS ',
'         SELECT SUPGRP_DESC1',
'            FROM supplier_groups',
'           WHERE SUPGRP_BU = :GLOBAL_bu',
'             AND SUPGRP_GROUP_ID = :P36700505_SUPLR_GROUP;',
'CR1 C1%ROWTYPE;',
'BEGIN',
'   OPEN C1;',
'   FETCH C1 INTO CR1;',
'   IF C1%FOUND THEN ',
'        :P36700505_SUPLR_GROUP_DESC := CR1.SUPGRP_DESC1;',
'   END IF;',
'   CLOSE C1;',
'END;',
'END IF;',
'BEGIN',
'    SELECT NVL(suplr_bill_rnd,0),',
'           suplr_tcs_rof,',
'           suplr_msme_type,',
'           suplr_gst_rof,',
'           suplr_hold_reason,',
'           suplr_prnt_capn,',
'           suplr_hold_flag,',
'           suplr_ord_hold_flag,',
'           suplr_mode_pur,',
'           suplr_mode_sal,',
'           suplr_frwd_flg,',
'           suplr_mode_sc,',
'           suplr_transport_flag,',
'           suplr_mode_gen,',
'           (SELECT sv_desc1',
'              FROM ship_vias',
'             WHERE sv_bu         = :global_bu ',
'               AND sv_shipvia_id = :P36700505_SUPLR_SHIP_VIA),',
'           (SELECT term_desc1',
'              FROM terms_hd',
'             WHERE term_bu      = :global_bu ',
'               AND term_term_id = suplr_term_id),',
'           (SELECT st_terr_desc',
'              FROM suplr_terr',
'             WHERE st_bu      = :global_bu ',
'               AND st_terr_id = suplr_terr_id),',
'           (SELECT fob_desc1',
'              FROM fobs',
'             WHERE fob_bu     = :global_bu ',
'               AND fob_fob_id = suplr_fob_id),',
'           (SELECT supsubgroup_desc1',
'              FROM supplier_subgroup',
'             WHERE supsubgroup_bu      = :GLOBAL_bu',
'               AND supsubgroup_type_id = suplr_group_id),',
'           (SELECT supgrp_desc1',
'             FROM supplier_groups',
'            WHERE supgrp_bu = :GLOBAL_bu',
'              AND supgrp_group_id = suplr_group_id),',
'           CASE suplr_part_flag WHEN ''N'' THEN ''Independent''',
'                                WHEN ''Y'' THEN ''Parent Supplier''',
'                                WHEN ''Y'' THEN ''Parent Supplier''',
'            END,',
'           (SELECT suplr_name1',
'              FROM suppliers  ',
'             WHERE suplr_bu              = :global_bu',
'               AND suplr_parent_suplr_id = :P36700505_SUPLR_PARENT_SUPLR_ID),',
'            CASE suplr_msme_type WHEN ''M'' THEN ''Medium''',
'                               WHEN ''S'' THEN ''Small''',
'                               WHEN ''O'' THEN ''Micro''',
'                               WHEN ''L'' THEN ''Large''',
'                               WHEN ''NA'' THEN ''Not Applicable''',
'              END',
'      INTO :P36700505_BILL,',
'           :P36700505_TCS,',
'           :P36700505_MSME_TYPE,',
'           :P36700505_GST_RND,',
'           :P36700505_HOLD_REAS,',
'           :P36700505_PRINT_CAP,',
'           :P36700505_HOL_PAY,',
'           :P36700505_HOL_ORD,',
'           :P36700505_PUR_FLAG,',
'           :P36700505_SALES_FLAG,',
'           :P36700505_FORWARD_FLAG,',
'           :P36700505_SUBCONT_FLAG,',
'           :P36700505_TRANSPORT_FLAG,',
'           :P36700505_GENERAL_FLAG,',
'           :P36700505_SHIP_VIA,',
'           :P36700505_PAYMENT_TER,',
'           :P36700505_TERRITORY,',
'           :P36700505_INCO_TERM,',
'           :P36700505_SUB_GROUP,',
'           :P36700505_GROUP,',
'           :P36700505_PARENT_FLAG,',
'           :P36700505_PARNT_SUPLR_NAME,',
'           :P36700505_MSME_TYPE',
'      FROM suppliers_edit_temp',
'     WHERE suplr_bu          = :GLOBAL_BU',
'       AND suplr_suplr_id    = :P36700505_ID',
'       AND suplr_temp_status = ''C'';',
'   EXCEPTION WHEN NO_DATA_FOUND THEN  ',
'     NULL;',
'  COMMIT;',
'END;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2538301036428418179
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020262525059029203)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Suplr_id'
,p_static_id=>'process-for-suplr-id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P36700505_ID IS NOT NULL THEN ',
'  BEGIN  ',
'   SELECT ROWID ',
'     INTO :P36700505_ROWID',
'     FROM suppliers_edit_temp',
'    WHERE suplr_bu          = :global_bu',
'      AND suplr_suplr_id    = :P36700505_ID',
'      AND suplr_temp_status = ''N'';',
'   EXCEPTION WHEN NO_DATA_FOUND THEN ',
'      NULL;',
'  END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2538300689515418175
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020235028589029043)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11210742216821983815)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Supplier Edit Template'
,p_static_id=>'process-form-supplier-edit-template'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020209714332028940)
,p_process_success_message=>'Saved.'
,p_internal_uid=>2538273193045418015
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8020262145191029201)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process form Supplier Post'
,p_static_id=>'process-form-supplier-post'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P36700505_TYPE = ''AD'' THEN',
'	UPDATE SUPPLIERS',
'	  SET SUPLR_ADDR1           = :P36700505_SUPLR_ADDR1,',
'	      SUPLR_ADDR2           = :P36700505_SUPLR_ADDR2,',
'	      SUPLR_ADDR3           = :P36700505_SUPLR_ADDR3,',
'	      SUPLR_CITY            = :P36700505_SUPLR_CITY,',
'         SUPLR_STATE           = :P36700505_SUPLR_STATE,',
'         SUPLR_COUNTRY         = :P36700505_SUPLR_COUNTRY,',
'         SUPLR_TELE1           = :P36700505_SUPLR_TELE1,',
'         SUPLR_TELE2           = :P36700505_SUPLR_TELE2,',
'         SUPLR_FAX1            = :P36700505_SUPLR_FAX1,',
'         SUPLR_EMAIL1          = :P36700505_SUPLR_EMAIL1,',
'         SUPLR_WEB_SITE1       = :P36700505_SUPLR_WEB_SITE1,',
'         SUPLR_CREDIT_LIMIT    = :P36700505_SUPLR_CREDIT_LIMIT,',
'         SUPLR_ZIP             = :P36700505_SUPLR_ZIP,',
'         SUPLR_CUST_CODE       = :P36700505_SUPLR_CUST_CODE,',
'         SUPLR_PARENT_SUPLR_ID = :P36700505_SUPLR_PARENT_SUPLR_ID,',
'         SUPLR_UPD_BY          = :global_user,',
'         SUPLR_UPD_DATE        = SYSDATE',
'   WHERE SUPLR_BU              = :GLOBAL_BU',
'	  AND SUPLR_SUPLR_ID        = :P36700505_ID;',
'ELSIF :P36700505_TYPE = ''OT'' THEN',
'   UPDATE SUPPLIERS',
'	   SET SUPLR_TYPE_ID         = :P36700505_SUPLR_SUB_GROUP,',
'         SUPLR_GROUP_ID        = :P36700505_SUPLR_GROUP,',
'         SUPLR_FOB_ID          = :P36700505_SUPLR_INCO_TERM,',
'         SUPLR_TERR_ID         = :P36700505_SUPLR_TERR,',
'         SUPLR_TERM_ID         = :P36700505_SUPLR_PAY_TERM,',
'         SUPLR_BILL_RND        = :P36700505_SUPLR_BILL_RND,',
'         SUPLR_TCS_ROF         = :P36700505_SUPLR_TCS_ROF,',
'         SUPLR_MSME_TYPE       = :P36700505_SUPLR_MSME_TYPE, ',
'         SUPLR_GST_ROF         = :P36700505_SUPLR_GST_ROF,',
'         SUPLR_HOLD_REASON     = :P36700505_SUPLR_HOLD_REASON,',
'         SUPLR_HOLD_FLAG       = :P36700505_SUPLR_HOLD_FLAG,',
'         SUPLR_PRNT_CAPN       = :P36700505_SUPLR_PRNT_CAPN,',
'         SUPLR_ORD_HOLD_FLAG   = :P36700505_SUPLR_ORD_HOLD,',
'         SUPLR_MODE_PUR        = :P36700505_SUPLR_MODE_PUR,',
'         SUPLR_MODE_SC         = :P36700505_SUPLR_MODE_SC,',
'         SUPLR_MODE_SAL        = :P36700505_SUPLR_MODE_SAL,',
'         SUPLR_FRWD_FLG        = :P36700505_SUPLR_FRWD_FLG,',
'         SUPLR_TRANSPORT_FLAG  = :P36700505_SUPLR_TRANSPORT_FLAG,',
'         SUPLR_MODE_GEN        = :P36700505_SUPLR_MODE_GEN,',
'         SUPLR_UPD_BY          = :global_user,',
'         SUPLR_UPD_DATE        = SYSDATE',
'   WHERE SUPLR_BU              = :GLOBAL_BU',
'	  AND SUPLR_SUPLR_ID        = :P36700505_ID;',
'END IF;',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8020209328544028940)
,p_internal_uid=>2538300309647418173
);
wwv_flow_imp.component_end;
end;
/
