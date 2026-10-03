prompt --application/pages/page_121098
begin
--   Manifest
--     PAGE: 121098
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
 p_id=>121098
,p_name=>'Update Password'
,p_alias=>'UPDATE-PASSWORD'
,p_page_mode=>'MODAL'
,p_step_title=>'Update Password'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5644693176412820363)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P121098_CONDITION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7257668041192651546)
,p_plug_name=>'PASSWORD'
,p_static_id=>'password'
,p_icon_css_classes=>'fa-commenting'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--warning:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source=>'<center><h4>Reset Password</h4><br><p>Please Enter your new password</p></center>'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P121098_CONDITION'
,p_plug_display_when_cond2=>'PASS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5959188756435682335)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7257668041192651546)
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
 p_id=>wwv_flow_imp.id(5956151016974428087)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5956150610750428085)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5644693395492820365)
,p_name=>'P121098_CONDITION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7257673025334651579)
,p_name=>'P121098_CONFIRM_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7257668041192651546)
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
 p_id=>wwv_flow_imp.id(6118881517654637410)
,p_name=>'P121098_DL_ADR_PAN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_prompt=>'DL / Aadhaar / PAN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6118881271479637408)
,p_name=>'P121098_DOB'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_prompt=>'Date of Birth'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6118881188127637407)
,p_name=>'P121098_EMP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_prompt=>'Emp. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7257673149168651580)
,p_name=>'P121098_NEW_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7257668041192651546)
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
 p_id=>wwv_flow_imp.id(6118881057926637406)
