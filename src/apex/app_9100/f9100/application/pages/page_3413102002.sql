prompt --application/pages/page_3413102002
begin
--   Manifest
--     PAGE: 3413102002
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
 p_id=>3413102002
,p_name=>'View Details - Pend. Receivables'
,p_alias=>'VIEW-DETAILS-PEND-RECEIVABLES'
,p_step_title=>'View Details - Pend. Receivables'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11696494768523204189)
,p_plug_name=>'View Details'
,p_static_id=>'view-details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PENDING_RECEIVABLES_VW_HIST'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698925290817944963)
,p_name=>'P3413102002_PARTNER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1230
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Partner Type'
,p_source=>'PARTNER_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495021419204191)
,p_name=>'P3413102002_PAR_ACCT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Acct Type'
,p_source=>'PAR_ACCT_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921103885944871)
,p_name=>'P3413102002_PAR_AGED_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Aged Days'
,p_source=>'PAR_AGED_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923462360944895)
,p_name=>'P3413102002_PAR_AREA_MNGR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Area Mngr Id'
,p_source=>'PAR_AREA_MNGR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495105462204192)
,p_name=>'P3413102002_PAR_BANK_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bank Id'
,p_source=>'PAR_BANK_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495149585204193)
,p_name=>'P3413102002_PAR_BC_EXRATE_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bc Exrate Amt'
,p_source=>'PAR_BC_EXRATE_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495323961204194)
,p_name=>'P3413102002_PAR_BFCRY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bfcry Id'
,p_source=>'PAR_BFCRY_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495356059204195)
,p_name=>'P3413102002_PAR_BFCRY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bfcry Type'
,p_source=>'PAR_BFCRY_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922660412944887)
,p_name=>'P3413102002_PAR_BILL_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bill Amt'
,p_source=>'PAR_BILL_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495528366204196)
,p_name=>'P3413102002_PAR_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Bu'
,p_source=>'PAR_BU'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495553705204197)
,p_name=>'P3413102002_PAR_CHECK_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Check Flag'
,p_source=>'PAR_CHECK_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495678757204198)
,p_name=>'P3413102002_PAR_CHQ_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Chq Date'
,p_source=>'PAR_CHQ_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11696495774605204199)
,p_name=>'P3413102002_PAR_CHQ_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Chq No'
,p_source=>'PAR_CHQ_NO'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(11696495869142204200)
,p_name=>'P3413102002_PAR_CLS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Cls Id'
,p_source=>'PAR_CLS_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696495963784204201)
,p_name=>'P3413102002_PAR_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Cre By'
,p_source=>'PAR_CRE_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496068852204202)
,p_name=>'P3413102002_PAR_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Cre Date'
,p_source=>'PAR_CRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11696496226300204203)
,p_name=>'P3413102002_PAR_CURRENCY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Currency'
,p_source=>'PAR_CURRENCY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922997816944890)
,p_name=>'P3413102002_PAR_CUST_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Cust Area'
,p_source=>'PAR_CUST_AREA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698925204355944962)
,p_name=>'P3413102002_PAR_DAIRY_CAN_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1220
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dairy Can Id'
,p_source=>'PAR_DAIRY_CAN_ID'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924998857944910)
,p_name=>'P3413102002_PAR_DAIRY_COC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1200
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dairy Coc Id'
,p_source=>'PAR_DAIRY_COC_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698925044939944911)
,p_name=>'P3413102002_PAR_DAIRY_ROUTE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1210
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dairy Route Id'
,p_source=>'PAR_DAIRY_ROUTE_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924245154944903)
,p_name=>'P3413102002_PAR_DEV_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dev Amt'
,p_source=>'PAR_DEV_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923980548944900)
,p_name=>'P3413102002_PAR_DEV_EXISTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dev Exists'
,p_source=>'PAR_DEV_EXISTS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924190409944902)
,p_name=>'P3413102002_PAR_DEV_SI_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dev Si Doc No'
,p_source=>'PAR_DEV_SI_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924097163944901)
,p_name=>'P3413102002_PAR_DEV_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dev Status'
,p_source=>'PAR_DEV_STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917994005944890)
,p_name=>'P3413102002_PAR_DFLT_PAY_THRU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dflt Pay Thru'
,p_source=>'PAR_DFLT_PAY_THRU'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923418673944894)
,p_name=>'P3413102002_PAR_DIV_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Div Id'
,p_source=>'PAR_DIV_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>0
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496278800204204)
,p_name=>'P3413102002_PAR_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Date'
,p_source=>'PAR_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11696496369902204205)
,p_name=>'P3413102002_PAR_DOC_MODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Mode'
,p_source=>'PAR_DOC_MODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496439398204206)
,p_name=>'P3413102002_PAR_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc No'
,p_source=>'PAR_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496623033204207)
,p_name=>'P3413102002_PAR_DOC_PERIOD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Period'
,p_source=>'PAR_DOC_PERIOD'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921553023944876)
,p_name=>'P3413102002_PAR_DOC_SEL_MODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Sel Mode'
,p_source=>'PAR_DOC_SEL_MODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496670168204208)
,p_name=>'P3413102002_PAR_DOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Type'
,p_source=>'PAR_DOC_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496759226204209)
,p_name=>'P3413102002_PAR_DOC_YEAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Doc Year'
,p_source=>'PAR_DOC_YEAR'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696496917801204210)
,p_name=>'P3413102002_PAR_DR_CR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Dr Cr'
,p_source=>'PAR_DR_CR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921205971944872)
,p_name=>'P3413102002_PAR_DUE_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Due Status'
,p_source=>'PAR_DUE_STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11696497010429204211)
,p_name=>'P3413102002_PAR_EXCHANGE_RATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Exchange Rate'
,p_source=>'PAR_EXCHANGE_RATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923802755944898)
,p_name=>'P3413102002_PAR_GRN_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Grn Reference'
,p_source=>'PAR_GRN_REFERENCE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698921644597944877)
,p_name=>'P3413102002_PAR_HOLD_PARTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Hold Party'
,p_source=>'PAR_HOLD_PARTY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921017503944870)
,p_name=>'P3413102002_PAR_HOLD_PAY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Hold Pay'
,p_source=>'PAR_HOLD_PAY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915229636944863)
,p_name=>'P3413102002_PAR_INPROG_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Inprog Amt'
,p_source=>'PAR_INPROG_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915378192944864)
,p_name=>'P3413102002_PAR_JRNL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Jrnl Flag'
,p_source=>'PAR_JRNL_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921896077944879)
,p_name=>'P3413102002_PAR_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Loc Id'
,p_source=>'PAR_LOC_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915461723944865)
,p_name=>'P3413102002_PAR_ORD_PLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Ord Plant'
,p_source=>'PAR_ORD_PLANT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922203581944882)
,p_name=>'P3413102002_PAR_PARENT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Parent Id'
,p_source=>'PAR_PARENT_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921932488944880)
,p_name=>'P3413102002_PAR_PAY_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pay By'
,p_source=>'PAR_PAY_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922040631944881)
,p_name=>'P3413102002_PAR_PAY_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pay Cust Id'
,p_source=>'PAR_PAY_CUST_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915547601944866)
,p_name=>'P3413102002_PAR_PAY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pay Type'
,p_source=>'PAR_PAY_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915651890944867)
,p_name=>'P3413102002_PAR_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pfx'
,p_source=>'PAR_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915823407944868)
,p_name=>'P3413102002_PAR_PLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Plant'
,p_source=>'PAR_PLANT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915842995944869)
,p_name=>'P3413102002_PAR_PROJ_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Proj Id'
,p_source=>'PAR_PROJ_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924411348944904)
,p_name=>'P3413102002_PAR_PUR_RET_CRE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pur Ret Cre Flag'
,p_source=>'PAR_PUR_RET_CRE_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924448664944905)
,p_name=>'P3413102002_PAR_PUR_RET_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1150
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pur Ret Doc No'
,p_source=>'PAR_PUR_RET_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924762507944908)
,p_name=>'P3413102002_PAR_PUR_RET_INV_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1180
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pur Ret Inv No'
,p_source=>'PAR_PUR_RET_INV_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924640678944907)
,p_name=>'P3413102002_PAR_PUR_RET_INV_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1170
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pur Ret Inv Pfx'
,p_source=>'PAR_PUR_RET_INV_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924610728944906)
,p_name=>'P3413102002_PAR_PUR_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1160
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pur Status'
,p_source=>'PAR_PUR_STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921337901944874)
,p_name=>'P3413102002_PAR_PYMT_EXCP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Pymt Excp'
,p_source=>'PAR_PYMT_EXCP'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698922251703944883)
,p_name=>'P3413102002_PAR_REF_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Ref Bu'
,p_source=>'PAR_REF_BU'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>0
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922481360944885)
,p_name=>'P3413102002_PAR_REF_INV_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Ref Inv No'
,p_source=>'PAR_REF_INV_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>0
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922371098944884)
,p_name=>'P3413102002_PAR_REF_INV_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Ref Inv Pfx'
,p_source=>'PAR_REF_INV_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>0
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922597493944886)
,p_name=>'P3413102002_PAR_REF_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Ref Plnt'
,p_source=>'PAR_REF_PLNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>0
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698924855454944909)
,p_name=>'P3413102002_PAR_REJ_VAL_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>1190
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Rej Val Amt'
,p_source=>'PAR_REJ_VAL_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915937296944870)
,p_name=>'P3413102002_PAR_RTN_REASON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Rtn Reason'
,p_source=>'PAR_RTN_REASON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922792124944888)
,p_name=>'P3413102002_PAR_SALES_PERSON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sales Person'
,p_source=>'PAR_SALES_PERSON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923117471944891)
,p_name=>'P3413102002_PAR_SALES_TERR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sales Terr'
,p_source=>'PAR_SALES_TERR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916075424944871)
,p_name=>'P3413102002_PAR_SC_BAL_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sc Bal Amt'
,p_source=>'PAR_SC_BAL_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916143895944872)
,p_name=>'P3413102002_PAR_SC_MAT_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sc Mat Amt'
,p_source=>'PAR_SC_MAT_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916282509944873)
,p_name=>'P3413102002_PAR_SC_PROC_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sc Proc Amt'
,p_source=>'PAR_SC_PROC_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916366904944874)
,p_name=>'P3413102002_PAR_SC_TOT_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sc Tot Amt'
,p_source=>'PAR_SC_TOT_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921524525944875)
,p_name=>'P3413102002_PAR_SO_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par So Ref'
,p_source=>'PAR_SO_REF'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
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
 p_id=>wwv_flow_imp.id(11698916480578944875)
