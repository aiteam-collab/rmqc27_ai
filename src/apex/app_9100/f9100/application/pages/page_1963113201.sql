prompt --application/pages/page_1963113201
begin
--   Manifest
--     PAGE: 1963113201
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
 p_id=>1963113201
,p_name=>'Prod. Comp.  Entry(Mach. Automatic)'
,p_alias=>'PROD-COMP-ENTRY-MACH-AUTOMATIC'
,p_step_title=>'Prod. Comp.  Entry(Mach. Automatic)'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6604241621527791276)
,p_plug_name=>'Prod. Comp.  Entry(Mach. Automatic)'
,p_static_id=>'prod-comp-entry-mach-automatic'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MCNG_PROC_COMP_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6604321602338791418)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:19631132:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6604323190268791424)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P1963113201_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6604322413913791423)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P1963113201_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6604322831444791424)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P1963113201_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6604323502798791424)
,p_branch_action=>'f?p=&APP_ID.:19631132:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6604249443059791290)
,p_name=>'P1963113201_MPCH_ACC_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Acc Qty'
,p_source=>'MPCH_ACC_QTY'
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
 p_id=>wwv_flow_imp.id(6604280318881791340)
,p_name=>'P1963113201_MPCH_ACT_CYCLE_HRS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Act Cycle Hrs'
,p_source=>'MPCH_ACT_CYCLE_HRS'
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
 p_id=>wwv_flow_imp.id(6604280644757791342)
,p_name=>'P1963113201_MPCH_ACT_CYCLE_SEC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Act Cycle Secs'
,p_source=>'MPCH_ACT_CYCLE_SECS'
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
 p_id=>wwv_flow_imp.id(6604254667780791298)
,p_name=>'P1963113201_MPCH_ASSEM_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Assem Flag'
,p_source=>'MPCH_ASSEM_FLAG'
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
 p_id=>wwv_flow_imp.id(6604260686631791307)
,p_name=>'P1963113201_MPCH_BATCH_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Batch No'
,p_source=>'MPCH_BATCH_NO'
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
 p_id=>wwv_flow_imp.id(6604263908133791310)
,p_name=>'P1963113201_MPCH_BEAM_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Beam Code'
,p_source=>'MPCH_BEAM_CODE'
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
 p_id=>wwv_flow_imp.id(6604264305607791312)
,p_name=>'P1963113201_MPCH_BEAM_WGT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Beam Wgt'
,p_source=>'MPCH_BEAM_WGT'
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
 p_id=>wwv_flow_imp.id(6604242249875791279)
,p_name=>'P1963113201_MPCH_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Bu'
,p_source=>'MPCH_BU'
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
 p_id=>wwv_flow_imp.id(6604283465796791345)
,p_name=>'P1963113201_MPCH_CAST_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cast Doc No'
,p_source=>'MPCH_CAST_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6604283909414791346)
,p_name=>'P1963113201_MPCH_CAST_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cast Seq No'
,p_source=>'MPCH_CAST_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(6604265463109791313)
,p_name=>'P1963113201_MPCH_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Color'
,p_source=>'MPCH_COLOR'
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
 p_id=>wwv_flow_imp.id(6604249060343791290)
,p_name=>'P1963113201_MPCH_COMP_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Comp Qty'
,p_source=>'MPCH_COMP_QTY'
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
 p_id=>wwv_flow_imp.id(6604256259843791299)
,p_name=>'P1963113201_MPCH_CRATE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Crate Id'
,p_source=>'MPCH_CRATE_ID'
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
 p_id=>wwv_flow_imp.id(6604256677420791301)
,p_name=>'P1963113201_MPCH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre By'
,p_source=>'MPCH_CRE_BY'
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
 p_id=>wwv_flow_imp.id(6604257869879791303)
,p_name=>'P1963113201_MPCH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre Date'
,p_source=>'MPCH_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(6604269110022791320)
,p_name=>'P1963113201_MPCH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre Emp Id'
,p_source=>'MPCH_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6604275132760791328)
,p_name=>'P1963113201_MPCH_CRE_INSP'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre Insp'
,p_source=>'MPCH_CRE_INSP'
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
 p_id=>wwv_flow_imp.id(6604257065722791301)
