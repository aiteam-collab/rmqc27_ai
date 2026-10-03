prompt --application/pages/page_00126
begin
--   Manifest
--     PAGE: 00126
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
 p_id=>126
,p_name=>'Document Details'
,p_alias=>'DOCUMENT-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Document Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' #send{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
' #add{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
' #atc{',
'        color: rgb(86, 142, 168);',
'        background-color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5778923809038993351)
,p_plug_name=>'BTN'
,p_static_id=>'btn'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6503526501348138006)
,p_plug_name=>'Send / Unsend - Email'
,p_static_id=>'send-unsend-email'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6503529096042138032)
,p_plug_name=>'Send / Unsend - Email'
,p_static_id=>'send-unsend-email-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EOH_BU,',
'       EOH_DOC_NO,',
'       EOH_DOC_DATE,',
'       EOH_SNDR_EMAIL,',
'       EOH_SUBJ,',
'       EOH_BODY,',
'       EOH_USER_ID,',
'       EOH_EMP_ID,',
'       EOH_VOU_TYPE,',
'       EOH_VOU_PFX,',
'       EOH_VOU_NO,',
'       case when EOH_STATUS is null then ''Please wait while the email is being sent.'' else EOH_STATUS end EOH_STATUS,',
'       EOH_CRE_BY,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_DATE,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT,',
'       EORL_BU,',
'       EORL_DOC_NO,',
'       EORL_SEQ_NO,',
'       EORL_RCVR_TYPE,',
'       EORL_RCVR_EMAIL,',
'       EORL_CC_EMAIL,',
'       EORL_CRE_BY,',
'       EORL_CRE_DATE,',
'       EORL_UPD_BY,',
'       EORL_UPD_DATE,',
'       EORL_SEL_FLAG,',
'       EORL_STATUS',
'  from EMAIL_OUTBOX_VW'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824266449672929121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5778923809038993351)
,p_button_name=>'Attachment'
,p_static_id=>'attachment'
,p_button_static_id=>'atc'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Attachment'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.::P125_P_DOC_NO:&P126_EOH_DOC_NO.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824266886365929124)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5778923809038993351)
,p_button_name=>'Edit'
,p_static_id=>'edit'
,p_button_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_EOH_BU,P1900043_EOH_BODY,P1900043_EOH_SUBJ,P1900043_CC_MAIL,P1900043_TO_MAIL,P1900043_DOC_NO,P1900043_SHOW_DATA:&P126_EOH_DOC_NO.,&P126_EOH_BU.,&P126_EOH_BODY.,&P126_EOH_SUBJ.,&P126_EORL_CC_EMAIL.,&P126_EORL_RCVR_EMAIL.,&P126_EOH_DOC_NO.,'
,p_icon_css_classes=>'fa-clipboard-edit'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824267268122929124)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5778923809038993351)
,p_button_name=>'Send'
,p_static_id=>'send'
,p_button_static_id=>'send'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to Send the document?",''SEND'');'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503529630772138030)
,p_name=>'P126_DOCUMENT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_prompt=>'Document Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503533351059138039)
,p_name=>'P126_ENTITY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    BU_NAME1',
'FROM',
'    business_units',
'WHERE',
'    bu_id = :GLOBAL_BU'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Entity'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6503536492803138071)
,p_name=>'P126_EOH_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Body'
,p_source=>'EOH_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536003569138066)
,p_name=>'P126_EOH_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537167272138078)
,p_name=>'P126_EOH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537350852138079)
,p_name=>'P126_EOH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536256385138068)
,p_name=>'P126_EOH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Sent On'
,p_format_mask=>'DD.MM.YYYY HH:MI:SS AM'
,p_source=>'EOH_DOC_DATE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>3
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536068213138067)
,p_name=>'P126_EOH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536683217138073)
,p_name=>'P126_EOH_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505095892680675735)
,p_name=>'P126_EOH_MAIL_SEND_OPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_MAIL_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537850012138084)
,p_name=>'P126_EOH_MAIL_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536314429138069)
,p_name=>'P126_EOH_SNDR_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'From'
,p_source=>'EOH_SNDR_EMAIL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>3
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537102191138077)
,p_name=>'P126_EOH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Reason:'
,p_source=>'EOH_STATUS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536449528138070)
,p_name=>'P126_EOH_SUBJ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Subject'
,p_source=>'EOH_SUBJ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>5
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537632188138082)
,p_name=>'P126_EOH_UNIT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537433733138080)
,p_name=>'P126_EOH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537502423138081)
,p_name=>'P126_EOH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536644920138072)
,p_name=>'P126_EOH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503536984519138076)
,p_name=>'P126_EOH_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Vou. No.'
,p_source=>'EOH_VOU_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503536907010138075)
,p_name=>'P126_EOH_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Vou. Pfx.'
,p_source=>'EOH_VOU_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503536854224138074)
,p_name=>'P126_EOH_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503537744615138083)
,p_name=>'P126_EOH_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EOH_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096042253675736)
,p_name=>'P126_EORL_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096510111675741)
,p_name=>'P126_EORL_CC_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'CC'
,p_source=>'EORL_CC_EMAIL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>3
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096644401675742)
,p_name=>'P126_EORL_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096675091675743)
,p_name=>'P126_EORL_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096119580675737)
,p_name=>'P126_EORL_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096380499675740)
,p_name=>'P126_EORL_RCVR_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'TO'
,p_source=>'EORL_RCVR_EMAIL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>3
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096308894675739)
,p_name=>'P126_EORL_RCVR_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_RCVR_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505097027883675746)
,p_name=>'P126_EORL_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_SEL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096199945675738)
,p_name=>'P126_EORL_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505097078499675747)
,p_name=>'P126_EORL_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096812006675744)
,p_name=>'P126_EORL_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6505096934511675745)
,p_name=>'P126_EORL_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_source_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_source=>'EORL_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503529490028138029)
,p_name=>'P126_PFX_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_prompt=>'No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6503529739468138031)
,p_name=>'P126_RECEIVER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_prompt=>'Receiver'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503529867173138033)
,p_name=>'P126_SEND_OPTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_prompt=>'Send Option'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503533600502138042)
,p_name=>'P126_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>1
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
 p_id=>wwv_flow_imp.id(6503529151467138026)
