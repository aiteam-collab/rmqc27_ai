prompt --application/pages/page_21113001501
begin
--   Manifest
--     PAGE: 21113001501
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
 p_id=>21113001501
,p_name=>'Create Appl. Users (Admin)'
,p_alias=>'CREATE-APPL-USERS-ADMIN'
,p_step_title=>'Sign Up - Be Part of Your Roadmap'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Dialog-body {',
'    padding: 13px;',
'}',
'',
'img {',
'    height: 210px;',
'    width: 275px;',
'    margin-left: 12px;',
'}',
'',
'img {',
'    height: 174px;',
'    width: 170px;',
'    margin-left: 67px;',
'    border-radius: 124px;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10658525079184976190)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-Form--noPadding:margin-top-none:margin-bottom-none'
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
 p_id=>wwv_flow_imp.id(10658479154047976123)
,p_plug_name=>'Create Appl. Users (Admin)'
,p_static_id=>'create-appl-users-admin'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'APPL_USERS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10650954637660046985)
,p_plug_name=>'Image'
,p_static_id=>'image'
,p_region_template_options=>'#DEFAULT#:t-Region--accent6:t-Region--scrollBody:t-Form--noPadding:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10658525447245976190)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10658525079184976190)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10658527778006976193)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10658525079184976190)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Activate'
,p_button_position=>'NEXT'
,p_button_condition=>'P21113001501_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10658527009264976192)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10658525079184976190)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P21113001501_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10658527343275976192)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(10658525079184976190)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P21113001501_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658482829098976131)
,p_name=>'P21113001501_APPLUSER_ACTIVE_D'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_ACTIVE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658497575159976156)
,p_name=>'P21113001501_APPLUSER_APPR_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_APPR_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658479936918976125)
,p_name=>'P21113001501_APPLUSER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658490385627976143)
,p_name=>'P21113001501_APPLUSER_CONFG_CO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CONFG_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658493171965976148)
,p_name=>'P21113001501_APPLUSER_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658494428723976151)
,p_name=>'P21113001501_APPLUSER_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658496741314976154)
,p_name=>'P21113001501_APPLUSER_CRE_EMP_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658493597946976150)
,p_name=>'P21113001501_APPLUSER_CRE_IP_A'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658493978277976150)
,p_name=>'P21113001501_APPLUSER_CRE_OS_U'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658497983782976157)
,p_name=>'P21113001501_APPLUSER_CSD_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_CSD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658492812291976148)
,p_name=>'P21113001501_APPLUSER_CURR_LOG'
,p_source_data_type=>'DATE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658484378301976132)
,p_name=>'P21113001501_APPLUSER_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_CUST_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658498421825976157)
,p_name=>'P21113001501_APPLUSER_CUST_POR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_CUST_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658498794089976159)
,p_name=>'P21113001501_APPLUSER_DASHBOAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_DASHBOARD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658483172849976131)
,p_name=>'P21113001501_APPLUSER_DELETE_D'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_DELETE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658689152128449470)
,p_name=>'P21113001501_APPLUSER_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Department'
,p_source=>'APPLUSER_DEPT_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dept_name1,dept_id',
'  FROM departments',
' WHERE dept_bu = :GLOBAL_bu'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658503144809976165)
,p_name=>'P21113001501_APPLUSER_DEVICE_U'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_DEVICE_UUID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658481202109976128)
,p_name=>'P21113001501_APPLUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10650954637660046985)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'dd.mm.yyyy'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(10658481616627976128)
,p_name=>'P21113001501_APPLUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10650954637660046985)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'SYSDATE + 30'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. To'
,p_format_mask=>'dd.mm.yyyy'
,p_source=>'APPLUSER_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(10658503626155976167)
,p_name=>'P21113001501_APPLUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Email'
,p_source=>'APPLUSER_EMAIL_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(10658481987039976129)
,p_name=>'P21113001501_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658490758420976145)
,p_name=>'P21113001501_APPLUSER_ENTRY_CO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_ENTRY_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658499207430976159)
,p_name=>'P21113001501_APPLUSER_ERP_ADMI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_ERP_ADMIN_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658499587413976159)
,p_name=>'P21113001501_APPLUSER_ERP_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_ERP_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658499936529976161)
,p_name=>'P21113001501_APPLUSER_ESS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_ESS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658485136882976134)
,p_name=>'P21113001501_APPLUSER_EXCEL_OP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'Y'
,p_source=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658500352565976161)
,p_name=>'P21113001501_APPLUSER_HRMS_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_HRMS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658480354786976126)
,p_name=>'P21113001501_APPLUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Username'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(10658689103128449469)
,p_name=>'P21113001501_APPLUSER_IMAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10650954637660046985)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT auimg_image,',
    '       auimg_user_id,',
    '       auimg_file_name,',
    '       auimg_mime_type',
    '  FROM appl_user_images',
    ' WHERE auimg_user_id =:P21113001501_USER',
    'UNION ALL',
    ' SELECT file_content,',
    '        ''Upload Image''application_name,',
    '        file_name,',
    '        mime_type',
    '   FROM  APEX_APPLICATION_STATIC_FILES',
    '  WHERE workspace=:global_space AND application_id=:app_id AND file_name=''clock.png''',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658488010472976139)
