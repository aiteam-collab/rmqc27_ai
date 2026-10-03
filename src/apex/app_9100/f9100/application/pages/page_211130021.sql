prompt --application/pages/page_211130021
begin
--   Manifest
--     PAGE: 211130021
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
 p_id=>211130021
,p_name=>'Favourites/Preferences/Notification'
,p_alias=>'FAVOURITES-PREFERENCE-NOTIFICATION-INT-MSG-ACCES'
,p_step_title=>'Favourites/Preferences/Notification'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #00b1e7 !important;',
'    color: #ffffff !important;',
'    font-family: Arial !important;',
'} */',
'',
'/*Grid Header Column Color*/',
'/* ',
'  .a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'      font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,700));',
'      background: #00b1e7 !important;',
'      color: white !important;',
'} */',
'',
'/* --------------------------------Tab Color--------------------------------- */',
'/* .apex-button-group .apex-item-option label, .t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc .apex-item-option label {',
'',
'    --a-button-background-color: #00b1e7 ;',
'    --a-button-text-color: #ffffff;',
'    --a-button-hover-background-color: #00b1e7 ;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #00b1e7 ;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'} ',
'',
'.apex-item-radio input:checked+.u-radio, .apex-item-radio input:checked+label, .u-radio.is-checked {',
'    --a-checkbox-background-color: #00b1e7;',
'    --a-checkbox-text-color: var(--a-checkbox-checked-text-color);',
'} */',
'',
'/*   PRASANTH   CheckBox Color  */',
'',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: white;',
'    --a-checkbox-text-color: #028107;',
'    --a-button-border-radius: #00d7c9;',
'    --a-checkbox-border-color: #cd9a00;',
'}'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611997700865411687)
,p_plug_name=>'Favourites'
,p_static_id=>'favourites'
,p_region_name=>'FAV'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT wubfa_bus_fun_id,',
'         wbf_bus_fun_name description,',
'         TO_CHAR (WUBFA_DATE_FROM, func_find_date_format (:global_bu))',
'            WUBFA_DATE_FROM,',
'         TO_CHAR (WUBFA_DATE_TO, func_find_date_format (:global_bu))',
'            WUBFA_DATE_TO,',
'            DECODE (wbf_bus_fun_type,',
'                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                 NVL (TO_CHAR (wbf_seq_no, ''0000000''), wbf_bus_fun_id)) seq_no',
'    FROM wapl_user_bus_fun_accs, wapl_bus_fun, user_bus_fun_favourites_apex',
'   WHERE     wubfa_fav_bu = :global_bu',
'         AND wubfa_user_id = :global_user',
'         AND wbf_bus_fun_id = wubfa_bus_fun_id',
'         AND wubfa_fav_bu = ubff_bu',
'         AND wubfa_user_id = ubff_user_id',
'         AND wbf_bus_fun_id = ubff_bus_fun_id',
'         AND wbf_active_flag = ''Y''',
'         AND wbf_visible = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Favourites'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7611998114290411691)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2130036278746800663
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611998717299411697)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757826386247772643)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>130
,p_column_identifier=>'R'
,p_column_label=>'Seq No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5921534894064596234)
,p_db_column_name=>'WUBFA_BUS_FUN_ID'
,p_display_order=>100
,p_column_identifier=>'O'
,p_column_label=>'Screen ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757825825918772637)
,p_db_column_name=>'WUBFA_DATE_FROM'
,p_display_order=>110
,p_column_identifier=>'P'
,p_column_label=>'Effective From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757825933637772638)
,p_db_column_name=>'WUBFA_DATE_TO'
,p_display_order=>120
,p_column_identifier=>'Q'
,p_column_label=>'Effective To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7612304789233613765)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10634579'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUBFA_BUS_FUN_ID:DESCRIPTION:WUBFA_DATE_FROM:WUBFA_DATE_TO'
,p_sort_column_1=>'SEQ_NO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611998060075411690)
,p_plug_name=>'Internal_Msg'
,p_static_id=>'internal-msg'
,p_region_name=>'MSG'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       UIMA_USER_ID,',
'       (select APPLUSER_USER_TYPE ',
'         from APPL_USERS',
'        where APPLUSER_BU = UIMA_BU',
'          and APPLUSER_ID = UIMA_USER_ID )USER_TYPE,',
'      (select APPLUSER_EMP_ID',
'         from APPL_USERS',
'        where APPLUSER_BU = UIMA_BU',
'          and APPLUSER_ID = UIMA_USER_ID )EMP_ID,',
'      (select EMP_FIRST_NAME1||'' ''||EMP_MIDDLE_NAME1||'' ''||EMP_LAST_NAME1 EMP_NAME',
'	     from APPL_USERS,EMPLOYEES',
'	    where APPLUSER_BU     = EMP_BU',
'	      and APPLUSER_EMP_ID = EMP_EMP_ID',
'	      and APPLUSER_BU     = UIMA_BU',
'          and APPLUSER_STATUS = ''A''',
'          and APPLUSER_ID     = UIMA_USER_ID ) EMP_NAME,',
'       UIMA_MSG_ID,',
'      (select IM_MSG_DESC',
'	     from INTERNAL_MESSAGES',
'	    where IM_BU     = UIMA_BU ',
'          and IM_MSG_ID = UIMA_MSG_ID ) Description,',
'       UIMA_MSG_TYPE,',
'       UIMA_REQ_FLAG,',
'       ''<span aria-hidden="true" class="fa fa-unlink" style= "color:#169e12"></span>'' "Content"',
'  from USER_INTERNAL_MESSAGES_ASGMNT',
' where UIMA_BU = :GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Internal_Msg'
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
 p_id=>wwv_flow_imp.id(7613420905223438780)
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
 p_id=>wwv_flow_imp.id(7613421008265438781)
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
 p_id=>wwv_flow_imp.id(6971628987349328068)
,p_name=>'Action'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_link_target=>'javascript:$s(''P211130021_ROWID_MSG'',''&ROWID_MSG.'');apex.confirm("Do you want to Delete the document?",''DELETE_MSG'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612721089826800485)
,p_name=>'Content'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Content'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Content'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>76
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612720802694800482)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
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
 p_id=>wwv_flow_imp.id(7612720568837800479)
