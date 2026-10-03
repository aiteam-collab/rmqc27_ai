prompt --application/pages/page_367005001
begin
--   Manifest
--     PAGE: 367005001
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
 p_id=>367005001
,p_name=>'Suppliers'
,p_alias=>'SUPPLIERS'
,p_page_mode=>'MODAL'
,p_step_title=>'Suppliers'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11751077821780025909)
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
 p_id=>wwv_flow_imp.id(11749727126214972606)
,p_plug_name=>'Suppliers'
,p_static_id=>'suppliers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SUPPLIERS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11750902515335025754)
,p_plug_name=>'Suppliers'
,p_static_id=>'suppliers-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SUPPLIERS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11751078179043025909)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11751077821780025909)
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
 p_id=>wwv_flow_imp.id(11751080607135025911)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11751077821780025909)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P367005001_ROWID_1'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11751079744841025911)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11751077821780025909)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P367005001_ROWID_1'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11751080191271025911)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11751077821780025909)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P367005001_ROWID_1'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749727615068972607)
,p_name=>'P367005001_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750902797370025754)
,p_name=>'P367005001_ROWID_1'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749773961209972646)
,p_name=>'P367005001_SUPLR_AADHAAR_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2340
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Aadhaar No'
,p_source=>'SUPLR_AADHAAR_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>12
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
 p_id=>wwv_flow_imp.id(11750949158747025814)
,p_name=>'P367005001_SUPLR_AADHAAR_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2330
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Aadhaar No'
,p_source=>'SUPLR_AADHAAR_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>12
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
 p_id=>wwv_flow_imp.id(11749747593952972625)
,p_name=>'P367005001_SUPLR_ACCT_PAYEE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Acct Payee'
,p_source=>'SUPLR_ACCT_PAYEE'
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
 p_id=>wwv_flow_imp.id(11750922777476025790)
,p_name=>'P367005001_SUPLR_ACCT_PAYEE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Acct Payee'
,p_source=>'SUPLR_ACCT_PAYEE'
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
 p_id=>wwv_flow_imp.id(11749732759242972611)
,p_name=>'P367005001_SUPLR_ADDR1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Addr1'
,p_source=>'SUPLR_ADDR1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(11750907977091025764)
,p_name=>'P367005001_SUPLR_ADDR1_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Addr1'
,p_source=>'SUPLR_ADDR1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(11749733196387972612)
,p_name=>'P367005001_SUPLR_ADDR2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Addr2'
,p_source=>'SUPLR_ADDR2'
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
 p_id=>wwv_flow_imp.id(11750908399772025765)
,p_name=>'P367005001_SUPLR_ADDR2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Addr2'
,p_source=>'SUPLR_ADDR2'
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
 p_id=>wwv_flow_imp.id(11749733577825972612)
,p_name=>'P367005001_SUPLR_ADDR3'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Addr3'
,p_source=>'SUPLR_ADDR3'
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
 p_id=>wwv_flow_imp.id(11750908769387025765)
,p_name=>'P367005001_SUPLR_ADDR3_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Addr3'
,p_source=>'SUPLR_ADDR3'
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
 p_id=>wwv_flow_imp.id(11749763625249972639)
,p_name=>'P367005001_SUPLR_ADV_LGR_GRP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1820
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Adv Lgr Grp'
,p_source=>'SUPLR_ADV_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11750938740245025806)
,p_name=>'P367005001_SUPLR_ADV_LGR_GRP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1810
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Adv Lgr Grp'
,p_source=>'SUPLR_ADV_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11749767529572972642)
,p_name=>'P367005001_SUPLR_ALLW_CR_BAL_F'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2020
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Allw Cr Bal Flag'
,p_source=>'SUPLR_ALLW_CR_BAL_FLAG'
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
 p_id=>wwv_flow_imp.id(11750942806996025809)
,p_name=>'P367005001_SUPLR_ALLW_CR_BAL_F_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2010
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Allw Cr Bal Flag'
,p_source=>'SUPLR_ALLW_CR_BAL_FLAG'
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
 p_id=>wwv_flow_imp.id(11749755969219972631)
,p_name=>'P367005001_SUPLR_APPRVD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>1440
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Apprvd Date'
,p_source=>'SUPLR_APPRVD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750931136754025800)
,p_name=>'P367005001_SUPLR_APPRVD_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>1430
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Apprvd Date'
,p_source=>'SUPLR_APPRVD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749745168065972621)
,p_name=>'P367005001_SUPLR_APPR_ON'
,p_source_data_type=>'DATE'
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Appr On'
,p_source=>'SUPLR_APPR_ON'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750920363152025786)
,p_name=>'P367005001_SUPLR_APPR_ON_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Appr On'
,p_source=>'SUPLR_APPR_ON'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749739585742972617)
,p_name=>'P367005001_SUPLR_BANK_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Bank Id'
,p_source=>'SUPLR_BANK_ID'
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
 p_id=>wwv_flow_imp.id(11750914792308025776)
,p_name=>'P367005001_SUPLR_BANK_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Bank Id'
,p_source=>'SUPLR_BANK_ID'
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
 p_id=>wwv_flow_imp.id(11749794732683972665)
,p_name=>'P367005001_SUPLR_BILL_RND'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>3380
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Bill Rnd'
,p_source=>'SUPLR_BILL_RND'
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
 p_id=>wwv_flow_imp.id(11750969994558025831)
,p_name=>'P367005001_SUPLR_BILL_RND_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>3370
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Bill Rnd'
,p_source=>'SUPLR_BILL_RND'
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
 p_id=>wwv_flow_imp.id(11749777982447972650)
,p_name=>'P367005001_SUPLR_BLACK_LIST_FL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2540
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Black List Flg'
,p_source=>'SUPLR_BLACK_LIST_FLG'
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
 p_id=>wwv_flow_imp.id(11750953168146025817)
,p_name=>'P367005001_SUPLR_BLACK_LIST_FL_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2530
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Black List Flg'
,p_source=>'SUPLR_BLACK_LIST_FLG'
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
 p_id=>wwv_flow_imp.id(11749727961351972607)
,p_name=>'P367005001_SUPLR_BU'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Bu'
,p_source=>'SUPLR_BU'
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
 p_id=>wwv_flow_imp.id(11750903133984025756)
,p_name=>'P367005001_SUPLR_BU_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Bu'
,p_source=>'SUPLR_BU'
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
 p_id=>wwv_flow_imp.id(11749747133057972623)
,p_name=>'P367005001_SUPLR_CAP_FREQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cap Freq'
,p_source=>'SUPLR_CAP_FREQ'
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
 p_id=>wwv_flow_imp.id(11750922344703025789)
,p_name=>'P367005001_SUPLR_CAP_FREQ_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cap Freq'
,p_source=>'SUPLR_CAP_FREQ'
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
 p_id=>wwv_flow_imp.id(11749779998309972651)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2640
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Flag'
,p_source=>'SUPLR_CASH_DLY_PYMNT_FLAG'
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
 p_id=>wwv_flow_imp.id(11749780420896972653)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2660
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Amt'
,p_source=>'SUPLR_CASH_DLY_PYMNT_AMT'
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
 p_id=>wwv_flow_imp.id(11750957980900025820)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_10'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2770
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Emp'
,p_source=>'SUPLR_CASH_DLY_PYMNT_EMP'
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
 p_id=>wwv_flow_imp.id(11750958348249025821)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_11'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2790
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Pyrl'
,p_source=>'SUPLR_CASH_DLY_PYMNT_PYRL'
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
 p_id=>wwv_flow_imp.id(11749781956246972653)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_2'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2740
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Suplr'
,p_source=>'SUPLR_CASH_DLY_PYMNT_SUPLR'
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
 p_id=>wwv_flow_imp.id(11749782352124972654)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_3'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2760
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Cust'
,p_source=>'SUPLR_CASH_DLY_PYMNT_CUST'
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
 p_id=>wwv_flow_imp.id(11749782782050972654)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_4'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2780
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Emp'
,p_source=>'SUPLR_CASH_DLY_PYMNT_EMP'
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
 p_id=>wwv_flow_imp.id(11749783187509972654)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_5'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2800
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Pymnt Pyrl'
,p_source=>'SUPLR_CASH_DLY_PYMNT_PYRL'
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
 p_id=>wwv_flow_imp.id(11750955178373025818)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_6'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2630
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Flag'
,p_source=>'SUPLR_CASH_DLY_PYMNT_FLAG'
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
 p_id=>wwv_flow_imp.id(11750955615081025818)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_7'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2650
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Amt'
,p_source=>'SUPLR_CASH_DLY_PYMNT_AMT'
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
 p_id=>wwv_flow_imp.id(11750957158628025820)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_8'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2730
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Suplr'
,p_source=>'SUPLR_CASH_DLY_PYMNT_SUPLR'
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
 p_id=>wwv_flow_imp.id(11750957584578025820)
,p_name=>'P367005001_SUPLR_CASH_DLY_PYMN_9'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2750
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Pymnt Cust'
,p_source=>'SUPLR_CASH_DLY_PYMNT_CUST'
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
 p_id=>wwv_flow_imp.id(11749784815627972656)
,p_name=>'P367005001_SUPLR_CASH_DLY_RCPT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2880
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Rcpt Suplr'
,p_source=>'SUPLR_CASH_DLY_RCPT_SUPLR'
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
 p_id=>wwv_flow_imp.id(11749785148934972656)
,p_name=>'P367005001_SUPLR_CASH_DLY_RCPT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2900
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Dly Rcpt Cust'
,p_source=>'SUPLR_CASH_DLY_RCPT_CUST'
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
 p_id=>wwv_flow_imp.id(11750959980697025823)