,p_name=>'P1963113201_MPCH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre Ip Addr'
,p_source=>'MPCH_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6604257447573791301)
,p_name=>'P1963113201_MPCH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cre Os User'
,p_source=>'MPCH_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6604259864780791306)
,p_name=>'P1963113201_MPCH_CUTR_SIZE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cutr Size'
,p_source=>'MPCH_CUTR_SIZE'
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
 p_id=>wwv_flow_imp.id(6604277118190791332)
,p_name=>'P1963113201_MPCH_CYCLE_TIME_AC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cycle Time Act'
,p_source=>'MPCH_CYCLE_TIME_ACT'
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
 p_id=>wwv_flow_imp.id(6604276245544791329)
,p_name=>'P1963113201_MPCH_CYCLE_TIME_ST'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Cycle Time Std'
,p_source=>'MPCH_CYCLE_TIME_STD'
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
 p_id=>wwv_flow_imp.id(6604243497440791282)
,p_name=>'P1963113201_MPCH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Doc Date'
,p_source=>'MPCH_DOC_DATE'
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
 p_id=>wwv_flow_imp.id(6604243075796791281)
,p_name=>'P1963113201_MPCH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Doc No'
,p_source=>'MPCH_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6604284307577791346)
,p_name=>'P1963113201_MPCH_DOWNTIME_HRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Downtime Hrs'
,p_source=>'MPCH_DOWNTIME_HRS'
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
 p_id=>wwv_flow_imp.id(6604279099514791338)
,p_name=>'P1963113201_MPCH_END_COUNTER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch End Counter'
,p_source=>'MPCH_END_COUNTER'
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
 p_id=>wwv_flow_imp.id(6604253097758791296)
,p_name=>'P1963113201_MPCH_ENTRY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Entry Type'
,p_source=>'MPCH_ENTRY_TYPE'
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
 p_id=>wwv_flow_imp.id(6604267872079791318)
,p_name=>'P1963113201_MPCH_ENT_CNT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Ent Cnt'
,p_source=>'MPCH_ENT_CNT'
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
 p_id=>wwv_flow_imp.id(6604270289899791321)
,p_name=>'P1963113201_MPCH_FAB_PROD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Fab Prod Date'
,p_source=>'MPCH_FAB_PROD_DATE'
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
 p_id=>wwv_flow_imp.id(6604273923254791326)
,p_name=>'P1963113201_MPCH_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch File Name'
,p_source=>'MPCH_FILE_NAME'
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
 p_id=>wwv_flow_imp.id(6604264684828791312)
,p_name=>'P1963113201_MPCH_GROSS_WGT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Gross Wgt'
,p_source=>'MPCH_GROSS_WGT'
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
 p_id=>wwv_flow_imp.id(6604268273087791318)
,p_name=>'P1963113201_MPCH_GSM'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Gsm'
,p_source=>'MPCH_GSM'
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
 p_id=>wwv_flow_imp.id(6604281932149791343)
,p_name=>'P1963113201_MPCH_HEAT_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Heat No'
,p_source=>'MPCH_HEAT_NO'
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
 p_id=>wwv_flow_imp.id(6604275445856791328)
,p_name=>'P1963113201_MPCH_HEIGHT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Height'
,p_source=>'MPCH_HEIGHT'
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
 p_id=>wwv_flow_imp.id(6604272685894791324)
,p_name=>'P1963113201_MPCH_IDLE_END_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Idle End Date'
,p_source=>'MPCH_IDLE_END_DATE'
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
 p_id=>wwv_flow_imp.id(6604246315601791287)
,p_name=>'P1963113201_MPCH_IDLE_HRS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Idle Hrs'
,p_source=>'MPCH_IDLE_HRS'
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
 p_id=>wwv_flow_imp.id(6604246658450791287)
,p_name=>'P1963113201_MPCH_IDLE_MI'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Idle Mi'
,p_source=>'MPCH_IDLE_MI'
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
 p_id=>wwv_flow_imp.id(6604272239813791324)
