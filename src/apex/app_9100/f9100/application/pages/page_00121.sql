prompt --application/pages/page_00121
begin
--   Manifest
--     PAGE: 00121
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
 p_id=>121
,p_name=>'NCR'
,p_alias=>'NCR3'
,p_page_mode=>'MODAL'
,p_step_title=>'NCR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6442994439513150188)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6442897721228150024)
,p_plug_name=>'NCR'
,p_static_id=>'ncr'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TQM_NCR'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5658684292076078776)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6442994439513150188)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5658683921477078776)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6442994439513150188)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P121_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5658683476506078770)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6442994439513150188)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P121_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5658684644460078776)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6442994439513150188)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P121_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442899030029150847)
,p_name=>'P121_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442930519515150914)
,p_name=>'P121_TQNCR_8D_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr 8d Doc No'
,p_source=>'TQNCR_8D_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442930948599150914)
,p_name=>'P121_TQNCR_8D_RQRD_FL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr 8d Rqrd Flag'
,p_source=>'TQNCR_8D_RQRD_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442929721074150912)
,p_name=>'P121_TQNCR_8D_SEL_FLA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr 8d Sel Flag'
,p_source=>'TQNCR_8D_SEL_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442930143496150912)
,p_name=>'P121_TQNCR_8D_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr 8d User'
,p_source=>'TQNCR_8D_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442905740950150879)
,p_name=>'P121_TQNCR_ACCPT_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Accpt Qty'
,p_source=>'TQNCR_ACCPT_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442924492709150906)
,p_name=>'P121_TQNCR_ACTUAL_CAU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Actual Cause'
,p_source=>'TQNCR_ACTUAL_CAUSE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442946522389150936)
,p_name=>'P121_TQNCR_ACT_DRG_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1200
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Act Drg No'
,p_source=>'TQNCR_ACT_DRG_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442946900796150936)
,p_name=>'P121_TQNCR_ACT_DRG_RE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1210
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Act Drg Rev'
,p_source=>'TQNCR_ACT_DRG_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442946080847150936)
,p_name=>'P121_TQNCR_ACT_RCVD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1190
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Act Rcvd'
,p_source=>'TQNCR_ACT_RCVD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442934539989150920)
,p_name=>'P121_TQNCR_AOD_CFRM_Q'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Aod Cfrm Qty'
,p_source=>'TQNCR_AOD_CFRM_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442934894374150920)
,p_name=>'P121_TQNCR_AOD_NON_CF'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Aod Non Cfrm Qty'
,p_source=>'TQNCR_AOD_NON_CFRM_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442906065579150881)
,p_name=>'P121_TQNCR_AOD_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Aod Qty'
,p_source=>'TQNCR_AOD_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442938936121150926)
,p_name=>'P121_TQNCR_AOD_REASON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Aod Reason'
,p_source=>'TQNCR_AOD_REASON'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442907313576150883)
,p_name=>'P121_TQNCR_ASSGN_TO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Assgn To'
,p_source=>'TQNCR_ASSGN_TO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442947721439150937)
,p_name=>'P121_TQNCR_AUDIT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1230
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Audit Type'
,p_source=>'TQNCR_AUDIT_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442953296363150945)
,p_name=>'P121_TQNCR_AUTO_NON_P'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Auto Non Parts'
,p_source=>'TQNCR_AUTO_NON_PARTS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442922927406150904)
,p_name=>'P121_TQNCR_BRAIN_STOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Brain Storm'
,p_source=>'TQNCR_BRAIN_STORM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442899372592150851)
,p_name=>'P121_TQNCR_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Bu'
,p_source=>'TQNCR_BU'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442943342596150931)
,p_name=>'P121_TQNCR_CAR_REQ_FL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Car Req Flag'
,p_source=>'TQNCR_CAR_REQ_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442922146200150903)
,p_name=>'P121_TQNCR_CE_DIA_FLA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ce Dia Flag'
,p_source=>'TQNCR_CE_DIA_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442920928287150901)
,p_name=>'P121_TQNCR_CHK_SHEETS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Chk Sheets Flag'
,p_source=>'TQNCR_CHK_SHEETS_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442920500013150901)
,p_name=>'P121_TQNCR_CLOSED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Closed By'
,p_source=>'TQNCR_CLOSED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442915709262150892)
,p_name=>'P121_TQNCR_CLOSE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Close Date'
,p_source=>'TQNCR_CLOSE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442916146657150893)
,p_name=>'P121_TQNCR_CLOSE_REM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Close Rem'
,p_source=>'TQNCR_CLOSE_REM'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>300
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442910904963150887)
,p_name=>'P121_TQNCR_CORR_ACTIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Req'
,p_source=>'TQNCR_CORR_ACTION_REQ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442911268521150887)
,p_name=>'P121_TQNCR_CORR_ACTIO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Tkn'
,p_source=>'TQNCR_CORR_ACTION_TKN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442911668128150887)
,p_name=>'P121_TQNCR_CORR_ACTIO_2'
,p_source_data_type=>'DATE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Date'
,p_source=>'TQNCR_CORR_ACTION_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442912160361150887)
,p_name=>'P121_TQNCR_CORR_ACTIO_3'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Tkn By'
,p_source=>'TQNCR_CORR_ACTION_TKN_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442912519322150889)
,p_name=>'P121_TQNCR_CORR_ACTIO_4'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Ver By'
,p_source=>'TQNCR_CORR_ACTION_VER_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442912881890150889)
,p_name=>'P121_TQNCR_CORR_ACTIO_5'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Corr Action Ver Date'
,p_source=>'TQNCR_CORR_ACTION_VER_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442948912988150939)
,p_name=>'P121_TQNCR_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1260
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Cre By'
,p_source=>'TQNCR_CRE_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442950063109150942)
,p_name=>'P121_TQNCR_CRE_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>1290
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Cre Date'
,p_source=>'TQNCR_CRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442952088425150943)
,p_name=>'P121_TQNCR_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1340
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Cre Emp Id'
,p_source=>'TQNCR_CRE_EMP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442949297971150939)
,p_name=>'P121_TQNCR_CRE_IP_ADD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1270
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Cre Ip Addr'
,p_source=>'TQNCR_CRE_IP_ADDR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442949710739150939)
,p_name=>'P121_TQNCR_CRE_OS_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1280
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Cre Os User'
,p_source=>'TQNCR_CRE_OS_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442944120285150933)
,p_name=>'P121_TQNCR_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Dept Id'
,p_source=>'TQNCR_DEPT_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442923662620150904)
,p_name=>'P121_TQNCR_DISP_ACTIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Disp Action Auth'
,p_source=>'TQNCR_DISP_ACTION_AUTH'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442925689249150908)
,p_name=>'P121_TQNCR_DISP_ACTIO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Disp Action Flag'
,p_source=>'TQNCR_DISP_ACTION_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442924101010150906)
,p_name=>'P121_TQNCR_DISP_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Disp Date'
,p_source=>'TQNCR_DISP_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442944495007150933)
,p_name=>'P121_TQNCR_DRG_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1150
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Drg No'
,p_source=>'TQNCR_DRG_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442944897390150934)
,p_name=>'P121_TQNCR_DRG_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1160
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Drg Rev'
,p_source=>'TQNCR_DRG_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442929311546150912)
,p_name=>'P121_TQNCR_EFF_ACT_DT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Eff Act Dtls'
,p_source=>'TQNCR_EFF_ACT_DTLS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442945722209150934)
,p_name=>'P121_TQNCR_HEAT_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1180
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Heat No'
,p_source=>'TQNCR_HEAT_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442921748666150903)
,p_name=>'P121_TQNCR_HISTO_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Histo Flag'
,p_source=>'TQNCR_HISTO_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442925300559150908)
,p_name=>'P121_TQNCR_IMM_ACTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Imm Action'
,p_source=>'TQNCR_IMM_ACTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442928944162150911)
,p_name=>'P121_TQNCR_IMPL_ACT_D'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Impl Act Dtls'
,p_source=>'TQNCR_IMPL_ACT_DTLS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442953686777150947)
,p_name=>'P121_TQNCR_ISSUE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Issue Type'
,p_source=>'TQNCR_ISSUE_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442900495881150864)
,p_name=>'P121_TQNCR_NCR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ncr Date'
,p_source=>'TQNCR_NCR_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442900170042150864)
,p_name=>'P121_TQNCR_NCR_NO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ncr No'
,p_source=>'TQNCR_NCR_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442901262054150865)
,p_name=>'P121_TQNCR_NCR_TO_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ncr To Id'
,p_source=>'TQNCR_NCR_TO_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442900868079150864)
,p_name=>'P121_TQNCR_NCR_TO_TYP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ncr To Type'
,p_source=>'TQNCR_NCR_TO_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442926134586150908)
,p_name=>'P121_TQNCR_NCR_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ncr Type'
,p_source=>'TQNCR_NCR_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442936561310150922)
,p_name=>'P121_TQNCR_OBS_NO_ATT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Obs No Attr'
,p_source=>'TQNCR_OBS_NO_ATTR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442938138886150923)
,p_name=>'P121_TQNCR_OBS_NO_ATT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Obs No Attr Ent'
,p_source=>'TQNCR_OBS_NO_ATTR_ENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442936094680150922)
,p_name=>'P121_TQNCR_OBS_NO_VAR'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Obs No Var'
,p_source=>'TQNCR_OBS_NO_VAR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442937665375150923)
,p_name=>'P121_TQNCR_OBS_NO_VAR_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Obs No Var Ent'
,p_source=>'TQNCR_OBS_NO_VAR_ENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442952937180150945)
,p_name=>'P121_TQNCR_OCCUR_AT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Occur At'
,p_source=>'TQNCR_OCCUR_AT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442923326826150904)
,p_name=>'P121_TQNCR_OTHER_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Other Flag'
,p_source=>'TQNCR_OTHER_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442921325769150903)
,p_name=>'P121_TQNCR_PARESTO_FL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Paresto Flag'
,p_source=>'TQNCR_PARESTO_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442899831639150853)
,p_name=>'P121_TQNCR_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Plnt'
,p_source=>'TQNCR_PLNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442924906810150906)
,p_name=>'P121_TQNCR_POTENTIAL_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Potential Cause'
,p_source=>'TQNCR_POTENTIAL_CAUSE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442913291374150889)
,p_name=>'P121_TQNCR_PREV_ACTIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Req'
,p_source=>'TQNCR_PREV_ACTION_REQ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442913732510150890)
,p_name=>'P121_TQNCR_PREV_ACTIO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Tkn'
,p_source=>'TQNCR_PREV_ACTION_TKN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442914125242150890)
,p_name=>'P121_TQNCR_PREV_ACTIO_2'
,p_source_data_type=>'DATE'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Date'
,p_source=>'TQNCR_PREV_ACTION_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442914468845150890)
,p_name=>'P121_TQNCR_PREV_ACTIO_3'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Tkn By'
,p_source=>'TQNCR_PREV_ACTION_TKN_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442914897556150892)
,p_name=>'P121_TQNCR_PREV_ACTIO_4'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Ver By'
,p_source=>'TQNCR_PREV_ACTION_VER_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442915264021150892)
,p_name=>'P121_TQNCR_PREV_ACTIO_5'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prev Action Ver Date'
,p_source=>'TQNCR_PREV_ACTION_VER_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442931355169150914)
,p_name=>'P121_TQNCR_PRIM_REJ_Q'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prim Rej Qty'
,p_source=>'TQNCR_PRIM_REJ_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442904927345150879)
,p_name=>'P121_TQNCR_PROC_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Proc Desc'
,p_source=>'TQNCR_PROC_DESC'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442904490988150878)
,p_name=>'P121_TQNCR_PROC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Proc Id'
,p_source=>'TQNCR_PROC_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442903754957150878)
,p_name=>'P121_TQNCR_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prod Id'
,p_source=>'TQNCR_PROD_ID'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442904100303150878)
,p_name=>'P121_TQNCR_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Prod Rev'
,p_source=>'TQNCR_PROD_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442907709611150883)
,p_name=>'P121_TQNCR_QA_REM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qa Rem'
,p_source=>'TQNCR_QA_REM'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442902508591150867)
,p_name=>'P121_TQNCR_QC_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Doc No'
,p_source=>'TQNCR_QC_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442902119687150867)
,p_name=>'P121_TQNCR_QC_DOC_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Doc Pfx'
,p_source=>'TQNCR_QC_DOC_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442902883809150867)
,p_name=>'P121_TQNCR_QC_DOC_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Doc Rev'
,p_source=>'TQNCR_QC_DOC_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442903359901150867)
,p_name=>'P121_TQNCR_QC_DOC_SEQ'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Doc Seq No'
,p_source=>'TQNCR_QC_DOC_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442906892624150883)
,p_name=>'P121_TQNCR_QC_INSP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Insp Id'
,p_source=>'TQNCR_QC_INSP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442901668348150865)
,p_name=>'P121_TQNCR_QC_INS_TYP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Qc Ins Type'
,p_source=>'TQNCR_QC_INS_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>2
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442905312085150879)
,p_name=>'P121_TQNCR_RCT_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rct Qty'
,p_source=>'TQNCR_RCT_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442943673678150933)
,p_name=>'P121_TQNCR_RCVD_DEPT_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rcvd Dept Id'
,p_source=>'TQNCR_RCVD_DEPT_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442939752571150926)
,p_name=>'P121_TQNCR_REJECT_REA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Reject Reason'
,p_source=>'TQNCR_REJECT_REASON'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442906540861150881)
,p_name=>'P121_TQNCR_REJ_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rej Qty'
,p_source=>'TQNCR_REJ_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442947336703150937)
,p_name=>'P121_TQNCR_REMARKS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1220
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Remarks'
,p_source=>'TQNCR_REMARKS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442932107400150917)
,p_name=>'P121_TQNCR_RETURN_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Return Qty'
,p_source=>'TQNCR_RETURN_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442938538464150925)
,p_name=>'P121_TQNCR_RETURN_REA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Return Reason'
,p_source=>'TQNCR_RETURN_REASON'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442940517134150928)
,p_name=>'P121_TQNCR_RET_SEL_FL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ret Sel Flag'
,p_source=>'TQNCR_RET_SEL_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442940959613150929)
,p_name=>'P121_TQNCR_RET_SEL_US'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ret Sel User'
,p_source=>'TQNCR_RET_SEL_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442948523408150937)
,p_name=>'P121_TQNCR_REV_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>1250
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rev Date'
,p_source=>'TQNCR_REV_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442948160478150937)
,p_name=>'P121_TQNCR_REV_NO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1240
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rev No'
,p_source=>'TQNCR_REV_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442932492967150917)
,p_name=>'P121_TQNCR_REWORK_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rework Qty'
,p_source=>'TQNCR_REWORK_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442939351240150926)
,p_name=>'P121_TQNCR_REWORK_REA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rework Reason'
,p_source=>'TQNCR_REWORK_REASON'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442908095697150883)
,p_name=>'P121_TQNCR_ROOT_CAUSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Root Cause'
,p_source=>'TQNCR_ROOT_CAUSE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442932942523150917)
,p_name=>'P121_TQNCR_RTN_SUPLR_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rtn Suplr Id'
,p_source=>'TQNCR_RTN_SUPLR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442908524362150884)
,p_name=>'P121_TQNCR_RT_CAU_MAN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Man Flag'
,p_source=>'TQNCR_RT_CAU_MAN_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442926868330150909)
,p_name=>'P121_TQNCR_RT_CAU_MAN_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Man Ref'
,p_source=>'TQNCR_RT_CAU_MAN_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442908941317150884)
,p_name=>'P121_TQNCR_RT_CAU_MCH'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mchn Flag'
,p_source=>'TQNCR_RT_CAU_MCHN_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442927341071150909)
,p_name=>'P121_TQNCR_RT_CAU_MCH_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mchn Ref'
,p_source=>'TQNCR_RT_CAU_MCHN_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442926488909150909)
,p_name=>'P121_TQNCR_RT_CAU_MEA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Meas Flag'
,p_source=>'TQNCR_RT_CAU_MEAS_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442928553016150911)
,p_name=>'P121_TQNCR_RT_CAU_MEA_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Meas Ref'
,p_source=>'TQNCR_RT_CAU_MEAS_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442909693592150886)
,p_name=>'P121_TQNCR_RT_CAU_MTH'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mthd Flag'
,p_source=>'TQNCR_RT_CAU_MTHD_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442928074007150911)
,p_name=>'P121_TQNCR_RT_CAU_MTH_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mthd Ref'
,p_source=>'TQNCR_RT_CAU_MTHD_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442909346262150884)
,p_name=>'P121_TQNCR_RT_CAU_MTR'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mtrl Flag'
,p_source=>'TQNCR_RT_CAU_MTRL_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442927727208150909)
,p_name=>'P121_TQNCR_RT_CAU_MTR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Mtrl Ref'
,p_source=>'TQNCR_RT_CAU_MTRL_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442910101415150886)
,p_name=>'P121_TQNCR_RT_CAU_OTH'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Other Flag'
,p_source=>'TQNCR_RT_CAU_OTHER_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442910532071150886)
,p_name=>'P121_TQNCR_RT_CAU_OTH_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rt Cau Other Ref'
,p_source=>'TQNCR_RT_CAU_OTHER_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442933663695150918)
,p_name=>'P121_TQNCR_RWK_IS_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rwk Is Qty'
,p_source=>'TQNCR_RWK_IS_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442934134187150918)
,p_name=>'P121_TQNCR_RWK_OS_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rwk Os Qty'
,p_source=>'TQNCR_RWK_OS_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442933323732150918)
,p_name=>'P121_TQNCR_RW_SUPLR_I'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Rw Suplr Id'
,p_source=>'TQNCR_RW_SUPLR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442922541913150904)
,p_name=>'P121_TQNCR_SCATTER_DI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Scatter Dia'
,p_source=>'TQNCR_SCATTER_DIA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442931689442150915)
,p_name=>'P121_TQNCR_SEC_REJ_QT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Rej Qty'
,p_source=>'TQNCR_SEC_REJ_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442942521960150931)
,p_name=>'P121_TQNCR_SEC_SOU_PR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Sou Prod Id'
,p_source=>'TQNCR_SEC_SOU_PROD_ID'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>100
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442942923977150931)
,p_name=>'P121_TQNCR_SEC_SOU_PR_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Sou Prod Rev'
,p_source=>'TQNCR_SEC_SOU_PROD_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442941355188150929)
,p_name=>'P121_TQNCR_SEC_SOU_RC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Sou Rcpt Pfx'
,p_source=>'TQNCR_SEC_SOU_RCPT_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442941711965150929)
,p_name=>'P121_TQNCR_SEC_SOU_RC_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Sou Rcpt No'
,p_source=>'TQNCR_SEC_SOU_RCPT_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442942109661150929)
,p_name=>'P121_TQNCR_SEC_SOU_RC_2'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sec Sou Rcpt Seq No'
,p_source=>'TQNCR_SEC_SOU_RCPT_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442945326401150934)
,p_name=>'P121_TQNCR_SER_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1170
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Ser No'
,p_source=>'TQNCR_SER_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442935294163150920)
,p_name=>'P121_TQNCR_SMPL_SIZE_'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Smpl Size Var'
,p_source=>'TQNCR_SMPL_SIZE_VAR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442935759235150922)
,p_name=>'P121_TQNCR_SMPL_SIZE__1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Smpl Size Attr'
,p_source=>'TQNCR_SMPL_SIZE_ATTR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442936862266150922)
,p_name=>'P121_TQNCR_SMPL_SIZE__2'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Smpl Size Var Ent'
,p_source=>'TQNCR_SMPL_SIZE_VAR_ENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442937320305150923)
,p_name=>'P121_TQNCR_SMPL_SIZE__3'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Smpl Size Attr Ent'
,p_source=>'TQNCR_SMPL_SIZE_ATTR_ENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442920153542150901)
,p_name=>'P121_TQNCR_SOURCE_FLA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Source Flag'
,p_source=>'TQNCR_SOURCE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
 p_id=>wwv_flow_imp.id(6442917272065150895)
