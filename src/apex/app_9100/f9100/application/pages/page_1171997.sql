prompt --application/pages/page_1171997
begin
--   Manifest
--     PAGE: 1171997
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
 p_id=>1171997
,p_name=>'POS Search'
,p_alias=>'POS-ACCESS-FIND'
,p_step_title=>'POS Search'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();'))
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
 p_id=>wwv_flow_imp.id(8983218780414283307)
,p_plug_name=>'Favorite button'
,p_static_id=>'favorite-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10110255689628025370)
,p_plug_name=>'POS User'
,p_static_id=>'pos-user'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'    wppahd_bu,',
'    wppahd_doc_no,',
'    TO_CHAR(wppahd_doc_date,''DD-MM-RRRR'')wppahd_doc_date,',
'    wppahd_reference,',
'    wppahd_user_id,',
'    DECODE(wppahd_type,''A'',''Add Unit Access'',''R'',''Remove Unit Access'',''E'',''Extend Duration'')wppahd_type,',
'    DECODE(wppahd_status,''N'',''Draft'',''E'',''Entry Completed'',''P'',''Posted'',''L'',''Cancelled'')wppahd_status,',
'    DECODE(wppahd_status,''N'',''Blue'',''E'',''Brown'',''P'',''Green'',''L'',''Red'')color,',
'    wppahd_appr_by,',
'    wppahd_appr_date,',
'    wppahd_from_user_id',
'FROM',
'    wapl_posuser_plnt_access_hd',
'WHERE',
'    wppahd_bu = :global_bu',
' AND :P1171997_SHOW_DATA = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P1171997_USER_ID,P1171997_APPLUSER_EMP_ID,P1171997_USER_TYPE,P1171997_LOCATION,P1171997_UNIT,P1171997_DOC_NO,P1171997_DOC_TYPE,P1171997_DOC_DATE,P1171997_STATUS,P1171997_SHOW_DATA'
,p_prn_page_header=>'User Unit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10110255788393025370)
,p_no_data_found_message=>'  '
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4628293952849414342
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720549975890723850)
,p_db_column_name=>'COLOR'
,p_display_order=>130
,p_column_identifier=>'BQ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720548434921723834)
,p_db_column_name=>'ROWID'
,p_display_order=>110
,p_is_primary_key=>'Y'
,p_column_identifier=>'BO'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720548054209723831)
,p_db_column_name=>'WPPAHD_APPR_BY'
,p_display_order=>80
,p_column_identifier=>'BL'
,p_column_label=>'Wppahd Appr By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720548213698723832)
,p_db_column_name=>'WPPAHD_APPR_DATE'
,p_display_order=>90
,p_column_identifier=>'BM'
,p_column_label=>'Wppahd Appr Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5674246014084557374)
,p_db_column_name=>'WPPAHD_BU'
,p_display_order=>10
,p_column_identifier=>'BE'
,p_column_label=>'Wppahd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720549917865723849)
,p_db_column_name=>'WPPAHD_DOC_DATE'
,p_display_order=>120
,p_column_identifier=>'BP'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5674246076708557375)
,p_db_column_name=>'WPPAHD_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'BF'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:12101998:&SESSION.::&DEBUG.::P12101998_ROWID:#ROWID#'
,p_column_linktext=>'#WPPAHD_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720548322330723833)
,p_db_column_name=>'WPPAHD_FROM_USER_ID'
,p_display_order=>100
,p_column_identifier=>'BN'
,p_column_label=>'Wppahd From User Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5674246297578557377)
,p_db_column_name=>'WPPAHD_REFERENCE'
,p_display_order=>40
,p_column_identifier=>'BH'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720547984166723830)
,p_db_column_name=>'WPPAHD_STATUS'
,p_display_order=>70
,p_column_identifier=>'BK'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#WPPAHD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5720547895055723829)
,p_db_column_name=>'WPPAHD_TYPE'
,p_display_order=>60
,p_column_identifier=>'BJ'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5674246388420557378)
,p_db_column_name=>'WPPAHD_USER_ID'
,p_display_order=>50
,p_column_identifier=>'BI'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10110267869841029338)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WPPAHD_DOC_NO:WPPAHD_USER_ID:WPPAHD_TYPE:WPPAHD_REFERENCE:WPPAHD_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5674245872706557373)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>'Find POS User'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-bottom-none'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5718809676217441670)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
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
,p_button_redirect_url=>'f?p=&APP_ID.:12101998:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5718810130860441673)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_button_name=>'Clear'
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
 p_id=>wwv_flow_imp.id(5718808900849441657)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:2902:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5718810513762441674)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_button_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_button_static_id=>'F'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite N'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5718808603796441645)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_button_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5718809290614441668)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_button_name=>'Go_report'
