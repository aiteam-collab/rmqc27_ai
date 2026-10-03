prompt --application/pages/page_00084
begin
--   Manifest
--     PAGE: 00084
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
 p_id=>84
,p_name=>'Update Password'
,p_alias=>'FORGOT-PASSWORD'
,p_page_mode=>'MODAL'
,p_step_title=>'Update Password'
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
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523937034493549851)
,p_plug_name=>'CC_EMP'
,p_static_id=>'cc-emp'
,p_parent_plug_id=>wwv_flow_imp.id(7260179463522665439)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523937586085549857)
,p_plug_name=>'FOOTER'
,p_static_id=>'footer'
,p_parent_plug_id=>wwv_flow_imp.id(7260179463522665439)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7260179463522665439)
,p_plug_name=>'MAIN CONTENT'
,p_static_id=>'main-content'
,p_icon_css_classes=>'fa-users-alt'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--info:t-Alert--removeHeading:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><p>Enter the required information, and we''ll send an OTP to reset your Password</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84_CONDITION'
,p_plug_display_when_cond2=>'MAIN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7137724397210500503)
,p_plug_name=>'Note : -'
,p_static_id=>'note'
,p_parent_plug_id=>wwv_flow_imp.id(6780441419228580240)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><span style="color:tomato;font-size: 11px">Note : * - </b>',
'<span style="font-size:11px"> The password must be alphanumeric, contain at least one capital letter, one number, and one special character.',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7381092476716015937)
,p_plug_name=>'OTP'
,p_static_id=>'otp'
,p_icon_css_classes=>'fa-envelope-lock'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--success:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><p>Enter the verification code we  just sent on your Email / SMS</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84_CONDITION'
,p_plug_display_when_cond2=>'OTP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6780441419228580240)
,p_plug_name=>'PASSWORD'
,p_static_id=>'password'
,p_icon_css_classes=>'fa-commenting'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--warning:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><h4>Reset Password</h4><br><p>Please Enter your new password</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P84_CONDITION'
,p_plug_display_when_cond2=>'PASS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6191695030112663337)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6780441419228580240)
,p_button_name=>'CHANGE_PASSWORD'
,p_static_id=>'change-password'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Password'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6191691923144663310)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6523937586085549857)
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
 p_id=>wwv_flow_imp.id(6191693927340663331)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7381092476716015937)
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
 p_id=>wwv_flow_imp.id(6191698917469663346)
,p_branch_action=>'f?p=&APP_ID.:9999:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6191695030112663337)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7305410216354001881)
,p_name=>'P84_ADDRESS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7260179463522665439)
,p_prompt=>'Username / Email / Phone number'
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
 p_id=>wwv_flow_imp.id(6523937097229549852)
,p_name=>'P84_CC_EMP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6523937034493549851)
,p_prompt=>'Employee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    (',
'        SELECT',
'            emp_first_name1',
'            || '' - ''',
'            || emp_emp_id',
'        FROM',
'            employees',
'        WHERE',
'                emp_bu = APPLUSER_BU',
'            AND emp_emp_id = APPLUSER_EMP_ID',
'    )          d,',
'    APPLUSER_EMP_ID r',
'FROM',
'        employees,appl_users',
'    WHERE emp_bu = appluser_bu',
'    AND  emp_emp_id = appluser_emp_id',
'    AND (UPPER(appluser_id) = :p84_address  OR emp_off_mobile_no = :p84_address OR emp_off_email_id = :p84_address);'))
,p_lov_cascade_parent_items=>'P84_ADDRESS'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6523937410338549855)
,p_name=>'P84_CC_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7260179463522665439)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7381101078777016023)
,p_name=>'P84_CONDITION'
,p_item_sequence=>20
,p_item_default=>'MAIN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780445635590580272)
,p_name=>'P84_CONFIRM_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6780441419228580240)
,p_prompt=>'Confirm Password'
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
 p_id=>wwv_flow_imp.id(6780445759424580273)
,p_name=>'P84_NEW_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6780441419228580240)
,p_prompt=>'New Password'
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
 p_id=>wwv_flow_imp.id(7381098689661016011)
