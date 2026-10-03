prompt --application/pages/page_00104
begin
--   Manifest
--     PAGE: 00104
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
 p_id=>104
,p_name=>'&nbsp;'
,p_alias=>'DASHBOARD-ACCESS'
,p_step_title=>'Notification Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   top: -1px;',
' }',
' ',
' #savebtn{',
'        color: green;',
'        background-color: #ffffff;',
'}',
'',
'#cancelbtn{',
'        color: rgb(214, 19, 29);',
'        background-color: #ffffff;',
'}',
'',
'#addbtn{',
'        color: blue;',
'        background-color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15609165409479207882)
,p_plug_name=>'Notification Access'
,p_static_id=>'notification-access'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUDAH_BU,',
'       WUDAH_DOC_NO,',
'       DECODE(WUDAH_TYPE,''A'',''Add'',''M'',''Modify'')WUDAH_TYPE,',
'       WUDAH_REF,',
'       DECODE(WUDAH_STATUS,''N'',''Draft'',''E'',''Entry Completed'',''P'',''Posted'') WUDAH_STATUS,',
'       DECODE(WUDAH_STATUS,''N'',''blue'',''E'',''orange'',''P'',''green'') WUDAH_STATUS_COLOR,',
'       WUDAH_CRE_BY,',
'       WUDAH_CRE_IP_ADDR,',
'       WUDAH_CRE_OS_USER,',
'       WUDAH_CRE_EMP_ID,',
'       TO_CHAR(WUDAH_CRE_DATE,''DD-MM-RRRR HH12:MI pm'') WUDAH_CRE_DATE,',
'       WUDAH_UPD_BY,',
'       WUDAH_UPD_IP_ADDR,',
'       WUDAH_UPD_OS_USER,',
'       WUDAH_UPD_EMP_ID,',
'       WUDAH_UPD_DATE,',
'       WUDAH_DOC_DATE',
'  from WAPL_USER_DABHBOARD_ACCS_HD',
' where WUDAH_BU     = :GLOBAL_BU',
'   and WUDAH_STATUS <> ''L''',
'   and (WUDAH_DOC_NO = :P104_WUDAH_DOC_NO or :P104_WUDAH_DOC_NO is null)',
'   and (WUDAH_TYPE   = :P104_WUDAH_TYPE   or :P104_WUDAH_TYPE   is null)',
'   and (WUDAH_STATUS = :P104_WUDAH_STATUS or :P104_WUDAH_STATUS is null)',
'   and (WUDAH_CRE_BY = :P104_WUDAH_CRE_BY or :P104_WUDAH_CRE_BY is null)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P104_WUDAH_DOC_NO,P104_WUDAH_CRE_BY,P104_WUDAH_TYPE,P104_WUDAH_STATUS,P104_SHOW_DATA'
,p_prn_page_header=>'Dashboard Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15609165426789207882)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>10127203591245596854
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609187194896228736)
,p_db_column_name=>'ROWID'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609165864588207968)
,p_db_column_name=>'WUDAH_BU'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Wudah Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609167916647207977)
,p_db_column_name=>'WUDAH_CRE_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5615041822406521877)
,p_db_column_name=>'WUDAH_CRE_DATE'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609169089636207979)
,p_db_column_name=>'WUDAH_CRE_EMP_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Wudah Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609168304793207977)
,p_db_column_name=>'WUDAH_CRE_IP_ADDR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Wudah Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609168722951207979)
,p_db_column_name=>'WUDAH_CRE_OS_USER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wudah Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609187000323228734)
,p_db_column_name=>'WUDAH_DOC_DATE'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609166236133207974)
,p_db_column_name=>'WUDAH_DOC_NO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Doc. No'
,p_column_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.::P108_ROWID:#ROWID#'
,p_column_linktext=>'#WUDAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609167047342207976)
,p_db_column_name=>'WUDAH_REF'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609167510290207977)
,p_db_column_name=>'WUDAH_STATUS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#WUDAH_STATUS_COLOR#; font-weight:bold;">#WUDAH_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609187039676228735)
,p_db_column_name=>'WUDAH_STATUS_COLOR'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Wudah Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609166662034207976)
,p_db_column_name=>'WUDAH_TYPE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609169913172207981)
,p_db_column_name=>'WUDAH_UPD_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Wudah Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609171437114207982)
,p_db_column_name=>'WUDAH_UPD_DATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Wudah Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609171069208207982)
,p_db_column_name=>'WUDAH_UPD_EMP_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Wudah Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609170263843207981)
,p_db_column_name=>'WUDAH_UPD_IP_ADDR'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Wudah Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15609170682368207982)
,p_db_column_name=>'WUDAH_UPD_OS_USER'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Wudah Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15609173458721210348)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'24929493'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUDAH_DOC_NO:WUDAH_TYPE:WUDAH_REF:WUDAH_STATUS:WUDAH_CRE_BY:WUDAH_CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5651859672884026330)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>'Find Notification Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5729961983411086772)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8026750488448590107)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15609165409479207882)
,p_button_name=>'Add'
,p_static_id=>'add-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5651860335798026337)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5651860460275026338)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5651860306587026336)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5651860174097026335)
,p_name=>'P104_SHOW_DATA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5651860058192026334)
,p_name=>'P104_WUDAH_CRE_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_prompt=>'Created By'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wudah_cre_by',
'  FROM wapl_user_dabhboard_accs_hd',
' WHERE wudah_bu = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
  'title', 'Select the Created By',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5651859768784026331)
,p_name=>'P104_WUDAH_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wudah_doc_no',
'  FROM wapl_user_dabhboard_accs_hd',
' WHERE wudah_bu = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
  'title', 'Select the Doc. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5651860021702026333)
,p_name=>'P104_WUDAH_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5651859924262026332)
,p_name=>'P104_WUDAH_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5651859672884026330)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add;A,Modify;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5651860576772026339)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5651860335798026337)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651860725243026340)
,p_event_id=>wwv_flow_imp.id(5651860576772026339)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_WUDAH_DOC_NO,P104_WUDAH_CRE_BY,P104_WUDAH_TYPE,P104_WUDAH_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651860767348026341)
,p_event_id=>wwv_flow_imp.id(5651860576772026339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5651860850802026342)
,p_name=>'FIND'
,p_static_id=>'find'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5651860306587026336)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651861215456026345)
,p_event_id=>wwv_flow_imp.id(5651860850802026342)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651861282115026346)
,p_event_id=>wwv_flow_imp.id(5651860850802026342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15609165409479207882)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651861009509026343)
,p_event_id=>wwv_flow_imp.id(5651860850802026342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5651861375118026347)
,p_name=>'LOAD'
,p_static_id=>'load'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651861523552026348)
,p_event_id=>wwv_flow_imp.id(5651861375118026347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P104_WUDAH_DOC_NO,P104_WUDAH_CRE_BY,P104_WUDAH_TYPE,P104_WUDAH_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5651861548188026349)
,p_event_id=>wwv_flow_imp.id(5651861375118026347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P104_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp.component_end;
end;
/
