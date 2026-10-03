prompt --application/pages/page_1925190004
begin
--   Manifest
--     PAGE: 1925190004
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
 p_id=>1925190004
,p_name=>'Int. Messages/SMS/Email/Whatsapp'
,p_alias=>'EMAIL-SMS-WHATSAPP'
,p_step_title=>'Int. Messages/SMS/Email/Whatsapp'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .apex-item-group--rc input+label {',
'    position: relative;',
'    padding-left: 30px;',
'    padding-right: 10px;',
'    cursor: pointer;',
'    display: inline-block;',
'    margin: .4rem 0;',
'    vertical-align: top;',
'    min-height: 1.8rem;',
'    outline: 0;',
'    -webkit-backface-visibility: hidden;',
'    backface-visibility: hidden;',
'} */',
'',
'   /* radio option   */',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 25px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    display: table-cell;',
'    vertical-align: top;',
'    padding-left: 40px;',
'}',
'',
'/* .t-Region--scrollBody>.t-Region-bodyWrap>.t-Region-body {',
'    overflow: auto;',
'    background-color: #A7C4D2 !important;;',
'    -webkit-overflow-scrolling: touch;',
'} */'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6316411385383453120)
,p_plug_name=>'FIND'
,p_static_id=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7532383286832263376)
,p_plug_name=>'FIND'
,p_static_id=>'find-2'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5755676443926909542)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-bottom-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5755676537835909543)
,p_plug_name=>'New1'
,p_static_id=>'new-2'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-lg:margin-bottom-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5755676673821909544)
,p_plug_name=>'New2'
,p_static_id=>'new-3'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-lg:margin-bottom-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5755675229023909529)
,p_branch_name=>'go to page Internal Messages'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::P30_TAB_LIST,P30_BACK:I,Y&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P1925190004_TYPE_1'
,p_branch_condition_text=>'I'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7597590468705030429)
,p_branch_name=>'go to page sms'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P19251900041_BACK:Y&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P1925190004_TYPE_1'
,p_branch_condition_text=>'S'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7597590577779030430)
,p_branch_name=>'go to page mail'
,p_branch_action=>'f?p=&APP_ID.:19251900042:&SESSION.::&DEBUG.::P19251900042_BACK:Y&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P1925190004_TYPE_1'
,p_branch_condition_text=>'E'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7597590669735030431)
,p_branch_name=>'go to page WhatsApp'
,p_branch_action=>'f?p=&APP_ID.:19251900043:&SESSION.::&DEBUG.::P19251900043_BACK:Y&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P1925190004_TYPE_1'
,p_branch_condition_text=>'W'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7532383405484263377)
,p_name=>'P1925190004_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7532383286832263376)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Internal Messages;I,SMS;S,Email;E,Whatsapp;W'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '4',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6316411552061453121)
,p_name=>'P1925190004_TYPE_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6316411385383453120)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Email;E,SMS;S,WhatsApp;W,Internal Messages;I'
,p_grid_column=>6
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '1',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7580831102664387632)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7580831170904387633)
,p_event_id=>wwv_flow_imp.id(7580831102664387632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1925190004_TYPE'
);
wwv_flow_imp.component_end;
end;
/
