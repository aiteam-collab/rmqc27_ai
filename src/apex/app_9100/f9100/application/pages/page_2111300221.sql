prompt --application/pages/page_2111300221
begin
--   Manifest
--     PAGE: 2111300221
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
 p_id=>2111300221
,p_name=>'User Access'
,p_alias=>'USER-ACCESS'
,p_step_title=>'User Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5619500812798044240)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5619657575685164993)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5619608296652164909)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'APPL_USERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5619657836051164995)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5619657575685164993)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5619660095196164998)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5619500812798044240)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_condition=>'P2111300221_APPLUSER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5619659303243164996)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5619657575685164993)
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
,p_button_condition=>'P2111300221_APPLUSER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5619659700070164998)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5619500812798044240)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>'P2111300221_APPLUSER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619611417485164918)
,p_name=>'P2111300221_APPLUSER_ACTIVE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_ACTIVE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619636191978164956)
,p_name=>'P2111300221_APPLUSER_APEX_LANG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_APEX_LANG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619626168741164940)
,p_name=>'P2111300221_APPLUSER_APPR_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_APPR_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619608984250164910)
,p_name=>'P2111300221_APPLUSER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619619008837164929)
,p_name=>'P2111300221_APPLUSER_CONFG_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CONFG_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619634969380164954)
,p_name=>'P2111300221_APPLUSER_COUNTER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_COUNTER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619621742426164935)
,p_name=>'P2111300221_APPLUSER_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619622992785164937)
,p_name=>'P2111300221_APPLUSER_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619625387478164940)
,p_name=>'P2111300221_APPLUSER_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619622185638164935)
,p_name=>'P2111300221_APPLUSER_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619622552663164935)
,p_name=>'P2111300221_APPLUSER_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619626565234164942)
,p_name=>'P2111300221_APPLUSER_CSD_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CSD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619621363226164934)
,p_name=>'P2111300221_APPLUSER_CURR_LOG_IN_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619612972100164921)
,p_name=>'P2111300221_APPLUSER_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CUST_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619626936853164942)
,p_name=>'P2111300221_APPLUSER_CUST_PORT_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_CUST_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619627366557164943)
,p_name=>'P2111300221_APPLUSER_DASHBOARD_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_DASHBOARD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619611784713164920)
,p_name=>'P2111300221_APPLUSER_DELETE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_DELETE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619634189312164953)
,p_name=>'P2111300221_APPLUSER_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Department'
,p_source=>'APPLUSER_DEPT_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619631800568164949)
,p_name=>'P2111300221_APPLUSER_DEVICE_UUID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_DEVICE_UUID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619609766040164915)
,p_name=>'P2111300221_APPLUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Effective From'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619610222155164917)
,p_name=>'P2111300221_APPLUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Effective To'
,p_source=>'APPLUSER_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619632167502164949)
,p_name=>'P2111300221_APPLUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_EMAIL_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619610600191164917)
,p_name=>'P2111300221_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Employee'
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619619425748164931)
,p_name=>'P2111300221_APPLUSER_ENTRY_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_ENTRY_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619627748081164943)
,p_name=>'P2111300221_APPLUSER_ERP_ADMIN_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_ERP_ADMIN_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619628154939164943)
,p_name=>'P2111300221_APPLUSER_ERP_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_ERP_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619628571662164945)
,p_name=>'P2111300221_APPLUSER_ESS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_ESS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619613735731164921)
,p_name=>'P2111300221_APPLUSER_EXCEL_OPOFF_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619628998734164945)
,p_name=>'P2111300221_APPLUSER_HRMS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_HRMS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619608552487164910)
,p_name=>'P2111300221_APPLUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'User'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619616597303164926)
,p_name=>'P2111300221_APPLUSER_LABEL_CTRL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_LABEL_CTRL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619616949902164926)
,p_name=>'P2111300221_APPLUSER_LABEL_LANG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_LABEL_LANG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619612208674164920)
,p_name=>'P2111300221_APPLUSER_LOCK_CHK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_LOCK_CHK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619635760793164956)
,p_name=>'P2111300221_APPLUSER_MGMT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MGMT_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619618544896164929)
,p_name=>'P2111300221_APPLUSER_MIS_DEPT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619629430101164946)
,p_name=>'P2111300221_APPLUSER_MKTG_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MKTG_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619632594967164949)
,p_name=>'P2111300221_APPLUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MOBILE_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619625027248164938)
,p_name=>'P2111300221_APPLUSER_MOBILE_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MOBILE_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619617389744164928)
,p_name=>'P2111300221_APPLUSER_MOB_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_MOB_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619620630662164932)
,p_name=>'P2111300221_APPLUSER_OTHERS_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_OTHERS_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619617813574164928)
,p_name=>'P2111300221_APPLUSER_OTP'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_OTP'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619618187870164929)
,p_name=>'P2111300221_APPLUSER_OTP_EXPIRE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_OTP_EXPIRE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619633413230164951)
,p_name=>'P2111300221_APPLUSER_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619632959086164951)
,p_name=>'P2111300221_APPLUSER_PARTY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PARTY_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619609360313164915)
,p_name=>'P2111300221_APPLUSER_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PASSWORD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619633807468164951)
,p_name=>'P2111300221_APPLUSER_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Position'
,p_source=>'APPLUSER_POS_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619620961612164934)
,p_name=>'P2111300221_APPLUSER_PREV_LOG_IN_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619629751323164946)
,p_name=>'P2111300221_APPLUSER_PROD_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PROD_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619635360433164954)
,p_name=>'P2111300221_APPLUSER_PWD_EXPIRED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PWD_EXPIRED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619614981587164924)
,p_name=>'P2111300221_APPLUSER_PWD_EXP_DUE'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PWD_EXP_DUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619615746576164924)
,p_name=>'P2111300221_APPLUSER_PW_EXP_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PW_EXP_DAYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619615423951164924)
,p_name=>'P2111300221_APPLUSER_PW_EXP_RQRD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PW_EXP_RQRD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619614159173164923)
,p_name=>'P2111300221_APPLUSER_PW_LUD'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_PW_LUD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619619806954164931)
,p_name=>'P2111300221_APPLUSER_QUERY_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_QUERY_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619620212565164932)
,p_name=>'P2111300221_APPLUSER_REPORT_COLOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_REPORT_COLOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619616142434164926)
,p_name=>'P2111300221_APPLUSER_SEARCH_LOV'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SEARCH_LOV'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619634536837164953)
,p_name=>'P2111300221_APPLUSER_SHOP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SHOP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619630137502164946)
,p_name=>'P2111300221_APPLUSER_SMW_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SMW_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619610971638164917)
,p_name=>'P2111300221_APPLUSER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619630615775164948)
,p_name=>'P2111300221_APPLUSER_SUBCONTR_PORT_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619613372421164921)
,p_name=>'P2111300221_APPLUSER_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SUPLR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619630963772164948)
,p_name=>'P2111300221_APPLUSER_SUPLR_PORT_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SUPLR_PORT_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619614600935164923)
,p_name=>'P2111300221_APPLUSER_SYS_ADMIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SYS_ADMIN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619631362297164948)
,p_name=>'P2111300221_APPLUSER_SYS_ADMIN_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_SYS_ADMIN_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619623412274164937)
,p_name=>'P2111300221_APPLUSER_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619624582664164938)
,p_name=>'P2111300221_APPLUSER_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619625795636164940)
,p_name=>'P2111300221_APPLUSER_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619623756158164937)
,p_name=>'P2111300221_APPLUSER_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619624213036164938)
,p_name=>'P2111300221_APPLUSER_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_source=>'APPLUSER_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619612569951164920)
,p_name=>'P2111300221_APPLUSER_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_item_source_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Appluser User Type'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619500391614044236)
,p_name=>'P2111300221_DEPT_DESC'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Department Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619500458457044237)
,p_name=>'P2111300221_EMP_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5619500259083044235)
,p_name=>'P2111300221_POS_DESC'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(5619608296652164909)
,p_prompt=>'Position Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5619657975796164995)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5619657836051164995)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5619658764670164996)
,p_event_id=>wwv_flow_imp.id(5619657975796164995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5619661288589164999)
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
,p_internal_uid=>137699453045553971
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5619660460592164998)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(5619608296652164909)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Access'
,p_static_id=>'initialize-form-user-access'
,p_internal_uid=>137698625048553970
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5619660861302164999)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5619608296652164909)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Access'
,p_static_id=>'process-form-user-access'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>137699025758553971
);
wwv_flow_imp.component_end;
end;
/
