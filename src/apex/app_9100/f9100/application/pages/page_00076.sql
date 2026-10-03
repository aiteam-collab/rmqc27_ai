prompt --application/pages/page_00076
begin
--   Manifest
--     PAGE: 00076
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
 p_id=>76
,p_name=>'Find Bus. Fun. Usage'
,p_alias=>'FIND-BUS-FUN-USAGE'
,p_step_title=>'Find Bus. Fun. Usage'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region--accent6 > .t-Region-header {',
'    background-color: #dec553de;',
'    color: #2a2a08;',
'}',
'',
'.t-Form--labelsAbove .t-Form-fieldContainer .apex-item-select, .t-Form-fieldContainer--stacked .apex-item-select {',
'    max-width: 123%;',
'}',
'/* .t-Region-body {',
'    color: #6a3ebd;',
'    line-height: 0rem;',
'    font-size: 1rem;',
'} */',
'.t-Cards--cols .t-Cards-item {',
'    width: 109%;',
'}',
'.t-Cards--basic .t-Card-desc {',
'    font-size: 1.4rem;',
'    line-height: 20px;',
'    text-align: -webkit-center;',
'    color: darkcyan;',
'    font-weight: bold;',
'}',
'.t-Region-title {',
'    font-size: larger;',
'}',
'.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #fff;',
'}',
'',
'#addbtn{',
'        color: blue;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10401721265845430870)
,p_plug_name=>'<b>Find Bus. Fun. Usage</b>'
,p_static_id=>'b-find-bus-fun-usage-b'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent8:t-Region--scrollBody:t-Form--leftLabels:margin-top-lg'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6192951955425721053)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_parent_plug_id=>wwv_flow_imp.id(7776311976638584737)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11094458723187985705)
,p_plug_name=>'Find User '
,p_static_id=>'find-user'
,p_parent_plug_id=>wwv_flow_imp.id(7776311976638584737)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P76_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7776311976638584737)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_parent_plug_id=>wwv_flow_imp.id(10401721265845430870)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6203233653454692240)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6192951955425721053)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,74::'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6203233257569692240)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6192951955425721053)
,p_button_name=>'Filter'
,p_static_id=>'filter'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6203231250205692218)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6192953307278721066)
,p_branch_name=>'Go To Page 74'
,p_branch_action=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.::P74_APPLICATION_ID,P74_WORKSPACE_NAME,P74_USER_ID,P74_PAGE_ID,P74_PAGE_NAME,P74_TIMESTAMP:&P76_APPLICATION_ID.,&P76_WORKSPACE_NAME.,&P76_USER_ID.,&P76_PAGE_ID.,&P76_PAGE_NAME.,&P76_TIMESTAMP.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6203231250205692218)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952152145721055)
,p_name=>'P76_APPLICATION_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_prompt=>'<span style="color:#0480e9; ">Application ID</span>'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7290807417568727241)
,p_name=>'P76_PAGE_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_prompt=>'<span style="color:#0480e9; ">Page ID</span>'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952294692721056)
,p_name=>'P76_PAGE_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_prompt=>'<span style="color:#0480e9; ">Page Name</span>'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6802928989584674962)
,p_name=>'P76_TIMESTAMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<span style="color:#0480e9; ">Date</span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7283373773172383790)
,p_name=>'P76_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_prompt=>'<span style="color:#0480e9; ">User</span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_id',
'                            FROM appl_users ',
'                           WHERE appluser_bu = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'User')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192952047745721054)
,p_name=>'P76_WORKSPACE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11094458723187985705)
,p_prompt=>'<span style="color:#0480e9; ">Workspace Name</span>'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203241900117692263)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203242421011692265)
,p_event_id=>wwv_flow_imp.id(6203241900117692263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P76_USER_NAME,P76_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P76_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P76_USER_NAME = :P76_APPLUSER_ID THEN',
    '	    raise_application_error(-20999,''From and To Username should not be same.'');',
    '   END IF;',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id = :P76_USER_NAME;',
    '	 	     ',
    '	 	     cr1       c1%ROWTYPE;',
    '	 	     	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '                  raise_application_error(-20999,''User not found.'');',
    '	 	     ELSE',
    '	 	     	  ',
    '	 	     	  IF cr1.appluser_status IN (''N'', ''D'') THEN',
    '	 	     	  	 raise_application_error(-20999,''User not in active status.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     	  IF TRUNC(SYSDATE) NOT BETWEEN TRUNC(cr1.appluser_eff_from) AND TRUNC(cr1.appluser_eff_to) THEN',
    '	 	     	  	 raise_application_error(-20999,''Check To User Eff. From and Eff. To.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203241011429692263)
,p_name=>'EMP_NAME'
,p_static_id=>'emp-name'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203241525878692263)
,p_event_id=>wwv_flow_imp.id(6203241011429692263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT EMP_FIRST_NAME1 INTO :P76_EMP_NAME FROM EMPLOYEES',
    'WHERE EMP_BU = :GLOBAL_BU',
    'AND EMP_EMP_ID = :P76_APPLUSER_PARTY_ID;',
    '',
    'EXCEPTION WHEN no_data_found then',
    'NULL;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203243715313692268)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203244206787692268)
,p_event_id=>wwv_flow_imp.id(6203243715313692268)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P76_APPLUSER_PW_EXP_DAYS,P76_APPLUSER_PW_EXP_DAYS_1',
  'items_to_submit', 'P76_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P76_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P76_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P76_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203237392768692251)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6203233257569692240)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203237844062692256)
,p_event_id=>wwv_flow_imp.id(6203237392768692251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P76_USER_ID,P76_TIMESTAMP,P76_WORKSPACE_NAME,P76_APPLICATION_ID,P76_PAGE_ID,P76_PAGE_NAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203244543809692270)
,p_name=>'P76_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p76-appluser-pw-exp-rqrd'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P76_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203245132268692271)
,p_event_id=>wwv_flow_imp.id(6203244543809692270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P76_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203245555673692273)
,p_event_id=>wwv_flow_imp.id(6203244543809692270)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P76_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203240130494692262)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203240549227692262)
,p_event_id=>wwv_flow_imp.id(6203240130494692262)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P76_APPLUSER_PASSWORD',
  'items_to_submit', 'P76_APPLUSER_ID,P76_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P76_APPLUSER_PASSWORD := func_get_hash(:P76_APPLUSER_ID,:P76_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203239205415692260)