,p_name=>'P84_OTP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7381092476716015937)
,p_prompt=>'OTP'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>6
,p_tag_attributes=>'autocomplete = "new-password"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7381095259383015989)
,p_name=>'P84_SUCCESS_MSG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7260179463522665439)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7381094917613015985)
,p_name=>'P84_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6523937586085549857)
,p_item_default=>'M'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7381095466630015991)
,p_name=>'P84_USERNAME'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6191696458767663342)
,p_validation_name=>'FIND USERNAME'
,p_static_id=>'find-username'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c0 IS',
'    SELECT',
'     appluser_id user_id ',
'    FROM',
'        employees,appl_users',
'    WHERE emp_bu = appluser_bu',
'    AND  emp_emp_id = appluser_emp_id',
'    AND (appluser_id = :p84_address OR emp_off_mobile_no = :p84_address OR emp_off_email_id = :p84_address);',
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
,p_when_button_pressed=>wwv_flow_imp.id(6191691923144663310)
,p_associated_item=>wwv_flow_imp.id(7305410216354001881)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5766521071798469833)
,p_validation_name=>' New Password'
,p_static_id=>'new-password'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'',
'    v_ascii_val                         NUMBER(5);',
'    v_pwd_exp_days                      NUMBER(5);',
'    v_rules                             VARCHAR2(100);',
'    v_upc                               VARCHAR2(100);',
'    v_lc                                VARCHAR2(100);',
'    v_num                               VARCHAR2(100);',
'    v_spc                               VARCHAR2(100);',
'BEGIN',
'',
'    IF :P84_NEW_PASSWORD IS NULL THEN',
'        RETURN (''New password must be entered.'');',
'    END IF;',
'',
'    IF :P84_NEW_PASSWORD IS NOT NULL THEN',
'        proc_check_pass_complex (:P84_NEW_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);',
'        IF v_rules = ''N'' THEN',
'            RETURN(''Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'        END IF;',
'',
'        IF LENGTH(:P84_NEW_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'            RETURN(''You must provide 3 to 15 characters for Password.'');',
'        END IF;',
'    END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6191695030112663337)
,p_associated_item=>wwv_flow_imp.id(6780445759424580273)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6191697263420663343)
,p_validation_name=>'Password should some'
,p_static_id=>'password-should-some'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P84_CONFIRM_PASSWORD IS NULL THEN',
'    RETURN (''Confirm password must be entered.'');',
'END IF;',
'IF :P84_NEW_PASSWORD <> :P84_CONFIRM_PASSWORD THEN',
'    RETURN ''Confirm Password not matched with New password'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6191695030112663337)
,p_associated_item=>wwv_flow_imp.id(6780445635590580272)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6191696846176663343)
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
'            AND od_type = ''RESET''',
'            AND appluser_bu = emp_bu',
'            AND appluser_emp_id = emp_emp_id',
'            AND upper(:P84_USERNAME) = upper(appluser_id)',
'            AND appluser_emp_id = :P84_CC_EMP',
'            AND trunc(sysdate) BETWEEN trunc(appluser_eff_from) AND trunc(appluser_eff_to)',
'            AND appluser_status = ''A''',
'            AND emp_status = ''A''',
'            AND od_otp = func_get_hash(:P84_USERNAME, :P84_OTP)',
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
,p_when_button_pressed=>wwv_flow_imp.id(6191693927340663331)
,p_associated_item=>wwv_flow_imp.id(7381098689661016011)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523937155711549853)
,p_name=>'FIND CC USERS'
,p_static_id=>'find-cc-users'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_ADDRESS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523937240147549854)
,p_event_id=>wwv_flow_imp.id(6523937155711549853)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P84_CC_TYPE,P84_CC_EMP',
  'items_to_submit', 'P84_ADDRESS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'CURSOR c0 IS',
    '    SELECT',
    '     appluser_id user_id ,',
    '     appluser_emp_id',
    '    FROM',
    '        employees,appl_users',
    '    WHERE emp_bu = appluser_bu',
    '    AND  emp_emp_id = appluser_emp_id',
    '    AND (UPPER(appluser_id) = UPPER(:p84_address) ',
    '         OR emp_off_mobile_no = :p84_address ',
    '         OR UPPER( emp_off_email_id) = UPPER(:p84_address));',
    '',
    'CURSOR c1 IS',
    '        SELECT COUNT(*) CNT FROM appl_users WHERE UPPER(appluser_id) = upper(:P84_ADDRESS) AND appluser_allow_cc_user = ''Y'';',
    '',
    '    cr0 c0%rowtype;',
    '    cr1 c1%rowtype;',
    'BEGIN',
    '    OPEN c0;',
    '    FETCH c0 INTO cr0;',
    '                IF c0%found then',
    '                 :P84_CC_EMP := cr0.appluser_emp_id;',
    '                END IF;',
    '    CLOSE C0;',
    '',
    '    OPEN c1;',
    '        FETCH c1 INTO cr1;',
    '        IF cr1.CNT <= 1 THEN',
    '            :P84_CC_TYPE := ''N'';',
    '        ELSE',
    '            :P84_CC_TYPE := ''Y'';',
    '        END IF;',
    '    CLOSE c1;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523937721402549858)
