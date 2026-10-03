prompt --application/pages/page_367026301
begin
--   Manifest
--     PAGE: 367026301
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
 p_id=>367026301
,p_name=>'Appl. Ctrl. - Workflow Management'
,p_alias=>'APPL-CTRL-WORKFLOW-MANAGEMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Appl. Ctrl. - Workflow Management'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11659943229328735975)
,p_plug_name=>'Appl. Ctrl. - Workflow Management'
,p_static_id=>'appl-ctrl-workflow-management'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WFM_CONTROL'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11659955920239735984)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11659958294596735986)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P367026301_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11659957474846735986)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Delete'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11659957884963735986)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P367026301_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11641417824890870268)
,p_branch_name=>'Go To Page 3670263'
,p_branch_action=>'f?p=&APP_ID.:3670263:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659943582098735976)
,p_name=>'P367026301_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659944802323735976)
,p_name=>'P367026301_WFMC_ALLOW_DIR_APPR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_prompt=>'Allow Direct Fwd. while Processing'
,p_source=>'WFMC_ALLOW_DIR_APPR_FWD_FLAG'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659945206380735976)
,p_name=>'P367026301_WFMC_ALLOW_DIR_RTN_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_prompt=>'Allow Direct Return to Creator'
,p_source=>'WFMC_ALLOW_DIR_RTN_TO_CRE'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659944024020735976)
,p_name=>'P367026301_WFMC_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659946422353735978)
,p_name=>'P367026301_WFMC_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659947582430735979)
,p_name=>'P367026301_WFMC_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_format_mask=>'DD-MON-YYYY HH:MI:SSPM'
,p_source=>'WFMC_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659949599240735981)
,p_name=>'P367026301_WFMC_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659946730875735978)
,p_name=>'P367026301_WFMC_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659947156625735978)
,p_name=>'P367026301_WFMC_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659944353842735976)
,p_name=>'P367026301_WFMC_DOC_COMP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_default=>'S'
,p_prompt=>'Document Approval'
,p_source=>'WFMC_DOC_COMP'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Sequential;S,Non Sequential;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659945959176735978)
,p_name=>'P367026301_WFMC_MAIL_OPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_default=>'U'
,p_prompt=>'Mail Option'
,p_source=>'WFMC_MAIL_OPTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:User Wise;U,Department Wise;D'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659945604339735978)
,p_name=>'P367026301_WFMC_REPORT_FILE_RE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_prompt=>'Report File Req.'
,p_source=>'WFMC_REPORT_FILE_REQ'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659948016222735979)
,p_name=>'P367026301_WFMC_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659949129691735979)
,p_name=>'P367026301_WFMC_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_format_mask=>'DD-MON-YYYY HH:MI:SSPM'
,p_source=>'WFMC_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659949938597735981)
,p_name=>'P367026301_WFMC_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659948365150735979)
,p_name=>'P367026301_WFMC_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11659948787138735979)
,p_name=>'P367026301_WFMC_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_item_source_plug_id=>wwv_flow_imp.id(11659943229328735975)
,p_source=>'WFMC_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11659956025719735984)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11659955920239735984)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11659956824565735986)
,p_event_id=>wwv_flow_imp.id(11659956025719735984)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11659958709808735986)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11659943229328735975)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Appl. Ctrl. - Workflow Management'
,p_static_id=>'initialize-form-appl-ctrl-workflow-management'
,p_internal_uid=>6177996874265124958
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11659959096201735987)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11659943229328735975)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Appl. Ctrl. - Workflow Management'
,p_static_id=>'process-form-appl-ctrl-workflow-management'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6177997260658124959
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641417645944870267)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process_preinsert'
,p_static_id=>'process-preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P367026301_ROWID IS NULL THEN   						   ',
'   ',
'   :P367026301_WFMC_BU          := :GLOBAL_BU;',
'   :P367026301_WFMC_CRE_BY      := :GLOBAL_USER;',
'   :P367026301_WFMC_CRE_IP_ADDR := :GLOBAL_IP_ADDR;',
'   :P367026301_WFMC_CRE_OS_USER := :GLOBAL_OS_USER;',
'   :P367026301_WFMC_CRE_EMP_ID  := :GLOBAL_EMP;',
'   :P367026301_WFMC_CRE_DATE    := TO_CHAR(SYSDATE, ''DD-MON-YYYY HH:MI:SSPM'');',
'   ',
'END IF;',
'',
'IF :P367026301_ROWID IS NOT NULL THEN',
'    ',
'   :P367026301_WFMC_UPD_BY      := :GLOBAL_USER;',
'   :P367026301_WFMC_UPD_IP_ADDR := :GLOBAL_IP_ADDR;',
'   :P367026301_WFMC_UPD_OS_USER := :GLOBAL_OS_USER;',
'   :P367026301_WFMC_UPD_EMP_ID  := :GLOBAL_USER_EMP;',
'   :P367026301_WFMC_UPD_DATE    := TO_CHAR(SYSDATE, ''DD-MON-YYYY HH:MI:SSPM'');',
' ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6159455810401259239
);
wwv_flow_imp.component_end;
end;
/
