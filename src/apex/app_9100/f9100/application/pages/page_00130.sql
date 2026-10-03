prompt --application/pages/page_00130
begin
--   Manifest
--     PAGE: 00130
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
 p_id=>130
,p_name=>'Attachment'
,p_alias=>'EMAIL-OUTBOX-ATTACH'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5631537026700133803)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5631524932522133529)
,p_plug_name=>'EMAIL_OUTBOX_ATTACH'
,p_static_id=>'email-outbox-attach'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMAIL_OUTBOX_ATTACH'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5630643846668013843)
,p_plug_name=>'FILE'
,p_static_id=>'file'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5631537376169133804)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5631537026700133803)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5631539534060133851)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_condition=>'P130_EOA_BU'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5631538666952133849)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5631537026700133803)
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
,p_button_condition=>'P130_EOA_BU'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5631539062260133851)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_condition=>'P130_EOA_BU'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5630644394304013848)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5630643846668013843)
,p_button_name=>'UPLOAD'
,p_static_id=>'upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconRight:t-Button--hoverIconPush:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
,p_grid_column_span=>5
,p_grid_column=>4
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5630644438806013849)
,p_branch_name=>'Go to page 129'
,p_branch_action=>'f?p=&APP_ID.:129:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630644065237013845)
,p_name=>'P130_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5630643846668013843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631525153902133549)
,p_name=>'P130_EOA_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'EOA_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631527488520133768)
,p_name=>'P130_EOA_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631528647844133773)
,p_name=>'P130_EOA_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631530695063133779)
,p_name=>'P130_EOA_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631527841101133768)
,p_name=>'P130_EOA_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631528324323133770)
,p_name=>'P130_EOA_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631526672142133767)
,p_name=>'P130_EOA_DOC'
,p_source_data_type=>'BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_prompt=>'&nbsp;'
,p_source=>'EOA_DOC'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
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
 p_id=>wwv_flow_imp.id(5631525633960133590)
