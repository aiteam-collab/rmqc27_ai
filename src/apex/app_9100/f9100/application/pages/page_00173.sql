prompt --application/pages/page_00173
begin
--   Manifest
--     PAGE: 00173
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
 p_id=>173
,p_name=>'Grant/Revoke Bus Fun Access'
,p_alias=>'GRANT-REVOKE-BUS-FUN-ACCESS'
,p_page_mode=>'MODAL'
,p_step_title=>'Grant/Revoke Bus Fun Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6390639410904765508)
,p_plug_name=>'Grant/Revoke Bus. Fun. Access'
,p_static_id=>'grant-revoke-bus-fun-access'
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
 p_id=>wwv_flow_imp.id(6390640455434765518)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6397151884505756103)
,p_branch_name=>'Go To Page111326009501'
,p_branch_action=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.::P111326009501_ROWID:&P173_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6390640455434765518)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641855266765532)
,p_name=>'P173_APPR_DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640320572765517)
,p_name=>'P173_BU'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640214684765516)
,p_name=>'P173_COUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640746401765521)
,p_name=>'P173_CRE_BY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640815492765522)
,p_name=>'P173_CRE_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641438322765528)
,p_name=>'P173_CRE_EMP_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641622415765530)
,p_name=>'P173_CRE_IP_ADD'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641574700765529)
,p_name=>'P173_CRE_OS_USER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390639996327765514)
,p_name=>'P173_DOC_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly="true" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6390639969686765513)
,p_name=>'P173_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly tabindex="-1" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6390640544108765519)
,p_name=>'P173_EFF_FROM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640644433765520)
,p_name=>'P173_EFF_TO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390639879217765512)
,p_name=>'P173_REFERENCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
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
 p_id=>wwv_flow_imp.id(6390641982119765533)
,p_name=>'P173_RETURN_PAGE_NO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641141686765525)
,p_name=>'P173_ROWID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390640177964765515)
,p_name=>'P173_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390639657012765510)
,p_name=>'P173_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R,Extend Duration;E,MRM;M,Remove MRM;O'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390639574995765509)
,p_name=>'P173_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT appluser_id d,appluser_id r',
'   FROM appl_users',
' WHERE appluser_bu=:global_bu ',
'    AND appluser_status=''A''',
'    '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
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
  'title', 'Select the Users',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390642044433765534)
,p_name=>'P173_WF_NO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6390641738809765531)
,p_name=>'P173_WRK_FLOW_APPR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6390639410904765508)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6390642331711765537)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P173_REFERENCE is null then',
'return(''Reference must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6390639879217765512)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6390642243346765536)
,p_validation_name=>'User_id'
,p_static_id=>'user-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P173_USER_ID IS NULL THEN',
'RETURN(''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6390639574995765509)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6390643082346765544)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_FROM_USER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6390643105131765545)
,p_event_id=>wwv_flow_imp.id(6390643082346765544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P173_USER_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6390642400915765538)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_Process'
,p_static_id=>'insert-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P173_ROWID IS NULL THEN',
'',
'        SELECT NVL(MAX(TO_NUMBER(WBFAHD_DOC_NO)), 1000000000) + 1',
'          INTO :P173_DOC_NO',
'          FROM WA_BU_FUN_ACCESS_HD',
'         WHERE WBFAHD_BU = :GLOBAL_bu;',
'',
'-- RAISE_APPLICATION_ERROR(-20999,:P174_DEAH_DOC_NO ||''~''||:DEAH_DOC_DATE ||''~''||:DEAH_ATT_DATE);',
'',
'INSERT INTO WA_BU_FUN_ACCESS_HD(',
'                        WBFAHD_BU,',
'						WBFAHD_DOC_NO,',
'						WBFAHD_USER_ID,',
'						WBFAHD_EFF_FROM,',
'						WBFAHD_EFF_TO,',
'						WBFAHD_STATUS,',
'						WBFAHD_REFERENCE,',
'						WBFAHD_CRE_BY,',
'						WBFAHD_CRE_DATE,',
'						WBFAHD_UPD_BY,',
'						WBFAHD_UPD_DATE,',
'						WBFAHD_DOC_DATE,',
'						WBFAHD_TYPE,',
'						WBFAHD_UPD_IP_ADDR,',
'						WBFAHD_UPD_OS_USER,',
'						WBFAHD_UPD_EMP_ID,',
'						WBFAHD_CRE_EMP_ID,',
'						WBFAHD_CRE_OS_USER,',
'						WBFAHD_CRE_IP_ADDR',
'					--	WBFAHD_APPR_BY,',
'						--WBFAHD_APPR_DATE,',
'						--WBFAHD_FROM_USER_ID',
'                        ) ',
'                    VALUES(',
'						:GLOBAL_BU,			    --WBFAHD_BU,',
'						:P173_DOC_NO,			--WBFAHD_DOC_NO,',
'						:P173_USER_ID,			--WBFAHD_USER_ID,',
'						:P173_EFF_FROM,			--WBFAHD_EFF_FROM,',
'						:P173_EFF_TO,			--WBFAHD_EFF_TO,',
'						:P173_STATUS,			--WBFAHD_STATUS,',
'						:P173_REFERENCE,		--WBFAHD_REFERENCE,',
'						:GLOBAL_USER,			--WBFAHD_CRE_BY,',
'						SYSDATE,			    --WBFAHD_CRE_DATE,',
'						:GLOBAL_USER,		    --WBFAHD_UPD_BY,',
'						SYSDATE,			    --WBFAHD_UPD_DATE,',
'						:P173_DOC_DATE,			--WBFAHD_DOC_DATE,',
'						:P173_TYPE,			    --WBFAHD_TYPE,',
'						:GLOBAL_IP,			    --WBFAHD_UPD_IP_ADDR,',
'						:GLOBAL_EMP_ID,			--WBFAHD_UPD_OS_USER,',
'						''NULL'',			        --WBFAHD_UPD_EMP_ID,',
'						:P173_CRE_EMP_ID,		--WBFAHD_CRE_EMP_ID,',
'						:GLOBAL_EMP_ID,		    --WBFAHD_CRE_OS_USER,',
'						:GLOBAL_IP 		    --WBFAHD_CRE_IP_ADDR,',
'					--	''NULL'',			        --WBFAHD_APPR_BY,',
'						--SYSDATE,			    --WBFAHD_APPR_DATE,',
'						--''NULL''			        --WBFAHD_FROM_USER_ID',
'                    );',
'        APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P173_DOC_NO;',
'',
'   SELECT ROWID',
'          INTO :P173_ROWID',
'          FROM WA_BU_FUN_ACCESS_HD',
'         WHERE WBFAHD_BU = :GLOBAL_BU',
'          AND WBFAHD_DOC_NO =:P173_DOC_NO;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6390640455434765518)
,p_internal_uid=>911121417130845336
);
wwv_flow_imp.component_end;
end;
/