,p_static_id=>'go-report'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10180795416882479463)
,p_name=>'P1171997_APPLUSER_EMP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Emp. / Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_EMP'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Emp./Party'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Emp./Party',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7948236967074394559)
,p_name=>'P1171997_DOC_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Doc.  Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(7948236803394394558)
,p_name=>'P1171997_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_DOC_NO(UAM2015)'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Document'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Document',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7948236645031394556)
,p_name=>'P1171997_DOC_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Doc.  Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Unit Access;A,Remove Unit Access;R,Extend Duration;E'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7014410717100581684)
,p_name=>'P1171997_ERROR_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8983315726950284871)
,p_name=>'P1171997_FAVORITE_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8983218780414283307)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wubfa_user_fav',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE wubfa_user_id    = :GLOBAL_user',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_page_no      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10180826808479479567)
,p_name=>'P1171997_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_PLNT_LOC'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Location'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Location',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6885338146089742668)
,p_name=>'P1171997_REPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8983218780414283307)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6885334269531742615)
,p_name=>'P1171997_SHOW_DATA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6879969302926877781)
,p_name=>'P1171997_STATUS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9012936809878658704)
,p_name=>'P1171997_UNIT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_PLNT'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Unit'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Unit',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10180823954318479561)
,p_name=>'P1171997_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'POS User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id   ',
'  FROM appl_users,',
'       wapl_user_plnt_access_view',
' WHERE appluser_bu = wupav_bu',
'   AND appluser_id = wupav_user_id',
'   AND appluser_bu = :Global_bu     ',
'   AND  appluser_status = ''A'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the User'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7948236745106394557)
,p_name=>'P1171997_USER_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5674245872706557373)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin User;R,Functional User;E,Role Based User;O,ESS User;U,Supplier;S,Customer;C,POS User;P,Mobile User;M,Limited Access User;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718830770478442031)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5718810130860441673)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718831747043442032)
,p_event_id=>wwv_flow_imp.id(5718830770478442031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1171997_USER_ID,P1171997_APPLUSER_EMP_ID,P1171997_USER_TYPE,P1171997_LOCATION,P1171997_UNIT,P1171997_DOC_NO,P1171997_DOC_TYPE,P1171997_DOC_DATE,P1171997_STATUS,P1171997_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718832272229442032)
,p_event_id=>wwv_flow_imp.id(5718830770478442031)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718831261922442031)
,p_event_id=>wwv_flow_imp.id(5718830770478442031)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10110255689628025370)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718833537568442034)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718834519456442043)
,p_event_id=>wwv_flow_imp.id(5718833537568442034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1171997_USER_ID,P1171997_APPLUSER_EMP_ID,P1171997_USER_TYPE,P1171997_LOCATION,P1171997_UNIT,P1171997_DOC_NO,P1171997_DOC_TYPE,P1171997_DOC_DATE,P1171997_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718834120007442035)
,p_event_id=>wwv_flow_imp.id(5718833537568442034)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P1171997_SHOW_DATA'
,p_server_condition_expr2=>'Y'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718828526137442009)
,p_name=>'fav N'
,p_static_id=>'fav-n'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5718810513762441674)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718828938808442009)
,p_event_id=>wwv_flow_imp.id(5718828526137442009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1171997_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P1171997_FAVORITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718829501415442029)
,p_event_id=>wwv_flow_imp.id(5718828526137442009)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1171997_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718834845571442043)
,p_name=>'fav Y'
,p_static_id=>'fav-y'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5718808603796441645)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718835885105442045)
,p_event_id=>wwv_flow_imp.id(5718834845571442043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1171997_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu,''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P1171997_FAVORITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718835338359442045)
,p_event_id=>wwv_flow_imp.id(5718834845571442043)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1171997_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718823814335441956)
,p_name=>'P1171997_FAVORITE_FLAG'
,p_static_id=>'p1171997-favorite-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1171997_FAVORITE_FLAG'
,p_condition_element=>'P1171997_FAVORITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718825646022441979)
,p_event_id=>wwv_flow_imp.id(5718823814335441956)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5718808603796441645)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718824155966441965)
,p_event_id=>wwv_flow_imp.id(5718823814335441956)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5718810513762441674)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718824690223441978)
,p_event_id=>wwv_flow_imp.id(5718823814335441956)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5718810513762441674)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718825166583441978)
,p_event_id=>wwv_flow_imp.id(5718823814335441956)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5718808603796441645)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718829898667442029)
,p_name=>'P69_ERROR_FLAG'
,p_static_id=>'p69-error-flag'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1171997_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718830431726442031)
,p_event_id=>wwv_flow_imp.id(5718829898667442029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// First clear the errors',
    'apex.message.clearErrors();',
    '',
    'var errorFlag= $v(''P1171997_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P1171997_DOC_DATE'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P1171997_DOC_DATE",',
    '        message:    "Doc. Date must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5718826065385441979)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5718809290614441668)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718827126417441999)
,p_event_id=>wwv_flow_imp.id(5718826065385441979)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1171997_ERROR_FLAG',
  'items_to_submit', 'P1171997_DOC_DATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P1171997_ERROR_FLAG := 0;',
    '',
    'IF :P1171997_DOC_DATE IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P1171997_DOC_DATE,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P1171997_ERROR_FLAG := ''P1171997_DOC_DATE'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718827619137441999)
,p_event_id=>wwv_flow_imp.id(5718826065385441979)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").show();',
    'apex.item("find").hide();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P1171997_SHOW_DATA'
,p_client_condition_expression=>'Y'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718826605458441990)
,p_event_id=>wwv_flow_imp.id(5718826065385441979)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10110255689628025370)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P1171997_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5718828066859441999)
,p_event_id=>wwv_flow_imp.id(5718826065385441979)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1171997_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
