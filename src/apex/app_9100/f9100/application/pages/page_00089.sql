prompt --application/pages/page_00089
begin
--   Manifest
--     PAGE: 00089
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
 p_id=>89
,p_name=>'Grant/Revoke Bus. Fun./Unit Access/POS User Access'
,p_alias=>'GRANT-REVOKE-BUS-FUN-UNIT-ACCESS'
,p_step_title=>'Grant/Revoke Bus. Fun./Unit Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'@media (max-width: 640px) {',
'    .apex-item-group--rc .apex-item-option:first-child:nth-last-child(2), ',
'    .apex-item-group--rc .apex-item-option:first-child:nth-last-child(2)~.apex-item-option {',
'        width: 50%;',
'        padding-left: 33px;',
'    }',
'}',
'',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(255, 255, 255, 0.15)',
'};',
'',
'',
'#cancelbtn{',
'        color: rgb(214, 19, 29);',
'        background-color:  #ffffff;',
'}',
'',
'#cancelbtn1{',
'         color: rgb(214, 19, 29);',
'         background-color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8035880899059526130)
,p_plug_name=>'Alert'
,p_static_id=>'alert'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7376567444040570729)
,p_plug_name=>'TYPE'
,p_static_id=>'type'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8005490107314545560)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7376567444040570729)
,p_button_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button N'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8005490491487545564)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7376567444040570729)
,p_button_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button Y'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3647179311286146051)
,p_branch_name=>'Go to Doc. Mgmt.'
,p_branch_action=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>100
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'A'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5644691016797820341)
,p_branch_name=>'Go to POS User'
,p_branch_action=>'f?p=&APP_ID.:1171997:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>80
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'P'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5660490878595517903)
,p_branch_name=>'Go To Role Access'
,p_branch_action=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'R'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5863768525640849442)
,p_branch_name=>'Go to ESS Bus. Fun.'
,p_branch_action=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'E'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6307358105731716903)
,p_branch_name=>'Go to Favourites'
,p_branch_action=>'f?p=&APP_ID.:2111320161:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>60
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'F'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6962748302396841685)
,p_branch_name=>'Go to Mobile App'
,p_branch_action=>'f?p=&APP_ID.:207:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>90
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'M'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6991673881124103003)
,p_branch_name=>'Go to Mobile App'
,p_branch_action=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'M'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7376567752810570732)
,p_branch_name=>'Go To Bus. Fun. Access'
,p_branch_action=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'B'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7376567895024570733)
,p_branch_name=>'Go To Unit Access'
,p_branch_action=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'U'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8026287391739097144)
,p_branch_name=>'Go To Dashboard'
,p_branch_action=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>70
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P89_TYPE'
,p_branch_condition_text=>'D'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8035881130871526132)
,p_name=>'P89_ALERT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7376567444040570729)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8005489866620545558)
,p_name=>'P89_FAVOURITE_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7376567444040570729)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(wubfa_user_fav,''Y'')',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE wubfa_user_id    = :GLOBAL_USER',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_page_no      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7376567553744570730)
,p_name=>'P89_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7376567444040570729)
,p_use_cache_before_default=>'NO'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Bus. Fun.;B,Unit / Location;U,Role Access;R,Notification;D,Favourites;F,ESS Bus. Fun.;E,Mobile App Bus. Fun.;M,Doc. Mgmt. Access;A'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-top-md:margin-left-lg'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8005490147309545561)
,p_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8005490107314545560)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005490302380545562)
,p_event_id=>wwv_flow_imp.id(8005490147309545561)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P89_FAVOURITE_FLAG',
  'items_to_submit', 'P89_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P89_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005490434403545563)
,p_event_id=>wwv_flow_imp.id(8005490147309545561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P89_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8005490597584545565)
,p_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8005490491487545564)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005490723950545566)
,p_event_id=>wwv_flow_imp.id(8005490597584545565)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P89_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P89_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005490818038545567)
,p_event_id=>wwv_flow_imp.id(8005490597584545565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P89_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8005490906912545568)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P89_FAVOURITE_FLAG'
,p_condition_element=>'P89_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005491053607545570)
,p_event_id=>wwv_flow_imp.id(8005490906912545568)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005490491487545564)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005491173855545571)
,p_event_id=>wwv_flow_imp.id(8005490906912545568)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005490107314545560)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005490959801545569)
,p_event_id=>wwv_flow_imp.id(8005490906912545568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005490491487545564)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005491313424545572)
,p_event_id=>wwv_flow_imp.id(8005490906912545568)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005490107314545560)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8035881308860526134)
,p_name=>'Type'
,p_static_id=>'type'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P89_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8035881571267526137)
,p_event_id=>wwv_flow_imp.id(8035881308860526134)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-alert'
,p_action=>'NATIVE_ALERT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', 'User Dashboard Access Must Be  Enabled.')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P89_ALERT'
,p_client_condition_expression=>'ALERT'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8035881506701526136)
,p_event_id=>wwv_flow_imp.id(8035881308860526134)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8035880964595526131)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :GLOBAL_LOGIN_PAGE = ''61'' THEN',
'   :P89_ALERT := ''ALERT'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2553919129051915103
);
wwv_flow_imp.component_end;
end;
/
