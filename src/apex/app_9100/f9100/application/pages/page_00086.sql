prompt --application/pages/page_00086
begin
--   Manifest
--     PAGE: 00086
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
 p_id=>86
,p_name=>'Add Bus. Fun.'
,p_alias=>'ADD-BUS-FUN'
,p_page_mode=>'MODAL'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P86_TITAL.");'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#addbtn{',
'        color: blue;',
'        background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#delete',
'{',
'    color: rgb(214, 19, 29);',
'    background-color: rgba(0, 0, 0, 0.15);',
'}'))
,p_step_template=>wwv_flow_imp.id(6470303034115005558)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6592664639818357074)
,p_plug_name=>'Add Bus. Fun.'
,p_static_id=>'add-bus-fun'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WBF_SEQ_NO,',
'       WBF_BUS_FUN_ID,',
'       WBF_PAGE_NO,',
'       WBF_BUS_FUN_NAME,',
'       WBF_BUS_FUN_SHORT_NAME,',
'       WBF_BUS_FUN_TYPE,',
'       WBF_PAR_FUN_ID,',
'       WBF_VISIBLE,',
'       WBF_ICON,',
'       WBF_NODE_TYPE,',
'       WBF_CRE_BY,',
'       WBF_CRE_IP_ADDR,',
'       WBF_CRE_OS_USER,',
'       WBF_CRE_EMP_ID,',
'       WBF_CRE_DATE,',
'       WBF_UPD_BY,',
'       WBF_UPD_IP_ADDR,',
'       WBF_UPD_OS_USER,',
'       WBF_UPD_EMP_ID,',
'       WBF_UPD_DATE,',
'       WBF_SRCH_FLAG,',
'       WBF_ASGN_TO,',
'       WBF_ASGN_DATE,',
'       WBF_ASGN_STATUS,',
'       WBF_APPL_NO,',
'       WBF_STD_VERT_TYPE,',
'       WBF_VERTICAL_ID,',
'       WBF_VERT_BUS_FUN_NAME,',
'       WBF_CLIENT_ID,',
'       WBF_BUS_FUN_NARRATION,',
'       WBF_BUS_FUN_MIS_NAME,',
'       WBF_FORM_LOC1,',
'       WBF_FORM_ICON,',
'       WBF_FORM_ID,',
'       WBF_ACTIVE_FLAG,',
'       wbf_module_id,',
'       WBF_BUS_FUN_ALIAS_NAME,',
'       WBF_SCREEN_COUNT,',
'       WBF_PRINT_SEQ',
'  from WAPL_BUS_FUN'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5628975068206381753)
,p_plug_name=>'Button'
,p_static_id=>'button'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6592691873209357182)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6592692276470357184)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6592691873209357182)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6592695659535357215)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5628975068206381753)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P86_WBF_BUS_FUN_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6592694894696357213)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6592691873209357182)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_bus_fun_accs',
' WHERE wubfa_bus_fun_id = :P86_WBF_BUS_FUN_ID',
'UNION ALL',
'SELECT 1',
'  FROM dual',
' WHERE :P86_ROWID IS NULL',
'UNION ALL ',
'SELECT 1',
'  FROM wapl_bus_fun',
' WHERE wbf_bus_fun_id = :P86_WBF_BUS_FUN_ID',
'   AND wbf_node_type  = ''MOD'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5628975183802381754)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5628975068206381753)
,p_button_name=>'SAVE1'
,p_static_id=>'save'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'save'
,p_button_position=>'NEXT'
,p_button_condition=>'P86_WBF_BUS_FUN_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6592695295075357215)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6592691873209357182)
,p_button_name=>'SAVE'
,p_static_id=>'save-2'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P86_WBF_BUS_FUN_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6937312090766326054)
,p_branch_name=>'Go To Page 11130004'
,p_branch_action=>'f?p=&APP_ID.:11130004:&SESSION.::&DEBUG.::P11130004_SHOW_DATA:&P86_SHOW_DATA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6592694894696357213)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6957920276684016786)
,p_name=>'P86_PAR_BUS_FUN_ALIAS_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Par. Bus. Fun. Alias Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6957920100137016785)
,p_name=>'P86_PAR_BUS_FUN_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Par. Bus. Fun. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6523938824599549869)
,p_name=>'P86_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6652928249807884576)
,p_name=>'P86_SHOW_DATA'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5628975332098381755)
,p_name=>'P86_TITAL'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6599966395818015661)
,p_name=>'P86_WBF_ACTIVE_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'Y'
,p_prompt=>'Active'
,p_source=>'WBF_ACTIVE_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-md:margin-left-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592676392868357146)
,p_name=>'P86_WBF_APPL_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Web Appl #'
,p_source=>'WBF_APPL_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_colspan=>1
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
 p_id=>wwv_flow_imp.id(6592675604645357145)
