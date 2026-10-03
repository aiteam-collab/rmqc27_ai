prompt --application/pages/page_00184
begin
--   Manifest
--     PAGE: 00184
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
 p_id=>184
,p_name=>'Add Notification'
,p_alias=>'ADD-NOTIFICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Add Notification'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(6580005005568416037)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(6580013751694416070)
,p_branch_name=>'Go To Page 181'
,p_branch_action=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.::P181_ROWID:&P184_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6580005005568416037)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491126262876261369)
,p_name=>'P184_APPR_DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124728182261354)
,p_name=>'P184_BU'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(7491124622294261353)
,p_name=>'P184_COUNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491125154011261358)
,p_name=>'P184_CRE_BY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491125223102261359)
,p_name=>'P184_CRE_DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491125845932261365)
,p_name=>'P184_CRE_EMP_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491126030025261367)
,p_name=>'P184_CRE_IP_ADD'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491125982310261366)
,p_name=>'P184_CRE_OS_USER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124403937261351)
,p_name=>'P184_DOC_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(7491124377296261350)
,p_name=>'P184_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124951718261356)
,p_name=>'P184_EFF_FROM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(7491125052043261357)
,p_name=>'P184_EFF_TO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
 p_id=>wwv_flow_imp.id(6595812578382136428)
,p_name=>'P184_MODULE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wnl_module d, wnl_module r',
'  FROM wapl_notify_list',
' WHERE wnl_module IS NOT NULL'))
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Module')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124286827261349)
,p_name=>'P184_REFERENCE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_prompt=>'Reference'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(7491126389729261370)
,p_name=>'P184_RETURN_PAGE_NO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491125549296261362)
,p_name=>'P184_ROWID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124585574261352)
,p_name=>'P184_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491124064622261347)
,p_name=>'P184_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_item_default=>'A'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491123982605261346)
,p_name=>'P184_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
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
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(7491126452043261371)
,p_name=>'P184_WF_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7491126146419261368)
,p_name=>'P184_WRK_FLOW_APPR'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7491122869512261318)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6580012005301416066)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P184_REFERENCE is null then',
'return(''Reference must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7491124286827261349)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6580011626465416066)
,p_validation_name=>'User_id'
,p_static_id=>'user-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P184_USER_ID IS NULL THEN',
'RETURN(''User must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7491123982605261346)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6580012721868416067)
,p_name=>'FROM_USER_ID'
,p_static_id=>'from-user-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P184_FROM_USER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6580013228092416069)
,p_event_id=>wwv_flow_imp.id(6580012721868416067)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P184_USER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6595811662230136419)
,p_name=>'Reference'
,p_static_id=>'reference'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P184_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6595811768703136420)
,p_event_id=>wwv_flow_imp.id(6595811662230136419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P184_REFERENCE',
  'items_to_submit', 'P184_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'IF :P184_TYPE =''A'' THEN',
    '   :P184_REFERENCE :=''Add Bus. Fun.'';',
    '   ELSIF :P184_TYPE =''R'' THEN',
    '   :P184_REFERENCE :=''Remove Bus. Fun.'';',
    'END IF;   ',
    '',
    'EXCEPTION WHEN OTHERS THEN NULL;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6580012295085416066)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_Process'
,p_static_id=>'insert-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P184_ROWID IS NULL THEN',
'',
'    SELECT NVL(MAX(TO_NUMBER(wunahd_doc_no)), 1000000000) + 1',
'      INTO :P184_DOC_NO',
'      FROM wa_user_notif_access_hd',
'     WHERE wunahd_bu = :GLOBAL_bu;',
'',
'    INSERT INTO wa_user_notif_access_hd(',
'                wunahd_bu,',
'				wunahd_doc_no,',
'				wunahd_user_id,',
'				wunahd_eff_from,',
'				wunahd_eff_to,',
'				wunahd_status,',
'				wunahd_reference,',
'				wunahd_cre_by,',
'				wunahd_cre_date,',
'				wunahd_upd_by,',
'				wunahd_upd_date,',
'				wunahd_doc_date,',
'				wunahd_type,',
'				wunahd_upd_ip_addr,',
'				wunahd_upd_os_user,',
'				wunahd_upd_emp_id,',
'				wunahd_cre_emp_id,',
'				wunahd_cre_os_user,',
'				wunahd_cre_ip_addr,',
'                WUNAHD_MODULE',
'                ) ',
'         VALUES (',
'				:GLOBAL_BU,			--WBFAHD_BU,',
'				:P184_DOC_NO,		--WBFAHD_DOC_NO,',
'				:P184_USER_ID,		--WBFAHD_USER_ID,',
'				:P184_EFF_FROM,		--WBFAHD_EFF_FROM,',
'				:P184_EFF_TO,		--WBFAHD_EFF_TO,',
'				:P184_STATUS,		--WBFAHD_STATUS,',
'				:P184_REFERENCE,	--WBFAHD_REFERENCE,',
'				:GLOBAL_USER,		--WBFAHD_CRE_BY,',
'				SYSDATE,			--WBFAHD_CRE_DATE,',
'				:GLOBAL_USER,		--WBFAHD_UPD_BY,',
'				SYSDATE,			--WBFAHD_UPD_DATE,',
'				:P184_DOC_DATE,		--WBFAHD_DOC_DATE,',
'				:P184_TYPE,			--WBFAHD_TYPE,',
'				:GLOBAL_IP,			--WBFAHD_UPD_IP_ADDR,',
'				:GLOBAL_EMP_ID,		--WBFAHD_UPD_OS_USER,',
'				''NULL'',			    --WBFAHD_UPD_EMP_ID,',
'				:P184_CRE_EMP_ID,	--WBFAHD_CRE_EMP_ID,',
'				:GLOBAL_EMP_ID,		--WBFAHD_CRE_OS_USER,',
'				:GLOBAL_IP, 		    --WBFAHD_CRE_IP_ADDR,',
'                :P184_MODULE      --WUNAHD_MODULE',
'                );',
'',
'    APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P184_DOC_NO;',
'',
'    SELECT ROWID',
'      INTO :P184_ROWID',
'      FROM wa_user_notif_access_hd',
'     WHERE wunahd_bu = :GLOBAL_BU',
'       AND wunahd_doc_no =:P184_DOC_NO;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6580005005568416037)
,p_internal_uid=>1100491311300495864
);
wwv_flow_imp.component_end;
end;
/
