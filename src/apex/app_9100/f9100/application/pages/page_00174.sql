prompt --application/pages/page_00174
begin
--   Manifest
--     PAGE: 00174
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
 p_id=>174
,p_name=>'Attendance Month Wise Report'
,p_alias=>'ATTENDANCE-MONTH-WISE-REPORT'
,p_step_title=>'Attendance Month Wise Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.input {',
'    display: block !important;',
'    width: 100% !important;',
'    margin: 0px 0 !important;',
'    padding: 0 0 !important;',
'    border: 3px !important;',
'    background: none !important;',
'    outline: none !important;',
'    border-bottom: 3px solid #6ba2a0 !important;',
'    color: rgb(21, 22, 22) !important;',
'    transition: border-color 0.3s ease !important;',
'}',
'',
'.input1 {',
'    display: block !important;',
'    width: 100% !important;',
'    margin: 0px 0 !important;',
'    padding: 0 0 !important;',
'    /* border: 3px !important; */',
'    background: none !important;',
'    outline: none !important;',
'    /* border-bottom: 3px solid #fae88d !important; */',
'    color: rgb(250, 179, 81) !important;',
'    transition: border-color 0.3s ease !important;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6808142292435237650)
,p_plug_name=>'PT Report Form'
,p_static_id=>'pt-report-form'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6808142412664237651)
,p_plug_name=>'PT Report Inputs'
,p_static_id=>'pt-report-inputs'
,p_parent_plug_id=>wwv_flow_imp.id(6808142292435237650)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6808141727125237645)
,p_plug_name=>'PT Report Options'
,p_static_id=>'pt-report-options'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6438887744964294383)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_button_name=>'Run'
,p_static_id=>'run'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate Report'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808145015324237702)
,p_name=>'P174_BU'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808148870029237722)
,p_name=>'P174_BUS_FUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6808141727125237645)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808144834906237700)
,p_name=>'P174_DUMMY1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_prompt=>'Dummy1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808144197267237694)
,p_name=>'P174_EMPLOYEE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_item_default=>'ALL'
,p_prompt=>'Employee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_EMP_ALL'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Employees'
,p_lov_null_value=>'ALL'
,p_cSize=>30
,p_tag_css_classes=>'input'
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808144940051237701)
,p_name=>'P174_EXPORT_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_prompt=>'Export To<b><span style="color:tomato;font-size: x-small"> * </b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PDF;.pdf,Excel;.xls'
,p_cHeight=>1
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6319525586401124107)
,p_name=>'P174_PERIOD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_prompt=>'Period<b><span style="color:tomato;font-size: x-small"> * </b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Apr;1,May;2,Jun;3,Jul;4,Aug;5,Sep;6,Oct;7,Nov;8,Dec;9,Jan;10,Feb;11,Mar;12'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'input'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808145156051237703)
,p_name=>'P174_P_USER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808145702997237690)
,p_name=>'P174_RPT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6808141727125237645)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808145594896237689)
,p_name=>'P174_RPT_OPTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6808141727125237645)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Attendance Month Wise Report;/HRE&GLOBAL_JAS_RPT2.HRE/HRE1022'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6808143911308237691)
,p_name=>'P174_YEAR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6808142412664237651)
,p_prompt=>'Year<b><span style="color:tomato;font-size: x-small"> * </b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct pcy_year as pcy_year_disp,',
'       pcy_year as pcy_year_retn',
'  FROM payroll_cal_year',
' WHERE pcy_bu       = :GLOBAL_bu ',
'   ---AND pcy_clndr_id = ''0001''    ',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'input'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438898518982294409)
,p_name=>'Bus_fun'
,p_static_id=>'bus-fun'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_RPT_OPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438899074388294409)
,p_event_id=>wwv_flow_imp.id(6438898518982294409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P174_BUS_FUN_ID',
  'items_to_submit', 'P174_RPT_OPTION',
  'language', 'PLSQL',
  'plsql_code', ':P174_BUS_FUN_ID := LTRIM(SUBSTR(:P174_RPT_OPTION,INSTR(:P174_RPT_OPTION,''/'',2)),''/'');',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438897667463294409)
,p_name=>'P168_OPTION'
,p_static_id=>'p168-option'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_RPT_OPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438898129260294409)
,p_event_id=>wwv_flow_imp.id(6438897667463294409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P174_RPT_ID',
  'items_to_submit', 'P174_RPT_OPTION',
  'language', 'PLSQL',
  'plsql_code', ':P174_RPT_ID := :P174_RPT_OPTION;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438896717845294408)
,p_name=>'P174_EXP_TO'
,p_static_id=>'p174-exp-to'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_EXPORT_TO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438897230972294409)
,p_event_id=>wwv_flow_imp.id(6438896717845294408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438894043713294408)
,p_name=>'P174_RPT_ID'
,p_static_id=>'p174-rpt-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_RPT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438894582040294408)
,p_event_id=>wwv_flow_imp.id(6438894043713294408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438892306368294406)
,p_name=>'P174_RPT_YEAR'
,p_static_id=>'p174-rpt-year'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_RPT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438892742595294406)
,p_name=>'P174_RUN_DISABLE'
,p_static_id=>'p174-run-disable'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_RPT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438895873774294408)
,p_name=>'P174_SUB_EMP'
,p_static_id=>'p174-sub-emp'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_EMPLOYEE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438896374606294408)
,p_event_id=>wwv_flow_imp.id(6438895873774294408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438894979564294408)
,p_name=>'P174_SUB_YEAR'
,p_static_id=>'p174-sub-year'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438895429035294408)
,p_event_id=>wwv_flow_imp.id(6438894979564294408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438893140483294406)
,p_name=>'PDF REPORT'
,p_static_id=>'pdf-report'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6438887744964294383)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P174_EXPORT_TO'
,p_display_when_cond2=>'.pdf'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438893621832294406)
,p_event_id=>wwv_flow_imp.id(6438893140483294406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// javascript:window.open(''&GLOBAL_JAS_RPT1.&P174_RPT_ID.&GLOBAL_JAS_RPT3.&p_bu=&GLOBAL_BU.&p_year=&P174_YEAR.&p_emp_id=&P174_EMPLOYEE.&p_user=&GLOBAL_USER.'');',
    '',
    'javascript:window.open(''&GLOBAL_JAS_RPT1.&P174_RPT_ID.&GLOBAL_JAS_RPT3.&p_bu=&GLOBAL_BU.&p_emp_id=&P174_EMPLOYEE.&p_year=&P174_YEAR.&p_period=&P174_PERIOD.&p_user=&GLOBAL_USER.'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6319525878502124109)
,p_name=>'Period'
,p_static_id=>'period'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P174_PERIOD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6319525930819124110)
,p_event_id=>wwv_flow_imp.id(6319525878502124109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6438891423426294405)
,p_name=>'XLS REPORT'
,p_static_id=>'xls-report'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6438887744964294383)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P174_EXPORT_TO'
,p_display_when_cond2=>'.xls'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6438891962464294406)
,p_event_id=>wwv_flow_imp.id(6438891423426294405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:window.open(''&GLOBAL_JAS_RPT1.&P174_RPT_ID.XLS&output=xls&j_username=joeuser&j_password=joeuser&p_bu=&GLOBAL_BU.&p_year=&P174_YEAR.&p_period=&P174_PERIOD.&p_emp_id=&P174_EMPLOYEE.&p_user=&GLOBAL_USER.'');')).to_clob
);
wwv_flow_imp.component_end;
end;
/
