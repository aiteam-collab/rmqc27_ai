prompt --application/pages/page_00092
begin
--   Manifest
--     PAGE: 00092
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
 p_id=>92
,p_name=>'Workflow Approval'
,p_alias=>'236131090-WORKFLOW-APPROVAL'
,p_step_title=>'Workflow Approval'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-fieldContainer--floatingLabel .apex-item-select[size="1"] {',
'    min-height: 4.8rem;',
'    max-height: 4.8rem;',
'    padding-bottom: 4px;',
'   /* background-color: lavender;*/',
'}',
'.a-Switch input[type=checkbox]:checked + .a-Switch-toggle {',
'    background-color: #2196f3;',
'}',
'.a-Switch-toggle {',
'    box-shadow: inset rgb(0 0 0 / 5%) 0 0 0 1px;',
'    background-color: #795548;',
'}',
'.apex-item-text.a-PopupLOV-search:focus, .apex-item-text.apex-item-popup-lov:focus, .apex-item-multi:focus, .apex-item-text.a-PopupLOV-search.is-focused, .apex-item-text.apex-item-popup-lov.is-focused, .apex-item-multi.is-focused {',
'    color: #202020;',
'    background-color: #ffffff !important;',
'    border-color: darkblue !important;',
'}',
'/*',
'.t-Region--hiddenOverflow>.t-Region-body, .t-Region--hiddenOverflow>.t-Region-bodyWrap>.t-Region-body, .t-Region-body>.container, .t-Region-buttons {',
'    overflow: hidden;',
'    background-color: #d2edfb;',
'}*/',
'.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {',
'    font-size: 1.2rem;',
'    font-family: Arial;',
'    border-color: darkblue;',
'}',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'    font-size: 1.2rem;',
'    font-family: Arial;',
'    border-color: darkblue;',
'}',
'.apex-item-text.a-PopupLOV-search:focus, .apex-item-text.apex-item-popup-lov:focus, .apex-item-multi:focus, .apex-item-text.a-PopupLOV-search.is-focused, .apex-item-text.apex-item-popup-lov.is-focused, .apex-item-multi.is-focused {',
'    color: #202020;',
'    background-color: #ffffff !important;',
'    border-color: darkblue !important;',
'}',
'/*',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'    color: #202020;',
'    background-color: lavender;',
'    border-color: #dfdfdf;',
'    border-style: dashed;',
'}',
'',
'.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {',
'    font-size: 1.4rem;',
'    background-color: lavender;',
'}*/',
'',
'',
'.apex-item-single-checkbox input+label {',
'    -webkit-backface-visibility: hidden;',
'    backface-visibility: hidden;',
'    padding-left: 3.2rem;',
'}',
'',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: blue;',
'    --a-checkbox-text-color: var(--a-checkbox-checked-text-color);',
'}',
'.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {',
'    font-size: 1.2rem;',
'    font-family: Arial;',
'    border-color: darkblue;',
'    background-color: #dcdcdc;',
'}',
'',
'.t-Dialog-body {',
'    padding: 16px;',
'    background-color: #7e9bb3;',
'}',
'b, strong {',
'    font-weight: bolder;    ',
'    color: ghostwhite;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16860918695740613291)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16860920005930613305)
,p_plug_name=>'Workflow'
,p_static_id=>'workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16860953268859636906)
,p_plug_name=>'Workflow Approval'
,p_static_id=>'workflow-approval'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WORK_FLOW_TEMP'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7001661581444811554)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7001662013532811554)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P92_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7001662434629811556)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P92_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7001656189267811531)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_button_name=>'Entry'
,p_static_id=>'entry'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconLeft:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>7
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7001661200134811553)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P92_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7001686711153811696)
,p_branch_name=>'Go To Page 5001090'
,p_branch_action=>'P92_P_PAGE_ID'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459363286222946398)
,p_name=>'P92_ACTION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_prompt=>'Action'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT action_name d,action_id r',
'  FROM wf_apex_action',
' ORDER BY action_seq'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459361663924946395)
,p_name=>'P92_APPR_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8484274990784596912)
,p_name=>'P92_BOQ_PROJ_ID'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459366114811946402)
,p_name=>'P92_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459382539518946441)
,p_name=>'P92_FWD_ENTITY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459362080844946397)
,p_name=>'P92_FWD_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459364108069946398)
,p_name=>'P92_FWD_PERSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Forward To</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORWARD_LOV11'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P92_P_PRJ_ID,P92_P_WF_TYPE'
,p_ajax_items_to_submit=>'P92_P_PRJ_ID,P92_P_WF_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459363684363946398)
,p_name=>'P92_FWD_PERSON1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459365697797946402)
,p_name=>'P92_FWD_PERSON_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Forward To</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_MHO.MODAL_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name d,emp r,emp_name "Name",emp "Employee",user_id "User",appr_bu "Reporting Entity",appr_plnt "Reporting Unit Desc.",func_find_plnt_desc (appr_bu, appr_plnt, 1) "Reporting Unit"',
'  FROM (   SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, 1)',
'                  emp_name,',
'               weh_par_emp_id emp,',
'               func_find_user_id (weh_appr_bu, weh_par_emp_id) user_id,',
'               weh_appr_bu appr_bu,',
'               weh_appr_plnt appr_plnt',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :GLOBAL_bu',
'               AND weh_emp_id = func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
'               AND func_find_wf_basis (:GLOBAL_bu, :P92_P_WF_TYPE,1) = ''E''',
'           AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
'       UNION ALL',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'       WFDA_APPR_BU,',
'       WFDA_PLNT',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, :P92_P_WF_TYPE,1) = ''U''',
'       AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
'      UNION ALL',
'       SELECT func_find_employee_desc(prj_bu, prj_cont_mgr, 1) emp_desc,',
'       prj_cont_mgr,',
'       func_find_user_id(prj_bu, prj_cont_mgr) user1,',
'       prj_bu,',
'       prj_plnt',
'  FROM projects',
' WHERE prj_bu = :global_bu',
'   AND prj_proj_id = :P92_P_PRJ_ID',
'       AND EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y''))'))
,p_lov_cascade_parent_items=>'P92_P_PRJ_ID,P92_P_WF_TYPE'
,p_ajax_items_to_submit=>'P92_P_PRJ_ID,P92_P_WF_TYPE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_colspan=>5
,p_grid_column=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '600',
  'attribute_02', '15',
  'attribute_03', 'r',
  'attribute_04', 'd',
  'attribute_05', 'N',
  'attribute_06', 'Select a value',
  'attribute_07', 'Please select a record from the list.',
  'attribute_08', 'Enter a search term',
  'attribute_09', 'No data found',
  'attribute_10', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459364509129946400)
,p_name=>'P92_FWD_PERSON_2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly = readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459382905615946441)
,p_name=>'P92_FWD_PLNT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459383302879946441)
,p_name=>'P92_FWD_USER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459362532170946397)
,p_name=>'P92_MAIL_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'<b>Mail</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_tag_attributes=>'readonly = readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459366867022946403)
,p_name=>'P92_MSG'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459384120463946442)
,p_name=>'P92_PLNT_LOC_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>':GLOBAL_LOC_ID'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459347768338946288)
,p_name=>'P92_P_ACCT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459344630827946285)
,p_name=>'P92_P_CUST_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459350231008946294)
,p_name=>'P92_P_DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459342607735946280)
,p_name=>'P92_P_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459342149341946278)
,p_name=>'P92_P_DOC_PFX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459343014138946281)
,p_name=>'P92_P_DOC_SFX'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459345368642946286)
,p_name=>'P92_P_DOC_VALUE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459344939497946285)
,p_name=>'P92_P_EMP_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459351402761946295)
,p_name=>'P92_P_ERR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459349826661946292)
,p_name=>'P92_P_JRNL_TYPE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459351020117946294)
,p_name=>'P92_P_LANG'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_item_default=>'1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459345813984946286)
,p_name=>'P92_P_LVL1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459346143423946286)
,p_name=>'P92_P_LVL2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459346566643946286)
,p_name=>'P92_P_LVL3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459347034605946288)
,p_name=>'P92_P_LVL4'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459347431387946288)
,p_name=>'P92_P_LVL_PRJ'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459350601773946294)
,p_name=>'P92_P_PAGE_ID'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459340950066946277)
,p_name=>'P92_P_PLNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459341428744946278)
,p_name=>'P92_P_PRJ_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459343336922946281)
,p_name=>'P92_P_PROD_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459343757754946281)
,p_name=>'P92_P_PROD_REV'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459348949499946289)
,p_name=>'P92_P_PROJ_ID'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459348536741946289)
,p_name=>'P92_P_QC_MODE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459348167052946289)
,p_name=>'P92_P_QC_REV'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459349426838946292)
,p_name=>'P92_P_RND_PROJ_ID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459344215794946281)
,p_name=>'P92_P_SUPLR_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459341771710946278)
,p_name=>'P92_P_WF_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16860918695740613291)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459375287569946425)
,p_name=>'P92_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459375734648946427)
,p_name=>'P92_WFT_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459380519003946438)
,p_name=>'P92_WFT_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P92_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459380885028946438)
,p_name=>'P92_WFT_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P92_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459376925828946428)
,p_name=>'P92_WFT_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459377351397946430)
,p_name=>'P92_WFT_DOC_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_DOC_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459378161137946430)
,p_name=>'P92_WFT_DOC_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_DOC_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459377700166946430)
,p_name=>'P92_WFT_DOC_SFX'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_DOC_SFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459364867530946400)
,p_name=>'P92_WFT_MESSAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Message</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'display_item'
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>9
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459383688468946441)
,p_name=>'P92_WFT_NXT_STATUS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459366549261946403)
,p_name=>'P92_WFT_NXT_STATUS_DESC'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459376534586946428)
,p_name=>'P92_WFT_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459362903339946397)
,p_name=>'P92_WFT_PRIORITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Priority</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:HIGH;1,MEDIUM;2,LOW;3'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459382064100946439)
,p_name=>'P92_WFT_PROCESS_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_PROCESS_DESC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459380158952946436)
,p_name=>'P92_WFT_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_SEL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459379302690946432)
,p_name=>'P92_WFT_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459379708277946432)
,p_name=>'P92_WFT_STATUS_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_STATUS_DESC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459365354958946400)
,p_name=>'P92_WFT_STATUS_DESC_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(16860920005930613305)
,p_item_default=>'P92_WFT_STATUS_DESC'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459378502879946430)
,p_name=>'P92_WFT_STAT_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_STAT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459381314611946439)
,p_name=>'P92_WFT_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P92_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459381697613946439)
,p_name=>'P92_WFT_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P92_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459378961677946432)
,p_name=>'P92_WFT_VIEW_SEQ_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_VIEW_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8459376096338946427)
,p_name=>'P92_WFT_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_item_source_plug_id=>wwv_flow_imp.id(16860953268859636906)
,p_source=>'WFT_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001676165544811635)
,p_validation_name=>'Flags'
,p_static_id=>'flags'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_res    VARCHAR2(1);',
'    v_error       VARCHAR2 (1000);',
'BEGIN',
'    IF :P92_APPR_FLAG = ''N'' AND :P92_FWD_FLAG = ''N'' THEN',
'       v_error := ''Document should be Approve / Forward.'';',
'    END IF;',
'    ',
'    IF :P92_WFT_MESSAGE IS NULL THEN',
'       v_error := ''Message must be entered.'';',
'    END IF;',
'    ',
'    IF :P92_FWD_FLAG = ''Y'' AND :P92_FWD_PERSON IS NULL THEN',
'       v_error := ''Forward Person must be entered.'';',
'    END IF;',
'',
'',
' v_error := LTRIM (v_error, ''</br>'');',
'',
'      IF v_error IS NOT NULL',
'      THEN',
'         RETURN v_error;',
'      END IF;',
'      ',
'',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001682975547811685)
,p_name=>'ApproveFlag'
,p_static_id=>'approveflag'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_FWD_FLAG'
,p_condition_element=>'P92_FWD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001683530705811687)
,p_event_id=>wwv_flow_imp.id(7001682975547811685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_APPR_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001684775927811688)
,p_name=>'assign name'
,p_static_id=>'assign-name'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_FWD_PERSON'
,p_condition_element=>'P92_FWD_PERSON'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001685317829811692)
,p_event_id=>wwv_flow_imp.id(7001684775927811688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P92_FWD_PERSON_2',
  'items_to_submit', 'P92_FWD_PERSON,P92_P_WF_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT emp_name ',
    'into :P92_FWD_PERSON_2',
    '  FROM (   SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, 1)',
    '                  emp_name,',
    '               weh_par_emp_id emp,',
    '               func_find_user_id (weh_appr_bu, weh_par_emp_id) user_id,',
    '               weh_appr_bu appr_bu,',
    '               weh_appr_plnt appr_plnt',
    '          FROM wf_emp_hierarchy',
    '         WHERE     weh_bu = :GLOBAL_bu',
    '               AND weh_emp_id = func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
    '               AND func_find_wf_basis (:GLOBAL_bu, :P92_P_WF_TYPE,1) = ''E''',
    '           AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
    '       UNION ALL',
    '       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
    '       WFDA_POSITION,',
    '       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
    '       WFDA_APPR_BU,',
    '       WFDA_PLNT',
    '  FROM WF_DIRECT_AUTHORIZATION',
    ' WHERE     WFDA_BU = :global_bu',
    '       AND wfda_dflt_flag = ''Y''',
    '       AND func_find_wf_basis (:GLOBAL_bu, :P92_P_WF_TYPE,1) = ''U''',
    '       AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
    '      UNION ALL',
    '       SELECT func_find_employee_desc(prj_bu, prj_cont_mgr, 1) emp_desc,',
    '       prj_cont_mgr,',
    '       func_find_user_id(prj_bu, prj_cont_mgr) user1,',
    '       prj_bu,',
    '       prj_plnt',
    '  FROM projects',
    ' WHERE prj_bu = :global_bu',
    '   AND prj_proj_id = :P92_P_PRJ_ID',
    '       AND EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE AND wf_proj_based_flag = ''Y''))',
    '       where emp = :P92_FWD_PERSON;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001678394411811673)