,p_name=>'P1963113201_MPCH_IDLE_START_DA'
,p_source_data_type=>'DATE'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Idle Start Date'
,p_source=>'MPCH_IDLE_START_DATE'
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
 p_id=>wwv_flow_imp.id(6604273041987791324)
,p_name=>'P1963113201_MPCH_IMAGE'
,p_source_data_type=>'BLOB'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Image'
,p_source=>'MPCH_IMAGE'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
 p_id=>wwv_flow_imp.id(6604255884946791299)
,p_name=>'P1963113201_MPCH_INC_JRNL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Inc Jrnl'
,p_source=>'MPCH_INC_JRNL'
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
 p_id=>wwv_flow_imp.id(6604253927557791296)
,p_name=>'P1963113201_MPCH_INJ_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Inj Flag'
,p_source=>'MPCH_INJ_FLAG'
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
 p_id=>wwv_flow_imp.id(6604285042279791348)
,p_name=>'P1963113201_MPCH_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Loc Id'
,p_source=>'MPCH_LOC_ID'
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
 p_id=>wwv_flow_imp.id(6604261084771791307)
,p_name=>'P1963113201_MPCH_LOT_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Lot No'
,p_source=>'MPCH_LOT_NO'
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
 p_id=>wwv_flow_imp.id(6604263468257791310)
,p_name=>'P1963113201_MPCH_MAX_YARN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Max Yarn'
,p_source=>'MPCH_MAX_YARN'
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
 p_id=>wwv_flow_imp.id(6604243855800791284)
,p_name=>'P1963113201_MPCH_MCHN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Mchn Id'
,p_source=>'MPCH_MCHN_ID'
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
 p_id=>wwv_flow_imp.id(6604265120078791313)
,p_name=>'P1963113201_MPCH_MC_RPM'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Mc Rpm'
,p_source=>'MPCH_MC_RPM'
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
 p_id=>wwv_flow_imp.id(6604273492297791326)
,p_name=>'P1963113201_MPCH_MIME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Mime Type'
,p_source=>'MPCH_MIME_TYPE'
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
 p_id=>wwv_flow_imp.id(6604277907417791337)
,p_name=>'P1963113201_MPCH_NO_OF_BOX_PAC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch No Of Box Packed'
,p_source=>'MPCH_NO_OF_BOX_PACKED'
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
 p_id=>wwv_flow_imp.id(6604277450427791337)
,p_name=>'P1963113201_MPCH_NO_OF_CVTY_AC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch No Of Cvty Act'
,p_source=>'MPCH_NO_OF_CVTY_ACT'
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
 p_id=>wwv_flow_imp.id(6604276684726791332)
,p_name=>'P1963113201_MPCH_NO_OF_CVTY_ST'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch No Of Cvty Std'
,p_source=>'MPCH_NO_OF_CVTY_STD'
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
 p_id=>wwv_flow_imp.id(6604262688631791309)
,p_name=>'P1963113201_MPCH_NO_OF_YARN'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch No Of Yarn'
,p_source=>'MPCH_NO_OF_YARN'
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
 p_id=>wwv_flow_imp.id(6604247050291791287)
,p_name=>'P1963113201_MPCH_OPER_1_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oper 1 Id'
,p_source=>'MPCH_OPER_1_ID'
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
 p_id=>wwv_flow_imp.id(6604247454876791288)
,p_name=>'P1963113201_MPCH_OPER_2_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oper 2 Id'
,p_source=>'MPCH_OPER_2_ID'
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
 p_id=>wwv_flow_imp.id(6604251123936791293)
,p_name=>'P1963113201_MPCH_OPER_3_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oper 3 Id'
,p_source=>'MPCH_OPER_3_ID'
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
 p_id=>wwv_flow_imp.id(6604251465328791293)
,p_name=>'P1963113201_MPCH_OPER_4_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oper 4 Id'
,p_source=>'MPCH_OPER_4_ID'
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
 p_id=>wwv_flow_imp.id(6604252701968791295)
,p_name=>'P1963113201_MPCH_OPRN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oprn Id'
,p_source=>'MPCH_OPRN_ID'
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
 p_id=>wwv_flow_imp.id(6604274272664791326)
