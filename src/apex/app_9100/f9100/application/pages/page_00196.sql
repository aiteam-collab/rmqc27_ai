prompt --application/pages/page_00196
begin
--   Manifest
--     PAGE: 00196
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
 p_id=>196
,p_name=>'Mobile App Access'
,p_alias=>'MOBILE-APP-ACCESS'
,p_step_title=>'Mobile App Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#F {',
'color: #ff0000;',
'background-color: #ffffff;',
'}',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color:  #ffffff',
'};',
'',
'/* #addbtn{',
'color: blue;',
'background-color:  #ffffff',
'};',
'',
'#savebtn{',
'         color: green;',
'         background-color:  #ffffff;',
'} */',
'/* #cancelbtn{',
'           color: rgb(214, 19, 29);',
'           background-color:  #ffffff;',
'} */',
'',
'/* #cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'            color: rgb(214, 19, 29);',
'            background-color:  #ffffff;',
'} */',
'',
'',
'',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: #ffffff;',
'',
'',
' /* a {',
'    color: #337AC0;',
' } */',
'/* ',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'} */'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12784541328297166833)
,p_plug_name=>'Mobile App'
,p_static_id=>'mobile-app'
,p_title=>'Find Mobile App Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:t-Form--slimPadding:margin-bottom-none'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P196_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9463800017640043180)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11733270740506707426)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT a.rowid AS row_id,',
'       a.maahd_bu,',
'       a.maahd_doc_no,',
'       TO_CHAR(a.maahd_doc_date,''DD-MM-RRRR'') AS maahd_doc_date,',
'       maahd_user_id,',
'       TO_CHAR(maaln_eff_from,''DD-MM-RRRR'') AS maaln_eff_from,',
'       TO_CHAR(maaln_eff_to,''DD-MM-RRRR'') AS maaln_eff_to,',
'       DECODE(a.maahd_type,''A'',''Add Bus. Fun.'',''R'',''Remove Bus. Fun.'')maahd_type,',
'       DECODE(a.maahd_status,''N'',''Draft'',''P'',''Posted'',''C'',''Cancelled'')maahd_status,',
'       DECODE(a.maahd_status,''N'',''Blue'',''P'',''Green'',''C'',''Red'')color,',
'       a.maahd_ref,',
'       DECODE(b.maaln_mobile,''AA'',''Approvals App'',''EA'',''ESS App'',''PA'',''Production App'',''QA'',''Quality App'',''PM'',''Plant Maintenance App'',''CA'',''CRM App'',''FA'',''Field Visit App'',''IA'',''Inventory App'') AS maaln_mobile',
'  FROM mobile_app_access_hd a,',
'       mobile_app_access_ln b',
' WHERE a.maahd_bu       = :GLOBAL_bu',
'   AND a.maahd_bu       = b.maaln_bu (+)',
'   AND a.maahd_doc_no   = b.maaln_doc_no (+)',
'   AND (a.maahd_user_id = :P196_USER_ID OR :P196_USER_ID IS NULL)',
'   AND (b.maaln_mobile  = :P196_MOBILE_APP OR :P196_MOBILE_APP IS NULL)',
'   AND (a.maahd_doc_no  = :P196_DOC_NO OR :P196_DOC_NO IS NULL)',
'   AND (a.maahd_type    = :P196_DOC_TYPE OR :P196_DOC_TYPE IS NULL)',
'   AND (a.maahd_status  = :P196_STATUS OR :P196_STATUS IS NULL)',
'   AND :P196_SHOW_DATA  = ''Y''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P196_USER_ID,P196_MOBILE_APP,P196_DOC_NO,P196_DOC_TYPE,P196_STATUS,P196_SHOW_DATA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(11733270837665707427)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>6253749853880787225
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7375940473623043909)
,p_db_column_name=>'COLOR'
,p_display_order=>160
,p_column_identifier=>'BF'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991673972798103004)
,p_db_column_name=>'MAAHD_BU'
,p_display_order=>200
,p_column_identifier=>'BJ'
,p_column_label=>'Maahd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674169546103006)
,p_db_column_name=>'MAAHD_DOC_DATE'
,p_display_order=>220
,p_column_identifier=>'BL'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991673986743103005)
,p_db_column_name=>'MAAHD_DOC_NO'
,p_display_order=>210
,p_column_identifier=>'BK'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.::P197_ROWID:#ROW_ID#'
,p_column_linktext=>'#MAAHD_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674759509103012)
,p_db_column_name=>'MAAHD_REF'
,p_display_order=>280
,p_column_identifier=>'BR'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674637879103011)
,p_db_column_name=>'MAAHD_STATUS'
,p_display_order=>270
,p_column_identifier=>'BQ'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#MAAHD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674530872103010)
,p_db_column_name=>'MAAHD_TYPE'
,p_display_order=>260
,p_column_identifier=>'BP'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674257358103007)
,p_db_column_name=>'MAAHD_USER_ID'
,p_display_order=>230
,p_column_identifier=>'BM'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674297513103008)
,p_db_column_name=>'MAALN_EFF_FROM'
,p_display_order=>240
,p_column_identifier=>'BN'
,p_column_label=>'Eff. From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6991674385075103009)
,p_db_column_name=>'MAALN_EFF_TO'
,p_display_order=>250
,p_column_identifier=>'BO'
,p_column_label=>'Eff. To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6999607834380853303)
,p_db_column_name=>'MAALN_MOBILE'
,p_display_order=>290
,p_column_identifier=>'BS'
,p_column_label=>'App'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7375942830768043932)
,p_db_column_name=>'ROW_ID'
,p_display_order=>190
,p_column_identifier=>'BI'
,p_column_label=>'Row Id'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11734796619667714292)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10533053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MAAHD_DOC_NO:MAAHD_DOC_DATE:MAAHD_USER_ID:MAALN_MOBILE:MAALN_EFF_FROM:MAALN_EFF_TO:MAAHD_TYPE:MAAHD_STATUS:MAAHD_REF'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6991702323955114756)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:167::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7021044026849182904)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:167::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6991701935875114755)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6991703089942114758)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_button_name=>'Filter'
,p_static_id=>'filter'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6991702760764114756)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7375951504752044002)
,p_name=>'P196_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FIND_MOBILE_TYPE'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
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
  'title', 'Select the Bus. Fun.',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8489012935675961751)
