prompt --application/pages/page_17011997
begin
--   Manifest
--     PAGE: 17011997
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
 p_id=>17011997
,p_name=>'Update Password Type'
,p_alias=>'UPDATE-PASSWORD-TYPE'
,p_page_mode=>'MODAL'
,p_step_title=>'Update Password'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Dialog-body {',
'    grid-area: dialog-body;',
'    padding-top: var(--ut-dialog-padding-y, 16px);',
'    padding-bottom: var(--ut-dialog-padding-y, 16px);',
'    padding-left: var(--ut-dialog-padding-x, 16px);',
'    padding-top: 35px;',
'    padding-right: var(--ut-dialog-padding-x, 16px);',
'    min-width: 0;',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    display: table-cell;',
'    vertical-align: top;',
'    padding-left: 100px;',
'}',
'',
'.col-12>.rel-col .col-12 {',
'    width: 100%;',
'    /* font-weight: bold; */',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6118877322515631283)
,p_plug_name=>'Type'
,p_static_id=>'type'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>1010
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5956147642375421956)
,p_branch_name=>'Go to page 121098'
,p_branch_action=>'f?p=&APP_ID.:121098:&SESSION.::&DEBUG.:RP,121098::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P17011997_TYPE'
,p_branch_condition_text=>'D'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5956148065912421956)
,p_branch_name=>'Go to page 84'
,p_branch_action=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.::P84_TYPE:P&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P17011997_TYPE'
,p_branch_condition_text=>'S'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5956148491821421957)
,p_branch_name=>'Go to page 84'
,p_branch_action=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.::P84_TYPE:M&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P17011997_TYPE'
,p_branch_condition_text=>'E'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6118878021270631285)
,p_name=>'P17011997_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6118877322515631283)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Send SMS;S,Send E-Mail;E,Enter Emp. Details;D'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '3',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp.component_end;
end;
/
