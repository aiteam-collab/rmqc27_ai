prompt --application/pages/page_1900043
begin
--   Manifest
--     PAGE: 1900043
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
 p_id=>1900043
,p_name=>'Edit Mail'
,p_alias=>'COMPOSE-MAIL2'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7612106583611946548)
,p_plug_name=>'Compose Email'
,p_static_id=>'compose-email'
,p_title=>'Compose Email'
,p_region_name=>'com'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       EOH_BU,',
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
'       EOH_STATUS,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_SEQ_NO,',
'       EOH_CRE_BY,',
'       EOH_CRE_IP_ADDR,',
'       EOH_CRE_OS_USER,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_IP_ADDR,',
'       EOH_UPD_OS_USER,',
'       EOH_UPD_DATE,',
'       EOH_CRE_EMP_ID,',
'       EOH_UPD_EMP_ID,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT',
'  from EMAIL_OUTBOX_HD',
'  where EOH_BU = :GLOBAL_BU',
'  '))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1900043_SHOW_DATA'
,p_plug_display_when_cond2=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6757573793764331101)
,p_plug_name=>'Edit Mail'
,p_static_id=>'edit-mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       EOH_BU,',
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
'       EOH_STATUS,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_SEQ_NO,',
'       EOH_CRE_BY,',
'       EOH_CRE_IP_ADDR,',
'       EOH_CRE_OS_USER,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_IP_ADDR,',
'       EOH_UPD_OS_USER,',
'       EOH_UPD_DATE,',
'       EOH_CRE_EMP_ID,',
'       EOH_UPD_EMP_ID,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT',
'  from EMAIL_OUTBOX_HD',
'  where EOH_BU = :GLOBAL_BU',
'  and EOH_DOC_NO = :P1900043_EOH_DOC_NO'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7605136448887154760)
,p_plug_name=>'Edit Mail'
,p_static_id=>'edit-mail-2'
,p_region_name=>'edit'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       EOH_BU,',
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
'       EOH_STATUS,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_SEQ_NO,',
'       EOH_CRE_BY,',
'       EOH_CRE_IP_ADDR,',
'       EOH_CRE_OS_USER,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_IP_ADDR,',
'       EOH_UPD_OS_USER,',
'       EOH_UPD_DATE,',
'       EOH_CRE_EMP_ID,',
'       EOH_UPD_EMP_ID,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT',
'  from EMAIL_OUTBOX_HD',
'  where EOH_BU = :GLOBAL_BU',
'  and EOH_DOC_NO = :P1900043_EOH_DOC_NO'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P1900043_SHOW_DATA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7612109578653946578)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5627275009693866542)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_button_name=>'Attachment'
,p_static_id=>'attachment'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Attachment'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:129:&SESSION.::&DEBUG.::P129_DOC_NO:&P1900043_EOH_DOC_NO.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5627278544844866578)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_button_name=>'Attachment_COM'
,p_static_id=>'attachment-com'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Attachment'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::P117_DOC_NO_COM,P117_SHOW_DATA:&P1900043_EOH_DOC_NO_COM.,Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5768665841440741037)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P1900043_ROWID_COM'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7612106656870946549)
,p_button_sequence=>310
,p_button_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5620883362965700454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5768665950130741038)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_button_name=>'UPDATE'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P1900043_ROWID_COM'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5616055325532498666)
,p_branch_name=>'Go To Page 19251900041'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_EOH_SUBJ,P1900043_EOH_BODY:&P1900043_EOH_DOC_NO.,&P1900043_EOH_SUBJ.,&P1900043_EOH_BODY.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7612106656870946549)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5629382938015696470)
,p_branch_name=>'Go To Page 19251900041'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_EOH_SUBJ,P1900043_EOH_BODY:&P1900043_EOH_DOC_NO.,&P1900043_EOH_SUBJ.,&P1900043_EOH_BODY.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5620883362965700454)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105911068946541)
,p_name=>'P1900043_CC_MAIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_prompt=>'cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7625532415378067031)
,p_name=>'P1900043_CC_MAIL_COM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_prompt=>'cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT uma_user_name,',
'       uma_user_name as uma_user_name1',
'      -- uma_host',
'  FROM user_mail_access',
' WHERE uma_bu = :GLOBAL_bu ',
'   AND uma_status = ''A''',
'   AND uma_user = :GLOBAL_user'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'MULTI',
  'attribute_08', 'CIC',
  'attribute_10', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630212411278602345)
