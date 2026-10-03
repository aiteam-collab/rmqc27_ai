prompt --application/pages/page_00166
begin
--   Manifest
--     PAGE: 00166
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
 p_id=>166
,p_name=>'ESS Bus. Fun. Access'
,p_alias=>'ESS-BUS-FUN-ACCESS'
,p_step_title=>'ESS Bus. Fun. Access'
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
'#SEARCH{',
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
'#SEARCH{',
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
 p_id=>wwv_flow_imp.id(11272367380976972346)
,p_plug_name=>'Create Users'
,p_static_id=>'create-users'
,p_title=>'Find Bus. Fun. Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P166_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7951626070319848693)
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
 p_id=>wwv_flow_imp.id(10221096793186512939)
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
'       a.ebfah_bu,',
'       a.ebfah_doc_no,',
'       TO_CHAR(a.ebfah_doc_date,''DD-MM-RRRR'')ebfah_doc_date,',
'       ebfah_user_id,',
'       TO_CHAR(a.ebfah_eff_from,''DD-MM-RRRR'')ebfah_eff_from,',
'       TO_CHAR(a.ebfah_eff_to,''DD-MM-RRRR'')ebfah_eff_to,',
'       DECODE(a.ebfah_type,''A'',''Add Bus. Fun.'',''R'',''Remove Bus. Fun.'')ebfah_type,',
'       a.ebfah_appr_by,',
'       a.ebfah_appr_date,',
'       DECODE(a.ebfah_status,''N'',''Draft'',''P'',''Posted'',''L'',''Cancelled'')ebfah_status,',
'       DECODE(a.ebfah_status,''N'',''Blue'',''P'',''Green'',''L'',''Red'')color,',
'       a.ebfah_reference,',
'       b.ebfal_bus_fun_id,',
'       b.ebfal_bus_fun_name',
'  FROM ess_bu_fun_access_hd a,',
'       ess_bu_fun_access_ln b',
' WHERE a.ebfah_bu = :GLOBAL_bu',
'   AND a.ebfah_bu = b.ebfal_bu',
'   AND a.ebfah_doc_no = b.ebfal_doc_no',
'   AND (a.ebfah_user_id  = :P166_USER_ID OR :P166_USER_ID IS NULL)',
'   AND (a.ebfah_type     = :P166_DOC_TYPE OR :P166_DOC_TYPE IS NULL)',
'   AND (a.ebfah_status   = :P166_STATUS OR :P166_STATUS IS NULL)',
'   AND (b.ebfal_bus_fun_id = :P166_BUS_FUN_ID OR :P166_BUS_FUN_ID IS NULL)',
'   AND (a.ebfah_doc_no = :P166_DOC_NO OR :P166_DOC_NO IS NULL)',
'   AND :P166_SHOW_DATA = ''Y''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P166_USER_ID,P166_BUS_FUN_ID,P166_DOC_TYPE,P166_STATUS,P166_SHOW_DATA,P166_DOC_NO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10221096890345512940)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4741575906560592738
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863766526302849422)
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
 p_id=>wwv_flow_imp.id(5863765850205849415)
,p_db_column_name=>'EBFAH_APPR_BY'
,p_display_order=>90
,p_column_identifier=>'AY'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765944935849416)
,p_db_column_name=>'EBFAH_APPR_DATE'
,p_display_order=>100
,p_column_identifier=>'AZ'
,p_column_label=>'Approved Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765142125849408)
,p_db_column_name=>'EBFAH_BU'
,p_display_order=>20
,p_column_identifier=>'AR'
,p_column_label=>'Ebfah Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863766261365849419)
,p_db_column_name=>'EBFAH_DOC_DATE'
,p_display_order=>130
,p_column_identifier=>'BC'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765208735849409)
,p_db_column_name=>'EBFAH_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'AS'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.::P167_ROWID:#ROW_ID##ROWID#'
,p_column_linktext=>'#EBFAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863766356137849420)
,p_db_column_name=>'EBFAH_EFF_FROM'
,p_display_order=>140
,p_column_identifier=>'BD'
,p_column_label=>'Eff. From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863766417167849421)
,p_db_column_name=>'EBFAH_EFF_TO'
,p_display_order=>150
,p_column_identifier=>'BE'
,p_column_label=>'Eff. To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863766102201849418)
,p_db_column_name=>'EBFAH_REFERENCE'
,p_display_order=>120
,p_column_identifier=>'BB'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765986486849417)
,p_db_column_name=>'EBFAH_STATUS'
,p_display_order=>110
,p_column_identifier=>'BA'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#EBFAH_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765686301849414)
,p_db_column_name=>'EBFAH_TYPE'
,p_display_order=>80
,p_column_identifier=>'AX'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863765436038849411)
,p_db_column_name=>'EBFAH_USER_ID'
,p_display_order=>50
,p_column_identifier=>'AU'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863768673722849443)
,p_db_column_name=>'EBFAL_BUS_FUN_ID'
,p_display_order=>170
,p_column_identifier=>'BG'
,p_column_label=>'Bus. Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863768710883849444)
,p_db_column_name=>'EBFAL_BUS_FUN_NAME'
,p_display_order=>180
,p_column_identifier=>'BH'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5863768883447849445)
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
 p_id=>wwv_flow_imp.id(10222622672347519805)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10533053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EBFAH_DOC_NO:EBFAH_DOC_DATE:EBFAH_USER_ID:EBFAL_BUS_FUN_ID:EBFAL_BUS_FUN_NAME:EBFAH_TYPE:EBFAH_EFF_FROM:EBFAH_EFF_TO:EBFAH_APPR_BY:EBFAH_APPR_DATE:EBFAH_REFERENCE:EBFAH_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863030194387567959)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11272367380976972346)
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
,p_button_redirect_url=>'f?p=&APP_ID.:177:&SESSION.::&DEBUG.:167::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863031392734567961)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11272367380976972346)
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
 p_id=>wwv_flow_imp.id(5863031036340567959)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11272367380976972346)
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
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863030585419567959)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11272367380976972346)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'SEARCH'
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
 p_id=>wwv_flow_imp.id(7468729430231714041)