,p_name=>'P367005001_SUPLR_CASH_DLY_RCPT_2'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2870
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Rcpt Suplr'
,p_source=>'SUPLR_CASH_DLY_RCPT_SUPLR'
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
 p_id=>wwv_flow_imp.id(11750960398393025823)
,p_name=>'P367005001_SUPLR_CASH_DLY_RCPT_3'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2890
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Dly Rcpt Cust'
,p_source=>'SUPLR_CASH_DLY_RCPT_CUST'
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
 p_id=>wwv_flow_imp.id(11749784421574972656)
,p_name=>'P367005001_SUPLR_CASH_INDVL_RC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2860
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Indvl Rcpt Amt'
,p_source=>'SUPLR_CASH_INDVL_RCPT_AMT'
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
 p_id=>wwv_flow_imp.id(11750959608696025821)
,p_name=>'P367005001_SUPLR_CASH_INDVL_RC_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2850
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Indvl Rcpt Amt'
,p_source=>'SUPLR_CASH_INDVL_RCPT_AMT'
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
 p_id=>wwv_flow_imp.id(11749779621179972651)
,p_name=>'P367005001_SUPLR_CASH_INDVL_TX'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2620
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Indvl Txn Amt'
,p_source=>'SUPLR_CASH_INDVL_TXN_AMT'
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
 p_id=>wwv_flow_imp.id(11750954814744025818)
,p_name=>'P367005001_SUPLR_CASH_INDVL_TX_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2610
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Indvl Txn Amt'
,p_source=>'SUPLR_CASH_INDVL_TXN_AMT'
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
 p_id=>wwv_flow_imp.id(11749780742975972653)
,p_name=>'P367005001_SUPLR_CASH_MAX_LIMI'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2680
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Max Limit Flag'
,p_source=>'SUPLR_CASH_MAX_LIMIT_FLAG'
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
 p_id=>wwv_flow_imp.id(11749781197412972653)
,p_name=>'P367005001_SUPLR_CASH_MAX_LIMI_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2700
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Max Limit Amt'
,p_source=>'SUPLR_CASH_MAX_LIMIT_AMT'
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
 p_id=>wwv_flow_imp.id(11750955991007025818)
,p_name=>'P367005001_SUPLR_CASH_MAX_LIMI_2'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2670
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Max Limit Flag'
,p_source=>'SUPLR_CASH_MAX_LIMIT_FLAG'
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
 p_id=>wwv_flow_imp.id(11750956424009025820)
,p_name=>'P367005001_SUPLR_CASH_MAX_LIMI_3'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2690
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Max Limit Amt'
,p_source=>'SUPLR_CASH_MAX_LIMIT_AMT'
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
 p_id=>wwv_flow_imp.id(11749749564835972626)
,p_name=>'P367005001_SUPLR_CASH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cash Type'
,p_source=>'SUPLR_CASH_TYPE'
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
 p_id=>wwv_flow_imp.id(11750924796742025793)
,p_name=>'P367005001_SUPLR_CASH_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cash Type'
,p_source=>'SUPLR_CASH_TYPE'
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
 p_id=>wwv_flow_imp.id(11749744018081972621)
,p_name=>'P367005001_SUPLR_CEI_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cei Id'
,p_source=>'SUPLR_CEI_ID'
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
 p_id=>wwv_flow_imp.id(11750919157500025784)
,p_name=>'P367005001_SUPLR_CEI_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cei Id'
,p_source=>'SUPLR_CEI_ID'
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
 p_id=>wwv_flow_imp.id(11749761948435972636)
,p_name=>'P367005001_SUPLR_CERTFD_SUPLR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1740
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Certfd Suplr'
,p_source=>'SUPLR_CERTFD_SUPLR'
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
 p_id=>wwv_flow_imp.id(11750937181526025804)
,p_name=>'P367005001_SUPLR_CERTFD_SUPLR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1730
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Certfd Suplr'
,p_source=>'SUPLR_CERTFD_SUPLR'
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
 p_id=>wwv_flow_imp.id(11749791975330972664)
,p_name=>'P367005001_SUPLR_CHART_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3240
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Chart Id'
,p_source=>'SUPLR_CHART_ID'
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
 p_id=>wwv_flow_imp.id(11750967210930025828)
,p_name=>'P367005001_SUPLR_CHART_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3230
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Chart Id'
,p_source=>'SUPLR_CHART_ID'
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
 p_id=>wwv_flow_imp.id(11749783555469972654)
,p_name=>'P367005001_SUPLR_CHA_FLG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2820
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cha Flg'
,p_source=>'SUPLR_CHA_FLG'
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
 p_id=>wwv_flow_imp.id(11750958730636025821)
,p_name=>'P367005001_SUPLR_CHA_FLG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2810
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cha Flg'
,p_source=>'SUPLR_CHA_FLG'
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
 p_id=>wwv_flow_imp.id(11749791168549972662)
,p_name=>'P367005001_SUPLR_CHILLING_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3200
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Chilling Id'
,p_source=>'SUPLR_CHILLING_ID'
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
 p_id=>wwv_flow_imp.id(11750966372205025828)
,p_name=>'P367005001_SUPLR_CHILLING_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3190
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Chilling Id'
,p_source=>'SUPLR_CHILLING_ID'
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
 p_id=>wwv_flow_imp.id(11749734372432972612)
,p_name=>'P367005001_SUPLR_CITY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr City'
,p_source=>'SUPLR_CITY'
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
 p_id=>wwv_flow_imp.id(11750909618060025767)
,p_name=>'P367005001_SUPLR_CITY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr City'
,p_source=>'SUPLR_CITY'
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
 p_id=>wwv_flow_imp.id(11749740414420972618)
,p_name=>'P367005001_SUPLR_CLASS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Class'
,p_source=>'SUPLR_CLASS'
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
 p_id=>wwv_flow_imp.id(11750915552507025778)
,p_name=>'P367005001_SUPLR_CLASS_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Class'
,p_source=>'SUPLR_CLASS'
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
 p_id=>wwv_flow_imp.id(11749790786380972662)
,p_name=>'P367005001_SUPLR_COLLECT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3180
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Collect Id'
,p_source=>'SUPLR_COLLECT_ID'
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
 p_id=>wwv_flow_imp.id(11750965958352025828)
,p_name=>'P367005001_SUPLR_COLLECT_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3170
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Collect Id'
,p_source=>'SUPLR_COLLECT_ID'
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
 p_id=>wwv_flow_imp.id(11749777565936972650)
,p_name=>'P367005001_SUPLR_COMMISION_RAT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>2520
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Commision Rate'
,p_source=>'SUPLR_COMMISION_RATE'
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
 p_id=>wwv_flow_imp.id(11750952819340025817)
,p_name=>'P367005001_SUPLR_COMMISION_RAT_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>2510
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Commision Rate'
,p_source=>'SUPLR_COMMISION_RATE'
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
 p_id=>wwv_flow_imp.id(11749749200286972625)
,p_name=>'P367005001_SUPLR_COMP_NAT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Comp Nat Type'
,p_source=>'SUPLR_COMP_NAT_TYPE'
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
 p_id=>wwv_flow_imp.id(11750924346728025792)
,p_name=>'P367005001_SUPLR_COMP_NAT_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Comp Nat Type'
,p_source=>'SUPLR_COMP_NAT_TYPE'
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
 p_id=>wwv_flow_imp.id(11749768740798972642)
,p_name=>'P367005001_SUPLR_CORP_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2080
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Corp Sel Flag'
,p_source=>'SUPLR_CORP_SEL_FLAG'
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
 p_id=>wwv_flow_imp.id(11750943971143025809)
,p_name=>'P367005001_SUPLR_CORP_SEL_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2070
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Corp Sel Flag'
,p_source=>'SUPLR_CORP_SEL_FLAG'
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
 p_id=>wwv_flow_imp.id(11749735159224972612)
,p_name=>'P367005001_SUPLR_COUNTRY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Country'
,p_source=>'SUPLR_COUNTRY'
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
 p_id=>wwv_flow_imp.id(11750910369987025768)
,p_name=>'P367005001_SUPLR_COUNTRY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Country'
,p_source=>'SUPLR_COUNTRY'
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
 p_id=>wwv_flow_imp.id(11749732359687972611)
,p_name=>'P367005001_SUPLR_CREDIT_LIMIT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Credit Limit'
,p_source=>'SUPLR_CREDIT_LIMIT'
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
 p_id=>wwv_flow_imp.id(11750907594149025764)
,p_name=>'P367005001_SUPLR_CREDIT_LIMIT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Credit Limit'
,p_source=>'SUPLR_CREDIT_LIMIT'
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
 p_id=>wwv_flow_imp.id(11749785958535972657)
,p_name=>'P367005001_SUPLR_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2940
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cre By'
,p_source=>'SUPLR_CRE_BY'
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
 p_id=>wwv_flow_imp.id(11750961151296025823)
,p_name=>'P367005001_SUPLR_CRE_BY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2930
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cre By'
,p_source=>'SUPLR_CRE_BY'
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
 p_id=>wwv_flow_imp.id(11749787148955972659)
