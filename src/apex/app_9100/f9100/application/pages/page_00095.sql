prompt --application/pages/page_00095
begin
--   Manifest
--     PAGE: 00095
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
 p_id=>95
,p_name=>'Profile Details'
,p_alias=>'HOME-PAGE'
,p_page_mode=>'MODAL'
,p_step_title=>'Profile Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--3cols .t-Cards-item {',
'    width: 33.33%;',
'    margin-left: 900px;',
'}',
'',
'/* Profile Details */',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #0cd865b8;',
'    color: #000000;',
'}',
'',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #07a158c9;',
'    COLOR: #fffffff2;',
'}',
'',
'#open_region{',
'   height: 250px;',
'   width: 250px;',
'}',
'',
'/*    radio option    */',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 50px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'.t-Form--leftLabels .t-Form-labelContainer {',
'    PADDING-LEFT: 10px;',
'}',
'',
'.t-Cards--compact .t-Card-titleWrap {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 8px 48px 8px 48px;',
'    min-height: 48px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7677689604483437841)
,p_plug_name=>'Change Password'
,p_static_id=>'change-password'
,p_region_css_classes=>'js-dialog-size330x350'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7674079330211987156)
,p_plug_name=>'CHANGE PASSWORD BTN'
,p_static_id=>'change-password-btn'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7674079430666987157)
,p_plug_name=>'Email ID or Phone No.'
,p_static_id=>'email-id-or-phone-no'
,p_region_css_classes=>'js-dialog-size350x250'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7677689154833437837)
,p_plug_name=>'OTP'
,p_static_id=>'otp'
,p_region_css_classes=>'js-dialog-size330x180'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7674078640480987150)
,p_plug_name=>'Password Details'
,p_static_id=>'password-details'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7667561529212734045)
,p_plug_name=>'Profile Details'
,p_static_id=>'profile-details'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>7
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7677690436194437850)
,p_name=>'Profile IMG'
,p_static_id=>'profile-img'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<center><img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''P96_DM_BLOB'', ROWID)||''" height = "110" width = "110"/></ce'
||'nter>'')',
'        CARD_TITLE,',
'        ''<center>''||:P95_EMP_NAME||'' - ''||:P95_EMP_ID||''</center>'' CARD_SUBTITLE,',
'        ''<center>''||(SELECT UPPER(POSITION_DESC)',
'                       FROM EMP_ACTIVE_INFOS_VIEW',
'                      WHERE EMP_BU     = :GLOBAL_BU',
'                        AND EMP_EMP_ID = DM_VOU_NO)||''</center>'' CARD_TEXT,',
'        ''<center>''||(SELECT UPPER(DEPT_DESC)',
'                       FROM EMP_ACTIVE_INFOS_VIEW',
'                      WHERE EMP_BU     = :GLOBAL_BU',
'                        AND EMP_EMP_ID = DM_VOU_NO)||''</center>'' CARD_SUBTEXT,',
'        ROWID "recon_no"',
'  FROM doc_mgmt',
' WHERE dm_bu = :Global_bu',
'   AND dm_vou_no =:P95_EMP_ID',
'   AND dm_vou_type =''E_IMG''',
'',
'UNION ALL',
'',
'SELECT CASE WHEN EMP_GENDER=''F'' ',
'            THEN ''<center><img alt="''||apex_escape.html_attribute(:P95_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "110" width = "110"/></center>''',
'            ELSE ''<center><img alt="''||apex_escape.html_attribute(:P95_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile.png'''' height = "110" width = "110"/></center>''',
'       END',
'       CARD_TITLE,',
'      ''<center><b>''||:P95_EMP_NAME||''<br></br>''||:P95_EMP_ID||''</b></center>'' CARD_SUBTITLE,',
'       ''<center>''||(SELECT UPPER(POSITION_DESC)',
'                      FROM EMP_ACTIVE_INFOS_VIEW',
'                     WHERE EMP_BU     = :GLOBAL_BU',
'                       AND EMP_EMP_ID = :P95_EMP_ID)||''</center>'' CARD_TEXT,',
'       ''<center>''||(SELECT UPPER(DEPT_DESC)',
'                      FROM EMP_ACTIVE_INFOS_VIEW',
'                     WHERE EMP_BU = :GLOBAL_BU',
'                       AND EMP_EMP_ID = :P95_EMP_ID)||''</center>'' CARD_SUBTEXT,',
'       NULL "recon_no"',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :P95_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL);',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7677690919876437854)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_column_html_expression=>'<b>#CARD_SUBTEXT#</b>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7677690708294437852)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7677690736609437853)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_column_html_expression=>'<b>#CARD_TEXT#</b>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7677690612121437851)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:::'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7677691000474437855)
,p_query_column_id=>5
,p_column_alias=>'recon_no'
,p_column_display_sequence=>50
,p_column_heading=>'Recon No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7674079642647987160)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7674079430666987157)
,p_button_name=>'BTN_OK'
,p_static_id=>'btn-ok'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7674080767773987171)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7677689154833437837)
,p_button_name=>'BTN_OTP_OK'
,p_static_id=>'btn-otp-ok'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7674080924231987172)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7677689604483437841)
,p_button_name=>'BTN_UPD_OK'
,p_static_id=>'btn-upd-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7674079195346987155)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7674079330211987156)
,p_button_name=>'CHANGE_PASSWORD'
,p_static_id=>'change-password'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Password'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-key'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078132103987144)
,p_name=>'P95_APPLUSER_EFF_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7667561529212734045)
,p_prompt=>'Eff. To :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078180049987145)
,p_name=>'P95_APPLUSER_EMAIL_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7667561529212734045)
,p_prompt=>'Email  :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078012305987143)
,p_name=>'P95_APPLUSER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7667561529212734045)
,p_prompt=>'User :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078239406987146)
,p_name=>'P95_APPLUSER_MOBILE_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7667561529212734045)
,p_prompt=>'Mobile :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078363193987147)
,p_name=>'P95_APPLUSER_PWD_EXP_DUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7674078640480987150)
,p_prompt=>'Expiry Date :'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674078512638987148)
,p_name=>'P95_APPLUSER_PW_LUD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7674078640480987150)
,p_prompt=>'Last Updated:'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674079472878987158)
,p_name=>'P95_BGP_ENTER_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7674079430666987157)
,p_prompt=>'<b> Enter Email ID / Phone No. </b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674080679512987170)
,p_name=>'P95_CONFIRM_PASSWORD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7677689604483437841)
,p_prompt=>'Confirm Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7677689037773437836)
,p_name=>'P95_DUMMY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7674079430666987157)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7677691117649437856)
,p_name=>'P95_EMP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7677690436194437850)
,p_item_default=>':global_emp_id'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7677691171481437857)
,p_name=>'P95_EMP_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7677690436194437850)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    emp_first_name1',
'    || '' ''',
'    || emp_middle_name1',
'    || '' ''',
'    || emp_last_name1 emp_name',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND emp_emp_id = :global_emp_id'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674080388069987167)
,p_name=>'P95_GET_PASSWORD_OTP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7677689154833437837)
,p_prompt=>'Enter OTP'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674079537727987159)
,p_name=>'P95_GET_PASS_OTP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7674079430666987157)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:SMS;P,Email;M'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674080593779987169)
,p_name=>'P95_NEW_PASSWORD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7677689604483437841)
,p_prompt=>'New Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674080490486987168)
,p_name=>'P95_OLD_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7677689604483437841)
,p_prompt=>'Old Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7674081179541987175)
,p_validation_name=>'BGP_ENTER_EMAIL'
,p_static_id=>'bgp-enter-email'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P95_BGP_ENTER_EMAIL IS NULL THEN',
'   RETURN ('' Email ID / Phone No. must be enterd.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7674079472878987158)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7677690288781437848)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P95_GET_PASS_OTP IS NULL THEN',
'   return (''SMS or Email must be select'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7674079537727987159)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7677689318322437838)
,p_name=>'BTN_OK'
,p_static_id=>'btn-ok'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7674079642647987160)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677689970959437845)
,p_event_id=>wwv_flow_imp.id(7677689318322437838)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7674079430666987157)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P95_DUMMY'
,p_client_condition_expression=>'O,C'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677689463042437840)
,p_event_id=>wwv_flow_imp.id(7677689318322437838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7677689154833437837)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P95_DUMMY'
,p_client_condition_expression=>'O'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677689381763437839)
,p_event_id=>wwv_flow_imp.id(7677689318322437838)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'BTN_OK',
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7677689727175437842)
,p_name=>'BTN_OTP_OK'
,p_static_id=>'btn-otp-ok'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7674080767773987171)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677690076482437846)
,p_event_id=>wwv_flow_imp.id(7677689727175437842)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7677689154833437837)
,p_client_condition_type=>'IN_LIST'
,p_client_condition_element=>'P95_DUMMY'
,p_client_condition_expression=>'C'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677689889912437844)
,p_event_id=>wwv_flow_imp.id(7677689727175437842)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7677689604483437841)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P95_DUMMY'
,p_client_condition_expression=>'C'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7677689790457437843)
,p_event_id=>wwv_flow_imp.id(7677689727175437842)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'BTN_OTP_OK',
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7674079772384987161)
,p_name=>'CHANGE_PASSWORD'
,p_static_id=>'change-password'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7674079195346987155)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7674079879629987162)
,p_event_id=>wwv_flow_imp.id(7674079772384987161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7674079430666987157)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7674079971814987163)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Password BTN OK'
,p_static_id=>'change-password-btn-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c0',
'IS',
'    SELECT',
'          appluser_id user_id,',
'          appluser_emp_id emp_id ',
'      FROM',
'           employees,appl_users',
'     WHERE appluser_bu = emp_bu',
'       AND appluser_emp_id = emp_emp_id',
'       AND appluser_status = ''A''',
'       and appluser_emp_id = :GLOBAL_EMP_ID',
'       AND (emp_off_mobile_no = :P95_BGP_ENTER_EMAIL OR emp_off_email_id = :P95_BGP_ENTER_EMAIL);',
'',
'   cr0                  c0%rowtype;',
'   v_userid             VARCHAR2(15);',
'   v_ip_addr            VARCHAR2(25);',
'',
'BEGIN',
'',
'-- v_userid := SYS_CONTEXT (''USERENV'', ''CURRENT_SCHEMA'');',
'',
'-- v_ip_addr := GET_APPLICATION_PROPERTY (USER_IP_ADDRESS);',
'',
'    OPEN c0;',
'    FETCH c0 INTO cr0;',
'         IF c0%notfound then',
'            raise_application_error (-20999,''Account for this Email or Phone Number does not exist.'');',
'         ELSE',
'            proc_forgot_pass_otp_apex (cr0.user_id,cr0.emp_id,''Desktop'',:GLOBAL_IP_ADDR,:GLOBAL_SCHEMA || ''.jnlp'',:P95_GET_PASS_OTP);',
'            :GLOBAL_OTP_USER_ID := cr0.user_id;',
'            :P95_DUMMY := ''O'';',
'',
'               IF :P95_GET_PASS_OTP = ''M'' THEN',
'                  apex_application.g_print_success_message := ''OTP Sent to your mail.'';',
'               ELSE',
'                  apex_application.g_print_success_message := ''OTP Sent to your Phone number.'';',
'               END IF;',
'         END IF;',
'    CLOSE C0;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7674079642647987160)
,p_internal_uid=>2192118136271376135
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7674081010570987173)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Password BTN_OTP_OK'
,p_static_id=>'change-password-btn-otp-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR   c0',
'   IS',
'      SELECT appluser_id',
'        FROM appl_users,',
'             otp_details,',
'             employees',
'       WHERE appluser_id = od_user',
'         AND appluser_bu = emp_bu',
'         AND appluser_emp_id = emp_emp_id',
'         AND emp_status = ''A''',
'         AND appluser_id = :GLOBAL_OTP_USER_ID',
'         AND od_emp_id = :GLOBAL_EMP_ID',
'         AND od_type = ''RESET''',
'         AND appluser_status = ''A''',
'         AND od_otp = func_get_hash (appluser_id,:P95_GET_PASSWORD_OTP)',
'         AND SYSDATE BETWEEN od_otp_valid_from AND od_otp_valid_to ;',
'',
'   cr0                  c0%ROWTYPE;',
'   v_no_of_attempts     VARCHAR2 (1);',
'   v_rem_attempts       VARCHAR2 (1);',
'',
'BEGIN',
'',
'   OPEN c0;',
'',
'   FETCH c0 INTO cr0;',
'',
'   BEGIN',
'',
'      SELECT od_no_of_attempts',
'        INTO v_no_of_attempts',
'        FROM otp_details',
'       WHERE od_user = :GLOBAL_OTP_USER_ID AND od_type = ''RESET'' and od_emp_id = :GLOBAL_EMP_ID;',
'',
'   EXCEPTION WHEN NO_DATA_FOUND THEN',
'      v_no_of_attempts := 0;',
'   END;',
'',
'   v_no_of_attempts := v_no_of_attempts + 1;',
'',
'   v_rem_attempts := 3 - v_no_of_attempts;',
'',
'   IF c0%NOTFOUND THEN',
'      IF v_no_of_attempts = 3 THEN',
'',
'           UPDATE otp_details',
'              SET od_status  = ''F'',',
'                  od_no_of_attempts = v_no_of_attempts',
'            WHERE od_user    = :GLOBAL_OTP_USER_ID ',
'              AND od_type    = ''RESET''',
'              AND od_emp_id  = :GLOBAL_EMP_ID;',
'',
'         COMMIT;',
'         RAISE_APPLICATION_ERROR (-20999,''Invalid OTP. Please resend the OTP'');',
'      ELSE',
'',
'         UPDATE otp_details',
'            SET od_status  = ''F'', ',
'                od_no_of_attempts = v_no_of_attempts',
'          WHERE od_user    = :GLOBAL_OTP_USER_ID ',
'            AND od_type    = ''RESET'' ',
'            AND od_emp_id  = :GLOBAL_EMP_ID;',
'',
'         COMMIT;',
'',
'         RAISE_APPLICATION_ERROR (-20999,''Invalid OTP. Attempts Remaining: '' || v_rem_attempts);',
'      END IF;',
'   ELSE',
'',
'      UPDATE otp_details',
'         SET od_status  = ''S'',',
'             od_no_of_attempts = v_no_of_attempts',
'       WHERE od_user    = :GLOBAL_OTP_USER_ID ',
'         AND od_type    = ''RESET''',
'         AND od_emp_id  = :GLOBAL_EMP_ID;',
'',
'      :P95_DUMMY := ''C'';',
'      COMMIT;',
'',
'   END IF;',
'',
'   CLOSE C0;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7674080767773987171)
,p_internal_uid=>2192119175027376145
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7674081107628987174)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Password BTN_UPD_OK'
,p_static_id=>'change-password-btn-upd-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P95_OLD_PASSWORD IS NOT NULL THEN',
'',
'IF :P95_NEW_PASSWORD IS NULL THEN',
'    RAISE_APPLICATION_ERROR (-20999,''New Password must be entered.'');',
'END IF;',
'',
'IF :P95_CONFIRM_PASSWORD IS NULL THEN',
'    RAISE_APPLICATION_ERROR (-20999,''Confirmation Password must be entered.'');',
'END IF;',
'',
'IF :P95_NEW_PASSWORD <> :P95_CONFIRM_PASSWORD THEN',
'    RAISE_APPLICATION_ERROR (-20999,''Passwords do not match.'');',
'END IF;',
'',
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM appl_users, policy_data',
'       WHERE appluser_bu =  pda_bu',
'         AND appluser_bu = :GLOBAL_bu',
'         AND appluser_id = :GLOBAL_user',
'         AND appluser_emp_id = :GLOBAL_EMP_ID',
'         AND appluser_password = func_get_hash (:GLOBAL_user, :P95_OLD_PASSWORD);',
'',
'   cr1              c1%ROWTYPE;',
'',
'   v_pwd_exp_date    DATE;',
'   but_val           NUMBER (3);',
'',
'BEGIN',
'',
'IF :P95_OLD_PASSWORD = :P95_NEW_PASSWORD  THEN',
'',
'      -- SET_ALERT_PROPERTY (''CAUTION_ALERT'', alert_message_text, ''Old password and new password  are same. Do you want to continue?'');',
'      -- but_val := SHOW_ALERT (''CAUTION_ALERT'');',
'',
'      -- IF but_val = alert_button1',
'      -- THEN',
'         OPEN c1;',
'',
'         FETCH c1 INTO cr1;',
'',
'         IF c1%FOUND  THEN',
'',
'            UPDATE appl_users',
'               SET appluser_password      = func_get_hash (:GLOBAL_user, :P95_NEW_PASSWORD),',
'                   appluser_pwd_exp_due   = SYSDATE + (cr1.pda_pw_exp_days * DECODE(cr1.pda_pw_freq, ''D'', 1, ''M'', 30, ''Y'', 365, 1)),',
'                   appluser_pw_lud        = TRUNC (SYSDATE),',
'                   appluser_upd_by        = :GLOBAL_user,',
'                   appluser_upd_date      = SYSDATE',
'             WHERE appluser_bu            = :GLOBAL_bu',
'               AND appluser_id            = :GLOBAL_user',
'               AND appluser_emp_id        = :global_emp_id;',
'',
'            IF SQL%FOUND',
'            THEN ',
'               -- proc_send_upd_pwd_mail;',
'               proc_send_upd_pwd_mail (:global_bu,:global_emp_id,:global_user);',
'',
'            END IF;',
'',
'         COMMIT;',
'',
'            apex_application.g_print_success_message :=  ''Password Updated successully'';',
'',
'         ELSE',
'',
'            -- GO_ITEM (''APPL_USERS_PROFILE.OLD_PASSWORD'');',
'            RAISE_APPLICATION_ERROR (-20999, ''Old Password is Incorrect. Please Enter the Correct Password'');',
'         END IF;',
'',
'         CLOSE c1;',
'      -- ELSE',
'         -- GO_ITEM (''APPL_USERS_PROFILE.OLD_PASSWORD'');',
'      -- END IF;',
'',
'ELSE',
'',
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM appl_users',
'       WHERE appluser_bu       = :GLOBAL_bu',
'         AND appluser_id       = :GLOBAL_user',
'         AND appluser_emp_id   = :GLOBAL_EMP_ID',
'         AND appluser_password = func_get_hash (:GLOBAL_user,:P95_OLD_PASSWORD);',
'',
'   cr1              c1%ROWTYPE;',
'',
'   v_pwd_exp_date   DATE;',
'BEGIN',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%FOUND THEN',
'',
'      UPDATE appl_users',
'         SET appluser_password   = func_get_hash (:GLOBAL_user, :P95_NEW_PASSWORD),',
'             appluser_pw_lud     = TRUNC (SYSDATE),',
'             appluser_upd_by     = :GLOBAL_user,',
'             appluser_upd_date   = SYSDATE',
'       WHERE appluser_bu         = :GLOBAL_bu',
'         AND appluser_id         = :GLOBAL_user',
'         AND appluser_emp_id     = :GLOBAL_EMP_ID;',
'',
'      IF SQL%FOUND',
'      THEN',
'         -- proc_send_upd_pwd_mail;',
'         proc_send_upd_pwd_mail (:global_bu,:global_emp_id,:global_user);',
'      END IF;',
'',
'      PROC_COMMIT;',
'',
'      apex_application.g_print_success_message := ''Password Updated successully'';',
'      :P95_DUMMY := NULL;',
'   ELSE',
'      -- GO_ITEM (''APPL_USERS_PROFILE.OLD_PASSWORD'');',
'      RAISE_APPLICATION_ERROR (-20999,''Old Password is Incorrect. Please Enter the Correct Password'');',
'   END IF;',
'',
'   CLOSE c1;',
'   END;',
'',
'   END IF;',
'END;',
'',
'ELSE',
'     RAISE_APPLICATION_ERROR (-20999,''Old Password Must be Entered'');',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7674080924231987172)
,p_internal_uid=>2192119272085376146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7674078632847987149)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROFILE'
,p_static_id=>'profile'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    appluser_id,',
'    to_char(appluser_eff_to,''DD/MM/RRRR'') appluser_eff_to,',
'    appluser_email_id,',
'    appluser_mobile_no,',
'    to_char(appluser_pwd_exp_due,''DD/MM/RRRR'') appluser_pwd_exp_due,',
'    to_char(appluser_pw_lud,''DD/MM/RRRR'') appluser_pw_lud',
'INTO ',
'    :P95_APPLUSER_ID,',
'    :P95_APPLUSER_EFF_TO,',
'    :P95_APPLUSER_EMAIL_ID,',
'    :P95_APPLUSER_MOBILE_NO,',
'    :P95_APPLUSER_PWD_EXP_DUE,',
'    :P95_APPLUSER_PW_LUD',
'FROM',
'    appl_users',
'WHERE',
'        appluser_bu = :global_bu',
'    AND appluser_id = :global_user;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2192116797304376121
);
wwv_flow_imp.component_end;
end;
/