,p_name=>'EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. ID'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7613420132386438772)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7613421262105438783)
,p_name=>'ROWID_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612720712144800481)
,p_name=>'UIMA_MSG_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UIMA_MSG_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Message'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(7612720967110800483)
,p_name=>'UIMA_MSG_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UIMA_MSG_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(7612721068567800484)
,p_name=>'UIMA_REQ_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UIMA_REQ_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612720286495800477)
,p_name=>'UIMA_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UIMA_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(7612720475533800478)
,p_name=>'USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:ERP Admin;R,Functional User;E,Role Based User;O,ESS User;U,Supplier;S,Customer;C,POS User;P'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7612720218034800476)
,p_internal_uid=>2130758382491189448
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
,p_download_formats=>'PDF:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7613029153912093455)
,p_interactive_grid_id=>wwv_flow_imp.id(7612720218034800476)
,p_static_id=>'10641822'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7613029377512093455)
,p_report_id=>wwv_flow_imp.id(7613029153912093455)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6548936699513921083)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7612721089826800485)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6549373623145698731)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7613420132386438772)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>189.141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6994636956462722940)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6971628987349328068)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613029875625093462)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7612720286495800477)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613030749380093469)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7612720475533800478)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613031632324093482)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7612720568837800479)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613033440660093497)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7612720712144800481)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613034349877093507)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7612720802694800482)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>223
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613035115697093513)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7612720967110800483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613036054023093521)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7612721068567800484)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613962617927268883)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(7613420905223438780)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613963939531268897)
,p_view_id=>wwv_flow_imp.id(7613029377512093455)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7613421262105438783)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611997977487411689)
,p_plug_name=>'Notification'
,p_static_id=>'notification'
,p_region_name=>'NOT'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWNUM seq_no, NAME, VALUE FROM (',
'  SELECT ''Purchase GRN'' name,',
'       COUNT(*) VALUE,',
'       1 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''PR''   ',
'   AND suphd_pur_type = ''W'' ',
'   AND suphd_doc_type = ''SB''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Subcontract GRN'' name,',
'       COUNT(*) VALUE,',
'       2 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''SCO''',
'   AND suphd_pur_type = ''W''  ',
'   AND suphd_doc_type = ''SB''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Stock Transfer'' name,',
'       COUNT(*) VALUE,',
'       3 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''ST''',
'   AND suphd_pur_type = ''W''   ',
'   AND suphd_doc_type = ''SB''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Landed Cost'' name,',
'       COUNT(*) VALUE,',
'       4 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''LC''',
'   AND suphd_pur_type = ''W''    ',
'   AND suphd_doc_type = ''SB''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Unapproved Purchase Bills'' name,',
'       COUNT(*) VALUE,',
'       5 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''O''  ',
'   AND suphd_doc_type = ''SB''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Unapproved Bank/Cash Payments'' name,',
'       COUNT(*) VALUE,',
'       6 seq_no',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''P''',
'   AND btrans_type IN(''CT'',''BT'') ',
'HAVING COUNT(*) > 0   ',
'UNION ALL',
'SELECT ''Unapproved Bank/Cash Receipts'' name,',
'       COUNT(*) VALUE,',
'       7 seq_no',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''R''',
'   AND btrans_type IN(''CT'',''BT'') ',
'HAVING COUNT(*) > 0   ',
'UNION ALL',
'SELECT ''Unapproved Journal Voucher'' name,',
'       COUNT(*) VALUE,',
'       8 seq_no',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''P''',
'   AND btrans_type IN(''JT'')    ',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Unapproved Contra Voucher'' name,',
'       COUNT(*) VALUE,',
'       9 seq_no',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode IN(''I'',''O'')',
'   AND btrans_type IN(''CV'')         ',
'HAVING COUNT(*) > 0   ',
'UNION ALL',
'SELECT ''MSME Expiry'' name,',
'       COUNT(*) VALUE,',
'       10 seq_no',
'  FROM suppliers',
' WHERE suplr_bu = :global_bu  ',
'   AND suplr_status = ''A''',
'   AND suplr_msme_appl_flag = ''Y''  ',
'   AND TRUNC(SYSDATE) - TRUNC(suplr_msme_date_to)>=10    ',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''MSME Invoices'' name,',
'       COUNT(*) VALUE,',
'       11 seq_no',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu  ',
'   AND suphd_status = ''N''',
'   AND suphd_msme_flag = ''Y''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Expiry Documents'' name,',
'       COUNT(*) VALUE,',
'       12 seq_no',
'  FROM doc_mgmt_doc_type,',
'       doc_mgmt',
' WHERE dm_bu = :global_bu',
'   AND dmdt_desc = dm_type_desc',
'   AND dmdt_exp_flag = ''Y''',
'   AND dmdt_type IN (SELECT wudal_type',
'                     FROM wapl_user_dashboard_accs_ln',
'                    WHERE wudal_bu = :global_bu',
'                      AND wudal_user_id = :global_user)',
'   AND dm_to_date <= (dm_from_date+dmdt_exp_days)',
'   AND dm_status = ''A''',
'   AND dmdt_exp_days IS NOT NULL ',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Employee Profiles'' name,',
'       COUNT(*) VALUE,',
'       13 seq_no',
' FROM employees,',
'      emp_profiles_hd,',
'      emp_active_infos',
'WHERE emp_bu = ephd_bu',
'  AND emp_emp_id = ephd_emp_id',
'  AND emp_bu = empai_bu',
'  AND emp_emp_id = empai_emp_id',
'  AND emp_bu = :GLOBAL_bu ',
'  AND ephd_status = ''N'' ',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Waiting for approval Leave Request'' name,',
'       COUNT(*) VALUE,',
'       14 seq_no',
'  FROM leave_request',
' WHERE lr_bu = :global_bu',
'   AND lr_status = ''N''',
'   AND lr_type = ''L''',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Pending Leave Entry'' name,',
'       COUNT(*) VALUE,',
'       15 seq_no',
'  FROM emp_pend_leave_rqst_vw',
' WHERE lr_bu = :global_bu',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Waiting for approval Permission'' name,',
'       COUNT(*) VALUE,',
'       16 seq_no',
' FROM employee_permission',
'WHERE empper_bu = :global_bu',
'  AND empper_status = ''E''',
'  AND empper_type = ''P''',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Waiting for approval Onduty'' name,',
'       COUNT(*) VALUE,',
'       17 seq_no',
' FROM employee_permission',
'WHERE empper_bu = :global_bu',
'  AND empper_status = ''E''',
'  AND empper_type = ''M'' ',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Waiting for approval Comp.Off'' name,',
'       COUNT(*) VALUE,',
'       18 seq_no',
' FROM hrm_emp_comp_off',
'WHERE heco_bu = :global_bu',
'  AND heco_status = ''E''',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Waiting for approval Encashment Request'' name,',
'       COUNT(*) VALUE,',
'       19 seq_no',
' FROM leave_request',
'WHERE lr_bu = :global_bu',
'  AND lr_status = ''N''',
'  AND lr_type = ''E''   ',
'HAVING COUNT(*) > 0  ',
'UNION ALL   ',
'SELECT ''Pending Encashment'' name,',
'       COUNT(*) VALUE,',
'       20 seq_no',
' FROM emp_pend_leave_encash_rqst_vw',
'WHERE eplerv_bu = :global_bu',
'HAVING COUNT(*) > 0  ',
'UNION ALL   ',
'SELECT ''Waiting for approval Overtime'' name,',
'       COUNT(*) VALUE,',
'       21 seq_no',
' FROM emp_ovrt_hd, ',
'      emp_ovrt_ln',
'WHERE eohd_bu = eoln_bu',
'  AND eohd_doc_no = eoln_doc_no',
'  AND eohd_bu = :global_bu',
'  AND eohd_status = ''N''',
'HAVING COUNT(*) > 0  ',
'UNION ALL   ',
'SELECT ''Waiting for approval Loan'' name,',
'       COUNT(*) VALUE,',
'       22 seq_no',
'FROM emp_loans_request',
'WHERE elr_bu = :global_bu',
'  AND elr_status = ''N''    ',
'HAVING COUNT(*) > 0  ',
'UNION ALL',
'SELECT ''Open Inv. Pipeline Items'' name,',
'       COUNT(*) VALUE,',
'       23 seq_no',
' FROM STOCK_REORDER_PIPLINE',
' WHERE srp_bu = :GLOBAL_bu ',
'   AND srp_status = ''N''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Pending MR Lines'' name,',
'       COUNT(*) VALUE,',
'       24 seq_no',
'FROM INV_MAT_RQST_SO_VIEW',
'WHERE imrsv_bu = :global_bu',
'  AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty)) > 0',
'  AND imrsv_plnt IN (SELECT auba_plant',
'                      FROM appl_user_plant_access',
'                     WHERE auba_bu = :global_bu',
'                       AND auba_user_id = :global_user',
'                       AND TRUNC(SYSDATE) BETWEEN auba_from AND auba_to)',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Pend MRV Lines (SCO)'' name,',
'       COUNT(*) VALUE,',
'       25 seq_no',
' FROM INV_STOCK_TRANS_VW',
'WHERE ISTHDH_BU = :Global_bu ',
'  AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''DC Lines'' name,',
'       COUNT(*) VALUE,',
'       26 seq_no',
' FROM DC_HD, DC_LN',
'WHERE DCHD_bu = DCLN_BU ',
'  AND DCHD_bu = :global_bu',
'  AND DCLN_PLNT = DCHD_PLNT',
'  AND DCLN_DOC_NO = DCHD_DOC_NO',
'  AND DCHD_STATUS = ''L''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Open Stock Adjustment'' name,',
'       COUNT(*) VALUE,',
'       27 seq_no',
'FROM stock_adj_trans_hd, stock_adj_trans_ln',
'WHERE sathd_bu = :global_bu',
'  AND sathd_plnt IN (SELECT auba_plant',
'                     FROM appl_user_plant_access',
'                    WHERE auba_bu = :global_bu',
'                      AND auba_user_id = :global_user',
'                      AND TRUNC(SYSDATE) BETWEEN auba_from AND auba_to)             ',
'  AND sathd_bu = satln_bu',
'  AND sathd_ord_no = satln_ord_no',
'  AND sathd_status = ''E''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Open CMR'' name,',
'       COUNT(*) VALUE,',
'       28 seq_no',
'FROM CUST_MAT_TRANS_RETURN_HD',
'WHERE CMTRHD_BU = :GLOBAL_BU',
'  AND CMTRHD_STATUS = ''N''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Expires Items (RM)'' name,',
'       COUNT(*) VALUE,',
'       29 seq_no',
'FROM LOT_SER_STOCKS_VW, products, classes',
'WHERE lssv_BU = :GLOBAL_bu',
'  AND lssv_bu = prod_bu',
'  AND lssv_prod_id = prod_id',
'  AND lssv_prod_rev = prod_rev',
'  AND prod_bu = class_bu',
'  AND prod_cls = class_id',
'  AND CLASS_TYPE = ''RM''',
'  AND LSS_DUE_DAYS <= 15',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Equipments Open'' name,',
'       COUNT(*) VALUE,',
'       30 seq_no',
'FROM equipments',
'WHERE EQPMT_BU = :GLOBAL_BU',
'  AND EQPMT_STATUS = ''N''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Work Request Open'' name,',
'       COUNT(*) VALUE,',
'       31 seq_no',
'FROM MAINT_REQUEST',
'WHERE MNTRQST_BU = :GLOBAL_BU',
'  AND MNTRQST_STATUS = ''E''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Work Request Pending'' name,',
'       COUNT(*) VALUE,',
'       32 seq_no',
'FROM MAINT_REQUEST',
'WHERE MNTRQST_BU = :GLOBAL_BU',
'  AND MNTRQST_STATUS = ''A'' ',
'  AND mntrqst_wo_created = ''N'' ',
'  AND NOT EXISTS (SELECT 1',
'                  FROM maint_wo_task_comp',
'                 WHERE mntwotc_bu = mntrqst_bu',
'                   AND mntwotc_plnt = mntrqst_plnt',
'                   AND mntwotc_req_no = mntrqst_rqst_no',
'                   AND mntwotc_eqpmt_id = mntrqst_eqpmt_id',
'                   AND mntwotc_comp_basis = ''WR''',
'                   AND mntwotc_status = ''N'')',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Work Order Open'' name,',
'       COUNT(*) VALUE,',
'       33 seq_no',
'FROM MAINT_WO',
'WHERE MNTWO_BU = :GLOBAL_BU',
'  AND MNTWO_STATUS = ''E''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''W.O. Task Completion Open'' name,',
'       COUNT(*) VALUE,',
'       34 seq_no',
'FROM maint_wo_task_comp',
'WHERE mntwotc_bu = :GLOBAL_BU',
'  AND MNTWOTC_STATUS = ''N''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''W.O. Task Completed Not Handover'' name,',
'       COUNT(*) VALUE,',
'       35 seq_no',
'FROM maint_wo_task_comp',
'WHERE mntwotc_bu = :GLOBAL_BU',
'  AND MNTWOTC_STATUS = ''M''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Pend. Maintenance Dues'' name,',
'       COUNT(*) VALUE,',
'       36 seq_no',
'FROM EQUIPMENTS_MAINT_DUES',
'WHERE EPMT_BU = :Global_bu  ',
'  AND EPMT_PLNT IN (SELECT AUBA_PLANT',
'                    FROM appl_user_plant_access',
'                   WHERE AUBA_BU = :global_bu',
'                     AND AUBA_USER_ID = :GLOBAL_user ',
'                     AND trunc(sysdate) BETWEEN AUBA_FROM AND AUBA_TO)',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Bill Of Materials Open'' name,',
'       COUNT(*) VALUE,',
'       37 seq_no',
'FROM bom_hd',
'WHERE bomhd_status = ''E''',
'  AND bomhd_bu = :global_bu',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Production Order Unreleased'' name,',
'       COUNT(*) VALUE,',
'       38 seq_no',
'FROM (SELECT 1 FROM prod_order_hd',
'      WHERE PROHD_STATUS = ''E''',
'        AND prohd_bu = :global_bu',
'      UNION ALL ',
'      SELECT 1 FROM prod_order_hd_hist',
'      WHERE prohdh_status = ''E''',
'        AND prohdh_bu = :global_bu)',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Production Order Completion'' name,',
'       COUNT(*) VALUE,',
'       39 seq_no',
'FROM (SELECT 1 FROM prod_order_hd',
'      WHERE PROHD_BU = :GLOBAL_BU',
'        AND PROHD_STATUS = ''R''',
'      UNION ALL ',
'      SELECT 1 FROM prod_order_hd_hist',
'      WHERE prohdh_bu = :global_bu',
'        AND prohdh_status = ''R'')',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Pending FG Packing'' name,',
'       COUNT(*) VALUE,',
'       40 seq_no',
'FROM PROD_ORD_TRANS_VIEW ',
'WHERE potv_bu = :GLOBAL_BU ',
'  AND potv_type = ''PR'' ',
'  AND POTV_SER_NO IS NULL',
'  AND (potv_oprn_flag IN (''I'', ''B'') OR (potv_oprn_flag IN (''O'') AND func_find_vi_oprn_flag(:GLOBAL_BU, potv_oprn_id) = ''Y''))',
'  AND EXISTS (SELECT 1 ',
'              FROM appl_user_plant_access',
'             WHERE auba_bu = :GLOBAL_BU',
'               AND auba_user_id = :GLOBAL_USER',
'               AND (SYSDATE) BETWEEN auba_from AND auba_to',
'               AND potv_plnt = auba_plant)',
'  AND ((potv_queue_qty + potv_run_qty + potv_os_run_qty) > 0',
'       AND (potv_comp_qty + potv_rej_qty + potv_scrap_qty + potv_rework_qty + potv_dis_ass_qty) <>',
'          (SELECT prohd_order_qty',
'           FROM prod_order_hd',
'           WHERE prohd_bu = :GLOBAL_BU',
'             AND prohd_plnt = potv_plnt',
'             AND prohd_ord_no = potv_ord_no))',
'  AND EXISTS (SELECT prohd_ord_no',
'              FROM prod_order_hd',
'              WHERE prohd_bu = :GLOBAL_BU',
'                AND prohd_plnt = potv_plnt',
'                AND prohd_status = ''P''',
'                AND prohd_ord_no = potv_ord_no)',
'  AND NOT EXISTS (SELECT 1 ',
'                  FROM mfg_oprns',
'                  WHERE Mfgo_Pack_Flag = ''Y''',
'                    AND mfgo_bu = :GLOBAL_BU',
'                    AND MFGO_OPRN_ID = POTV_OPRN_ID)',
'HAVING COUNT(*) > 0 					  ',
'UNION ALL',
'SELECT ''Serial Wise Pending'' name,',
'       COUNT(*) VALUE,',
'       41 seq_no',
'FROM PROD_ORD_SER_TRANS_VIEW',
'WHERE postv_bu = :GLOBAL_bu  ',
'  AND EXISTS (SELECT 1',
'              FROM appl_user_plant_access',
'              WHERE auba_bu = :GLOBAL_bu ',
'                AND auba_user_id = :GLOBAL_USER ',
'                AND (SYSDATE) BETWEEN auba_from AND auba_to',
'                AND postv_plnt = auba_plant)',
'  AND ((postv_queue_qty + postv_run_qty + postv_os_run_qty) > 0)',
'  AND (postv_oprn_flag IN(''I'',''B'')',
'       OR (postv_oprn_flag IN (''O'') AND func_find_vi_oprn_flag(:GLOBAL_bu, postv_oprn_id) = ''Y''))',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Rework Order Pending'' name,',
'       COUNT(*) VALUE,',
'       42 seq_no',
'FROM REWORK_ORDER_VIEW',
'WHERE RWOHD_BU = :GLOBAL_BU ',
'  AND rwohd_status IN (''A'')',
'  AND rwohd_plnt IN (SELECT AUBA_PLANT',
'                     FROM APPL_USER_PLANT_ACCESS ',
'                     WHERE AUBA_BU = :GLOBAL_BU',
'                       AND AUBA_USER_ID = :GLOBAL_USER',
'                       AND (sysdate) BETWEEN AUBA_FROM AND AUBA_TO)',
'  AND ((0 = (SELECT COUNT(1) ',
'             FROM work_flow_doc_control',
'             WHERE wfdc_bu = :GLOBAL_bu',
'               AND wfdc_type = ''WF_SFRWA''',
'               AND wfdc_plnt = RWOHD_PLNT',
'               AND wfdc_doc_no = rwohd_ord_no)) ',
'       OR (rwohd_ord_no) IN (SELECT wfdc_doc_no',
'                             FROM work_flow_doc_control',
'                             WHERE wfdc_bu = :GLOBAL_bu',
'                               AND wfdc_type = ''WF_SFRWA''',
'                               AND wfdc_plnt = RWOHD_PLNT',
'                               AND wfdc_doc_no = rwohd_ord_no',
'                               AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_bu, :GLOBAL_user)))',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Rework Order Completion'' name,',
'       COUNT(*) VALUE,',
'       43 seq_no',
'FROM rework_order_comp_view',
'WHERE RWOCHD_BU = :GLOBAL_BU',
'  AND RWOCHD_STATUS = ''P''',
'HAVING COUNT(*) > 0 ',
'UNION ALL',
'SELECT ''Pending PR Lines'' name,',
'       COUNT(*) VALUE,',
'       44 seq_no',
'FROM PUR_REQ_LN_SCDLE_VIEW',
'WHERE prh_bu = :global_bu ',
'  AND prl_rfq = ''N''',
'  AND (prl_requested_qty - (prl_rfq_qty + prl_cls_qty + prl_ordered_qty + prl_prof_qty + prl_po_amd_inproc_qty)) > 0',
'  AND EXISTS (SELECT 1',
'              FROM appl_user_plant_access',
'              WHERE auba_bu = :global_bu',
'                AND auba_user_id = :global_user',
'                AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to)',
'                AND auba_plant = prh_plant',
'                AND auba_plnt_loc_id = prh_plnt_loc_id)',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open RFQ'' name,',
'       COUNT(*) VALUE,',
'       45 seq_no',
'FROM rfq_hd',
'WHERE RFQHD_BU = :global_bu',
'  AND rfqhd_status = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Items'' name,',
'       COUNT(*) VALUE,',
'       46 seq_no',
'FROM products',
'WHERE prod_bu = :GLOBAL_bu',
'  AND prod_status = ''A''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting for approval (RFQ)'' name,',
'       COUNT(*) VALUE,',
'       47 seq_no',
'FROM RFQ_HD, RFQ_LN, RFQ_LN_SUPLR',
'WHERE RFQHD_BU = RFQLN_BU',
'  AND RFQHD_RFQ_NO = RFQLN_RFQ_NO',
'  AND RLS_BU = RFQLN_bu',
'  AND RLS_RFQ_NO = RFQHD_RFQ_NO',
'  AND RLS_SEQ_NO = RFQLN_SEQ_NO',
'  AND RFQHD_BU = :GLOBAL_bu',
'  AND RFQHD_STATUS = ''I'' ',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting for approval (PO)'' name,',
'       COUNT(*) VALUE,',
'       48 seq_no',
'FROM PUR_ORDER_HD, PUR_ORDER_LN',
'WHERE poh_bu = pol_bu',
'  AND poh_order_no = pol_order_no',
'  AND poh_status = ''N''',
'  AND poh_mode = ''PO''',
'  AND poh_bu = :GLOBAL_bu',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''PO Overdues'' name,',
'       COUNT(*) VALUE,',
'       49 seq_no',
'FROM pur_order_hd, pur_order_ln, fin_periods',
'WHERE poh_bu = pol_bu',
'  AND poh_order_no = pol_order_no',
'  AND poh_bu = fp_bu',
'  AND poh_order_period = fp_period',
'  AND poh_order_year = fp_year',
'  AND poh_mode = ''PO''',
'  AND poh_status IN (''A'',''P'')',
'  AND pol_status NOT IN (''C'')',
'  AND pol_grn_rqrd_flag = ''Y''',
'  AND (pol_ordered_qty - (pol_received_qty + pol_cls_qty + pol_proc_qty)) > 0',
'  AND poh_bu = :GLOBAL_Bu',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Price List Expiry'' name,',
'       COUNT(*) VALUE,',
'       51 seq_no',
'FROM PUR_SC_PRICE_LIST',
'WHERE PSPL_BU = :global_bu',
'  AND PSPL_STATUS = ''A''',
'  AND PSPL_TYPE = ''PR''',
'  AND (sysdate - 10) > PSPL_EFF_DATE_TO',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pending GRN'' name,',
'       COUNT(*) VALUE,',
'       52 seq_no',
'FROM PUR_ORDER_SO_VIEW',
'WHERE posv_bu = :GLOBAL_bu',
'  AND EXISTS (SELECT 1',
'              FROM appl_user_plant_access',
'              WHERE auba_bu = :GLOBAL_bu ',
'                AND auba_user_id = :GLOBAL_USER',
'                AND trunc(sysdate) BETWEEN auba_from AND auba_to',
'                AND auba_plant = posv_plnt',
'                AND auba_plnt_loc_id = posv_plnt_loc_id)',
'  AND posv_matl_type <> ''T''',
'  AND POSV_MODE = ''PO'' ',
'  AND POSV_TYPE <> ''POT''',
'  AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'  AND EXISTS (SELECT 1 ',
'              FROM pom_control ',
'              WHERE pomctrl_bu = posv_bu ',
'                AND pomctrl_plnt = posv_plnt ',
'                AND pomctrl_gate_ent_flag = ''N'')',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pending GRN(Bill Booking)'' name,',
'       COUNT(*) VALUE,',
'       53 seq_no',
'FROM pur_ord_receipt_hd_view, pur_ord_receipt_ln_view',
'WHERE porh_bu = porl_bu',
'  AND porh_receipt_no = porl_receipt_no',
'  AND porh_mode = ''PR''',
'  AND porl_status = ''R''',
'  AND porh_bu = :Global_bu',
'  AND (porl_temp_inv_qty - (NVL(porl_inv_qty, 0) + NVL(porl_temp_in_progress, 0) + NVL(porl_cls_qty, 0))) > 0',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open Purchase Rejection'' name,',
'       COUNT(*) VALUE,',
'       54 seq_no',
'FROM sales_invoices_hd, sales_invoices_ln',
'WHERE sihd_bu = :GLOBAL_bu',
'  AND sihd_bu = siln_bu',
'  AND sihd_doc_no = siln_doc_no',
'  AND sihd_status = ''N''',
'  AND sihd_type = ''PR''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting For QC'' name,',
'       COUNT(*) VALUE,',
'       55 seq_no',
'FROM TQM_QC_PLAN_VIEW',
'WHERE tqphd_bu = :GLOBAL_bu',
'  AND tqphd_status IN (''N'', ''P'',''C'')',
'  AND tqpln_status IN (''N'', ''P'',''C'')',
'  AND tqphd_plnt IN (SELECT wupal_plnt_id ',
'                     FROM wapl_user_plnt_access_ln',
'                    WHERE wupal_bu = :global_bu ',
'                      AND wupal_user_id = :GLOBAL_user ',
'                      AND TRUNC(SYSDATE) BETWEEN trunc(wupal_date_from) AND wupal_date_to)',
'  AND tqpln_quaran_reason IS NULL',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pend. QC Lines (PR)'' name,',
'       COUNT(*) VALUE,',
'       56 seq_no',
'FROM tqm_qc_plan_view',
'WHERE tqphd_bu = :GLOBAL_bu ',
'  AND tqphd_status IN (''N'',''P'',''C'') ',
'  AND tqpln_status IN (''N'',''P'',''C'') ',
'  AND tqpln_insp_mode = ''PR''',
'  AND tqpln_quaran_reason IS NULL',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pend QC Lines (SCO)'' name,',
'       COUNT(*) VALUE,',
'       57 seq_no',
'FROM tqm_qc_plan_view',
'WHERE tqphd_bu = :GLOBAL_bu ',
'  AND tqphd_status IN (''N'',''P'',''C'') ',
'  AND tqpln_status IN (''N'',''P'',''C'') ',
'  AND tqpln_insp_mode = ''SC''',
'  AND tqpln_quaran_reason IS NULL',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pend QC Lines (SFC)'' name,',
'       COUNT(*) VALUE,',
'       58 seq_no',
'FROM tqm_qc_plan_view',
'WHERE tqphd_bu = :GLOBAL_bu ',
'  AND tqphd_status IN (''N'',''P'',''C'') ',
'  AND tqpln_status IN (''N'',''P'',''C'') ',
'  AND tqpln_insp_mode = ''SF''',
'  AND tqpln_quaran_reason IS NULL',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pend QC Lines (Others)'' name,',
'       COUNT(*) VALUE,',
'       59 seq_no',
'FROM tqm_qc_plan_view',
'WHERE tqphd_bu = :GLOBAL_bu ',
'  AND tqphd_status IN (''N'',''P'',''C'') ',
'  AND tqpln_status IN (''N'',''P'',''C'') ',
'  AND tqpln_insp_mode NOT IN (''SF'',''PR'',''SC'')',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Insp. Doc (Open)'' name,',
'       COUNT(*) VALUE,',
'       60 seq_no',
'FROM tqm_qc_hd, tqm_qc_ln',
'WHERE tqhd_bu = :GLOBAL_bu',
'  AND tqhd_bu = tqln_bu',
'  AND tqhd_qc_no = tqln_qc_no',
'  AND tqhd_status = ''E''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting for Approval Ins. Doc.'' name,',
'       COUNT(*) VALUE,',
'       61 seq_no',
'FROM tqm_qc_hd, tqm_qc_ln',
'WHERE tqhd_bu = :GLOBAL_bu',
'  AND tqhd_bu = tqln_bu',
'  AND tqhd_qc_no = tqln_qc_no',
'  AND tqhd_status = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open NCR'' name,',
'       COUNT(*) VALUE,',
'       62 seq_no',
'FROM TQM_NCR',
'WHERE tqncr_bu = :global_bu',
'  AND tqncr_status IN (''O'')',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open 8D'' name,',
'       COUNT(*) VALUE,',
'       63 seq_no',
'FROM tqm_8d_hd, tqm_8d_ln',
'WHERE t8h_bu = t8l_bu',
'  AND t8h_bu = :global_bu',
'  AND t8h_doc_no = t8l_doc_no',
'  AND T8H_COMP_STATUS = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open Calibration'' name,',
'       COUNT(*) VALUE,',
'       64 seq_no',
'FROM INST_CALIB_HD',
'WHERE ICH_BU = :GLOBAL_BU',
'  AND ICH_TYPE = ''C''',
'  AND ICH_STATUS = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pending Enquiries'' name,',
'       COUNT(*) VALUE,',
'       65 seq_no',
'FROM opport_to_quotation_view',
'WHERE ophd_bu = :global_bu ',
'  AND ophd_cp_type <> ''P''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Pending Quotation'' name,',
'       COUNT(*) VALUE,',
'       66 seq_no',
'FROM so_quote_hd, so_quote_ln',
'WHERE sqh_bu = :global_bu',
'  AND sqh_bu = sql_bu',
'  AND sqh_quote_no = sql_quote_no',
'  AND sqh_quote_sfx = sql_quote_sfx',
'  AND sqh_status = ''S''',
'  AND sqh_order_no IS NULL',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting for approval (Quotation)'' name,',
'       COUNT(*) VALUE,',
'       67 seq_no',
'FROM so_quote_hd, so_quote_ln',
'WHERE sqh_bu = sql_bu',
'  AND sqh_quote_pfx = sql_quote_pfx',
'  AND sqh_quote_no = sql_quote_no',
'  AND sqh_quote_sfx = sql_quote_sfx',
'  AND sqh_bu = :global_bu',
'  AND sqh_status = ''T''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Waiting for approval (SO/CS)'' name,',
'       COUNT(*) VALUE,',
'       68 seq_no',
'FROM (SELECT 1',
'      FROM sales_order_hd,',
'           sales_order_qtys,',
'           fin_periods',
'      WHERE soh_bu = soq_bu',
'        AND soh_order_no = soq_order_no',
'        AND soh_bu = :global_bu',
'        AND soh_vou_type = ''SO''',
'        AND TRUNC(soh_order_date) BETWEEN fp_from_date AND fp_end_date',
'        AND fp_bu = soh_bu',
'        AND fp_year = soh_ord_year',
'        AND fp_period = soh_ord_period',
'        AND TRUNC(soh_order_date) BETWEEN fp_from_date AND fp_end_date',
'      UNION ALL',
'      SELECT 1',
'      FROM cust_order_hd,',
'           cust_order_ln,',
'           cust_order_schd,',
'           fin_periods',
'      WHERE cohd_bu = coln_bu',
'        AND cohd_plnt = coln_plnt',
'        AND cohd_batch_no = coln_batch_no',
'        AND cos_bu = coln_bu',
'        AND cos_plnt = coln_plnt',
'        AND cos_doc_no = coln_doc_no',
'        AND cos_doc_rev = coln_doc_rev',
'        AND cohd_bu = :global_bu',
'        AND cohd_bu = fp_bu',
'        AND TRUNC(cos_rqrd_date) BETWEEN fp_from_date AND fp_end_date',
'        AND (cos_schd_qty - cos_cs_qty) > 0)',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''SO Overdue'' name,',
'       COUNT(*) VALUE,',
'       69 seq_no',
'FROM (SELECT 1',
'      FROM sales_order_hd, sales_order_qtys',
'      WHERE soh_bu = soq_bu',
'        AND soh_order_no = soq_order_no',
'        AND soh_bu = :global_bu',
'        AND (soq_qty_ordered - (soq_qty_invoiced + soq_in_process_qty + soq_cs_qty)) > 0',
'        AND soq_status = ''A''',
'        AND soh_status = ''A''',
'      UNION ALL',
'      SELECT 1',
'      FROM cust_order_hd,',
'           cust_order_ln,',
'           cust_order_schd',
'      WHERE cohd_bu = coln_bu',
'        AND cohd_plnt = coln_plnt',
'        AND cohd_batch_no = coln_batch_no',
'        AND cos_bu = coln_bu',
'        AND cos_plnt = coln_plnt',
'        AND cos_doc_no = coln_doc_no',
'        AND coln_batch_no = cos_batch_no',
'        AND cohd_bu = :global_bu',
'        AND coln_status IN (''A'')',
'        AND cos_ft_type IN (''F'')',
'        AND (cos_actual_qty - (cos_shipped_qty + cos_inprocess_qty)) > 0',
'        AND coln_amend_flag = ''N'')',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open Proforma Invoices'' name,',
'       COUNT(*) VALUE,',
'       70 seq_no',
'FROM proforma_invoices_hd, proforma_invoices_ln',
'WHERE pihd_bu = piln_bu',
'  AND pihd_plnt = piln_plnt',
'  AND pihd_doc_no = piln_doc_no',
'  AND pihd_bu = :global_bu',
'  AND pihd_status = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Rate Contract Expiry'' name,',
'       COUNT(*) VALUE,',
'       71 seq_no',
'FROM sales_contr_batch_view',
'WHERE scdhd_bu = :global_bu',
'  AND scdhd_status = ''A''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Price List Expiry'' name,',
'       COUNT(*) VALUE,',
'       72 seq_no',
'FROM cust_price_list, cust_prod',
'WHERE cpl_bu = custp_bu(+)',
'  AND cpl_cust_id = custp_cust_id(+)',
'  AND cpl_prod_id = custp_prod_id(+)',
'  AND cpl_prod_rev = custp_prod_rev(+)',
'  AND cpl_bu = :global_bu',
'  AND SYSDATE > cpl_doc_date',
'  AND (custp_prod_flag = ''Y'' OR custp_prod_flag IS NULL)',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Open Sales Return'' name,',
'       COUNT(*) VALUE,',
'       73 seq_no',
'FROM sales_invoices_hd, sales_invoices_ln',
'WHERE sihd_bu = siln_bu',
'  AND sihd_plant = siln_plnt',
'  AND sihd_doc_no = siln_doc_no',
'  AND sihd_bu = :global_bu',
'  AND sihd_vou_type = ''CN''',
'  AND sihd_status = ''N''',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Expiry Stock (FG)'' name,',
'       COUNT(*) VALUE,',
'       74 seq_no',
'FROM LOT_SER_STOCKS_VW, products, classes',
'WHERE lssv_BU = :GLOBAL_bu',
'  AND lssv_bu = prod_bu',
'  AND lssv_prod_id = prod_id',
'  AND lssv_prod_rev = prod_rev',
'  AND prod_bu = class_bu',
'  AND prod_cls = class_id',
'  AND CLASS_TYPE = ''FG''',
'  AND LSS_DUE_DAYS <= 15',
'HAVING COUNT(*) > 0',
'UNION ALL',
'SELECT ''Stock Transfer GRN'' name,',
'       COUNT(*) VALUE,',
'       75 seq_no',
'FROM (SELECT porhh_bu, porhh_receipt_pfx, porhh_Receipt_no, porhh_receipt_date, act_inv_date',
'      FROM (SELECT porhh_bu, porhh_receipt_pfx, porhh_Receipt_no, porhh_receipt_date,',
'                   (SELECT sihd_inv_date',
'                    FROM sales_invoices_hd',
'                    WHERE sihd_bu = porlh_bu',
'                      AND sihd_inv_pfx = porlh_st_inv_pfx',
'                      AND sihd_inv_no = porlh_st_inv_no',
'					  AND sihd_bu = :GLOBAL_bu) act_inv_date',
'            FROM pur_ord_receipt_hd_hist, pur_ord_Receipt_ln_hist',
'            WHERE porhh_bu = porlh_bu',
'              AND porhh_receipt_no = porlh_receipt_no',
'			  AND porhh_bu = :GLOBAL_bu)',
'      GROUP BY porhh_bu, porhh_receipt_pfx, porhh_Receipt_no, porhh_receipt_date, act_inv_date)',
'WHERE TRUNC(porhh_Receipt_date) = TRUNC(act_inv_date)',
'HAVING COUNT(*) > 0)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5912917098533057671)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>430955262989446643
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5912917283364057673)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Notification'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5912917152050057672)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'SI. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5912917339826057674)
,p_db_column_name=>'VALUE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5987265648020924834)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5053039'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SEQ_NO:NAME:VALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611997832794411688)
,p_plug_name=>'Preferences'
,p_static_id=>'preferences'
,p_region_name=>'PRE'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.ROWID ROW_NUM ,',
'       up_user_id,',
'       appluser_user_type user_type,',
'       appluser_emp_id emp_id,',
'       TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name, ',
'       up_no_forms,',
'       up_mail,',
'       up_int_msg',
'  FROM user_preferences A,',
'       appl_users,',
'       employees',
' where appluser_bu      = up_bu',
'   AND appluser_bu      = emp_bu',
'   AND appluser_id      = up_user_id',
'   AND appluser_emp_id  = emp_emp_id',
'   AND up_bu            = :GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Preferences'
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
 p_id=>wwv_flow_imp.id(7613420248718438773)
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
 p_id=>wwv_flow_imp.id(7613420357098438774)
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
 p_id=>wwv_flow_imp.id(6971628343165328062)