,p_name=>'P367005001_SUPLR_CRE_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>3000
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cre Date'
,p_source=>'SUPLR_CRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750962374087025825)
,p_name=>'P367005001_SUPLR_CRE_DATE_1'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>2990
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cre Date'
,p_source=>'SUPLR_CRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749789978696972661)
,p_name=>'P367005001_SUPLR_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3140
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cre Emp Id'
,p_source=>'SUPLR_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11750965227484025826)
,p_name=>'P367005001_SUPLR_CRE_EMP_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3130
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cre Emp Id'
,p_source=>'SUPLR_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11749786391056972657)
,p_name=>'P367005001_SUPLR_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2960
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cre Ip Addr'
,p_source=>'SUPLR_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(11750961582566025823)
,p_name=>'P367005001_SUPLR_CRE_IP_ADDR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2950
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cre Ip Addr'
,p_source=>'SUPLR_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(11749786776925972657)
,p_name=>'P367005001_SUPLR_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2980
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cre Os User'
,p_source=>'SUPLR_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(11750962025395025825)
,p_name=>'P367005001_SUPLR_CRE_OS_USER_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2970
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cre Os User'
,p_source=>'SUPLR_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(11749729942320972609)
,p_name=>'P367005001_SUPLR_CURRENCY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Currency'
,p_source=>'SUPLR_CURRENCY'
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
 p_id=>wwv_flow_imp.id(11750905166222025759)
,p_name=>'P367005001_SUPLR_CURRENCY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Currency'
,p_source=>'SUPLR_CURRENCY'
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
 p_id=>wwv_flow_imp.id(11749751953683972628)
,p_name=>'P367005001_SUPLR_CUST_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1240
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cust Code'
,p_source=>'SUPLR_CUST_CODE'
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
 p_id=>wwv_flow_imp.id(11750927152612025796)
,p_name=>'P367005001_SUPLR_CUST_CODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1230
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cust Code'
,p_source=>'SUPLR_CUST_CODE'
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
 p_id=>wwv_flow_imp.id(11749743215886972620)
,p_name=>'P367005001_SUPLR_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Cust Id'
,p_source=>'SUPLR_CUST_ID'
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
 p_id=>wwv_flow_imp.id(11750918341178025782)
,p_name=>'P367005001_SUPLR_CUST_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Cust Id'
,p_source=>'SUPLR_CUST_ID'
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
 p_id=>wwv_flow_imp.id(11749792382313972664)
,p_name=>'P367005001_SUPLR_DAIRY_CAN_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3260
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Can Id'
,p_source=>'SUPLR_DAIRY_CAN_ID'
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
 p_id=>wwv_flow_imp.id(11750967621126025828)
,p_name=>'P367005001_SUPLR_DAIRY_CAN_ID_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3250
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Can Id'
,p_source=>'SUPLR_DAIRY_CAN_ID'
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
 p_id=>wwv_flow_imp.id(11749793952682972665)
,p_name=>'P367005001_SUPLR_DAIRY_INC_PRI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3340
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Inc Price Chart'
,p_source=>'SUPLR_DAIRY_INC_PRICE_CHART'
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
 p_id=>wwv_flow_imp.id(11750969156471025829)
,p_name=>'P367005001_SUPLR_DAIRY_INC_PRI_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3330
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Inc Price Chart'
,p_source=>'SUPLR_DAIRY_INC_PRICE_CHART'
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
 p_id=>wwv_flow_imp.id(11749792828811972664)
,p_name=>'P367005001_SUPLR_DAIRY_LR_BOOS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3280
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Lr Boost'
,p_source=>'SUPLR_DAIRY_LR_BOOST'
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
 p_id=>wwv_flow_imp.id(11750967981917025829)
,p_name=>'P367005001_SUPLR_DAIRY_LR_BOOS_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3270
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Lr Boost'
,p_source=>'SUPLR_DAIRY_LR_BOOST'
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
 p_id=>wwv_flow_imp.id(11749794340752972665)
,p_name=>'P367005001_SUPLR_DAIRY_MILK_TY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3360
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Milk Type'
,p_source=>'SUPLR_DAIRY_MILK_TYPE'
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
 p_id=>wwv_flow_imp.id(11750969598703025829)
,p_name=>'P367005001_SUPLR_DAIRY_MILK_TY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3350
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Milk Type'
,p_source=>'SUPLR_DAIRY_MILK_TYPE'
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
 p_id=>wwv_flow_imp.id(11749793167922972664)
,p_name=>'P367005001_SUPLR_DAIRY_SMS_FLA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3300
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Sms Flag'
,p_source=>'SUPLR_DAIRY_SMS_FLAG'
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
 p_id=>wwv_flow_imp.id(11750968353589025829)
,p_name=>'P367005001_SUPLR_DAIRY_SMS_FLA_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3290
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Sms Flag'
,p_source=>'SUPLR_DAIRY_SMS_FLAG'
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
 p_id=>wwv_flow_imp.id(11749789554087972661)
,p_name=>'P367005001_SUPLR_DAIRY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3120
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dairy Type'
,p_source=>'SUPLR_DAIRY_TYPE'
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
 p_id=>wwv_flow_imp.id(11750964761870025826)
,p_name=>'P367005001_SUPLR_DAIRY_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3110
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dairy Type'
,p_source=>'SUPLR_DAIRY_TYPE'
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
 p_id=>wwv_flow_imp.id(11749773177108972646)
,p_name=>'P367005001_SUPLR_DED_RND_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2300
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ded Rnd Type'
,p_source=>'SUPLR_DED_RND_TYPE'
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
 p_id=>wwv_flow_imp.id(11750948384166025812)
,p_name=>'P367005001_SUPLR_DED_RND_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2290
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ded Rnd Type'
,p_source=>'SUPLR_DED_RND_TYPE'
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
 p_id=>wwv_flow_imp.id(11749778808229972651)
,p_name=>'P367005001_SUPLR_DISALLOW_ADV_'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2580
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Disallow Adv Flag'
,p_source=>'SUPLR_DISALLOW_ADV_FLAG'
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
 p_id=>wwv_flow_imp.id(11750953989475025817)
,p_name=>'P367005001_SUPLR_DISALLOW_ADV__1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2570
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Disallow Adv Flag'
,p_source=>'SUPLR_DISALLOW_ADV_FLAG'
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
 p_id=>wwv_flow_imp.id(11749741164839972618)
,p_name=>'P367005001_SUPLR_DIST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Dist'
,p_source=>'SUPLR_DIST'
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
 p_id=>wwv_flow_imp.id(11750916410190025779)
,p_name=>'P367005001_SUPLR_DIST_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Dist'
,p_source=>'SUPLR_DIST'
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
 p_id=>wwv_flow_imp.id(11749795171719972665)
,p_name=>'P367005001_SUPLR_DOC_CLASS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3400
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Doc Class'
,p_source=>'SUPLR_DOC_CLASS'
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
 p_id=>wwv_flow_imp.id(11750970410168025831)
,p_name=>'P367005001_SUPLR_DOC_CLASS_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3390
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Doc Class'
,p_source=>'SUPLR_DOC_CLASS'
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
 p_id=>wwv_flow_imp.id(11749785549681972656)
,p_name=>'P367005001_SUPLR_EDIT_FLG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2920
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Edit Flg'
,p_source=>'SUPLR_EDIT_FLG'
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
 p_id=>wwv_flow_imp.id(11750960764445025823)
,p_name=>'P367005001_SUPLR_EDIT_FLG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2910
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Edit Flg'
,p_source=>'SUPLR_EDIT_FLG'
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
 p_id=>wwv_flow_imp.id(11749746332296972623)
,p_name=>'P367005001_SUPLR_EIN_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ein No'
,p_source=>'SUPLR_EIN_NO'
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
 p_id=>wwv_flow_imp.id(11750921564773025787)
,p_name=>'P367005001_SUPLR_EIN_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ein No'
,p_source=>'SUPLR_EIN_NO'
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
 p_id=>wwv_flow_imp.id(11749737575801972615)
,p_name=>'P367005001_SUPLR_EMAIL1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Email1'
,p_source=>'SUPLR_EMAIL1'
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
 p_id=>wwv_flow_imp.id(11750912787084025773)
,p_name=>'P367005001_SUPLR_EMAIL1_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Email1'
,p_source=>'SUPLR_EMAIL1'
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
 p_id=>wwv_flow_imp.id(11749737955578972615)
,p_name=>'P367005001_SUPLR_EMAIL2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Email2'
,p_source=>'SUPLR_EMAIL2'
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
 p_id=>wwv_flow_imp.id(11750913164257025773)
,p_name=>'P367005001_SUPLR_EMAIL2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Email2'
,p_source=>'SUPLR_EMAIL2'
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
 p_id=>wwv_flow_imp.id(11749739152851972615)
,p_name=>'P367005001_SUPLR_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Emp Id'
,p_source=>'SUPLR_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11750914371143025775)
,p_name=>'P367005001_SUPLR_EMP_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Emp Id'
,p_source=>'SUPLR_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11749750739278972626)
,p_name=>'P367005001_SUPLR_ESI_DED_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1180
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Esi Ded Flag'
,p_source=>'SUPLR_ESI_DED_FLAG'
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
 p_id=>wwv_flow_imp.id(11750925964054025795)
,p_name=>'P367005001_SUPLR_ESI_DED_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1170
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Esi Ded Flag'
,p_source=>'SUPLR_ESI_DED_FLAG'
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
 p_id=>wwv_flow_imp.id(11749769553977972643)
,p_name=>'P367005001_SUPLR_ESI_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2120
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Esi Flag'
,p_source=>'SUPLR_ESI_FLAG'
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
 p_id=>wwv_flow_imp.id(11750944755912025811)
,p_name=>'P367005001_SUPLR_ESI_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2110
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Esi Flag'
,p_source=>'SUPLR_ESI_FLAG'
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
 p_id=>wwv_flow_imp.id(11749758759433972634)