,p_name=>'P121098_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_prompt=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6118881438001637409)
,p_name=>'P121098_YOJ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5644693176412820363)
,p_prompt=>'Year of Joining'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5757826282077772642)
,p_validation_name=>'Confirm Password'
,p_static_id=>'confirm-password'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_NEW_PASSWORD <> :P121098_CONFIRM_PASSWORD THEN',
'   RETURN (''New Password and Confirm Password must be same.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5959188756435682335)
,p_associated_item=>wwv_flow_imp.id(7257673025334651579)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5757826175997772641)
,p_validation_name=>'DL_ADR_PAN'
,p_static_id=>'dl-adr-pan'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_DL_ADR_PAN IS NULL THEN ',
'   RETURN (''Employee ID Card No. must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6118881517654637410)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5757825966197772639)
,p_validation_name=>'DOB'
,p_static_id=>'dob'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_DOB IS NULL THEN ',
'   RETURN (''Date of Birth must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6118881271479637408)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5644693617403820367)
,p_validation_name=>'Emp. ID'
,p_static_id=>'emp-id'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_EMP_ID IS NULL THEN ',
'   RETURN (''Employee ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6118881188127637407)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5644693519230820366)
,p_validation_name=>'User Name'
,p_static_id=>'user-name'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_USER_NAME IS NULL THEN',
'   RETURN (''Username must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6118881057926637406)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5757826091339772640)
,p_validation_name=>'YOJ'
,p_static_id=>'yoj'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P121098_YOJ IS NULL THEN ',
'   RETURN (''Year of Joining must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6118881438001637409)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5956153473262428092)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5956151016974428087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5956154009246428092)
,p_event_id=>wwv_flow_imp.id(5956153473262428092)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P121098_USER_NAME,P121098_EMP_ID,P121098_DOB,P121098_YOJ,P121098_DL_ADR_PAN'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5959438708380686017)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHANGE PASSWORD'
,p_static_id=>'change-password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM policy_data',
'       WHERE pda_bu = :Global_bu;',
'',
'   CURSOR c2',
'   IS',
'      SELECT appluser_password',
'        FROM appl_users',
'       WHERE appluser_id = :P121098_USER_NAME',
'             AND appluser_emp_id = :P121098_EMP_ID;',
'',
'   cr1              c1%ROWTYPE;',
'   cr2              c2%ROWTYPE;',
'   v_pwd_exp_date   DATE;',
'BEGIN',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'',
'   OPEN c2;',
'   FETCH c2 INTO cr2;',
'',
'   IF cr1.pda_pw_exp_rqrd IN (''Y'') AND cr1.pda_pw_exp_days > 0',
'   THEN',
'      v_pwd_exp_date := (TRUNC (SYSDATE) + cr1.pda_pw_exp_days) - 1;',
'   ELSE',
'      v_pwd_exp_date := NULL;',
'   END IF;',
'',
'   -- RAISE_APPLICATION_ERROR(-20999,:P121098_USERNAME || ''~~'' || :P121098_CC_EMP);',
'   UPDATE appl_users',
'      SET appluser_password = func_get_hash (:P121098_USER_NAME, :P121098_CONFIRM_PASSWORD),',
'          appluser_lock_chk = ''N'',',
'          appluser_login_atm = 0,',
'          appluser_pw_lud = TRUNC (SYSDATE),',
'          appluser_pwd_exp_due = v_pwd_exp_date,',
'          appluser_upd_by = :P121098_USER_NAME,',
'          appluser_upd_date = SYSDATE',
'    WHERE appluser_id = :P121098_USER_NAME',
'          AND appluser_emp_id = :P121098_EMP_ID;',
'',
'   INSERT INTO OTP_DETAILS (OD_USER,',
'                            OD_EMP_ID,',
'                            OD_TYPE,',
'                            OD_OTP_SOURCE,',
'                            OD_DEVICE_TYPE,',
'                            OD_IP_ADDRESS,',
'                            OD_APPLICATION,',
'                            OD_DOB,',
'                            OD_YOJ,',
'                            OD_DL_ADR_PAN,',
'                            OD_STATUS)',
'        VALUES (:P121098_USER_NAME,',
'                :P121098_EMP_ID,',
'                ''RESET'',',
'                ''D'',',
'                :GLOBAL_DEVICE_TYPE,',
'                :GLOBAL_IP_ADDR,',
'                v (''app_id''),',
'                TO_DATE (:P121098_DOB, ''DD-MM-YYYY''),',
'                :P121098_YOJ,',
'                :P121098_DL_ADR_PAN,',
'                ''S'');',
'',
'   CLOSE C2;',
'   CLOSE C1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5959188756435682335)
,p_process_success_message=>'Password Updated successfully.'
,p_internal_uid=>477476872837074989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5956153089280428088)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation'
,p_static_id=>'validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  CURSOR c1',
'      IS',
'   SELECT * ',
'     FROM appl_users',
'    WHERE appluser_id = :P121098_USER_NAME ;',
'',
'  CURSOR c2',
'      IS',
'  SELECT * ',
'    FROM appl_users',
'   WHERE appluser_id     = :P121098_USER_NAME',
'     AND appluser_status = ''A'';',
'',
'  CURSOR c3',
'      IS',
'  SELECT emp_dl_id,',
'         emp_it_pan_no,',
'         emp_aadhaar_no,',
'         emp_emp_id,',
'         emp_start_date,',
'         emp_dob ',
'    FROM employees,appl_users ',
'   WHERE appluser_bu      = emp_bu',
'     AND appluser_emp_id  = emp_emp_id',
'     AND appluser_id      = :P121098_USER_NAME',
'	 AND emp_emp_id       = :P121098_EMP_ID ;',
'		   ',
'cr1				c1%rowtype;',
'cr2				c2%rowtype;',
'cr3				c3%rowtype;',
'		   ',
'BEGIN',
'  OPEN c1;',
'    FETCH c1 INTO cr1;',
'      IF c1%notfound THEN',
'         raise_application_error(-20999,''User does not exist.'');',
'      END IF;',
'  CLOSE c1;',
'',
'  OPEN c2;',
'    FETCH c2 INTO cr2;',
'      IF c2%notfound THEN',
'         raise_application_error(-20999,''User is not active.'');',
'      END IF;',
'  CLOSE c2;',
'',
'  OPEN c3;',
'    FETCH c3 INTO cr3;',
'      IF c3%notfound THEN',
'         raise_application_error(-20999,''Employee does not exist.'');',
'      END IF;',
'',
'      IF TO_DATE(cr3.emp_dob,''DD-MM-RRRR'') <> TO_DATE(:P121098_DOB,''DD-MM-RRRR'') THEN',
'         raise_application_error(-20999,''Date of Birth is Incorrect.'');',
'      END IF;',
'',
'      IF TO_CHAR(cr3.emp_start_date,''RRRR'') <> :P121098_YOJ THEN',
'         raise_application_error(-20999,''Year of Joining is Incorrect.'');',
'      END IF;',
'/*',
'      IF cr3.emp_dl_id <> :P121098_DL_ADR_PAN THEN',
'         raise_application_error(-20999,''Driving License No. is Incorrect.'');',
'      ELSIF cr3.emp_aadhaar_no <> :P121098_DL_ADR_PAN THEN',
'         raise_application_error(-20999,''Aadhaar No. is Incorrect.'');',
'      ELSIF cr3.emp_it_pan_no <> :P121098_DL_ADR_PAN THEN',
'         raise_application_error(-20999,''PAN No. is Incorrect.'');',
'      END IF;',
'*/',
'',
'      IF cr3.emp_dl_id <> :P121098_DL_ADR_PAN AND cr3.emp_aadhaar_no <> :P121098_DL_ADR_PAN AND cr3.emp_it_pan_no <> :P121098_DL_ADR_PAN THEN',
'         raise_application_error(-20999,''Employee ID Card No. is Incorrect.'');',
'      END IF;',
'',
'  CLOSE c3;',
'',
'  :P121098_CONDITION := ''PASS'';',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5956150610750428085)
,p_internal_uid=>474191253736817060
);
wwv_flow_imp.component_end;
end;
/