,p_name=>'Password_Expiry_Dtls'
,p_static_id=>'password-expiry-dtls'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203239659707692262)
,p_event_id=>wwv_flow_imp.id(6203239205415692260)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P76_APPLUSER_PW_EXP_RQRD").hide();',
    'apex.item( "P76_APPLUSER_PW_EXP_DAYS" ).hide();',
    'apex.item( "P76_APPLUSER_PWD_EXP_DUE" ).hide();',
    'apex.item( "P76_APPLUSER_PW_LUD" ).hide();',
    '$x_Hide("hide");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203238239015692256)
,p_name=>'POS/DEPT/CUS/SUP'
,p_static_id=>'pos-dept-cus-sup'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_APPLUSER_PARTY_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203238740958692257)
,p_event_id=>wwv_flow_imp.id(6203238239015692256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P76_APPLUSER_POS_ID,P76_APPLUSER_DEPT_ID,P76_APPLUSER_EMP_ID,P76_APPLUSER_SUPLR_ID,P76_APPLUSER_CUST_ID,P76_EMP_NAME,P76_DEPARTMENT_NAME,P76_POSITION,P76_APPLUSER_EMAIL_ID,P76_APPLUSER_MOBILE_NO',
  'items_to_submit', 'P76_APPLUSER_ID,P76_APPLUSER_USER_TYPE,P76_APPLUSER_PARTY_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P76_APPLUSER_PARTY_ID IS NOT NULL AND :P76_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P76_APPLUSER_PARTY_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c4',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P76_APPLUSER_USER_TYPE AND appluser_emp_id = :P76_APPLUSER_PARTY_ID AND appluser_status NOT IN (''D'');	     ',
    '	 	     cr4 c4%ROWTYPE; 	  ',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%NOTFOUND THEN',
    '	 	     RAISE_APPLICATION_ERROR(-20999,''Employee not found.'');',
    '	 	     ELSE',
    '              ',
    ':P76_APPLUSER_EMP_ID := cr1.emp_emp_id;:P76_APPLUSER_POS_ID :=cr1.empai_pos_id;:P76_EMP_NAME:=cr1.emp_name;:P76_APPLUSER_DEPT_ID :=cr1.empai_dept_id; :P76_POSITION:=cr1.pos_name;:P76_APPLUSER_MOBILE_NO :=cr1.emp_mobile_no;:P76_DEPARTMENT_NAME :=cr1.d'
||'ept_name;:P76_APPLUSER_EMAIL_ID :=cr1.emp_email_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P76_APPLUSER_PARTY_ID IS NOT NULL AND :P76_APPLUSER_USER_TYPE IN (''C'') THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P76_APPLUSER_PARTY_ID',
    '             AND SUPLR_CUST_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT * FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P76_APPLUSER_ID AND appluser_cust_id = :P76_APPLUSER_PARTY_ID; ',
    '	 	     cr2	c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Customer not found.'');',
    '	 	     ELSE',
    '	 	     	  OPEN c2;',
    '	 	     	  FETCH c2 INTO cr2;',
    '	 	     	     IF c2%FOUND THEN',
    '	 	     	     	  RAISE_APPLICATION_ERROR(-20999,''Customer already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P76_EMP_NAME             := cr1.suplr_name1;',
    ':P76_APPLUSER_CUST_ID		:= cr1.suplr_suplr_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P76_APPLUSER_PARTY_ID IS NOT NULL AND :P76_APPLUSER_USER_TYPE IN (''S'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P76_APPLUSER_PARTY_ID',
    '             AND SUPLR_SUPLR_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id <> :P76_APPLUSER_ID',
    '	 	     AND appluser_suplr_id = :P76_APPLUSER_PARTY_ID;     ',
    '	 	     cr2													c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Supplier not found.'');',
    'ELSE',
    '	OPEN c2;',
    '	FETCH c2 INTO cr2;     	     ',
    '	IF c2%FOUND THEN',
    '		RAISE_APPLICATION_ERROR(-20999,''Supplier already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P76_EMP_NAME :=cr1.suplr_name1;',
    ':P76_APPLUSER_SUPLR_ID		:= cr1.suplr_suplr_id;  ',
    '	 	     END IF;  CLOSE c1;	    END;  END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6203242746237692267)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P76_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6203243321752692268)
,p_event_id=>wwv_flow_imp.id(6203242746237692267)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P76_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P76_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P76_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P76_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P76_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P76_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6203236967723692249)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P76_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P76_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>721275132180081221
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6203236623658692248)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P76_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P76_DEPARTMENT_NAME , :P76_POSITION, :P76_PASSWORD ,:P76_APPLUSER_PW_EXP_DAYS_1,:P76_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P76_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>721274788115081220
);
wwv_flow_imp.component_end;
end;
/