,p_name=>'P1963113201_MPCH_OPRN_LN_SEQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Oprn Ln Seq'
,p_source=>'MPCH_OPRN_LN_SEQ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>110
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
 p_id=>wwv_flow_imp.id(6604248696701791290)
,p_name=>'P1963113201_MPCH_PLAN_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Plan Qty'
,p_source=>'MPCH_PLAN_QTY'
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
 p_id=>wwv_flow_imp.id(6604242667248791281)
,p_name=>'P1963113201_MPCH_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Plnt'
,p_source=>'MPCH_PLNT'
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
 p_id=>wwv_flow_imp.id(6604253507597791296)
,p_name=>'P1963113201_MPCH_PRE_PROC_REJ_'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Pre Proc Rej Qty'
,p_source=>'MPCH_PRE_PROC_REJ_QTY'
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
 p_id=>wwv_flow_imp.id(6604249864227791292)
,p_name=>'P1963113201_MPCH_PRIM_REJ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Prim Rej'
,p_source=>'MPCH_PRIM_REJ'
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
 p_id=>wwv_flow_imp.id(6604271891363791323)
,p_name=>'P1963113201_MPCH_PROC_END_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Proc End Date'
,p_source=>'MPCH_PROC_END_DATE'
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
 p_id=>wwv_flow_imp.id(6604252268952791295)
,p_name=>'P1963113201_MPCH_PROC_MOVE_TYP'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Proc Move Type'
,p_source=>'MPCH_PROC_MOVE_TYPE'
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
 p_id=>wwv_flow_imp.id(6604271448648791323)
,p_name=>'P1963113201_MPCH_PROC_START_DA'
,p_source_data_type=>'DATE'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Proc Start Date'
,p_source=>'MPCH_PROC_START_DATE'
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
 p_id=>wwv_flow_imp.id(6604269892202791321)
,p_name=>'P1963113201_MPCH_PROC_TBL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Proc Tbl'
,p_source=>'MPCH_PROC_TBL'
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
 p_id=>wwv_flow_imp.id(6604247933213791288)
,p_name=>'P1963113201_MPCH_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Prod Id'
,p_source=>'MPCH_PROD_ID'
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
 p_id=>wwv_flow_imp.id(6604271106871791323)
,p_name=>'P1963113201_MPCH_PROD_ORD_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Prod Ord No'
,p_source=>'MPCH_PROD_ORD_NO'
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
 p_id=>wwv_flow_imp.id(6604248260230791288)
,p_name=>'P1963113201_MPCH_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Prod Rev'
,p_source=>'MPCH_PROD_REV'
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
 p_id=>wwv_flow_imp.id(6604275931557791329)
,p_name=>'P1963113201_MPCH_PROJ_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Proj Id'
,p_source=>'MPCH_PROJ_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
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
 p_id=>wwv_flow_imp.id(6604251839086791293)
,p_name=>'P1963113201_MPCH_QC_REQ_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Qc Req Flag'
,p_source=>'MPCH_QC_REQ_FLAG'
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
 p_id=>wwv_flow_imp.id(6604278265706791338)
,p_name=>'P1963113201_MPCH_QTY_PER_BOX'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Qty Per Box'
,p_source=>'MPCH_QTY_PER_BOX'
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
 p_id=>wwv_flow_imp.id(6604285449997791348)
,p_name=>'P1963113201_MPCH_REJ_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Rej Reference'
,p_source=>'MPCH_REJ_REFERENCE'
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
 p_id=>wwv_flow_imp.id(6604255062029791298)
,p_name=>'P1963113201_MPCH_REMARKS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Remarks'
,p_source=>'MPCH_REMARKS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>200
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
 p_id=>wwv_flow_imp.id(6604286289850791349)
,p_name=>'P1963113201_MPCH_RM_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Rm Prod Id'
,p_source=>'MPCH_RM_PROD_ID'
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
 p_id=>wwv_flow_imp.id(6604286713871791349)
,p_name=>'P1963113201_MPCH_RM_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Rm Prod Rev'
,p_source=>'MPCH_RM_PROD_REV'
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
 p_id=>wwv_flow_imp.id(6604287093965791351)
