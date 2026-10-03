prompt --application/pages/page_100201
begin
--   Manifest
--     PAGE: 100201
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
 p_id=>100201
,p_name=>'Announcement'
,p_alias=>'ANNOUNCEMENT1'
,p_page_mode=>'MODAL'
,p_step_title=>'Announcement'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'700'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6189920783089131133)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'GROUP_NOTIFICATION'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6189937832324131172)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1002:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6189939478229131185)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P100201_GN_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6189938672343131185)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P100201_GN_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6189939098793131185)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P100201_GN_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6189939752820131185)
,p_branch_name=>'Go To Page 1002'
,p_branch_action=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189929476000131152)
,p_name=>'P100201_GN_ATTACH'
,p_source_data_type=>'BLOB'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Attachment'
,p_source=>'GN_ATTACH'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189921530172131139)
,p_name=>'P100201_GN_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'GN_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189925458396131146)
,p_name=>'P100201_GN_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'GN_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189926680991131149)
,p_name=>'P100201_GN_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'GN_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189928729842131150)
,p_name=>'P100201_GN_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189925865591131147)
,p_name=>'P100201_GN_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189926328102131147)
,p_name=>'P100201_GN_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189921902297131141)
,p_name=>'P100201_GN_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Date'
,p_source=>'GN_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189921044067131133)
,p_name=>'P100201_GN_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189924298275131144)
,p_name=>'P100201_GN_DUE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Due Date'
,p_source=>'GN_DUE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189923921268131144)
,p_name=>'P100201_GN_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Eff. From'
,p_source=>'GN_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189923454659131144)
,p_name=>'P100201_GN_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Eff. To'
,p_source=>'GN_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189929884939131152)
,p_name=>'P100201_GN_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189930320642131152)
,p_name=>'P100201_GN_MIME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_MIME_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189922703290131142)
,p_name=>'P100201_GN_NOTI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Notification'
,p_source=>'GN_NOTI'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189923068099131142)
,p_name=>'P100201_GN_NOTI_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Notification By'
,p_source=>'GN_NOTI_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189922315794131142)
,p_name=>'P100201_GN_NOTI_HD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_prompt=>'Notification Title'
,p_source=>'GN_NOTI_HD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189924680156131144)
,p_name=>'P100201_GN_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>'N'
,p_source=>'GN_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189927032849131149)
,p_name=>'P100201_GN_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'GN_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189928257574131150)
,p_name=>'P100201_GN_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'GN_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189929043255131152)
,p_name=>'P100201_GN_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189927497871131149)
,p_name=>'P100201_GN_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189927906061131150)
,p_name=>'P100201_GN_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'GN_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6189925101193131146)
,p_name=>'P100201_GN_VISIBLITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_default=>'PB'
,p_source=>'GN_VISIBLITY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201064164632904204)
,p_name=>'P100201_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_item_source_plug_id=>wwv_flow_imp.id(6189920783089131133)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6188305645206052696)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc.No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    nvl(MAX(gn_doc_no), 1000000000) + 1',
'INTO :p100201_gn_doc_no',
'FROM',
'    group_notification',
'WHERE',
'    gn_bu = :global_bu;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6189939478229131185)
,p_internal_uid=>706343809662441668
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6189940284515131186)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6189920783089131133)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Announcement'
,p_static_id=>'initialize-form-announcement'
,p_internal_uid=>707978448971520158
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8193607162549538359)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RAISE_APPLICATION_ERROR(-20999,:P100201_GN_DOC_NO);',
'',
'DECLARE',
'  v_doc_no VARCHAR2(30);',
'CURSOR C1 ',
'IS',
'    SELECT gn_attach',
'      FROM group_notification',
'      WHERE gn_bu     = :global_bu',
'        AND gn_doc_no = :P100201_GN_DOC_NO;',
'CR1 C1%ROWTYPE;',
'BEGIN',
'OPEN C1;',
'  FETCH C1 INTO CR1;',
'    IF C1%NOTFOUND THEN',
'    ',
'      SELECT MAX(dm_doc_no) +1 dm_doc_no',
'        INTO v_doc_no',
'        FROM doc_mgmt',
'      WHERE dm_bu = :global_bu',
'      ORDER BY dm_doc_no;',
'  RAISE_APPLICATION_ERROR(-20999,v_doc_no);',
'       INSERT INTO doc_mgmt (dm_bu, ',
'                             dm_doc_no,',
'                             dm_blob,',
'                             dm_cre_by,',
'                             dm_cre_date)',
'                  VALUES (:global_bu, ',
'                           v_doc_no,',
'                           CR1.gn_attach, ',
'                           :global_user,',
'                           SYSDATE); ',
'',
'    END IF;',
'CLOSE C1;',
'',
'-- EXCEPTION',
'--     WHEN OTHERS THEN',
'--         NULL;',
'--         --ROLLBACK; -- Rollback in case of an error',
'--         RAISE_application_error(-20999,''can not insert'');  ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>2711645327005927331
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8193607337891538361)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_static_id=>'new-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C1',
'   IS',
'      SELECT dm_doc_no',
'        FROM doc_mgmt',
'       WHERE dm_bu = :global_bu;',
'         -- AND dm_vou_pfx = :P37_DM_VOU_PFX',
'         -- AND dm_vou_no = :P37_DM_VOU_NO;',
'',
'   v_image        apex_application_temp_files.blob_content%TYPE;',
'   v_filename     apex_application_temp_files.filename%TYPE;',
'   v_doc_name     VARCHAR2 (200);',
'   v_doc_no       VARCHAR2 (15);',
'   v_mime_type    VARCHAR2 (200);',
'   v_att_seq_no   NUMBER (5);',
'   v_dir_name     VARCHAR2 (25);',
'',
'   CR1            C1%ROWTYPE;',
'BEGIN',
'   IF CR1.dm_doc_no IS NULL',
'   THEN',
'      SELECT NVL (MAX (TO_NUMBER (dm_doc_no)), 1000000000) + 1',
'        INTO v_doc_no',
'        FROM doc_mgmt',
'       WHERE dm_bu = :global_bu;',
'   END IF;',
'',
'  ----raise_application_error(-20999,:P37_DM_VOU_TYPE||''-''||:P37_DM_VOU_PFX||''-''||:P37_DM_VOU_NO);',
'   SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'     INTO v_att_seq_no',
'     FROM doc_mgmt',
'    WHERE dm_bu = :global_bu;',
'      -- AND dm_vou_type = :P37_DM_VOU_TYPE',
'      --  AND upper(trim(dm_type_desc)) = upper(trim(:P37_DOC_TYPE))',
'      -- AND dm_vou_no = :P37_DM_VOU_NO;',
'',
'   SELECT blob_content,',
'          filename,',
'             SUBSTR (filename, 1, INSTR (filename, ''.'') - 1)',
'          || ''(''',
'          || v_doc_no',
'          || '')''',
'          || ''.''',
'          || SUBSTR (filename,',
'                     INSTR (filename, ''.'', -1) + 1,',
'                     LENGTH (filename) - INSTR (filename, ''.'', -1)),',
'          mime_type',
'     INTO v_image,',
'          v_filename,',
'          v_doc_name,',
'          v_mime_type',
'     FROM apex_application_temp_files',
'    WHERE UPPER (name) = UPPER (:P37_FILE);',
'',
'   IF v_image IS NOT NULL AND v_filename IS NOT NULL',
'   THEN',
'      v_dir_name := ''APEX_ATTACH_DIR'';',
'     ---  raise_application_error(-20999,''test'');',
'      INSERT INTO doc_mgmt (dm_bu,',
'                            dm_doc_no,',
'                            dm_vou_level,',
'                            dm_vou_type,',
'                            dm_vou_plnt,',
'                            dm_vou_pfx,',
'                            dm_vou_no,',
'                            dm_vou_seq_no,',
'                            dm_party_type,',
'                            dm_party_id,',
'                            dm_prod_id,',
'                            dm_prod_rev,',
'                            dm_file_narr,',
'                            dm_doc_type,',
'                            dm_doc_name,',
'                            dm_blob,',
'                            dm_cre_by,',
'                            dm_cre_ip_addr,',
'                            dm_cre_os_user,',
'                            dm_cre_date,',
'                            dm_cre_emp_id,',
'                            dm_attach_id,',
'                            dm_bus_fun_id,',
'                            dm_block_name,',
'                            dm_table_name,',
'                            dm_mime_type,',
'                            dm_file_name,',
'                            dm_party_name,',
'                            dm_loc_type,',
'                            dm_attach_dir,',
'                            dm_module,',
'                            dm_vou_seq2_no,',
'                            dm_vou_seq3_no,',
'                            dm_vou_seq4_no,',
'                            dm_mail_flag,',
'                            dm_att_seq_no,',
'                            dm_type_desc,',
'                            dm_from_date,',
'                            dm_to_date,',
'                            dm_req_doc_no,',
'                            dm_req_doc_rev)',
'           VALUES (:global_bu,',
'                   v_doc_no,',
'                   :P37_DM_VOU_LEVEL,',
'                   :P37_DM_VOU_TYPE,',
'                   :P37_DM_VOU_PLNT,',
'                   :P37_DM_VOU_PFX,',
'                   :P37_DM_VOU_NO,',
'                   v_att_seq_no,',
'                   :P37_DM_PARTY_TYPE,',
'                   :P37_DM_PARTY_ID,',
'                   NULL,',
'                   NULL,',
'                   :P37_FILE_NAME,',
'                   NULL,',
'                   v_doc_name,',
'                   NULL,',
'                   :global_user,',
'                   NULL,',
'                   NULL,',
'                   SYSDATE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   V_MIME_TYPE,',
'                   v_doc_name,--v_filename,',
'                   NULL,',
'                   ''D'',',
'                   v_dir_name,',
'                   :P37_DM_MODULE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   ''N'',',
'                   v_att_seq_no,',
'                   :P37_DOC_TYPE,',
'                   to_date(:P37_DATE_FROM,:global_date_format),',
'                   to_date(:P37_DATE_TO,:global_date_format),',
'                   :P37_DM_REQ_DOC_NO,',
'                   :P37_DM_REQ_DOC_REV);',
'',
'',
'      proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'',
'      COMMIT;',
'   ELSE',
'      apex_error.add_error (',
'         p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'         p_display_location   => apex_error.c_inline_in_notification);',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_internal_uid=>2711645502347927333
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6189940719863131188)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6189920783089131133)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Announcement'
,p_static_id=>'process-form-announcement'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>707978884319520160
);
wwv_flow_imp.component_end;
end;
/