,p_name=>'P166_BUS_FUN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Bus. Fun. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FIND_ESS_BUS_FUN_LOV'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P166_USER_ID'
,p_ajax_items_to_submit=>'P166_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(5863768944711849446)
,p_name=>'P166_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FIND_ESS_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6976830375635767195)
,p_name=>'P166_DOC_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
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
 p_id=>wwv_flow_imp.id(7951704782477849106)
,p_name=>'P166_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7951626070319848693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7030139762204944565)
,p_name=>'P166_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7951626070319848693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7040849742834293192)
,p_name=>'P166_SHOW_DATA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6976830518359767197)
,p_name=>'P166_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
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
 p_id=>wwv_flow_imp.id(7461295785835370590)
,p_name=>'P166_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11272367380976972346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FIND_ESS_USER_LOV'
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
 p_id=>wwv_flow_imp.id(5863040471736567981)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863040893297567981)
,p_event_id=>wwv_flow_imp.id(5863040471736567981)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P166_USER_NAME,P166_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P166_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P166_USER_NAME = :P166_APPLUSER_ID THEN',
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
    '	 	     AND appluser_id = :P166_USER_NAME;',
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
 p_id=>wwv_flow_imp.id(5863046449223567984)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5863031036340567959)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863046953041567984)
,p_event_id=>wwv_flow_imp.id(5863046449223567984)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P166_USER_ID,P166_BUS_FUN_ID,P166_DOC_TYPE,P166_STATUS,P166_SHOW_DATA,P166_DOC_NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863047417447567984)
,p_event_id=>wwv_flow_imp.id(5863046449223567984)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10221096793186512939)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863053034872567987)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>260
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863053503616567987)
,p_event_id=>wwv_flow_imp.id(5863053034872567987)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P166_USER_ID,P166_BUS_FUN_ID,P166_DOC_TYPE,P166_STATUS,P166_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863054052890567987)
,p_event_id=>wwv_flow_imp.id(5863053034872567987)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").hide();',
    'apex.item("find").show();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P166_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863039541205567980)
,p_name=>'EMP_NAME'
,p_static_id=>'emp-name'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863040039125567980)
,p_event_id=>wwv_flow_imp.id(5863039541205567980)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT EMP_FIRST_NAME1 INTO :P166_EMP_NAME FROM EMPLOYEES',
    'WHERE EMP_BU = :GLOBAL_BU',
    'AND EMP_EMP_ID = :P166_APPLUSER_PARTY_ID;',
    '',
    'EXCEPTION WHEN no_data_found then',
    'NULL;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863043597315567983)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863044155970567983)
,p_event_id=>wwv_flow_imp.id(5863043597315567983)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P166_APPLUSER_PW_EXP_DAYS,P166_APPLUSER_PW_EXP_DAYS_1',
  'items_to_submit', 'P166_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P166_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P166_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P166_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863042193859567981)
,p_name=>'P166_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p166-appluser-pw-exp-rqrd'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P166_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863042782199567981)
,p_event_id=>wwv_flow_imp.id(5863042193859567981)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P166_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863043221704567981)
,p_event_id=>wwv_flow_imp.id(5863042193859567981)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P166_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863047842974567984)
,p_name=>'P69_FAVOURITE_FLAG'
,p_static_id=>'p69-favourite-flag'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_FAVOURITE_FLAG'
,p_condition_element=>'P166_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863038602651567980)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863039094677567980)
,p_event_id=>wwv_flow_imp.id(5863038602651567980)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P166_APPLUSER_PASSWORD',
  'items_to_submit', 'P166_APPLUSER_ID,P166_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P166_APPLUSER_PASSWORD := func_get_hash(:P166_APPLUSER_ID,:P166_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863037690507567980)