,p_name=>'P86_WBF_ASGN_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_ASGN_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592676021365357145)
,p_name=>'P86_WBF_ASGN_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'N'
,p_source=>'WBF_ASGN_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592675189326357143)
,p_name=>'P86_WBF_ASGN_TO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_ASGN_TO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6134037088182281731)
,p_name=>'P86_WBF_BUS_FUN_ALIAS_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Bus. Fun. Alias Name'
,p_source=>'WBF_BUS_FUN_ALIAS_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6592664936155357082)
,p_name=>'P86_WBF_BUS_FUN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Bus. Fun. Id'
,p_source=>'WBF_BUS_FUN_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592679051890357153)
,p_name=>'P86_WBF_BUS_FUN_MIS_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_BUS_FUN_MIS_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592667382789357124)
,p_name=>'P86_WBF_BUS_FUN_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Bus. Fun. Name'
,p_source=>'WBF_BUS_FUN_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6592678602702357153)
,p_name=>'P86_WBF_BUS_FUN_NARRATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Reference'
,p_source=>'WBF_BUS_FUN_NARRATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592667775792357124)
,p_name=>'P86_WBF_BUS_FUN_SHORT_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_BUS_FUN_SHORT_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592668234229357126)
,p_name=>'P86_WBF_BUS_FUN_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_BUS_FUN_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592678035332357151)
,p_name=>'P86_WBF_CLIENT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_CLIENT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592670516646357134)
,p_name=>'P86_WBF_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592672085620357137)
,p_name=>'P86_WBF_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WBF_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592671657296357137)
,p_name=>'P86_WBF_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592670888093357135)
,p_name=>'P86_WBF_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592671312786357135)
,p_name=>'P86_WBF_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592679878423357154)
,p_name=>'P86_WBF_FORM_ICON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'forms'
,p_source=>'WBF_FORM_ICON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592680156880357156)
,p_name=>'P86_WBF_FORM_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_FORM_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592679461201357154)
,p_name=>'P86_WBF_FORM_LOC1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_FORM_LOC1'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592669730233357132)
,p_name=>'P86_WBF_ICON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'fa-columns'
,p_prompt=>'Web Icon'
,p_source=>'WBF_ICON'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(6112166563410959131)
,p_name=>'P86_WBF_MODULE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Module'
,p_source=>'WBF_MODULE_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT apbfmn_desc1,',
'       apbfmn_id       ',
'  FROM appl_bus_fun_module_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>3
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592670042262357132)
,p_name=>'P86_WBF_NODE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'FRM'
,p_prompt=>'Type'
,p_source=>'WBF_NODE_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Module;MOD,Setup;SET,Transaction;FRM,Analytics;RPT,Report;REP,Data Management;DMM'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592666963606357124)
,p_name=>'P86_WBF_PAGE_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Web Page No.'
,p_source=>'WBF_PAGE_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6523938904713549870)
,p_name=>'P86_WBF_PAR_FUN_DESC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592668604734357126)
,p_name=>'P86_WBF_PAR_FUN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Par. Bus. Fun.'
,p_source=>'WBF_PAR_FUN_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_ENTRY_PAR_BF'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>10
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the  Par. Bus. Fun.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6951476508201895285)
,p_name=>'P86_WBF_PRINT_SEQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Print Seq.'
,p_source=>'WBF_PRINT_SEQ'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
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
 p_id=>wwv_flow_imp.id(6390643461361765548)
