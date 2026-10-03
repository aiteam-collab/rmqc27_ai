prompt --application/pages/page_00132
begin
--   Manifest
--     PAGE: 00132
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
 p_id=>132
,p_name=>'Work Flow'
,p_alias=>'WORK-FLOW6'
,p_step_title=>'Work Flow'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear {',
'    background-image: url(r/erp/9004/files/static/v28/clearclear-removebg-preview.png);',
'    background-position: 0px 3px;',
'    background-repeat: no-repeat;',
'    background-color: rgba(0, 0, 0, 0.15);',
'    background-size: 25px;',
'    width: 25px;',
'    height: 22px;',
'    top: -4px;',
'}',
'',
'#cancelbtn{',
'                color: #ff0000;',
'                background-color: rgba(255, 255, 255);',
'',
'                .a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }',
'',
'',
'',
'       .a-IRR-table {',
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
'}',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   //background-color: rgba(0, 0, 0, 0.15);',
'   background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   --top: -4px;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5574902167666740084)
,p_plug_name=>'Work Flow'
,p_static_id=>'work-flow'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5531586186745290646)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'Clear'
,p_icon_css_classes=>'Clear'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528411897136657838)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528411792999657837)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_static_id=>'SEARCH'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:window.open(''&GLOBAL_JAS_RPT1./WFM&GLOBAL_JAS_RPT2.WFM/WFM3015&GLOBAL_JAS_RPT3.&p_bu=&GLOBAL_BU.&p_doc_id=&P132_DOC_TYPE.&p_from_date=&P132_FROM_DATE.&p_to_date=&P132_TO_DATE.&p_plnt=&P132_UNIT.&p_user=&GLOBAL_USER.'');'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5574903083599740100)
,p_name=>'P132_DOC_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_prompt=>'Doc Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WF_APPROVE_DOC_TYPE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Doc.Type',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5574903175608740101)
,p_name=>'P132_FROM_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_prompt=>'From Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5574903299985740102)
,p_name=>'P132_TO_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_prompt=>'To Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5574902942902740099)
,p_name=>'P132_UNIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5574902167666740084)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WF_APPROVE_UNIT'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Unit',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5531584852565290633)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5531584980227290634)
,p_event_id=>wwv_flow_imp.id(5531584852565290633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5531585049953290635)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_DOC_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5531585162341290636)
,p_event_id=>wwv_flow_imp.id(5531585049953290635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5531585306472290637)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_TO_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5531585374513290638)
,p_event_id=>wwv_flow_imp.id(5531585306472290637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5531585500484290639)
,p_name=>'New_3'
,p_static_id=>'new-4'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_FROM_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5531585584905290640)
,p_event_id=>wwv_flow_imp.id(5531585500484290639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5531586316613290647)
,p_name=>'New_4'
,p_static_id=>'new-5'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5531586186745290646)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5531586433870290648)
,p_event_id=>wwv_flow_imp.id(5531586316613290647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P132_UNIT,P132_DOC_TYPE,P132_FROM_DATE,P132_TO_DATE'
);
wwv_flow_imp.component_end;
end;
/