,p_name=>'P1963113201_MPCH_RM_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Rm Qty'
,p_source=>'MPCH_RM_QTY'
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
 p_id=>wwv_flow_imp.id(6604270701826791321)
,p_name=>'P1963113201_MPCH_ROLL_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Roll No'
,p_source=>'MPCH_ROLL_NO'
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
 p_id=>wwv_flow_imp.id(6604260248107791306)
,p_name=>'P1963113201_MPCH_SCREW_SPEED'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Screw Speed'
,p_source=>'MPCH_SCREW_SPEED'
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
 p_id=>wwv_flow_imp.id(6604254274891791298)
,p_name=>'P1963113201_MPCH_SEC_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Sec Flag'
,p_source=>'MPCH_SEC_FLAG'
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
 p_id=>wwv_flow_imp.id(6604250240231791292)
,p_name=>'P1963113201_MPCH_SEC_REJ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Sec Rej'
,p_source=>'MPCH_SEC_REJ'
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
 p_id=>wwv_flow_imp.id(6604283041019791343)
,p_name=>'P1963113201_MPCH_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Seq No'
,p_source=>'MPCH_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(6604284709570791346)
,p_name=>'P1963113201_MPCH_SHIFT_HRS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Shift Hrs'
,p_source=>'MPCH_SHIFT_HRS'
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
 p_id=>wwv_flow_imp.id(6604244260214791284)
,p_name=>'P1963113201_MPCH_SHIFT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Shift Id'
,p_source=>'MPCH_SHIFT_ID'
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
 p_id=>wwv_flow_imp.id(6604261841691791309)
,p_name=>'P1963113201_MPCH_SOURCE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Source Id'
,p_source=>'MPCH_SOURCE_ID'
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
 p_id=>wwv_flow_imp.id(6604262299545791309)
,p_name=>'P1963113201_MPCH_SOURCE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Source Type'
,p_source=>'MPCH_SOURCE_TYPE'
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
 p_id=>wwv_flow_imp.id(6604285920160791348)
,p_name=>'P1963113201_MPCH_SOU_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Sou Doc No'
,p_source=>'MPCH_SOU_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6604267484400791318)
,p_name=>'P1963113201_MPCH_START_CNT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Start Cnt'
,p_source=>'MPCH_START_CNT'
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
 p_id=>wwv_flow_imp.id(6604250646856791292)
,p_name=>'P1963113201_MPCH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Status'
,p_source=>'MPCH_STATUS'
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
 p_id=>wwv_flow_imp.id(6604279477846791340)
,p_name=>'P1963113201_MPCH_STD_CYCLE_HRS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Std Cycle Hrs'
,p_source=>'MPCH_STD_CYCLE_HRS'
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
 p_id=>wwv_flow_imp.id(6604279906801791340)
,p_name=>'P1963113201_MPCH_STD_CYCLE_SEC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Std Cycle Secs'
,p_source=>'MPCH_STD_CYCLE_SECS'
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
 p_id=>wwv_flow_imp.id(6604281471646791342)
,p_name=>'P1963113201_MPCH_STKNG_HEIGHT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Stkng Height'
,p_source=>'MPCH_STKNG_HEIGHT'
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
 p_id=>wwv_flow_imp.id(6604281100811791342)
,p_name=>'P1963113201_MPCH_STKNG_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Stkng No'
,p_source=>'MPCH_STKNG_NO'
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
 p_id=>wwv_flow_imp.id(6604261473986791307)
,p_name=>'P1963113201_MPCH_SYS_LS_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Sys Ls No'
,p_source=>'MPCH_SYS_LS_NO'
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
 p_id=>wwv_flow_imp.id(6604266316347791315)
,p_name=>'P1963113201_MPCH_TEMP_Z1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Temp Z1'
,p_source=>'MPCH_TEMP_Z1'
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
 p_id=>wwv_flow_imp.id(6604266712285791317)
,p_name=>'P1963113201_MPCH_TEMP_Z2'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Temp Z2'
,p_source=>'MPCH_TEMP_Z2'
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
 p_id=>wwv_flow_imp.id(6604267062033791317)
