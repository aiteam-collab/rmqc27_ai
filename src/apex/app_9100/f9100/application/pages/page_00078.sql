prompt --application/pages/page_00078
begin
--   Manifest
--     PAGE: 00078
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
 p_id=>78
,p_name=>'Get Username'
,p_alias=>'FORGOT-USERNAME'
,p_page_mode=>'MODAL'
,p_step_title=>'Get Username'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #007aff;',
'    color: #ffffff;',
'}',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #007aff;',
'}',
'',
'',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label, .apex-button-group input:checked + label {',
'    border-color: #5d9cda;',
'    background-color: #3991e9;',
'    color: #ffffff;',
'    box-shadow: none;',
'}',
'',
'.apex-item-group--rc .apex-item-option:first-child:nth-last-child(2), .apex-item-group--rc .apex-item-option:first-child:nth-last-child(2)~.apex-item-option {',
'    width: 25%;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'600'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6659518263810225651)
,p_plug_name=>'MAIN CONTENT'
,p_static_id=>'main-content'
,p_icon_css_classes=>'fa-users-alt'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--info:t-Alert--removeHeading:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><p>Enter the required information and we''ll send an OTP to know your Username</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P78_CONDITION'
,p_plug_display_when_cond2=>'MAIN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6780431277003576149)
,p_plug_name=>'OTP'
,p_static_id=>'otp'
,p_icon_css_classes=>'fa-envelope-lock'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--success:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><p>Enter the verification code we  just sent on your Email / SMS</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P78_CONDITION'
,p_plug_display_when_cond2=>'OTP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6191682963235659237)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_button_name=>'Proceed'
,p_static_id=>'proceed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Proceed'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6191684896855659249)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6780431277003576149)
,p_button_name=>'Proceed-OTP'
,p_static_id=>'proceed-otp'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Proceed'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6191687775968659262)
,p_branch_action=>'f?p=&APP_ID.:9999:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6191684896855659249)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6704747992826562059)
,p_name=>'P78_ADDRESS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_prompt=>'Email / Phone number'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780435002562576180)
,p_name=>'P78_CONDITION'
,p_item_sequence=>10
,p_item_default=>'MAIN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6523936731991549848)
,p_name=>'P78_EMP_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780434322292576176)
,p_name=>'P78_OTP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6780431277003576149)
,p_prompt=>'OTP'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_tag_attributes=>'autocomplete = "new-password"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780433035855576167)
,p_name=>'P78_SUCCESS_MSG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780432694085576163)
,p_name=>'P78_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_item_default=>'M'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Mail;M,Phone Number;P'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780433243102576169)
,p_name=>'P78_USERNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6659518263810225651)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6191686223085659256)
,p_validation_name=>'FIND USERNAME'
,p_static_id=>'find-username'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c0 IS',
'    SELECT',
'    (SELECT',
'            appluser_id',
'        FROM',
'            appl_users',
'        WHERE',
'                appluser_bu = emp_bu',
'            AND appluser_emp_id = emp_emp_id',
'    ) user_id ',
'    FROM',
'        employees',
'    WHERE (emp_off_mobile_no = :p78_address OR emp_off_email_id = :p78_address);',
'',
'    cr0           c0%rowtype;',
'BEGIN',
'    OPEN c0;',
'    FETCH c0 INTO cr0;',
'                IF c0%notfound then',
'                return ''Account for this Email or Phone Number does not exist.'';',
'                END IF;',
'    CLOSE C0;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6191682963235659237)
,p_associated_item=>wwv_flow_imp.id(6704747992826562059)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6191686567298659257)
,p_validation_name=>'VERIFY OTP'
,p_static_id=>'verify-otp'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c0 IS',
'    SELECT',
'                ''x''',
'        FROM',
'            appl_users,',
'            otp_details,',
'            employees',
'        WHERE',
'                appluser_id = od_user',
'            AND od_type = ''UNAME''',
'            AND appluser_bu = emp_bu',
'            AND appluser_emp_id = emp_emp_id',
'            AND upper(:P78_USERNAME) = upper(appluser_id)',
'            AND appluser_emp_id = :P78_EMP_ID',
'            AND trunc(sysdate) BETWEEN trunc(appluser_eff_from) AND trunc(appluser_eff_to)',
'            AND appluser_status = ''A''',
'            AND emp_status = ''A''',
'            AND od_otp = func_get_hash(:P78_USERNAME, :P78_OTP)',
'            AND sysdate BETWEEN od_otp_valid_from AND od_otp_valid_to;',
'',
'    cr0           c0%rowtype;',
'BEGIN',
'    OPEN c0;',
'    FETCH c0 INTO cr0;',
'                IF c0%notfound then',
'                return ''Invalid OTP.'';',
'                END IF;',
'    CLOSE C0;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6191684896855659249)
,p_associated_item=>wwv_flow_imp.id(6780434322292576176)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523938173036549863)
,p_name=>'FIND EMP ID'
,p_static_id=>'find-emp-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P78_ADDRESS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523938335268549864)
,p_event_id=>wwv_flow_imp.id(6523938173036549863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P78_EMP_ID',
  'items_to_submit', 'P78_ADDRESS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    SELECT',
    '     emp_emp_id INTO :P78_EMP_ID',
    '    FROM',
    '        employees',
    '    WHERE',
    '        (emp_off_mobile_no = :P78_ADDRESS OR emp_off_email_id = :P78_ADDRESS );',
    '',
    '    EXCEPTION WHEN OTHERS THEN',
    '    NULL;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6191686855739659257)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND OTP'
,p_static_id=>'send-otp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- RAISE_APPLICATION_ERROR(-20999,:p78_address);',
'DECLARE',
'        v_username      VARCHAR2(50);',
'        v_emp_id        VARCHAR2(50);',
'BEGIN ',
'    SELECT',
'    (',
'        SELECT',
'            appluser_id',
'        FROM',
'            appl_users',
'        WHERE',
'                appluser_bu = emp_bu',
'            AND appluser_emp_id = emp_emp_id',
'    ) user_id, emp_emp_id   INTO v_username,v_emp_id',
'    FROM',
'        employees',
'    WHERE',
'        ( emp_off_mobile_no = :P78_ADDRESS',
'          OR emp_off_email_id = :P78_ADDRESS );',
'',
'-- proc_debug_proc(v_username||''~''||v_emp_id||''~''||:GLOBAL_DEVICE_TYPE||''~''||:GLOBAL_IP_ADDR||''~''||v(''app_id'')||''~''||:P78_TYPE);',
'',
'    proc_username_otp_apex (v_username,v_emp_id,:GLOBAL_DEVICE_TYPE,:GLOBAL_IP_ADDR,v(''app_id''),:P78_TYPE);',
'',
'    IF :P78_TYPE = ''M'' THEN',
'        :P78_SUCCESS_MSG := ''OTP Sent to your mail.'';',
'    ELSE',
'        :P78_SUCCESS_MSG := ''OTP Sent to your Phone number.'';',
'    END IF;',
'',
'    :P78_CONDITION := ''OTP'';',
'    :P78_USERNAME := v_username;',
'    :P78_EMP_ID := v_emp_id;',
'',
'    EXCEPTION WHEN OTHERS THEN',
'    :P78_CONDITION := ''MAIN'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6191682963235659237)
,p_process_success_message=>'&P78_SUCCESS_MSG.'
,p_internal_uid=>709725020196048229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6191687241670659262)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND USERNAME'
,p_static_id=>'send-username'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    proc_get_uname_via_mailsms (:P78_USERNAME,',
'                                :P78_EMP_ID,',
'                                :P78_TYPE);',
'',
'    IF :P78_TYPE = ''M'' THEN',
'        :P78_SUCCESS_MSG := ''Username Sent to your mail.'';',
'    ELSE',
'        :P78_SUCCESS_MSG := ''Username Sent to your Phone number.'';',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6191684896855659249)
,p_process_success_message=>'&P78_SUCCESS_MSG.'
,p_internal_uid=>709725406127048234
);
wwv_flow_imp.component_end;
end;
/