,p_name=>'P196_DOC_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(8980911990271908597)
,p_name=>'P196_MOBILE_APP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mobile App'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Approvals App;AA,ESS App;EA,Production App;PA,Quality App;QA,Plant Maintenance App;PM,CRM App;CA,Field Visit App;FA,Inventory App;IA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9463879238239043629)
,p_name=>'P196_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9463800017640043180)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8542314217966139088)
,p_name=>'P196_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9463800017640043180)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8553032302874487748)
,p_name=>'P196_SHOW_DATA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8489013078399961753)
,p_name=>'P196_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8973478345875565146)
,p_name=>'P196_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12784541328297166833)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_MOBILE_USER'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
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
  'title', 'Select the User',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991718204825114792)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991718690089114792)
,p_event_id=>wwv_flow_imp.id(6991718204825114792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P196_USER_NAME,P196_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P196_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P196_USER_NAME = :P196_APPLUSER_ID THEN',
    '	    raise_application_error(-20999,''From and To Username should not be same.'');',
    '   END IF;',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id = :P196_USER_NAME;',
    '	 	     ',
    '	 	     cr1       c1%ROWTYPE;',
    '	 	     	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '                  raise_application_error(-20999,''User not found.'');',
    '	 	     ELSE',
    '	 	     	  ',
    '	 	     	  IF cr1.appluser_status IN (''N'', ''D'') THEN',
    '	 	     	  	 raise_application_error(-20999,''User not in active status.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     	  IF TRUNC(SYSDATE) NOT BETWEEN TRUNC(cr1.appluser_eff_from) AND TRUNC(cr1.appluser_eff_to) THEN',
    '	 	     	  	 raise_application_error(-20999,''Check To User Eff. From and Eff. To.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991711393565114789)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6991703089942114758)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991712436319114789)
,p_event_id=>wwv_flow_imp.id(6991711393565114789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_USER_ID,P196_MOBILE_APP,P196_DOC_TYPE,P196_STATUS,P196_SHOW_DATA,P196_DOC_NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991711907844114789)
,p_event_id=>wwv_flow_imp.id(6991711393565114789)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11733270740506707426)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991716790950114792)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>260
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991717353300114792)
,p_event_id=>wwv_flow_imp.id(6991716790950114792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_USER_ID,P196_MOBILE_APP,P196_DOC_TYPE,P196_STATUS,P196_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991717849960114792)
,p_event_id=>wwv_flow_imp.id(6991716790950114792)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").hide();',
    'apex.item("find").show();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P196_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991713224363114791)
