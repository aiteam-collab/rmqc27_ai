prompt --application/pages/page_00176
begin
--   Manifest
--     PAGE: 00176
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
 p_id=>176
,p_name=>' Unit Access dialog'
,p_alias=>'GRANT-REVOKE-UNIT-ACCESS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Grant/Revoke Unit Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6397152059189756104)
,p_plug_name=>' Unit Access'
,p_static_id=>'unit-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6397153756589756121)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6397153867208756122)
,p_branch_name=>'Go To 83 '
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ROWID:&P176_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6397153756589756121)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397152538135756109)
,p_name=>'P176_DOC_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly '
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(6397152616816756110)
,p_name=>'P176_DOC_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly '
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(6397152368383756107)
,p_name=>'P176_FROM_USER_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_prompt=>'Copy From  User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT auba_user_id',
'  FROM appl_user_plant_access,',
'       appl_users',
' WHERE auba_bu     = appluser_bu',
'   AND appluser_id = auba_user_id',
'   AND appluser_bu = :Global_bu',
'   AND appluser_status = ''A''',
'   AND appluser_user_type <> ''O''',
'   AND appluser_id <> :P176_USER_ID'))
,p_cSize=>30
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P176_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(6397152462373756108)
,p_name=>'P176_REFERENCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_prompt=>'Reference'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397153592925756120)
,p_name=>'P176_ROWID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397152199093756106)
,p_name=>'P176_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add Unit Access;A,Remove Unit Access;R,Extend Duration;E'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
' WHERE WUPAL_BU         = :Global_bu',
'   AND WUPAL_DOC_NO     = :P176_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397152117782756105)
,p_name=>'P176_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6397152059189756104)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d,',
'       appluser_id r',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu',
' and APPLUSER_USER_TYPE IN (''E'',''M'')'))
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6397153527898756119)
,p_validation_name=>'REFERENCE'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P176_REFERENCE IS NULL THEN',
'   RETURN (''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6397152462373756108)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6397152772257756111)
,p_validation_name=>'user'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>'P176_USER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'User must be entered.'
,p_associated_item=>wwv_flow_imp.id(6397152117782756105)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6397153258672756116)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P176_FROM_USER_ID'
,p_condition_element=>'P176_FROM_USER_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6397153422753756118)
,p_event_id=>wwv_flow_imp.id(6397153258672756116)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P176_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6397153376496756117)
,p_event_id=>wwv_flow_imp.id(6397153258672756116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P176_FROM_USER_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6397153970275756123)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT'
,p_static_id=>'insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P176_ROWID IS NULL THEN',
'',
'',
'     select (NVL(max(TO_NUMBER(WUPAH_DOC_NO)),1000000000)) + 1 ',
'     into :P176_DOC_NO',
'     from WAPL_USER_PLNT_ACCESS_HD',
'    where wupah_bu = :global_bu;',
'   ',
'   :P176_DOC_DATE   := TRUNC(SYSDATE);',
'',
'',
'INSERT INTO WAPL_USER_PLNT_ACCESS_HD(Wupah_bu,',
'                                     wupah_doc_no,',
'                                     wupah_doc_date,',
'                                     wupah_reference,',
'                                     wupah_user_id,',
'                                     wupah_type,',
'                                     wupah_status,',
'                                     wupah_cre_by,',
'                                     wupah_cre_os_user,',
'                                     wupah_cre_ip_addr,',
'                                     wupah_cre_date,',
'                                     wupah_cre_emp_id,',
'                                  --   wupah_appr_by,',
'                                 --    wupah_appr_date,',
'                                     wupah_from_user_id)',
'						      VALUES(:GLOBAL_BU,',
'                                     :P176_DOC_NO,',
'                                     :P176_DOC_DATE,',
'                                     :P176_REFERENCE,',
'                                     :P176_USER_ID,',
'                                     :P176_TYPE,',
'                                     ''N'',',
'                                     :GLOBAL_USER,',
'                                     :GLOBAL_IP_ADDR, ',
'                                     :GLOBAL_OS_USER,',
'                                     SYSDATE,',
'                                     :GLOBAL_EMP_ID,',
'                                     :P176_FROM_USER_ID);',
'',
'       ',
'  APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P176_DOC_NO;',
'',
'                   ',
'   SELECT ROWID',
'          INTO :P176_ROWID',
'          FROM WAPL_USER_PLNT_ACCESS_HD',
'         WHERE wupah_bu     = :GLOBAL_BU',
'           AND wupah_doc_no = :P176_DOC_NO; ',
'',
'',
'   END IF;',
'',
'                                      '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6397153756589756121)
,p_internal_uid=>917632986490835921
);
wwv_flow_imp.component_end;
end;
/