,p_name=>'P86_WBF_SCREEN_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'1'
,p_prompt=>'Sub Report Count'
,p_source=>'WBF_SCREEN_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592665974558357101)
,p_name=>'P86_WBF_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Seq. No.'
,p_source=>'WBF_SEQ_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592674833235357143)
,p_name=>'P86_WBF_SRCH_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'N'
,p_source=>'WBF_SRCH_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592676758096357148)
,p_name=>'P86_WBF_STD_VERT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'S'
,p_prompt=>'Vertical Type'
,p_source=>'WBF_STD_VERT_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Standard ;S,Vertical;V'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592672435916357140)
,p_name=>'P86_WBF_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592674370707357142)
,p_name=>'P86_WBF_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'WBF_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592674021383357142)
,p_name=>'P86_WBF_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592673081399357140)
,p_name=>'P86_WBF_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592673605688357140)
,p_name=>'P86_WBF_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592677206681357149)
,p_name=>'P86_WBF_VERTICAL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_prompt=>'Vertical Desc.'
,p_source=>'WBF_VERTICAL_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_VERTICAL_ID'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P86_WBF_STD_VERT_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Vertical',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592677630649357151)
,p_name=>'P86_WBF_VERT_BUS_FUN_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_source=>'WBF_VERT_BUS_FUN_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6592669011285357126)
,p_name=>'P86_WBF_VISIBLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_source_plug_id=>wwv_flow_imp.id(6592664639818357074)
,p_item_default=>'Y'
,p_prompt=>'Node'
,p_source=>'WBF_VISIBLE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Main;Y,Sub;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6593317921216119432)
,p_validation_name=>'APPL_NO'
,p_static_id=>'appl-no'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_APPL_NO IS NULL AND :P86_WBF_NODE_TYPE <> ''MOD'' THEN',
'	 RETURN(''Application No. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592676392868357146)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6523939379140549875)
,p_validation_name=>'BUS_FUN_ID'
,p_static_id=>'bus-fun-id'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_BUS_FUN_ID IS NULL AND :P86_WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Bus. Fun. must be entered.'');',
'END IF;',
'',
'IF :P86_WBF_BUS_FUN_ID IS NOT NULL  THEN',
'	',
'	DECLARE',
'	   CURSOR c1',
'	       IS',
'	   SELECT *',
'	     FROM wapl_bus_fun',
'	    WHERE wbf_bus_fun_id = :P86_WBF_BUS_FUN_ID',
'         AND (ROWID <> :P86_ROWID OR :P86_ROWID IS NULL);',
'	      ',
'	      cr1				c1%ROWTYPE;',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'			IF c1%FOUND THEN',
'				 return(''Bus. Fun. ID already exists.'');',
'			END IF;',
'		CLOSE c1;',
'	END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592664936155357082)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6593317703924119430)
,p_validation_name=>'BUS_FUN_NAME'
,p_static_id=>'bus-fun-name'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_BUS_FUN_NAME IS NULL THEN',
'	 RETURN(''Description must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592667382789357124)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6593317746328119431)
,p_validation_name=>'BUS_FUN_NARRATION'
,p_static_id=>'bus-fun-narration'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_BUS_FUN_NARRATION IS NULL THEN',
'	 RETURN(''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592678602702357153)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6593317582446119429)
,p_validation_name=>'PAGE_NO'
,p_static_id=>'page-no'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_PAGE_NO IS NULL AND :P86_WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Page No. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592666963606357124)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6523939002795549871)
,p_validation_name=>'PAR_FUN_ID'
,p_static_id=>'par-fun-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_PAR_FUN_ID IS NULL AND :P86_WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
'	 RETURN(''Par. Bus. Fun. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592668604734357126)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6523939249244549874)
,p_validation_name=>'SEQ_NO'
,p_static_id=>'seq-no'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_WBF_SEQ_NO IS NULL THEN',
'	 RETURN(''Seq. No. should not be null.'');',
'END IF;',
'',
'IF :P86_WBF_SEQ_NO < 0 THEN',
'	 RETURN(''Seq. No. should not be negative.'');',
'END IF;',
'',
'IF :P86_WBF_SEQ_NO = 0 THEN',
'	 RETURN(''Seq. No. should be greater than Zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6592665974558357101)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6592692380714357184)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6592692276470357184)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6592694103244357209)
,p_event_id=>wwv_flow_imp.id(6592692380714357184)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6652927753046884571)
,p_name=>'P86_WBF_NODE_TYPE'
,p_static_id=>'p86-wbf-node-type'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_WBF_NODE_TYPE'
,p_condition_element=>'P86_WBF_NODE_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'MOD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6652927921250884572)
,p_event_id=>wwv_flow_imp.id(6652927753046884571)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_WBF_PAGE_NO,P86_WBF_APPL_NO,P86_WBF_FORM_ID,P86_WBF_FORM_LOC1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6652927973935884573)
,p_event_id=>wwv_flow_imp.id(6652927753046884571)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_WBF_PAGE_NO,P86_WBF_APPL_NO,P86_WBF_FORM_ID,P86_WBF_FORM_LOC1,P86_WBF_VISIBLE,P86_WBF_ACTIVE_FLAG'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6652928117955884574)
,p_event_id=>wwv_flow_imp.id(6652927753046884571)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_WBF_VISIBLE,P86_WBF_ACTIVE_FLAG'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6652928192014884575)
,p_event_id=>wwv_flow_imp.id(6652927753046884571)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P86_WBF_VISIBLE,P86_WBF_ACTIVE_FLAG'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523939604047549877)
,p_name=>'PAGE NO'
,p_static_id=>'page-no'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_WBF_BUS_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523939691532549878)
,p_event_id=>wwv_flow_imp.id(6523939604047549877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P86_WBF_PAGE_NO',
  'items_to_submit', 'P86_WBF_BUS_FUN_ID,P86_WBF_NODE_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P86_WBF_BUS_FUN_ID IS NOT NULL AND :P86_WBF_NODE_TYPE IN (''FRM'', ''RPT'', ''SET'') THEN',
    '	 ',
    '	 DECLARE',
    '	 	  v_letter						VARCHAR2(100);',
    '	 	  v_form_no						VARCHAR2(150);',
    '	 BEGIN',
    '      ',
    '      FOR i IN 1..LENGTH(:P86_WBF_BUS_FUN_ID)	  ',
    '      LOOP',
    '      	 ',
    '      	 v_letter := UPPER(SUBSTR(:P86_WBF_BUS_FUN_ID, i, 1));',
    '      	 ',
    '      	 IF ASCII(v_letter) NOT BETWEEN 48 AND 57 THEN',
    '      	 	  v_form_no := v_form_no||TO_CHAR(ASCII(v_letter) - 64);',
    '      	 ELSE',
    '      	 	  v_form_no := v_form_no||v_letter;',
    '      	 END IF;',
    '      	 ',
    '      END LOOP i;',
    '      	 ',
    '      :P86_WBF_PAGE_NO := v_form_no;',
    '	 	  ',
    '	 END;',
    '',
    'ELSE',
    '   :P86_WBF_PAGE_NO := NULL;      	 	',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523939075358549872)