,p_name=>'P367005001_SUPLR_FAC_LIC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1580
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Fac Lic No'
,p_source=>'SUPLR_FAC_LIC_NO'
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
 p_id=>wwv_flow_imp.id(11750933980110025801)
,p_name=>'P367005001_SUPLR_FAC_LIC_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1570
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Fac Lic No'
,p_source=>'SUPLR_FAC_LIC_NO'
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
 p_id=>wwv_flow_imp.id(11749736761131972614)
,p_name=>'P367005001_SUPLR_FAX1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Fax1'
,p_source=>'SUPLR_FAX1'
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
 p_id=>wwv_flow_imp.id(11750912015839025771)
,p_name=>'P367005001_SUPLR_FAX1_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Fax1'
,p_source=>'SUPLR_FAX1'
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
 p_id=>wwv_flow_imp.id(11749737227354972614)
,p_name=>'P367005001_SUPLR_FAX2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Fax2'
,p_source=>'SUPLR_FAX2'
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
 p_id=>wwv_flow_imp.id(11750912387902025771)
,p_name=>'P367005001_SUPLR_FAX2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Fax2'
,p_source=>'SUPLR_FAX2'
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
 p_id=>wwv_flow_imp.id(11749731945438972611)
,p_name=>'P367005001_SUPLR_FOB_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Fob Id'
,p_source=>'SUPLR_FOB_ID'
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
 p_id=>wwv_flow_imp.id(11750907168459025762)
,p_name=>'P367005001_SUPLR_FOB_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Fob Id'
,p_source=>'SUPLR_FOB_ID'
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
 p_id=>wwv_flow_imp.id(11749775964055972648)
,p_name=>'P367005001_SUPLR_FRM_AGENT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2440
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frm Agent Id'
,p_source=>'SUPLR_FRM_AGENT_ID'
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
 p_id=>wwv_flow_imp.id(11750951194343025815)
,p_name=>'P367005001_SUPLR_FRM_AGENT_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2430
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frm Agent Id'
,p_source=>'SUPLR_FRM_AGENT_ID'
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
 p_id=>wwv_flow_imp.id(11749774744702972648)
,p_name=>'P367005001_SUPLR_FRM_FATHER_NA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2380
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frm Father Name'
,p_source=>'SUPLR_FRM_FATHER_NAME'
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
 p_id=>wwv_flow_imp.id(11750950007716025814)
,p_name=>'P367005001_SUPLR_FRM_FATHER_NA_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2370
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frm Father Name'
,p_source=>'SUPLR_FRM_FATHER_NAME'
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
 p_id=>wwv_flow_imp.id(11749775168606972648)
,p_name=>'P367005001_SUPLR_FRM_FIELD_NAM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2400
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frm Field Name'
,p_source=>'SUPLR_FRM_FIELD_NAME'
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
 p_id=>wwv_flow_imp.id(11750950338598025814)
,p_name=>'P367005001_SUPLR_FRM_FIELD_NAM_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2390
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frm Field Name'
,p_source=>'SUPLR_FRM_FIELD_NAME'
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
 p_id=>wwv_flow_imp.id(11749775603866972648)
,p_name=>'P367005001_SUPLR_FRM_PLACE_NAM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2420
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frm Place Name'
,p_source=>'SUPLR_FRM_PLACE_NAME'
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
 p_id=>wwv_flow_imp.id(11750950729454025815)
,p_name=>'P367005001_SUPLR_FRM_PLACE_NAM_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2410
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frm Place Name'
,p_source=>'SUPLR_FRM_PLACE_NAME'
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
 p_id=>wwv_flow_imp.id(11749776381117972648)
,p_name=>'P367005001_SUPLR_FRM_PLNT_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2460
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frm Plnt Area'
,p_source=>'SUPLR_FRM_PLNT_AREA'
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
 p_id=>wwv_flow_imp.id(11750951594800025815)
,p_name=>'P367005001_SUPLR_FRM_PLNT_AREA_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2450
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frm Plnt Area'
,p_source=>'SUPLR_FRM_PLNT_AREA'
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
 p_id=>wwv_flow_imp.id(11749783984423972656)
,p_name=>'P367005001_SUPLR_FRWD_FLG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2840
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Frwd Flg'
,p_source=>'SUPLR_FRWD_FLG'
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
 p_id=>wwv_flow_imp.id(11750959185690025821)
,p_name=>'P367005001_SUPLR_FRWD_FLG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2830
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Frwd Flg'
,p_source=>'SUPLR_FRWD_FLG'
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
 p_id=>wwv_flow_imp.id(11749730346479972609)
,p_name=>'P367005001_SUPLR_GROUP_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Group Id'
,p_source=>'SUPLR_GROUP_ID'
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
 p_id=>wwv_flow_imp.id(11750905554411025761)
,p_name=>'P367005001_SUPLR_GROUP_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Group Id'
,p_source=>'SUPLR_GROUP_ID'
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
 p_id=>wwv_flow_imp.id(11749773529864972646)
,p_name=>'P367005001_SUPLR_GST_EDIT_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2320
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Gst Edit Flag'
,p_source=>'SUPLR_GST_EDIT_FLAG'
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
 p_id=>wwv_flow_imp.id(11750948733617025814)
,p_name=>'P367005001_SUPLR_GST_EDIT_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2310
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Gst Edit Flag'
,p_source=>'SUPLR_GST_EDIT_FLAG'
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
 p_id=>wwv_flow_imp.id(11749769168109972643)
,p_name=>'P367005001_SUPLR_GST_ROF'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2100
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Gst Rof'
,p_source=>'SUPLR_GST_ROF'
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
 p_id=>wwv_flow_imp.id(11750944347176025809)
,p_name=>'P367005001_SUPLR_GST_ROF_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2090
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Gst Rof'
,p_source=>'SUPLR_GST_ROF'
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
 p_id=>wwv_flow_imp.id(11749756377751972631)
,p_name=>'P367005001_SUPLR_HOLD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>1460
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Hold Date'
,p_source=>'SUPLR_HOLD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750931578237025800)
,p_name=>'P367005001_SUPLR_HOLD_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>1450
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Hold Date'
,p_source=>'SUPLR_HOLD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749752743898972628)
,p_name=>'P367005001_SUPLR_HOLD_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1280
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Hold Flag'
,p_source=>'SUPLR_HOLD_FLAG'
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
 p_id=>wwv_flow_imp.id(11750927944958025796)
,p_name=>'P367005001_SUPLR_HOLD_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1270
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Hold Flag'
,p_source=>'SUPLR_HOLD_FLAG'
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
 p_id=>wwv_flow_imp.id(11749756730077972631)
,p_name=>'P367005001_SUPLR_HOLD_REASON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1480
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Hold Reason'
,p_source=>'SUPLR_HOLD_REASON'
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
 p_id=>wwv_flow_imp.id(11750931978673025800)
,p_name=>'P367005001_SUPLR_HOLD_REASON_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1470
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Hold Reason'
,p_source=>'SUPLR_HOLD_REASON'
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
 p_id=>wwv_flow_imp.id(11749774372960972646)
,p_name=>'P367005001_SUPLR_IBAN_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2360
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Iban No'
,p_source=>'SUPLR_IBAN_NO'
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
 p_id=>wwv_flow_imp.id(11750949609820025814)
,p_name=>'P367005001_SUPLR_IBAN_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2350
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Iban No'
,p_source=>'SUPLR_IBAN_NO'
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
 p_id=>wwv_flow_imp.id(11749746740433972623)
,p_name=>'P367005001_SUPLR_ID_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Id Type'
,p_source=>'SUPLR_ID_TYPE'
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
 p_id=>wwv_flow_imp.id(11750921935366025789)
,p_name=>'P367005001_SUPLR_ID_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Id Type'
,p_source=>'SUPLR_ID_TYPE'
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
 p_id=>wwv_flow_imp.id(11749760428180972634)
,p_name=>'P367005001_SUPLR_IFSC_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1660
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ifsc Code'
,p_source=>'SUPLR_IFSC_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>11
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
 p_id=>wwv_flow_imp.id(11750935576391025803)
,p_name=>'P367005001_SUPLR_IFSC_CODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1650
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ifsc Code'
,p_source=>'SUPLR_IFSC_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>11
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
 p_id=>wwv_flow_imp.id(11749754801349972629)
,p_name=>'P367005001_SUPLR_IT_DDTE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr It Ddte Name'
,p_source=>'SUPLR_IT_DDTE_NAME'
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
 p_id=>wwv_flow_imp.id(11750929938180025798)
,p_name=>'P367005001_SUPLR_IT_DDTE_NAME_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr It Ddte Name'
,p_source=>'SUPLR_IT_DDTE_NAME'
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
 p_id=>wwv_flow_imp.id(11749796739647972667)
,p_name=>'P367005001_SUPLR_LAST_EVA_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>3480
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Last Eva Date'
,p_source=>'SUPLR_LAST_EVA_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750971972049025832)
,p_name=>'P367005001_SUPLR_LAST_EVA_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>3470
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Last Eva Date'
,p_source=>'SUPLR_LAST_EVA_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749761529964972636)
,p_name=>'P367005001_SUPLR_LGR_GRP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1720
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Lgr Grp'
,p_source=>'SUPLR_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11750936818533025804)
,p_name=>'P367005001_SUPLR_LGR_GRP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1710
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Lgr Grp'
,p_source=>'SUPLR_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11749776784264972650)
,p_name=>'P367005001_SUPLR_MAX_DISC_AMT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2480
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Max Disc Amt'
,p_source=>'SUPLR_MAX_DISC_AMT'
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
 p_id=>wwv_flow_imp.id(11750951972023025815)
