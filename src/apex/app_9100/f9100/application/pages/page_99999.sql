prompt --application/pages/page_99999
begin
--   Manifest
--     PAGE: 99999
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
 p_id=>99999
,p_name=>'Login Page (Old) Don''t Delete --Vijayraj'
,p_alias=>'LOGIN-PAGE-OLD-DON-T-DELETE-VIJAYRAJ'
,p_step_title=>'Login Page (Old) Don''t Delete --Vijayraj'
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
'    background:  url("#APP_IMAGES#00-01.jpg");///url("#APP_IMAGES#00000-01.jpg");  ',
'  	',
'}',
'',
'.t-Login-containerBody {',
'    flex-grow: 0;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    display: block;',
'    flex-direction: column;',
'    margin-top: auto;',
'    margin-bottom: auto;',
'    align-items: left;',
'}',
'',
'',
'.t-Login-buttons .t-Button {',
'    display: block;',
'    width: 100%;',
'    padding: 16px 24px;',
'    font-size: 16px;',
'    line-height: 6px;',
'}',
'',
'.t-Login-region {',
'    background-color:  #d1ecff0d; ',
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
'.row {',
'    margin-right: -8px;',
'    margin-left: -8px;',
'    //background: rgb(0 0 0 / 5%);',
'    border-radius: 35px;',
'}',
'',
'.t-Form-radioLabel, .t-Form-inputContainer .radio_group label, .t-Form-checkboxLabel, .t-Form-inputContainer .checkbox_group label, .t-Form-label, .u-Form-label {',
'    color: #f0f0f0;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #007aff;//goldenrod;',
'    color: #ffffff;',
'}',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #007aff;//goldenrod;',
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
'}',
'',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650470393802505303)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11359331292925125879)
,p_plug_name=>'<center><img src=#APP_IMAGES#RoadmapERP_Logo.png alt="Img" width="220" height="70"></center>'
,p_static_id=>'center-img-src-app-images-roadmaperp-logo-png-alt-img-width-220-height-70-center'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#:t-Login-region--headerHidden:margin-top-lg:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650516346407505362)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7792180773551151529)
,p_plug_name=>'Language Selector'
,p_static_id=>'language-selector'
,p_parent_plug_id=>wwv_flow_imp.id(11359331292925125879)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7041843295126784552)
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
 p_id=>wwv_flow_imp.id(6190688106335231592)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11359331292925125879)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b>Login</b>'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190687264935231568)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7041843295126784552)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7792184903288151748)
,p_name=>'P99999_LANGUAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7792180773551151529)
,p_prompt=>'LANGUAGE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:English;en,French;fr,Chinese (Simplified);zh,Thai;th,Japanese;ja'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-language'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7792182352258151704)
,p_name=>'P99999_NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11359331292925125879)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11359333877711126060)
,p_name=>'P99999_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11359331292925125879)
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
 p_id=>wwv_flow_imp.id(11359334987784126065)
,p_name=>'P99999_REMEMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11359331292925125879)
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
 p_id=>wwv_flow_imp.id(7041183371965089971)
,p_name=>'P99999_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11359331292925125879)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11359333394631126058)
,p_name=>'P99999_USERNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11359331292925125879)
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
 p_id=>wwv_flow_imp.id(6190691811694231742)
,p_validation_name=>'pass_must'
,p_static_id=>'pass-must'
,p_validation_sequence=>20
,p_validation=>'P99999_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Password must be enter.'
,p_associated_item=>wwv_flow_imp.id(11359333877711126060)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6190691533190231740)
,p_validation_name=>'Username_must'
,p_static_id=>'username-must'
,p_validation_sequence=>10
,p_validation=>'P99999_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'UserName must be enter.'
,p_associated_item=>wwv_flow_imp.id(11359333394631126058)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190698424963231770)
,p_name=>'Open_Region'
,p_static_id=>'open-region'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190688106335231592)
,p_condition_element=>'P99999_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'STOP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190698911815231771)
,p_event_id=>wwv_flow_imp.id(6190698424963231770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7041843295126784552)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190697512428231768)
,p_name=>'Page_Type'
,p_static_id=>'page-type'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P99999_USERNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190698021925231770)
,p_event_id=>wwv_flow_imp.id(6190697512428231768)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P99999_TYPE',
  'items_to_submit', 'P99999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P99999_USERNAME IS NOT NULL THEN',
    '',
    'DECLARE',
    '',
    'CURSOR c1 IS',
    'SELECT *',
    '  FROM APEX_WORKSPACE_SESSIONS',
    'WHERE USER_NAME=:P99999_USERNAME AND USER_NAME NOT LIKE ''%ERPADMIN%'' AND workspace_name=''ERP'' ;',
    '',
    'cr1 c1%rowtype;',
    'BEGIN',
    '',
    'OPEN c1;',
    'FETCH c1 INTO cr1;',
    '',
    'IF c1%NOTFOUND THEN',
    ':P99999_TYPE:=''S'';',
    'ELSE ',
    ':P99999_TYPE:=''STOP'';',
    'END IF;',
    '',
    '',
    'CLOSE c1;',
    '',
    'END;',
    '',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190694821778231754)
