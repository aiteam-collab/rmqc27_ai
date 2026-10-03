prompt --application/pages/page_00109
begin
--   Manifest
--     PAGE: 00109
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
 p_id=>109
,p_name=>'Project Details'
,p_alias=>'PROJECT-DETAILS'
,p_step_title=>'Project Details'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6278258494060407689)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6278259211253407714)
,p_plug_name=>'Project Details'
,p_static_id=>'project-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMP_PROJ_DLS_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735429947797805)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6319529896652124150)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6278273572332407733)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:0:&APP_SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287736035719797811)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Cancel'
,p_static_id=>'cancel-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6278274923632407734)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P109_ROWID is null and :P109_EPDH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check '
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6278274176492407734)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6278259211253407714)
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
,p_button_condition_type=>'NEVER'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735612523797807)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6319530079245124151)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'First'
,p_static_id=>'first'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'First'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-double-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735288893797804)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Last'
,p_static_id=>'last'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Last'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-double-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735722952797808)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735273032797803)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735946205797810)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6319530084471124152)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Previous'
,p_static_id=>'previous'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6278274521979407734)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P109_ROWID is not null and :P109_EPDH_STATUS = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735551075797806)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6287735806086797809)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(6278258494060407689)
,p_button_name=>'Unload'
,p_static_id=>'unload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unload'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278259585734407716)
,p_name=>'P109_EPDH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278260842808407723)
,p_name=>'P109_EPDH_CLNDR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Calendar'
,p_source=>'EPDH_CLNDR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pc_clndr_id||'' - ''||pc_clndr_name AS CLNDR_NAME,',
'       pc_clndr_id',
'  FROM pyrl_clndr',
' WHERE pc_bu = :GLOBAL_bu',
' AND PC_ACTIVE_FLAG = ''Y''',
' ORDER BY pc_clndr_name'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Calendar',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278263561900407725)
,p_name=>'P109_EPDH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278265181183407727)
,p_name=>'P109_EPDH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278264292372407727)
,p_name=>'P109_EPDH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278263936362407727)
,p_name=>'P109_EPDH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278264709501407727)
,p_name=>'P109_EPDH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278261894406407725)
,p_name=>'P109_EPDH_DATE_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Date From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DATE_FROM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278262333437407725)
,p_name=>'P109_EPDH_DATE_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Date To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DATE_TO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278260436065407722)
,p_name=>'P109_EPDH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'EPDH_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278260005347407720)
,p_name=>'P109_EPDH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Doc.No.'
,p_source=>'EPDH_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278261665763407723)
,p_name=>'P109_EPDH_PERIOD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Period'
,p_source=>'EPDH_PERIOD'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  pcp_long_desc d,',
'            pcp_period r',
'  FROM payroll_cal_period',
' WHERE pcp_bu       = :GLOBAL_bu',
'   AND pcp_clndr_id = :P109_EPDH_CLNDR_ID',
'   AND pcp_year     = :P109_EPDH_YEAR',
'   AND pcp_status   = ''O''',
' ORDER BY pcp_period ASC'))
,p_lov_cascade_parent_items=>'P109_EPDH_CLNDR_ID,P109_EPDH_YEAR'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Period',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278262705292407725)
,p_name=>'P109_EPDH_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Reference'
,p_source=>'EPDH_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278263145822407725)
,p_name=>'P109_EPDH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'EPDH_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Draft;N,Posted;P,Cancelled;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'READONLY=READONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278265519648407727)
,p_name=>'P109_EPDH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278267094521407728)
,p_name=>'P109_EPDH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278266336638407728)
,p_name=>'P109_EPDH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278265948799407727)
,p_name=>'P109_EPDH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278266741163407728)
,p_name=>'P109_EPDH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'EPDH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6278261246812407723)
,p_name=>'P109_EPDH_YEAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_prompt=>'Year'
,p_source=>'EPDH_YEAR'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pcp_year d,',
'       pcp_year r',
'  FROM payroll_cal_period',
' WHERE pcp_bu = :GLOBAL_bu',
'   AND pcp_clndr_id =  :P109_EPDH_CLNDR_ID',
' GROUP BY pcp_year',
' ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P109_EPDH_CLNDR_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Year',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6319528845941124139)
,p_name=>'P109_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_item_source_plug_id=>wwv_flow_imp.id(6278259211253407714)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6319528958420124140)
,p_validation_name=>'Assign_clndr_id'
,p_static_id=>'assign-clndr-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P109_EPDH_CLNDR_ID IS NULL THEN',
'     return(''Calendar must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6278260842808407723)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6319529343912124144)
,p_validation_name=>'Assign_period'
,p_static_id=>'assign-period'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P109_EPDH_PERIOD IS NULL THEN',
'     return(''Period must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6278261665763407723)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6319529053936124141)
,p_validation_name=>'Assign_year'
,p_static_id=>'assign-year'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P109_EPDH_YEAR IS NULL THEN',
'     return(''Year must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6278261246812407723)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6319529630851124147)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P109_EPDH_REF IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6278262705292407725)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6319529168797124142)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P109_EPDH_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6319529265968124143)
,p_event_id=>wwv_flow_imp.id(6319529168797124142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P109_EPDH_PERIOD,P109_EPDH_DATE_FROM,P109_EPDH_DATE_TO',
  'items_to_submit', 'P109_EPDH_CLNDR_ID,P109_EPDH_YEAR',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF  :P109_EPDH_YEAR IS NOT NULL THEN',
    '    ',
    '   DECLARE',
    '         ',
    '      CURSOR c1',
    '          IS',
    '      SELECT pcp_year',
    '        FROM payroll_cal_period',
    '       WHERE pcp_bu       = :GLOBAL_BU',
    '         AND pcp_clndr_id = :P109_EPDH_CLNDR_ID ',
    '         AND pcp_year     = :P109_EPDH_YEAR;',
    '         ',
    '         cr1                c1%ROWTYPE;',
    '         ',
    '   BEGIN',
    ' ',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '           ',
    '         IF c1%FOUND THEN',
    '         	  ',
    '         	  IF :P109_EPDH_YEAR > func_find_pyrl_year(:GLOBAL_bu, SYSDATE) THEN ',
    '                   raise_application_error(-20999,''Year should be less than or equal to Current year.'');',
    '         	  END IF;',
    '               else',
    '                 raise_application_error(-20999,''Year does not exists.'');',
    '         	  ',
    '            :P109_EPDH_PERIOD    := NULL;',
    '            :P109_EPDH_DATE_FROM := NULL;',
    '            :P109_EPDH_DATE_TO   := NULL;',
    '            ',
    '         END IF;',
    '              ',
    '      CLOSE c1;',
    '           ',
    '   END;',
    '         ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6319529413353124145)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P109_EPDH_PERIOD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6319529543125124146)
,p_event_id=>wwv_flow_imp.id(6319529413353124145)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P109_EPDH_DATE_FROM,P109_EPDH_DATE_TO',
  'items_to_submit', 'P109_EPDH_CLNDR_ID,P109_EPDH_YEAR,P109_EPDH_PERIOD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF  :P109_EPDH_PERIOD  IS NOT NULL THEN',
    '    ',
    '   DECLARE',
    '         ',
    '      CURSOR c1',
    '          IS',
    '      SELECT *',
    '        FROM payroll_cal_period',
    '       WHERE pcp_bu       = :GLOBAL_bu',
    '         AND pcp_clndr_id = :P109_EPDH_CLNDR_ID ',
    '         AND pcp_year     = :P109_EPDH_YEAR ',
    '         AND pcp_period   = :P109_EPDH_PERIOD;',
    '         ',
    '         cr1                c1%ROWTYPE;',
    '         ',
    '   BEGIN',
    '           ',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '         IF c1%NOTFOUND THEN',
    '            raise_application_error(-20999,''Period does not exist.'');',
    '         ELSE',
    '',
    '         	  IF :P109_EPDH_YEAR||TO_CHAR(:P109_EPDH_PERIOD, ''00'') > func_find_pyrl_year(:GLOBAL_bu, SYSDATE)||TO_CHAR(func_find_pyrl_period(:GLOBAL_bu, SYSDATE),''00'') THEN ',
    '                   raise_application_error(-20999,''Period should be less than or equal to Current period.'');',
    '         	  END IF; ',
    '',
    '            :P109_EPDH_DATE_FROM  := TO_CHAR(TO_DATE(cr1.pcp_start_date,func_find_date_format(:GLOBAL_BU)),func_find_date_format(:GLOBAL_BU));',
    '            :P109_EPDH_DATE_TO    := TO_CHAR(cr1.pcp_end_date,func_find_date_format(:GLOBAL_BU)); ',
    '',
    '         END IF;',
    '              ',
    '      CLOSE c1;',
    '           ',
    '   END;',
    '         ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6319529827566124149)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_no'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(epdh_doc_no), 1000000000) + 1',
'  INTO :P109_EPDH_DOC_NO',
'  FROM emp_proj_dls_hd',
' WHERE epdh_bu = :GLOBAL_bu;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6278274923632407734)
,p_internal_uid=>840008843781203947
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6278275379956407736)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6278259211253407714)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Project Details'
,p_static_id=>'initialize-form-project-details'
,p_internal_uid=>798754396171487534
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6319529721993124148)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_Insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P109_ROWID IS NULL THEN',
'   :P109_EPDH_BU       := :GLOBAL_BU;',
'   :P109_EPDH_CRE_BY   := :GLOBAL_USER;',
'   :P109_EPDH_CRE_DATE := SYSDATE;',
'ELSE',
'   :P109_EPDH_UPD_BY   := :GLOBAL_USER;',
'   :P109_EPDH_UPD_DATE := SYSDATE;',
'END IF;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>840008738208203946
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6278275729537407736)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6278259211253407714)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Project Details'
,p_static_id=>'process-form-project-details'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>798754745752487534
);
wwv_flow_imp.component_end;
end;
/