,p_name=>'P3413102002_PAR_SRC_ACCT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Acct Type'
,p_source=>'PAR_SRC_ACCT_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916564734944876)
,p_name=>'P3413102002_PAR_SRC_DOC_MODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Doc Mode'
,p_source=>'PAR_SRC_DOC_MODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916632566944877)
,p_name=>'P3413102002_PAR_SRC_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Doc No'
,p_source=>'PAR_SRC_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916733731944878)
,p_name=>'P3413102002_PAR_SRC_DOC_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Doc Pfx'
,p_source=>'PAR_SRC_DOC_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916860109944879)
,p_name=>'P3413102002_PAR_SRC_DOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Doc Type'
,p_source=>'PAR_SRC_DOC_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698916939571944880)
,p_name=>'P3413102002_PAR_SRC_OFFSET_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Src Offset Doc No'
,p_source=>'PAR_SRC_OFFSET_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917124228944881)
,p_name=>'P3413102002_PAR_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Status'
,p_source=>'PAR_STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923655092944897)
,p_name=>'P3413102002_PAR_STR_MNGR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Str Mngr Id'
,p_source=>'PAR_STR_MNGR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923325549944893)
,p_name=>'P3413102002_PAR_SUB_DIV_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sub Div Id'
,p_source=>'PAR_SUB_DIV_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923187810944892)
,p_name=>'P3413102002_PAR_SUB_TERR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sub Terr'
,p_source=>'PAR_SUB_TERR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917205522944882)
,p_name=>'P3413102002_PAR_SUPLR_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Suplr Doc Date'
,p_source=>'PAR_SUPLR_DOC_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698917303130944883)
,p_name=>'P3413102002_PAR_SUPLR_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Suplr Doc No'
,p_source=>'PAR_SUPLR_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>40
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917413848944884)
,p_name=>'P3413102002_PAR_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Suplr Id'
,p_source=>'PAR_SUPLR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921262803944873)
,p_name=>'P3413102002_PAR_SUPLR_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Suplr Name'
,p_source=>'PAR_SUPLR_NAME'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(11698917437048944885)
,p_name=>'P3413102002_PAR_SUPLR_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Suplr Reference'
,p_source=>'PAR_SUPLR_REFERENCE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
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
 p_id=>wwv_flow_imp.id(11698917540085944886)