,p_name=>'Session Alert'
,p_static_id=>'session-alert'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190688106335231592)
,p_condition_element=>'P99999_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'STOP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190695299305231759)
,p_event_id=>wwv_flow_imp.id(6190694821778231754)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.confirm( "Same User Already Logged In, Do you want to continue?",''OK'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190695700085231765)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190688106335231592)
,p_condition_element=>'P99999_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190696212924231765)
,p_event_id=>wwv_flow_imp.id(6190695700085231765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'SUBMIT',
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190696623196231767)
,p_name=>'Submit_Null'
,p_static_id=>'submit-null'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190688106335231592)
,p_condition_element=>'P99999_TYPE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190697118447231767)
,p_event_id=>wwv_flow_imp.id(6190696623196231767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'SUBMIT',
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190694422430231751)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>708732586886620723
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190692346659231746)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Format Mask Insert'
,p_static_id=>'format-mask-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 3/11/2022 4:49:14 PM (QP5 v5.163.1008.3004) */',
' --Raise_application_error(-20999,''test''||:global_bu);',
'',
'DECLARE',
'   v_color   VARCHAR2 (10) := :GLOBAL_COLOR; --''#0b447c'';',
'   v_rpt_color   VARCHAR2 (10) := :GLOBAL_RPT_COLOR; --''#0b447c'';',
'   v_rpt_fnt_color   VARCHAR2 (10) := :GLOBAL_RPT_FNT_COLOR;--''#0b447c'';',
'',
'   CURSOR C1',
'   IS',
'      SELECT *',
'        FROM mis_amt_type',
'       WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'',
'   CURSOR c2',
'   IS',
'      SELECT MAT_COLOR',
'        FROM mis_amt_type',
'       WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'',
'   CR1       C1%ROWTYPE;',
'   CR2       C2%ROWTYPE;',
'BEGIN',
' OPEN C1;',
'',
'   FETCH C1 INTO CR1;',
'',
'   IF C1%NOTFOUND',
'   THEN',
'',
'   OPEN c2;',
'',
'   FETCH c2 INTO cr2;',
'--Raise_application_error(-20999,cr2.mat_color);',
'   IF cr2.mat_color IS NULL',
'   THEN',
'      v_color := ''#0b447c'';',
'   ELSE',
'      v_color := :GLOBAL_COLOR;',
'   END IF;',
'',
'--Raise_application_error(-20999,''test''||v_color);',
' ',
'',
'  ',
'      ',
'',
'      INSERT INTO mis_amt_type',
'           VALUES (:global_bu,',
'                   :global_user,',
'                   ''L'',',
'                   100000,',
'                   SYSDATE,',
'                   ''999G999G999G999G999G999G990'',',
'                   ''99G99G99G99G99G99G99G99G990D00'',',
'                   ''999G999G999G999G999G999G990D00000000'',',
'                   ''R'',',
'                   v_color,',
'                   v_rpt_color,',
'                   v_rpt_fnt_color);',
'',
'      ',
'CLOSE c2;',
'COMMIT;',
'else',
'',
'',
'   update  mis_amt_type',
'   set MAT_COLOR  = v_color',
'   where  mat_bu = :global_bu AND mat_user = :global_user;',
'--Raise_application_error(-20999,''test''||V_COLOR);   ',
'   commit;',
'   END IF;',
'   CLOSE C1;',
'     ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>708730511115620718
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190693998788231749)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P99999_USERNAME := apex_authentication.get_login_username_cookie;',
':P99999_REMEMBER := case when :P99999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>708732163244620721
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190691998011231743)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_color'
,p_static_id=>'insert-color'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 3/12/2022 2:48:39 PM (QP5 v5.163.1008.3004) */',
'--raise_application_error(-20999,:GLOBAL_BU||''-''||:GLOBAL_USER);',
'DECLARE',
' CURSOR C1',
' is',
'   SELECT * FROM mis_amt_type',
'         WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'   ',
'   CR1   C1%ROWTYPE;',
'BEGIN',
'   OPEN C1;',
'   FETCH C1 into CR1;',
'    IF C1%NOTFOUND THEN',
'    INSERT INTO mis_amt_type (MAT_BU,',
'                          MAT_USER,',
'                          MAT_AMT_TYPE,',
'                          MAT_AMT_MASK,',
'                          MAT_CRE_DATE,',
'                          MAT_MASK,',
'                          MAT_MASK_COST,',
'                          MAT_MASK_EXCH,',
'                          MAT_RPT_TYPE,',
'                          MAT_COLOR,',
'                          MAT_RPT_COLOR,',
'                          MAT_RPT_FNT_COLOR)',
'     VALUES (:global_bu,',
'             :global_user,',
'             ''A'',',
'             1,',
'             SYSDATE,',
'             ''999G999G999G999G999G999G990'',',
'             ''99G99G99G99G99G99G99G99G990D00'',',
'             ''999G999G999G999G999G999G990D00000000'',',
'             ''R'',',
'             ''#0b447c'',',
'             ''#00b1e7'',',
'             ''#ffffff'');',
'',
'   COMMIT;',
'   END IF;',
'   --raise_application_error(-20999,cr1.MAT_COLOR||''-''||cr1.MAT_RPT_COLOR||''-''||cr1.MAT_RPT_FNT_COLOR);',
'   CLOSE C1;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>708730162467620715
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190692752277231746)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Kill_Session'
,p_static_id=>'kill-session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P99999_TYPE=''STOP'' THEN',
'BEGIN',
'',
'FOR CR1 IN  (SELECT *',
'  FROM APEX_WORKSPACE_SESSIONS',
'WHERE USER_NAME=:P99999_USERNAME AND workspace_name=''ERP'' AND apex_session_id<>:SESSION)',
'LOOP',
'',
'DELETE FROM apex_230100.wwv_flow_sessions$ WHERE  id=cr1.apex_session_id;',
'',
'END LOOP;',
'COMMIT;',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6190687264935231568)
,p_internal_uid=>708730916733620718
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190693200214231748)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 7/8/2022 8:51:03 PM (QP5 v5.163.1008.3004) */',
'BEGIN',
'',
'	/* MULIT-LANGUAGE */  ---Vijay Raj',
'	APEX_UTIL.SET_SESSION_LANG(:P99999_LANGUAGE);',
'	',
'   apex_authentication.login (p_username   => :P99999_USERNAME,',
'                              p_password   => :P99999_PASSWORD);',
'',
'   :P99999_TYPE := NULL;',
'',
'	',
'',
'   /*SENTHA',
'',
'',
'   DECLARE',
'      v_sid      NUMBER;',
'      v_serial   NUMBER;',
'       v_bu          VARCHAR2(10);',
'       v_user     VARCHAR2(15) := v(''app_user'');',
'   BEGIN',
'      SELECT SYS_CONTEXT (''userenv'', ''SID'') INTO v_sid FROM DUAL;',
'',
'      SELECT serial#',
'        INTO v_serial',
'        FROM sys.v_$session',
'       WHERE sid = v_sid;',
'',
'       SELECT appluser_bu INTO v_bu',
'           FROM appl_users',
'           WHERE appluser_id=v(''app_user'') ;',
'',
'      INSERT INTO login_audit_info (LAI_BU,',
'                                    LAI_LOGIN_AUDIT_NO,',
'                                    LAI_USER_ID,',
'                                    LAI_DATE_IN,',
'                                    LAI_DATE_OUT,',
'                                    LAI_IP_ADDR,',
'                                    LAI_LOGIN_USER,',
'                                    LAI_SID,',
'                                    LAI_SERIAL,',
'                                    LAI_PROCESS)',
'           VALUES (v_bu,',
'                        login_audit_seq.NEXTVAL,',
'                         v_user,',
'                        SYSDATE,',
'                        NULL,',
'                        SYS_CONTEXT (''USERENV'', ''IP_ADDRESS''),',
'                        :GLOBAL_USER,',
'                        :session,',
'                        v_serial,',
'                        NULL);',
'   END;',
'    */',
'',
'',
'',
'   :GLOBAL_P := cryptit.ENCRYPT (:P99999_PASSWORD);',
'',
'',
'',
'   DECLARE',
'      v_user_type   VARCHAR2 (2);',
'   BEGIN',
'      SELECT appluser_user_type',
'        INTO v_user_type',
'        FROM appl_users',
'       WHERE appluser_id = :P99999_USERNAME;',
'',
'      IF v_user_type = ''S''',
'      THEN',
'         :P4_NODE := ''1000030'';',
'         :P4_NODE_DESC := ''Supplier Portal'';',
'      ELSIF v_user_type = ''C''',
'      THEN',
'         :P4_NODE := ''1000045'';',
'         :P4_NODE_DESC := ''Customer Portal'';',
'      ELSE',
'         :P4_NODE := NULL;',
'      END IF;',
'   EXCEPTION',
'      WHEN NO_DATA_FOUND',
'      THEN',
'         NULL;',
'   END;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>708731364670620720
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6190693572504231749)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P99999_USERNAME),',
'    p_consent  => :P99999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>708731736960620721
);
wwv_flow_imp.component_end;
end;
/
