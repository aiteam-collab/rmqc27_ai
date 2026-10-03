prompt --application/pages/page_00177
begin
--   Manifest
--     PAGE: 00177
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
 p_id=>177
,p_name=>'ESS Bus. Fun. Access'
,p_alias=>'ESS-BUS-FUN-ACCESS2'
,p_page_mode=>'MODAL'
,p_step_title=>'ESS Bus. Fun. Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6397156411835756148)
,p_plug_name=>'ESS Bus. Fun. Access'
,p_static_id=>'ess-bus-fun-access'
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
 p_id=>wwv_flow_imp.id(6412714136111787008)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(6397156411835756148)
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
 p_id=>wwv_flow_imp.id(6412714354319787010)
,p_branch_name=>'Go To 167'
,p_branch_action=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.::P167_ROWID:&P177_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6412714136111787008)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6412713728320787004)
,p_name=>'P177_DOC_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(6412713614147787003)
,p_name=>'P177_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'READONLY = READONLY '
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(6397156761593756151)
,p_name=>'P177_EFF_FROM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(6397156808907756152)
,p_name=>'P177_EFF_TO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'DD-MM-RRRR'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(6412713860080787005)
,p_name=>'P177_REFERENCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
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
 p_id=>wwv_flow_imp.id(6412713886291787006)
,p_name=>'P177_ROWID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397156667671756150)
,p_name=>'P177_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397156544572756149)
,p_name=>'P177_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6397156411835756148)
,p_prompt=>'User ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT appluser_id D,',
'        appluser_id R',
'   FROM appl_users',
'  WHERE appluser_bu = :GLOBAL_bu',
'    AND (appluser_user_type IN (''U'',''R'') OR (appluser_user_type = ''E'' AND appluser_erp_admin_user = ''Y'') OR (appluser_user_type = ''E'' AND appluser_erp_admin_user = ''N''))',
'    AND appluser_emp_id is not null',
'    AND appluser_status = ''A'';'))
,p_cSize=>30
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
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User ID',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6412714201610787009)
,p_validation_name=>'REFERENCE'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P177_REFERENCE IS NULL THEN',
'RETURN (''Reference must be entered.'');',
'End if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6412714136111787008)
,p_associated_item=>wwv_flow_imp.id(6412713860080787005)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6412714057986787007)
,p_validation_name=>'USER'
,p_static_id=>'user'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P177_USER_ID IS NULL THEN',
'   RETURN (''User ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6412714136111787008)
,p_associated_item=>wwv_flow_imp.id(6397156544572756149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6412714464021787011)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert'
,p_static_id=>'insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P177_ROWID IS NULL THEN ',
'        ',
'SELECT NVL (MAX ((TO_NUMBER(ebfah_doc_no))), 1000000000) + 1',
'      INTO :P177_DOC_NO',
'      FROM ess_bu_fun_access_hd',
'     WHERE ebfah_bu = :GLOBAL_bu;',
'',
'INSERT INTO ESS_BU_FUN_ACCESS_HD(Ebfah_bu,',
'                                 ebfah_doc_no,',
'                                 ebfah_doc_date,',
'                                 ebfah_user_id,',
'                                 ebfah_eff_from,',
'                                 ebfah_eff_to,',
'                                 ebfah_type,',
'                                 ebfah_status,',
'                                 ebfah_reference,',
'                                 ebfah_cre_by,',
'                                 ebfah_cre_os_user,',
'								 ebfah_cre_ip_addr,',
'								 ebfah_cre_date,',
'                                 ebfah_cre_emp_id)',
'								-- ebfah_appr_by,',
'                                --ebfah_appr_date,',
'                                --ebfah_from_user_id)',
'						  VALUES(:Global_bu,',
'                                 :P177_DOC_NO,',
'                                 :P177_DOC_DATE,',
'                                 :P177_USER_ID,',
'                                 :P177_EFF_FROM,',
'                                 :P177_EFF_TO,',
'                                 :P177_TYPE,',
'                                 ''N'',',
'                                 :P177_REFERENCE,',
'                                 :GLOBAL_USER,',
'                                 :GLOBAL_IP_ADDR,',
'                                 :GLOBAL_OS_USER,',
'                                  SYSDATE,',
'                                 :GLOBAL_EMP_NAME);',
'                    ',
'         ',
'  APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P177_DOC_NO;',
'',
'                   ',
'   SELECT ROWID',
'          INTO :P177_ROWID',
'          FROM ESS_BU_FUN_ACCESS_HD',
'         WHERE Ebfah_bu     = :GLOBAL_BU',
'           AND Ebfah_doc_no = :P177_DOC_NO; ',
'',
'		END IF;		    ',
'',
'',
'',
'    IF :P177_REFERENCE IS NULL THEN',
'    IF :P177_TYPE =''A'' THEN',
'       :P177_REFERENCE := ''Add Bus. Fun.'';',
'    ELSE',
'       :P177_REFERENCE := ''Remove Bus. Fun.'';',
'    END IF;',
'END IF;                       '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6412714136111787008)
,p_internal_uid=>933193480236866809
);
wwv_flow_imp.component_end;
end;
/