,p_name=>'PAR_FUN_NAME'
,p_static_id=>'par-fun-name'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P86_WBF_PAR_FUN_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523939184135549873)
,p_event_id=>wwv_flow_imp.id(6523939075358549872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P86_WBF_PAR_FUN_DESC,P86_PAR_BUS_FUN_NAME,P86_PAR_BUS_FUN_ALIAS_NAME',
  'items_to_submit', 'P86_WBF_PAR_FUN_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P86_WBF_PAR_FUN_ID IS NOT NULL THEN',
    '',
    '    DECLARE',
    '',
    '        CURSOR c1',
    '            IS',
    '        SELECT wbf_bus_fun_name,wbf_bus_fun_id,wbf_bus_fun_alias_name',
    '          FROM wapl_bus_fun',
    '         WHERE wbf_node_type IN (''MOD'')',
    '           AND wbf_bus_fun_id = :P86_WBF_PAR_FUN_ID;',
    '',
    '        cr1                     c1%ROWTYPE;',
    '',
    '    BEGIN',
    '',
    '        OPEN c1;',
    '        FETCH c1 INTO cr1;',
    '',
    '            IF c1%NOTFOUND THEN',
    '               NULL;',
    '            --    raise_application_error(-20999,''Par. Bus. Fun. not found.'');		 	  	     	  ',
    '            ELSE',
    '               :P86_WBF_PAR_FUN_DESC := cr1.wbf_bus_fun_name;',
    '               :P86_PAR_BUS_FUN_NAME := cr1.wbf_bus_fun_name;',
    '               :P86_PAR_BUS_FUN_ALIAS_NAME := cr1.wbf_bus_fun_alias_name;',
    '            END IF;',
    '',
    '        CLOSE c1;',
    '',
    '    END;',
    '',
    'END IF;',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3767960370520043432)
