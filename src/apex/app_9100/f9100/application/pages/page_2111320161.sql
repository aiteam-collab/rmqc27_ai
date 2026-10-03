prompt --application/pages/page_2111320161
begin
--   Manifest
--     PAGE: 2111320161
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
 p_id=>2111320161
,p_name=>'Grant/Revoke Favourite Access'
,p_alias=>'GRANT-REVOKE-UNIT-ACCESS'
,p_step_title=>'Grant/Revoke Favourite Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#F {',
'color: #ff0000;',
'background-color: #ffffff;',
'}',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color:  #ffffff',
'};',
'',
'/* #addbtn{',
'color: blue;',
'background-color:  #ffffff',
'};',
'',
'#savebtn{',
'         color: green;',
'         background-color:  #ffffff;',
'} */',
'/* #cancelbtn{',
'           color: rgb(214, 19, 29);',
'           background-color:  #ffffff;',
'} */',
'',
'/* #cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'            color: rgb(214, 19, 29);',
'            background-color:  #ffffff;',
'} */',
'',
'',
'',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'',
'',
' /* a {',
'    color: #337AC0;',
' } */',
'/* ',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'} */'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12199406185269750376)
,p_plug_name=>'<b>Unit Favourite Details</b>'
,p_static_id=>'b-unit-favourite-details-b'
,p_title=>'Find Favourite Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10698439241168923621)
,p_plug_name=>'Favourite'
,p_static_id=>'favourite'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(appluser_user_type,''R'',''Admin'',''E'',''Functional'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''O'',''Role Based User'',''M'',''Mobile App'',''L'',''Limited Access User'',''D'',''Module Specific'',''G'',''Management'',''T'',''Sub'
||'contract Portal'')appluser_user_type1,',
'       appluser_id,',
'       appluser_emp_id,',
'       (SELECT emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1',
'          FROM employees',
'         WHERE emp_bu = appluser_bu',
'           AND emp_emp_id = appluser_emp_id) emp_name,',
'       ubff_bus_fun_id,',
'       wbf_bus_fun_name,',
'       DECODE(wbf_bus_fun_type ,''SET'',''Setup'',''FRM'',''Transaction'',''REP'',''Reports'',''RPT'',''Analytics'',''MOD'',''Module'') bus_fun_type',
'  FROM appl_users,',
'       user_bus_fun_favourites_apex,',
'       wapl_bus_fun',
' WHERE appluser_bu = :GLOBAL_BU',
'   AND appluser_bu = ubff_bu',
'   AND appluser_id = ubff_user_id',
'   AND wbf_bus_fun_id = ubff_bus_fun_id',
'   AND wbf_visible = ''Y''',
'   AND (appluser_user_type = :P2111320161_USER_TYPE OR :P2111320161_USER_TYPE IS NULL)',
'   AND (appluser_id = :P2111320161_USER_ID OR :P2111320161_USER_ID IS NULL)',
'   AND (appluser_emp_id = :P2111320161_APPLUSER_EMP_ID OR :P2111320161_APPLUSER_EMP_ID IS NULL)',
'   AND (ubff_bus_fun_id = :P2111320161_BUS_FUN_ID OR :P2111320161_BUS_FUN_ID IS NULL)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2111320161_USER_ID,P2111320161_USER_TYPE,P2111320161_APPLUSER_EMP_ID,P2111320161_BUS_FUN_ID'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10698439339933923621)
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5218918356149003419
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6295422218893192951)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>30
,p_column_identifier=>'BN'
,p_column_label=>'Emp. / Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6295422175906192950)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>10
,p_column_identifier=>'BM'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6295421997623192949)
,p_db_column_name=>'APPLUSER_USER_TYPE1'
,p_display_order=>20
,p_column_identifier=>'BL'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6306759070977482705)
,p_db_column_name=>'BUS_FUN_TYPE'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Bus Fun Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6295422375513192952)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>40
,p_column_identifier=>'BO'
,p_column_label=>'Emp. / Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6306758827483482703)
,p_db_column_name=>'UBFF_BUS_FUN_ID'
,p_display_order=>50
,p_column_identifier=>'BP'
,p_column_label=>'Bus Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6306758949684482704)
,p_db_column_name=>'WBF_BUS_FUN_NAME'
,p_display_order=>60
,p_column_identifier=>'BQ'
,p_column_label=>'Bus Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10698451421381927589)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APPLUSER_ID:APPLUSER_USER_TYPE1:APPLUSER_EMP_ID:EMP_NAME:UBFF_BUS_FUN_ID:WBF_BUS_FUN_NAME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6304560748193648397)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_button_name=>'Clear1'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6304561135538648397)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6304560309710648395)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_button_name=>'Go_report'
,p_static_id=>'go-report'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10768988107462377012)
,p_name=>'P2111320161_APPLUSER_EMP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_prompt=>'Emp. / Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name,',
'       appluser_emp_id',
'  FROM (',
'SELECT DISTINCT appluser_emp_id,',
'       (SELECT emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1',
'          FROM employees',
'         WHERE emp_bu = appluser_bu',
'           AND emp_emp_id = appluser_emp_id) emp_name',
'  FROM appl_users,user_bus_fun_favourites_apex',
' WHERE appluser_bu = :GLOBAL_BU',
'   AND appluser_bu = ubff_bu',
'   AND appluser_id = ubff_user_id',
'  )',
'ORDER BY emp_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
  'title', 'Select the Emp./Party',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10769019499059377116)