,p_name=>'Action'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_link_target=>'javascript:$s(''P211130021_ROWID_PRE'',''&ROWID_PRE.'');apex.confirm("Do you want to Delete the document?",''DELETE_PRE'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7613419722775438768)
,p_name=>'EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(7613419938459438770)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6488223940049919954)
,p_name=>'ROWID_PRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_NUM'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612719206834800466)
,p_name=>'UP_INT_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UP_INT_MSG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Int. Msg'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612719123448800465)
,p_name=>'UP_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UP_MAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7612719031056800464)
,p_name=>'UP_NO_FORMS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UP_NO_FORMS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No Forms'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7611999986305411710)
,p_name=>'UP_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UP_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
 p_id=>wwv_flow_imp.id(7613419622800438767)
,p_name=>'USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_item_attributes=>'READONLY=READONLY'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:ERP Admin;R,Functional User;E,Role Based User;O,ESS User;U,POS User;P,Customer;C,Supplier;S'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7611999894174411709)
,p_internal_uid=>2130038058630800681
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
,p_download_formats=>'PDF:XLSX'
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7612724793038801208)
,p_interactive_grid_id=>wwv_flow_imp.id(7611999894174411709)
,p_static_id=>'10638779'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7612724984810801208)
,p_report_id=>wwv_flow_imp.id(7612724793038801208)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961883183611032)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7613420357098438774)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6548913497274942429)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6488223940049919954)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6994550443679561099)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6971628343165328062)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>56.999975
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7612725522069801213)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7611999986305411710)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7612729026024801247)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7612719031056800464)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7612730074338801255)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7612719123448800465)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7612730960119801262)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7612719206834800466)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64.7344
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613548217674497668)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7613419622800438767)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143.047
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613549139794497679)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7613419722775438768)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107.0469
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613677722288994857)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7613419938459438770)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166.047
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7613858469960175851)
,p_view_id=>wwv_flow_imp.id(7612724984810801208)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7613420248718438773)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7611997656122411686)
,p_plug_name=>'TAB_REGION'
,p_static_id=>'tab-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548870604010902245)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611998060075411690)
,p_button_name=>'ADD_MSG'
,p_static_id=>'add-msg'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548863074161902223)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611997977487411689)
,p_button_name=>'ADD_NOTIF'
,p_static_id=>'add-notif'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548855974904902198)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611997832794411688)
,p_button_name=>'ADD_PRE'
,p_static_id=>'add-pre'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548871375190902248)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611998060075411690)
,p_button_name=>'DOW_MSG'
,p_static_id=>'dow-msg'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548863896313902224)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7611997977487411689)
,p_button_name=>'DOW_NOTIF'
,p_static_id=>'dow-notif'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548856750814902207)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7611997832794411688)
,p_button_name=>'DOW_PRE'
,p_static_id=>'dow-pre'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548870983742902248)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7611998060075411690)
,p_button_name=>'SAVE_MSG'
,p_static_id=>'save-msg'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548863499731902224)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7611997977487411689)
,p_button_name=>'SAVE_NOTIF'
,p_static_id=>'save-notif'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548856382531902206)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7611997832794411688)
,p_button_name=>'SAVE_PRE'
,p_static_id=>'save-pre'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6971629134189328069)
,p_name=>'P211130021_ROWID_MSG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7611998060075411690)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6971628704325328065)
,p_name=>'P211130021_ROWID_NOTIF'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7611997977487411689)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6971628273526328061)
,p_name=>'P211130021_ROWID_PRE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7611997832794411688)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7611999642323411748)
,p_name=>'P211130021_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7611997656122411686)
,p_item_default=>'FAV'
,p_prompt=>':&nsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Favourites;FAV,Preferences;PRE,Notification;NOT'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6550742226069610031)
,p_tabular_form_region_id=>wwv_flow_imp.id(7611997832794411688)
,p_validation_name=>'UP_NO_FORMS'
,p_static_id=>'up-no-forms'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :UP_NO_FORMS < 0 THEN',
'   RETURN (''No Forms should not be negative.'');',
'END IF;',
'',
'IF :UP_NO_FORMS = 0 THEN',
'   RETURN (''No Forms should be greater than zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'UP_NO_FORMS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548877669067902324)
,p_name=>'ADD_MSG'
,p_static_id=>'add-msg'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548870604010902245)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548878183388902326)
,p_event_id=>wwv_flow_imp.id(6548877669067902324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_msg" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548874979051902320)
,p_name=>'ADD_NOTIF'
,p_static_id=>'add-notif'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548863074161902223)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548875465754902323)
,p_event_id=>wwv_flow_imp.id(6548874979051902320)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_notif" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548872431677902313)
,p_name=>'ADD_PRE'
,p_static_id=>'add-pre'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548855974904902198)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548872761801902315)
,p_event_id=>wwv_flow_imp.id(6548872431677902313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line_pre" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548879524456902326)
,p_name=>'DOW_MSG'
,p_static_id=>'dow-msg'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548871375190902248)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548879966679902329)
,p_event_id=>wwv_flow_imp.id(6548879524456902326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "MSG" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548876825040902324)
,p_name=>'DOW_NOTIF'
,p_static_id=>'dow-notif'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548863896313902224)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548877263523902324)
,p_event_id=>wwv_flow_imp.id(6548876825040902324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "NOT" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548874042211902318)
,p_name=>'DOW_PRE'
,p_static_id=>'dow-pre'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548856750814902207)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548874599301902320)
,p_event_id=>wwv_flow_imp.id(6548874042211902318)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "PRE" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548878623026902326)
,p_name=>'SAVE_MSG'
,p_static_id=>'save-msg'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548870983742902248)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548879038922902326)
,p_event_id=>wwv_flow_imp.id(6548878623026902326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "MSG" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548875934046902323)
,p_name=>'SAVE_NOTIF'
,p_static_id=>'save-notif'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548863499731902224)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548876345182902323)
,p_event_id=>wwv_flow_imp.id(6548875934046902323)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "NOT" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6548873220475902317)
,p_name=>'SAVE_PRE'
,p_static_id=>'save-pre'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548856382531902206)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6548873727336902317)
,p_event_id=>wwv_flow_imp.id(6548873220475902317)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "PRE" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6971627885459328057)
,p_name=>'TAB'
,p_static_id=>'tab'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211130021_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6971628052630328059)
,p_event_id=>wwv_flow_imp.id(6971627885459328057)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'MAIN_TAB',
  'items_to_submit', 'P211130021_TAB',
  'language', 'PLSQL',
  'plsql_code', ':MAIN_TAB := :P211130021_TAB;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6971627950724328058)