,p_name=>'Password_Expiry_Dtls'
,p_static_id=>'password-expiry-dtls'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863038230927567980)
,p_event_id=>wwv_flow_imp.id(5863037690507567980)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P166_APPLUSER_PW_EXP_RQRD").hide();',
    'apex.item( "P166_APPLUSER_PW_EXP_DAYS" ).hide();',
    'apex.item( "P166_APPLUSER_PWD_EXP_DUE" ).hide();',
    'apex.item( "P166_APPLUSER_PW_LUD" ).hide();',
    '$x_Hide("hide");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863036785518567977)
,p_name=>'POS/DEPT/CUS/SUP'
,p_static_id=>'pos-dept-cus-sup'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_APPLUSER_PARTY_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863037323871567980)
,p_event_id=>wwv_flow_imp.id(5863036785518567977)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P166_APPLUSER_POS_ID,P166_APPLUSER_DEPT_ID,P166_APPLUSER_EMP_ID,P166_APPLUSER_SUPLR_ID,P166_APPLUSER_CUST_ID,P166_EMP_NAME,P166_DEPARTMENT_NAME,P166_POSITION,P166_APPLUSER_EMAIL_ID,P166_APPLUSER_MOBILE_NO',
  'items_to_submit', 'P166_APPLUSER_ID,P166_APPLUSER_USER_TYPE,P166_APPLUSER_PARTY_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P166_APPLUSER_PARTY_ID IS NOT NULL AND :P166_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P166_APPLUSER_PARTY_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c4',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P166_APPLUSER_USER_TYPE AND appluser_emp_id = :P166_APPLUSER_PARTY_ID AND appluser_status NOT IN (''D'');	     ',
    '	 	     cr4 c4%ROWTYPE; 	  ',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%NOTFOUND THEN',
    '	 	     RAISE_APPLICATION_ERROR(-20999,''Employee not found.'');',
    '	 	     ELSE',
    '              ',
    ':P166_APPLUSER_EMP_ID := cr1.emp_emp_id;:P166_APPLUSER_POS_ID :=cr1.empai_pos_id;:P166_EMP_NAME:=cr1.emp_name;:P166_APPLUSER_DEPT_ID :=cr1.empai_dept_id; :P166_POSITION:=cr1.pos_name;:P166_APPLUSER_MOBILE_NO :=cr1.emp_mobile_no;:P166_DEPARTMENT_NAME '
||':=cr1.dept_name;:P166_APPLUSER_EMAIL_ID :=cr1.emp_email_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P166_APPLUSER_PARTY_ID IS NOT NULL AND :P166_APPLUSER_USER_TYPE IN (''C'') THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P166_APPLUSER_PARTY_ID',
    '             AND SUPLR_CUST_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT * FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P166_APPLUSER_ID AND appluser_cust_id = :P166_APPLUSER_PARTY_ID; ',
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
    ':P166_EMP_NAME             := cr1.suplr_name1;',
    ':P166_APPLUSER_CUST_ID		:= cr1.suplr_suplr_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P166_APPLUSER_PARTY_ID IS NOT NULL AND :P166_APPLUSER_USER_TYPE IN (''S'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P166_APPLUSER_PARTY_ID',
    '             AND SUPLR_SUPLR_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id <> :P166_APPLUSER_ID',
    '	 	     AND appluser_suplr_id = :P166_APPLUSER_PARTY_ID;     ',
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
    ':P166_EMP_NAME :=cr1.suplr_name1;',
    ':P166_APPLUSER_SUPLR_ID		:= cr1.suplr_suplr_id;  ',
    '	 	     END IF;  CLOSE c1;	    END;  END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863041358338567981)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P166_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863041855984567981)
,p_event_id=>wwv_flow_imp.id(5863041358338567981)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P166_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P166_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P166_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P166_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P166_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P166_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5863044520447567983)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5863030585419567959)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863046045214567984)
,p_event_id=>wwv_flow_imp.id(5863044520447567983)
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
,p_client_condition_element=>'P166_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863045572877567983)
,p_event_id=>wwv_flow_imp.id(5863044520447567983)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10221096793186512939)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5863045063206567983)
,p_event_id=>wwv_flow_imp.id(5863044520447567983)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P166_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863036314348567977)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P166_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P166_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>383515330563647775
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863035946136567977)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P166_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P166_DEPARTMENT_NAME , :P166_POSITION, :P166_PASSWORD ,:P166_APPLUSER_PW_EXP_DAYS_1,:P166_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P166_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>383514962351647775
);
wwv_flow_imp.component_end;
end;
/