,p_name=>'P126_UNIT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6503534357895138050)
,p_name=>'P126_UNIT_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6503529096042138032)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    BUP_PLANT_ID',
'FROM',
'    bus_unit_plants',
'WHERE',
'    bup_bu = :GLOBAL_BU AND bup_plant_id = :P126_EOH_UNIT ;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
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
 p_id=>wwv_flow_imp.id(6503529797053138032)
,p_name=>'P126_UNSEND_REASON'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6503526501348138006)
,p_prompt=>'Unsend Reason'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>7
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5824290360168929199)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6503529096042138032)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Document Details'
,p_static_id=>'initialize-form-document-details'
,p_internal_uid=>342328524625318171
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5824290883896929206)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND'
,p_static_id=>'send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_mail_status            VARCHAR2(400);',
'    v_filename               VARCHAR2(1000);',
'BEGIN',
'',
'    FOR cr1 IN (SELECT eoh_doc_no,',
'                       eorl_rcvr_email,',
'                       eorl_cc_email,',
'                       eoh_subj,',
'                       eoh_body,',
'                       umc_user_name uma_user_name,',
'                       CRYPTIT.decrypt (umc_password) password,',
'                       pmc_host uma_host,',
'                       pmc_port uma_port',
'                  FROM email_outbox_hd,',
'                       email_outbox_rcvr_list,',
'                       prod_mail_config,',
'                       user_mail_config',
'                 WHERE pmc_bu       = umc_bu',
'                   AND pmc_suite    = umc_suite',
'                   AND umc_status   = ''A''',
'                   AND eoh_bu       = umc_bu',
'                   AND eoh_sndr_email = umc_user_name',
'                   AND eoh_bu       = :GLOBAL_bu',
'                   AND eorl_sel_flag = ''Y''',
'                   AND eoh_bu       = eorl_bu',
'                   AND eoh_doc_no   = eorl_doc_no)',
'    LOOP',
'',
'    IF cr1.eoh_doc_no IS NOT NULL THEN',
'',
'        proc_send_mailv24(:GLOBAL_bu,cr1.eoh_doc_no,:GLOBAL_user,v_mail_status);',
'',
'        UPDATE email_outbox_hd SET eoh_status = v_mail_status',
'        WHERE eoh_bu     = :GLOBAL_bu  ',
'          AND eoh_doc_no = cr1.eoh_doc_no;',
'',
'        UPDATE wfm_mail_report',
'           SET mr_status = v_mail_status',
'         WHERE mr_seq_no = cr1.eoh_doc_no;',
'',
'    END IF;',
'',
'    apex_application.g_print_success_message := v_mail_status;',
'',
'        UPDATE email_outbox_rcvr_list',
'           SET eorl_status   = v_mail_status,',
'               eorl_sel_flag = ''N'',',
'               eorl_upd_by   = :GLOBAL_user,',
'               eorl_upd_date = SYSDATE',
'         WHERE eorl_bu       = :global_bu ',
'           AND eorl_doc_no   = cr1.eoh_doc_no;',
'',
'            COMMIT;',
'',
'    END LOOP;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>342329048353318178
);
wwv_flow_imp.component_end;
end;
/