,p_name=>'EMP_NAME'
,p_static_id=>'emp-name'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991713764116114791)
,p_event_id=>wwv_flow_imp.id(6991713224363114791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT EMP_FIRST_NAME1 INTO :P196_EMP_NAME FROM EMPLOYEES',
    'WHERE EMP_BU = :GLOBAL_BU',
    'AND EMP_EMP_ID = :P196_APPLUSER_PARTY_ID;',
    '',
    'EXCEPTION WHEN no_data_found then',
    'NULL;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991708601180114787)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991709160794114787)
,p_event_id=>wwv_flow_imp.id(6991708601180114787)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P196_APPLUSER_PW_EXP_DAYS,P196_APPLUSER_PW_EXP_DAYS_1',
  'items_to_submit', 'P196_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P196_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P196_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P196_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991707229791114786)
,p_name=>'P196_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p196-appluser-pw-exp-rqrd'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P196_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991707771707114786)
,p_event_id=>wwv_flow_imp.id(6991707229791114786)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991708276885114787)
,p_event_id=>wwv_flow_imp.id(6991707229791114786)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991712868361114789)
,p_name=>'P69_FAVOURITE_FLAG'
,p_static_id=>'p69-favourite-flag'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_FAVOURITE_FLAG'
,p_condition_element=>'P196_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991714168532114791)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991714613168114791)
,p_event_id=>wwv_flow_imp.id(6991714168532114791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P196_APPLUSER_PASSWORD',
  'items_to_submit', 'P196_APPLUSER_ID,P196_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P196_APPLUSER_PASSWORD := func_get_hash(:P196_APPLUSER_ID,:P196_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991715976698114792)
,p_name=>'Password_Expiry_Dtls'
,p_static_id=>'password-expiry-dtls'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991716444068114792)
,p_event_id=>wwv_flow_imp.id(6991715976698114792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P196_APPLUSER_PW_EXP_RQRD").hide();',
    'apex.item( "P196_APPLUSER_PW_EXP_DAYS" ).hide();',
    'apex.item( "P196_APPLUSER_PWD_EXP_DUE" ).hide();',
    'apex.item( "P196_APPLUSER_PW_LUD" ).hide();',
    '$x_Hide("hide");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991715048815114791)
,p_name=>'POS/DEPT/CUS/SUP'
,p_static_id=>'pos-dept-cus-sup'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_APPLUSER_PARTY_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991715565780114791)
,p_event_id=>wwv_flow_imp.id(6991715048815114791)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P196_APPLUSER_POS_ID,P196_APPLUSER_DEPT_ID,P196_APPLUSER_EMP_ID,P196_APPLUSER_SUPLR_ID,P196_APPLUSER_CUST_ID,P196_EMP_NAME,P196_DEPARTMENT_NAME,P196_POSITION,P196_APPLUSER_EMAIL_ID,P196_APPLUSER_MOBILE_NO',
  'items_to_submit', 'P196_APPLUSER_ID,P196_APPLUSER_USER_TYPE,P196_APPLUSER_PARTY_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P196_APPLUSER_PARTY_ID IS NOT NULL AND :P196_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P196_APPLUSER_PARTY_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c4',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P196_APPLUSER_USER_TYPE AND appluser_emp_id = :P196_APPLUSER_PARTY_ID AND appluser_status NOT IN (''D'');	     ',
    '	 	     cr4 c4%ROWTYPE; 	  ',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%NOTFOUND THEN',
    '	 	     RAISE_APPLICATION_ERROR(-20999,''Employee not found.'');',
    '	 	     ELSE',
    '              ',
    ':P196_APPLUSER_EMP_ID := cr1.emp_emp_id;:P196_APPLUSER_POS_ID :=cr1.empai_pos_id;:P196_EMP_NAME:=cr1.emp_name;:P196_APPLUSER_DEPT_ID :=cr1.empai_dept_id; :P196_POSITION:=cr1.pos_name;:P196_APPLUSER_MOBILE_NO :=cr1.emp_mobile_no;:P196_DEPARTMENT_NAME '