,p_name=>'P1900043_DOC_NO'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137226313154767)
,p_name=>'P1900043_EOH_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_prompt=>'Body'
,p_source=>'EOH_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>65
,p_cMaxlength=>4000
,p_cHeight=>5
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
 p_id=>wwv_flow_imp.id(7612107265346946555)
,p_name=>'P1900043_EOH_BODY_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_prompt=>'Body'
,p_source=>'EOH_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
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
 p_id=>wwv_flow_imp.id(7605136700196154762)
,p_name=>'P1900043_EOH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612106806015946550)
,p_name=>'P1900043_EOH_BU_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605138173630154777)
,p_name=>'P1900043_EOH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108245066946565)
,p_name=>'P1900043_EOH_CRE_BY_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612104765613946530)
,p_name=>'P1900043_EOH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108620515946568)
,p_name=>'P1900043_EOH_CRE_DATE_COM'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105287769946535)
,p_name=>'P1900043_EOH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612109043687946573)
,p_name=>'P1900043_EOH_CRE_EMP_ID_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605138287474154778)
,p_name=>'P1900043_EOH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108401742946566)
,p_name=>'P1900043_EOH_CRE_IP_ADDR_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612104720001946529)
,p_name=>'P1900043_EOH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108499700946567)
,p_name=>'P1900043_EOH_CRE_OS_USER_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605136901517154764)
,p_name=>'P1900043_EOH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107022194946552)
,p_name=>'P1900043_EOH_DOC_DATE_COM'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605136736616154763)
,p_name=>'P1900043_EOH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612106931431946551)
,p_name=>'P1900043_EOH_DOC_NO_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137418029154769)
,p_name=>'P1900043_EOH_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107447118946557)
,p_name=>'P1900043_EOH_EMP_ID_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105541344946538)
,p_name=>'P1900043_EOH_MAIL_SEND_OPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_MAIL_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612109389203946576)
,p_name=>'P1900043_EOH_MAIL_SEND_OPT_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_default=>'M'
,p_source=>'EOH_MAIL_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105463242946537)
,p_name=>'P1900043_EOH_MAIL_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612109258194946575)
,p_name=>'P1900043_EOH_MAIL_TYPE_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_default=>'A'
,p_source=>'EOH_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605138040165154776)
,p_name=>'P1900043_EOH_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108208514946564)
,p_name=>'P1900043_EOH_SEQ_NO_COM'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_default=>'1'
,p_source=>'EOH_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137007810154765)
,p_name=>'P1900043_EOH_SNDR_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_prompt=>'From'
,p_source=>'EOH_SNDR_EMAIL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SENDER_MAIL (WFM0598T)'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the From',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107037050946553)
,p_name=>'P1900043_EOH_SNDR_EMAIL_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_prompt=>'From'
,p_source=>'EOH_SNDR_EMAIL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SENDER_MAIL (WFM0598T)'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137752371154773)
,p_name=>'P1900043_EOH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107878194946561)
,p_name=>'P1900043_EOH_STATUS_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137084500154766)
,p_name=>'P1900043_EOH_SUBJ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_prompt=>'Subject'
,p_source=>'EOH_SUBJ'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
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
 p_id=>wwv_flow_imp.id(7612107157812946554)
