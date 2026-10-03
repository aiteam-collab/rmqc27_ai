prompt --application/pages/page_111300801
begin
--   Manifest
--     PAGE: 111300801
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
 p_id=>111300801
,p_name=>'Track Error Message'
,p_alias=>'TRACK-ERROR-MESSAGE'
,p_step_title=>'Track Error Message'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 15px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    display: table-cell;',
'    vertical-align: top;',
'    padding-left: 40px;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7590238388598992468)
,p_plug_name=>'FIND'
,p_static_id=>'find'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5778923949776993353)
,p_branch_name=>'go error page (11130070)'
,p_branch_action=>'f?p=&APP_ID.:11130070:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P111300801_TAB'
,p_branch_condition_text=>'SE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7590238594421992470)
,p_branch_name=>'go error page'
,p_branch_action=>'f?p=&APP_ID.:11130080:&SESSION.::&DEBUG.::P11130080_FIND:&P111300801_TAB.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P111300801_TAB'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7590238457666992469)
,p_name=>'P111300801_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7590238388598992468)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:System Error Message;SE,Form Error Message;FE,Database Error Message;DE,Multi Language Description;MLD'
,p_grid_column=>5
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '1',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp.component_end;
end;
/
