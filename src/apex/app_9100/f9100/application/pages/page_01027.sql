prompt --application/pages/page_01027
begin
--   Manifest
--     PAGE: 01027
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
 p_id=>1027
,p_name=>'Help Desk'
,p_alias=>'HELP-DESK1'
,p_page_mode=>'MODAL'
,p_step_title=>'Help Desk'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-header{',
'   --background-color:#2ebfbc;',
'    background-color:#2663bb;',
'    color: snow;',
'    line-height: 0em!important;',
'}',
'',
'.t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer {',
'    display: flex;',
'    padding: .1rem;',
'    align-items: flex-start;',
'}',
'',
'.t-Dialog-bodyWrapperIn {',
'    position: absolute;',
'    top: 0;',
'    left: 0;',
'    width: 100%;',
'    height: 100%;',
'    overflow: auto;',
'    --background: midnightblue;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'50%'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6772810253883997614)
,p_plug_name=>'Help Desk'
,p_static_id=>'help-desk'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Form--leftLabels:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201486061293686914)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201484923114686913)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_condition=>'P1027_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201485673665686914)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'1=7'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201485273011686914)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'DELETE'
,p_button_condition=>'P1027_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6201496139129686928)
,p_branch_name=>'Go To Page 39'
,p_branch_action=>'f?p=&APP_ID.:1026:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201487315279686921)
,p_name=>'P1027_FILE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'HHD_FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201487672941686921)
,p_name=>'P1027_HHD_BU'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'HHD_BU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201489677900686922)
,p_name=>'P1027_HHD_CATEGORY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Category</b>'
,p_source=>'HHD_CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:General;G,Lost of Info.;L,ID Lost;I,Att. Policy En query;A'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Category'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-list'
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201492848387686924)
,p_name=>'P1027_HHD_CRE_BY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'HHD_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201493262439686924)
,p_name=>'P1027_HHD_CRE_DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'HHD_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201488111968686921)
,p_name=>'P1027_HHD_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
' SELECT NVL(MAX(HHD_DOC_NO),0) + 1  INTO :P1027_HHD_DOC_NO',
'   FROM HRM_HELP_DESK',
'  WHERE hhd_bu=:global_bu;',
'',
'RETURN :P1027_HHD_DOC_NO;',
'END;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source=>'HHD_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201489269405686922)
,p_name=>'P1027_HHD_DUE_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Due Date</b>'
,p_source=>'HHD_DUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_begin_on_new_line=>'N'
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201491302343686924)
,p_name=>'P1027_HHD_EMP_ATT_DOC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<font color="white"><b>Attachment</b></font>'
,p_source=>'HHD_EMP_ATT_DOC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'filename_column', 'HHD_FILE_NAME',
  'mime_type_column', 'HHD_MIME_TYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201490857169686922)
,p_name=>'P1027_HHD_EMP_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Description</b>'
,p_source=>'HHD_EMP_DESC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201488481512686921)
,p_name=>'P1027_HHD_EMP_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'HHD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201490453672686922)
,p_name=>'P1027_HHD_EMP_NOTES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Notes</b>'
,p_source=>'HHD_EMP_NOTES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201492460077686924)
,p_name=>'P1027_HHD_HR_ATT_DOC'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
':P1027_HHD_HR_ATT_DOC :=utl_raw.cast_to_raw(:P1027_HHD_HR_ATT_DOC);',
'END;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<font color="white"><b>Attachment</b></font>'
,p_source=>'HHD_HR_ATT_DOC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>':global_user =''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'NATIVE',
  'display_download_link', 'Y',
  'filename_column', 'HHD_FILE_NAME',
  'mime_type_column', 'HHD_MIME_TYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201492112640686924)
,p_name=>'P1027_HHD_HR_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Description</b>'
,p_source=>'HHD_HR_DESC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>':global_user =''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201491658477686924)
,p_name=>'P1027_HHD_HR_NOTES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Notes</b>'
,p_source=>'HHD_HR_NOTES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':global_user =''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201490073998686922)
,p_name=>'P1027_HHD_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_item_default=>'R'
,p_source=>'HHD_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201488912003686921)
,p_name=>'P1027_HHD_TITLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Title</b>'
,p_source=>'HHD_TITLE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_display_when=>':global_user <>''KIRAN'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-credit-card'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-lg:margin-right-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201493708968686925)
,p_name=>'P1027_HHD_UPD_BY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'HHD_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201494127430686925)
,p_name=>'P1027_HHD_UPD_DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'HHD_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201486874100686919)
,p_name=>'P1027_MIME_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'HHD_MIME_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201486495715686916)
,p_name=>'P1027_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6772810253883997614)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201494506030686927)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from HRM_HELP_DESK'
,p_static_id=>'fetch-row-from-hrm-help-desk'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'primary_key_column', 'ROWID',
  'primary_key_item', 'P1027_ROWID',
  'table_name', 'HRM_HELP_DESK')).to_clob
,p_internal_uid=>719532670487075899
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201494927014686927)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of HRM_HELP_DESK'
,p_static_id=>'process-row-of-hrm-help-desk'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'primary_key_column', 'ROWID',
  'primary_key_item', 'P1027_ROWID',
  'supported_operations', 'I:U:D',
  'table_name', 'HRM_HELP_DESK')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>719533091471075899
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201495237383686927)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_static_id=>'reset-page'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6201485673665686914)
,p_internal_uid=>719533401840075899
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201495660123686928)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Status'
,p_static_id=>'status'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update HRM_HELP_DESK set HHD_STATUS = ''C''  where  ',
' HHD_BU  = :P1027_HHD_BU ',
'and  HHD_DOC_NO	 = :P1027_HHD_DOC_NO;',
'end ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6201485273011686914)
,p_internal_uid=>719533824580075900
);
wwv_flow_imp.component_end;
end;
/