,p_name=>'P367005001_SUPLR_MAX_DISC_AMT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2470
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Max Disc Amt'
,p_source=>'SUPLR_MAX_DISC_AMT'
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
 p_id=>wwv_flow_imp.id(11749748369667972625)
,p_name=>'P367005001_SUPLR_MFG_DIST_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Mfg Dist Type'
,p_source=>'SUPLR_MFG_DIST_TYPE'
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
 p_id=>wwv_flow_imp.id(11750923562170025792)
,p_name=>'P367005001_SUPLR_MFG_DIST_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Mfg Dist Type'
,p_source=>'SUPLR_MFG_DIST_TYPE'
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
 p_id=>wwv_flow_imp.id(11749766736885972640)
,p_name=>'P367005001_SUPLR_MODE_GEN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1980
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Mode Gen'
,p_source=>'SUPLR_MODE_GEN'
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
 p_id=>wwv_flow_imp.id(11750941982884025807)
,p_name=>'P367005001_SUPLR_MODE_GEN_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1970
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Mode Gen'
,p_source=>'SUPLR_MODE_GEN'
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
 p_id=>wwv_flow_imp.id(11749765966815972640)
,p_name=>'P367005001_SUPLR_MODE_PUR'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1940
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Mode Pur'
,p_source=>'SUPLR_MODE_PUR'
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
 p_id=>wwv_flow_imp.id(11750941147043025807)
,p_name=>'P367005001_SUPLR_MODE_PUR_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1930
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Mode Pur'
,p_source=>'SUPLR_MODE_PUR'
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
 p_id=>wwv_flow_imp.id(11749766410729972640)
,p_name=>'P367005001_SUPLR_MODE_SC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1960
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Mode Sc'
,p_source=>'SUPLR_MODE_SC'
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
 p_id=>wwv_flow_imp.id(11750941606625025807)
,p_name=>'P367005001_SUPLR_MODE_SC_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1950
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Mode Sc'
,p_source=>'SUPLR_MODE_SC'
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
 p_id=>wwv_flow_imp.id(11749781540636972653)
,p_name=>'P367005001_SUPLR_MSME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2720
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Msme Type'
,p_source=>'SUPLR_MSME_TYPE'
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
 p_id=>wwv_flow_imp.id(11750956802818025820)
,p_name=>'P367005001_SUPLR_MSME_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2710
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Msme Type'
,p_source=>'SUPLR_MSME_TYPE'
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
 p_id=>wwv_flow_imp.id(11749729170151972609)
,p_name=>'P367005001_SUPLR_NAME1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Name1'
,p_source=>'SUPLR_NAME1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(11750904329507025757)
,p_name=>'P367005001_SUPLR_NAME1_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Name1'
,p_source=>'SUPLR_NAME1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(11749729609217972609)
,p_name=>'P367005001_SUPLR_NAME2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Name2'
,p_source=>'SUPLR_NAME2'
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
 p_id=>wwv_flow_imp.id(11750904741335025759)
,p_name=>'P367005001_SUPLR_NAME2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Name2'
,p_source=>'SUPLR_NAME2'
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
 p_id=>wwv_flow_imp.id(11749797220802972667)
,p_name=>'P367005001_SUPLR_NEXT_EVA_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>3500
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Next Eva Date'
,p_source=>'SUPLR_NEXT_EVA_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750972417654025832)
,p_name=>'P367005001_SUPLR_NEXT_EVA_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>3490
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Next Eva Date'
,p_source=>'SUPLR_NEXT_EVA_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749757576373972632)
,p_name=>'P367005001_SUPLR_NO_OF_EMP'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1520
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr No Of Emp'
,p_source=>'SUPLR_NO_OF_EMP'
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
 p_id=>wwv_flow_imp.id(11750932793364025801)
,p_name=>'P367005001_SUPLR_NO_OF_EMP_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1510
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr No Of Emp'
,p_source=>'SUPLR_NO_OF_EMP'
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
 p_id=>wwv_flow_imp.id(11749757946535972632)
,p_name=>'P367005001_SUPLR_NO_OF_STAFF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1540
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr No Of Staff'
,p_source=>'SUPLR_NO_OF_STAFF'
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
 p_id=>wwv_flow_imp.id(11750933229339025801)
,p_name=>'P367005001_SUPLR_NO_OF_STAFF_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1530
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr No Of Staff'
,p_source=>'SUPLR_NO_OF_STAFF'
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
 p_id=>wwv_flow_imp.id(11749758428334972632)
,p_name=>'P367005001_SUPLR_NO_OF_TECH_PE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1560
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr No Of Tech Per'
,p_source=>'SUPLR_NO_OF_TECH_PER'
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
 p_id=>wwv_flow_imp.id(11750933593085025801)
,p_name=>'P367005001_SUPLR_NO_OF_TECH_PE_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1550
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr No Of Tech Per'
,p_source=>'SUPLR_NO_OF_TECH_PER'
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
 p_id=>wwv_flow_imp.id(11749757133845972632)
,p_name=>'P367005001_SUPLR_ORD_HOLD_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1500
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ord Hold Flag'
,p_source=>'SUPLR_ORD_HOLD_FLAG'
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
 p_id=>wwv_flow_imp.id(11750932415222025800)
,p_name=>'P367005001_SUPLR_ORD_HOLD_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1490
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ord Hold Flag'
,p_source=>'SUPLR_ORD_HOLD_FLAG'
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
 p_id=>wwv_flow_imp.id(11749764822615972639)
,p_name=>'P367005001_SUPLR_OTHR_SW_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1880
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Othr Sw Id'
,p_source=>'SUPLR_OTHR_SW_ID'
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
 p_id=>wwv_flow_imp.id(11750939968480025806)
,p_name=>'P367005001_SUPLR_OTHR_SW_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1870
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Othr Sw Id'
,p_source=>'SUPLR_OTHR_SW_ID'
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
 p_id=>wwv_flow_imp.id(11749763963332972639)
,p_name=>'P367005001_SUPLR_PARENT_SUPLR_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1840
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Parent Suplr Id'
,p_source=>'SUPLR_PARENT_SUPLR_ID'
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
 p_id=>wwv_flow_imp.id(11750939170184025806)
,p_name=>'P367005001_SUPLR_PARENT_SUPLR__1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1830
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Parent Suplr Id'
,p_source=>'SUPLR_PARENT_SUPLR_ID'
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
 p_id=>wwv_flow_imp.id(11749768392708972642)
,p_name=>'P367005001_SUPLR_PART_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2060
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Part Flag'
,p_source=>'SUPLR_PART_FLAG'
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
 p_id=>wwv_flow_imp.id(11750943542361025809)
,p_name=>'P367005001_SUPLR_PART_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2050
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Part Flag'
,p_source=>'SUPLR_PART_FLAG'
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
 p_id=>wwv_flow_imp.id(11749771963664972645)
,p_name=>'P367005001_SUPLR_PATNER_FLG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2240
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Patner Flg'
,p_source=>'SUPLR_PATNER_FLG'
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
 p_id=>wwv_flow_imp.id(11750947185941025812)
,p_name=>'P367005001_SUPLR_PATNER_FLG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2230
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Patner Flg'
,p_source=>'SUPLR_PATNER_FLG'
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
 p_id=>wwv_flow_imp.id(11749742352305972620)
,p_name=>'P367005001_SUPLR_PAY_ACCT_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Acct No'
,p_source=>'SUPLR_PAY_ACCT_NO'
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
 p_id=>wwv_flow_imp.id(11750917585049025781)
,p_name=>'P367005001_SUPLR_PAY_ACCT_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Acct No'
,p_source=>'SUPLR_PAY_ACCT_NO'
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
 p_id=>wwv_flow_imp.id(11749767966341972642)
,p_name=>'P367005001_SUPLR_PAY_ACCT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2040
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Acct Type'
,p_source=>'SUPLR_PAY_ACCT_TYPE'
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
 p_id=>wwv_flow_imp.id(11750943178436025809)
,p_name=>'P367005001_SUPLR_PAY_ACCT_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2030
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Acct Type'
,p_source=>'SUPLR_PAY_ACCT_TYPE'
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
 p_id=>wwv_flow_imp.id(11749741531308972620)
,p_name=>'P367005001_SUPLR_PAY_BANK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Bank'
,p_source=>'SUPLR_PAY_BANK'
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
 p_id=>wwv_flow_imp.id(11750916821152025779)
,p_name=>'P367005001_SUPLR_PAY_BANK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Bank'
,p_source=>'SUPLR_PAY_BANK'
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
 p_id=>wwv_flow_imp.id(11749741990880972620)
,p_name=>'P367005001_SUPLR_PAY_BANK_BR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Bank Br'
,p_source=>'SUPLR_PAY_BANK_BR'
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
 p_id=>wwv_flow_imp.id(11750917163130025779)
,p_name=>'P367005001_SUPLR_PAY_BANK_BR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Bank Br'
,p_source=>'SUPLR_PAY_BANK_BR'
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
 p_id=>wwv_flow_imp.id(11749772370949972645)
,p_name=>'P367005001_SUPLR_PAY_BANK_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2260
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Bank Desc'
,p_source=>'SUPLR_PAY_BANK_DESC'
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
 p_id=>wwv_flow_imp.id(11750947607736025812)
,p_name=>'P367005001_SUPLR_PAY_BANK_DESC_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2250
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Bank Desc'
,p_source=>'SUPLR_PAY_BANK_DESC'
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
 p_id=>wwv_flow_imp.id(11749772803193972645)