,p_name=>'Forward Flag'
,p_static_id=>'forward-flag'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_FWD_FLAG'
,p_condition_element=>'P92_FWD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001678933072811679)
,p_event_id=>wwv_flow_imp.id(7001678394411811673)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_FWD_PERSON,P92_FWD_PERSON_2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001679367056811679)
,p_event_id=>wwv_flow_imp.id(7001678394411811673)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_FWD_PERSON,P92_FWD_PERSON_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001679767040811681)
,p_name=>'Forward Flag_1'
,p_static_id=>'forward-flag-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_FWD_FLAG'
,p_condition_element=>'P92_FWD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001680279981811682)
,p_event_id=>wwv_flow_imp.id(7001679767040811681)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P92_FWD_PERSON,P92_DESC,P92_FWD_USER,P92_FWD_ENTITY,P92_FWD_PLNT',
  'items_to_submit', 'P92_P_PLNT,P92_P_WF_TYPE,P92_P_EMP_ID,P92_P_DOC_VALUE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '   v_res                 VARCHAR2 (1);',
    '   CURSOR c1',
    '   IS',
    '      SELECT wf_bus_proc_id',
    '        FROM work_flow',
    '       WHERE wf_bu = :global_bu AND wf_bus_proc_id = :p92_p_wf_type;',
    '   cr1                   c1%ROWTYPE;',
    '   global_bu             VARCHAR2 (100);',
    '   global_user           VARCHAR2 (100);',
    '   global_plnt           VARCHAR2 (100);',
    '   global_wf_type        VARCHAR2 (100);',
    '   global_emp_id         VARCHAR2 (100);',
    '   global_wf_doc_value   NUMBER;',
    '   global_lang           VARCHAR2 (1) := ''1'';',
    '   v_error               VARCHAR2 (1000);',
    'BEGIN',
    '   global_bu := :global_bu;',
    '   global_user := :global_user;',
    '   global_plnt := :p92_p_plnt;',
    '   global_wf_type := :p92_p_wf_type;',
    '   global_emp_id := :p92_p_emp_id;',
    '   global_wf_doc_value := :p92_p_doc_value;',
    '  DECLARE',
    '     v_emp_id          VARCHAR2 (10)',
    '                           := func_find_emp_id (global_bu, global_user);',
    '      v_par_emp_id      VARCHAR2 (10)',
    '                           := func_find_wf_resp_person (global_bu,global_wf_type, func_find_emp_id (global_bu, global_user),1);',
    '      v_wf_control      VARCHAR2 (1);',
    '      v_wf_status       VARCHAR2 (2);',
    '      v_out             VARCHAR2 (1);',
    '      v_appr_bu         VARCHAR2 (5)',
    '         := func_find_wf_resp_person_bu (global_bu,global_wf_type, v_emp_id, v_par_emp_id,1);',
    '      v_appr_plnt       VARCHAR2 (10);',
    '      v_basis           VARCHAR2 (1);',
    '   BEGIN',
    '      :p92_wft_bu := global_bu;',
    '      :p92_wft_plnt := global_plnt;',
    '      :p92_wft_cre_by := global_user;',
    '      :p92_wft_cre_date := SYSDATE;',
    '      :p92_fwd_user := NULL;       ',
    '               IF v_par_emp_id IS NOT NULL',
    '               THEN',
    '                  :p92_fwd_person := v_par_emp_id;',
    '                  :p92_desc := func_find_employee_desc (v_appr_bu,v_par_emp_id,global_lang);',
    '                  :p92_fwd_user :=func_find_user_id (func_find_wf_resp_person_bu (global_bu,global_wf_type,func_find_emp_id (global_bu, global_user),v_par_emp_id,1),v_par_emp_id);',
    '                  :p92_fwd_entity := v_appr_bu;',
    '                  :p92_fwd_plnt :=func_find_wf_resp_person_plnt (global_bu,:p92_p_wf_type,v_emp_id,v_par_emp_id,1);     ',
    '               END IF;           ',
    '                 ',
    '      END;   ',
    '   EXCEPTION WHEN OTHERS THEN raise_application_error((sqlcode),func_find_err_msg(:global_bu,ABS(sqlcode),SUBSTR(REPLACE(sqlerrm,'' '',''''),11,3),1,:GLOBAL_USER));',
    'END; ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001680805157811682)
,p_event_id=>wwv_flow_imp.id(7001679767040811681)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P92_FWD_PERSON,P92_DESC,P92_FWD_USER,P92_FWD_ENTITY,P92_FWD_PLNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                  :p92_fwd_person := null;',
    '                  :p92_desc := null;',
    '                  :p92_fwd_user :=null;',
    '                  :p92_fwd_entity := null;',
    '                  :p92_fwd_plnt :=null;     ',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001682052604811684)
,p_name=>'ForwardFlag'
,p_static_id=>'forwardflag'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_APPR_FLAG'
,p_condition_element=>'P92_APPR_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001682546258811685)
,p_event_id=>wwv_flow_imp.id(7001682052604811684)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_FWD_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001683874871811687)
,p_name=>'mail disable'
,p_static_id=>'mail-disable'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001684424097811688)
,p_event_id=>wwv_flow_imp.id(7001683874871811687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P92_MAIL_FLAG'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001681161572811682)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7001661581444811554)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001681723938811684)
,p_event_id=>wwv_flow_imp.id(7001681161572811682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001685643067811693)
,p_name=>'WF_ACTION'
,p_static_id=>'wf-action'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_ACTION'
,p_condition_element=>'P92_ACTION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001686201151811695)
,p_event_id=>wwv_flow_imp.id(7001685643067811693)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P92_APPR_FLAG,P92_FWD_FLAG,P92_FWD_PERSON,P92_FWD_PERSON_2,P92_FWD_USER,P92_FWD_ENTITY',
  'items_to_submit', 'P92_P_WF_TYPE,P92_ACTION',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_emp_id VARCHAR2(10) := func_find_emp_id(:GLOBAL_bu,:GLOBAL_user);',
    '	v_par_emp_id VARCHAR2(10) := func_find_wf_resp_person(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,1);',
    '	v_appr_bu VARCHAR2(5) := func_find_wf_resp_person_bu(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,v_par_emp_id,1);',
    'BEGIN',
    'IF :P92_ACTION = ''YY'' THEN',
    '	:P92_APPR_FLAG := ''Y'';',
    '	:P92_FWD_FLAG := ''Y'';',
    '	:P92_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,1);',
    '	IF :P92_FWD_PERSON IS NOT NULL THEN',
    '	  :P92_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P92_FWD_PERSON,1);',
    '	  :P92_fwd_user := func_find_user_id(:GLOBAL_bu,:P92_FWD_PERSON);',
    '	END IF;',
    '	',
    '  :P92_fwd_entity  := v_appr_bu;',
    '  :P92_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '',
    'ELSIF :P92_ACTION = ''YN'' THEN',
    '	:P92_APPR_FLAG := ''Y'';',
    '	:P92_FWD_FLAG := ''N'';',
    '	:P92_FWD_PERSON := NULL;',
    '	:P92_FWD_PERSON_2 := NULL;',
    'ELSIF :P92_ACTION = ''NY'' THEN',
    '	:P92_APPR_FLAG := ''N'';',
    '	:P92_FWD_FLAG := ''Y'';',
    '	:P92_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,1);',
    '	IF :P92_FWD_PERSON IS NOT NULL THEN',
    '	  :P92_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P92_FWD_PERSON,1);',
    '	  :P92_fwd_user := func_find_user_id(:GLOBAL_bu,:P92_FWD_PERSON);',
    '	END IF;',
    '	',
    '  :P92_fwd_entity  := v_appr_bu;',
    '  :P92_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '',
    'ELSE',
    '	:P92_ACTION := ''NY'';',
    '	:P92_APPR_FLAG := ''N'';',
    '	:P92_FWD_FLAG := ''Y'';',
    '	:P92_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,1);',
    '	IF :P92_FWD_PERSON IS NOT NULL THEN',
    '	  :P92_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P92_FWD_PERSON,1);',
    '	  :P92_fwd_user := func_find_user_id(:GLOBAL_bu,:P92_FWD_PERSON);',
    '	END IF;',
    '	',
    '  :P92_fwd_entity  := v_appr_bu;',
    '  :P92_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P92_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '',
    'END IF;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001676856491811646)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'assign'
,p_static_id=>'assign'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :p92_fwd_flag = ''Y'' AND :p92_appr_flag = ''N'' AND :P92_P_WF_TYPE NOT IN (''WF_PRJ_EMPTC'')',
'   THEN',
'      SELECT user_id, appr_plnt, appr_bu',
'        INTO :p92_fwd_user, :p92_fwd_plnt, :p92_fwd_entity',
'        FROM (SELECT emp_name "Name",',
'                     emp,',
'                     user_id,',
'                     appr_bu,',
'                     appr_plnt,',
'                     func_find_plnt_desc (appr_bu, appr_plnt, 1)',
'                        "Reporting Unit"',
'                FROM (  SELECT emp_name,',
'                               emp,',
'                               func_find_user_id (:p92_fwd_entity, emp)',
'                                  user_id,',
'                               :global_bu appr_bu,',
'                               NULL appr_plnt',
'                          FROM (    SELECT LEVEL rw,',
'                                           ocln_bu,',
'                                           func_find_wf_emp_pos_id (',
'                                              ocln_bu,',
'                                              ocln_par_position_id)',
'                                              emp,',
'                                           func_find_employee_desc (',
'                                              ocln_bu,',
'                                              func_find_wf_emp_pos_id (',
'                                                 ocln_bu,',
'                                                 ocln_par_position_id),',
'                                              1)',
'                                              emp_name',
'                                      FROM (SELECT *',
'                                              FROM org_chart_hd, org_chart_ln',
'                                             WHERE ochd_bu = ocln_bu',
'                                                   AND ochd_chart_no =',
'                                                          ocln_chart_no',
'                                                   AND ochd_status = ''A''',
'                                                   AND TRUNC (SYSDATE) BETWEEN ochd_eff_from',
'                                                                           AND ochd_eff_to',
'                                                   AND ocln_bu = :global_bu)',
'                                     WHERE ocln_par_position_id IS NOT NULL',
'                                START WITH ocln_position_id =',
'                                              func_find_position_id (',
'                                                 :global_bu,',
'                                                 :global_user)',
'                                CONNECT BY ocln_position_id =',
'                                              PRIOR ocln_par_position_id) a,',
'                               appl_users',
'                         WHERE     appluser_bu = a.ocln_bu',
'                               AND appluser_emp_id = a.emp',
'                               AND appluser_status = ''A''',
'                               AND func_find_wf_basis (:global_bu,',
'                                                       :p92_p_wf_type,1) = ''O''',
'                      GROUP BY emp_name,',
'                               emp,',
'                               func_find_user_id (',
'                                  func_find_wf_resp_person_bu (',
'                                     :global_bu,',
'                                     :p92_p_wf_type,',
'                                     func_find_emp_id (:global_bu,',
'                                                       :global_user),',
'                                     emp,1),',
'                                  emp)',
'                      UNION ALL',
'                      SELECT func_find_employee_desc (weh_appr_bu,',
'                                                      weh_par_emp_id,',
'                                                      1)',
'                                emp_desc,',
'                             weh_par_emp_id,',
'                             func_find_user_id (weh_appr_bu, weh_par_emp_id)',
'                                user1,',
'                             weh_appr_bu,',
'                             weh_appr_plnt',
'                        FROM wf_emp_hierarchy',
'                       WHERE weh_bu = :global_bu',
'                             AND weh_emp_id =',
'                                    func_find_emp_id (:global_bu,',
'                                                      :global_user)',
'                             AND func_find_wf_basis (:global_bu,',
'                                                     :p92_p_wf_type,1) = ''E''',
'                      UNION ALL',
'                      SELECT func_find_employee_desc (wfda_appr_bu,',
'                                                      wfda_position,',
'                                                      1)',
'                                emp_desc,',
'                             wfda_position,',
'                             func_find_user_id (wfda_appr_bu, wfda_position)',
'                                user1,',
'                             wfda_appr_bu,',
'                             wfda_plnt',
'                        FROM wf_direct_authorization',
'                       WHERE     wfda_bu = :global_bu',
'                             AND wfda_dflt_flag = ''Y''',
'                             AND func_find_wf_basis (:global_bu,',
'                                                     :p92_p_wf_type,1) = ''U'')',
'               WHERE emp = :p92_fwd_person);',
'               ',
'               ',
'         ',
'   END IF;',
'EXCEPTION',
'   WHEN NO_DATA_FOUND',
'   THEN',
'      raise_application_error (-20999, ''Please select forward person.'');',
'--EXCEPTION',
'--   WHEN OTHERS',
'--   THEN',
'--      raise_application_error (',
'--         (SQLCODE),',
'--         func_find_err_msg (:global_bu,',
'--                            ABS (SQLCODE),',
'--                            SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'--                            1,',
'--                            :global_user));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1519715020948200618
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001675195719811585)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(16860953268859636906)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Workflow Approval'
,p_static_id=>'initialize-form-workflow-approval'
,p_internal_uid=>1519713360176200557
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001676475059811640)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New Form Instance'
,p_static_id=>'new-form-instance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_res                 VARCHAR2 (1);',
'',
'   CURSOR c1',
'   IS',
'      SELECT wf_bus_proc_id,wf_proj_based_flag',
'        FROM work_flow',
'       WHERE wf_bu = :global_bu AND wf_bus_proc_id = :P92_p_wf_type;',
'',
'   cr1                   c1%ROWTYPE;',
'',
'   global_bu             VARCHAR2 (100);',
'   global_user           VARCHAR2 (100);',
'   global_plnt           VARCHAR2 (100);',
'   global_wf_type        VARCHAR2 (100);',
'   global_doc_pfx        VARCHAR2 (100);',
'   global_doc_no         VARCHAR2 (100);   global_doc_sfx        VARCHAR2 (100);',
'   global_prod_id        VARCHAR2 (100);',
'   global_prod_rev       VARCHAR2 (100);',
'   global_suplr_id       VARCHAR2 (100);',
'   global_cust_id        VARCHAR2 (100);',
'   global_emp_id         VARCHAR2 (100);',
'   global_wf_doc_value   NUMBER;',
'   global_lvl1           VARCHAR2 (100);',
'   global_lvl2           VARCHAR2 (100);',
'   global_lvl3           VARCHAR2 (100);',
'   global_lvl4           VARCHAR2 (100);',
'   global_lvl_prj        VARCHAR2 (100);',
'   global_acct           VARCHAR2 (100);',
'   global_qc_rev         VARCHAR2 (100);',
'   global_qc_mode        VARCHAR2 (100);',
'   global_proj_id        VARCHAR2 (100);',
'   global_rnd_proj_id    VARCHAR2 (100);',
'   global_jrnl_type      VARCHAR2 (100);',
'   global_prod_date      VARCHAR2 (100);',
'   global_lang           VARCHAR2 (1) := ''1'';',
'   ',
'   v_proj_based_flag     work_flow.wf_proj_based_flag%TYPE;',
'',
'   v_error               VARCHAR2 (1000);',
'BEGIN',
'',
'  DELETE FROM wf_apex_action;',
'',
'   global_bu := :global_bu;',
'   global_user := :global_user;',
'   global_plnt := :P92_p_plnt;',
'   global_wf_type := :P92_p_wf_type;',
'   global_doc_pfx := :P92_p_doc_pfx;',
'   global_doc_no := :P92_p_doc_no;',
'   global_doc_sfx := :P92_p_doc_sfx;',
'   global_prod_id := :P92_p_prod_id;',
'   global_prod_rev := :P92_p_prod_rev;',
'   global_suplr_id := :P92_p_suplr_id;',
'   global_cust_id := :P92_p_cust_id;',
'   global_emp_id := :P92_p_emp_id;',
'   global_wf_doc_value := :P92_p_doc_value;',
'   global_lvl1 := :P92_p_lvl1;',
'   global_lvl2 := :P92_p_lvl2;',
'   global_lvl3 := :P92_p_lvl3;',
'   global_lvl4 := :P92_p_lvl4;',
'   :global_lvl_prj := :P92_p_lvl_prj;',
'   global_acct := :P92_p_acct;',
'   global_qc_rev := :P92_p_qc_rev;',
'   global_qc_mode := :P92_p_qc_mode;',
'   global_proj_id := :P92_P_PRJ_ID;',
'   global_rnd_proj_id := :P92_p_rnd_proj_id;',
'   global_jrnl_type := :P92_p_jrnl_type;',
'   global_prod_date := :P92_p_date;',
'',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%NOTFOUND',
'   THEN',
'      v_error := ''Workflow type not found.'';',
'   END IF;',
'',
'   CLOSE c1;',
'',
'   v_proj_based_flag := cr1.wf_proj_based_flag;',
'',
'   DECLARE',
'      CURSOR c1',
'      IS',
'         SELECT *',
'           FROM (  SELECT *',
'                     FROM work_flow_appr_actvt',
'                    WHERE wfaa_bu = global_bu AND wfaa_wf_id = global_wf_type',
'                 ORDER BY wfaa_seq_no)',
'          WHERE ROWNUM = 1;',
'',
'      CURSOR c2',
'      IS',
'      SELECT SUM(doc_val) doc_val',
'  FROM(SELECT SUM (prl_requested_qty * prl_bc_unit_cost) doc_val',
'         FROM pur_req_ln',
'        WHERE prl_bu = global_bu',
'          AND prl_rqst_no = global_doc_no',
'          AND global_wf_type IN (''WF_PRA'')',
'          UNION ALL',
'     SELECT SUM(pol_ordered_qty * pol_sc_unit_cost * poh_exchange_rate) doc_val',
'       FROM pur_order_hd,pur_order_ln',
'      WHERE poh_bu = pol_bu',
'        ANd poh_order_no = pol_order_no',
'        AND pol_bu = global_bu',
'        AND pol_order_no = global_doc_no',
'        AND global_wf_type IN (''WF_POA'',''WF_POAA''));',
'',
'      CURSOR c3 (',
'         c_seq_no NUMBER)',
'      IS',
'         SELECT *',
'           FROM work_flow, wf_direct_authorization',
'          WHERE     wf_bu = wfda_bu',
'                AND wf_bus_proc_id = wfda_type',
'                AND wfda_bu = global_bu',
'                AND wfda_type = global_wf_type',
'                AND wfda_seq_no = c_seq_no;',
'',
'      CURSOR c4',
'      IS',
'         SELECT *',
'           FROM (  SELECT *',
'                     FROM work_flow_appr_actvt',
'                    WHERE wfaa_bu = global_bu AND wfaa_wf_id = global_wf_type',
'                 ORDER BY wfaa_seq_no DESC)',
'          WHERE ROWNUM = 1;',
'',
'      CURSOR c5 (',
'         c_seq_no NUMBER)',
'      IS',
'         SELECT *',
'           FROM work_flow_appr_actvt',
'          WHERE     wfaa_bu = global_bu',
'                AND wfaa_wf_id = global_wf_type',
'                AND wfaa_seq_no = c_seq_no;',
'',
'      CURSOR c6',
'      IS',
'         SELECT wfmc_doc_comp',
'           FROM wfm_control',
'          WHERE wfmc_bu = global_bu;',
'',
'      cr1               c1%ROWTYPE;',
'      cr2               c2%ROWTYPE;',
'      cr3               c3%ROWTYPE;',
'      cr4               c4%ROWTYPE;',
'      cr5               c5%ROWTYPE;',
'      cr6               c6%ROWTYPE;',
'',
'      var_res           VARCHAR2 (1);',
'      var_res1          VARCHAR2 (1);',
'      v_cur_proc        VARCHAR2 (20);',
'      v_nxt_proc        VARCHAR2 (20);',
'      v_cur_proc_desc   VARCHAR2 (50);',
'      v_last_proc       VARCHAR2 (20);',
'      v_emp_id          VARCHAR2 (10)',
'                           := func_find_emp_id (global_bu, global_user);',
'      v_par_emp_id      VARCHAR2 (10)',
'                           :=  func_find_wf_resp_person (global_bu,global_wf_type, func_find_emp_id (global_bu, global_user),1);',
'      v_wf_control      VARCHAR2 (1);',
'      v_wf_status       VARCHAR2 (2);',
'      v_out             VARCHAR2 (1);',
'      v_appr_bu         VARCHAR2 (5)',
'         :=  func_find_wf_resp_person_bu (global_bu,global_wf_type, v_emp_id, v_par_emp_id,1);',
'      v_appr_plnt       VARCHAR2 (10);',
'      v_basis           VARCHAR2 (1);',
'   BEGIN',
'   ',
'',
'      :P92_wft_bu := global_bu;',
'      :P92_wft_plnt := global_plnt;',
'      :P92_wft_cre_by := global_user;',
'      :P92_wft_cre_date := SYSDATE;',
'      :P92_fwd_user := NULL;',
'',
'      --raise_application_error(-20999,''test'' || v_appr_bu||''/''||v_par_emp_id||''/''||v_emp_id||''/''||:P92_P_PRJ_ID);',
'',
'        SELECT wf_mail_flag',
'          INTO :P92_MAIL_FLAG',
'          FROM work_flow',
'         WHERE wf_bu    = :GLOBAL_bu',
'           AND wf_bus_proc_id = :P92_p_wf_type;',
'',
'      -- raise_application_error(-20999,''test'' || :P92_MAIL_FLAG);',
'',
'',
'',
'      OPEN c1;',
'',
'      FETCH c1 INTO cr1;',
'',
'      IF c1%FOUND',
'      THEN',
'         v_cur_proc := cr1.wfaa_status;',
'         v_cur_proc_desc := cr1.wfaa_desc;',
'',
'         OPEN c5 (cr1.wfaa_seq_no + 1);',
'',
'         FETCH c5 INTO cr5;',
'',
'         IF c5%FOUND',
'         THEN',
'            v_nxt_proc := cr5.wfaa_status;',
'         ELSE',
'            v_nxt_proc := NULL;',
'         END IF;',
'',
'         CLOSE c5;',
'',
'         OPEN c3 (cr1.wfaa_seq_no);',
'',
'         FETCH c3 INTO cr3;',
'',
'         CLOSE c3;',
'',
'         v_basis := cr3.wf_basis;',
'      ELSE',
'         v_cur_proc := NULL;',
'         v_cur_proc_desc := NULL;',
'      END IF;',
'',
'      CLOSE c1;',
'',
'      OPEN c4;',
'',
'      FETCH c4 INTO cr4;',
'',
'      IF c4%FOUND',
'      THEN',
'         v_last_proc := cr4.wfaa_status;',
'      ELSE',
'         v_last_proc := NULL;',
'      END IF;',
'',
'      CLOSE c4;',
'',
'      OPEN c2;',
'',
'      FETCH c2 INTO cr2;',
'',
'      IF c2%FOUND and  cr2.doc_val IS NOT NULL AND global_wf_type IN (''WF_PRA'',''WF_POA'',''WF_POAA'',''WF_PRE_MR'') THEN',
'               global_wf_doc_value := cr2.doc_val;',
'         else',
'         global_wf_doc_value := :P92_p_doc_value;',
'      END IF;',
'',
'      CLOSE c2;',
'',
'      OPEN c6;',
'',
'      FETCH c6 INTO cr6;',
'',
'      IF c6%NOTFOUND',
'      THEN',
'         v_wf_control := ''S'';',
'      ELSE',
'         v_wf_control := cr6.wfmc_doc_comp;',
'      END IF;',
'',
'      CLOSE c6;',
'      ',
'      --RAISE_APPLICATION_ERROR(-20999,v_par_emp_id||''/''||:P92_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''~''||v_emp_id||''/''||global_proj_id||''/''||:P92_p_proj_id) ;',
'--raise_application_error(-20999,''test'' || v_appr_bu||''/''||v_par_emp_id||''/''||v_emp_id||''/''||cr1.wfaa_desc||''/''||global_proj_id||''/''||:P92_p_proj_id);',
'      IF v_wf_control = ''S''',
'      THEN',
'         proc_work_flow_dir_auth (global_bu,',
'                                  global_plnt,',
'                                  global_wf_type,',
'                                  v_cur_proc,',
'                                  global_user,',
'                                  global_wf_doc_value,',
'                                  var_res,',
'                                  global_doc_pfx,',
'                                  global_doc_no,',
'				  p_proj_id => global_proj_id);',
'',
'         proc_work_flow_dir_auth (global_bu,',
'                                  global_plnt,',
'                                  global_wf_type,',
'                                  v_nxt_proc,',
'                                  global_user,',
'                                  global_wf_doc_value,',
'                                  var_res1,',
'                                  global_doc_pfx,',
'                                  global_doc_no,',
'				  p_proj_id => global_proj_id);',
'      ELSIF v_wf_control = ''N''',
'      THEN',
'         proc_work_flow_dir_auth_nonseq (global_bu,',
'                                         global_plnt,',
'                                         global_wf_type,',
'                                         global_user,',
'                                         v_wf_status,',
'                                         v_out);',
'',
'         proc_work_flow_dir_auth (global_bu,',
'                                  global_plnt,',
'                                  global_wf_type,',
'                                  v_wf_status,',
'                                  global_user,',
'                                  global_wf_doc_value,',
'                                  var_res,',
'                                  global_doc_pfx,',
'                                  global_doc_no,',
'				  p_proj_id => global_proj_id);',
'',
'         proc_work_flow_dir_auth (global_bu,',
'                                  global_plnt,',
'                                  global_wf_type,',
'                                  v_nxt_proc,',
'                                  global_user,',
'                                  global_wf_doc_value,',
'                                  var_res1,',
'                                  global_doc_pfx,',
'                                  global_doc_no,',
'				  p_proj_id => global_proj_id);',
'      END IF;',
'',
'',
'--RAISE_APPLICATION_ERROR(-20999,v_par_emp_id||''/''||:P92_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''~''||v_emp_id||''~''||var_res) ;',
'-- RAISE_APPLICATION_ERROR(-20999,:P92_P_PRJ_ID||''/''||:P92_fwd_person||''/''||v_proj_based_flag||''/''||global_proj_id);',
'      IF var_res = ''N''',
'      THEN',
'         :P92_appr_flag := ''N'';',
'         :P92_fwd_flag := ''Y'';',
'			INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'			:P92_ACTION := ''NY'';',
'			:P92_wft_message := ''FORWARD FOR ''||UPPER(v_cur_proc_desc);',
'	 ',
'	 IF v_proj_based_flag = ''N'' THEN',
'           :P92_fwd_person := v_par_emp_id;',
'	 ELSE',
'	   BEGIN',
'             SELECT prj_cont_mgr,',
'              (SELECT APPLUSER_ID FROM APPL_USERS WHERE APPLUSER_BU = :GLOBAL_BU',
'  AND APPLUSER_EMP_ID = PRJ_CONT_MGR) USER_ID',
'               INTO :P92_fwd_person,',
'                   :P92_fwd_user',
'               FROM projects',
'              WHERE prj_bu = global_bu',
'                AND prj_plnt = global_plnt',
'                AND prj_proj_id = :P92_P_PRJ_ID;-- global_proj_id;',
'               -- RAISE_APPLICATION_ERROR(-20999,:P92_P_PRJ_ID||''/''||:P92_fwd_person);',
'                v_par_emp_id := null;',
'           EXCEPTION',
'             WHEN NO_DATA_FOUND THEN :P92_fwd_person := v_par_emp_id;',
'	   END;',
'	 END IF;',
'	 ',
'         :P92_wft_status := v_cur_proc;',
'         :P92_wft_status_desc := v_cur_proc_desc;',
'',
'',
'    -- RAISE_APPLICATION_ERROR(-20999,:P92_fwd_person) ;',
'',
'--RAISE_APPLICATION_ERROR(-20999, v_appr_bu||''/''||v_par_emp_id||''/''||global_lang||''/''||global_bu||''/''||global_wf_type||''/''||global_user||''/''||:p1090_p_wf_type||''/''||v_emp_id);',
'',
'         IF v_par_emp_id IS NOT NULL',
'         THEN',
'            :P92_fwd_person := v_par_emp_id;',
'            :P92_desc := func_find_employee_desc (v_appr_bu, :P92_fwd_person , global_lang);',
'            ',
'            :P92_fwd_user :=  func_find_user_id(global_bu,func_find_emp_id (global_bu, global_user) );',
'            --func_find_user_id (func_find_wf_resp_person_bu (global_bu,:P1090_P_WF_TYPE,func_find_emp_id (global_bu, global_user),:P92_fwd_person ,1),:P92_fwd_person );',
'            ',
'            :P92_fwd_entity := v_appr_bu;',
'           -- RAISE_APPLICATION_ERROR(-20999, ''test'');',
'            :P92_fwd_plnt :=  func_find_wf_resp_person_plnt (global_bu,:P92_p_wf_type,v_emp_id,:P92_fwd_person,1);',
'              /* CASE',
'                  WHEN v_basis = ''E''',
'                  THEN',
'                     NULL',
'                  ELSE',
'                     func_find_wf_resp_person_plnt (global_bu,',
'                                                    :P92_wft_wf_type,',
'                                                    v_emp_id,',
'                                                    v_par_emp_id)',
'               END;*/',
'         END IF;',
'      ELSE',
'         :P92_appr_flag := ''Y'';',
'         :P92_fwd_flag := ''N'';',
'         :P92_fwd_person := v_par_emp_id;',
'         :P92_wft_status := v_cur_proc;',
'         :P92_wft_status_desc := v_cur_proc_desc;',
'  --RAISE_APPLICATION_ERROR(-20999,''TEST''||:P92_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''/''||:P92_fwd_person) ; ',
'         IF v_cur_proc <> v_last_proc AND v_last_proc IS NOT NULL',
'         THEN',
'            IF var_res1 = ''N''',
'            THEN',
'               :P92_fwd_flag := ''Y'';',
'           ',
'               IF v_par_emp_id IS NOT NULL',
'               THEN',
'                  :P92_fwd_person := v_par_emp_id;',
'                  :P92_desc := func_find_employee_desc (v_appr_bu,',
'                                              v_par_emp_id,',
'                                              global_lang);',
'                 :p92_fwd_user := func_find_user_id (func_find_wf_resp_person_bu (global_bu,global_wf_type,func_find_emp_id (global_bu, global_user),v_par_emp_id,1),v_par_emp_id);',
'            :p92_fwd_entity := v_appr_bu;',
'            :p92_fwd_plnt :=func_find_wf_resp_person_plnt (global_bu,:P92_p_wf_type,v_emp_id,v_par_emp_id,1);',
'              /* CASE',
'                  WHEN v_basis = ''E''',
'                  THEN',
'                     NULL',
'                  ELSE',
'                     func_find_wf_resp_person_plnt (global_bu,',
'                                                    :p1090_p_wf_type,',
'                                                    v_emp_id,',
'                                                    v_par_emp_id,1)',
'               END;*/',
'               END IF;',
'            ELSE',
'               :P92_fwd_flag := ''N'';',
'            END IF;',
'',
'            DECLARE',
'               CURSOR c1',
'               IS',
'                  SELECT wfaa_seq_no',
'                    FROM work_flow_appr_actvt',
'                   WHERE     wfaa_bu = global_bu',
'                         AND wfaa_wf_id = global_wf_type',
'                         AND wfaa_status = :P92_wft_status;',
'',
'               CURSOR c2 (c_seq_no NUMBER)',
'               IS',
'                  SELECT wfaa_status, wfaa_desc',
'                    FROM (  SELECT *',
'                              FROM work_flow_appr_actvt',
'                             WHERE     wfaa_bu = global_bu',
'                                   AND wfaa_wf_id = global_wf_type',
'                                   AND wfaa_seq_no > c_seq_no',
'                          ORDER BY wfaa_seq_no)',
'                   WHERE ROWNUM = 1;',
'',
'               cr1   c1%ROWTYPE;',
'               cr2   c2%ROWTYPE;',
'            BEGIN',
'               OPEN c1;',
'',
'               FETCH c1 INTO cr1;',
'',
'               IF c1%FOUND',
'               THEN',
'                  OPEN c2 (cr1.wfaa_seq_no);',
'',
'                  FETCH c2 INTO cr2;',
'',
'                  IF c2%FOUND',
'                  THEN',
'                     :P92_wft_nxt_status := cr2.wfaa_status;',
'                     :P92_wft_nxt_status_desc := cr2.wfaa_desc;',
'                  END IF;',
'',
'                  CLOSE c2;',
'               END IF;',
'',
'               CLOSE c1;',
'            END;',
'',
'				INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'				INSERT INTO wf_apex_action VALUES(2,InitCap(v_cur_proc_desc)||'' & Forward for ''||InitCap(:P92_wft_nxt_status_desc), ''YY'');',
'             ',
'				IF :P92_appr_flag = ''Y'' AND :P92_fwd_flag = ''Y'' THEN',
'				  :P92_ACTION := ''YY'';',
'				  :P92_wft_message := ''FORWARD FOR '' || UPPER(:P92_wft_nxt_status_desc);',
'				ELSIF :P92_appr_flag = ''N'' AND :P92_fwd_flag = ''Y'' THEN',
'				  :P92_ACTION := ''NY'';',
'				  :P92_wft_message := ''FORWARD FOR '' || UPPER(v_cur_proc_desc);',
'				END IF;',
'',
'         ELSIF v_cur_proc = v_last_proc',
'         THEN',
'            --:P92_fwd_plnt := ''N'';',
'				:P92_fwd_flag := ''N'';',
'',
'				INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'				INSERT INTO wf_apex_action VALUES(2,InitCap(v_cur_proc_desc),''YN'');',
'				:P92_ACTION := ''YN'';',
'				:P92_wft_message := ''FOR ''||UPPER(v_cur_proc_desc);',
'         END IF;',
'      END IF;',
'',
'      :P92_wft_priority := ''2'';',
'      --:P92_wft_message := ''FOR '' || v_cur_proc_desc;',
'   /*v_error := LTRIM (v_error, ''</br>'');',
'',
'        IF v_error IS NOT NULL',
'        THEN',
'           RETURN v_error;',
'        END IF;*/',
'        ',
'      --  raise_application_error(-20999,v_cur_proc_desc||:P92_fwd_person);',
'--RAISE_APPLICATION_ERROR(-20999,:P92_fwd_person||''/''||:p92_fwd_user) ;',
'',
'   END;',
'END;',
'',
'--RAISE_APPLICATION_ERROR(-20999, :P92_fwd_person||''/''||:P92_fwd_flag||''/''||:P92_appr_flag || ''/'' || :P92_p_wf_type);'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1519714639516200612
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001678039807811663)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Approve & Forward'
,p_static_id=>'process-for-approve-forward'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c_wf',
'   IS',
'      SELECT wf_auth_type',
'        FROM work_flow',
'       WHERE wf_bu = :global_bu ',
'	     AND wf_bus_proc_id = :P92_P_WF_TYPE;',
'',
'   CURSOR c0',
'   IS',
'      SELECT *',
'        FROM (  SELECT *',
'                  FROM work_flow_appr_actvt',
'                 WHERE wfaa_bu = :global_bu AND wfaa_wf_id = :P92_P_WF_TYPE',
'              ORDER BY wfaa_seq_no DESC)',
'       WHERE ROWNUM = 1;',
'',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM (  SELECT *',
'                  FROM work_flow_appr_actvt',
'                 WHERE wfaa_bu = :global_bu AND wfaa_wf_id = :P92_P_WF_TYPE',
'              ORDER BY wfaa_seq_no)',
'       WHERE ROWNUM = 1;',
'',
'   CURSOR c2',
'   IS',
'        SELECT wfdc_seq_no,',
'               wfdc_wf_no,',
'               wfdc_type,',
'               wfdc_value,',
'               wfdc_ctrl_person,',
'               wfdc_rnd_prj_id,',
'               wfdc_qc_rev,',
'               wfdc_qc_ins_mode,',
'               wfdc_disc_pct,',
'               wfdc_doc_no,',
'               wfdc_benf_type,',
'               wfdc_benf_id,',
'               wfdc_proj_id,',
'               wfdc_work_site,',
'               wf_module',
'          FROM work_flow_doc_control, work_flow',
'         WHERE wfdc_bu = wf_bu',
'		   AND wfdc_type = wf_bus_proc_id',
'		   AND wfdc_bu = :global_bu',
'		   AND wfdc_type = :P92_P_WF_TYPE',
'		   AND (wfdc_plnt = :P92_P_PLNT OR :P92_P_PLNT IS NULL)',
'		   AND (wfdc_doc_pfx = :P92_P_DOC_PFX OR :P92_P_DOC_PFX IS NULL)',
'		   AND (wfdc_doc_no = :P92_P_DOC_NO OR :P92_P_DOC_NO IS NULL)',
'		   AND (wfdc_doc_sfx = :P92_P_DOC_SFX OR :P92_P_DOC_SFX IS NULL)',
'		   AND (wfdc_prod_id = :P92_P_PROD_ID OR :P92_P_PROD_ID IS NULL)',
'		   AND (wfdc_prod_rev = :P92_P_PROD_REV OR :P92_P_PROD_REV IS NULL)',
'		   AND (wfdc_spplr_id = :P92_P_SUPLR_ID OR :P92_P_SUPLR_ID IS NULL)',
'		   AND (wfdc_cust_id = :P92_P_CUST_ID OR :P92_P_CUST_ID IS NULL)',
'		   AND (wfdc_prj_id = :P92_P_PROJ_ID OR :P92_P_PROJ_ID IS NULL)',
'		   AND (wfdc_rnd_prj_id = :P92_P_RND_PROJ_ID OR :P92_P_RND_PROJ_ID IS NULL)',
'		   AND (wfdc_lvl1 = :P92_P_LVL1 OR :P92_P_LVL1 IS NULL)',
'		   AND (wfdc_lvl2 = :P92_P_LVL2 OR :P92_P_LVL2 IS NULL)',
'		   AND (wfdc_lvl3 = :P92_P_LVL3 OR :P92_P_LVL3 IS NULL)',
'		   AND (wfdc_lvl4 = :P92_P_LVL4 OR :P92_P_LVL4 IS NULL)',
'		   AND (wfdc_accts = :P92_P_ACCT OR :P92_P_ACCT IS NULL)',
'		   AND (wfdc_jrnl_type = :P92_P_JRNL_TYPE OR :P92_P_JRNL_TYPE IS NULL)',
'		   AND (wfdc_proj_id = :P92_BOQ_PROJ_ID OR :P92_BOQ_PROJ_ID IS NULL)',
'  ORDER BY 1 DESC;',
'',
'   CURSOR c3',
'   IS',
'      SELECT wfmc_doc_comp',
'        FROM wfm_control',
'       WHERE wfmc_bu = :global_bu;',
'',
'   v_auth_type     work_flow.wf_auth_type%TYPE;',
'   cr0             c0%ROWTYPE;',
'   cr1             c1%ROWTYPE;',
'   v_res           VARCHAR2 (4000) := ''N'';',
'   v_res1          VARCHAR2 (4000) := ''N'';',
'   v_res2          VARCHAR2 (4000) := ''N'';',
'   v_res3          NUMBER;',
'   v_last_proc     VARCHAR2 (2);',
'   v_cur_proc      VARCHAR2 (2);',
'   cr2             c2%ROWTYPE;',
'   cr3             c3%ROWTYPE;',
'   v_wf_no         VARCHAR2 (15);',
'   p_out           VARCHAR2 (1);',
'   v_wf_value      NUMBER;',
'   v_wf_disc_pct   NUMBER;',
'   v_ctrl_person   VARCHAR2 (50);',
'   v_emp_id        VARCHAR2 (10);',
'   v_seq_no        NUMBER;',
'   v_wf_control    VARCHAR2 (1);',
'   v_wf_status     VARCHAR2 (2);',
'   v_out           VARCHAR2 (1);',
'   v_appr_bu       VARCHAR2 (5);',
'   v_appr_plnt     VARCHAR2 (10);',
'   var_msg         VARCHAR2 (4000);',
'   var_err         VARCHAR2 (4000);',
'   v_benf_type     VARCHAR2 (1);',
'   v_benf_id       VARCHAR2 (25);',
'   v_lang          NUMBER :=1;',
'   v_err           VARCHAR2(4000);',
'BEGIN',
'   OPEN c_wf;',
'',
'   FETCH c_wf INTO v_auth_type;',
'',
'   CLOSE c_wf;',
'',
'   OPEN c0;',
'',
'   FETCH c0 INTO cr0;',
'',
'   IF c0%FOUND',
'   THEN',
'      v_last_proc := cr0.wfaa_status;',
'   END IF;',
'',
'   CLOSE c0;',
'',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%FOUND',
'   THEN',
'      v_cur_proc := cr1.wfaa_status;',
'   END IF;',
'',
'   CLOSE c1;',
'',
'   OPEN c3;',
'',
'   FETCH c3 INTO cr3;',
'',
'   IF c3%NOTFOUND',
'   THEN',
'      v_wf_control := ''S'';',
'   ELSE',
'      v_wf_control := cr3.wfmc_doc_comp;',
'   END IF;',
'',
'   CLOSE c3;',
'',
'   /* Document status Changed from "New" To "Entry Completed" */',
'',
'   OPEN c2;',
'',
'   FETCH c2 INTO cr2;',
'',
'   CLOSE c2;',
'',
'   proc_wf_entry_compl (:global_bu,',
'                        :P92_P_PLNT,',
'                        cr2.wfdc_wf_no,',
'                        :P92_P_DOC_PFX,',
'                        :P92_P_DOC_SFX,',
'                        :P92_P_DOC_NO,',
'                        TO_DATE (:P92_P_DATE),',
'                        :P92_P_WF_TYPE,',
'                        :P92_P_SUPLR_ID,',
'                        :P92_P_CUST_ID,',
'                        :P92_P_PROD_ID,',
'                        :P92_P_PROD_REV,',
'                        :P92_P_JRNL_TYPE,',
'                        :P92_P_PROJ_ID,',
'                        :P92_P_LVL1,',
'                        :P92_P_LVL2,',
'                        :P92_P_LVL3,',
'                        :P92_P_LVL4,',
'                        :P92_P_ACCT,',
'                        NULL,--:GLOBAL.coll_cnt_id,',
'                        NULL,--:GLOBAL.inst_id,',
'                        NULL,--:GLOBAL.inst_ser_no,',
'                        :global_user,',
'                        v_lang,',
'                        var_msg,',
'                        v_res);',
'',
'   IF var_msg IS NOT NULL',
'   THEN',
'      v_err := var_msg;',
'   END IF;',
'',
'   OPEN c2;',
'',
'   FETCH c2 INTO cr2;',
'',
'   IF c2%FOUND',
'   THEN',
'      v_wf_no := cr2.wfdc_wf_no;',
'      v_wf_value := cr2.wfdc_value;',
'      v_ctrl_person := cr2.wfdc_ctrl_person;',
'      v_seq_no := cr2.wfdc_seq_no;',
'      v_wf_disc_pct := cr2.wfdc_disc_pct;',
'   ELSE',
'      raise_application_error(-20999,cr2.wfdc_wf_no || ''/''|| :P92_P_PLNT|| ''/''|| :P92_P_WF_TYPE|| ''/''|| :P92_P_DOC_PFX|| ''/''|| :P92_P_DOC_NO);',
'   END IF;',
'',
'   CLOSE c2;',
'',
'   IF v_wf_control = ''N''',
'   THEN',
'      proc_work_flow_dir_auth_nonseq (:global_bu,',
'                                      :P92_P_PLNT,',
'                                      :P92_P_WF_TYPE,',
'                                      :global_user,',
'                                      v_cur_proc,',
'                                      v_out);',
'   END IF;',
'',
'   IF :P92_APPR_FLAG = ''Y'' AND :P92_FWD_FLAG = ''N'' AND v_res = ''Y''',
'   THEN',
'      IF v_cur_proc = v_last_proc',
'      THEN',
'         p_out := ''N'';',
'',
'         IF v_wf_control = ''S''',
'         THEN',
'',
'            proc_work_flow_auth (:global_bu,',
'                                 :P92_P_PLNT,',
'                                 :P92_P_WF_TYPE,',
'                                 v_ctrl_person,',
'                                 v_wf_value,',
'                                 NVL (v_seq_no, 0),',
'                                 p_out,',
'                                 p_disc_pct   => v_wf_disc_pct,',
'                                 p_rqst_pfx   => :P92_P_DOC_PFX);',
'      ',
'         ELSE',
'            v_seq_no := func_find_wf_appr_seq_no (:global_bu,:P92_P_PLNT,:P92_P_WF_TYPE,v_ctrl_person,NULL,''A'',v_wf_value);',
'         END IF;',
'        ',
'         IF p_out = ''C''',
'         THEN',
'            v_err := ''Configure Authorization limit'';',
'         ELSIF p_out = ''E''',
'         THEN',
'            v_err := ''Authorization limit exceeds'';',
'         ELSIF p_out = ''A''',
'         THEN',
'            v_err := ''Not an authorized user1.'';',
'         ELSIF p_out = ''M''',
'         THEN',
'            v_err := ''Work Flow Document Value Missing'';',
'         END IF;',
'',
'         UPDATE work_flow_doc_control',
'            SET wfdc_act = ''A'',',
'                wfdc_upd_by = :global_user,',
'                wfdc_upd_date = SYSDATE',
'          WHERE wfdc_bu = :global_bu',
'			AND wfdc_type = :P92_P_WF_TYPE',
'			AND wfdc_wf_no = v_wf_no;',
'',
'         IF :P92_P_WF_TYPE IN (''WF_PRA'', ''WF_WFPR'')',
'         THEN           ',
'            NULL;',
'         END IF;',
'',
'         OPEN c2;',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'         IF :P92_P_WF_TYPE = ''WF_SUPDA''',
'         THEN',
'            DECLARE',
'               CURSOR c1',
'               IS',
'                  SELECT apmc_notify_grn_rej_wf, apmc_notify_dev_wf',
'                    FROM apm_control',
'                   WHERE apmc_bu = :global_bu;',
'',
'               CURSOR c2 (',
'                  c_dev_rej VARCHAR2)',
'               IS',
'                  SELECT 1',
'                    FROM suplr_doc_hd',
'                   WHERE suphd_bu = :global_bu',
'					 AND suphd_pfx = :P92_P_DOC_PFX',
'					 AND suphd_doc_no = :P92_P_DOC_NO',
'					 AND ( (c_dev_rej = ''D'' AND suphd_dev_exist_flag = ''Y'') OR (c_dev_rej = ''R'' AND suphd_pur_ret_cre_flag = ''Y''));',
'',
'               cr1   c1%ROWTYPE;',
'               cr2   c2%ROWTYPE;',
'            BEGIN',
'               OPEN c1;',
'',
'               FETCH c1 INTO cr1;',
'',
'               IF c1%FOUND AND cr1.apmc_notify_grn_rej_wf = ''Y''',
'               THEN',
'                  OPEN c2 (''R'');',
'',
'                  FETCH c2 INTO cr2;',
'',
'                  IF c2%FOUND',
'                  THEN',
'                     NULL;--ALERT_MSG (''Pur./SC Rejection Return Details Exists.'');',
'                  END IF;',
'',
'                  CLOSE c2;',
'               END IF;',
'',
'               IF c1%FOUND AND cr1.apmc_notify_dev_wf = ''Y''',
'               THEN',
'                  OPEN c2 (''D'');',
'',
'                  FETCH c2 INTO cr2;',
'',
'                  IF c2%FOUND',
'                  THEN',
'                     NULL;--ALERT_MSG (''Deviation Exists for this Document.'', ''N'');',
'                  END IF;',
'',
'                  CLOSE c2;',
'               END IF;',
'',
'               CLOSE c1;',
'            END;',
'         END IF;',
'',
'         proc_wf_doc_approve (:global_bu,',
'                              cr2.wfdc_wf_no,',
'                              :P92_P_WF_TYPE,',
'                              cr2.wf_module,',
'                              :global_bu,',
'                              :P92_P_PLNT,',
'                              :P92_P_DOC_PFX,',
'                              :P92_P_DOC_NO,',
'                              :P92_P_DOC_SFX,',
'                              :P92_P_PROD_ID,',
'                              :P92_P_PROD_REV,',
'                              :global_user,',
'                              v_lang,',
'                              v_res,',
'                              v_res1,',
'                              var_msg,',
'                              var_err,',
'                              :P92_P_SUPLR_ID);',
'',
'         IF :P92_P_WF_TYPE IN (''WF_SCOA'', ''WF_PCHD'', ''WF_SCO_MAX'')',
'         THEN',
'            v_res := v_res1;',
'         ELSE',
'            v_res := ''Y'';',
'         END IF;',
'      ELSE',
'         UPDATE work_flow_doc_control',
'            SET wfdc_act = ''A'',',
'                wfdc_status = v_cur_proc,',
'                wfdc_seq_no = wfdc_seq_no + 1,',
'                wfdc_upd_by = :global_user,',
'                wfdc_upd_date = SYSDATE,',
'                wfdc_frwd_rtn = NULL,',
'                wfdc_action_date = SYSDATE,',
'                wfdc_select_flag = 1,',
'                wfdc_priority = :P92_WFT_PRIORITY,',
'                wfdc_fwd_person = :global_user,',
'                wfdc_fwd_on = SYSDATE,',
'                wfdc_src_bu = :global_bu,',
'                wfdc_src_plnt = :P92_P_PLNT,',
'                wfdc_src_user = :global_user,',
'                wfdc_mail_send_flag =CASE WHEN :mail_flag = ''Y'' THEN ''Y'' ELSE ''N'' END',
'          WHERE wfdc_bu = :global_bu',
'			AND wfdc_type = :P92_P_WF_TYPE',
'			AND wfdc_wf_no = v_wf_no;',
'      END IF;',
'',
'      IF var_err IS NOT NULL',
'      THEN',
'         v_err  := var_err;',
'      END IF;',
'',
'      IF var_msg IS NOT NULL',
'      THEN',
'         NULL;--alert_msg (var_msg, ''N'');',
'      END IF;',
'',
'      IF v_res = ''Y''',
'      THEN',
'          apex_application.g_print_success_message := ''Document Approved'' ;',
'      END IF;',
'   END IF;                                              -- END OF ONLY APPROVE',
'',
'   IF :P92_FWD_FLAG = ''Y'' AND :P92_APPR_FLAG = ''N'' AND v_res = ''Y''',
'   THEN',
'',
'      IF :P92_P_WF_TYPE = ''WF_PCHD''',
'      THEN',
'         UPDATE prod_transfer',
'            SET pt_status = ''E'',',
'                pt_upd_by = :global_user,',
'                pt_upd_date = SYSDATE',
'          WHERE pt_bu = :global_bu',
'			AND pt_plnt = :P92_P_PLNT',
'			AND pt_doc_no = :P92_P_DOC_NO',
'			AND pt_status = ''N'';',
'      END IF;',
'',
'      IF :P92_P_WF_TYPE IN (''WF_DDA'', ''WF_DDDA'')',
'      THEN',
'         UPDATE suplr_doc_hd_hist',
'            SET suphdh_dev_hand_flag = ''AP''',
'          WHERE suphdh_bu = :global_bu',
'			AND suphdh_pfx = :P92_P_DOC_PFX',
'			AND suphdh_doc_no = :P92_P_DOC_NO;',
'      END IF;',
'',
'      IF v_auth_type = ''P''',
'      THEN',
'         v_ctrl_person := func_find_position_id (:P92_FWD_ENTITY, :P92_FWD_USER);',
'         v_emp_id := func_find_emp_id (:P92_FWD_ENTITY, :P92_FWD_USER);',
'      ELSIF v_auth_type = ''E''',
'      THEN',
'         v_ctrl_person := func_find_emp_id (:P92_FWD_ENTITY, :P92_FWD_USER);',
'         v_emp_id := v_ctrl_person;',
'      END IF;',
'',
'      v_appr_bu :=  func_find_wf_resp_person_bu(:global_bu,:P92_P_WF_TYPE,func_find_emp_id (:global_bu, :global_user),v_emp_id,1);',
'',
'      v_appr_plnt := func_find_wf_resp_person_plnt(:global_bu,:P92_P_WF_TYPE,func_find_emp_id (:global_bu, :global_user),v_emp_id,1);',
'',
'      UPDATE work_flow_doc_control',
'         SET wfdc_ctrl_person = v_ctrl_person,',
'             wfdc_fwd_person = :global_user,',
'             wfdc_fwd_on = SYSDATE,',
'             wfdc_fwd_to = :P92_FWD_USER,',
'             wfdc_frwd_rtn = ''F'',',
'             wfdc_act = ''F'',',
'             wfdc_seq_no =func_find_wf_appr_seq_no (:P92_FWD_ENTITY,:P92_FWD_PLNT,:P92_P_WF_TYPE,v_ctrl_person),',
'             wfdc_message = :P92_WFT_MESSAGE,',
'             wfdc_action_date = SYSDATE,',
'             wfdc_priority = :P92_WFT_PRIORITY,',
'             wfdc_bu = v_appr_bu,',
'             wfdc_plnt = v_appr_plnt,',
'             wfdc_src_bu = :global_bu,',
'             wfdc_src_plnt = :P92_P_PLNT,',
'             wfdc_src_user = :global_user,',
'             wfdc_mail_send_flag =CASE WHEN :mail_flag = ''Y'' THEN ''Y'' ELSE ''N'' END,',
'             wfdc_upd_by = :global_user',
'       WHERE wfdc_bu = :global_bu',
'		 AND wfdc_type = :P92_P_WF_TYPE',
'		 AND wfdc_wf_no = v_wf_no;',
'',
'      apex_application.g_print_success_message := ''Document Forwarded.'' ;',
'   END IF;                                              -- END OF ONLY FORWARD',
'',
'   IF :P92_APPR_FLAG = ''Y'' AND :P92_FWD_FLAG = ''Y''',
'   THEN',
'      IF v_auth_type = ''P''',
'      THEN',
'         v_ctrl_person := func_find_position_id (:P92_FWD_ENTITY, :P92_FWD_USER);',
'         v_emp_id := func_find_emp_pos_id (:P92_FWD_ENTITY, v_ctrl_person);',
'      ELSIF v_auth_type = ''E''',
'      THEN',
'         v_ctrl_person := func_find_emp_id (:P92_FWD_ENTITY, :P92_FWD_USER);',
'         v_emp_id := v_ctrl_person;',
'      END IF;',
'',
'      v_seq_no     := func_find_wf_appr_seq_no (:P92_FWD_ENTITY,:P92_FWD_PLNT,:P92_P_WF_TYPE,v_ctrl_person);',
'      ',
'	  v_appr_bu    := func_find_wf_resp_person_bu (:global_bu,:P92_P_WF_TYPE,func_find_emp_id (:global_bu, :global_user),v_emp_id,1);',
'      ',
'	  v_appr_plnt  := func_find_wf_resp_person_plnt (:global_bu,:P92_P_WF_TYPE,func_find_emp_id (:global_bu, :global_user),v_emp_id,1);',
'',
'      IF v_cur_proc = v_last_proc',
'      THEN',
'         p_out := ''N'';',
'		 ',
'         proc_work_flow_auth (:global_bu,',
'                              :P92_P_PLNT,',
'                              :P92_P_WF_TYPE,',
'                              v_ctrl_person,',
'                              v_wf_value,',
'                              v_seq_no,',
'                              p_out,',
'                              p_disc_pct   => v_wf_disc_pct,',
'                              p_rqst_pfx   => :P92_P_DOC_PFX);',
'',
'         IF p_out = ''C''',
'         THEN',
'            v_err  :=  ''Configure Authorization limit'';',
'         ELSIF p_out = ''E''',
'         THEN',
'            v_err  := ''Authorization limit exceeds'';',
'         ELSIF p_out = ''A''',
'         THEN',
'            v_err  :=  ''Not an authorized user2.'';',
'         ELSIF p_out = ''M''',
'         THEN',
'            v_err  := ''Work FLow Document Value Missing'';',
'         END IF;',
'',
'         UPDATE work_flow_doc_control',
'            SET wfdc_act = ''A'',',
'                wfdc_upd_by = :global_user,',
'                wfdc_upd_date = SYSDATE',
'          WHERE wfdc_bu = :global_bu',
'			AND wfdc_type = :P92_P_WF_TYPE',
'			AND wfdc_wf_no = v_wf_no;',
'',
'',
'         proc_wf_doc_approve (:global_bu,',
'                              cr2.wfdc_wf_no,',
'                              :P92_P_WF_TYPE,',
'                              cr2.wf_module,',
'                              :global_bu,',
'                              :P92_P_PLNT,',
'                              :P92_P_DOC_PFX,',
'                              :P92_P_DOC_NO,',
'                              :P92_P_DOC_SFX,',
'                              :P92_P_PROD_ID,',
'                              :P92_P_PROD_REV,',
'                              :global_user,',
'                              v_lang,',
'                              v_res,',
'                              v_res1,',
'                              var_msg,',
'                              var_err,',
'                              :P92_P_SUPLR_ID);',
'    ',
'',
'      ELSE',
'         UPDATE work_flow_doc_control',
'            SET wfdc_status = v_cur_proc,',
'                wfdc_seq_no = wfdc_seq_no + 1,',
'                wfdc_act = ''A'',',
'                wfdc_upd_by = :global_user,',
'                wfdc_upd_date = SYSDATE,',
'                wfdc_frwd_rtn = NULL,',
'                wfdc_action_date = SYSDATE,',
'                wfdc_select_flag = 0,',
'                wfdc_priority = :P92_WFT_PRIORITY,',
'                wfdc_fwd_person = :global_user,',
'                wfdc_fwd_on = SYSDATE,',
'                wfdc_src_bu = :global_bu,',
'                wfdc_src_plnt = :P92_P_PLNT,',
'                wfdc_src_user = :global_user',
'          WHERE wfdc_bu = :global_bu',
'			AND wfdc_type = :P92_P_WF_TYPE',
'			AND wfdc_wf_no = v_wf_no;',
'',
'         v_res1 := ''Y'';',
'      END IF;',
'',
'      UPDATE work_flow_doc_control',
'         SET wfdc_ctrl_person = v_ctrl_person,',
'             wfdc_fwd_person = :global_user,',
'             wfdc_fwd_on = SYSDATE,',
'             wfdc_fwd_to = :P92_FWD_USER,',
'             wfdc_frwd_rtn = ''F'',',
'             wfdc_act = ''F'',',
'             wfdc_message = :P92_WFT_MESSAGE,',
'             wfdc_action_date = SYSDATE,',
'             wfdc_priority = :P92_WFT_PRIORITY,',
'             wfdc_bu = v_appr_bu,',
'             wfdc_plnt = v_appr_plnt,',
'             wfdc_src_bu = :global_bu,',
'             wfdc_src_plnt = :P92_P_PLNT,',
'             wfdc_src_user = :global_user,',
'             wfdc_upd_by = :global_user,',
'             wfdc_upd_date = SYSDATE,',
'             wfdc_mail_send_flag =CASE WHEN :mail_flag = ''Y'' THEN ''Y'' ELSE ''N'' END',
'       WHERE wfdc_bu = :global_bu',
'		 AND wfdc_type = :P92_P_WF_TYPE',
'		 AND wfdc_wf_no = v_wf_no;',
'',
'',
'      IF v_res1 = ''Y''',
'      THEN',
'         apex_application.g_print_success_message := ''Document Approved and Forwarded.'' ;',
'      END IF;',
'   END IF;                                  -- END OF BOTH FORWARD AND APPROVE',
'',
'   UPDATE work_flow_doc_control',
'      SET wfdc_act = ''W'',',
'          wfdc_upd_by = :global_user,',
'          wfdc_upd_date = SYSDATE',
'    WHERE wfdc_bu = v_appr_bu',
'	  AND wfdc_type = :P92_P_WF_TYPE',
'	  AND wfdc_wf_no = v_wf_no;',
'',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1519716204264200635
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001675628691811588)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(16860953268859636906)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Workflow Approval'
,p_static_id=>'process-form-workflow-approval'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1519713793148200560
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001677671416811653)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Old'
,p_static_id=>'process-old'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 8/8/2022 3:31:09 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   CURSOR c_wf',
'   IS',
'      SELECT wf_auth_type',
'        FROM work_flow',
'       WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P92_P_WF_TYPE;',
'',
'   CURSOR C0',
'   IS',
'      SELECT *',
'        FROM (  SELECT *',
'                  FROM WORK_FLOW_APPR_ACTVT',
'                 WHERE WFAA_BU = :GLOBAL_BU',
'                       AND WFAA_WF_ID = :P92_P_WF_TYPE',
'              ORDER BY WFAA_SEQ_NO DESC)',
'       WHERE ROWNUM = 1;',
'',
'   CURSOR C1',
'   IS',
'      SELECT *',
'        FROM (  SELECT *',
'                  FROM WORK_FLOW_APPR_ACTVT',
'                 WHERE WFAA_BU = :GLOBAL_BU',
'                       AND WFAA_WF_ID = :P92_P_WF_TYPE',
'              ORDER BY WFAA_SEQ_NO)',
'       WHERE ROWNUM = 1;',
'',
'',
'   v_auth_type      work_flow.wf_auth_type%TYPE;',
'',
'   CR0              C0%ROWTYPE;',
'   CR1              C1%ROWTYPE;',
'',
'   V_RES            VARCHAR2 (4000) := ''N'';',
'   V_RES1           VARCHAR2 (4000) := ''N'';',
'   V_RES2           VARCHAR2 (4000) := ''N'';',
'   V_RES3           NUMBER;',
'   V_LAST_PROC      VARCHAR2 (2);',
'   V_CUR_PROC       VARCHAR2 (2);',
'',
'   CURSOR C2',
'   IS',
'        SELECT  WFDC_SEQ_NO,WFDC_WF_NO,WFDC_TYPE,WFDC_VALUE,WFDC_CTRL_PERSON,wfdc_rnd_prj_id,',
'       wfdc_qc_rev,wfdc_qc_ins_mode,wfdc_disc_pct,wfdc_doc_no,wfdc_benf_type,wfdc_benf_id,wfdc_proj_id,wfdc_work_site',
'          FROM WORK_FLOW_DOC_CONTROL',
'         WHERE WFDC_BU = :GLOBAL_BU AND WFDC_TYPE = :P92_P_WF_TYPE',
'               AND (WFDC_PLNT = :P92_P_PLNT',
'                    OR :P92_P_PLNT IS NULL)',
'               AND (WFDC_DOC_PFX = :P92_P_DOC_PFX',
'                    OR :P92_P_DOC_PFX IS NULL)',
'               AND (WFDC_DOC_NO = :P92_P_DOC_NO',
'                    OR :P92_P_DOC_NO IS NULL)',
'               AND (WFDC_DOC_SFX = :P92_P_DOC_SFX',
'                    OR :P92_P_DOC_SFX IS NULL)',
'               AND (WFDC_PROD_ID = :P92_P_PROD_ID',
'                    OR :P92_P_PROD_ID IS NULL)',
'               AND (WFDC_PROD_REV = :P92_P_PROD_REV',
'                    OR :P92_P_PROD_REV IS NULL)',
'               AND (WFDC_SPPLR_ID = :P92_P_SUPLR_ID',
'                    OR :P92_P_SUPLR_ID IS NULL)',
'               AND (WFDC_CUST_ID = :P92_P_CUST_ID',
'                    OR :P92_P_CUST_ID IS NULL)',
'               AND (WFDC_PRJ_ID = :P92_P_PROJ_ID',
'                    OR :P92_P_PROJ_ID IS NULL)',
'               AND (WFDC_RND_PRJ_ID = :P92_P_RND_PROJ_ID',
'                    OR :P92_P_RND_PROJ_ID IS NULL)',
'               AND (WFDC_LVL1 = :P92_P_LVL1',
'                    OR :P92_P_LVL1 IS NULL)',
'               AND (WFDC_LVL2 = :P92_P_LVL2',
'                    OR :P92_P_LVL2 IS NULL)',
'               AND (WFDC_LVL3 = :P92_P_LVL3',
'                    OR :P92_P_LVL3 IS NULL)',
'               AND (WFDC_LVL4 = :P92_P_LVL4',
'                    OR :P92_P_LVL4 IS NULL)',
'               AND (WFDC_ACCTS = :P92_P_ACCT',
'                    OR :P92_P_ACCT IS NULL)',
'               AND (WFDC_JRNL_TYPE = :P92_P_JRNL_TYPE',
'                    OR :P92_P_JRNL_TYPE IS NULL)',
'      ORDER BY 1 DESC;',
'',
'   CURSOR C3',
'   IS',
'      SELECT WFMC_DOC_COMP',
'        FROM WFM_CONTROL',
'       WHERE WFMC_BU = :GLOBAL_BU;',
'',
'   CURSOR c4',
'   IS',
'      SELECT COUNT (*) v_dir_auth_cnt',
'        FROM WF_DIRECT_AUTHORIZATION',
'       WHERE WFDA_BU = :global_bu AND WFDA_TYPE = :P92_P_WF_TYPE;',
'',
'   CR2              C2%ROWTYPE;',
'   CR3              C3%ROWTYPE;',
'   CR4              C4%ROWTYPE;',
'',
'',
'   v_dir_auth_cnt   NUMBER;',
'   v_wf_no          VARCHAR2 (15);',
'   p_out            VARCHAR2 (1);',
'   v_wf_value       NUMBER;',
'   v_wf_disc_pct    NUMBER;',
'   v_ctrl_person    VARCHAR2 (50);',
'   v_emp_id         VARCHAR2 (10);',
'   v_seq_no         NUMBER;',
'   v_wf_control     VARCHAR2 (1);',
'   v_wf_status      VARCHAR2 (2);',
'   v_out            VARCHAR2 (1);',
'   v_appr_bu        VARCHAR2 (5);',
'   v_appr_plnt      VARCHAR2 (10);',
'   var_msg          VARCHAR2 (4000);',
'   var_err          VARCHAR2 (4000);',
'   v_error          VARCHAR2 (1000);',
'BEGIN',
'   OPEN c_wf;',
'',
'   FETCH c_wf INTO v_auth_type;',
'',
'   CLOSE c_wf;',
'',
'   OPEN C0;',
'',
'   FETCH C0 INTO CR0;',
'',
'   IF C0%FOUND',
'   THEN',
'      V_LAST_PROC := CR0.WFAA_STATUS;',
'   END IF;',
'',
'   CLOSE C0;',
'',
'   OPEN C1;',
'',
'   FETCH C1 INTO CR1;',
'',
'   IF C1%FOUND',
'   THEN',
'      V_CUR_PROC := CR1.WFAA_STATUS;',
'   END IF;',
'',
'   CLOSE C1;',
'',
'   OPEN C3;',
'',
'   FETCH C3 INTO CR3;',
'',
'   IF C3%NOTFOUND',
'   THEN',
'      V_WF_CONTROL := ''S'';',
'   ELSE',
'      V_WF_CONTROL := CR3.WFMC_DOC_COMP;',
'   END IF;',
'',
'   CLOSE C3;',
'',
'   OPEN c4;',
'',
'   FETCH c4 INTO cr4;',
'',
'   CLOSE c4;',
'',
'   --Raise_application_error(-20999,''Authorization Not Defined''||cr4.v_dir_auth_cnt||:P92_P_WF_TYPE);',
'   IF cr4.v_dir_auth_cnt = 0',
'   THEN',
'      Raise_application_error (-20020, ''WFM'');',
'   ELSE',
'      /* Document status Changed from "New" To "Entry Completed" */',
'',
'      OPEN C2;',
'',
'      FETCH C2 INTO CR2;',
'',
'      CLOSE C2;',
'  --RAISE_APPLICATIon_ERROR(-20999,:P92_P_DATE);',
'   --RAISE_APPLICATIon_ERROR(-20999,''Test123'' || :P92_APPR_FLAG || ''/'' || :P92_FWD_FLAG || ''/'' ||  V_RES );',
'      PROC_WF_ENTRY_COMPL (:GLOBAL_BU,',
'                           :P92_P_PLNT,',
'                           CR2.WFDC_WF_NO,',
'                           :P92_P_DOC_PFX,',
'                           :P92_P_DOC_SFX,',
'                           :P92_P_DOC_NO,',
'                           TO_DATE (:P92_P_DATE),',
'                           :P92_P_WF_TYPE,',
'                           :P92_P_SUPLR_ID,',
'                           :P92_P_CUST_ID,',
'                           :P92_P_PROD_ID,',
'                           :P92_P_PROD_REV,',
'                           :P92_P_JRNL_TYPE,',
'                           :P92_P_PROJ_ID,',
'                           :P92_P_LVL1,',
'                           :P92_P_LVL2,',
'                           :P92_P_LVL3,',
'                           :P92_P_LVL4,',
'                           :P92_P_ACCT,',
'                           NULL,',
'                           NULL,',
'                           NULL,',
'                           :GLOBAL_USER,',
'                           :P92_P_LANG,',
'                           VAR_MSG,',
'                           V_RES);',
'',
'',
'      -- RAISE_APPLICATIon_ERROR(-20999,''Test123'' || :P92_APPR_FLAG || ''/'' || :P92_FWD_FLAG || ''/'' ||  V_RES );',
'      --commented by sentha - start (08Aug2022)',
'      /*UPDATE WF_DOC_CONTROL_LOG',
'         SET WFDCL_SRC_BU = :GLOBAL_BU,',
'             WFDCL_SRC_PLNT = :P92_P_PLNT,',
'             WFDCL_SRC_USER = :GLOBAL_USER',
'       WHERE     WFDCL_BU = :GLOBAL_BU',
'             AND WFDCL_TYPE = :P92_P_WF_TYPE',
'             AND WFDCL_DOC_NO = :P92_P_DOC_NO; */',
'',
'      --COMMIT;',
'      --commented by sentha - end (08Aug2022)',
'',
'',
'      IF VAR_MSG IS NOT NULL',
'      THEN',
'         v_error := VAR_MSG;',
'      END IF;',
'',
'',
'      OPEN C2;',
'',
'      FETCH C2 INTO CR2;',
'',
'      IF C2%FOUND',
'      THEN',
'         -- raise_application_error(-20999,VAR_MSG||''Res/''||V_RES||''CR2.WFDC_WF_NO/''||CR2.WFDC_WF_NO);',
'         v_wf_no := cr2.wfdc_wf_no;',
'         v_wf_value := cr2.wfdc_value;',
'         v_ctrl_person := cr2.wfdc_ctrl_person;',
'         v_seq_no := cr2.wfdc_seq_no;',
'         v_wf_disc_pct := cr2.wfdc_disc_pct;',
'      /*    UPDATE WORK_FLOW_DOC_CONTROL',
'             SET WFDC_MAIL_FLAG = :P92_MAIL_FLAG',
'           WHERE WFDC_BU = :GLOBAL_BU AND WFDC_WF_NO = CR2.WFDC_WF_NO;*/',
'      END IF;',
'',
'      CLOSE C2;',
'',
'      --added by sentha - start (08Aug2022)',
'      IF v_wf_control = ''N''',
'      THEN',
'         proc_work_flow_dir_auth_nonseq (:GLOBAL_BU,',
'                                         :P92_P_PLNT,',
'                                         :P92_P_WF_TYPE,',
'                                         :GLOBAL_USER,',
'                                         v_cur_proc,',
'                                         v_out);',
'      END IF;',
'',
'      --added by sentha - end (08Aug2022)',
'',
'',
'      IF     :P92_APPR_FLAG = ''Y''',
'         AND :P92_FWD_FLAG = ''N''',
'         AND V_RES = ''Y''',
'      THEN',
'         IF V_CUR_PROC = V_LAST_PROC',
'         THEN',
'            P_OUT := ''N'';',
'',
'            IF v_wf_control = ''S''',
'            THEN',
'               PROC_WORK_FLOW_AUTH (:GLOBAL_BU,',
'                                    :P92_P_PLNT,',
'                                    :P92_P_WF_TYPE,',
'                                    V_CTRL_PERSON,',
'                                    V_WF_VALUE,',
'                                    NVL (V_SEQ_NO, 0),',
'                                    P_OUT,',
'                                    p_disc_pct   => v_wf_disc_pct,',
'                                    p_rqst_pfx   => :P92_P_DOC_PFX);',
'            --raise_application_error(-20999,''test3'');',
'            ELSE',
'               v_seq_no :=',
'                  func_find_wf_appr_seq_no (:GLOBAL_BU,',
'                                            :P92_P_PLNT,',
'                                            :P92_P_WF_TYPE,',
'                                            v_ctrl_person,',
'                                            NULL,',
'                                            ''A'',',
'                                            v_wf_value);',
'            END IF;',
'',
'',
'            IF P_OUT = ''C''',
'            THEN',
'               v_error := ''Configure Authorization limit'';',
'            ELSIF P_OUT = ''E''',
'            THEN',
'               v_error := ''Authorization limit exceeds'';',
'            ELSIF P_OUT = ''A''',
'            THEN',
'               v_error := ''Not an authorized user'';',
'            ELSIF P_OUT = ''M''',
'            THEN',
'               v_error := ''Work Flow Document Value Missing'';',
'            END IF;',
'',
'            UPDATE work_flow_doc_control',
'               SET wfdc_act = ''A'',',
'                   wfdc_upd_by = :GLOBAL_USER,',
'                   wfdc_upd_date = SYSDATE',
'             WHERE     wfdc_bu = :GLOBAL_BU',
'                   AND wfdc_type = :P92_P_WF_TYPE',
'                   AND wfdc_wf_no = v_wf_no;',
'',
'',
'            IF :P92_P_WF_TYPE IN (''WF_PRA'', ''WF_WFPR'')',
'            THEN',
'               proc_wf_doc_approve (:GLOBAL_BU,',
'                                    :P92_P_PLNT,',
'                                    :P92_P_WF_TYPE,',
'                                    v_cur_proc,',
'                                    :P92_P_DOC_PFX,',
'                                    :P92_P_DOC_NO,',
'                                    :P92_P_DOC_SFX,',
'                                    :P92_P_PROD_ID,',
'                                    :P92_P_PROD_REV,',
'                                    :P92_P_SUPLR_ID,',
'                                    :P92_P_CUST_ID,',
'                                    :P92_P_EMP_ID,',
'                                    TRUNC (SYSDATE),',
'                                    :GLOBAL_USER,',
'                                    1,',
'                                    v_res);',
'            END IF;',
'',
'',
'            OPEN C2;',
'',
'            FETCH C2 INTO CR2;',
'',
'            CLOSE C2;',
'',
'            /* Document Approval Procedure */',
'',
'            PROC_WF_APPROVE (:GLOBAL_BU,',
'                             :GLOBAL_BU,',
'                             :P92_P_PLNT,',
'                             :P92_P_DOC_SFX,',
'                             :P92_P_DOC_PFX,',
'                             :P92_P_DOC_NO,',
'                             TO_DATE (:P92_P_DATE),',
'                             :P92_P_WF_TYPE,',
'                             CR2.WFDC_WF_NO,',
'                             :P92_P_SUPLR_ID,',
'                             :P92_P_CUST_ID,',
'                             :P92_P_PROD_ID,',
'                             :P92_P_PROD_REV,',
'                             :P92_P_JRNL_TYPE,',
'                             :P92_P_RND_PROJ_ID,',
'                             :P92_P_PROJ_ID,',
'                             :P92_P_LVL1,',
'                             :P92_P_LVL2,',
'                             :P92_P_LVL3,',
'                             :P92_P_LVL4,',
'                             :P92_P_LVL_PRJ,',
'                             :P92_P_ACCT,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             CR2.WFDC_QC_INS_MODE,',
'                             CR2.WFDC_QC_REV,',
'                             :GLOBAL_USER,',
'                             :P92_P_LANG,',
'                             V_RES,',
'                             V_RES3,',
'                             VAR_MSG,',
'                             VAR_ERR,',
'                             NULL,',
'                             NULL);',
'',
'',
'            IF VAR_MSG IS NOT NULL',
'            THEN',
'               v_error := VAR_MSG;',
'            END IF;',
'',
'            IF VAR_ERR IS NOT NULL',
'            THEN',
'               v_error := VAR_ERR;',
'            END IF;',
'         ELSE',
'            UPDATE WORK_FLOW_DOC_CONTROL',
'               SET WFDC_ACT = ''A'',',
'                   WFDC_STATUS = V_CUR_PROC,',
'                   WFDC_SEQ_NO = WFDC_SEQ_NO + 1,',
'                   WFDC_UPD_BY = :GLOBAL_USER,',
'                   WFDC_UPD_DATE = SYSDATE,',
'                   WFDC_FRWD_RTN = NULL,',
'                   WFDC_ACTION_DATE = SYSDATE,',
'                   WFDC_SELECT_FLAG = 1,',
'                   WFDC_PRIORITY = :P92_WFT_PRIORITY,',
'                   WFDC_FWD_PERSON = :GLOBAL_USER,',
'                   WFDC_FWD_ON = SYSDATE,',
'                   WFDC_SRC_BU = :GLOBAL_BU,',
'                   WFDC_SRC_PLNT = :P92_P_PLNT,',
'                   WFDC_SRC_USER = :GLOBAL_USER,',
'                   wfdc_mail_send_flag =',
'                      CASE',
'                         WHEN :P92_MAIL_FLAG = ''Y'' THEN ''Y''',
'                         ELSE ''N''',
'                      END',
'             WHERE     WFDC_BU = :GLOBAL_BU',
'                   AND WFDC_TYPE = :P92_P_WF_TYPE',
'                   AND WFDC_WF_NO = V_WF_NO;',
'         END IF;',
'',
'         IF V_RES = ''Y''',
'         THEN',
'            --:P92_MSG := ''Document  approved.'';',
'          --  v_error := ''Document  approved.'';',
'          null;',
'         END IF;',
'      END IF;                                           -- END OF ONLY APPROVE',
'',
'      IF     :P92_FWD_FLAG = ''Y''',
'         AND :P92_APPR_FLAG = ''N''',
'         AND V_RES = ''Y''',
'      THEN',
'         -- raise_application_error(-20999,''Test123'' || :P92_APPR_FLAG || ''/'' || :P92_FWD_FLAG || ''/'' || V_RES);',
'',
'',
'         --raise_application_error(-20999,''test'' || :P92_FWD_ENTITY || ''/'' || :P92_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P92_FWD_PERSON);',
'         IF v_auth_type = ''P''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_position_id (:P92_FWD_ENTITY,',
'                                      :P92_FWD_USER);',
'            v_emp_id :=',
'               func_find_emp_pos_id (:P92_FWD_ENTITY, v_ctrl_person);',
'         --null;',
'         ELSIF v_auth_type = ''E''',
'         THEN',
'            --  raise_application_error(-20999,''test sentha ''|| :P92_FWD_ENTITY || ''/'' || :P92_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P92_FWD_PERSON );',
'            v_ctrl_person :=',
'               func_find_emp_id (:P92_FWD_ENTITY,',
'                                 :P92_FWD_USER);',
'            v_emp_id := v_ctrl_person;',
'         --null;',
'         --raise_application_error(-20999,''test'' || :P92_FWD_ENTITY || ''/'' || :P92_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P92_FWD_PERSON);',
'         END IF;',
'',
'',
'         --raise_application_error(-20999,''test'' || :P92_FWD_ENTITY || ''/'' || :P92_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P92_FWD_PERSON);',
'',
'         /*  V_CTRL_PERSON :=',
'              FUNC_FIND_POSITION_ID ( :P92_FWD_ENTITY, :P92_FWD_USER);*/',
'',
'         --raise_application_error(-20999,''HRM'');',
'',
'         --raise_application_error(-20999,:P92_P_WF_TYPE||''/''||v_emp_id||''/''||v_ctrl_person||''/''||v_auth_type);',
'',
'         V_APPR_BU :=',
'            FUNC_FIND_WF_RESP_PERSON_BU (',
'               :GLOBAL_BU,',
'               :P92_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               FUNC_FIND_EMP_POS_ID (:P92_FWD_ENTITY, V_CTRL_PERSON),',
'               1);',
'         V_APPR_PLNT :=',
'            FUNC_FIND_WF_RESP_PERSON_PLNT (',
'               :GLOBAL_BU,',
'               :P92_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               v_emp_id,',
'               1);',
'',
'         UPDATE WORK_FLOW_DOC_CONTROL',
'            SET WFDC_CTRL_PERSON = V_CTRL_PERSON,',
'                WFDC_FWD_PERSON = :GLOBAL_USER,',
'                WFDC_FWD_ON = SYSDATE,',
'                WFDC_FWD_TO = :P92_FWD_USER,',
'                WFDC_FRWD_RTN = ''F'',',
'                WFDC_ACT = ''F'',',
'                WFDC_SEQ_NO =',
'                   FUNC_FIND_WF_APPR_SEQ_NO (:P92_FWD_ENTITY,',
'                                             :P92_FWD_PLNT,',
'                                             :P92_P_WF_TYPE,',
'                                             V_CTRL_PERSON),',
'                WFDC_MESSAGE = :P92_WFT_MESSAGE,',
'                WFDC_ACTION_DATE = SYSDATE,',
'                WFDC_PRIORITY = :P92_WFT_PRIORITY,',
'                WFDC_BU = V_APPR_BU,',
'                WFDC_PLNT = V_APPR_PLNT,',
'                WFDC_SRC_BU = :GLOBAL_BU,',
'                WFDC_SRC_PLNT = :P92_P_PLNT,',
'                WFDC_SRC_USER = :GLOBAL_USER,',
'                wfdc_mail_send_flag =',
'                   CASE',
'                      WHEN :P92_MAIL_FLAG = ''Y'' THEN ''Y''',
'                      ELSE ''N''',
'                   END,',
'                wfdc_upd_by = :GLOBAL_USER',
'          WHERE     WFDC_BU = :GLOBAL_BU',
'                AND WFDC_TYPE = :P92_P_WF_TYPE',
'                AND WFDC_WF_NO = V_WF_NO;',
'',
'',
'         v_error := ''The document has been forwarded!'';',
'      --:P92_MSG := ''The document has been forwarded!'';',
'      END IF;                                           -- END OF ONLY FORWARD',
'',
'',
'',
'      IF :P92_APPR_FLAG = ''Y'' AND :P92_FWD_FLAG = ''Y''',
'      THEN',
'         IF v_auth_type = ''P''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_position_id (:P92_FWD_ENTITY,',
'                                      :P92_FWD_USER);',
'            v_emp_id :=',
'               func_find_emp_pos_id (:P92_FWD_ENTITY, v_ctrl_person);',
'         ELSIF v_auth_type = ''E''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_emp_id (:P92_FWD_ENTITY,',
'                                 :P92_FWD_USER);',
'            v_emp_id := v_ctrl_person;',
'         END IF;',
'',
'         /* V_CTRL_PERSON :=',
'             FUNC_FIND_POSITION_ID ( :P92_FWD_ENTITY, :P92_FWD_USER);*/',
'',
'',
'         V_SEQ_NO :=',
'            FUNC_FIND_WF_APPR_SEQ_NO (:P92_FWD_ENTITY,',
'                                      :P92_FWD_PLNT,',
'                                      :P92_P_WF_TYPE,',
'                                      V_CTRL_PERSON);',
'         V_APPR_BU :=',
'            FUNC_FIND_WF_RESP_PERSON_BU (',
'               :GLOBAL_BU,',
'               :P92_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               FUNC_FIND_EMP_POS_ID (:P92_FWD_ENTITY, V_CTRL_PERSON),',
'               1);',
'         V_APPR_PLNT :=',
'            FUNC_FIND_WF_RESP_PERSON_PLNT (',
'               :GLOBAL_BU,',
'               :P92_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               v_emp_id,',
'               1);',
'',
'         IF V_CUR_PROC = V_LAST_PROC',
'         THEN',
'            P_OUT := ''N'';',
'',
'            PROC_WORK_FLOW_AUTH (:GLOBAL_BU,',
'                                 :P92_P_PLNT,',
'                                 :P92_P_WF_TYPE,',
'                                 V_CTRL_PERSON,',
'                                 V_WF_VALUE,',
'                                 V_SEQ_NO,',
'                                 P_OUT);',
'',
'            IF P_OUT = ''C''',
'            THEN',
'               v_error := ''Configure Authorization limit'';',
'            ELSIF P_OUT = ''E''',
'            THEN',
'               v_error := ''Authorization limit exceeds'';',
'            ELSIF P_OUT = ''A''',
'            THEN',
'               v_error := ''Not an authorized user'';',
'            ELSIF P_OUT = ''M''',
'            THEN',
'               v_error := ''Work FLow Document Value Missing'';',
'            END IF;',
'',
'            UPDATE work_flow_doc_control',
'               SET wfdc_act = ''A''',
'             WHERE     wfdc_bu = :GLOBAL_bu',
'                   AND wfdc_type = :P92_P_WF_TYPE',
'                   AND wfdc_wf_no = v_wf_no;',
'',
'',
'            PROC_WF_APPROVE (:GLOBAL_BU,',
'                             :GLOBAL_BU,',
'                             :P92_P_PLNT,',
'                             :P92_P_DOC_SFX,',
'                             :P92_P_DOC_PFX,',
'                             :P92_P_DOC_NO,',
'                             TO_DATE (:P92_P_DATE),',
'                             :P92_P_WF_TYPE,',
'                             CR2.WFDC_WF_NO,',
'                             :P92_P_SUPLR_ID,',
'                             :P92_P_CUST_ID,',
'                             :P92_P_PROD_ID,',
'                             :P92_P_PROD_REV,',
'                             :P92_P_JRNL_TYPE,',
'                             CR2.WFDC_RND_PRJ_ID,',
'                             :P92_P_PROJ_ID,',
'                             :P92_P_LVL1,',
'                             :P92_P_LVL2,',
'                             :P92_P_LVL3,',
'                             :P92_P_LVL4,',
'                             :P92_P_LVL_PRJ,',
'                             :P92_P_ACCT,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             CR2.WFDC_QC_INS_MODE,',
'                             CR2.WFDC_QC_REV,',
'                             :GLOBAL_USER,',
'                             :P92_P_LANG,',
'                             V_RES,',
'                             V_RES1,',
'                             VAR_MSG,',
'                             VAR_ERR);',
'         ELSE',
'            UPDATE WORK_FLOW_DOC_CONTROL',
'               SET WFDC_STATUS = V_CUR_PROC,',
'                   WFDC_SEQ_NO = WFDC_SEQ_NO + 1,',
'                   WFDC_ACT = ''A'',',
'                   WFDC_UPD_BY = :GLOBAL_USER,',
'                   WFDC_UPD_DATE = SYSDATE,',
'                   WFDC_FRWD_RTN = NULL,',
'                   WFDC_ACTION_DATE = SYSDATE,',
'                   WFDC_SELECT_FLAG = 0,',
'                   WFDC_PRIORITY = :P92_WFT_PRIORITY,',
'                   WFDC_FWD_PERSON = :GLOBAL_USER,',
'                   WFDC_FWD_ON = SYSDATE,',
'                   WFDC_SRC_BU = :GLOBAL_BU,',
'                   WFDC_SRC_PLNT = :P92_P_PLNT,',
'                   WFDC_SRC_USER = :GLOBAL_USER',
'             WHERE     WFDC_BU = :GLOBAL_BU',
'                   AND WFDC_TYPE = :P92_P_WF_TYPE',
'                   AND WFDC_WF_NO = V_WF_NO;',
'',
'            V_RES1 := ''Y'';',
'         END IF;',
'',
'',
'         UPDATE WORK_FLOW_DOC_CONTROL',
'            SET WFDC_CTRL_PERSON = V_CTRL_PERSON,',
'                WFDC_FWD_PERSON = :GLOBAL_USER,',
'                WFDC_FWD_ON = SYSDATE,',
'                WFDC_FWD_TO = :P92_FWD_USER,',
'                WFDC_FRWD_RTN = ''F'',',
'                WFDC_ACT = ''F'',',
'                WFDC_MESSAGE = :P92_WFT_MESSAGE,',
'                WFDC_ACTION_DATE = SYSDATE,',
'                WFDC_PRIORITY = :P92_WFT_PRIORITY,',
'                WFDC_BU = V_APPR_BU,',
'                WFDC_PLNT = V_APPR_PLNT,',
'                WFDC_SRC_BU = :GLOBAL_BU,',
'                WFDC_SRC_PLNT = :P92_P_PLNT,',
'                WFDC_SRC_USER = :GLOBAL_USER',
'          WHERE     WFDC_BU = :GLOBAL_BU',
'                AND WFDC_TYPE = :P92_P_WF_TYPE',
'                AND WFDC_WF_NO = V_WF_NO;',
'',
'',
'         IF V_RES1 = ''Y''',
'         THEN',
'            --:P92_MSG := ''Document  approved and Forwarded.'';',
'           -- v_error := ''Document Approved and Forwarded.'';',
'           null;',
'           ',
'         END IF;',
'      END IF;                               -- END OF BOTH FORWARD AND APPROVE',
'',
'      UPDATE WORK_FLOW_DOC_CONTROL',
'         SET WFDC_ACT = ''W''',
'       WHERE     WFDC_BU = V_APPR_BU',
'             AND WFDC_TYPE = :P92_P_WF_TYPE',
'             AND WFDC_WF_NO = V_WF_NO;',
'   --raise_application_error(-20999,''check'');',
'   END IF;',
'	  :P92_P_ERR := v_error;',
'/* command by bala',
'if v_error is not null then',
'raise_application_error(-20999, v_error);',
'else',
' raise_application_error (',
'         (SQLCODE),',
'         func_find_err_msg (:global_bu,',
'                            ABS (SQLCODE),',
'                            SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'                            1,',
'                            :GLOBAL_USER));',
'end if;',
'',
'EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      --func_find_err_msg(:global_bu,ABS(sqlcode),SUBSTR(REPLACE(sqlerrm,'' '',''''),11,3),1,:GLOBAL_USER);',
'      raise_application_error (',
'         (SQLCODE),',
'         func_find_err_msg (:global_bu,',
'                            ABS (SQLCODE),',
'                            SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'                            1,',
'                            :GLOBAL_USER));',
'',
'',
'      COMMIT;',
'',
'     */',
'	  ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1519715835873200625
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001677310954811651)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Project Time Sheet Validation'
,p_static_id=>'project-time-sheet-validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P92_P_WF_TYPE = ''WF_PRJ_EMPTC'' THEN',
'   ',
'   DECLARE',
'      ',
'      CURSOR c1',
'          IS',
'      SELECT *',
'        FROM proj_emp_time_card',
'       WHERE petc_bu     = :GLOBAL_BU',
'         AND petc_plnt   = :P92_P_PLNT',
'         AND petc_doc_no = :P92_P_DOC_NO;',
'       ',
'      cr1                                            c1%ROWTYPE;',
'       ',
'   BEGIN',
'      ',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'         ',
'         IF c1%FOUND THEN',
'            ',
'            IF cr1.petc_emp_comp_pct = 0 OR cr1.petc_aprvd_comp_pct = 0 THEN',
'               RAISE_APPLICATION_ERROR(-20999, ''Completion (%) should be greater than Zero.'');',
'            END IF;',
'            ',
'         END IF;',
'         ',
'      CLOSE c1;',
'      ',
'   END;',
'   ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1519715475411200623
);
wwv_flow_imp.component_end;
end;
/
