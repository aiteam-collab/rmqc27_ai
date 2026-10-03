prompt --application/pages/page_00091
begin
--   Manifest
--     PAGE: 00091
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
 p_id=>91
,p_name=>'Current Bus. Fun/Unit/Location Access'
,p_alias=>'CURRENT-BUS-FUN-UNIT-ACCESS'
,p_step_title=>'Current Bus. Fun/Unit/Location Access'
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
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 9px;',
'    margin-bottom: 9px;',
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
 p_id=>wwv_flow_imp.id(9305681083320246647)
,p_plug_name=>'TYPE'
,p_static_id=>'type'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>5
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8005491504711545574)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9305681083320246647)
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
 p_id=>wwv_flow_imp.id(8005491576645545575)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9305681083320246647)
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
 p_id=>wwv_flow_imp.id(3823322017754568332)
,p_branch_name=>'Go To Bus. Fun. Access Hist'
,p_branch_action=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P91_TYPE'
,p_branch_condition_text=>'BH'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3823897324854088831)
,p_branch_name=>'Go To Unit Access Hist'
,p_branch_action=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>60
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P91_TYPE'
,p_branch_condition_text=>'UH'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3823897402628088832)
,p_branch_name=>'Go To Role Access Hist'
,p_branch_action=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>70
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P91_TYPE'
,p_branch_condition_text=>'RH'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7411076509111288813)
,p_branch_name=>'Go To Bus. Fun. Access'
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P91_TYPE'
,p_branch_condition_text=>'B'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7411076769268289742)
,p_branch_name=>'Go To Unit Access'
,p_branch_action=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P91_TYPE'
,p_branch_condition_text=>'U'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8005491366325545573)
,p_name=>'P91_FAVOURITE_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9305681083320246647)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9305681816367246836)
,p_name=>'P91_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9305681083320246647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Bus. Fun. Access;B,Unit / Location Access;U,Bus. Fun. Access Hist;BH,Unit Location Access Hist;UH,Role Access Hist;RH'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '1',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8005491659381545576)
,p_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8005491504711545574)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8005491830440545577)
,p_event_id=>wwv_flow_imp.id(8005491659381545576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P91_FAVOURITE_FLAG',
  'items_to_submit', 'P91_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P91_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(8005491933772545578)
,p_event_id=>wwv_flow_imp.id(8005491659381545576)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P91_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8043455824452402829)
,p_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8005491576645545575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8043455847454402830)
,p_event_id=>wwv_flow_imp.id(8043455824452402829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P91_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P91_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(8043456024619402831)
,p_event_id=>wwv_flow_imp.id(8043455824452402829)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P91_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8043456098757402832)
,p_name=>'P91_FAVOURITE_FLAG'
,p_static_id=>'p91-favourite-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P91_FAVOURITE_FLAG'
,p_condition_element=>'P91_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8043456358213402835)
,p_event_id=>wwv_flow_imp.id(8043456098757402832)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005491504711545574)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8043456590071402837)
,p_event_id=>wwv_flow_imp.id(8043456098757402832)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005491576645545575)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8043456137411402833)
,p_event_id=>wwv_flow_imp.id(8043456098757402832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005491576645545575)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8043456729263402838)
,p_event_id=>wwv_flow_imp.id(8043456098757402832)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8005491504711545574)
);
wwv_flow_imp.component_end;
end;
/