,p_name=>'P367005001_SUPLR_PAY_BRANCH_DE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2280
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Branch Desc'
,p_source=>'SUPLR_PAY_BRANCH_DESC'
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
 p_id=>wwv_flow_imp.id(11750947967408025812)
,p_name=>'P367005001_SUPLR_PAY_BRANCH_DE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2270
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Branch Desc'
,p_source=>'SUPLR_PAY_BRANCH_DESC'
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
 p_id=>wwv_flow_imp.id(11749740010787972618)
,p_name=>'P367005001_SUPLR_PAY_MODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pay Mode'
,p_source=>'SUPLR_PAY_MODE'
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
 p_id=>wwv_flow_imp.id(11750915170278025776)
,p_name=>'P367005001_SUPLR_PAY_MODE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pay Mode'
,p_source=>'SUPLR_PAY_MODE'
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
 p_id=>wwv_flow_imp.id(11749793542779972665)
,p_name=>'P367005001_SUPLR_PF_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3320
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pf Flag'
,p_source=>'SUPLR_PF_FLAG'
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
 p_id=>wwv_flow_imp.id(11750968812290025829)
,p_name=>'P367005001_SUPLR_PF_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3310
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pf Flag'
,p_source=>'SUPLR_PF_FLAG'
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
 p_id=>wwv_flow_imp.id(11749748744452972625)
,p_name=>'P367005001_SUPLR_PLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Plant'
,p_source=>'SUPLR_PLANT'
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
 p_id=>wwv_flow_imp.id(11750923939301025792)
,p_name=>'P367005001_SUPLR_PLANT_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Plant'
,p_source=>'SUPLR_PLANT'
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
 p_id=>wwv_flow_imp.id(11749734006641972612)
,p_name=>'P367005001_SUPLR_PO_BOX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Po Box'
,p_source=>'SUPLR_PO_BOX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
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
 p_id=>wwv_flow_imp.id(11750909139074025767)
,p_name=>'P367005001_SUPLR_PO_BOX_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Po Box'
,p_source=>'SUPLR_PO_BOX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
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
 p_id=>wwv_flow_imp.id(11749765567216972640)
,p_name=>'P367005001_SUPLR_PRICE_BASIS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1920
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Price Basis'
,p_source=>'SUPLR_PRICE_BASIS'
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
 p_id=>wwv_flow_imp.id(11750940810733025807)
,p_name=>'P367005001_SUPLR_PRICE_BASIS_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1910
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Price Basis'
,p_source=>'SUPLR_PRICE_BASIS'
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
 p_id=>wwv_flow_imp.id(11749750412158972626)
,p_name=>'P367005001_SUPLR_PRNT_CAPN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1160
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Prnt Capn'
,p_source=>'SUPLR_PRNT_CAPN'
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
 p_id=>wwv_flow_imp.id(11749762335826972636)
,p_name=>'P367005001_SUPLR_PRNT_CAPN1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1760
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Prnt Capn1'
,p_source=>'SUPLR_PRNT_CAPN1'
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
 p_id=>wwv_flow_imp.id(11750937565438025804)
,p_name=>'P367005001_SUPLR_PRNT_CAPN1_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1750
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Prnt Capn1'
,p_source=>'SUPLR_PRNT_CAPN1'
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
 p_id=>wwv_flow_imp.id(11750925596345025795)
,p_name=>'P367005001_SUPLR_PRNT_CAPN_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1150
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Prnt Capn'
,p_source=>'SUPLR_PRNT_CAPN'
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
 p_id=>wwv_flow_imp.id(11749745586340972623)
,p_name=>'P367005001_SUPLR_PROD_CAP_QTY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Prod Cap Qty'
,p_source=>'SUPLR_PROD_CAP_QTY'
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
 p_id=>wwv_flow_imp.id(11750920770397025786)
,p_name=>'P367005001_SUPLR_PROD_CAP_QTY_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Prod Cap Qty'
,p_source=>'SUPLR_PROD_CAP_QTY'
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
 p_id=>wwv_flow_imp.id(11749744798280972621)
,p_name=>'P367005001_SUPLR_PROSPECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Prospect'
,p_source=>'SUPLR_PROSPECT'
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
 p_id=>wwv_flow_imp.id(11750920015291025786)
,p_name=>'P367005001_SUPLR_PROSPECT_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Prospect'
,p_source=>'SUPLR_PROSPECT'
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
 p_id=>wwv_flow_imp.id(11749753585928972629)
,p_name=>'P367005001_SUPLR_PT_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1320
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Pt Pfx'
,p_source=>'SUPLR_PT_PFX'
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
 p_id=>wwv_flow_imp.id(11750928783813025798)
,p_name=>'P367005001_SUPLR_PT_PFX_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1310
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Pt Pfx'
,p_source=>'SUPLR_PT_PFX'
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
 p_id=>wwv_flow_imp.id(11749764395948972639)
,p_name=>'P367005001_SUPLR_QC_SYS_GRADE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1860
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Qc Sys Grade'
,p_source=>'SUPLR_QC_SYS_GRADE'
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
 p_id=>wwv_flow_imp.id(11750939575831025806)
,p_name=>'P367005001_SUPLR_QC_SYS_GRADE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1850
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Qc Sys Grade'
,p_source=>'SUPLR_QC_SYS_GRADE'
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
 p_id=>wwv_flow_imp.id(11749755163993972631)
,p_name=>'P367005001_SUPLR_RA_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1400
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ra Status'
,p_source=>'SUPLR_RA_STATUS'
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
 p_id=>wwv_flow_imp.id(11750930348550025798)
,p_name=>'P367005001_SUPLR_RA_STATUS_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ra Status'
,p_source=>'SUPLR_RA_STATUS'
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
 p_id=>wwv_flow_imp.id(11749750017514972626)
,p_name=>'P367005001_SUPLR_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Reference'
,p_source=>'SUPLR_REFERENCE'
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
 p_id=>wwv_flow_imp.id(11750925183364025793)
,p_name=>'P367005001_SUPLR_REFERENCE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Reference'
,p_source=>'SUPLR_REFERENCE'
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
 p_id=>wwv_flow_imp.id(11749777174744972650)
,p_name=>'P367005001_SUPLR_RENTAL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2500
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Rental Flag'
,p_source=>'SUPLR_RENTAL_FLAG'
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
 p_id=>wwv_flow_imp.id(11750952404653025815)
,p_name=>'P367005001_SUPLR_RENTAL_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2490
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Rental Flag'
,p_source=>'SUPLR_RENTAL_FLAG'
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
 p_id=>wwv_flow_imp.id(11749755613887972631)
,p_name=>'P367005001_SUPLR_RGSTD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>1420
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Rgstd Date'
,p_source=>'SUPLR_RGSTD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750930772701025800)
,p_name=>'P367005001_SUPLR_RGSTD_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>1410
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Rgstd Date'
,p_source=>'SUPLR_RGSTD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749771578265972645)
,p_name=>'P367005001_SUPLR_RND_DIGIT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2220
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Rnd Digit'
,p_source=>'SUPLR_RND_DIGIT'
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
 p_id=>wwv_flow_imp.id(11750946802872025812)
,p_name=>'P367005001_SUPLR_RND_DIGIT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2210
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Rnd Digit'
,p_source=>'SUPLR_RND_DIGIT'
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
 p_id=>wwv_flow_imp.id(11749791553016972662)
,p_name=>'P367005001_SUPLR_ROUTE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3220
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Route Id'
,p_source=>'SUPLR_ROUTE_ID'
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
 p_id=>wwv_flow_imp.id(11750966789380025828)
,p_name=>'P367005001_SUPLR_ROUTE_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3210
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Route Id'
,p_source=>'SUPLR_ROUTE_ID'
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
 p_id=>wwv_flow_imp.id(11749760810159972636)
,p_name=>'P367005001_SUPLR_RTGS_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1680
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Rtgs Flag'
,p_source=>'SUPLR_RTGS_FLAG'
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
 p_id=>wwv_flow_imp.id(11750936006146025803)
,p_name=>'P367005001_SUPLR_RTGS_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1670
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Rtgs Flag'
,p_source=>'SUPLR_RTGS_FLAG'
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
 p_id=>wwv_flow_imp.id(11749753956407972629)
,p_name=>'P367005001_SUPLR_RT_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1340
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Rt Pfx'
,p_source=>'SUPLR_RT_PFX'
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
 p_id=>wwv_flow_imp.id(11750929152587025798)
,p_name=>'P367005001_SUPLR_RT_PFX_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1330
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Rt Pfx'
,p_source=>'SUPLR_RT_PFX'
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
 p_id=>wwv_flow_imp.id(11749742768420972620)
,p_name=>'P367005001_SUPLR_RYOT_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ryot Flag'
,p_source=>'SUPLR_RYOT_FLAG'
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
 p_id=>wwv_flow_imp.id(11750918007114025781)
,p_name=>'P367005001_SUPLR_RYOT_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ryot Flag'
,p_source=>'SUPLR_RYOT_FLAG'
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
 p_id=>wwv_flow_imp.id(11749789217293972661)
,p_name=>'P367005001_SUPLR_SD_LGR_GRP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3100
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Sd Lgr Grp'
,p_source=>'SUPLR_SD_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11750964351288025826)
,p_name=>'P367005001_SUPLR_SD_LGR_GRP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3090
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Sd Lgr Grp'
,p_source=>'SUPLR_SD_LGR_GRP'
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
 p_id=>wwv_flow_imp.id(11749754413310972629)
,p_name=>'P367005001_SUPLR_SEC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Sec No'
,p_source=>'SUPLR_SEC_NO'
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
 p_id=>wwv_flow_imp.id(11750929596321025798)
