prompt --application/pages/page_00106
begin
--   Manifest
--     PAGE: 00106
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
 p_id=>106
,p_name=>'Login page - Intermediate'
,p_alias=>'LOGIN-PAGE-INTERMEDIATE'
,p_step_title=>'Login page - Intermediate'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function viewPassword()',
'{',
'  var passwordInput = document.getElementById(''P9999_PASSWORD'');',
'  var passStatus = document.getElementById(''pass-status'');',
'',
'  if (passwordInput.type == ''password''){',
'    passwordInput.type=''text'';',
'    passStatus.className=''fa fa-eye-slash field-icon'';',
'    ',
'  }',
'  else{',
'    passwordInput.type=''password'';',
'    passStatus.className=''fa fa-eye field-icon'';',
'  }',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Current*/',
'.t-Login-container {',
'    display: flex;',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    flex-direction: column;',
'    padding-left: 8px;',
'    padding-right: 8px;',
'    max-width: 100%;',
'    background-size: cover !important;',
'   //background: url("#APP_IMAGES#stock1.jfif");',
' //  background: url("#APP_IMAGES#ERPPageD1-min.png");',
'  background:  url("#APP_IMAGES#bg_12.jpg"); //url("#APP_IMAGES#cover1.jpg"); // url("#APP_IMAGES#bg_12.jpg");   //url("#APP_IMAGES#bg_11.webp");',
' //background-image: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);',
'  //background: url("#APP_IMAGES#globe.jfif");    ',
'  	',
'    ',
'}',
'',
'',
'',
'',
'.t-Login-buttons .t-Button {',
'    display: block;',
'    width: 100%;',
'    padding: 16px 24px;',
'    font-size: 16px;',
'    line-height: 6px;',
'}',
'.t-Login-region {',
'    background-color:  #9ac1e9b8;',
'    box-shadow: 0 8px 24px -4px rgb(0 0 0 / 0%), 0 0 0 1px rgb(0 0 0 / 0%);',
'    padding-top: 12px;',
'    padding-left: 39px;',
'    padding-right: 39px;',
'    padding-bottom:39px;',
'}',
'',
'.field-icon {',
'    right : 30px;',
'    margin-left: -25px;',
'    margin-top: 14px;',
'    position: relative;',
'    z-index: 2;',
'}',
'',
'',
'/*.row {',
'    margin-right: -8px;',
'    margin-left: -8px;',
'    background: rgb(0 0 0 / 32%);',
'    border-radius: 35px;',
'}*/',
'',
'.row {',
'    margin-right: -8px;',
'    margin-left: -8px;',
'    background: rgb(0 0 0 / 5%);',
'    border-radius: 35px;',
'}',
'',
'.t-Form-radioLabel, .t-Form-inputContainer .radio_group label, .t-Form-checkboxLabel, .t-Form-inputContainer .checkbox_group label, .t-Form-label, .u-Form-label {',
'    color: #f0f0f0;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: goldenrod;',
'    color: #ffffff;',
'}',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: goldenrod;',
'}',
'',
'.t-Login-region--headerTitle .t-Login-title {',
'    margin-top: 0;',
'    color: white;',
'}',
'',
'.apex-item-checkbox .apex-item-option input+label {',
'    padding-left: 2.2rem;',
'    padding-right: .8rem;',
'    color: black;',
'    display: inline-block;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650470393802505303)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_deep_linking=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11045027158412575582)
,p_plug_name=>'<center><img src=#APP_IMAGES#RoadmapERP_Logo.png alt="Img" width="220" height="70"></center>'
,p_static_id=>'center-img-src-app-images-roadmaperp-logo-png-alt-img-width-220-height-70-center'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#:t-Login-region--headerTitle'
,p_plug_template=>wwv_flow_imp.id(10650516346407505362)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11045031846036575599)
,p_plug_name=>'Language Selector'
,p_static_id=>'language-selector'
,p_parent_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6727539160614234255)
,p_plug_name=>'Login  Alert'
,p_static_id=>'login-alert'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<font style="font-size: 12px; font-weight: 700; color:black;">Same User Already Logged In, Do you want to continue?</font>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5876566970719884554)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b>Login</b>'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5876566240868884551)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6727539160614234255)
,p_button_name=>'Okay'
,p_static_id=>'okay'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Okay'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5876577207963884576)
,p_branch_name=>'Go To Page 106'
,p_branch_action=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.::P106_USERNAME,P106_PASSWORD:,&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6774632277924199556)
,p_name=>'P106_PAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5876567798385884556)
,p_name=>'P106_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_post_element_text=>'<span id="pass-status" class="fa fa-eye field-icon" aria-hidden="true" onClick="viewPassword()"></span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5876568162053884557)
,p_name=>'P106_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_prompt=>'Remember Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_display_when=>'apex_authentication.persistent_cookies_enabled '
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5876569099284884560)
,p_name=>'P106_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5876567361861884554)
,p_name=>'P106_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11045027158412575582)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5876570238924884565)
,p_validation_name=>'pass_must'
,p_static_id=>'pass-must'
,p_validation_sequence=>20
,p_validation=>'P106_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Password must be enter.'
,p_associated_item=>wwv_flow_imp.id(5876567798385884556)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5876569921001884563)
,p_validation_name=>'Username_must'
,p_static_id=>'username-must'
,p_validation_sequence=>10
,p_validation=>'P106_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'UserName must be enter.'
,p_associated_item=>wwv_flow_imp.id(5876567361861884554)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6759757490245498286)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P106_PASSWORD'
,p_condition_element=>'P106_PASSWORD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6759757632080498287)
,p_event_id=>wwv_flow_imp.id(6759757490245498286)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5876576232425884576)
,p_name=>'Open_Region'
,p_static_id=>'open-region'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5876566970719884554)
,p_condition_element=>'P106_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'STOP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5876576638104884576)
,p_event_id=>wwv_flow_imp.id(5876576232425884576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6727539160614234255)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5876575307330884574)
,p_name=>'Page_Type'
,p_static_id=>'page-type'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P106_USERNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5876575820926884574)
,p_event_id=>wwv_flow_imp.id(5876575307330884574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P106_TYPE',
  'items_to_submit', 'P106_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P106_USERNAME IS NOT NULL THEN',
    '',
    'DECLARE',
    '   CURSOR c1',
    '   IS',
    '      SELECT *',
    '        FROM APEX_WORKSPACE_SESSIONS',
    '       WHERE     USER_NAME = :P106_USERNAME',
    '             AND USER_NAME NOT LIKE ''%ADMIN%''',
    '             AND workspace_name = ''RMQC27'';',
    '',
    '   cr1   c1%ROWTYPE;',
    'BEGIN',
    '   OPEN c1;',
    '',
    '   FETCH c1 INTO cr1;',
    '',
    '   IF c1%NOTFOUND',
    '   THEN',
    '      :P106_TYPE := ''S'';',
    '   ELSE',
    '      :P106_TYPE := ''STOP'';',
    '   END IF;',
    '',
    '   CLOSE c1;',
    'END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5876572586594884567)
,p_name=>'Session Alert'
,p_static_id=>'session-alert'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5876566970719884554)
,p_condition_element=>'P106_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'STOP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5876573093491884568)
,p_event_id=>wwv_flow_imp.id(5876572586594884567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.confirm( "Same User Already Logged In, Do you want to continue?",''OK'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5876573487285884570)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5876566970719884554)
,p_condition_element=>'P106_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5876574027116884570)
,p_event_id=>wwv_flow_imp.id(5876573487285884570)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5876574350069884570)
,p_name=>'Submit_Null'
,p_static_id=>'submit-null'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5876566970719884554)
,p_condition_element=>'P106_TYPE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5876574843573884571)
,p_event_id=>wwv_flow_imp.id(5876574350069884570)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5876572197159884567)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>394610361616273539
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5876571775787884567)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P106_USERNAME := apex_authentication.get_login_username_cookie;',
':P106_REMEMBER := case when :P106_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>394609940244273539
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5876570630361884565)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Kill_Session'
,p_static_id=>'kill-session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P106_TYPE=''STOP'' THEN',
'',
'BEGIN',
'   FOR CR1',
'      IN (SELECT *',
'            FROM APEX_WORKSPACE_SESSIONS',
'           WHERE     USER_NAME = :P106_USERNAME',
'                 AND workspace_name = ''RMQC27''',
'                 AND apex_session_id <> :SESSION)',
'   LOOP',
'      DELETE FROM APEX_240200.wwv_flow_sessions$',
'            WHERE id = cr1.apex_session_id;',
'   END LOOP;',
'',
'   COMMIT;',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5876566240868884551)
,p_internal_uid=>394608794818273537
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5876571025912884565)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'apex_authentication.login( p_username => :P106_USERNAME,',
'                           p_password => :P106_PASSWORD ) ;',
'',
':P106_TYPE:=null;',
'',
':GLOBAL_P:=cryptit.ENCRYPT(:P106_PASSWORD);',
'',
'DECLARE',
'   v_user_type   VARCHAR2 (2);',
'BEGIN',
'   SELECT appluser_user_type',
'     INTO v_user_type',
'     FROM appl_users',
'    WHERE appluser_id = :P106_USERNAME;',
'',
'   IF v_user_type = ''S''',
'   THEN',
'      :P4_NODE := ''1000030'';',
'      :P4_NODE_DESC := ''Supplier Portal'';',
'   ELSIF v_user_type = ''C''',
'   THEN',
'      :P4_NODE := ''1000045'';',
'      :P4_NODE_DESC := ''Customer Portal'';',
'   ELSE',
'      :P4_NODE := NULL;',
'   END IF;',
'EXCEPTION',
'   WHEN NO_DATA_FOUND',
'   THEN',
'      NULL;',
'END;',
'*/',
'',
'DECLARE',
'   v_cc_user   VARCHAR2 (20);',
'BEGIN',
'',
'   SELECT appluser_emp_id',
'     INTO v_cc_user',
'     FROM appl_users',
'    WHERE appluser_id = :P106_USERNAME;',
'',
'APEX_SESSION_STATE.SET_VALUE (',
'    ''p9999_username'',',
'    :P106_USERNAME );',
'',
'APEX_SESSION_STATE.SET_VALUE (',
'    ''P9999_PASSWORD'',',
'    :P106_PASSWORD );',
'',
'APEX_SESSION_STATE.SET_VALUE (',
'    ''P9999_CC_EMP_ID'',',
'    v_cc_user );',
'',
'        apex_authentication.login (p_username   => :P106_USERNAME,',
'                                   p_password   => :P106_PASSWORD); ',
'',
'        :GLOBAL_CC_EMP_ID := v_cc_user;',
'        ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>394609190369273537
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5876571366266884565)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P106_USERNAME),',
'    p_consent  => :P106_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>394609530723273537
);
wwv_flow_imp.component_end;
end;
/