,p_name=>'P3413102002_PAR_SYS_DOC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Sys Doc'
,p_source=>'PAR_SYS_DOC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698922855323944889)
,p_name=>'P3413102002_PAR_TAX_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Tax Amt'
,p_source=>'PAR_TAX_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698915138449944862)
,p_name=>'P3413102002_PAR_TERM_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Term Id'
,p_source=>'PAR_TERM_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923577203944896)
,p_name=>'P3413102002_PAR_TR_MNGR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Tr Mngr Id'
,p_source=>'PAR_TR_MNGR_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920820364944868)
,p_name=>'P3413102002_PAR_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Type'
,p_source=>'PAR_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917661075944887)
,p_name=>'P3413102002_PAR_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Upd By'
,p_source=>'PAR_UPD_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698917756711944888)
,p_name=>'P3413102002_PAR_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Upd Date'
,p_source=>'PAR_UPD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698917868204944889)
,p_name=>'P3413102002_PAR_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par User'
,p_source=>'PAR_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920834833944869)
,p_name=>'P3413102002_PAR_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Par Vou Type'
,p_source=>'PAR_VOU_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918160997944892)
,p_name=>'P3413102002_PDD_BAL_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Bal Amt'
,p_source=>'PDD_BAL_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918056386944891)
,p_name=>'P3413102002_PDD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Bu'
,p_source=>'PDD_BU'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918309500944893)
,p_name=>'P3413102002_PDD_CHECK_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Check Flag'
,p_source=>'PDD_CHECK_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920710584944867)
,p_name=>'P3413102002_PDD_CLAIM_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Claim Type'
,p_source=>'PDD_CLAIM_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918372951944894)
,p_name=>'P3413102002_PDD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Cre By'
,p_source=>'PDD_CRE_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918494753944895)
,p_name=>'P3413102002_PDD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Cre Date'
,p_source=>'PDD_CRE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698918609927944896)
,p_name=>'P3413102002_PDD_DATE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Date Type'
,p_source=>'PDD_DATE_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918650573944897)
,p_name=>'P3413102002_PDD_DISC_PCT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Disc Pct'
,p_source=>'PDD_DISC_PCT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918779406944898)
,p_name=>'P3413102002_PDD_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Doc No'
,p_source=>'PDD_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698918829894944899)
,p_name=>'P3413102002_PDD_DUE_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Due Amt'
,p_source=>'PDD_DUE_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919013468944900)
,p_name=>'P3413102002_PDD_DUE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Due Date'
,p_source=>'PDD_DUE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698919093742944901)
,p_name=>'P3413102002_PDD_DUE_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Due Days'
,p_source=>'PDD_DUE_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919197902944902)
,p_name=>'P3413102002_PDD_DUE_PCT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Due Pct'
,p_source=>'PDD_DUE_PCT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919246249944903)
,p_name=>'P3413102002_PDD_DUE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Due Type'
,p_source=>'PDD_DUE_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919445102944905)
,p_name=>'P3413102002_PDD_INT_PCT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Int Pct'
,p_source=>'PDD_INT_PCT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919403014944904)
,p_name=>'P3413102002_PDD_IN_PROGRESS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd In Progress'
,p_source=>'PDD_IN_PROGRESS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919563375944906)
,p_name=>'P3413102002_PDD_MS_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Ms Date'
,p_source=>'PDD_MS_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698919714084944907)
,p_name=>'P3413102002_PDD_MS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Ms Id'
,p_source=>'PDD_MS_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919757625944908)
,p_name=>'P3413102002_PDD_PART_PAY_DISC_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Part Pay Disc Flag'
,p_source=>'PDD_PART_PAY_DISC_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919896157944909)
,p_name=>'P3413102002_PDD_PAY_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Pay Amt'
,p_source=>'PDD_PAY_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698919968763944910)
,p_name=>'P3413102002_PDD_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Pfx'
,p_source=>'PDD_PFX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920100657944911)
,p_name=>'P3413102002_PDD_PLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Plant'
,p_source=>'PDD_PLANT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920210980944862)
,p_name=>'P3413102002_PDD_RESP_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Resp Emp Id'
,p_source=>'PDD_RESP_EMP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920272395944863)
,p_name=>'P3413102002_PDD_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Seq No'
,p_source=>'PDD_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698921741022944878)
,p_name=>'P3413102002_PDD_TEMP_PAY_AMT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Temp Pay Amt'
,p_source=>'PDD_TEMP_PAY_AMT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920395574944864)
,p_name=>'P3413102002_PDD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Upd By'
,p_source=>'PDD_UPD_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698920493473944865)
,p_name=>'P3413102002_PDD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd Upd Date'
,p_source=>'PDD_UPD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(11698920628628944866)
,p_name=>'P3413102002_PDD_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Pdd User'
,p_source=>'PDD_USER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11698923891479944899)
,p_name=>'P3413102002_SUPLR_MSME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_item_source_plug_id=>wwv_flow_imp.id(11696494768523204189)
,p_prompt=>'Suplr Msme Type'
,p_source=>'SUPLR_MSME_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11696494848057204190)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11696494768523204189)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form View Details - Pend. Receivables'
,p_static_id=>'initialize-form-view-details-pend-receivables'
,p_internal_uid=>6214533012513593162
);
wwv_flow_imp.component_end;
end;
/
