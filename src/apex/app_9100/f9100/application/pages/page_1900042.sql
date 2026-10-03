prompt --application/pages/page_1900042
begin
--   Manifest
--     PAGE: 1900042
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
 p_id=>1900042
,p_name=>'WhatsApp'
,p_alias=>'SENT-UNSENT-WHATSAPP'
,p_page_mode=>'MODAL'
,p_step_title=>'WhatsApp'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7599622663059040037)
,p_plug_name=>'FROM'
,p_static_id=>'from'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WHATSAPP_OUTBOX_DET'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7605135583812154751)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_button_name=>'SEND_MSG'
,p_static_id=>'send-msg'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send Message'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7605136392878154759)
,p_branch_name=>'GO TO REPORT PAGE'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7605135583812154751)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599625338444040064)
,p_name=>'P1900042_BENF_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM0600T LOV'
,p_lov_display_null=>'YES'
,p_cSize=>30
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
  'title', 'Select the ID',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599625478751040065)
,p_name=>'P1900042_BENF_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'Beneficiary Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(7599625243014040063)
,p_name=>'P1900042_BENF_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_default=>'E'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Employee;E,Customer;C,Supplier;S'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599625218916040062)
,p_name=>'P1900042_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599622885908040039)
,p_name=>'P1900042_WOD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623274015040043)
,p_name=>'P1900042_WOD_COUNTRY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'Country Code'
,p_source=>'WOD_COUNTRY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
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
 p_id=>wwv_flow_imp.id(7599624118917040051)