,p_name=>'P2111320161_BUS_FUN_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_prompt=>'Bus Fun Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_name ,',
'       wbf_bus_fun_id',
'  FROM (',
'SELECT DISTINCT  wbf_bus_fun_id,',
'       wbf_bus_fun_name',
'  FROM wapl_bus_fun,',
'       user_bus_fun_favourites_apex',
' WHERE wbf_bus_fun_id = ubff_bus_fun_id',
'   AND ubff_bu = :GLOBAL_BU',
'   AND wbf_visible = ''Y''',
'   AND wbf_active_flag = ''Y''',
'  )',
' ORDER BY wbf_bus_fun_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
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
  'title', 'Select the Location',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7473526960111640164)
,p_name=>'P2111320161_SHOW_DATA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10769016644898377110)
,p_name=>'P2111320161_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ubff_user_id   ',
'  FROM user_bus_fun_favourites_apex',
' WHERE ubff_bu = :GLOBAL_BU',
' ORDER BY ubff_user_id'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
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
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8536429435686292106)
,p_name=>'P2111320161_USER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12199406185269750376)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_user_type1,appluser_user_type',
'  FROM (',
'SELECT DISTINCT appluser_user_type ,',
'       DECODE(appluser_user_type,''R'',''Admin'',''E'',''Functional'',''D'',''Module Specific'',''G'',''Management'',''M'',''Mobile App'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''T'',''Subcontract Portal'') AS appluser_user_type1',
'  FROM appl_users,user_bus_fun_favourites_apex',
' WHERE appluser_bu = :GLOBAL_BU',
'   AND appluser_bu = ubff_bu',
'   AND appluser_id = ubff_user_id )',
' '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6304567120300648417)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6304560748193648397)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304568173975648420)
,p_event_id=>wwv_flow_imp.id(6304567120300648417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2111320161_USER_ID,P2111320161_USER_TYPE,P2111320161_APPLUSER_EMP_ID,P2111320161_BUS_FUN_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6304575667347648425)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304576178648648425)
,p_event_id=>wwv_flow_imp.id(6304575667347648425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2111320161_USER_ID,P2111320161_APPLUSER_EMP_ID,P2111320161_USER_TYPE,P2111320161_BUS_FUN_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304576613925648425)
,p_event_id=>wwv_flow_imp.id(6304575667347648425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P2111320161_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6304573800561648423)
,p_name=>'P69_ERROR_FLAG'
,p_static_id=>'p69-error-flag'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2111320161_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304574351285648423)
,p_event_id=>wwv_flow_imp.id(6304573800561648423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// First clear the errors',
    'apex.message.clearErrors();',
    '',
    'var errorFlag= $v(''P2111320161_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P2111320161_DOC_DATE'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P2111320161_DOC_DATE",',
    '        message:    "Doc. Date must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6304569069067648420)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6304560309710648395)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304571036538648422)
,p_event_id=>wwv_flow_imp.id(6304569069067648420)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").show();',
    '// apex.item("find").hide();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2111320161_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6306759239047482707)
,p_event_id=>wwv_flow_imp.id(6304569069067648420)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10698439241168923621)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6304570008340648422)
,p_event_id=>wwv_flow_imp.id(6304569069067648420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2111320161_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