,p_name=>'P367005001_SUPLR_SEC_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1350
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Sec No'
,p_source=>'SUPLR_SEC_NO'
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
 p_id=>wwv_flow_imp.id(11749731588689972611)
,p_name=>'P367005001_SUPLR_SHIPVIA_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Shipvia Id'
,p_source=>'SUPLR_SHIPVIA_ID'
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
 p_id=>wwv_flow_imp.id(11750906798220025762)
,p_name=>'P367005001_SUPLR_SHIPVIA_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Shipvia Id'
,p_source=>'SUPLR_SHIPVIA_ID'
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
 p_id=>wwv_flow_imp.id(11749759163938972634)
,p_name=>'P367005001_SUPLR_SSI_CERT_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1600
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Ssi Cert No'
,p_source=>'SUPLR_SSI_CERT_NO'
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
 p_id=>wwv_flow_imp.id(11750934369178025801)
,p_name=>'P367005001_SUPLR_SSI_CERT_NO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1590
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Ssi Cert No'
,p_source=>'SUPLR_SSI_CERT_NO'
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
 p_id=>wwv_flow_imp.id(11749734818722972612)
,p_name=>'P367005001_SUPLR_STATE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr State'
,p_source=>'SUPLR_STATE'
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
 p_id=>wwv_flow_imp.id(11750909959869025767)
,p_name=>'P367005001_SUPLR_STATE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr State'
,p_source=>'SUPLR_STATE'
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
 p_id=>wwv_flow_imp.id(11749728808373972607)
,p_name=>'P367005001_SUPLR_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Status'
,p_source=>'SUPLR_STATUS'
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
 p_id=>wwv_flow_imp.id(11750903972851025757)
,p_name=>'P367005001_SUPLR_STATUS_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Status'
,p_source=>'SUPLR_STATUS'
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
 p_id=>wwv_flow_imp.id(11749747980192972625)
,p_name=>'P367005001_SUPLR_SUBGROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Subgroup'
,p_source=>'SUPLR_SUBGROUP'
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
 p_id=>wwv_flow_imp.id(11750923220258025790)
,p_name=>'P367005001_SUPLR_SUBGROUP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Subgroup'
,p_source=>'SUPLR_SUBGROUP'
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
 p_id=>wwv_flow_imp.id(11749778365366972651)
,p_name=>'P367005001_SUPLR_SUB_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2560
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Sub Plnt'
,p_source=>'SUPLR_SUB_PLNT'
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
 p_id=>wwv_flow_imp.id(11750953537795025817)
,p_name=>'P367005001_SUPLR_SUB_PLNT_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2550
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Sub Plnt'
,p_source=>'SUPLR_SUB_PLNT'
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
 p_id=>wwv_flow_imp.id(11749728370046972607)
,p_name=>'P367005001_SUPLR_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Suplr Id'
,p_source=>'SUPLR_SUPLR_ID'
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
 p_id=>wwv_flow_imp.id(11750903594914025756)
,p_name=>'P367005001_SUPLR_SUPLR_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Suplr Id'
,p_source=>'SUPLR_SUPLR_ID'
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
 p_id=>wwv_flow_imp.id(11749767145274972642)
,p_name=>'P367005001_SUPLR_SVT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>2000
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Svt'
,p_source=>'SUPLR_SVT'
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
 p_id=>wwv_flow_imp.id(11750942419103025807)
,p_name=>'P367005001_SUPLR_SVT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1990
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Svt'
,p_source=>'SUPLR_SVT'
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
 p_id=>wwv_flow_imp.id(11749761208777972636)
,p_name=>'P367005001_SUPLR_SWIFT_BIC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1700
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Swift Bic'
,p_source=>'SUPLR_SWIFT_BIC'
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
 p_id=>wwv_flow_imp.id(11750936410709025803)
,p_name=>'P367005001_SUPLR_SWIFT_BIC_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1690
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Swift Bic'
,p_source=>'SUPLR_SWIFT_BIC'
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
 p_id=>wwv_flow_imp.id(11749740816900972618)
,p_name=>'P367005001_SUPLR_TALUK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Taluk'
,p_source=>'SUPLR_TALUK'
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
 p_id=>wwv_flow_imp.id(11750915987561025778)
,p_name=>'P367005001_SUPLR_TALUK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Taluk'
,p_source=>'SUPLR_TALUK'
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
 p_id=>wwv_flow_imp.id(11749753142935972629)
,p_name=>'P367005001_SUPLR_TCF_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1300
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tcf Id'
,p_source=>'SUPLR_TCF_ID'
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
 p_id=>wwv_flow_imp.id(11750928397035025796)
,p_name=>'P367005001_SUPLR_TCF_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1290
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tcf Id'
,p_source=>'SUPLR_TCF_ID'
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
 p_id=>wwv_flow_imp.id(11749795975642972667)
,p_name=>'P367005001_SUPLR_TCS_ACCT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3440
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tcs Acct'
,p_source=>'SUPLR_TCS_ACCT'
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
 p_id=>wwv_flow_imp.id(11750971219370025831)
,p_name=>'P367005001_SUPLR_TCS_ACCT_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>3430
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tcs Acct'
,p_source=>'SUPLR_TCS_ACCT'
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
 p_id=>wwv_flow_imp.id(11749796387326972667)
,p_name=>'P367005001_SUPLR_TCS_DED_FLG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3460
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tcs Ded Flg'
,p_source=>'SUPLR_TCS_DED_FLG'
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
 p_id=>wwv_flow_imp.id(11750971548810025832)
,p_name=>'P367005001_SUPLR_TCS_DED_FLG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>3450
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tcs Ded Flg'
,p_source=>'SUPLR_TCS_DED_FLG'
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
 p_id=>wwv_flow_imp.id(11749795566487972667)
,p_name=>'P367005001_SUPLR_TCS_ROF'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>3420
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tcs Rof'
,p_source=>'SUPLR_TCS_ROF'
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
 p_id=>wwv_flow_imp.id(11750970794980025831)
,p_name=>'P367005001_SUPLR_TCS_ROF_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>3410
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tcs Rof'
,p_source=>'SUPLR_TCS_ROF'
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
 p_id=>wwv_flow_imp.id(11749744426754972621)
,p_name=>'P367005001_SUPLR_TC_SET_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tc Set Id'
,p_source=>'SUPLR_TC_SET_ID'
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
 p_id=>wwv_flow_imp.id(11750919538927025784)
,p_name=>'P367005001_SUPLR_TC_SET_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tc Set Id'
,p_source=>'SUPLR_TC_SET_ID'
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
 p_id=>wwv_flow_imp.id(11749769971178972643)
,p_name=>'P367005001_SUPLR_TDS_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2140
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tds Flag'
,p_source=>'SUPLR_TDS_FLAG'
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
 p_id=>wwv_flow_imp.id(11750945170399025811)
,p_name=>'P367005001_SUPLR_TDS_FLAG_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>2130
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tds Flag'
,p_source=>'SUPLR_TDS_FLAG'
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
 p_id=>wwv_flow_imp.id(11749743576586972621)
,p_name=>'P367005001_SUPLR_TDS_GROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tds Group'
,p_source=>'SUPLR_TDS_GROUP'
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
 p_id=>wwv_flow_imp.id(11750918738335025782)
,p_name=>'P367005001_SUPLR_TDS_GROUP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tds Group'
,p_source=>'SUPLR_TDS_GROUP'
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
 p_id=>wwv_flow_imp.id(11749779167889972651)
,p_name=>'P367005001_SUPLR_TDS_TL_CHK_FL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2600
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tds Tl Chk Flag'
,p_source=>'SUPLR_TDS_TL_CHK_FLAG'
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
 p_id=>wwv_flow_imp.id(11750954426022025817)
,p_name=>'P367005001_SUPLR_TDS_TL_CHK_FL_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2590
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tds Tl Chk Flag'
,p_source=>'SUPLR_TDS_TL_CHK_FLAG'
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
 p_id=>wwv_flow_imp.id(11749735931684972614)
,p_name=>'P367005001_SUPLR_TELE1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tele1'
,p_source=>'SUPLR_TELE1'
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
 p_id=>wwv_flow_imp.id(11750911177900025770)
,p_name=>'P367005001_SUPLR_TELE1_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tele1'
,p_source=>'SUPLR_TELE1'
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
 p_id=>wwv_flow_imp.id(11749736349922972614)
,p_name=>'P367005001_SUPLR_TELE2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Tele2'
,p_source=>'SUPLR_TELE2'
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
 p_id=>wwv_flow_imp.id(11750911544274025770)
,p_name=>'P367005001_SUPLR_TELE2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Tele2'
,p_source=>'SUPLR_TELE2'
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
 p_id=>wwv_flow_imp.id(11749731219277972611)
,p_name=>'P367005001_SUPLR_TERM_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Term Id'
,p_source=>'SUPLR_TERM_ID'
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
 p_id=>wwv_flow_imp.id(11750906358449025761)
,p_name=>'P367005001_SUPLR_TERM_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Term Id'
,p_source=>'SUPLR_TERM_ID'
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
 p_id=>wwv_flow_imp.id(11749752423828972628)
,p_name=>'P367005001_SUPLR_TERR_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1260
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Terr Id'
,p_source=>'SUPLR_TERR_ID'
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
 p_id=>wwv_flow_imp.id(11750927618501025796)
,p_name=>'P367005001_SUPLR_TERR_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1250
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Terr Id'
,p_source=>'SUPLR_TERR_ID'
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
 p_id=>wwv_flow_imp.id(11749760006391972634)
