prompt --application/pages/page_902220501021
begin
--   Manifest
--     PAGE: 902220501021
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
 p_id=>902220501021
,p_name=>'Amount Format'
,p_alias=>'AMOUNT-FORMAT'
,p_page_mode=>'MODAL'
,p_step_title=>'Amount Format'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-select, .t-Form-inputContainer select.selectlist, .t-Form-inputContainer select.yes_no {',
'    color: darkorchid;',
'    font-weight: 600;',
'    border-color: #b89cbd;',
'}',
'',
'',
'',
'.apex-icons-fontapex .fa:before {',
'    vertical-align: top;',
'    color: white;',
'}',
'',
'.t-Alert--info.t-Alert--horizontal .t-Alert-icon {',
'    background-color: rgb(0 118 223);',
'}',
'',
'.t-Alert--success.t-Alert--horizontal .t-Alert-icon {',
'    background-color: rgb(60 170 44 / 95%);',
'}',
'',
'',
'.t-Alert--horizontal .t-Alert-content {',
'    padding: 8px;',
'    flex: 1 0;',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'}',
'',
'.t-Alert--horizontal .t-Alert-content {',
'  --  padding: 8px;',
'    flex: 1 0;',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'}',
'',
'',
'',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label, .apex-button-group input:checked + label {',
'    border-color: #0076df;',
'    background-color: #505f6d;',
'    color: #f9f9f9;',
'    box-shadow: none;',
'}',
'#AMT.t-Alert--info.t-Alert--horizontal .t-Alert-icon {',
'    background-color: rgb(185, 53, 12);',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.2rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'.t-Region--accent15 > .t-Region-header {',
'    background-color: #dfdfdf;',
'    color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'900'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the default color scheme used to display the application.</p>',
'<p>If <strong>Allow End Users to choose Theme Style</strong> is checked, then each end user can select from the available theme styles by clicking the <em>Customize</em> link in the bottom left corner of the Home page.</p>'))
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12219398145279443161)
,p_plug_name=>'<B>Format Mask</B>'
,p_static_id=>'b-format-mask-b'
,p_icon_css_classes=>'fa-number-2'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--customIcons:t-Alert--success:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6753405601812380463)
,p_plug_name=>'<B>Report Type</B>'
,p_static_id=>'b-report-type-b'
,p_icon_css_classes=>'fa-number-3'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--customIcons:t-Alert--info:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12023619767395313269)
,p_plug_name=>'<B>Value In </B>'
,p_static_id=>'b-value-in-b'
,p_region_name=>'AMT'
,p_icon_css_classes=>'fa-number-1'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--customIcons:t-Alert--info:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12023619837125313269)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6575228731107839527)
,p_plug_name=>'Color'
,p_static_id=>'color'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(5891524506782618398)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7559539904665644875)
,p_plug_name=>'Globalization'
,p_static_id=>'globalization'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(5891524506782618398)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6753405834830380465)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6254476235238387211)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12023619837125313269)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'<b>Cancel</b>'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7559540224839644878)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7559539904665644875)
,p_button_name=>'change_language'
,p_static_id=>'change-language'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Change Language'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5886974896023724861)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Reset'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6254475845777387211)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12023619837125313269)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6254480693825387222)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:&GLOBAL_PRE_PAGE.:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254475135464387210)
,p_name=>'P902220501021_AMT'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12023619767395313269)
,p_item_default=>':GLOBAL_AMT_TYPE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Actual;A'
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-sm:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254474528647387208)
,p_name=>'P902220501021_AMT_1'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6753405834830380465)
,p_item_default=>':GLOBAL_AMT_TYPE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Millions;A,Lakhs;L,Thousands;T'
,p_colspan=>10
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254478066237387216)
,p_name=>'P902220501021_COLOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_use_cache_before_default=>'NO'
,p_item_default=>':GLOBAL_COLOR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Nav. Bar & Menu Color'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6256172260862363673)
,p_name=>'P902220501021_GRAD_COLOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7559539976506644876)
,p_name=>'P902220501021_LANGUAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7559539904665644875)
,p_item_default=>'apex_util.get_session_lang'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Language'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:English;en,French;fr,Chinese (Simplified);zh,Thai;th,Japanese;ja'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254477415649387214)
,p_name=>'P902220501021_MASK'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12219398145279443161)
,p_item_default=>'L'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Millions;M,Lakhs;L'
,p_begin_on_new_line=>'N'
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:margin-top-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254476641784387213)
,p_name=>'P902220501021_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12023619837125313269)
,p_item_default=>':global_pre_page'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254473802861387205)
,p_name=>'P902220501021_REPORT_TYPE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6753405601812380463)
,p_item_default=>'R'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Base;B,Report;R'
,p_begin_on_new_line=>'N'
,p_colspan=>8
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none:margin-bottom-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254478481609387216)
,p_name=>'P902220501021_RPT_COLOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_use_cache_before_default=>'NO'
,p_item_default=>':GLOBAL_RPT_COLOR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Report Color'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6254478855505387216)
,p_name=>'P902220501021_RPT_FONT_COLOR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_use_cache_before_default=>'NO'
,p_item_default=>':GLOBAL_RPT_FNT_COLOR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Report Font Color'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_COLOR_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5942801786216396038)
,p_name=>'P902220501021_SID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6575228731107839527)
,p_prompt=>'SID'
,p_source=>'SELECT SYS_CONTEXT (''userenv'', ''SID'') FROM DUAL;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6254479638337387221)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6254476235238387211)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6254480211315387221)
,p_event_id=>wwv_flow_imp.id(6254479638337387221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6254479323912387217)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Amount_Type'
,p_static_id=>'amount-type'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 3/12/2022 2:48:39 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   v_M_mask     VARCHAR2 (50);',
'   v_L_mask     VARCHAR2 (50);',
'   v_fmt_mask   VARCHAR2 (1);',
'   v_exch_rt    VARCHAR2 (50);',
'',
'   CURSOR c1',
'   IS',
'      SELECT func_find_curr_rnddgt_format (:global_bu) deci FROM DUAL;',
'',
'   CURSOR c2',
'   IS',
'      SELECT FUNC_FIND_CURR_FORMAT (:global_bu) fmt FROM DUAL;',
'',
'   CURSOR c3',
'   IS',
'      SELECT func_find_exrate_rnddgt_format (:global_bu) exr_fmt FROM DUAL;',
'',
'   cr1          c1%ROWTYPE;',
'   cr2          c2%ROWTYPE;',
'   cr3          c3%ROWTYPE;',
'BEGIN',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   OPEN c2;',
'',
'   FETCH c2 INTO cr2;',
'',
'   v_fmt_mask := cr2.fmt;',
'',
'   IF cr1.deci IN (''999,999,999,990.999'', ''9,99,99,99,99,990.999'')',
'   THEN',
'      v_M_mask := ''999G999G999G999G999G999G990D000'';',
'      v_L_mask := ''99G99G99G99G99G99G99G99G990D000'';',
'   ELSIF cr1.deci IN (''999,999,999,990.99'', ''9,99,99,99,99,990.99'')',
'   THEN',
'      v_M_mask := ''999G999G999G999G999G999G990D00'';',
'      v_L_mask := ''99G99G99G99G99G99G99G99G990D00'';',
'   ELSIF cr1.deci IN (''9,99,99,99,99,990.9'', ''999,999,999,990.9'')',
'   THEN',
'      v_M_mask := ''999G999G999G999G999G999G990D0'';',
'      v_L_mask := ''99G99G99G99G99G99G99G99G990D0'';',
'   ELSE',
'      v_M_mask := ''999G999G999G999G999G999G990'';',
'      v_L_mask := ''99G99G99G99G99G99G99G99G990'';',
'   END IF;',
'',
'   OPEN c3;',
'',
'   FETCH c3 INTO cr3;',
'',
'   IF cr3.exr_fmt = ''990.99999999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D00000000'';',
'   ELSIF cr3.exr_fmt = ''990.9999999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D0000000'';',
'   ELSIF cr3.exr_fmt = ''990.999999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D000000'';',
'   ELSIF cr3.exr_fmt = ''990.99999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D00000'';',
'   ELSIF cr3.exr_fmt = ''990.9999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D0000'';',
'   ELSIF cr3.exr_fmt = ''990.999''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D000'';',
'   ELSIF cr3.exr_fmt = ''990.99''',
'   THEN',
'      v_exch_rt := ''999G999G999G999G999G999G990D00'';',
'   END IF;',
'',
'   CLOSE c3;',
'',
'   CLOSE c1;',
'',
'   CLOSE c2;',
'',
'   DELETE FROM mis_amt_type',
'         WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'',
'   INSERT INTO mis_amt_type',
'        VALUES (',
'                  :global_bu,',
'                  :global_user,',
'                  :p902220501021_amt,',
'                  CASE',
'                     WHEN :p902220501021_amt = ''A'' THEN 1',
'                     WHEN :p902220501021_amt = ''T'' THEN (1000)',
'                     WHEN :p902220501021_amt = ''L'' THEN (100000)',
'                  END,',
'                  SYSDATE,',
'                  CASE                                /*:P902220501021_MASK */',
'                     WHEN :P902220501021_MASK = ''M''',
'                     THEN',
'                        ''999G999G999G999G999G999G990''',
'                     WHEN :P902220501021_MASK = ''L''',
'                     THEN',
'                        ''99G99G99G99G99G99G99G99G990''',
'                  END,',
'                  CASE WHEN :P902220501021_MASK = ''M'' THEN v_M_mask /*''999G999G999G999G999G999G990D00''*/',
'                       WHEN :P902220501021_MASK = ''L'' THEN v_L_mask /*''99G99G99G99G99G99G99G99G990D00''*/',
'                  END,',
'                  v_exch_rt,',
'                  :P902220501021_REPORT_TYPE,',
'                  :P902220501021_COLOR,',
'                  :P902220501021_RPT_COLOR,',
'                  :P902220501021_RPT_FONT_COLOR);',
'',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6254475845777387211)
,p_internal_uid=>772517488368776189
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7559540074987644877)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change language'
,p_static_id=>'change-language'
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_LANG(:P902220501021_LANGUAGE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2077578239444033849
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5886974948660724862)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset'
,p_static_id=>'reset'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE mis_amt_type',
'   SET mat_amt_type = ''A'',',
'       mat_amt_mask = 1,',
'       mat_mask = ''999G999G999G999G999G999G990'',',
'       mat_mask_cost = ''99G99G99G99G99G99G99G99G990D00'',',
'       mat_mask_exch = ''999G999G999G999G999G999G990D00000000'',',
'       mat_rpt_type = ''R'',',
'       mat_color = ''#0b447c'',',
'       mat_rpt_color = ''#00b1e7'',',
'       mat_rpt_fnt_color = ''#ffffff''',
' WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'',
' COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5886974896023724861)
,p_internal_uid=>405013113117113834
);
wwv_flow_imp.component_end;
end;
/