,p_event_id=>wwv_flow_imp.id(6971627885459328057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''FAV'': ''FAV'',',
    '  ''PRE'': ''PRE'',',
    '  ''NOT'': ''NOT'',',
    '  ''MSG'': ''MSG''',
    '};',
    '',
    'const selectedTab = $v("P211130021_TAB");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6550742261307610032)
,p_name=>'USER_TYPE'
,p_static_id=>'user-type'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7611997977487411689)
,p_triggering_element=>'USER_TYPE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'NAME'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6550742355315610033)
,p_event_id=>wwv_flow_imp.id(6550742261307610032)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'USER_TYPE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6550742483605610034)
,p_name=>'USER_TYPE_PREF'
,p_static_id=>'user-type-pref'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7611997832794411688)
,p_triggering_element=>'USER_TYPE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'USER_TYPE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6550742558738610035)
,p_event_id=>wwv_flow_imp.id(6550742483605610034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'USER_TYPE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6971628889552328067)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Internal_Msg delete'
,p_static_id=>'internal-msg-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:P211130021_ROWID_MSG);',
'',
'  DELETE ',
'    FROM USER_INTERNAL_MESSAGES_ASGMNT',
'   WHERE ROWID  = :P211130021_ROWID_MSG;',
'  ',
'  apex_application.g_print_success_message := ''<span>Deleted Successfully</span>'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_MSG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1489667054008717039
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6548871922809902248)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7611998060075411690)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Internal_Msg - Save Interactive Grid Data'
,p_static_id=>'internal-msg-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'	 UPDATE USER_INTERNAL_MESSAGES_ASGMNT  ',
'	    SET UIMA_BU        = :GLOBAL_bu,',
'		    UIMA_USER_ID   = :UIMA_USER_ID,',
'		    UIMA_MSG_ID    = :UIMA_MSG_ID,',
'		    UIMA_MSG_TYPE  = :UIMA_MSG_TYPE,',
'		    UIMA_REQ_FLAG  = :UIMA_REQ_FLAG,',
'		    UIMA_UPD_BY    = :GLOBAL_user,',
'		    UIMA_UPD_DATE  = SYSDATE',
'	  WHERE ROWID          = :ROWID_MSG;',
'',
'   IF SQL%FOUND THEN ',
'      apex_application.g_print_success_message := ''<span>Updated Successfully</span>'';',
'   END IF;',
'   ',
' ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'  DELETE ',
'    FROM USER_INTERNAL_MESSAGES_ASGMNT',
'   WHERE ROWID  = :ROWID_MSG;',
'  ',
'  apex_application.g_print_success_message := ''<span>Deleted Successfully</span>'';',
' END IF;	 ',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1066910087266291220
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6971628619676328064)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Notification delete'
,p_static_id=>'notification-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:P211130021_ROWID_NOTIF);',
'DELETE ',
'  FROM USER_NOTFN_ASGMNT',
' WHERE ROWID  = :ROWID_NOTIF;',
'',
'apex_application.g_print_success_message := ''<span>Deleted Successfully</span>'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_NOT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1489666784132717036
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6971628464167328063)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Preferences delete'
,p_static_id=>'preferences-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:P211130021_ROWID_PRE);',
'',
'   DELETE ',
'     FROM USER_PREFERENCES',
'    WHERE ROWID  = :P211130021_ROWID_PRE;',
'  ',
'  apex_application.g_print_success_message := ''<span>Deleted Successfully</span>'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_PRE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1489666628623717035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6548857284906902209)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7611997832794411688)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Preferences - Save Interactive Grid Data'
,p_static_id=>'preferences-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'IF :APEX$ROW_STATUS = ''U'' THEN',
'	 UPDATE USER_PREFERENCES  ',
'	    SET UP_BU       = :GLOBAL_bu,',
'		    UP_USER_ID   = :UP_USER_ID,',
'		    UP_MAIL	     = :UP_MAIL,',
'		    UP_INT_MSG   = :UP_INT_MSG,',
'		    UP_NO_FORMS  = :UP_NO_FORMS,',
'		    UP_UPD_BY    = :GLOBAL_user,',
'		    UP_UPD_DATE  = SYSDATE',
'      WHERE ROWID      = :ROWID_PRE;',
'',
'        -- raise_application_error(-20999,:UP_MAIL);',
'',
'   IF SQL%FOUND THEN ',
'      apex_application.g_print_success_message := ''<span>Updated Successfully</span>'';',
'   END IF;',
'   ',
' ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'  DELETE ',
'    FROM USER_PREFERENCES',
'   WHERE ROWID  = :ROWID_PRE;',
'  ',
'  apex_application.g_print_success_message := ''<span>Deleted Successfully</span>'';',
' END IF;	 ',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1066895449363291181
);
wwv_flow_imp.component_end;
end;
/
