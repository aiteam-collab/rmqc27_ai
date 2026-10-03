prompt --application/pages/page_13117102006
begin
--   Manifest
--     PAGE: 13117102006
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
 p_id=>13117102006
,p_name=>'Attachment'
,p_alias=>'ATTACHMENT3'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-header {',
'    border-bottom-right-radius: 0!important;',
'    border-bottom-left-radius: 0!important;',
'    border-bottom: 1px solid #E8E8E8;',
'    -ms-box-sizing: border-box;',
'    -o-box-sizing: border-box;',
'    box-sizing: border-box;',
'    display: table;',
'    table-layout: auto;',
'    width: 100%;',
'    font-size: 1.6rem;',
'    font-weight: 400;',
'    line-height: 0.5rem;',
'}',
'',
'.t-Region-headerItems--title {',
'       background-color: #b59754;',
'    border-bottom: 2px solid #ff607e;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16310803159196792831)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11160750065650455651)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_button_name=>'Apply_Changes'
,p_static_id=>'apply-changes'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P13117102006_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11160750437851455653)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:13117102005:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11160750900807455653)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P13117102006_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11160751234088455654)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(16310803159196792831)
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
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11160758185836455665)
,p_branch_name=>'Go To Page 13117102005'
,p_branch_action=>'f?p=&APP_ID.:13117102005:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160752110894455656)
,p_name=>'P13117102006_OPPAH_BU'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'OPPAH_BU'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>5
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160754523754455661)
,p_name=>'P13117102006_OPPAH_CRE_BY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'OPPAH_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160754903949455661)
,p_name=>'P13117102006_OPPAH_CRE_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'OPPAH_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160754114942455659)
,p_name=>'P13117102006_OPPAH_DOC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Attachment'
,p_source=>'OPPAH_DOC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'filename_column', 'OPPAH_DOC_NAME',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160753258658455657)
,p_name=>'P13117102006_OPPAH_DOC_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'OPPAH_DOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>50
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160752468343455656)
,p_name=>'P13117102006_OPPAH_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'OPPAH_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160753673608455657)
,p_name=>'P13117102006_OPPAH_FILE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File Name'
,p_source=>'OPPAH_FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_tag_css_classes=>'input'
,p_tag_attributes=>'onKeyUp="this.value = this.value.toUpperCase()" '
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160752919945455657)
,p_name=>'P13117102006_OPPAH_SEQ_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'OPPAH_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160755288306455661)
,p_name=>'P13117102006_OPPAH_UPD_BY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'OPPAH_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160755682292455662)
,p_name=>'P13117102006_OPPAH_UPD_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'OPPAH_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11160751723767455654)
,p_name=>'P13117102006_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16310803159196792831)
,p_use_cache_before_default=>'NO'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11160756179319455664)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>'P13117102006_OPPAH_FILE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please Attach Your Document.'
,p_associated_item=>wwv_flow_imp.id(11160753673608455657)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11160756438698455664)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from OPPORT_ATTACH_HD'
,p_static_id=>'fetch-row-from-opport-attach-hd'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'primary_key_column', 'ROWID',
  'primary_key_item', 'P13117102006_ROWID',
  'table_name', 'OPPORT_ATTACH_HD')).to_clob
,p_internal_uid=>5678794603154844636
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11160756916759455664)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of OPPORT_ATTACH_HD'
,p_static_id=>'process-row-of-opport-attach-hd'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'primary_key_column', 'ROWID',
  'primary_key_item', 'P13117102006_ROWID',
  'supported_operations', 'I:U:D',
  'table_name', 'OPPORT_ATTACH_HD')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>5678795081215844636
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11160757242059455665)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_static_id=>'reset-page'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11160751234088455654)
,p_internal_uid=>5678795406515844637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11160757635668455665)
,p_process_sequence=>50
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'seq_no'
,p_static_id=>'seq-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20999,:P13117102006_OPHD_DOC_NO||:global_bu);',
'SELECT NVL (MAX (oppah_seq_no), 0) + 1',
'          INTO :P13117102006_OPPAH_SEQ_NO',
'          FROM opport_attach_hd',
'         WHERE oppah_bu = :GLOBAL_bu ',
'         AND oppah_doc_no = :P13117102006_OPPAH_DOC_NO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11160750900807455653)
,p_internal_uid=>5678795800124844637
);
wwv_flow_imp.component_end;
end;
/