,p_event_id=>wwv_flow_imp.id(6523937155711549853)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6523937034493549851)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84_CC_TYPE'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523937481575549856)
,p_event_id=>wwv_flow_imp.id(6523937155711549853)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6523937034493549851)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P84_CC_TYPE'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6191697553625663343)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHANGE PASSWORD'
,p_static_id=>'change-password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c1 IS',
'    SELECT *',
'      FROM policy_data',
'     WHERE pda_bu   = :Global_bu;',
'',
'    cr1            c1%rowtype;',
'    v_pwd_exp_date DATE;',
'BEGIN',
'',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'    IF',
'        cr1.pda_pw_exp_rqrd IN ( ''Y'' )',
'        AND cr1.pda_pw_exp_days > 0',
'    THEN',
'        v_pwd_exp_date := (trunc(sysdate) + cr1.pda_pw_exp_days) - 1;',
'    ELSE',
'        v_pwd_exp_date := NULL;',
'    END IF;',
'  -- RAISE_APPLICATION_ERROR(-20999,:P84_USERNAME || ''~~'' || :P84_CC_EMP);',
'    UPDATE appl_users',
'    SET',
'        appluser_password = func_get_hash(:P84_USERNAME, :P84_CONFIRM_PASSWORD),',
'        appluser_lock_chk = ''N'',',
'        appluser_login_atm = 0,',
'        appluser_pw_lud = trunc(sysdate),',
'        appluser_pwd_exp_due = v_pwd_exp_date,',
'        appluser_upd_by = :P84_USERNAME,',
'        appluser_upd_date = sysdate',
'    WHERE appluser_id = :P84_USERNAME',
'      AND appluser_emp_id = :P84_CC_EMP;',
'CLOSE C1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6191695030112663337)
,p_process_success_message=>'Password Updated successfully.'
,p_internal_uid=>709735718082052315
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6191698369031663345)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OTP'
,p_static_id=>'otp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P84_CONDITION := ''PASS'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6191693927340663331)
,p_internal_uid=>709736533488052317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6191698030885663345)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND OTP'
,p_static_id=>'send-otp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- RAISE_APPLICATION_ERROR(-20999,:P84_ADDRESS||''~''||:P84_CC_EMP);',
'DECLARE',
'    v_username          VARCHAR2(15);',
'    v_emp_id            VARCHAR2(10);',
'    v_cc_emp            VARCHAR2(10);',
'BEGIN',
'',
'v_cc_emp := :P84_CC_EMP;',
'',
'IF v_cc_emp IS NOT NULL THEN',
'    SELECT',
'     appluser_id,appluser_emp_id INTO v_username,v_emp_id',
'    FROM',
'        employees,appl_users',
'    WHERE emp_bu = appluser_bu',
'    AND  emp_emp_id = appluser_emp_id',
'    AND ((UPPER(appluser_id) = UPPER(:p84_address) AND appluser_emp_id = :P84_CC_EMP) OR emp_off_mobile_no = :p84_address OR emp_off_email_id = :p84_address);',
'',
'ELSE    ',
'    SELECT',
'     appluser_id,appluser_emp_id INTO v_username,v_emp_id',
'    FROM',
'        employees,appl_users',
'    WHERE emp_bu = appluser_bu',
'    AND  emp_emp_id = appluser_emp_id',
'    AND (UPPER(appluser_id) = UPPER(:p84_address) OR emp_off_mobile_no = :p84_address OR emp_off_email_id = :p84_address);',
'',
'END IF;',
'--     RAISE_APPLICATION_ERROR(-20999,v_username||''~1''||v_emp_id||''~2''||:GLOBAL_DEVICE_TYPE||''~3''||:GLOBAL_IP_ADDR||''~4''||v(''app_id'')||''~5''||:P84_TYPE);',
'',
'    proc_forgot_pass_otp_apex (v_username,v_emp_id,:GLOBAL_DEVICE_TYPE,:GLOBAL_IP_ADDR,v(''app_id''),:P84_TYPE);',
'',
'    IF :P84_TYPE = ''M'' THEN',
'        :P84_SUCCESS_MSG := ''OTP Sent to your mail.'';',
'    ELSE',
'        :P84_SUCCESS_MSG := ''OTP Sent to your Phone number.'';',
'    END IF;',
'',
'    :P84_CONDITION := ''OTP'';',
'    :P84_USERNAME := v_username;',
'    :P84_CC_EMP   := v_emp_id;',
'',
'    EXCEPTION WHEN OTHERS THEN',
'    :P84_CONDITION := ''MAIN'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6191691923144663310)
,p_process_success_message=>'&P84_SUCCESS_MSG.'
,p_internal_uid=>709736195342052317
);
wwv_flow_imp.component_end;
end;
/