,p_name=>'P1900042_WOD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624227177040052)
,p_name=>'P1900042_WOD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624322573040053)
,p_name=>'P1900042_WOD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624385949040054)
,p_name=>'P1900042_WOD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624534622040055)
,p_name=>'P1900042_WOD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623112025040041)
,p_name=>'P1900042_WOD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623652432040047)
,p_name=>'P1900042_WOD_MESSAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'Message'
,p_source=>'WOD_MESSAGE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(7599623429477040044)
,p_name=>'P1900042_WOD_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'Mobile Number'
,p_source=>'WOD_MOBILE_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(7599623954768040050)
,p_name=>'P1900042_WOD_RESPONSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_RESPONSE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623931406040049)
,p_name=>'P1900042_WOD_RQST_JSON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_RQST_JSON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599625055218040061)
,p_name=>'P1900042_WOD_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_SEL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623011594040040)
,p_name=>'P1900042_WOD_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623765171040048)
,p_name=>'P1900042_WOD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623604936040046)
,p_name=>'P1900042_WOD_TEMPLATE_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_prompt=>'Template'
,p_source=>'WOD_TEMPLATE_DESC'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM0600T TEMP LOV'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
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
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Template',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623535274040045)
,p_name=>'P1900042_WOD_TEMPLATE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_TEMPLATE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624622700040056)
,p_name=>'P1900042_WOD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624654878040057)
,p_name=>'P1900042_WOD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624833895040058)
,p_name=>'P1900042_WOD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599624848811040059)
,p_name=>'P1900042_WOD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599625012162040060)
,p_name=>'P1900042_WOD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599623164084040042)
,p_name=>'P1900042_WOD_USERID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_item_source_plug_id=>wwv_flow_imp.id(7599622663059040037)
,p_source=>'WOD_USERID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7599625573194040066)
,p_name=>'BENF_ID'
,p_static_id=>'benf-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1900042_BENF_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7599625668617040067)
,p_event_id=>wwv_flow_imp.id(7599625573194040066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1900042_BENF_NAME,P1900042_BENF_TYPE,P1900042_WOD_COUNTRY_CODE,P1900042_WOD_MOBILE_NO,P1900042_WOD_USERID',
  'items_to_submit', 'P1900042_BENF_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P1900042_BENF_ID IS NOT NULL THEN',
    '',
    'DECLARE',
    '    CURSOR c1',
    '       IS',
    '		select DECODE ( waul_benf_type,''S'', ''Supplier'', ''C'', ''Customer'', ''E'', ''Employee'')AS benf_type1,',
    '             waul_benf_type,',
    '             waul_benf_id,',
    '             waul_benf_name,',
    '             waul_country_code,',
    '             waul_wa_mob_no,',
    '             waul_userid',
    '        from whatsapp_api_user_list',
    '       where waul_bu = :GLOBAL_bu',
    '         and waul_act_status = ''A'';',
    '',
    '      cr1                        c1%ROWTYPE;',
    '',
    ' BEGIN',
    '    OPEN c1;',
    '    FETCH c1 into cr1 ;',
    '          IF c1%found THEN',
    '            -- :P1900042_BENF_ID          := cr1.waul_benf_id;',
    '            :P1900042_BENF_NAME        := cr1.waul_benf_name;',
    '            :P1900042_BENF_TYPE        := cr1.waul_benf_type;',
    '            :P1900042_WOD_COUNTRY_CODE := cr1.waul_country_code;',
    '            :P1900042_WOD_MOBILE_NO    := cr1.waul_wa_mob_no;',
    '            :P1900042_WOD_USERID       := cr1.waul_userid;',
    '         ELSE ',
    '           NULL;',
    '         END IF;',
    '    CLOSE C1;     ',
    ' END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7605135408614154749)
,p_name=>'Template'
,p_static_id=>'template'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1900042_WOD_TEMPLATE_DESC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7605135483419154750)
,p_event_id=>wwv_flow_imp.id(7605135408614154749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1900042_WOD_TEMPLATE_ID,P1900042_WOD_MESSAGE',
  'items_to_submit', 'P1900042_WOD_TEMPLATE_DESC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P1900042_WOD_TEMPLATE_DESC IS NOT NULL THEN',
    '',
    'DECLARE',
    '    CURSOR c1',
    '       IS',
    '		SELECT wat_template_id,',
    '             wat_template_desc,',
    '             wat_header_msg||CHR(10)||wat_template_msg||CHR(10)||wat_footer_msg  message',
    '        FROM whatsapp_api_templates',
    '       WHERE wat_bu     = :GLOBAL_bu',
    '         AND wat_status = ''A'';',
    '',
    '      cr1                        c1%ROWTYPE;',
    '',
    ' BEGIN',
    '    OPEN c1;',
    '    FETCH c1 into cr1 ;',
    '          IF c1%found THEN',
    '           :P1900042_WOD_TEMPLATE_ID := cr1.wat_template_id;',
    '           :P1900042_WOD_MESSAGE     := cr1.message;',
    '         ELSE ',
    '           NULL;',
    '         END IF;',
    '    CLOSE C1;     ',
    ' END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7599622777582040038)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7599622663059040037)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Sent / Unsent WhatsApp'
,p_static_id=>'initialize-form-sent-unsent-whatsapp'
,p_internal_uid=>2117660942038429010
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7605135298905154748)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize form Sent / Unsent WhatsApp_1'
,p_static_id=>'initialize-form-sent-unsent-whatsapp-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1900042_BENF_ID IS NOT NULL THEN',
'',
'DECLARE',
'    CURSOR c1',
'       IS',
'		select DECODE ( waul_benf_type,''S'', ''Supplier'', ''C'', ''Customer'', ''E'', ''Employee'')AS benf_type1,',
'             waul_benf_type,',
'             waul_benf_id,',
'             waul_benf_name,',
'             waul_country_code,',
'             waul_wa_mob_no,',
'             waul_userid',
'        from whatsapp_api_user_list',
'       where waul_bu = :GLOBAL_bu',
'         and waul_act_status = ''A'';',
'',
'      cr1                        c1%ROWTYPE;',
'',
' BEGIN',
'    OPEN c1;',
'    FETCH c1 into cr1 ;',
'          IF c1%found THEN',
'            -- :P1900042_BENF_ID          := cr1.waul_benf_id;',
'            :P1900042_BENF_NAME        := cr1.waul_benf_name;',
'            :P1900042_BENF_TYPE        := cr1.waul_benf_type;',
'            :P1900042_WOD_COUNTRY_CODE := cr1.waul_country_code;',
'            :P1900042_WOD_MOBILE_NO    := cr1.waul_wa_mob_no;',
'            :P1900042_WOD_USERID       := cr1.waul_userid;',
'         ELSE ',
'           NULL;',
'         END IF;',
'    CLOSE C1;     ',
' END;',
'',
'END IF;',
'',
'',
'IF :P1900042_WOD_TEMPLATE_DESC IS NOT NULL THEN',
'',
'DECLARE',
'    CURSOR c1',
'       IS',
'		SELECT wat_template_id,',
'             wat_template_desc,',
'             wat_header_msg||CHR(10)||wat_template_msg||CHR(10)||wat_footer_msg  message',
'        FROM whatsapp_api_templates',
'       WHERE wat_bu     = :GLOBAL_bu',
'         AND wat_status = ''A'';',
'',
'      cr1                        c1%ROWTYPE;',
'',
' BEGIN',
'    OPEN c1;',
'    FETCH c1 into cr1 ;',
'          IF c1%found THEN',
'           :P1900042_WOD_TEMPLATE_ID := cr1.wat_template_id;',
'           :P1900042_WOD_MESSAGE     := cr1.message;',
'         ELSE ',
'           NULL;',
'         END IF;',
'    CLOSE C1;     ',
' END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2123173463361543720
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7605135726858154752)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SEND_MESSAGE'
,p_static_id=>'proc-send-message'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1900042_ROWID IS NULL THEN',
'   :P1900042_WOD_CRE_BY      := :GLOBAL_user;',
'   :P1900042_WOD_CRE_DATE    := TO_CHAR(SYSDATE,''DD-MON-RRRR HH:MI:SS AM'');',
'   :P1900042_WOD_CRE_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P1900042_WOD_CRE_IP_ADDR := :GLOBAL_IP;',
'   :P1900042_WOD_BU          := :GLOBAL_BU;',
'   ',
'ELSE',
'   :P1900042_WOD_UPD_BY      := :GLOBAL_user;',
'   :P1900042_WOD_UPD_DATE    := TO_CHAR(SYSDATE,''DD-MON-RRRR HH:MI:SS AM'');',
'   :P1900042_WOD_UPD_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P1900042_WOD_UPD_IP_ADDR := :GLOBAL_IP;',
'END IF;   ',
'',
'DECLARE',
'	v_rqst_json VARCHAR2(4000);',
'	',
'	CURSOR c1 ',
'	IS',
'	SELECT wat_header_msg,wat_template_msg,wat_footer_msg',
'	  FROM whatsapp_api_templates',
'	 WHERE wat_bu = :GLOBAL_bu',
'	   AND wat_template_id = :P1900042_WOD_TEMPLATE_ID;',
'	   ',
'	CURSOR c2(c_seq_no NUMBER)',
'	IS',
'	SELECT wod_status',
'	  FROM whatsapp_outbox_det',
'	 WHERE wod_bu = :GLOBAL_bu',
'	   AND wod_seq_no = c_seq_no; ',
'	   ',
'	cr1			c1%ROWTYPE;    ',
'	cr2			c2%ROWTYPE;',
'	',
'	v_text		VARCHAR2(2000);',
'	v_text1		VARCHAR2(2000);',
'	v_text2		VARCHAR2(2000);',
'	v_text3		VARCHAR2(2000);',
'	',
'	i 	NUMBER := 0;',
'	j 	NUMBER := 0;',
'	',
'BEGIN',
'	',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
'	',
'	IF c1%FOUND AND REGEXP_INSTR(cr1.wat_header_msg,''{{\d}}'') > 0 THEN',
'		v_text1 := ''"headerValues": ["''||:P1900042_BENF_NAME||''"],'';',
'		i := 1;',
'	END IF;',
'	',
'	IF c1%FOUND AND REGEXP_INSTR(cr1.wat_template_msg,''{{\d}}'') > 0 THEN',
'		v_text2 := ''"bodyValues": ["''||:P1900042_BENF_NAME||''"],'';		',
'		i := 1;',
'	END IF;',
'	',
'	IF c1%FOUND AND REGEXP_INSTR(cr1.wat_footer_msg,''{{\d}}'') > 0 THEN',
'		v_text3 := ''"footerValues": ["''||:P1900042_BENF_NAME||''"],'';	',
'		i := 1;',
'	END IF;	',
'	',
'	CLOSE c1;',
'	',
'	IF i = 1 THEN',
'		v_text := RTRIM(v_text1||v_text2||v_text3,'','');',
'		',
'	:P1900042_WOD_RQST_JSON := ''{"countryCode": "''||:P1900042_WOD_COUNTRY_CODE||''",',
'								   "phoneNumber": "''||:P1900042_WOD_MOBILE_NO||''",',
'								   "callbackData": "some text here",',
'								   "type": "Template",',
'								   "template": {',
'								        "name": "''||:P1900042_WOD_TEMPLATE_DESC||''",',
'								        "languageCode": "en",',
'								        ''||v_text||''',
'								    }',
'								 }'';',
'	ELSE',
'		',
'	:P1900042_WOD_RQST_JSON := ''{"countryCode": "''||:P1900042_WOD_COUNTRY_CODE||''",',
'								   "phoneNumber": "''||:P1900042_WOD_MOBILE_NO||''",',
'								   "callbackData": "some text here",',
'								   "type": "Template",',
'								   "template": {',
'								        "name": "''||:P1900042_WOD_TEMPLATE_DESC||''",',
'								        "languageCode": "en"',
'								    }',
'								 }'';		',
'	END IF;	',
'	',
'',
'	COMMIT;',
'	',
'	proc_send_wa_message (:GLOBAL_bu,''U1'',:P1900042_WOD_SEQ_NO,:GLOBAL_user);',
'	',
'	proc_commit;',
'	',
'	OPEN c2(:P1900042_WOD_SEQ_NO);',
'	FETCH c2 INTO cr2;',
'	',
'	IF c2%FOUND AND cr2.wod_status = ''A'' THEN',
'		j := 1;',
'	END IF;',
'	',
'	CLOSE c2;',
'	',
'	IF j = 1 THEN',
'		apex_application.g_print_success_message := (''Message sent successfully.'');',
'	ELSE',
'		apex_application.g_print_success_message := (''Message failed to send. Refer Response for details.'');',
'	END IF;	',
'',
'END;	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7605135583812154751)
,p_internal_uid=>2123173891314543724
);
wwv_flow_imp.component_end;
end;
/
