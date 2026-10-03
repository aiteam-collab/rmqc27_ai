prompt --application/pages/page_211131015
begin
--   Manifest
--     PAGE: 211131015
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
 p_id=>211131015
,p_name=>'Copy Bus Fun'
,p_alias=>'COPY-BUS-FUN'
,p_page_mode=>'MODAL'
,p_step_title=>'Copy Bus Fun'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-7>.rel-col .col-1 {',
'    max-width: 2%;',
'    flex-basis: 20%;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10052729870537652805)
,p_plug_name=>'Copy'
,p_static_id=>'copy'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5900817949777285265)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_button_name=>'Bus_fun_Ok'
,p_static_id=>'bus-fun-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Bus Fun Ok'
,p_button_position=>'NEXT'
,p_button_condition=>'P211131015_TYPE'
,p_button_condition2=>'BUS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5900817537579285262)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_button_name=>'Prefix_Ok'
,p_static_id=>'prefix-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Prefix Ok'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5900824216265285357)
,p_branch_name=>'Go To Page 211131011'
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&P211131015_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5900817537579285262)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5900824608822285359)
,p_branch_name=>'Go To Page 211131011'
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&P211131015_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5900817949777285265)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981306923046719585)
,p_name=>'P211131015_COPY_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'Copy User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_COPY_USER(UAM1010)'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Copy User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981308864413719587)
,p_name=>'P211131015_DEPARTMENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
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
 p_id=>wwv_flow_imp.id(7981309257110719588)
,p_name=>'P211131015_DEPT_DESC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981307257227719585)
,p_name=>'P211131015_EMPLOYEE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'Employee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
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
 p_id=>wwv_flow_imp.id(8188010651205598417)
,p_name=>'P211131015_PLNT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8212980145825754668)
,p_name=>'P211131015_PLNT_LOC_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981308056954719587)
,p_name=>'P211131015_POSITION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'Postion'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
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
 p_id=>wwv_flow_imp.id(7981308495062719587)
,p_name=>'P211131015_POSITION_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
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
 p_id=>wwv_flow_imp.id(8030344173309722768)
,p_name=>'P211131015_ROWID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8188010532462598416)
,p_name=>'P211131015_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981309660572719590)
,p_name=>'P211131015_UBFAH_DOC_NO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981306430682719585)
,p_name=>'P211131015_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7981307683530719587)
,p_name=>'P211131015_USER_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10052729870537652805)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5900823141092285351)
,p_name=>'Assign_copy_user'
,p_static_id=>'assign-copy-user'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211131015_COPY_USER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5900823639936285354)
,p_event_id=>wwv_flow_imp.id(5900823141092285351)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P211131015_DEPT_DESC,P211131015_DEPARTMENT,P211131015_USER_NAME,P211131015_EMPLOYEE,P211131015_POSITION,P211131015_POSITION_NAME',
  'items_to_submit', 'P211131015_COPY_USER',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P211131015_COPY_USER IS NOT NULL THEN',
    '',
    'declare',
    '	cursor c1 is 	',
    '		SELECT appluser_user_type ',
    '  FROM appl_users',
    ' WHERE appluser_bu = :global_bu AND appluser_id = :P211131015_COPY_USER;',
    ' cr1 c1%rowtype;',
    'begin',
    '	open c1;',
    '	fetch c1 into cr1;',
    '	if c1%notfound then ',
    '		raise_application_error(-20999,''Application User not found.'');',
    '	ELSE',
    '',
    'CR1.appluser_user_type:=CR1.appluser_user_type;',
    '	END IF;',
    '	END;',
    'ELSE',
    'raise_application_error(-20999,''User Must be entered.'');',
    'END IF;',
    '',
    '',
    'IF :P211131015_COPY_USER IS NULL THEN',
    '	raise_application_error(-20999,''User Must be entered.'');',
    '',
    'ELSE',
    'DECLARE	',
    '	CURSOR C1 IS ',
    '	SELECT APPLUSER_EMP_ID,APPLUSER_CUST_ID, APPLUSER_SUPLR_ID,APPLUSER_USER_TYPE FROM',
    '	APPL_USERS',
    '	WHERE',
    '	APPLUSER_BU = :global_bu AND',
    '	APPLUSER_ID = :P211131015_COPY_USER;',
    '',
    '	CR1 C1%ROWTYPE;',
    'BEGIN',
    '	OPEN C1;',
    '	FETCH C1 INTO CR1;',
    '	IF CR1.APPLUSER_EMP_ID IS NOT NULL  and cr1.APPLUSER_USER_TYPE not in (''C'',''S'')  THEN',
    '		',
    'proc_get_emp_det',
    '					(',
    '					:global_bu,					',
    '					:P211131015_COPY_USER,',
    ' 					:P211131015_EMPLOYEE,',
    ' 					:P211131015_USER_NAME,',
    ' 					:P211131015_POSITION,',
    ' 					:P211131015_POSITION_NAME,',
    ' 					:P211131015_DEPARTMENT,',
    ' 					:P211131015_DEPT_DESC,',
    ' 					1',
    ' 					);',
    ' 	:P211131015_USER_NAME:=func_find_emp_name(:global_bu,:P211131015_COPY_USER,1);					',
    '	ELSIF CR1.APPLUSER_EMP_ID IS  NULL THEN',
    '		:P211131015_USER_NAME:= NULL;',
    '	END IF;',
    '	CLOSE C1;',
    '	END;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5900822506860285346)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ok_process'
,p_static_id=>'ok-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131015_COPY_USER IS NOT NULL THEN',
'-- raise_application_error(-20999,:P211131015_UBFAH_DOC_NO||''-''||:P211131015_USER||''-''||:P211131015_COPY_USER);',
'proc_ins_copy_user_bf(:GLOBAL_BU,:P211131015_UBFAH_DOC_NO,:P211131015_USER,:P211131015_COPY_USER,:GLOBAL_USER);',
'PROC_COMMIT;',
'	-- raise_Application_error(-20999,''Record copied.'');',
'	apex_application.g_print_success_message := ''Record copied.'';  ',
'',
'',
'',
'else',
'	raise_application_error(-20999,''User must be entered.'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5900817949777285265)
,p_internal_uid=>418860671316674318
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5900822844777285349)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ok _process2'
,p_static_id=>'ok-process-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P211131015_COPY_USER IS NOT NULL THEN',
'-- raise_application_error(-20999,:P211131015_UBFAH_DOC_NO||''-''||:P211131015_USER||''-''||:P211131015_COPY_USER||''-''||:GLOBAL_USER||''-''||:GLOBAL_BU);',
'proc_ins_copy_user_access_pfx(:GLOBAL_BU,:P211131015_UBFAH_DOC_NO,:P211131015_USER,:P211131015_COPY_USER,:GLOBAL_USER);',
'PROC_COMMIT;',
'	apex_application.g_print_success_message := ''Record copied.'';  ',
'',
'',
'',
'else',
'	raise_application_error(-20999,''User must be entered.'');',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5900817537579285262)
,p_internal_uid=>418861009233674321
);
wwv_flow_imp.component_end;
end;
/
