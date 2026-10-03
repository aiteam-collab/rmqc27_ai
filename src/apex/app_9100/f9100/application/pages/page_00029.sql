prompt --application/pages/page_00029
begin
--   Manifest
--     PAGE: 00029
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
 p_id=>29
,p_name=>'Compose Mail'
,p_alias=>'EDIT-MAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Compose Mail'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6320944541901051756)
,p_plug_name=>'Edit Mail'
,p_static_id=>'edit-mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMAIL_OUTBOX_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6280567145097794804)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_button_name=>'Attachement'
,p_static_id=>'attachement'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Attachement'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::P27_EOA_DOC_NO:&P29_EOH_DOC_NO.'
,p_icon_css_classes=>'fa-paperclip'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320963811709051793)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320965351621051798)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Send'
,p_button_position=>'CREATE'
,p_button_condition=>'P29_EOH_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-paper-plane'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320964568526051798)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320964948598051798)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'OK'
,p_button_position=>'CHANGE'
,p_button_condition=>'P29_EOH_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6320965693081051798)
,p_branch_name=>'Go To Page 28'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6280567059301794803)
,p_name=>'P29_CC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_prompt=>'<b>CC  :</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_TO_MAIL'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-right-lg'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320947255643051767)
,p_name=>'P29_EOH_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_prompt=>'<b>Body  :</b>'
,p_source=>'EOH_BODY'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-right-lg'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320945283552051765)
,p_name=>'P29_EOH_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320951313838051778)
,p_name=>'P29_EOH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320952433757051779)
,p_name=>'P29_EOH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320954501605051782)
,p_name=>'P29_EOH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320951647880051778)
,p_name=>'P29_EOH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320952078522051779)
,p_name=>'P29_EOH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320946105275051765)
,p_name=>'P29_EOH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320945638607051765)
,p_name=>'P29_EOH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320948059142051771)
,p_name=>'P29_EOH_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320955267754051782)
,p_name=>'P29_EOH_MAIL_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>'A'
,p_source=>'EOH_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320950876679051778)
,p_name=>'P29_EOH_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>'0'
,p_source=>'EOH_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320946444087051767)
,p_name=>'P29_EOH_SNDR_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_prompt=>'<b>From  : </b>'
,p_source=>'EOH_SNDR_EMAIL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SENDER_MAIL'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-right-lg'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320949635974051775)
,p_name=>'P29_EOH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320946831224051767)
,p_name=>'P29_EOH_SUBJ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_prompt=>'<b>Subject  :</b>'
,p_source=>'EOH_SUBJ'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-right-lg'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320950102350051775)
,p_name=>'P29_EOH_UNIT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320952916211051779)
,p_name=>'P29_EOH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320954123750051781)
,p_name=>'P29_EOH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320954915506051782)
,p_name=>'P29_EOH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320953292442051781)
,p_name=>'P29_EOH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320953659408051781)
,p_name=>'P29_EOH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320947720434051771)
,p_name=>'P29_EOH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320949248013051773)
,p_name=>'P29_EOH_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320948869053051773)
,p_name=>'P29_EOH_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320948489536051773)
,p_name=>'P29_EOH_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320950472264051776)
,p_name=>'P29_EOH_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'EOH_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320944887813051757)
,p_name=>'P29_ROWID'
,p_source_data_type=>'ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_item_source_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6280567023075794802)
,p_name=>'P29_TO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6320944541901051756)
,p_prompt=>'<b>To  :</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_TO_MAIL'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-right-lg'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041299302467901144)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc.No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(eoh_doc_no),0) + 1 ',
'  INTO :P29_EOH_DOC_NO',
'  FROM email_outbox_hd',
' WHERE eoh_bu = :GLOBAL_bu;',
'--- raise_application_error(-20999,:P29_EOH_DOC_NO);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6320965351621051798)
,p_internal_uid=>559337466924290116
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6320966207693051801)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6320944541901051756)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Edit Mail'
,p_static_id=>'initialize-form-edit-mail'
,p_internal_uid=>839004372149440773
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6320966555888051804)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6320944541901051756)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Edit Mail'
,p_static_id=>'process-form-edit-mail'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'N',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>839004720344440776
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041300016801901151)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TO_CC_MAIL_INSERT'
,p_static_id=>'to-cc-mail-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin ',
'',
'',
' insert into email_outbox_rcvr_list (EORL_BU,',
'	                                  EORL_DOC_NO,',
'                                     EORL_RCVR_EMAIL,',
'                                     EORL_CC_EMAIL,',
'												 EORL_CRE_BY,',
'												 EORL_CRE_DATE',
'                                    )',
'                              values(:global_bu,',
'											    :P29_EOH_DOC_NO,',
'                                     :P29_TO,',
'		                               :P29_CC,',
'												 :global_user,',
'												 sysdate);',
'',
'Commit;',
'',
'-- raise_application_error(-20999,:P29_EOH_DOC_NO||''-''||:P29_TO||''-''||:P29_CC);',
'	',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6320965351621051798)
,p_internal_uid=>559338181258290123
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041300068942901152)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TO_CC_MAIL_UPDATE'
,p_static_id=>'to-cc-mail-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
' update email_outbox_rcvr_list ',
'set EORL_RCVR_EMAIL  = :P29_TO,',
'    EORL_CC_EMAIL    = :P29_CC',
'	 where eorl_bu = :global_bu',
'	 and   eorl_doc_no = :P29_EOH_DOC_NO;',
'	 commit;',
'-- raise_application_error(-20999,:P29_EOH_DOC_NO);',
'/* UPDATE EMAIL_OUTBOX_HD',
'SET EOH_SUBJ =:P29_EOH_SUBJ,',
'   EOH_BODY = :P29_EOH_BODY',
'	where eoh_bu = :global_bu',
'	 and   eoh_doc_no = :P29_EOH_DOC_NO; */',
'	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6320964948598051798)
,p_internal_uid=>559338233399290124
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041299674699901148)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TO_mail'
,p_static_id=>'to-mail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EORL_RCVR_EMAIL,',
'       EORL_CC_EMAIL  into',
'		 :P29_TO,',
'		 :P29_CC',
'		 from email_outbox_rcvr_list',
'		 where eorl_bu = :global_bu',
'		 and eorl_doc_no = :P29_EOH_DOC_NO;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>559337839156290120
);
wwv_flow_imp.component_end;
end;
/