,p_name=>'P21113001501_APPLUSER_LABEL_CT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_LABEL_CTRL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658488373238976140)
,p_name=>'P21113001501_APPLUSER_LABEL_LA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_LABEL_LANG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658483553047976132)
,p_name=>'P21113001501_APPLUSER_LOCK_CHK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_LOCK_CHK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658489998244976143)
,p_name=>'P21113001501_APPLUSER_MIS_DEPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658500797617976162)
,p_name=>'P21113001501_APPLUSER_MKTG_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_MKTG_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658496344867976154)
,p_name=>'P21113001501_APPLUSER_MOBILE_U'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_MOBILE_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658488742836976140)
,p_name=>'P21113001501_APPLUSER_MOB_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_MOB_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658492005039976146)
,p_name=>'P21113001501_APPLUSER_OTHERS_C'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_OTHERS_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658489173312976142)
,p_name=>'P21113001501_APPLUSER_OTP'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_OTP'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658489536413976142)
,p_name=>'P21113001501_APPLUSER_OTP_EXPI'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_OTP_EXPIRE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658504803638976168)
,p_name=>'P21113001501_APPLUSER_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'User'
,p_source=>'APPLUSER_PARTY_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,',
'       emp_emp_id r',
'  FROM employees,',
'       emp_active_infos',
' WHERE emp_bu     = empai_bu',
'   AND emp_emp_id = empai_emp_id',
'   AND emp_bu     = :GLOBAL_bu',
'   AND emp_status = ''A''',
'      AND NOT EXISTS (SELECT *',
'                     FROM appl_users',
'                    WHERE appluser_bu = :GLOBAL_bu',
'                      AND appluser_id <> :APPLUSER_ID',
'                      AND appluser_emp_id = emp_emp_id',
'                      AND appluser_status NOT IN (''D'')) ',
' ORDER BY emp_name'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658504414325976168)
,p_name=>'P21113001501_APPLUSER_PARTY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'E'
,p_prompt=>'User Type'
,p_source=>'APPLUSER_PARTY_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ERP Admin;R,ERP User;E,ESS User;S,POS User;P,Customer;C,Supplier;S'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658480814160976126)
,p_name=>'P21113001501_APPLUSER_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Password'
,p_source=>'APPLUSER_PASSWORD'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658505214113976170)
,p_name=>'P21113001501_APPLUSER_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Position'
,p_source=>'APPLUSER_POS_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT hrpos_pos_name1,hrpos_pos_id',
'  FROM hr_positions',
' WHERE hrpos_bu     = :GLOBAL_bu',
' ORDER BY hrpos_pos_name1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658492413967976146)
,p_name=>'P21113001501_APPLUSER_PREV_LOG'
,p_source_data_type=>'DATE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658501183937976162)
,p_name=>'P21113001501_APPLUSER_PROD_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_PROD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658486335880976137)
,p_name=>'P21113001501_APPLUSER_PWD_EXP_'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_PWD_EXP_DUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658487158462976139)
,p_name=>'P21113001501_APPLUSER_PW_EXP_D'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_PW_EXP_DAYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658486808896976137)
,p_name=>'P21113001501_APPLUSER_PW_EXP_R'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_PW_EXP_RQRD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658485542452976136)
,p_name=>'P21113001501_APPLUSER_PW_LUD'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_PW_LUD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658491208795976145)
,p_name=>'P21113001501_APPLUSER_QUERY_CO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_QUERY_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658491548020976146)
,p_name=>'P21113001501_APPLUSER_REPORT_C'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_REPORT_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658487599178976139)
,p_name=>'P21113001501_APPLUSER_SEARCH_L'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_SEARCH_LOV'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658501602704976164)
,p_name=>'P21113001501_APPLUSER_SMW_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_SMW_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658482336131976129)
,p_name=>'P21113001501_APPLUSER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'A'
,p_source=>'APPLUSER_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658502000846976164)
,p_name=>'P21113001501_APPLUSER_SUBCONTR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658484797816976134)
,p_name=>'P21113001501_APPLUSER_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_SUPLR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658502386324976164)
,p_name=>'P21113001501_APPLUSER_SUPLR_PO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_SUPLR_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658485974977976136)
,p_name=>'P21113001501_APPLUSER_SYS_ADMI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_SYS_ADMIN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658502747549976165)
,p_name=>'P21113001501_APPLUSER_SYS_ADMI_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'N'
,p_source=>'APPLUSER_SYS_ADMIN_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658494813744976151)
,p_name=>'P21113001501_APPLUSER_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658496021614976153)
,p_name=>'P21113001501_APPLUSER_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658497228098976156)
,p_name=>'P21113001501_APPLUSER_UPD_EMP_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658495192511976153)
,p_name=>'P21113001501_APPLUSER_UPD_IP_A'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658495565156976153)
,p_name=>'P21113001501_APPLUSER_UPD_OS_U'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'APPLUSER_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658483934522976132)
,p_name=>'P21113001501_APPLUSER_USER_TYP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_default=>'E'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658504021426976167)
,p_name=>'P21113001501_APPUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_prompt=>'Mobile Number'
,p_source=>'APPLUSER_MOBILE_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658689021953449468)
,p_name=>'P21113001501_IMAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10650954637660046985)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658479619959976125)
,p_name=>'P21113001501_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_item_source_plug_id=>wwv_flow_imp.id(10658479154047976123)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10658689366190449472)
,p_name=>'P21113001501_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10650954637660046985)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(10658690701295449485)
,p_validation_name=>'Eff_from'
,p_static_id=>'eff-from'
,p_validation_sequence=>40
,p_validation=>'P21113001501_APPLUSER_EFF_FROM'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Effective from must be enter.'
,p_associated_item=>wwv_flow_imp.id(10658481202109976128)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(10658690810715449486)
,p_validation_name=>'Eff_To'
,p_static_id=>'eff-to'
,p_validation_sequence=>50
,p_validation=>'P21113001501_APPLUSER_EFF_TO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Effective to must be enter.'
,p_associated_item=>wwv_flow_imp.id(10658481616627976128)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(10658690965766449488)
,p_validation_name=>'Employee'
,p_static_id=>'employee'
,p_validation_sequence=>30
,p_validation=>'P21113001501_APPLUSER_PARTY_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Employee must be enter.'
,p_associated_item=>wwv_flow_imp.id(10658504803638976168)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(10658690862938449487)
,p_validation_name=>'Password'
,p_static_id=>'password'
,p_validation_sequence=>20
,p_validation=>'P21113001501_APPLUSER_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Password must be enter.'
,p_associated_item=>wwv_flow_imp.id(10658480814160976126)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(10658690603263449484)
,p_validation_name=>'Username'
,p_static_id=>'username'
,p_validation_sequence=>10
,p_validation=>'P21113001501_APPLUSER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Username must be enter.'
,p_associated_item=>wwv_flow_imp.id(10658480354786976126)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10658525589423976190)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(10658525447245976190)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10658526284377976192)
,p_event_id=>wwv_flow_imp.id(10658525589423976190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10658691032102449489)
,p_name=>'Password'
,p_static_id=>'password'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001501_APPLUSER_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10658691217021449490)
,p_event_id=>wwv_flow_imp.id(10658691032102449489)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P21113001501_APPLUSER_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001501_APPLUSER_PASSWORD IS NOT NULL THEN',
    '    ',
    '   DECLARE',
    '        v_ascii_val                                    NUMBER(5); p_pwd_exp_days                            NUMBER(5);',
    '        v_rules                                            VARCHAR2(100);v_upc                                                VARCHAR2(100); v_lc                                                VARCHAR2(100);',
    '        v_num                                                VARCHAR2(100);v_spc                                                VARCHAR2(100);',
    '   BEGIN',
    '       proc_check_pass_complex (:P21113001501_APPLUSER_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);    ',
    '       IF v_rules = ''N'' THEN',
    '       Raise_application_error(-20999,''Pasword must contain 1 Uppercase 1 Lowecase 1 Number'');           ',
    '       END IF;',
    '',
    'DECLARE',
    '',
    '   CURSOR c1',
    '       IS',
    '   SELECT COUNT(*) v_user_cnt ',
    '     FROM appl_users',
    '    WHERE appluser_bu = :global_bu',
    '      AND appluser_id NOT IN (''ERPADMIN'', ''SYSADMIN'')',
    '      AND appluser_status NOT IN (''D'');',
    '      ',
    '      cr1                                                            c1%ROWTYPE;',
    '      ',
    '      v_named_user                                        NUMBER(5)   := 200;          ',
    '      v_user_min_len                                  NUMBER(5)   := 3;               ',
    '      v_user_max_len                                  NUMBER(5)   := 15;          ',
    '      v_user_an_allow                                  VARCHAR2(2) := ''AN'';    ',
    '      v_user_an_res                                      VARCHAR2(1) := ''N'';        ',
    '      v_pwd_min_len                                    NUMBER(5)   := 3;               ',
    '      v_pwd_max_len                                    NUMBER(5)   := 15;          ',
    '      v_pwd_an_allow                                  VARCHAR2(2) := ''AN'';      ',
    '      v_pwd_an_res                                      VARCHAR2(1) := ''N''; ',
    '      v_pwd_exp_flag                                    VARCHAR2(1) := ''Y'';            ',
    '      v_pwd_exp_days                                    NUMBER(5)   := 30;           ',
    '      ',
    'BEGIN',
    '    ',
    '     OPEN c1;',
    '     FETCH c1 INTO cr1;        ',
    '        IF cr1.v_user_cnt > v_named_user THEN',
    '             Raise_Application_Error(-20999,''No. of Users exceeded than the Limit.'');',
    '        END IF; CLOSE c1;',
    '   ',
    '   IF :P21113001501_APPLUSER_PASSWORD IS NOT NULL THEN',
    '         ',
    '         IF LENGTH(:P21113001501_APPLUSER_PASSWORD) NOT BETWEEN v_pwd_min_len AND v_pwd_max_len THEN',
    '              :P21113001501_APPLUSER_PASSWORD:=NULL;',
    '              Raise_Application_Error(-20999,''You must provide 3 to 15 characters for Password.'');',
    '         END IF;',
    '',
    '         IF v_pwd_an_allow = ''AA'' THEN',
    '              ',
    '              proc_user_cre_isalpha(UPPER(:P21113001501_APPLUSER_PASSWORD),v_pwd_an_res);',
    '                                                                  ',
    '           IF v_pwd_an_res = ''Y'' THEN',
    '                :P21113001501_APPLUSER_PASSWORD:=NULL;',
    '                 Raise_Application_Error(-20999,''Special characters and numbers not allowed.'');',
    '           END IF;              ',
    '         END IF;         ',
    '         IF v_pwd_an_allow = ''AN'' THEN              ',
    '              proc_user_cre_isalphanumeric(UPPER(:P21113001501_APPLUSER_PASSWORD), v_pwd_an_res);                                                                  ',
    '           IF v_pwd_an_res = ''Y'' THEN',
    '                :P21113001501_APPLUSER_PASSWORD:=NULL;',
    '                Raise_Application_Error (-20999,''Special characters not allowed.'');',
    '           END IF;             ',
    '         END IF;         ',
    '         IF v_pwd_exp_flag = ''Y'' THEN  p_pwd_exp_days := v_pwd_exp_days; ELSE  p_pwd_exp_days := 0;  END IF;',
    '         ',
    '   END IF;END;END;   ',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10658691263735449491)
