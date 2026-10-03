prompt --application/pages/page_00170
begin
--   Manifest
--     PAGE: 00170
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
 p_id=>170
,p_name=>'Role Access'
,p_alias=>'ROLE-ACCESS2'
,p_page_mode=>'MODAL'
,p_step_title=>'Role Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6397154064914756124)
,p_plug_name=>'Role Access'
,p_static_id=>'role-access'
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
 p_id=>wwv_flow_imp.id(6397155049192756134)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6397154064914756124)
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
 p_id=>wwv_flow_imp.id(6397155119104756135)
,p_branch_name=>'Go To  158'
,p_branch_action=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.::P158_ROWID:&P170_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6397155049192756134)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397154453068756128)
,p_name=>'P170_DOC_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_colspan=>6
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM wapl_user_role_access_ln',
' WHERE wural_bu = :Global_bu ',
'     AND wural_doc_no = :P170_DOC_NO'))
,p_read_only_when_type=>'EXISTS'
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
 p_id=>wwv_flow_imp.id(6397154534762756129)
,p_name=>'P170_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
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
 p_id=>wwv_flow_imp.id(6397154339519756127)
,p_name=>'P170_REFERENCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
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
 p_id=>wwv_flow_imp.id(6397154590077756130)
,p_name=>'P170_ROWID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397154263802756126)
,p_name=>'P170_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add Role Access;A,Remove Role Access;R'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397154084124756125)
,p_name=>'P170_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6397154064914756124)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d,',
'       appluser_id r',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
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
  'title', 'User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6397154961620756133)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P170_REFERENCE is null then',
'return (''Reference must br entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6397155049192756134)
,p_associated_item=>wwv_flow_imp.id(6397154339519756127)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6397154867705756132)
,p_validation_name=>'user'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>'P170_USER_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'User must be entered.'
,p_associated_item=>wwv_flow_imp.id(6397154084124756125)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6397155190570756136)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert'
,p_static_id=>'insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P170_ROWID is null then',
'',
'    select (NVL(max(TO_NUMBER(WURAH_DOC_NO)),1000000000)) + 1 ',
'     into :P170_DOC_NO',
'     from WAPL_USER_ROLE_ACCESS_HD',
'    where wurah_bu = :global_bu;',
'   ',
'   :P170_DOC_DATE   := TRUNC(SYSDATE);',
'',
'',
'INSERT INTO WAPL_USER_ROLE_ACCESS_HD(Wurah_bu,',
'                                     wurah_doc_no,',
'                                     wurah_doc_date,',
'                                     wurah_reference,',
'                                     wurah_user_id,',
'                                     wurah_type,',
'                                     wurah_status,',
'                                     wurah_cre_by,',
'                                     wurah_cre_ip_addr,',
'                                     wurah_cre_os_user,',
'                                     wurah_cre_date,',
'                                     wurah_cre_emp_id)',
'                                  --   wurah_appr_by,',
'                                 --    wurah_appr_date,',
'                                   --  wurah_from_user_id)',
'						      VALUES(:global_bu,',
'                                     :P170_DOC_NO,',
'                                     :P170_DOC_DATE,',
'                                     :P170_REFERENCE,',
'                                     :P170_USER_ID,',
'                                     :P170_TYPE,',
'                                     ''N'',',
'                                     :GLOBAL_USER,',
'                                     :GLOBAL_IP_ADDR,',
'                                     :GLOBAL_OS_USER,',
'                                      SYSDATE,',
'                                     :GLOBAL_EMP_ID);',
'',
'       ',
'  APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P170_DOC_NO;',
'',
'                   ',
'   SELECT ROWID',
'          INTO :P170_ROWID',
'          FROM WAPL_USER_ROLE_ACCESS_HD',
'         WHERE WURAH_BU     = :GLOBAL_BU',
'           AND WURAH_doc_no = :P170_DOC_NO; ',
'',
'		END IF;		         ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6397155049192756134)
,p_internal_uid=>917634206785835934
);
wwv_flow_imp.component_end;
end;
/