,p_name=>'P367005001_SUPLR_TRANSFER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1640
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Transfer Bu'
,p_source=>'SUPLR_TRANSFER_BU'
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
 p_id=>wwv_flow_imp.id(11750935209271025803)
,p_name=>'P367005001_SUPLR_TRANSFER_BU_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1630
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Transfer Bu'
,p_source=>'SUPLR_TRANSFER_BU'
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
 p_id=>wwv_flow_imp.id(11749759574933972634)
,p_name=>'P367005001_SUPLR_TRANSFER_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1620
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Transfer Plnt'
,p_source=>'SUPLR_TRANSFER_PLNT'
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
 p_id=>wwv_flow_imp.id(11750934772747025803)
,p_name=>'P367005001_SUPLR_TRANSFER_PLNT_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1610
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Transfer Plnt'
,p_source=>'SUPLR_TRANSFER_PLNT'
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
 p_id=>wwv_flow_imp.id(11749765198488972640)
,p_name=>'P367005001_SUPLR_TRANSPORT_FLA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1900
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Transport Flag'
,p_source=>'SUPLR_TRANSPORT_FLAG'
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
 p_id=>wwv_flow_imp.id(11750940371332025806)
,p_name=>'P367005001_SUPLR_TRANSPORT_FLA_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>1890
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Transport Flag'
,p_source=>'SUPLR_TRANSPORT_FLAG'
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
 p_id=>wwv_flow_imp.id(11749751168100972628)
,p_name=>'P367005001_SUPLR_TRANS_DED_PCT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1200
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Trans Ded Pct'
,p_source=>'SUPLR_TRANS_DED_PCT'
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
 p_id=>wwv_flow_imp.id(11750926417668025795)
,p_name=>'P367005001_SUPLR_TRANS_DED_PCT_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1190
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Trans Ded Pct'
,p_source=>'SUPLR_TRANS_DED_PCT'
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
 p_id=>wwv_flow_imp.id(11749730813422972609)
,p_name=>'P367005001_SUPLR_TYPE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Type Id'
,p_source=>'SUPLR_TYPE_ID'
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
 p_id=>wwv_flow_imp.id(11750905940944025761)
,p_name=>'P367005001_SUPLR_TYPE_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Type Id'
,p_source=>'SUPLR_TYPE_ID'
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
 p_id=>wwv_flow_imp.id(11749745932170972623)
,p_name=>'P367005001_SUPLR_UOM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Uom'
,p_source=>'SUPLR_UOM'
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
 p_id=>wwv_flow_imp.id(11750921206898025787)
,p_name=>'P367005001_SUPLR_UOM_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Uom'
,p_source=>'SUPLR_UOM'
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
 p_id=>wwv_flow_imp.id(11749787609252972659)
,p_name=>'P367005001_SUPLR_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3020
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Upd By'
,p_source=>'SUPLR_UPD_BY'
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
 p_id=>wwv_flow_imp.id(11750962813127025825)
,p_name=>'P367005001_SUPLR_UPD_BY_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3010
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Upd By'
,p_source=>'SUPLR_UPD_BY'
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
 p_id=>wwv_flow_imp.id(11749788781392972661)
,p_name=>'P367005001_SUPLR_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>3080
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Upd Date'
,p_source=>'SUPLR_UPD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11750963964972025826)
,p_name=>'P367005001_SUPLR_UPD_DATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>3070
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Upd Date'
,p_source=>'SUPLR_UPD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749790348782972662)
,p_name=>'P367005001_SUPLR_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3160
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Upd Emp Id'
,p_source=>'SUPLR_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11750965545679025826)
,p_name=>'P367005001_SUPLR_UPD_EMP_ID_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3150
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Upd Emp Id'
,p_source=>'SUPLR_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(11749787962314972659)
,p_name=>'P367005001_SUPLR_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3040
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Upd Ip Addr'
,p_source=>'SUPLR_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(11750963165885025825)
,p_name=>'P367005001_SUPLR_UPD_IP_ADDR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3030
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Upd Ip Addr'
,p_source=>'SUPLR_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(11749788342974972659)
,p_name=>'P367005001_SUPLR_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3060
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Upd Os User'
,p_source=>'SUPLR_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(11750963617583025825)
,p_name=>'P367005001_SUPLR_UPD_OS_USER_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>3050
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Upd Os User'
,p_source=>'SUPLR_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(11749751568405972628)
,p_name=>'P367005001_SUPLR_VAT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1220
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Vat'
,p_source=>'SUPLR_VAT'
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
 p_id=>wwv_flow_imp.id(11750926798959025796)
,p_name=>'P367005001_SUPLR_VAT_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>1210
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Vat'
,p_source=>'SUPLR_VAT'
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
 p_id=>wwv_flow_imp.id(11749738391669972615)
,p_name=>'P367005001_SUPLR_WEB_SITE1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Web Site1'
,p_source=>'SUPLR_WEB_SITE1'
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
 p_id=>wwv_flow_imp.id(11750913587971025773)
,p_name=>'P367005001_SUPLR_WEB_SITE1_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Web Site1'
,p_source=>'SUPLR_WEB_SITE1'
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
 p_id=>wwv_flow_imp.id(11749738738837972615)
,p_name=>'P367005001_SUPLR_WEB_SITE2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Web Site2'
,p_source=>'SUPLR_WEB_SITE2'
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
 p_id=>wwv_flow_imp.id(11750914011366025775)
,p_name=>'P367005001_SUPLR_WEB_SITE2_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Web Site2'
,p_source=>'SUPLR_WEB_SITE2'
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
 p_id=>wwv_flow_imp.id(11749763144684972637)
,p_name=>'P367005001_SUPLR_WFR_HSPTL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1800
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Wfr Hsptl'
,p_source=>'SUPLR_WFR_HSPTL'
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
 p_id=>wwv_flow_imp.id(11750938388684025804)
,p_name=>'P367005001_SUPLR_WFR_HSPTL_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1790
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Wfr Hsptl'
,p_source=>'SUPLR_WFR_HSPTL'
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
 p_id=>wwv_flow_imp.id(11749762736944972637)
,p_name=>'P367005001_SUPLR_WFR_MDCL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1780
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Wfr Mdcl'
,p_source=>'SUPLR_WFR_MDCL'
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
 p_id=>wwv_flow_imp.id(11750937996391025804)
,p_name=>'P367005001_SUPLR_WFR_MDCL_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1770
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Wfr Mdcl'
,p_source=>'SUPLR_WFR_MDCL'
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
 p_id=>wwv_flow_imp.id(11749771160220972645)
,p_name=>'P367005001_SUPLR_WFR_MPW_AGNCY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2200
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Wfr Mpw Agncy'
,p_source=>'SUPLR_WFR_MPW_AGNCY'
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
 p_id=>wwv_flow_imp.id(11750946386626025811)
,p_name=>'P367005001_SUPLR_WFR_MPW_AGNCY_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2190
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Wfr Mpw Agncy'
,p_source=>'SUPLR_WFR_MPW_AGNCY'
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
 p_id=>wwv_flow_imp.id(11749770736418972643)
,p_name=>'P367005001_SUPLR_WFR_RCRTNG_AG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2180
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Wfr Rcrtng Agency'
,p_source=>'SUPLR_WFR_RCRTNG_AGENCY'
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
 p_id=>wwv_flow_imp.id(11750945933602025811)
,p_name=>'P367005001_SUPLR_WFR_RCRTNG_AG_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2170
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Wfr Rcrtng Agency'
,p_source=>'SUPLR_WFR_RCRTNG_AGENCY'
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
 p_id=>wwv_flow_imp.id(11749770419539972643)
,p_name=>'P367005001_SUPLR_WFR_TCKNG_AGE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2160
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Wfr Tckng Agency'
,p_source=>'SUPLR_WFR_TCKNG_AGENCY'
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
 p_id=>wwv_flow_imp.id(11750945576363025811)
,p_name=>'P367005001_SUPLR_WFR_TCKNG_AGE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>2150
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Wfr Tckng Agency'
,p_source=>'SUPLR_WFR_TCKNG_AGENCY'
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
 p_id=>wwv_flow_imp.id(11749735561927972614)
,p_name=>'P367005001_SUPLR_ZIP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_item_source_plug_id=>wwv_flow_imp.id(11749727126214972606)
,p_prompt=>'Suplr Zip'
,p_source=>'SUPLR_ZIP'
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
 p_id=>wwv_flow_imp.id(11750910775403025768)
,p_name=>'P367005001_SUPLR_ZIP_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_item_source_plug_id=>wwv_flow_imp.id(11750902515335025754)
,p_prompt=>'Suplr Zip'
,p_source=>'SUPLR_ZIP'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11751078295557025909)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11751078179043025909)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11751079042844025909)
,p_event_id=>wwv_flow_imp.id(11751078295557025909)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11749854011246972720)
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
,p_internal_uid=>6267892175703361692
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11751081809694025911)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>6269119974150414883
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11749853178157972718)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11749727126214972606)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Suppliers'
,p_static_id=>'initialize-form-suppliers'
,p_internal_uid=>6267891342614361690
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11751080952153025911)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11750902515335025754)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Suppliers'
,p_static_id=>'initialize-form-suppliers-2'
,p_internal_uid=>6269119116609414883
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11749853573533972718)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11749727126214972606)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Suppliers'
,p_static_id=>'process-form-suppliers'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6267891737990361690
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11751081406853025911)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11750902515335025754)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Suppliers'
,p_static_id=>'process-form-suppliers-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6269119571309414883
);
wwv_flow_imp.component_end;
end;
/