,p_name=>'UserName'
,p_static_id=>'username'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001501_APPLUSER_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10658691347469449492)
,p_event_id=>wwv_flow_imp.id(10658691263735449491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001501_APPLUSER_ID',
  'items_to_submit', 'P21113001501_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001501_APPLUSER_ID IS NOT NULL THEN',
    '	 ',
    '	 DECLARE	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_id = :P21113001501_APPLUSER_ID;',
    '	 	  ',
    '	 	  cr1	 c1%ROWTYPE;',
    '	 	  v_ascii_val	 NUMBER(5);',
    '	 	  v_pwd_exp_days	 NUMBER(5);',
    '	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;	 	     ',
    '	 	     IF c1%FOUND THEN',
    '	 	     	  Raise_Application_Error(-20999,''Username already exists.'');',
    '	 	     ELSE	 	     	',
    'DECLARE',
    '   CURSOR c1',
    '       IS',
    '   SELECT COUNT(*) v_user_cnt ',
    '     FROM appl_users',
    '    WHERE appluser_bu = :global_bu',
    '      AND appluser_id NOT IN (''ERPADMIN'', ''SYSADMIN'')',
    '      AND appluser_status NOT IN (''D'');',
    '      ',
    '      cr1                                                            c1%ROWTYPE;',
    '      ',
    '      v_named_user                                        NUMBER(5)   := 200;            --Limit to created named users',
    '      v_user_min_len                                  NUMBER(5)   := 3;                --User minimum Length',
    '      v_user_max_len                                  NUMBER(5)   := 15;            --User minimum Length',
    '      v_user_an_allow                                  VARCHAR2(2) := ''AN'';      --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
    '      v_user_an_res                                      VARCHAR2(1) := ''N'';        --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
    '      ',
    '      v_pwd_min_len                                    NUMBER(5)   := 3;                --Password minimum Length',
    '      v_pwd_max_len                                    NUMBER(5)   := 15;            --Password minimum Length',
    '      v_pwd_an_allow                                  VARCHAR2(2) := ''AN'';      --Password character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
    '      v_pwd_an_res                                      VARCHAR2(1) := ''N'';        --Password character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
    '      v_pwd_exp_flag                                    VARCHAR2(1) := ''Y'';            --Password Expiry Flag',
    '      v_pwd_exp_days                                    NUMBER(5)   := 30;            --Password Expiry Days',
    '      ',
    'BEGIN',
    '    ',
    '     OPEN c1;',
    '     FETCH c1 INTO cr1;',
    '        ',
    '        IF cr1.v_user_cnt > v_named_user THEN',
    '             Raise_Application_Error(-20999,''No. of Users exceeded than the Limit.'');',
    '        END IF;',
    '        ',
    '     CLOSE c1;',
    '   ',
    '   /* Username Validation constraints */',
    '   ',
    '   IF :P21113001501_APPLUSER_ID IS NOT NULL THEN',
    '         ',
    '         IF LENGTH(:P21113001501_APPLUSER_ID) NOT BETWEEN v_user_min_len AND v_user_max_len THEN',
    '              :P21113001501_APPLUSER_ID:=NULL;',
    '              Raise_Application_Error(-20999,''You must provide 3 to 15 characters for Username.'');',
    '         END IF;',
    '',
    '         IF v_user_an_allow = ''AA'' THEN',
    '              ',
    '              proc_user_cre_isalpha(UPPER(:P21113001501_APPLUSER_ID),',
    '                                                          v_user_an_res);',
    '                                                                  ',
    '           IF v_user_an_res = ''Y'' THEN',
    '                 :P21113001501_APPLUSER_ID:=NULL;',
    '                 Raise_Application_Error(-20999,''Special characters and numbers not allowed.'');',
    '           END IF;',
    '              ',
    '         END IF;',
    '         ',
    '         IF v_user_an_allow = ''AN'' THEN',
    '              ',
    '              proc_user_cre_isalphanumeric(UPPER(:P21113001501_APPLUSER_ID),',
    '                                                                  v_user_an_res);',
    '                                                                  ',
    '           IF v_user_an_res = ''Y'' THEN',
    '                :P21113001501_APPLUSER_ID:=NULL;',
    '                 Raise_Application_Error(-20999,''Special characters not allowed.'');',
    '           END IF;',
    '              ',
    '         END IF;',
    '         ',
    '   END IF;',
    '',
    'END;',
    '            						 ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10658528998487976193)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>5176567162944365165
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10658528216685976193)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(10658479154047976123)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Appl. Users (Admin)'
,p_static_id=>'initialize-form-create-appl-users-admin'
,p_internal_uid=>5176566381142365165
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10658528594453976193)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(10658479154047976123)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create Appl. Users (Admin)'
,p_static_id=>'process-form-create-appl-users-admin'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>5176566758910365165
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10658689240084449471)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Upload_Image'
,p_static_id=>'upload-image'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   l_filerow_filename          apex_application_files.filename%TYPE;',
'   l_filerow_mime_type         apex_application_files.mime_type%TYPE;',
'   l_filerow_blob_content      apex_application_files.blob_content%TYPE;',
'BEGIN',
'   ',
'   IF :P21113001501_IMAGE IS NOT NULL THEN',
'   ',
'      SELECT filename, mime_type, blob_content',
'        INTO l_filerow_filename, l_filerow_mime_type, l_filerow_blob_content',
'        FROM APEX_APPLICATION_TEMP_FILES',
'       WHERE name = :P21113001501_IMAGE;',
'   ',
'   END IF;',
'   ',
'  DELETE FROM appl_user_images WHERE auimg_bu=:global_bu AND auimg_user_id=:P21113001501_APPLUSER_ID;',
'   ',
'   INSERT INTO appl_user_images(auimg_bu,auimg_user_id,auimg_image,auimg_file_name,auimg_mime_type,auimg_cre_by,auimg_cre_date,AUIMG_CRE_EMP_ID)',
'          VALUES (:global_bu,:P21113001501_APPLUSER_ID,l_filerow_blob_content,l_filerow_filename,l_filerow_mime_type,:GLOBAL_USER,SYSDATE,''1001'');',
'/*UPDATE appl_user_images',
'   SET auimg_image = l_filerow_blob_content,',
'       auimg_file_name = l_filerow_filename,',
'       auimg_mime_type = l_filerow_mime_type,',
'       auimg_upd_by = :GLOBAL_USER,',
'       auimg_upd_date = SYSDATE',
' WHERE auimg_user_id = :P21113001501_APPLUSER_ID;*/',
'    ',
'   commit;',
'   ',
'END;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>5176727404540838443
);
wwv_flow_imp.component_end;
end;
/