,p_name=>'P121_TQNCR_SOU_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sou Doc No'
,p_source=>'TQNCR_SOU_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442916938376150893)
,p_name=>'P121_TQNCR_SOU_DOC_PF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sou Doc Pfx'
,p_source=>'TQNCR_SOU_DOC_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442919290492150900)
,p_name=>'P121_TQNCR_SOU_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sou Seq No'
,p_source=>'TQNCR_SOU_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442919681566150901)
,p_name=>'P121_TQNCR_SOU_SUB_SE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Sou Sub Seq No'
,p_source=>'TQNCR_SOU_SUB_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442916519792150893)
,p_name=>'P121_TQNCR_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Status'
,p_source=>'TQNCR_STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442917696930150895)
,p_name=>'P121_TQNCR_SUPLR_BILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Suplr Bill No'
,p_source=>'TQNCR_SUPLR_BILL_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442918146939150897)
,p_name=>'P121_TQNCR_SUPLR_BILL_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Suplr Bill Date'
,p_source=>'TQNCR_SUPLR_BILL_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442918942731150900)
,p_name=>'P121_TQNCR_SUPLR_DC_D'
,p_source_data_type=>'DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Suplr Dc Date'
,p_source=>'TQNCR_SUPLR_DC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442918536861150897)
,p_name=>'P121_TQNCR_SUPLR_DC_N'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Suplr Dc No'
,p_source=>'TQNCR_SUPLR_DC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442940133768150928)
,p_name=>'P121_TQNCR_TOT_RET_QT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Tot Ret Qty'
,p_source=>'TQNCR_TOT_RET_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6442950498417150942)
,p_name=>'P121_TQNCR_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1300
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Upd By'
,p_source=>'TQNCR_UPD_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442951721791150943)
,p_name=>'P121_TQNCR_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>1330
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Upd Date'
,p_source=>'TQNCR_UPD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
 p_id=>wwv_flow_imp.id(6442952532703150945)
,p_name=>'P121_TQNCR_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1350
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Upd Emp Id'
,p_source=>'TQNCR_UPD_EMP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442950926883150942)
,p_name=>'P121_TQNCR_UPD_IP_ADD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1310
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Upd Ip Addr'
,p_source=>'TQNCR_UPD_IP_ADDR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6442951344212150943)
,p_name=>'P121_TQNCR_UPD_OS_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1320
,p_item_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_item_source_plug_id=>wwv_flow_imp.id(6442897721228150024)
,p_prompt=>'Tqncr Upd Os User'
,p_source=>'TQNCR_UPD_OS_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5658686539158078788)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5658684292076078776)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5658687073260078788)
,p_event_id=>wwv_flow_imp.id(5658686539158078788)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5658685262631078778)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>176723427087467750
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5658682425480078754)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6442897721228150024)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form NCR'
,p_static_id=>'initialize-form-ncr'
,p_internal_uid=>176720589936467726
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5658682822964078767)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6442897721228150024)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form NCR'
,p_static_id=>'process-form-ncr'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>176720987420467739
);
wwv_flow_imp.component_end;
end;
/