,p_name=>'P1900043_EOH_SUBJ_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_prompt=>'Subject'
,p_source=>'EOH_SUBJ'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(7605137853986154774)
,p_name=>'P1900043_EOH_UNIT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107959106946562)
,p_name=>'P1900043_EOH_UNIT_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612104874527946531)
,p_name=>'P1900043_EOH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108697832946569)
,p_name=>'P1900043_EOH_UPD_BY_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105230031946534)
,p_name=>'P1900043_EOH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108991203946572)
,p_name=>'P1900043_EOH_UPD_DATE_COM'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105401779946536)
,p_name=>'P1900043_EOH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612109202595946574)
,p_name=>'P1900043_EOH_UPD_EMP_ID_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612104994669946532)
,p_name=>'P1900043_EOH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108831026946570)
,p_name=>'P1900043_EOH_UPD_IP_ADDR_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105096754946533)
,p_name=>'P1900043_EOH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108890933946571)
,p_name=>'P1900043_EOH_UPD_OS_USER_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137237911154768)
,p_name=>'P1900043_EOH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107415253946556)
,p_name=>'P1900043_EOH_USER_ID_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137680335154772)
,p_name=>'P1900043_EOH_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107775646946560)
,p_name=>'P1900043_EOH_VOU_NO_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137602815154771)
,p_name=>'P1900043_EOH_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107652164946559)
,p_name=>'P1900043_EOH_VOU_PFX_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137477812154770)
,p_name=>'P1900043_EOH_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612107566475946558)
,p_name=>'P1900043_EOH_VOU_TYPE_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7605137941802154775)
,p_name=>'P1900043_EOH_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'EOH_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612108131309946563)
,p_name=>'P1900043_EOH_WF_TYPE_COM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'EOH_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7625532191824067029)
,p_name=>'P1900043_REGION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7612109578653946578)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105720175946539)
,p_name=>'P1900043_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_item_source_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612109497807946577)
,p_name=>'P1900043_ROWID_COM'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_item_source_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5620882644751700447)
,p_name=>'P1900043_SHOW_DATA'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7612105765120946540)
,p_name=>'P1900043_TO_MAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7605136448887154760)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_TO_MAIL_UNSENT'
,p_lov_cascade_parent_items=>'P1900043_EOH_DOC_NO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '720')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7625532274698067030)
,p_name=>'P1900043_TO_MAIL_COM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7612106583611946548)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'LOWER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5768665667107741035)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COMP'
,p_static_id=>'comp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    CURSOR c1',
'        IS',
'        SELECT *',
'          FROM user_mail_access',
'         WHERE uma_bu = :GLOBAL_bu AND uma_user = :GLOBAL_USER;',
'',
'    CR1             C1%ROWTYPE;',
'',
'BEGIN',
'',
'         OPEN C1;',
'         FETCH C1 INTO CR1;',
'',
'         INSERT INTO wfm_mail_report (mr_bu,',
'                                      mr_date,',
'                                      mr_f_name,',
'                                      mr_status,',
'                                      mr_body,',
'                                      mr_sub,',
'                                      mr_receiver_email,',
'                                      mr_bus_fun,',
'                                      mr_sender_email,',
'                                      mr_sender_pass,',
'                                      mr_cre_by,',
'                                      mr_cre_date,',
'                                      mr_host,',
'                                      mr_port,',
'                                      mr_seq_no,',
'                                      mr_user_email,',
'                                      mr_encryp_type)',
'                              VALUES (:GLOBAL_bu,',
'                                      SYSDATE,',
'                                      (SELECT LISTAGG (eoa_filename, '','')',
'                                             WITHIN GROUP (ORDER BY eoa_filename)',
'                                             mail_ids',
'                                        FROM email_outbox_attach',
'                                       WHERE EOA_BU = :GLOBAL_bu',
'                                         AND EOA_DOC_NO = :P1900043_EOH_DOC_NO_COM),',
'                                       NULL,',
'                                       :P1900043_EOH_BODY_COM,',
'                                       :P1900043_EOH_SUBJ_COM,',
'                                       :P1900043_TO_MAIL_COM,                --''roadmapdbateam@gmail.com'',',
'                                       ''COMPOSE'',',
'                                       cr1.uma_user_name,',
'                                       cr1.uma_password,',
'                                       :GLOBAL_USER,',
'                                       SYSDATE,',
'                                       cr1.uma_host,',
'                                       cr1.uma_port,',
'                                       :P1900043_EOH_DOC_NO_COM,',
'                                       cr1.uma_user_name,',
'                                       ''TLS'');',
'',
'         COMMIT;',
'',
'         INSERT INTO email_outbox_hd (eoh_bu,',
'                                      eoh_doc_no,',
'                                      eoh_doc_date,',
'                                      eoh_sndr_email,',
'                                      eoh_subj,',
'                                      eoh_body, ',
'                                      eoh_status,',
'                                      eoh_cre_by,',
'                                      eoh_cre_date',
'                                      )',
'                              VALUES (',
'                                      :GLOBAL_bu,',
'                                      :P1900043_EOH_DOC_NO_COM,',
'                                      SYSDATE,',
'                                      cr1.uma_user_name,',
'                                      :P1900043_EOH_SUBJ_COM,',
'                                      :P1900043_EOH_BODY_COM,',
'                                      NULL,',
'                                      :GLOBAL_USER,',
'                                      SYSDATE',
'                                      );',
'',
'         INSERT INTO email_outbox_rcvr_list (eorl_bu,',
'                                             eorl_doc_no,',
'                                             eorl_seq_no,',
'                                             eorl_rcvr_email,',
'                                             eorl_rcvr_type,',
'                                             eorl_cre_by,',
'                                             eorl_cre_date,',
'                                             eorl_status)',
'              VALUES (:GLOBAL_bu,',
'                      :P1900043_EOH_DOC_NO_COM,',
'                      1,',
'                      RTRIM (:P1900043_TO_MAIL_COM, '',''),',
'                      ''E'',',
'                      :GLOBAL_USER,',
'                      SYSDATE,',
'                      NULL);',
'',
'         CLOSE C1;',
'',
'         COMMIT;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5620883362965700454)
,p_internal_uid=>286703831564130007
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5768666094118741039)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7612106583611946548)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Compose Email'
,p_static_id=>'compose-email'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,UPDATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>286704258575130011
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7605136617515154761)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7605136448887154760)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Compose Mail'
,p_static_id=>'initialize-form-compose-mail'
,p_internal_uid=>2123174781971543733
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5500059405612781529)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'SELECT wfm_mail_report_seq.NEXTVAL,0',
'  INTO :P1900043_EOH_DOC_NO_COM,:P1900043_EOH_SEQ_NO_COM',
'  FROM DUAL;',
'',
'/*SELECT',
'    mr_receiver_email into :P1900043_EOH_DOC_NO',
'FROM',
'    wfm_mail_report',
'WHERE',
'    mr_seq_no = :P1900043_EOH_DOC_NO;*/',
'    ',
'exception when others then null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18097570069170501
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7625532525421067032)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK'
,p_static_id=>'ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_application_error(-20999,:P1900043_EOH_DOC_NO||''~''||:P1900043_EOH_SEQ_NO);		',
'DECLARE',
'	CURSOR c1',
'	IS',
'	SELECT 1',
'	  FROM user_mail_access',
'	 WHERE uma_bu = :GLOBAL_bu',
'	   AND uma_user_name = :P1900043_EOH_SNDR_EMAIL;',
'	   ',
'	cr1			c1%ROWTYPE;',
'	',
' v_mail     	VARCHAR2(500) := :P1900043_TO_MAIL||'';''||:P1900043_CC_MAIL||'';'';',
' v_cnt      	NUMBER;',
' v_ind_mail 	VARCHAR2(500);',
' v_seq_no		NUMBER;',
' pos1     		NUMBER;',
' pos2     		NUMBER;',
'BEGIN ',
'	',
'	IF :P1900043_EOH_SNDR_EMAIL IS NULL THEN',
'		RAISE_APPLICATION_ERROR(-20999,''Sender(From) Mail ID must be entered.'');',
'	END IF;',
'	',
'	',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
'	',
'	IF c1%NOTFOUND THEN',
'		RAISE_APPLICATION_ERROR(-20999,''User Mail Access not configured for the given Sender e-Mail ID.'');',
'	END IF;',
'	',
'	CLOSE c1;',
'	',
'	DELETE FROM email_outbox_rcvr_list',
'	 WHERE eorl_bu = :GLOBAL_bu',
'	   AND eorl_doc_no = :P1900043_EOH_DOC_NO;',
'',
'				SELECT NVL(MAX(eorl_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM email_outbox_rcvr_list',
'				 WHERE eorl_bu = :GLOBAL_bu',
'		       AND eorl_doc_no = :P1900043_EOH_DOC_NO;		 ',
'		',
'				INSERT INTO email_outbox_rcvr_list (eorl_bu,',
'																eorl_doc_no,',
'																eorl_seq_no,',
'																eorl_rcvr_email,',
'																eorl_cc_email,',
'																eorl_rcvr_id,',
'																eorl_rcvr_type,',
'																eorl_sel_flag,',
'																eorl_cre_by,',
'																eorl_cre_emp_id,',
'																eorl_cre_ip_addr,',
'																eorl_cre_date)',
'											   	  VALUES (:GLOBAL_bu,',
'																:P1900043_EOH_DOC_NO,',
'																v_seq_no,',
'																:P1900043_TO_MAIL,',
'																:P1900043_CC_MAIL,',
'																NULL,',
'																''E'',',
'																''Y'',--:select_flag,',
'																:GLOBAL_user,',
'																:GLOBAL_emp_id,',
'																:GLOBAL_ip,',
'																SYSDATE',
'                                                );',
'		',
'	proc_commit;',
'   ',
'UPDATE wfm_mail_report ',
'    SET MR_RECEIVER_EMAIL = :P1900043_TO_MAIL,',
'        MR_CC =  :P1900043_CC_MAIL,',
'        MR_UPD_BY = :GLOBAL_USER,',
'        MR_UPD_DATE = SYSDATE,',
'        MR_SUB   = :P1900043_EOH_SUBJ ,',
'        MR_BODY  = :P1900043_EOH_BODY,',
'        MR_F_NAME = (SELECT LISTAGG (EOA_FILENAME, '','')',
'                            WITHIN GROUP (ORDER BY EOA_SEQ_NO)',
'                            FILES ',
'                      from EMAIL_OUTBOX_ATTACH',
'                      WHERE EOA_BU = :GLOBAL_BU',
'		                  AND EOA_DOC_NO = :P1900043_EOH_DOC_NO',
'                    )',
'   WHERE MR_BU = :GLOBAL_BU',
'     AND MR_SEQ_NO = :P1900043_EOH_DOC_NO; --CR2.EOH_DOC_NO;',
'',
'UPDATE EMAIL_OUTBOX_HD',
'   SET eoh_subj = :P1900043_EOH_SUBJ,',
'       eoh_body = :P1900043_EOH_BODY,',
'       eoh_upd_by = :GLOBAL_USER,',
'       eoh_upd_date  = SYSDATE',
'where  EOh_BU     = :GLOBAL_BU',
'and    eoh_doc_no = :P1900043_EOH_DOC_NO ;',
'Commit;',
'  ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7612106656870946549)
,p_process_success_message=>'update Successfully'
,p_internal_uid=>2143570689877456004
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5620883460964700455)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK_COM'
,p_static_id=>'ok-com'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	CURSOR c1',
'	IS',
'	SELECT 1',
'	  FROM user_mail_access',
'	 WHERE uma_bu = :GLOBAL_bu',
'	   AND uma_user_name = :P1900043_EOH_SNDR_EMAIL_COM;',
'	   ',
'	cr1			c1%ROWTYPE;',
'	',
' v_mail     	VARCHAR2(500) := :P1900043_TO_MAIL_COM||'';''||:P1900043_CC_MAIL_COM||'';'';',
' v_cnt      	NUMBER;',
' v_ind_mail 	VARCHAR2(500);',
' v_seq_no		NUMBER;',
' pos1     		NUMBER;',
' pos2     		NUMBER;',
'BEGIN ',
'	',
'	IF :P1900043_EOH_SNDR_EMAIL_COM IS NULL THEN',
'		RAISE_APPLICATION_ERROR(-20999,''Sender(From) Mail ID must be entered.'');',
'	END IF;',
'	',
'	',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
'	',
'	IF c1%NOTFOUND THEN',
'		RAISE_APPLICATION_ERROR(-20999,''User Mail Access not configured for the given Sender e-Mail ID.'');',
'	END IF;',
'	',
'	CLOSE c1;',
'	',
'	DELETE FROM email_outbox_rcvr_list',
'	 WHERE eorl_bu = :GLOBAL_bu',
'	   AND eorl_doc_no = :P1900043_EOH_DOC_NO_COM;',
'',
'       commit;',
'',
'				SELECT NVL(MAX(eorl_seq_no),0) + 1',
'				  INTO v_seq_no',
'				  FROM email_outbox_rcvr_list',
'				 WHERE eorl_bu = :GLOBAL_bu',
'		       AND eorl_doc_no = :P1900043_EOH_DOC_NO_COM;',
'		',
'				INSERT INTO email_outbox_rcvr_list (eorl_bu,',
'																eorl_doc_no,',
'																eorl_seq_no,',
'																eorl_rcvr_email,',
'																eorl_cc_email,',
'																eorl_rcvr_id,',
'																eorl_rcvr_type,',
'																eorl_sel_flag,',
'																eorl_cre_by,',
'																eorl_cre_emp_id,',
'																eorl_cre_ip_addr,',
'																eorl_cre_date)',
'											   	  VALUES (:GLOBAL_bu,',
'																:P1900043_EOH_DOC_NO_COM,',
'																v_seq_no,',
'																:P1900043_TO_MAIL_COM,',
'																:P1900043_CC_MAIL_COM,',
'																NULL,',
'																''E'',',
'																''Y'',--:select_flag,',
'																:GLOBAL_user,',
'																:GLOBAL_emp_id,',
'																:GLOBAL_ip,',
'																SYSDATE',
'                                                );',
'		',
'	commit;',
'   ',
'UPDATE wfm_mail_report ',
'    SET MR_RECEIVER_EMAIL = :P1900043_TO_MAIL_COM,',
'        MR_CC =  :P1900043_CC_MAIL_COM,',
'        MR_UPD_BY = :GLOBAL_USER,',
'        MR_UPD_DATE = SYSDATE,',
'        MR_SUB   = :P1900043_EOH_SUBJ_COM ,',
'        MR_BODY  = :P1900043_EOH_BODY_COM',
'   WHERE MR_BU = :GLOBAL_BU',
'     AND MR_SEQ_NO = :P1900043_EOH_DOC_NO_COM;  --CR2.EOH_DOC_NO;',
'',
'UPDATE EMAIL_OUTBOX_HD',
'   SET eoh_subj = :P1900043_EOH_SUBJ_COM,',
'       eoh_body = :P1900043_EOH_BODY_COM,',
'       eoh_upd_by = :GLOBAL_USER,',
'       eoh_upd_date  = SYSDATE',
'where  EOh_BU     = :GLOBAL_BU',
'and    eoh_doc_no = :P1900043_EOH_DOC_NO_COM ;',
'Commit;',
'  ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5620883362965700454)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'update Successfully'
,p_internal_uid=>138921625421089427
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5768666186276741040)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1900043_SHOW_DATA = ''Y'' THEN',
'IF :P1900043_ROWID_COM IS NULL THEN',
'',
'    -- SELECT wfm_mail_report_seq.NEXTVAL,0',
'    --   INTO :P1900043_EOH_DOC_NO_COM,:P1900043_EOH_SEQ_NO_COM',
'    --   FROM DUAL;',
'',
'   :P1900043_EOH_MAIL_TYPE_COM   := ''A'';',
'   :P1900043_EOH_MAIL_SEND_OPT_COM := ''M'';',
'   :P1900043_EOH_BU_COM         := :GLOBAL_BU;',
'   :P1900043_EOH_CRE_BY_COM     := :GLOBAL_USER;',
'   :P1900043_EOH_CRE_DATE_COM   := SYSDATE;',
'   :P1900043_EOH_CRE_EMP_ID_COM := :GLOBAL_EMP_ID;',
'ELSE',
'   :P1900043_EOH_UPD_BY_COM     := :GLOBAL_USER;',
'   :P1900043_EOH_UPD_DATE_COM   := SYSDATE;',
'   :P1900043_EOH_UPD_EMP_ID_COM := :GLOBAL_EMP_ID;',
'END IF;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>286704350733130012
);
wwv_flow_imp.component_end;
end;
/