,p_name=>'P130_EOA_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631526307539133767)
,p_name=>'P130_EOA_FILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_FILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631531512765133781)
,p_name=>'P130_EOA_MAIL_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_default=>'A'
,p_source=>'EOA_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631526017232133617)
,p_name=>'P130_EOA_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631527084188133768)
,p_name=>'P130_EOA_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631529077827133776)
,p_name=>'P130_EOA_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631530281844133779)
,p_name=>'P130_EOA_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631531088264133779)
,p_name=>'P130_EOA_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631529485985133778)
,p_name=>'P130_EOA_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631529908123133778)
,p_name=>'P130_EOA_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'EOA_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630643987389013844)
,p_name=>'P130_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5630643846668013843)
,p_prompt=>'File'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>5
,p_grid_column=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'dropzone_title', 'Choose your File',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630642992435013834)
,p_name=>'P130_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_item_source_plug_id=>wwv_flow_imp.id(5631524932522133529)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630644250314013847)
,p_name=>'P130_SEQ_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5630643846668013843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5631537479775133804)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5631537376169133804)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5631538182013133835)
,p_event_id=>wwv_flow_imp.id(5631537479775133804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5631540639112133863)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>149578803568522835
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5631539903827133857)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(5631524932522133529)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form EMAIL_OUTBOX_ATTACH'
,p_static_id=>'initialize-form-email-outbox-attach'
,p_internal_uid=>149578068283522829
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5630643796520013842)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT'
,p_static_id=>'insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C1',
'       IS',
'    SELECT EOA_SEQ_NO',
'      FROM EMAIL_OUTBOX_ATTACH',
'     WHERE EOA_BU     = :GLOBAL_BU',
'       AND EOA_DOC_NO = :P130_DOC_NO',
'       AND EOA_SEQ_NO = :P130_SEQ_NO ;',
'',
'   v_image        apex_application_temp_files.blob_content%TYPE;',
'   v_filename     apex_application_temp_files.filename%TYPE;',
'   v_doc_name     VARCHAR2 (200);',
'   v_doc_no       VARCHAR2 (15);',
'   v_mime_type    VARCHAR2 (200);',
'   v_att_seq_no   NUMBER (5);',
'   v_dir_name     VARCHAR2 (25);',
'   v_dir_path     VARCHAR2 (150);',
'',
'   CR1            C1%ROWTYPE;',
'BEGIN',
'   OPEN c1;',
'    FETCH c1 INTO cr1;',
'   IF CR1.EOA_SEQ_NO IS NULL',
'   THEN',
'      SELECT NVL (MAX (TO_NUMBER (EOA_SEQ_NO)),0) + 1',
'        INTO v_att_seq_no',
'        FROM EMAIL_OUTBOX_ATTACH',
'       WHERE EOA_BU     = :GLOBAL_BU',
'         AND EOA_DOC_NO = :P130_DOC_NO;',
'   END IF;',
'   CLOSE C1;',
'',
'IF :P130_FILE IS NOT NULL THEN',
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
'    WHERE UPPER (name) = UPPER (:P130_FILE);',
'',
'END IF;',
'-- RAISE_APPLICATION_ERROR(-20999,''HRM''||''~''||v_filename||''~''||v_doc_name);',
'IF v_att_seq_no IS NOT NULL THEN',
'',
'      v_dir_name := ''C_DIR'';',
'',
'      	SELECT directory_path',
'          INTO v_dir_path',
'          FROM sys.dba_directories',
'         WHERE directory_name = ''FILE_ATTACH_DIR'';',
'',
'      v_doc_name := v_dir_path||v_doc_name ;',
'',
'    INSERT INTO EMAIL_OUTBOX_ATTACH (',
'                EOA_BU,',
'                EOA_DOC_NO,',
'                EOA_SEQ_NO,',
'                EOA_FILENAME,',
'                EOA_DOC,',
'                EOA_TYPE,',
'                EOA_CRE_BY,',
'                EOA_CRE_IP_ADDR,',
'                EOA_CRE_DATE,',
'                EOA_CRE_EMP_ID,',
'                EOA_MAIL_TYPE)',
'        VALUES (',
'                :GLOBAL_BU,',
'                :P130_DOC_NO,',
'                v_att_seq_no,',
'                v_doc_name,',
'                NULL,',
'                NULL,',
'                :GLOBAL_USER,',
'                :GLOBAL_IP,',
'                SYSDATE,',
'                :GLOBAL_EMP_ID,',
'                ''A''-- v_mime_type',
'               );',
'',
'    IF v_image IS NOT NULL THEN',
'       proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'    END IF;',
'',
'    COMMIT;',
'ELSE',
'      -- apex_error.add_error (',
'      --    p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'      --    p_display_location   => apex_error.c_inline_in_notification);',
'',
'OPEN c1;',
'  FETCH c1 INTO cr1;',
'  IF CR1.EOA_SEQ_NO IS NOT NULL THEN',
'',
'    v_dir_name := ''C_DIR'';',
'',
'    UPDATE EMAIL_OUTBOX_ATTACH',
'       SET EOA_FILENAME    = v_doc_name,',
'           EOA_DOC         = NULL,',
'           EOA_UPD_BY      = :GLOBAL_USER,',
'           EOA_UPD_DATE    = SYSDATE,',
'           EOA_UPD_EMP_ID  = :GLOBAL_EMP_ID,',
'           EOA_UPD_IP_ADDR = :GLOBAL_IP',
'     WHERE EOA_BU          = :GLOBAL_BU',
'       AND EOA_DOC_NO      = :P130_DOC_NO',
'       AND EOA_SEQ_NO      = CR1.EOA_SEQ_NO ;',
'',
'    IF v_image IS NOT NULL THEN',
'       proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'    END IF;',
'CLOSE c1;',
'END IF;',
'',
'END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>148681960976402814
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5630643044534013835)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P130_ROWID IS NULL THEN',
'   SELECT NVL(MAX(eoa_seq_no),0) + 1',
'     INTO :P130_EOA_SEQ_NO',
'     FROM email_outbox_attach',
'    WHERE eoa_bu     = :GLOBAL_BU ',
'      AND eoa_doc_no = :P130_EOA_DOC_NO;',
'',
'   :P130_EOA_BU          := :GLOBAL_BU;',
'   :P130_EOA_CRE_BY      := :GLOBAL_USER;',
'   :P130_EOA_CRE_DATE    := SYSDATE;',
'   :P130_EOA_CRE_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P130_EOA_CRE_IP_ADDR := :GLOBAL_IP;',
'   -- :P130_EOA_CRE_OS_USER := :GLOBAL_OS_USER;',
'ELSE ',
'   :P130_EOA_UPD_BY      := :GLOBAL_USER;',
'   :P130_EOA_UPD_DATE    := SYSDATE;',
'   :P130_EOA_UPD_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P130_EOA_UPD_IP_ADDR := :GLOBAL_IP;',
'   -- :P130_EOA_UPD_OS_USER := :GLOBAL_OS_USER;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>148681208990402807
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5631540236820133862)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5631524932522133529)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form EMAIL_OUTBOX_ATTACH'
,p_static_id=>'process-form-email-outbox-attach'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>149578401276522834
);
wwv_flow_imp.component_end;
end;
/