,p_event_id=>wwv_flow_imp.id(6523939075358549872)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("P86_PAR_BUS_FUN_ALIAS_NAME").refresh();',
    'apex.item("P86_PAR_BUS_FUN_NAME").refresh();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6592696066506357218)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6592664639818357074)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Add Bus. Fun.'
,p_static_id=>'initialize-form-add-bus-fun'
,p_internal_uid=>1110734230962746190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6959604207306946485)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POST QUERY'
,p_static_id=>'post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'IF :P86_WBF_PAR_FUN_ID IS NOT NULL THEN',
'',
'    DECLARE',
'',
'        CURSOR c1',
'            IS',
'        SELECT wbf_bus_fun_name,wbf_bus_fun_id,wbf_bus_fun_alias_name',
'          FROM wapl_bus_fun',
'         WHERE wbf_node_type IN (''MOD'')',
'           AND wbf_bus_fun_id = :P86_WBF_PAR_FUN_ID;',
'',
'        cr1                     c1%ROWTYPE;',
'',
'    BEGIN',
'',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'',
'            IF c1%NOTFOUND THEN',
'               raise_application_error(-20999,''Par. Bus. Fun. not found.'');		 	  	     	  ',
'            ELSE',
'               :P86_WBF_PAR_FUN_DESC := cr1.wbf_bus_fun_name;',
'               :P86_PAR_BUS_FUN_NAME := cr1.wbf_bus_fun_name;',
'               :P86_PAR_BUS_FUN_ALIAS_NAME := cr1.wbf_bus_fun_alias_name;',
'            END IF;',
'',
'        CLOSE c1;',
'',
'    END;',
'',
'END IF;',
'*/',
'',
'IF :P86_WBF_PAR_FUN_ID IS NOT NULL THEN',
'',
'    DECLARE',
'',
'        CURSOR c1',
'            IS',
'        SELECT wbf_bus_fun_name,wbf_bus_fun_id,wbf_bus_fun_alias_name',
'          FROM wapl_bus_fun',
'         WHERE wbf_node_type IN (''MOD'')',
'           AND wbf_bus_fun_id = :P86_WBF_PAR_FUN_ID;',
'',
'        cr1                     c1%ROWTYPE;',
'',
'    BEGIN',
'',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'',
'            IF c1%NOTFOUND THEN',
'               NULL;',
'            --    raise_application_error(-20999,''Par. Bus. Fun. not found.'');		 	  	     	  ',
'            ELSE',
'               :P86_WBF_PAR_FUN_DESC := cr1.wbf_bus_fun_name;',
'               :P86_PAR_BUS_FUN_NAME := cr1.wbf_bus_fun_name;',
'               :P86_PAR_BUS_FUN_ALIAS_NAME := cr1.wbf_bus_fun_alias_name;',
'            END IF;',
'',
'        CLOSE c1;',
'',
'    END;',
'',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3322495525502709801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6599966450415015662)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P86_ROWID IS NULL THEN',
'',
'   :P86_WBF_CRE_BY          := :GLOBAL_USER;',
'   :P86_WBF_CRE_EMP_ID      := :GLOBAL_EMP_ID;',
'   :P86_WBF_CRE_DATE        := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'   :P86_WBF_CRE_IP_ADDR     := :GLOBAL_IP;',
'',
'ELSE',
'   :P86_WBF_UPD_BY        := :GLOBAL_USER;',
'   :P86_WBF_UPD_DATE      := TO_CHAR(SYSDATE,''DD-MON-YYYY HH24:MI:SS'');',
'   :P86_WBF_UPD_EMP_ID    := :GLOBAL_EMP_ID;',
'   :P86_WBF_UPD_IP_ADDR   := :GLOBAL_IP;',
'END IF;',
'',
'---:P86_WBF_VISIBLE   := :P86_WBF_ACTIVE_FLAG;',
':P86_WBF_FORM_ICON := CASE WHEN :P86_WBF_NODE_TYPE <> ''MOD'' THEN ''forms'' ELSE ''btqrg'' END;',
'',
'',
'if :P86_WBF_NODE_TYPE not in (''MOD'') AND 1=2',
'then',
' raise_application_error(-20999,''Module must be entered.'');',
'end if; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1118004614871404634
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6592696480357357223)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6592664639818357074)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Add Bus. Fun.'
,p_static_id=>'process-form-add-bus-fun'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1110734644813746195
);
wwv_flow_imp.component_end;
end;
/
