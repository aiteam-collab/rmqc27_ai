prompt --application/pages/page_00135
begin
--   Manifest
--     PAGE: 00135
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
 p_id=>135
,p_name=>'Sent / Unsend WhatsApp'
,p_alias=>'SENT-UNSEND-WHATSAPP'
,p_page_mode=>'MODAL'
,p_step_title=>'Sent / Unsend WhatsApp'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' #send{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
' #atc{',
'        color: rgb(86, 142, 168);',
'        background-color: #ffffff;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5778923881704993352)
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
 p_id=>wwv_flow_imp.id(6511787898767996827)
,p_plug_name=>'Sent / Unsend WhatsApp'
,p_static_id=>'sent-unsend-whatsapp'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WHATSAPP_OUTBOX_VW'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824301740693933471)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:19251900041:&APP_SESSION.::&DEBUG.:::'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824300296503933462)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5778923881704993352)
,p_button_name=>'Compose_Message'
,p_static_id=>'compose-message'
,p_button_static_id=>'atc'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose Message'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1900042:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824302136712933471)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P135_WOV_BU'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824302597011933473)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P135_WOV_BU'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5778924116712993354)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5778923881704993352)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'New'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1900042:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824301385201933467)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P135_WOV_BU'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824300691852933463)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5778923881704993352)
,p_button_name=>'Send_WhatsApp_Message'
,p_static_id=>'send-whatsapp-message'
,p_button_static_id=>'send'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send Whatsapp Message'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511795472482996888)
,p_name=>'P135_WOV_BENF_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Beneficiary ID'
,p_source=>'WOV_BENF_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511795799331996890)
,p_name=>'P135_WOV_BENF_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Name'
,p_source=>'WOV_BENF_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511795041229996887)
,p_name=>'P135_WOV_BENF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Type'
,p_source=>'WOV_BENF_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Employee;E,Customer;C,Supplier;S'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511793425947996862)
,p_name=>'P135_WOV_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511796241251996890)
,p_name=>'P135_WOV_COUNTRY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Country Code'
,p_source=>'WOV_COUNTRY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511799991532996898)
,p_name=>'P135_WOV_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511800386335996898)
,p_name=>'P135_WOV_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511800867156996899)
,p_name=>'P135_WOV_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511801242259996901)
,p_name=>'P135_WOV_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511801625695996901)
,p_name=>'P135_WOV_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511794254872996882)
,p_name=>'P135_WOV_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Date'
,p_format_mask=>'DD-MM-YYYY HH:MI SS'
,p_source=>'WOV_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(6511797972970996895)
,p_name=>'P135_WOV_MESSAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Message'
,p_source=>'WOV_MESSAGE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>13
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
 p_id=>wwv_flow_imp.id(6511796635515996892)
,p_name=>'P135_WOV_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Mobile No.'
,p_source=>'WOV_MOBILE_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511799194783996896)
,p_name=>'P135_WOV_RESPONSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Response'
,p_source=>'WOV_RESPONSE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>13
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
 p_id=>wwv_flow_imp.id(6511798805679996896)
,p_name=>'P135_WOV_RQST_JSON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_RQST_JSON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511799585726996898)
,p_name=>'P135_WOV_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_SEL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511793850517996873)
,p_name=>'P135_WOV_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Sl No.'
,p_source=>'WOV_SEQ_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511798482024996895)
,p_name=>'P135_WOV_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511797420898996893)
,p_name=>'P135_WOV_TEMPLATE_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_prompt=>'Template'
,p_source=>'WOV_TEMPLATE_DESC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511797037407996892)
,p_name=>'P135_WOV_TEMPLATE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_TEMPLATE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511802076438996902)
,p_name=>'P135_WOV_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511802420916996902)
,p_name=>'P135_WOV_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511802822195996902)
,p_name=>'P135_WOV_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511803206897996904)
,p_name=>'P135_WOV_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511803642311996904)
,p_name=>'P135_WOV_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6511794679319996887)
,p_name=>'P135_WOV_USERID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_item_source_plug_id=>wwv_flow_imp.id(6511787898767996827)
,p_source=>'WOV_USERID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5824318718982933562)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6511787898767996827)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Sent / Unsend WhatsApp'
,p_static_id=>'initialize-form-sent-unsend-whatsapp'
,p_internal_uid=>342356883439322534
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5824319096155933563)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6511787898767996827)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Sent / Unsend WhatsApp'
,p_static_id=>'process-form-sent-unsend-whatsapp'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>342357260612322535
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5824319589217933565)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Whatsapp Send MSG'
,p_static_id=>'whatsapp-send-msg'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c2(c_seq_no NUMBER)',
'        IS',
'        SELECT wod_status',
'          FROM whatsapp_outbox_det',
'         WHERE wod_bu = :GLOBAL_bu',
'           AND wod_seq_no = c_seq_no; ',
'',
'    cr2         c2%ROWTYPE;',
'',
'    i           NUMBER := 0;',
'BEGIN',
'    FOR cr1 IN (SELECT wov_seq_no',
'                  FROM whatsapp_outbox_vw',
'                 WHERE wov_bu = :GLOBAL_bu',
'                   AND wov_status <> ''A''',
'                   AND wov_sel_flag = ''Y'')',
'    LOOP',
'',
'        proc_send_wa_message (:GLOBAL_bu,''U1'',cr1.wov_seq_no,:GLOBAL_user);',
'',
'        commit;',
'',
'    OPEN c2(cr1.wov_seq_no);',
'    FETCH c2 INTO cr2;',
'',
'        IF c2%FOUND AND cr2.wod_status = ''A'' THEN',
'           i := 1;',
'        END IF;',
'',
'    CLOSE c2;',
'',
'    END LOOP;',
'',
'    IF i = 1 THEN',
'       apex_application.g_print_success_message := ''Message sent successfully.'';',
'    ELSE',
'       apex_application.g_print_success_message := ''Message failed to send. Refer Response for details.'';',
'    END IF;',
'END;',
'',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5824300691852933463)
,p_internal_uid=>342357753674322537
);
wwv_flow_imp.component_end;
end;
/