,p_name=>'P1963113201_MPCH_TEMP_Z3'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Temp Z3'
,p_source=>'MPCH_TEMP_Z3'
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
 p_id=>wwv_flow_imp.id(6604244732777791284)
,p_name=>'P1963113201_MPCH_TIME_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Time From'
,p_source=>'MPCH_TIME_FROM'
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
 p_id=>wwv_flow_imp.id(6604245111168791285)
,p_name=>'P1963113201_MPCH_TIME_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Time To'
,p_source=>'MPCH_TIME_TO'
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
 p_id=>wwv_flow_imp.id(6604268715598791320)
,p_name=>'P1963113201_MPCH_TOT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Tot'
,p_source=>'MPCH_TOT'
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
 p_id=>wwv_flow_imp.id(6604245444479791285)
,p_name=>'P1963113201_MPCH_TOT_HRS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Tot Hrs'
,p_source=>'MPCH_TOT_HRS'
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
 p_id=>wwv_flow_imp.id(6604245901113791285)
,p_name=>'P1963113201_MPCH_TOT_MI'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Tot Mi'
,p_source=>'MPCH_TOT_MI'
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
 p_id=>wwv_flow_imp.id(6604274709089791328)
,p_name=>'P1963113201_MPCH_TSA_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Tsa Doc No'
,p_source=>'MPCH_TSA_DOC_NO'
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
 p_id=>wwv_flow_imp.id(6604282266621791343)
,p_name=>'P1963113201_MPCH_T_FROM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch T From'
,p_source=>'MPCH_T_FROM'
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
 p_id=>wwv_flow_imp.id(6604282698562791343)
,p_name=>'P1963113201_MPCH_T_TO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch T To'
,p_source=>'MPCH_T_TO'
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
 p_id=>wwv_flow_imp.id(6604255504038791299)
,p_name=>'P1963113201_MPCH_UNIT_WEIGHT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Unit Weight'
,p_source=>'MPCH_UNIT_WEIGHT'
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
 p_id=>wwv_flow_imp.id(6604278692669791338)
,p_name=>'P1963113201_MPCH_UNPACKED_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Unpacked Qty'
,p_source=>'MPCH_UNPACKED_QTY'
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
 p_id=>wwv_flow_imp.id(6604258267054791303)
,p_name=>'P1963113201_MPCH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Upd By'
,p_source=>'MPCH_UPD_BY'
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
 p_id=>wwv_flow_imp.id(6604259460539791306)
,p_name=>'P1963113201_MPCH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Upd Date'
,p_source=>'MPCH_UPD_DATE'
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
 p_id=>wwv_flow_imp.id(6604269477635791321)
,p_name=>'P1963113201_MPCH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Upd Emp Id'
,p_source=>'MPCH_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6604258685185791303)
,p_name=>'P1963113201_MPCH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Upd Ip Addr'
,p_source=>'MPCH_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6604259097907791304)
,p_name=>'P1963113201_MPCH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Upd Os User'
,p_source=>'MPCH_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6604265887435791313)
,p_name=>'P1963113201_MPCH_WIDTH'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Width'
,p_source=>'MPCH_WIDTH'
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
 p_id=>wwv_flow_imp.id(6604263041550791310)
,p_name=>'P1963113201_MPCH_YARN_DENIER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_prompt=>'Mpch Yarn Denier'
,p_source=>'MPCH_YARN_DENIER'
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
 p_id=>wwv_flow_imp.id(6604241887283791278)
,p_name=>'P1963113201_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_item_source_plug_id=>wwv_flow_imp.id(6604241621527791276)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6604323952226791426)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6604241621527791276)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Prod. Comp.  Entry(Mach. Automatic)'
,p_static_id=>'initialize-form-prod-comp-entry-mach-automatic'
,p_internal_uid=>1122362116683180398
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6604324429146791426)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6604241621527791276)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Prod. Comp.  Entry(Mach. Automatic)'
,p_static_id=>'process-form-prod-comp-entry-mach-automatic'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1122362593603180398
);
wwv_flow_imp.component_end;
end;
/