||':=cr1.dept_name;:P196_APPLUSER_EMAIL_ID :=cr1.emp_email_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P196_APPLUSER_PARTY_ID IS NOT NULL AND :P196_APPLUSER_USER_TYPE IN (''C'') THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P196_APPLUSER_PARTY_ID',
    '             AND SUPLR_CUST_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT * FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P196_APPLUSER_ID AND appluser_cust_id = :P196_APPLUSER_PARTY_ID; ',
    '	 	     cr2	c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Customer not found.'');',
    '	 	     ELSE',
    '	 	     	  OPEN c2;',
    '	 	     	  FETCH c2 INTO cr2;',
    '	 	     	     IF c2%FOUND THEN',
    '	 	     	     	  RAISE_APPLICATION_ERROR(-20999,''Customer already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P196_EMP_NAME             := cr1.suplr_name1;',
    ':P196_APPLUSER_CUST_ID		:= cr1.suplr_suplr_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P196_APPLUSER_PARTY_ID IS NOT NULL AND :P196_APPLUSER_USER_TYPE IN (''S'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P196_APPLUSER_PARTY_ID',
    '             AND SUPLR_SUPLR_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id <> :P196_APPLUSER_ID',
    '	 	     AND appluser_suplr_id = :P196_APPLUSER_PARTY_ID;     ',
    '	 	     cr2													c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Supplier not found.'');',
    'ELSE',
    '	OPEN c2;',
    '	FETCH c2 INTO cr2;     	     ',
    '	IF c2%FOUND THEN',
    '		RAISE_APPLICATION_ERROR(-20999,''Supplier already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P196_EMP_NAME :=cr1.suplr_name1;',
    ':P196_APPLUSER_SUPLR_ID		:= cr1.suplr_suplr_id;  ',
    '	 	     END IF;  CLOSE c1;	    END;  END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991706306475114783)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P196_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991706805682114786)
,p_event_id=>wwv_flow_imp.id(6991706306475114783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P196_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P196_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P196_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P196_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P196_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P196_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6991709501692114787)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6991702760764114756)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991710542694114789)
,p_event_id=>wwv_flow_imp.id(6991709501692114787)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// apex.item("find").hide();',
    'apex.item("detail").show();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P196_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991709994997114789)
,p_event_id=>wwv_flow_imp.id(6991709501692114787)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11733270740506707426)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6991711074354114789)
,p_event_id=>wwv_flow_imp.id(6991709501692114787)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P196_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6991705911348114781)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P196_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P196_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1512184927563194579
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6991705495226114781)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P196_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P196_DEPARTMENT_NAME , :P196_POSITION, :P196_PASSWORD ,:P196_APPLUSER_PW_EXP_DAYS_1,:P196_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P196_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1512184511441194579
);
wwv_flow_imp.component_end;
end;
/
