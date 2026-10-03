prompt --application/pages/page_236131090
begin
--   Manifest
--     PAGE: 236131090
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
 p_id=>236131090
,p_name=>'Workflow Approval'
,p_alias=>'WORKFLOW-APPROVAL'
,p_page_mode=>'MODAL'
,p_step_title=>'Workflow Approval'
,p_warn_on_unsaved_changes=>'N'
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
'    border-color: #dcdcdc;',
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
'    border-color: #dcdcdc;',
'    background-color: #dcdcdc;',
'}',
'',
'.t-Dialog-body {',
'    padding: 16px;',
'    background-color: #ffffff;',
'}',
'b, strong {',
'    font-weight: bolder;    ',
'    color: ghostwhite;',
'}',
'',
'',
'',
'.t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer {',
'    display: flex;',
'    padding: 3px;',
'    align-items: flex-start;',
'}',
'',
'.t-Region-body {',
'    font-size: 1.4rem;',
'    line-height: 0rem;',
'    overflow: auto;',
'    position: relative;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20355093354923303802)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_parent_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20355094665113303816)
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
 p_id=>wwv_flow_imp.id(20355127928042327417)
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
 p_id=>wwv_flow_imp.id(6376775331606113217)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(20355127928042327417)
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
 p_id=>wwv_flow_imp.id(6376775743716113217)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P236131090_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6376776104952113217)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P236131090_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6376768763176113209)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_button_name=>'Entry'
,p_static_id=>'entry'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Ok'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'data-testid="Entry"'
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6376774914125113216)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P236131090_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6335416398200643143)
,p_branch_name=>'Go to branches'
,p_branch_action=>'f?p=&P236131090_P_REDIR_URL.:&P236131090_P_PAGE_ID.:&SESSION.::&DEBUG.:&P236131090_P_PAGE_ID.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6376768763176113209)
,p_branch_sequence=>11
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P236131090_P_CTRL_PERSON'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6335417314152643152)
,p_branch_name=>'Go to branches'
,p_branch_action=>'&P236131090_P_REDIR_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6376768763176113209)
,p_branch_sequence=>41
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6376802794431113250)
,p_branch_name=>'Go To Page 236131010'
,p_branch_action=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6376768763176113209)
,p_branch_sequence=>31
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P236131090_P_CTRL_PERSON'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6376803194318113250)
,p_branch_name=>'Go To Page 5001090'
,p_branch_action=>'P236131090_P_PAGE_ID'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_sequence=>51
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12939535776664090887)
,p_name=>'P236131090_ACTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'Action'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT action_name d,action_id r',
'  FROM wf_apex_action',
' ORDER BY action_seq'))
,p_cHeight=>1
,p_tag_attributes=>'data-testid="P236131090_ACTION"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767860882815600163)
,p_name=>'P236131090_APPR_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6369866045762222021)
,p_name=>'P236131090_APP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767864883130600173)
,p_name=>'P236131090_DESC'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767895060786600232)
,p_name=>'P236131090_FWD_ENTITY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767861266048600163)
,p_name=>'P236131090_FWD_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767862483416600164)
,p_name=>'P236131090_FWD_PERSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Forward To</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORWARD_LOV15'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P236131090_P_PRJ_ID,P236131090_P_WF_TYPE'
,p_ajax_items_to_submit=>'P236131090_P_PRJ_ID,P236131090_P_WF_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_attributes=>'data-testid="P236131090_FWD_PERSON"'
,p_colspan=>3
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Forward To',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767862107430600164)
,p_name=>'P236131090_FWD_PERSON1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767862941437600167)
,p_name=>'P236131090_FWD_PERSON_2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly = readonly data-testid="P236131090_FWD_PERSON_2"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767895397454600232)
,p_name=>'P236131090_FWD_PLNT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767895840258600232)
,p_name=>'P236131090_FWD_USER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767861721698600164)
,p_name=>'P236131090_MAIL_FLAG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
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
 p_id=>wwv_flow_imp.id(12767865664472600173)
,p_name=>'P236131090_MSG'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767896685868600234)
,p_name=>'P236131090_PLNT_LOC_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
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
 p_id=>wwv_flow_imp.id(12767829136262600073)
,p_name=>'P236131090_P_ACCT'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6336071759221187909)
,p_name=>'P236131090_P_APPL_NO'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7091011479164973855)
,p_name=>'P236131090_P_CTRL_PERSON'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767826025711600068)
,p_name=>'P236131090_P_CUST_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767831563244600075)
,p_name=>'P236131090_P_DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767824021599600065)
,p_name=>'P236131090_P_DOC_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767823607800600065)
,p_name=>'P236131090_P_DOC_PFX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767824353162600067)
,p_name=>'P236131090_P_DOC_SFX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767826791511600068)
,p_name=>'P236131090_P_DOC_VALUE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767826366403600068)
,p_name=>'P236131090_P_EMP_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12780816846033743727)
,p_name=>'P236131090_P_ERR'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767831203113600075)
,p_name=>'P236131090_P_JRNL_TYPE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767832337803600076)
,p_name=>'P236131090_P_LANG'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_item_default=>'1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767827229181600070)
,p_name=>'P236131090_P_LVL1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767827629539600070)
,p_name=>'P236131090_P_LVL2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767827957369600070)
,p_name=>'P236131090_P_LVL3'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767828375747600070)
,p_name=>'P236131090_P_LVL4'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767828825343600072)
,p_name=>'P236131090_P_LVL_PRJ'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767831986026600076)
,p_name=>'P236131090_P_PAGE_ID'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767822338532600061)
,p_name=>'P236131090_P_PLNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767822815529600064)
,p_name=>'P236131090_P_PRJ_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767824760222600067)
,p_name=>'P236131090_P_PROD_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767825185316600067)
,p_name=>'P236131090_P_PROD_REV'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767830409557600075)
,p_name=>'P236131090_P_PROJ_ID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767829999038600073)
,p_name=>'P236131090_P_QC_MODE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767829536198600073)
,p_name=>'P236131090_P_QC_REV'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6335416299389643142)
,p_name=>'P236131090_P_REDIR_URL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767830829000600075)
,p_name=>'P236131090_P_RND_PROJ_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767825593921600067)
,p_name=>'P236131090_P_SUPLR_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10766731022661642524)
,p_name=>'P236131090_P_WF_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767823178702600065)
,p_name=>'P236131090_P_WF_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(20355093354923303802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767887877788600220)
,p_name=>'P236131090_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7091009842998973839)
,p_name=>'P236131090_RTN_PERSON'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Return To</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WF_RETURN_LOV2'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P236131090_P_WF_TYPE,P236131090_P_CTRL_PERSON,P236131090_P_WF_NO'
,p_ajax_items_to_submit=>'P236131090_P_WF_TYPE,P236131090_P_CTRL_PERSON,P236131090_P_WF_NO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_attributes=>'data-testid="PO_ForwardTo_Button"'
,p_colspan=>3
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Return To',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7091009899123973840)
,p_name=>'P236131090_RTN_PERSON_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly = readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6335416557027643144)
,p_name=>'P236131090_SUCCESS_MESSAGE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767888293783600221)
,p_name=>'P236131090_WFT_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
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
 p_id=>wwv_flow_imp.id(12767893054273600228)
,p_name=>'P236131090_WFT_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131090_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767893479168600231)
,p_name=>'P236131090_WFT_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131090_ROWID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767889401478600223)
,p_name=>'P236131090_WFT_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767889834612600223)
,p_name=>'P236131090_WFT_DOC_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_DOC_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767890663848600224)
,p_name=>'P236131090_WFT_DOC_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_DOC_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767890200630600223)
,p_name=>'P236131090_WFT_DOC_SFX'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_DOC_SFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767863684070600169)
,p_name=>'P236131090_WFT_MESSAGE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Message</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'display_item'
,p_tag_attributes=>'data-testid="P236131090_WFT_MESSAGE"'
,p_colspan=>8
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767896275443600234)
,p_name=>'P236131090_WFT_NXT_STATUS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767865299658600173)
,p_name=>'P236131090_WFT_NXT_STATUS_DESC'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767889078932600223)
,p_name=>'P236131090_WFT_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767863331005600167)
,p_name=>'P236131090_WFT_PRIORITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_prompt=>'<font style="font-weight: bolder;color:brown">Priority</font>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:HIGH;1,MEDIUM;2,LOW;3'
,p_cHeight=>1
,p_tag_attributes=>'data-testid="P236131090_WFT_PRIORITY"'
,p_colspan=>3
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-lg'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767894633119600232)
,p_name=>'P236131090_WFT_PROCESS_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_PROCESS_DESC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767892693548600226)
,p_name=>'P236131090_WFT_SEL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_SEL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767891819756600226)
,p_name=>'P236131090_WFT_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767892212027600226)
,p_name=>'P236131090_WFT_STATUS_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_STATUS_DESC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767864148636600170)
,p_name=>'P236131090_WFT_STATUS_DESC_1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_item_default=>'P236131090_WFT_STATUS_DESC'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767891090025600224)
,p_name=>'P236131090_WFT_STAT_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_STAT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767893875779600231)
,p_name=>'P236131090_WFT_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131090_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767894294564600231)
,p_name=>'P236131090_WFT_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFT_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131090_ROWID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767891403349600224)
,p_name=>'P236131090_WFT_VIEW_SEQ_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_VIEW_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12767888595966600221)
,p_name=>'P236131090_WFT_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_item_source_plug_id=>wwv_flow_imp.id(20355127928042327417)
,p_source=>'WFT_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8630407711632576959)
,p_name=>'P236131090_WF_MODULE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20355094665113303816)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6376789911517113233)
,p_validation_name=>'Flags'
,p_static_id=>'flags'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_res    VARCHAR2(1);',
'    v_error       VARCHAR2 (1000);',
'BEGIN',
'    IF :P236131090_APPR_FLAG = ''N'' AND :P236131090_FWD_FLAG = ''N'' AND :P236131090_ACTION NOT IN (''C'',''R'') THEN',
'       v_error := ''Document should be Approve / Forward.'';',
'    END IF;',
'    ',
'    IF :P236131090_WFT_MESSAGE IS NULL THEN',
'       v_error := ''Message must be entered.'';',
'    END IF;',
'    ',
'    IF :P236131090_FWD_FLAG = ''Y'' AND :P236131090_FWD_PERSON IS NULL AND :P236131090_ACTION NOT IN (''C'',''R'')  THEN',
'       v_error := ''Forward Person must be entered.'';',
'    END IF;',
'',
'    IF :P236131090_ACTION = ''R'' AND :P236131090_RTN_PERSON IS NULL THEN',
'      v_error := ''Return Person must be entered.'';',
'    END IF;',
'    ',
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
 p_id=>wwv_flow_imp.id(6376796784754113247)
,p_name=>'ApproveFlag'
,p_static_id=>'approveflag'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_FWD_FLAG'
,p_condition_element=>'P236131090_FWD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376797298522113247)
,p_event_id=>wwv_flow_imp.id(6376796784754113247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_APPR_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376798641426113247)
,p_name=>'assign name'
,p_static_id=>'assign-name'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_FWD_PERSON'
,p_condition_element=>'P236131090_FWD_PERSON'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376799167426113248)
,p_event_id=>wwv_flow_imp.id(6376798641426113247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131090_FWD_PERSON_2,P236131090_FWD_USER',
  'items_to_submit', 'P236131090_FWD_PERSON,P236131090_P_WF_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '',
    'SELECT emp_name ',
    'into :P236131090_FWD_PERSON_2',
    '  FROM (   SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, 1)',
    '                  emp_name,',
    '               weh_par_emp_id emp,',
    '               func_find_user_id (weh_appr_bu, weh_par_emp_id) user_id,',
    '               weh_appr_bu appr_bu,',
    '               weh_appr_plnt appr_plnt',
    '          FROM wf_emp_hierarchy',
    '         WHERE     weh_bu = :GLOBAL_bu',
    '               AND weh_emp_id = :GLOBAL_EMP_ID--func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
    '               AND func_find_wf_basis (:GLOBAL_bu, :P236131090_P_WF_TYPE,1) = ''E''',
    '           AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
    '       UNION ALL',
    '       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
    '       WFDA_POSITION,',
    '       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
    '       WFDA_APPR_BU,',
    '       WFDA_PLNT',
    '  FROM WF_DIRECT_AUTHORIZATION',
    ' WHERE     WFDA_BU = :global_bu',
    '       AND wfda_dflt_flag = ''Y''',
    '       AND func_find_wf_basis (:GLOBAL_bu, :P236131090_P_WF_TYPE,1) = ''U''',
    '       AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
    '      UNION ALL',
    '       SELECT func_find_employee_desc(prj_bu, prj_cont_mgr, 1) emp_desc,',
    '       prj_cont_mgr,',
    '       func_find_user_id(prj_bu, prj_cont_mgr) user1,',
    '       prj_bu,',
    '       prj_plnt',
    '  FROM projects',
    ' WHERE prj_bu = :global_bu',
    '   AND prj_proj_id = :P236131090_P_PRJ_ID',
    '       AND EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y''))',
    '       where emp = :P236131090_FWD_PERSON;',
    '',
    ':P236131090_fwd_user := func_find_user_id(:GLOBAL_bu,:P236131090_FWD_PERSON);',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376801845981113250)
,p_name=>'Assign_Return_User_Name'
,p_static_id=>'assign-return-user-name'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_RTN_PERSON'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376802287390113250)
,p_event_id=>wwv_flow_imp.id(6376801845981113250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131090_RTN_PERSON_1',
  'items_to_submit', 'P236131090_RTN_PERSON,P236131090_P_WF_TYPE,P236131090_P_CTRL_PERSON,P236131090_P_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT  emp_name into :P236131090_RTN_PERSON_1',
    '  FROM (SELECT func_find_employee_desc(:GLOBAL_bu,CASE WHEN wfdcl_auth_type = ''P'' THEN func_find_wf_emp_pos_id(:GLOBAL_bu,wfdcl_ctrl_person)',
    '                                                         WHEN wfdcl_auth_type = ''E'' THEN wfdcl_ctrl_person',
    '                                                    END,1) emp_name,',
    '               CASE WHEN wfdcl_auth_type = ''P'' THEN',
    '		         func_find_wf_emp_pos_id(:GLOBAL_bu,wfdcl_ctrl_person)',
    '		    WHEN wfdcl_auth_type = ''E'' THEN',
    '		         wfdcl_ctrl_person',
    '	       END emp_id,',
    '               ROWNUM rno,',
    '               DECODE (seq_no, 1, ''Creator'', ''Sender'') type1,',
    '               wfdcl_bu fwd_entity,',
    '               wfdcl_plnt fwd_plnt',
    '          FROM (  SELECT wfdcl_bu,wfdcl_plnt,wfdcl_auth_type,wfdcl_ctrl_person, MIN(wfdcl_seqno) seq_no',
    '                    FROM work_flow_doc_control,wf_doc_control_log',
    '                   WHERE wfdc_bu = wfdcl_bu',
    '                     AND wfdc_wf_no = wfdcl_wf_no',
    '                     AND (wfdcl_src_bu  = :GLOBAL_bu OR (wfdcl_src_bu IS NULL AND wfdcl_bu = :GLOBAL_bu))',
    '                     AND wfdcl_type = :P236131090_P_WF_TYPE',
    '                     AND wfdcl_wf_no = :P236131090_P_WF_NO',
    '                     AND wfdcl_ctrl_person <> :P236131090_P_CTRL_PERSON',
    '		     AND wfdc_rtn_act = 0',
    '                GROUP BY wfdcl_bu,wfdcl_plnt,wfdcl_ctrl_person,wfdcl_auth_type',
    '		UNION ALL',
    '		SELECT wfdcl_bu,wfdcl_plnt,wfdcl_auth_type,wfdcl_ctrl_person, MIN(wfdcl_seqno) seq_no',
    '                    FROM work_flow_doc_control,wf_doc_control_log',
    '                   WHERE wfdc_bu = wfdcl_bu',
    '                     AND wfdc_wf_no = wfdcl_wf_no',
    '                     AND (wfdcl_src_bu  = :GLOBAL_bu OR (wfdcl_src_bu IS NULL AND wfdcl_bu = :GLOBAL_bu))',
    '                     AND wfdcl_type = :P236131090_P_WF_TYPE',
    '                     AND wfdcl_wf_no = :P236131090_P_WF_NO',
    '                     AND wfdcl_ctrl_person = :P236131090_P_CTRL_PERSON',
    '		     AND wfdc_rtn_act = 1',
    '                GROUP BY wfdcl_bu,wfdcl_plnt,wfdcl_ctrl_person,wfdcl_auth_type))',
    'WHERE emp_id = :P236131090_RTN_PERSON;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376792203082113244)
,p_name=>'Forward Enable/Disable'
,p_static_id=>'forward-enable-disable'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_ACTION'
,p_condition_element=>'P236131090_ACTION'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'NY,YY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376793210564113245)
,p_event_id=>wwv_flow_imp.id(6376792203082113244)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_FWD_PERSON,P236131090_FWD_PERSON_2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376792731572113244)
,p_event_id=>wwv_flow_imp.id(6376792203082113244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_FWD_PERSON,P236131090_FWD_PERSON_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376793611250113245)
,p_name=>'Forward Flag_1'
,p_static_id=>'forward-flag'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_FWD_FLAG'
,p_condition_element=>'P236131090_FWD_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376794137806113245)
,p_event_id=>wwv_flow_imp.id(6376793611250113245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131090_FWD_PERSON,P236131090_DESC,P236131090_FWD_USER,P236131090_FWD_ENTITY,P236131090_FWD_PLNT',
  'items_to_submit', 'P236131090_P_PLNT,P236131090_P_WF_TYPE,P236131090_P_EMP_ID,P236131090_P_DOC_VALUE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '   v_res                 VARCHAR2 (1);',
    '   CURSOR c1',
    '   IS',
    '      SELECT wf_bus_proc_id',
    '        FROM work_flow',
    '       WHERE wf_bu = :global_bu AND wf_bus_proc_id = :p236131090_p_wf_type;',
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
    '   global_plnt := :p236131090_p_plnt;',
    '   global_wf_type := :p236131090_p_wf_type;',
    '   global_emp_id := :p236131090_p_emp_id;',
    '   global_wf_doc_value := :p236131090_p_doc_value;',
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
    '      :p236131090_wft_bu := global_bu;',
    '      :p236131090_wft_plnt := global_plnt;',
    '      :p236131090_wft_cre_by := global_user;',
    '      :p236131090_wft_cre_date := SYSDATE;',
    '      :p236131090_fwd_user := NULL;       ',
    '               IF v_par_emp_id IS NOT NULL',
    '               THEN',
    '                  :p236131090_fwd_person := v_par_emp_id;',
    '                  :p236131090_desc := func_find_employee_desc (v_appr_bu,v_par_emp_id,global_lang);',
    '                  :p236131090_fwd_user :=func_find_user_id (func_find_wf_resp_person_bu (global_bu,global_wf_type,func_find_emp_id (global_bu, global_user),v_par_emp_id,1),v_par_emp_id);',
    '                  :p236131090_fwd_entity := v_appr_bu;',
    '                  :p236131090_fwd_plnt :=func_find_wf_resp_person_plnt (global_bu,:p236131090_p_wf_type,v_emp_id,v_par_emp_id,1);     ',
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
 p_id=>wwv_flow_imp.id(6376794592035113245)
,p_event_id=>wwv_flow_imp.id(6376793611250113245)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131090_FWD_PERSON,P236131090_DESC,P236131090_FWD_USER,P236131090_FWD_ENTITY,P236131090_FWD_PLNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':p236131090_fwd_person := null;',
    ':p236131090_desc := null;',
    ':p236131090_fwd_user :=null;',
    ':p236131090_fwd_entity := null;',
    ':p236131090_fwd_plnt :=null;     ',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376795930842113247)
,p_name=>'ForwardFlag'
,p_static_id=>'forwardflag'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_APPR_FLAG'
,p_condition_element=>'P236131090_APPR_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376796412387113247)
,p_event_id=>wwv_flow_imp.id(6376795930842113247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_FWD_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376797732500113247)
,p_name=>'mail disable'
,p_static_id=>'mail-disable'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376798239745113247)
,p_event_id=>wwv_flow_imp.id(6376797732500113247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_MAIL_FLAG'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376795056930113245)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6376775331606113217)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376795578708113245)
,p_event_id=>wwv_flow_imp.id(6376795056930113245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376800419547113248)
,p_name=>'Return Enable/Disable'
,p_static_id=>'return-enable-disable'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_ACTION'
,p_condition_element=>'P236131090_ACTION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'R'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376801478842113248)
,p_event_id=>wwv_flow_imp.id(6376800419547113248)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_RTN_PERSON,P236131090_RTN_PERSON_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376800893634113248)
,p_event_id=>wwv_flow_imp.id(6376800419547113248)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131090_RTN_PERSON,P236131090_RTN_PERSON_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6376799578152113248)
,p_name=>'WF_ACTION'
,p_static_id=>'wf-action'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131090_ACTION'
,p_condition_element=>'P236131090_ACTION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6376799992462113248)
,p_event_id=>wwv_flow_imp.id(6376799578152113248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131090_APPR_FLAG,P236131090_FWD_FLAG,P236131090_FWD_PERSON,P236131090_FWD_PERSON_2,P236131090_FWD_USER,P236131090_FWD_ENTITY,P236131090_WFT_MESSAGE',
  'items_to_submit', 'P236131090_P_WF_TYPE,P236131090_ACTION',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_emp_id VARCHAR2(10) := func_find_emp_id(:GLOBAL_bu,:GLOBAL_user);',
    '	v_par_emp_id VARCHAR2(10) := func_find_wf_resp_person(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,1);',
    '	v_appr_bu VARCHAR2(5) := func_find_wf_resp_person_bu(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,v_par_emp_id,1);',
    'BEGIN',
    '--Raise_Application_Error(-20999,:P236131090_p_wf_type||''/''||:P236131090_ACTION||''/''||:P236131090_ACTION_NAME);',
    'IF :P236131090_ACTION = ''YY'' THEN',
    '	:P236131090_APPR_FLAG := ''Y'';',
    '	:P236131090_FWD_FLAG := ''Y'';',
    '	:P236131090_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P236131090_P_WF_TYPE,v_emp_id,1);',
    '	IF :P236131090_FWD_PERSON IS NOT NULL THEN',
    '	  :P236131090_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P236131090_FWD_PERSON,1);',
    '	  :P236131090_fwd_user := func_find_user_id(:GLOBAL_bu,:P236131090_FWD_PERSON);',
    '	END IF;',
    '	',
    '  :P236131090_fwd_entity  := v_appr_bu;',
    '  :P236131090_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '',
    '  SELECT UPPER(ACTION_NAME) INTO :P236131090_WFT_MESSAGE FROM wf_apex_action WHERE ACTION_ID = :P236131090_ACTION;',
    '  ',
    'ELSIF :P236131090_ACTION = ''YN'' THEN',
    '',
    '	:P236131090_APPR_FLAG := ''Y'';',
    '	:P236131090_FWD_FLAG := ''N'';',
    '	:P236131090_FWD_PERSON := NULL;',
    '	:P236131090_FWD_PERSON_2 := NULL;',
    '    SELECT UPPER(ACTION_NAME) INTO :P236131090_WFT_MESSAGE FROM wf_apex_action WHERE ACTION_ID = :P236131090_ACTION;',
    '',
    'ELSIF :P236131090_ACTION = ''NY'' THEN',
    '	:P236131090_APPR_FLAG := ''N'';',
    '	:P236131090_FWD_FLAG := ''Y'';',
    '	:P236131090_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,1);',
    '	IF :P236131090_FWD_PERSON IS NOT NULL THEN',
    '	  :P236131090_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P236131090_FWD_PERSON,1);',
    '	  :P236131090_fwd_user := func_find_user_id(:GLOBAL_bu,:P236131090_FWD_PERSON);',
    '	END IF;',
    '	',
    '  :P236131090_fwd_entity  := v_appr_bu;',
    '  :P236131090_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '  ',
    '  SELECT UPPER(ACTION_NAME) INTO :P236131090_WFT_MESSAGE FROM wf_apex_action WHERE ACTION_ID = :P236131090_ACTION;',
    'ELSIF :P236131090_ACTION = ''C'' THEN',
    '',
    '	:P236131090_APPR_FLAG := ''N'';',
    '	:P236131090_FWD_FLAG := ''N'';',
    '	:P236131090_FWD_PERSON := NULL;',
    '	:P236131090_FWD_PERSON_2 := NULL;',
    '    :P236131090_WFT_MESSAGE := NULL;',
    '',
    'ELSIF :P236131090_ACTION = ''R'' THEN',
    '',
    '	:P236131090_APPR_FLAG := ''N'';',
    '	:P236131090_FWD_FLAG := ''N'';',
    '	:P236131090_FWD_PERSON := NULL;',
    '	:P236131090_FWD_PERSON_2 := NULL;',
    '    :P236131090_WFT_MESSAGE := NULL;',
    '',
    'ELSE',
    '	:P236131090_ACTION := ''NY'';',
    '	:P236131090_APPR_FLAG := ''N'';',
    '	:P236131090_FWD_FLAG := ''Y'';',
    '	:P236131090_FWD_PERSON := func_find_wf_resp_person(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,1);',
    '	IF :P236131090_FWD_PERSON IS NOT NULL THEN',
    '	  :P236131090_FWD_PERSON_2 := func_find_employee_desc(:GLOBAL_bu,:P236131090_FWD_PERSON,1);',
    '	  :P236131090_fwd_user := func_find_user_id(:GLOBAL_bu,:P236131090_FWD_PERSON);',
    '	END IF;',
    '    :P236131090_WFT_MESSAGE := NULL;',
    '	',
    '  :P236131090_fwd_entity  := v_appr_bu;',
    '  :P236131090_fwd_plnt		:= func_find_wf_resp_person_plnt(:GLOBAL_bu,:P236131090_p_wf_type,v_emp_id,v_par_emp_id,1);',
    '',
    'END IF;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376791010988113237)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'assign'
,p_static_id=>'assign'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF :p236131090_fwd_flag = ''Y'' AND :p236131090_appr_flag = ''N'' AND :P236131090_ACTION NOT IN (''C'',''R'')',
'   AND :P236131090_P_WF_TYPE NOT IN (''WF_PRJ_EMPTC'')',
'   THEN',
'      SELECT user_id, appr_plnt, appr_bu',
'        INTO :p236131090_fwd_user, :p236131090_fwd_plnt, :p236131090_fwd_entity',
'        FROM (SELECT emp_name "Name",',
'                     emp,',
'                     user_id,',
'                     appr_bu,',
'                     appr_plnt,',
'                     func_find_plnt_desc (appr_bu, appr_plnt, 1)',
'                        "Reporting Unit"',
'                FROM (  SELECT emp_name,',
'                               emp,',
'                               func_find_user_id (:p236131090_fwd_entity, emp)',
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
'                                                       :p236131090_p_wf_type,1) = ''O''',
'                      GROUP BY emp_name,',
'                               emp,',
'                               func_find_user_id (',
'                                  func_find_wf_resp_person_bu (',
'                                     :global_bu,',
'                                     :p236131090_p_wf_type,:GLOBAL_EMP_ID',
'                                    /*  func_find_emp_id (:global_bu,',
'                                                       :global_user) */,',
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
'                             AND weh_emp_id = :GLOBAL_EMP_ID',
'                                  /*   func_find_emp_id (:global_bu,',
'                                                      :global_user) */',
'                             AND func_find_wf_basis (:global_bu,',
'                                                     :p236131090_p_wf_type,1) = ''E''',
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
'                                                     :p236131090_p_wf_type,1) = ''U'')',
'               WHERE emp = :p236131090_fwd_person);',
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
,p_internal_uid=>897270027203193035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6254122102719758404)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dailod For Supplier & Customer'
,p_static_id=>'close-dailod-for-supplier-customer'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P236131090_P_WF_TYPE in(''WF_SUPPE'',/*''WF_CUSTE'',''WF_GLAA'',*/''WF_GLAI'',''WF_SUP_CUST_BL'',''WF_UPD_CR'',''WF_CUST_BL''/*,''WF_CUSTA''*/,''WF_UPD_FIN_PER'',''WF_SUPE_STAT'',''WF_CASH_IMP_UPD'',''WF_FA_CAPEX_UPD''',
',''WF_IMP_UPD'',''WF_BANK_UPD'',''WF_UPD_BUS_LOC'',''WF_UPD_BUS_UNIT'',''WF_FA_CAPEX_REV'',''WF_FA_PRJ_REV'',''WF_CASH_UPD'')'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>774601118934838202
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376788927103113225)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(20355127928042327417)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Workflow Approval'
,p_static_id=>'initialize-form-workflow-approval'
,p_internal_uid=>897267943318193023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376790645718113236)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
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
'       WHERE wf_bu = :global_bu AND wf_bus_proc_id = :P236131090_p_wf_type;',
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
'   global_plnt := :P236131090_p_plnt;',
'   global_wf_type := :P236131090_p_wf_type;',
'   global_doc_pfx := :P236131090_p_doc_pfx;',
'   global_doc_no := :P236131090_p_doc_no;',
'   global_doc_sfx := :P236131090_p_doc_sfx;',
'   global_prod_id := :P236131090_p_prod_id;',
'   global_prod_rev := :P236131090_p_prod_rev;',
'   global_suplr_id := :P236131090_p_suplr_id;',
'   global_cust_id := :P236131090_p_cust_id;',
'   global_emp_id := :P236131090_p_emp_id;',
'   global_wf_doc_value := :P236131090_p_doc_value;',
'   global_lvl1 := :P236131090_p_lvl1;',
'   global_lvl2 := :P236131090_p_lvl2;',
'   global_lvl3 := :P236131090_p_lvl3;',
'   global_lvl4 := :P236131090_p_lvl4;',
'   :global_lvl_prj := :P236131090_p_lvl_prj;',
'   global_acct := :P236131090_p_acct;',
'   global_qc_rev := :P236131090_p_qc_rev;',
'   global_qc_mode := :P236131090_p_qc_mode;',
'   global_proj_id := :P236131090_P_PRJ_ID;',
'   global_rnd_proj_id := :P236131090_p_rnd_proj_id;',
'   global_jrnl_type := :P236131090_p_jrnl_type;',
'   global_prod_date := TO_DATE(:P236131090_p_date,:GLOBAL_DATE_MASK);',
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
'   --RAISE_APPLICATION_ERROR(-20999,v_proj_based_flag);',
'',
'   DECLARE',
'      CURSOR c1(c_seq_no    NUMBER)',
'      IS',
'         SELECT wfaa_seq_no,wfaa_status,wfaa_desc',
'           FROM (  SELECT ROWNUM rno,wfaa_seq_no,wfaa_status,wfaa_desc',
'                     FROM work_flow_appr_actvt',
'                    WHERE wfaa_bu = global_bu AND wfaa_wf_id = global_wf_type',
'                 ORDER BY wfaa_seq_no)',
'          WHERE rno = NVL(c_seq_no,0)+1;',
'',
'      CURSOR c2',
'      IS',
'      SELECT SUM(doc_val) doc_val',
'  FROM(SELECT SUM (prl_requested_qty * prl_bc_unit_cost) doc_val',
'           FROM pur_req_ln',
'          WHERE     prl_bu = global_bu',
'                AND prl_rqst_no = global_doc_no',
'                AND global_wf_type IN (''WF_PRA'')',
'                 UNION ALL',
'  SELECT SUM(pol_ordered_qty * pol_sc_unit_cost * poh_exchange_rate) doc_val',
'    FROM pur_order_hd,pur_order_ln',
'   WHERE poh_bu = pol_bu',
'    --  AND poh_order_pfx = pol_order_pfx',
'     ANd poh_order_no = pol_order_no',
'     AND pol_bu = global_bu',
'    --  AND pol_order_pfx = global_doc_pfx',
'     AND pol_order_no = global_doc_no',
'     AND global_wf_type IN (''WF_POA'',''WF_POAA'')',
'   /* UNION ALL',
'  SELECT NVL(SUM(mrl_rqst_qty * func_find_unitcost(global_bu,',
'                                                   mrl_prod_id,',
'                                                   mrl_prod_rev,',
'                                                   func_find_deflt_storeid(global_bu,',
'                                                                           global_plnt,',
'																									:P236131090_PLNT_LOC_ID,',
'                                                                           mrl_prod_id,',
'                                                                           mrl_prod_rev,',
'                                                                           ''N''))),0)',
'    FROM mtrl_rqst_ln',
'   WHERE mrl_bu = global_bu',
'     AND mrl_plnt = global_plnt',
'     AND mrl_rqst_no = global_doc_no',
'     AND global_wf_type  = ''WF_PRE_MR'' */);',
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
'       CURSOR c6',
'      IS',
'         SELECT wfmc_doc_comp',
'           FROM wfm_control',
'          WHERE wfmc_bu = global_bu; ',
'',
'   CURSOR c_wfd IS',
'   SELECT *',
'     FROM work_flow_doc_control',
'    WHERE wfdc_bu = :GLOBAL_bu',
'      AND wfdc_wf_no = :P236131090_P_WF_NO;',
'',
'  r_wfd         c_wfd%ROWTYPE;',
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
'      v_emp_id          VARCHAR2 (10) := :GLOBAL_emp_id;',
'      v_par_emp_id      VARCHAR2 (10)',
'                           :=  func_find_wf_resp_person (global_bu,global_wf_type, v_emp_id,1);',
'      v_wf_control      VARCHAR2 (1);',
'      v_wf_status       VARCHAR2 (2);',
'      v_out             VARCHAR2 (1);',
'      v_appr_bu         VARCHAR2 (5)',
'         :=  func_find_wf_resp_person_bu (global_bu,global_wf_type, v_emp_id, v_par_emp_id,1);',
'      v_appr_plnt       VARCHAR2 (10);',
'      v_basis           VARCHAR2 (1);',
'',
'      v_entry_emp_id    VARCHAR2(10);',
'      v_entry_user      VARCHAR2(15);',
'   BEGIN',
'   ',
'      OPEN c_wfd;',
'      FETCH c_wfd INTO r_wfd;',
'        IF c_wfd%FOUND THEN',
'          :P236131090_WFT_PRIORITY := r_wfd.wfdc_priority;',
'        ELSE',
'          :P236131090_WFT_PRIORITY := ''2'';',
'        END IF;',
'      CLOSE c_wfd;',
'',
'      :P236131090_wft_bu := global_bu;',
'      :P236131090_wft_plnt := global_plnt;',
'      :P236131090_wft_cre_by := global_user;',
'      :P236131090_wft_cre_date := SYSDATE;',
'      :P236131090_fwd_user := NULL;',
'',
'      --raise_application_error(-20999,''test'' || v_appr_bu||''/''||v_par_emp_id||''/''||v_emp_id||''/''||:P236131090_P_PRJ_ID);',
'',
'        SELECT wf_mail_flag',
'          INTO :P236131090_MAIL_FLAG',
'          FROM work_flow',
'         WHERE wf_bu    = :GLOBAL_bu',
'           AND wf_bus_proc_id = :P236131090_p_wf_type;',
'',
'      -- raise_application_error(-20999,''test'' || :P236131090_MAIL_FLAG);',
'',
'      IF :P236131090_P_WF_NO IS NOT NULL THEN',
'        BEGIN',
'          SELECT WFDCL_cre_by INTO v_entry_user',
'            FROM wf_doc_control_log',
'           WHERE wfdcl_bu = :GLOBAL_bu',
'             AND wfdcl_wf_no = :P236131090_P_WF_NO',
'             AND wfdcl_seqno = 1;',
'          v_entry_emp_id := func_find_emp_user_id(:GLOBAL_bu,v_entry_user);',
'          :P236131090_P_CTRL_PERSON := r_wfd.wfdc_ctrl_person;',
'        EXCEPTION',
'          WHEN OTHERS THEN v_entry_emp_id := NULL;v_entry_user := NUll;',
'        END;',
'        ',
'      ELSE',
'        v_entry_user := NULL;',
'        :P236131090_P_CTRL_PERSON := NULL;',
'      END IF;',
'--Raise_Application_Error(-20999,:P236131090_P_CTRL_PERSON||''/''||v_entry_emp_id||''/''||v_entry_user||''/''||:P236131090_P_WF_NO);',
'      OPEN c1(r_wfd.wfdc_seq_no);',
'      FETCH c1 INTO cr1;',
'      IF c1%FOUND THEN',
'         v_cur_proc := cr1.wfaa_status;',
'         v_cur_proc_desc := cr1.wfaa_desc;',
'',
'         OPEN c5 (cr1.wfaa_seq_no + 1);',
'         FETCH c5 INTO cr5;',
'           IF c5%FOUND THEN',
'              v_nxt_proc := cr5.wfaa_status;',
'           ELSE',
'              v_nxt_proc := NULL;',
'           END IF;',
'         CLOSE c5;',
'',
'         OPEN c3 (cr1.wfaa_seq_no);',
'         FETCH c3 INTO cr3;',
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
'      FETCH c4 INTO cr4;',
'      IF c4%FOUND THEN',
'         v_last_proc := cr4.wfaa_status;',
'      ELSE',
'         v_last_proc := NULL;',
'      END IF;',
'      CLOSE c4;',
'',
'      OPEN c2;',
'      FETCH c2 INTO cr2;',
'      IF c2%FOUND and  cr2.doc_val IS NOT NULL AND global_wf_type IN (''WF_PRA'',''WF_POA'',''WF_POAA'',''WF_PRE_MR'') THEN',
'               global_wf_doc_value := cr2.doc_val;',
'         else',
'         global_wf_doc_value := :P236131090_p_doc_value;',
'      END IF;',
'      CLOSE c2;',
'',
'      OPEN c6;',
'      FETCH c6 INTO cr6;',
'      IF c6%NOTFOUND THEN',
'         v_wf_control := ''S'';',
'      ELSE',
'         v_wf_control := cr6.wfmc_doc_comp;',
'      END IF;',
'      CLOSE c6; ',
'      ',
'      --RAISE_APPLICATION_ERROR(-20999,v_par_emp_id||''/''||:P236131090_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''~''||v_emp_id||''/''||global_proj_id||''/''||:P236131090_p_proj_id) ;',
'--raise_application_error(-20999,''test'' || v_appr_bu||''/''||v_par_emp_id||''/''||v_emp_id||''/''||cr1.wfaa_desc||''/''||global_proj_id||''/''||:P236131090_p_proj_id);',
'      IF v_wf_control = ''S''',
'      THEN',
'      ',
'         proc_work_flow_dir_auth (global_bu,',
'                                  global_plnt,',
'                                  global_wf_type,',
'                                  v_cur_proc,',
'                                  global_user,',
'                                  global_wf_doc_value,',
'                                  var_res,',
'                                  global_doc_pfx,',
'                                  global_doc_no,',
'				  p_proj_id => global_proj_id,',
'                  p_entry_user => v_entry_user,',
'              p_user_emp => :GLOBAL_emp_id);',
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
'				  p_proj_id => global_proj_id,',
'              p_user_emp => :GLOBAL_emp_id);',
'',
'      --Raise_Application_Error(-20999,global_bu||''/''||global_plnt||''/''||global_wf_type||''/''||v_cur_proc||''/''||v_nxt_proc||''/''||var_res||''/''||global_user||''/''||global_wf_doc_value||''/''||global_doc_pfx||''/''||global_doc_no||''/''||:GLOBAL_emp_id||''/''||v_'
||'entry_user);',
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
'				  p_proj_id => global_proj_id,',
'                  p_entry_user => v_entry_user,',
'              p_user_emp => :GLOBAL_emp_id);',
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
'				  p_proj_id => global_proj_id,',
'                  p_entry_user => v_entry_user,',
'              p_user_emp => :GLOBAL_emp_id);',
'      END IF;',
'    /*IF global_wf_type = ''WF_SO_AMD'' THEN',
'      Raise_Application_Error(-20999,''HRM''||''~''||:P236131090_P_WF_NO||''~''||var_res||''~''||var_res1||''~''||global_bu||''~''||global_plnt||''~''||',
'                            global_wf_type||''~''||v_cur_proc||''~''||global_user||''~''||v_entry_user||''~''||:GLOBAL_emp_id);',
'    END IF;*/',
'--RAISE_APPLICATION_ERROR(-20999,v_par_emp_id||''/''||:P236131090_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''~''||v_emp_id||''~''||var_res||''/''||var_res1||''/''||v_wf_status) ;',
'-- RAISE_APPLICATION_ERROR(-20999,:P236131090_P_PRJ_ID||''/''||:P236131090_fwd_person||''/''||v_proj_based_flag||''/''||global_proj_id);',
'      IF var_res = ''N''',
'      THEN',
'         :P236131090_appr_flag := ''N'';',
'         :P236131090_fwd_flag := ''Y'';',
'            --raise_application_error(-20999,var_res);',
'			INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'			IF :P236131090_P_WF_NO IS NOT NULL THEN',
'              INSERT INTO wf_apex_action VALUES(8,''Return'',''R'');',
'              --INSERT INTO wf_apex_action VALUES(9,''Cancel'',''C'');',
'            END IF;',
'            :P236131090_ACTION := ''NY'';',
'			:P236131090_wft_message := ''FORWARD FOR ''||UPPER(v_cur_proc_desc);',
'	 ',
'	 IF v_proj_based_flag = ''N'' THEN',
'           :P236131090_fwd_person := v_par_emp_id;',
'	 ELSE',
'	   BEGIN',
'             SELECT prj_cont_mgr,',
'              (SELECT APPLUSER_ID FROM APPL_USERS WHERE APPLUSER_BU = :GLOBAL_BU',
'  AND APPLUSER_EMP_ID = PRJ_CONT_MGR) USER_ID',
'               INTO :P236131090_fwd_person,',
'                   :P236131090_fwd_user',
'               FROM projects',
'              WHERE prj_bu = global_bu',
'                AND prj_plnt = global_plnt',
'                AND prj_proj_id = :P236131090_P_PRJ_ID;-- global_proj_id;',
'               -- RAISE_APPLICATION_ERROR(-20999,:P236131090_P_PRJ_ID||''/''||:P236131090_fwd_person);',
'                v_par_emp_id := null;',
'           EXCEPTION',
'             WHEN NO_DATA_FOUND THEN :P236131090_fwd_person := v_par_emp_id;',
'	   END;',
'	 END IF;',
'	 ',
'         :P236131090_wft_status := v_cur_proc;',
'         :P236131090_wft_status_desc := v_cur_proc_desc;',
'',
'',
'    -- RAISE_APPLICATION_ERROR(-20999,:P236131090_fwd_person) ;',
'',
'--RAISE_APPLICATION_ERROR(-20999, v_appr_bu||''/''||v_par_emp_id||''/''||global_lang||''/''||global_bu||''/''||global_wf_type||''/''||global_user||''/''||:p1090_p_wf_type||''/''||v_emp_id);',
'',
'         IF v_par_emp_id IS NOT NULL',
'         THEN',
'            :P236131090_fwd_person := v_par_emp_id;',
'            :P236131090_desc := func_find_employee_desc (v_appr_bu, :P236131090_fwd_person , global_lang);',
'            ',
'            :P236131090_fwd_user :=  func_find_user_id(global_bu,func_find_emp_id (global_bu, global_user) );',
'            --func_find_user_id (func_find_wf_resp_person_bu (global_bu,:P1090_P_WF_TYPE,func_find_emp_id (global_bu, global_user),:P236131090_fwd_person ,1),:P236131090_fwd_person );',
'            ',
'            :P236131090_fwd_entity := v_appr_bu;',
'           -- RAISE_APPLICATION_ERROR(-20999, ''test'');',
'            :P236131090_fwd_plnt :=  func_find_wf_resp_person_plnt (global_bu,:P236131090_p_wf_type,v_emp_id,:P236131090_fwd_person,1);',
'              /* CASE',
'                  WHEN v_basis = ''E''',
'                  THEN',
'                     NULL',
'                  ELSE',
'                     func_find_wf_resp_person_plnt (global_bu,',
'                                                    :P236131090_wft_wf_type,',
'                                                    v_emp_id,',
'                                                    v_par_emp_id)',
'               END;*/',
'         END IF;',
'      ELSE',
'      --Raise_Application_Error(-20999,global_bu||''/''||global_plnt||''/''||global_wf_type||''/''||global_user||''/''||:GLOBAL_emp_id);',
'         :P236131090_appr_flag := ''Y'';',
'         :P236131090_fwd_flag := ''N'';',
'         :P236131090_fwd_person := v_par_emp_id;',
'         :P236131090_wft_status := v_cur_proc;',
'         :P236131090_wft_status_desc := v_cur_proc_desc;',
'  --RAISE_APPLICATION_ERROR(-20999,''TEST''||:P236131090_FWD_ENTITY||''/''||global_bu||''/''||global_user||''emp/''||v_par_emp_id||''/''||:P236131090_fwd_person) ; ',
'         IF v_cur_proc <> v_last_proc AND v_last_proc IS NOT NULL',
'         THEN',
'            IF var_res1 = ''N''',
'            THEN',
'               :P236131090_fwd_flag := ''Y'';',
'           ',
'               IF v_par_emp_id IS NOT NULL',
'               THEN',
'                  :P236131090_fwd_person := v_par_emp_id;',
'                  :P236131090_desc := func_find_employee_desc (v_appr_bu,',
'                                              v_par_emp_id,',
'                                              global_lang);',
'                 :p236131090_fwd_user := func_find_user_id (func_find_wf_resp_person_bu (global_bu,global_wf_type,func_find_emp_id (global_bu, global_user),v_par_emp_id,1),v_par_emp_id);',
'            :p236131090_fwd_entity := v_appr_bu;',
'            :p236131090_fwd_plnt :=func_find_wf_resp_person_plnt (global_bu,:P236131090_p_wf_type,v_emp_id,v_par_emp_id,1);',
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
'               :P236131090_fwd_flag := ''N'';',
'            END IF;',
'',
'            DECLARE',
'               CURSOR c1',
'               IS',
'                  SELECT wfaa_seq_no',
'                    FROM work_flow_appr_actvt',
'                   WHERE     wfaa_bu = global_bu',
'                         AND wfaa_wf_id = global_wf_type',
'                         AND wfaa_status = :P236131090_wft_status;',
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
'                     :P236131090_wft_nxt_status := cr2.wfaa_status;',
'                     :P236131090_wft_nxt_status_desc := cr2.wfaa_desc;',
'                  END IF;',
'',
'                  CLOSE c2;',
'               END IF;',
'',
'               CLOSE c1;',
'            END;',
'',
'				INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'				INSERT INTO wf_apex_action VALUES(2,InitCap(v_cur_proc_desc)||'' & Forward for ''||InitCap(:P236131090_wft_nxt_status_desc), ''YY'');',
'             ',
'            IF :P236131090_P_WF_NO IS NOT NULL THEN',
'              INSERT INTO wf_apex_action VALUES(8,''Return'',''R'');',
'              --INSERT INTO wf_apex_action VALUES(9,''Cancel'',''C'');',
'            END IF;',
'',
'				IF :P236131090_appr_flag = ''Y'' AND :P236131090_fwd_flag = ''Y'' THEN',
'				  :P236131090_ACTION := ''YY'';',
'',
'				  :P236131090_wft_message := UPPER(v_cur_proc_desc)||'' & FORWARD FOR ''||UPPER(:P236131090_wft_nxt_status_desc);',
'				ELSIF :P236131090_appr_flag = ''N'' AND :P236131090_fwd_flag = ''Y'' THEN',
'				  :P236131090_ACTION := ''NY'';',
'',
'				  :P236131090_wft_message := ''FORWARD FOR '' || UPPER(v_cur_proc_desc);',
'				END IF; ',
'',
'         ELSIF v_cur_proc = v_last_proc',
'         THEN',
'            --:P236131090_fwd_plnt := ''N'';',
'				:P236131090_fwd_flag := ''N'';',
'',
'				INSERT INTO wf_apex_action VALUES(1,''Forward for ''||InitCap(v_cur_proc_desc),''NY'');',
'				INSERT INTO wf_apex_action VALUES(2,InitCap(v_cur_proc_desc),''YN'');',
'				',
'            IF :P236131090_P_WF_NO IS NOT NULL THEN',
'              INSERT INTO wf_apex_action VALUES(8,''Return'',''R'');',
'              --INSERT INTO wf_apex_action VALUES(9,''Cancel'',''C'');',
'            END IF;',
'                :P236131090_ACTION := ''YN'';',
'',
'				:P236131090_wft_message := ''FOR ''||UPPER(v_cur_proc_desc);',
'         END IF;',
'      END IF;',
'',
'      --:P236131090_wft_priority := ''2'';',
'      --:P236131090_wft_message := ''FOR '' || v_cur_proc_desc;',
'   /*v_error := LTRIM (v_error, ''</br>'');',
'',
'        IF v_error IS NOT NULL',
'        THEN',
'           RETURN v_error;',
'        END IF;*/',
'        ',
'      --  raise_application_error(-20999,v_cur_proc_desc||:P236131090_fwd_person);',
'--RAISE_APPLICATION_ERROR(-20999,:P236131090_fwd_person||''/''||:p236131090_fwd_user) ;',
'',
'   END;',
' EXCEPTION WHEN OTHERS THEN',
'         proc_apex_err_msg_log(:GLOBAL_PAGE_ID,SQLERRM);',
'END;',
'',
'--RAISE_APPLICATION_ERROR(-20999, :P236131090_fwd_person||''/''||:P236131090_fwd_flag||''/''||:P236131090_appr_flag || ''/'' || :P236131090_p_wf_type);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>897269661933193034
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6335416266901643141)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Page Navigation'
,p_static_id=>'process-for-page-navigation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  ',
'  CURSOR c1',
'    IS',
'  SELECT wf_apex_appl_no,',
'         wf_apex_page_no,',
'         wf_bus_proc_id',
'    FROM work_flow',
'   WHERE wf_bu = :global_bu',
'     AND wf_bus_proc_id =  :P236131090_P_WF_TYPE;',
'cr1 c1%ROWTYPE;',
'v_param_url       VARCHAR2(1000);',
'v_page_no         NUMBER;',
'v_appl_no         NUMBER;',
'v_vou_pfx         VARCHAR2(10);',
'v_vou_no          VARCHAR2(50);',
'v_error          VARCHAR2 (1000);',
'BEGIN',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'   v_appl_no := cr1.wf_apex_appl_no;',
'   v_page_no := :P236131090_P_PAGE_ID;',
'   v_vou_pfx := :P236131090_P_DOC_PFX;',
'   v_vou_no  := :P236131090_P_DOC_NO;',
'',
'CLOSE c1;',
'   :P236131090_P_REDIR_URL := NULL;',
'',
' --RAISE_APPLICATION_ERROR(-20999,''f?p='' || v_appl_no|| '':''  ||v_page_no||'':''||:APP_SESSION || ''::::''||v_param_url); ',
'',
' :P236131090_P_REDIR_URL :=v_appl_no;--APEX_UTIL.PREPARE_URL(''f?p='' || v_appl_no|| '':''  ||v_page_no||'':''||:APP_SESSION || ''::::''||v_param_url);',
'',
'',
'',
'  end ;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6376768763176113209)
,p_internal_uid=>855895283116722939
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376789337669113225)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(20355127928042327417)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Workflow Approval'
,p_static_id=>'process-form-workflow-approval'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>897268353884193023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376791833986113239)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process New'
,p_static_id=>'process-new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'DECLARE',
'   CURSOR c_wf',
'   IS',
'      SELECT wf_auth_type,wf_module',
'        FROM work_flow',
'       WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE;',
'',
'   CURSOR C0',
'   IS',
'      SELECT *',
'        FROM (  SELECT *',
'                  FROM WORK_FLOW_APPR_ACTVT',
'                 WHERE WFAA_BU = :GLOBAL_BU',
'                       AND WFAA_WF_ID = :P236131090_P_WF_TYPE',
'              ORDER BY WFAA_SEQ_NO DESC)',
'       WHERE ROWNUM = 1;',
'',
'   CURSOR C1(c_seq_no   NUMBER)',
'   IS',
'      SELECT *',
'        FROM (  SELECT WFAA_SEQ_NO,WFAA_STATUS,ROW_NUMBER() OVER(ORDER BY WFAA_SEQ_NO) rno',
'                  FROM WORK_FLOW_APPR_ACTVT',
'                 WHERE WFAA_BU = :GLOBAL_BU',
'                       AND WFAA_WF_ID = :P236131090_P_WF_TYPE',
'              ORDER BY WFAA_SEQ_NO)',
'       WHERE rno = NVL(c_seq_no,0)+1;',
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
'CURSOR C2 IS',
'SELECT  WFDC_SEQ_NO,WFDC_WF_NO,WFDC_TYPE,WFDC_VALUE,WFDC_CTRL_PERSON,wfdc_rnd_prj_id,',
'        wfdc_qc_rev,wfdc_qc_ins_mode,wfdc_disc_pct,wfdc_doc_no,wfdc_benf_type,wfdc_benf_id,wfdc_proj_id,wfdc_work_site',
'  FROM WORK_FLOW_DOC_CONTROL,work_flow',
' WHERE wf_bu = wfdc_bu',
'   AND wf_bus_proc_id = wfdc_type',
'   AND WFDC_BU = :GLOBAL_BU ',
'   AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'   AND (WF_AUTH_TYPE = ''E'' OR (WF_AUTH_TYPE = ''U'' AND (WFDC_PLNT = :P236131090_P_PLNT OR :P236131090_P_PLNT IS NULL)))',
'   AND (WFDC_DOC_PFX = :P236131090_P_DOC_PFX OR :P236131090_P_DOC_PFX IS NULL)',
'   AND (WFDC_DOC_NO = :P236131090_P_DOC_NO OR :P236131090_P_DOC_NO IS NULL)',
'   AND (WFDC_DOC_SFX = :P236131090_P_DOC_SFX OR :P236131090_P_DOC_SFX IS NULL)',
'   AND (WFDC_PROD_ID = :P236131090_P_PROD_ID OR :P236131090_P_PROD_ID IS NULL)',
'   AND (WFDC_PROD_REV = :P236131090_P_PROD_REV OR :P236131090_P_PROD_REV IS NULL)',
'   AND (WFDC_SPPLR_ID = :P236131090_P_SUPLR_ID OR :P236131090_P_SUPLR_ID IS NULL)',
'   AND (WFDC_CUST_ID = :P236131090_P_CUST_ID OR :P236131090_P_CUST_ID IS NULL)',
'   AND (WFDC_PRJ_ID = :P236131090_P_PROJ_ID OR :P236131090_P_PROJ_ID IS NULL)',
'  AND (WFDC_RND_PRJ_ID = :P236131090_P_RND_PROJ_ID OR :P236131090_P_RND_PROJ_ID IS NULL)',
'   AND (WFDC_LVL1 = :P236131090_P_LVL1 OR :P236131090_P_LVL1 IS NULL)',
'   AND (WFDC_LVL2 = :P236131090_P_LVL2 OR :P236131090_P_LVL2 IS NULL)',
'   AND (WFDC_LVL3 = :P236131090_P_LVL3 OR :P236131090_P_LVL3 IS NULL)',
'   AND (WFDC_LVL4 = :P236131090_P_LVL4 OR :P236131090_P_LVL4 IS NULL)',
'   AND (WFDC_ACCTS = :P236131090_P_ACCT OR :P236131090_P_ACCT IS NULL)',
'   AND (WFDC_JRNL_TYPE = :P236131090_P_JRNL_TYPE OR :P236131090_P_JRNL_TYPE IS NULL)',
' ORDER BY 1 DESC;',
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
'       WHERE WFDA_BU = :global_bu AND WFDA_TYPE = :P236131090_P_WF_TYPE;',
'',
'   CURSOR c_wfd IS',
'   SELECT *',
'     FROM work_flow_doc_control',
'    WHERE wfdc_bu = :GLOBAL_bu',
'      AND wfdc_wf_no = :P236131090_P_WF_NO;',
'',
'   CR2              C2%ROWTYPE;',
'   CR3              C3%ROWTYPE;',
'   CR4              C4%ROWTYPE;',
'',
'   r_wfd             c_wfd%ROWTYPE;',
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
'   v_can_res        VARCHAR2(100);',
'   v_rtn_res        VARCHAR2(100);',
'BEGIN',
'',
'  --Raise_Application_Error(-20999,''Test''||TO_DATE (:P236131090_P_DATE,:GLOBAL_DATE_MASK) || ''/'' || :P236131090_P_DOC_NO || ''/'' || :P236131090_FWD_USER || ''/'' || :P236131090_FWD_PERSON);',
'   OPEN c_wfd;',
'   FETCH c_wfd INTO r_wfd;',
'   CLOSE c_wfd;',
'',
'   OPEN c_wf;',
'   FETCH c_wf INTO v_auth_type,:P236131090_WF_MODULE;',
'   CLOSE c_wf;',
'',
'   OPEN C0;',
'   FETCH C0 INTO CR0;',
'   IF C0%FOUND THEN',
'      V_LAST_PROC := CR0.WFAA_STATUS;',
'   END IF;',
'   CLOSE C0;',
'',
'   OPEN C1(r_wfd.wfdc_seq_no);',
'   FETCH C1 INTO CR1;',
'   IF C1%FOUND THEN',
'      V_CUR_PROC := CR1.WFAA_STATUS;',
'   END IF;',
'   CLOSE C1;',
'',
'   OPEN C3;',
'   FETCH C3 INTO CR3;',
'   IF C3%NOTFOUND THEN',
'      V_WF_CONTROL := ''S'';',
'   ELSE',
'      V_WF_CONTROL := CR3.WFMC_DOC_COMP;',
'   END IF;',
'   CLOSE C3;',
'',
'   OPEN c4;',
'   FETCH c4 INTO cr4;',
'   CLOSE c4;',
'',
'   --Raise_application_error(-20999,''Authorization Not Defined''||cr4.v_dir_auth_cnt||:P236131090_P_WF_TYPE);',
'   IF cr4.v_dir_auth_cnt = 0',
'   THEN',
'      Raise_application_error (-20020, ''WFM'');',
'   ELSE',
'      /* Document status Changed from "New" To "Entry Completed" */',
'',
'      OPEN C2;',
'      FETCH C2 INTO CR2;',
'      CLOSE C2;',
'  --RAISE_APPLICATIon_ERROR(-20999,:P236131090_P_DATE);',
'   --RAISE_APPLICATIon_ERROR(-20999,''Test123'' || :P236131090_APPR_FLAG || ''/'' || :P236131090_FWD_FLAG || ''/'' ||  V_RES );',
'      PROC_WF_ENTRY_COMPL (:GLOBAL_BU,',
'                           :P236131090_P_PLNT,',
'                           CR2.WFDC_WF_NO,',
'                           :P236131090_P_DOC_PFX,',
'                           :P236131090_P_DOC_SFX,',
'                           :P236131090_P_DOC_NO,',
'                           TO_DATE (:P236131090_P_DATE,:GLOBAL_DATE_MASK),',
'                           :P236131090_P_WF_TYPE,',
'                           :P236131090_P_SUPLR_ID,',
'                           :P236131090_P_CUST_ID,',
'                           :P236131090_P_PROD_ID,',
'                           :P236131090_P_PROD_REV,',
'                           :P236131090_P_JRNL_TYPE,',
'                           :P236131090_P_PROJ_ID,',
'                           :P236131090_P_LVL1,',
'                           :P236131090_P_LVL2,',
'                           :P236131090_P_LVL3,',
'                           :P236131090_P_LVL4,',
'                           :P236131090_P_ACCT,',
'                           NULL,',
'                           NULL,',
'                           NULL,',
'                           :GLOBAL_USER,',
'                           :GLOBAL_EMP_ID,',
'                           :P236131090_P_LANG,',
'                           VAR_MSG,',
'                           V_RES);',
'',
'',
'      IF VAR_MSG IS NOT NULL THEN',
'         v_error := VAR_MSG;',
'      END IF;',
'',
'--Raise_Application_Error(-20999,''Test - ''||:P236131090_P_WF_TYPE);',
'      OPEN C2;',
'',
'      FETCH C2 INTO CR2;',
'',
'      IF C2%FOUND',
'',
'      THEN',
'      ',
'',
'         --raise_application_error(-20999,VAR_MSG||''Res/''||V_RES||''CR2.WFDC_WF_NO/''||CR2.WFDC_WF_NO);',
'         v_wf_no := cr2.wfdc_wf_no;',
'         v_wf_value := cr2.wfdc_value;',
'         v_ctrl_person := cr2.wfdc_ctrl_person;',
'         v_seq_no := cr2.wfdc_seq_no;',
'         v_wf_disc_pct := cr2.wfdc_disc_pct;',
'      /*    UPDATE WORK_FLOW_DOC_CONTROL',
'             SET WFDC_MAIL_FLAG = :P236131090_MAIL_FLAG',
'           WHERE WFDC_BU = :GLOBAL_BU AND WFDC_WF_NO = CR2.WFDC_WF_NO;*/',
'      ELSE',
'        Raise_Application_Error(-20999,''Work Flow not found.''||:GLOBAL_BU||''/''||:P236131090_P_WF_TYPE||''/''||',
'        v_auth_type||''/''||:P236131090_P_PLNT||''/''||',
'        :P236131090_P_DOC_PFX||''/''||:P236131090_P_DOC_NO||''/''||:GLOBAL_EMP_ID||''/''||:GLOBAL_USER);',
'      END IF;',
'',
'      CLOSE C2;',
'',
'      --Raise_Application_Error(-20999,''Test - ''||v_wf_control);',
'',
'      --added by sentha - start (08Aug2022)',
'      IF v_wf_control = ''N''',
'      THEN',
'         proc_work_flow_dir_auth_nonseq (:GLOBAL_BU,',
'                                         :P236131090_P_PLNT,',
'                                         :P236131090_P_WF_TYPE,',
'                                         :GLOBAL_USER,',
'                                         v_cur_proc,',
'                                         v_out);',
'      END IF;',
'',
'      --added by sentha - end (08Aug2022)',
'',
'',
'      IF    :P236131090_ACTION = ''YN''',
'         AND V_RES = ''Y''',
'      THEN',
'         IF V_CUR_PROC = V_LAST_PROC',
'         THEN',
'            P_OUT := ''N'';',
'',
'            IF v_wf_control = ''S''',
'            THEN',
'               PROC_WORK_FLOW_AUTH (:GLOBAL_BU,',
'                                    :P236131090_P_PLNT,',
'                                    :P236131090_P_WF_TYPE,',
'                                    V_CTRL_PERSON,',
'                                    V_WF_VALUE,',
'                                    NVL (V_SEQ_NO, 0),',
'                                    P_OUT,',
'                                    p_disc_pct   => v_wf_disc_pct,',
'                                    p_rqst_pfx   => :P236131090_P_DOC_PFX);',
'            --raise_application_error(-20999,''test3'');',
'            ELSE',
'               v_seq_no :=',
'                  func_find_wf_appr_seq_no (:GLOBAL_BU,',
'                                            :P236131090_P_PLNT,',
'                                            :P236131090_P_WF_TYPE,',
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
'                   wfdc_upd_date = SYSDATE,',
'                   WFDC_MESSAGE = :P236131090_WFT_MESSAGE,wfdc_nxt_message=:P236131090_WFT_MESSAGE,',
'                   WFDC_PRIORITY = :P236131090_WFT_PRIORITY',
'             WHERE     wfdc_bu = :GLOBAL_BU',
'                   AND wfdc_type = :P236131090_P_WF_TYPE',
'                   AND wfdc_wf_no = v_wf_no;',
'',
'',
'           /* IF :P236131090_P_WF_TYPE IN (''WF_PRA'', ''WF_WFPR'')',
'            THEN',
'              proc_wf_doc_approve (:GLOBAL_BU,',
'                                    :P236131090_WFT_DOC_NO,',
'                                    :P236131090_P_WF_TYPE,',
'                                    :P236131090_WF_MODULE,',
'                                    :GLOBAL_BU,',
'                                    :P236131090_P_PLNT,',
'                                    :P236131090_P_DOC_PFX,',
'                                    :P236131090_P_DOC_NO,',
'                                    :P236131090_P_DOC_SFX,',
'                                    :P236131090_P_PROD_ID,',
'                                    :P236131090_P_PROD_REV,',
'                                    :GLOBAL_USER,',
'                                    1,',
'                                   V_RES,',
'                                   V_RES3,',
'                                   VAR_MSG,',
'                                   VAR_ERR,',
'                                    :P236131090_P_SUPLR_ID);',
'            END IF*/',
'',
'',
'            OPEN C2;',
'            FETCH C2 INTO CR2;',
'            CLOSE C2;',
'',
'            /* Document Approval Procedure */',
'            --Raise_Application_Error(-20999,:P236131090_WF_MODULE);',
'            proc_wf_doc_approve(:GLOBAL_BU,',
'                                CR2.WFDC_WF_NO,',
'                                :P236131090_P_WF_TYPE,',
'                                :P236131090_WF_MODULE,',
'                                :GLOBAL_BU,',
'                                :P236131090_P_PLNT,',
'                                :P236131090_P_DOC_PFX,',
'                                :P236131090_P_DOC_NO,',
'                                :P236131090_P_DOC_SFX,',
'                                :P236131090_P_PROD_ID,',
'                                :P236131090_P_PROD_REV,',
'                                :GLOBAL_USER,',
'                                :GLOBAL_EMP_ID,',
'                                1,',
'                                V_RES,',
'                                V_RES3,',
'                                VAR_MSG,',
'                                VAR_ERR,',
'                                :P236131090_P_SUPLR_ID',
'                               );',
'',
'',
'         /*proc_wf_doc_approve(:GLOBAL_BU,',
'                             CR2.WFDC_WF_NO,',
'                             :P236131090_P_WF_TYPE,',
'                             :P236131090_P_PLNT,',
'                             :P236131090_P_DOC_SFX,',
'                             :P236131090_P_DOC_PFX,',
'                             :P236131090_P_DOC_NO,',
'                             TO_DATE(:P236131090_P_DATE),',
'                             :P236131090_P_WF_TYPE,',
'                             CR2.WFDC_WF_NO,',
'                             :P236131090_P_SUPLR_ID,',
'                             :P236131090_P_CUST_ID,',
'                             :P236131090_P_PROD_ID,',
'                             :P236131090_P_PROD_REV,',
'                             :P236131090_P_JRNL_TYPE,',
'                             :P236131090_P_RND_PROJ_ID,',
'                             :P236131090_P_PROJ_ID,',
'                             :P236131090_P_LVL1,',
'                             :P236131090_P_LVL2,',
'                             :P236131090_P_LVL3,',
'                             :P236131090_P_LVL4,',
'                             :P236131090_P_LVL_PRJ,',
'                             :P236131090_P_ACCT,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             CR2.WFDC_QC_INS_MODE,',
'                             CR2.WFDC_QC_REV,',
'                             :GLOBAL_USER,',
'                             :P236131090_P_LANG,',
'                             V_RES,',
'                             V_RES3,',
'                             VAR_MSG,',
'                             VAR_ERR,',
'                             NULL,',
'                             NULL);*/',
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
'                   WFDC_SELECT_FLAG = 0,',
'                   WFDC_PRIORITY = :P236131090_WFT_PRIORITY,',
'                   WFDC_FWD_PERSON = :GLOBAL_USER,',
'                   WFDC_FWD_ON = SYSDATE,',
'                   WFDC_SRC_BU = :GLOBAL_BU,',
'                   WFDC_SRC_PLNT = :P236131090_P_PLNT,',
'                   WFDC_SRC_USER = :GLOBAL_USER,',
'                   wfdc_mail_send_flag =',
'                      CASE',
'                         WHEN :P236131090_MAIL_FLAG = ''Y'' THEN ''Y''',
'                         ELSE ''N''',
'                      END,',
'                   WFDC_MESSAGE = :P236131090_WFT_MESSAGE,',
'                   wfdc_nxt_message = :P236131090_WFT_MESSAGE',
'             WHERE     WFDC_BU = :GLOBAL_BU',
'                   AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'                   AND WFDC_WF_NO = V_WF_NO;',
'         END IF;',
'',
'         IF V_RES = ''Y''',
'         THEN',
'            --:P236131090_MSG := ''Document  approved.'';',
'            v_error := VAR_MSG||'' Document  Approved.'';',
'         END IF;',
'      END IF;                                           -- END OF ONLY APPROVE',
'',
'      IF  :P236131090_ACTION = ''NY''',
'         AND V_RES = ''Y''',
'      THEN',
'         -- raise_application_error(-20999,''Test123'' || :P236131090_APPR_FLAG || ''/'' || :P236131090_FWD_FLAG || ''/'' || V_RES);',
'',
'',
'         --raise_application_error(-20999,''test'' || :P236131090_FWD_ENTITY || ''/'' || :P236131090_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P236131090_FWD_PERSON);',
'         IF v_auth_type = ''P''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_position_id (:P236131090_FWD_ENTITY,',
'                                      :P236131090_FWD_USER);',
'            v_emp_id := :P236131090_FWD_PERSON;',
'         --null;',
'         ELSIF v_auth_type = ''E''',
'         THEN',
'            --  raise_application_error(-20999,''test sentha ''|| :P236131090_FWD_ENTITY || ''/'' || :P236131090_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P236131090_FWD_PERSON );',
'            v_ctrl_person := :P236131090_FWD_PERSON;',
'            v_emp_id := v_ctrl_person;',
'         --null;',
'         --raise_application_error(-20999,''test'' || :P236131090_FWD_ENTITY || ''/'' || :P236131090_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P236131090_FWD_PERSON);',
'         END IF;',
'',
'',
'         --raise_application_error(-20999,''test'' || :P236131090_FWD_ENTITY || ''/'' || :P236131090_FWD_USER || ''/'' || v_ctrl_person || ''/'' || v_auth_type ||''/''||:P236131090_FWD_PERSON);',
'',
'         /*  V_CTRL_PERSON :=',
'              FUNC_FIND_POSITION_ID ( :P236131090_FWD_ENTITY, :P236131090_FWD_USER);*/',
'',
'         --raise_application_error(-20999,''HRM'');',
'',
'         --raise_application_error(-20999,:P236131090_P_WF_TYPE||''/''||v_emp_id||''/''||v_ctrl_person||''/''||v_auth_type);',
'',
'         V_APPR_BU :=',
'            FUNC_FIND_WF_RESP_PERSON_BU (',
'               :GLOBAL_BU,',
'               :P236131090_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               FUNC_FIND_EMP_POS_ID (:P236131090_FWD_ENTITY, V_CTRL_PERSON),',
'               1);',
'         V_APPR_PLNT :=',
'            FUNC_FIND_WF_RESP_PERSON_PLNT (',
'               :GLOBAL_BU,',
'               :P236131090_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               v_emp_id,',
'               1);',
'',
'         UPDATE WORK_FLOW_DOC_CONTROL',
'            SET WFDC_CTRL_PERSON = V_CTRL_PERSON,',
'                WFDC_FWD_PERSON = :GLOBAL_USER,',
'                wfdc_fwd_person_emp = :GLOBAL_emp_id,',
'                WFDC_FWD_ON = SYSDATE,',
'                WFDC_FWD_TO = :P236131090_FWD_USER,',
'                WFDC_FWD_TO_EMP = v_emp_id,',
'                WFDC_FRWD_RTN = ''F'',',
'                WFDC_ACT = ''F'',',
'                /*WFDC_SEQ_NO =',
'                   FUNC_FIND_WF_APPR_SEQ_NO (:P236131090_FWD_ENTITY,',
'                                             :P236131090_FWD_PLNT,',
'                                             :P236131090_P_WF_TYPE,',
'                                             V_CTRL_PERSON),*/',
'                WFDC_MESSAGE = :P236131090_WFT_MESSAGE,',
'                WFDC_ACTION_DATE = SYSDATE,',
'                WFDC_PRIORITY = :P236131090_WFT_PRIORITY,',
'                WFDC_BU = V_APPR_BU,',
'                WFDC_PLNT = V_APPR_PLNT,',
'                WFDC_SRC_BU = :GLOBAL_BU,',
'                WFDC_SRC_PLNT = :P236131090_P_PLNT,',
'                WFDC_SRC_USER = :GLOBAL_USER,',
'                wfdc_mail_send_flag =',
'                   CASE',
'                      WHEN :P236131090_MAIL_FLAG = ''Y'' THEN ''Y''',
'                      ELSE ''N''',
'                   END,',
'                wfdc_upd_by = :GLOBAL_USER,',
'                wfdc_select_flag = 0,',
'                   wfdc_nxt_message = :P236131090_WFT_MESSAGE',
'          WHERE     WFDC_BU = :GLOBAL_BU',
'                AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'                AND WFDC_WF_NO = V_WF_NO;',
'',
'         v_error := ''The document has been forwarded'';',
'      --:P236131090_MSG := ''The document has been forwarded!'';',
'      END IF;                                           -- END OF ONLY FORWARD',
'',
'',
'--Raise_Application_Error(-20999,:P236131090_APPR_FLAG||''/''||:P236131090_FWD_FLAG||''/''||:P236131090_ACTION);',
'      IF :P236131090_ACTION = ''YY''',
'      THEN',
'      --Raise_Application_Error(-20999,v_auth_type||''/''||:P236131090_FWD_ENTITY||''/''||:P236131090_FWD_USER);',
'         IF :P236131090_FWD_ENTITY IS NULL THEN',
'         :P236131090_FWD_ENTITY := :GLOBAL_bu;',
'         END IF;',
'         ',
'         IF v_auth_type = ''P''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_position_id (:P236131090_FWD_ENTITY,',
'                                      :P236131090_FWD_USER);',
'            v_emp_id :=',
'               func_find_emp_pos_id (:P236131090_FWD_ENTITY, v_ctrl_person);',
'         ELSIF v_auth_type = ''E''',
'         THEN',
'            v_ctrl_person :=',
'               func_find_emp_id (:P236131090_FWD_ENTITY,',
'                                 :P236131090_FWD_USER);',
'            v_emp_id := v_ctrl_person;',
'         END IF;',
'',
'         /* V_CTRL_PERSON :=',
'             FUNC_FIND_POSITION_ID ( :P236131090_FWD_ENTITY, :P236131090_FWD_USER);*/',
'',
'',
'         V_SEQ_NO :=',
'            FUNC_FIND_WF_APPR_SEQ_NO (:P236131090_FWD_ENTITY,',
'                                      :P236131090_FWD_PLNT,',
'                                      :P236131090_P_WF_TYPE,',
'                                      V_CTRL_PERSON);',
'         V_APPR_BU :=',
'            FUNC_FIND_WF_RESP_PERSON_BU (',
'               :GLOBAL_BU,',
'               :P236131090_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               FUNC_FIND_EMP_POS_ID (:P236131090_FWD_ENTITY, V_CTRL_PERSON),',
'               1);',
'         V_APPR_PLNT :=',
'            FUNC_FIND_WF_RESP_PERSON_PLNT (',
'               :GLOBAL_BU,',
'               :P236131090_P_WF_TYPE,',
'               FUNC_FIND_EMP_ID (:GLOBAL_BU, :GLOBAL_USER),',
'               v_emp_id,',
'               1);',
'',
'         IF V_CUR_PROC = V_LAST_PROC',
'         THEN',
'            P_OUT := ''N'';',
'',
'            PROC_WORK_FLOW_AUTH (:GLOBAL_BU,',
'                                 :P236131090_P_PLNT,',
'                                 :P236131090_P_WF_TYPE,',
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
'                   AND wfdc_type = :P236131090_P_WF_TYPE',
'                   AND wfdc_wf_no = v_wf_no;',
'',
'',
'            PROC_WF_APPROVE (:GLOBAL_BU,',
'                             :GLOBAL_BU,',
'                             :P236131090_P_PLNT,',
'                             :P236131090_P_DOC_SFX,',
'                             :P236131090_P_DOC_PFX,',
'                             :P236131090_P_DOC_NO,',
'                             TO_DATE (:P236131090_P_DATE,:GLOBAL_DATE_MASK),',
'                             :P236131090_P_WF_TYPE,',
'                             CR2.WFDC_WF_NO,',
'                             :P236131090_P_SUPLR_ID,',
'                             :P236131090_P_CUST_ID,',
'                             :P236131090_P_PROD_ID,',
'                             :P236131090_P_PROD_REV,',
'                             :P236131090_P_JRNL_TYPE,',
'                             CR2.WFDC_RND_PRJ_ID,',
'                             :P236131090_P_PROJ_ID,',
'                             :P236131090_P_LVL1,',
'                             :P236131090_P_LVL2,',
'                             :P236131090_P_LVL3,',
'                             :P236131090_P_LVL4,',
'                             :P236131090_P_LVL_PRJ,',
'                             :P236131090_P_ACCT,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             CR2.WFDC_QC_INS_MODE,',
'                             CR2.WFDC_QC_REV,',
'                             :GLOBAL_USER,',
'                             :P236131090_P_LANG,',
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
'                   WFDC_PRIORITY = :P236131090_WFT_PRIORITY,',
'                   WFDC_FWD_PERSON = :GLOBAL_USER,',
'                   WFDC_FWD_PERSON_EMP = :GLOBAL_EMP_ID,',
'                   WFDC_FWD_ON = SYSDATE,',
'                   WFDC_SRC_BU = :GLOBAL_BU,',
'                   WFDC_SRC_PLNT = :P236131090_P_PLNT,',
'                   WFDC_SRC_USER = :GLOBAL_USER,WFDC_MESSAGE = :P236131090_WFT_MESSAGE,',
'                   wfdc_nxt_message = :P236131090_WFT_MESSAGE',
'             WHERE     WFDC_BU = :GLOBAL_BU',
'                   AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'                   AND WFDC_WF_NO = V_WF_NO;',
'',
'            V_RES1 := ''Y'';',
'         END IF;',
'',
'--Raise_Application_Error(-20999,V_CTRL_PERSON||''/''||:P236131090_WFT_MESSAGE);',
'         UPDATE WORK_FLOW_DOC_CONTROL',
'            SET WFDC_CTRL_PERSON = V_CTRL_PERSON,',
'                WFDC_FWD_PERSON = :GLOBAL_USER,',
'                WFDC_FWD_PERSON_EMP = :GLOBAL_EMP_ID,',
'                WFDC_FWD_ON = SYSDATE,',
'                WFDC_FWD_TO = :P236131090_FWD_USER,',
'                WFDC_FWD_TO_EMP = v_emp_id,',
'                WFDC_FRWD_RTN = ''F'',',
'                WFDC_ACT = ''F'',',
'                WFDC_MESSAGE = :P236131090_WFT_MESSAGE,',
'                WFDC_ACTION_DATE = SYSDATE,',
'                WFDC_PRIORITY = :P236131090_WFT_PRIORITY,',
'                WFDC_BU = V_APPR_BU,',
'                WFDC_PLNT = V_APPR_PLNT,',
'                WFDC_SRC_BU = :GLOBAL_BU,',
'                WFDC_SRC_PLNT = :P236131090_P_PLNT,',
'                WFDC_SRC_USER = :GLOBAL_USER,',
'                WFDC_SELECT_FLAG = 0,',
'                   wfdc_nxt_message = :P236131090_WFT_MESSAGE',
'          WHERE     WFDC_BU = :GLOBAL_BU',
'                AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'                AND WFDC_WF_NO = V_WF_NO;',
'',
'',
'         IF V_RES1 = ''Y'' THEN',
'            --:P236131090_MSG := ''Document  approved and Forwarded.'';',
'           DECLARE',
'             v_frd_msg VARCHAR2(500);',
'           BEGIN',
'             SELECT Initcap(ACTION_NAME) INTO v_frd_msg',
'               FROM wf_apex_action WHERE ACTION_ID = :P236131090_ACTION;',
'             v_error := v_frd_msg;',
'           EXCEPTION',
'             WHEN OTHERS THEN v_error := ''Document Approved and Forwarded.'';',
'           END;',
'            --v_error := ''Document Approved and Forwarded.'';',
'         END IF;',
'      END IF;                               -- END OF BOTH FORWARD AND APPROVE',
'',
'IF :P236131090_ACTION = ''C'' THEN',
'        OPEN c_wfd;',
'        FETCH c_wfd INTO r_wfd;',
'          IF c_wfd%NOTFOUND THEN',
'            Raise_Application_Error(-20999,''Record not found.'');',
'          ELSE',
'        proc_wf_doc_cancel (NVL (r_wfd.wfdc_src_bu,r_wfd.wfdc_bu),',
'                                                   :GLOBAL_bu,',
'                                                   NVL (r_wfd.wfdc_src_plnt,r_wfd.wfdc_plnt),',
'                                                   r_wfd.wfdc_doc_sfx,',
'                                                   r_wfd.wfdc_doc_pfx,',
'                                                   r_wfd.wfdc_doc_no,',
'                                                   r_wfd.wfdc_doc_date,',
'                                                   r_wfd.wfdc_type,',
'                                                   r_wfd.wfdc_wf_no,',
'                                                   r_wfd.wfdc_spplr_id,',
'                                                   r_wfd.wfdc_cust_id,',
'                                                   r_wfd.wfdc_prod_id,',
'                                                   r_wfd.wfdc_prod_rev,',
'                                                   r_wfd.wfdc_jrnl_type,',
'                                                   r_wfd.wfdc_rnd_prj_id,',
'                                                   r_wfd.wfdc_prj_id,',
'                                                   r_wfd.wfdc_lvl1,',
'                                                   r_wfd.wfdc_lvl2,',
'                                                   r_wfd.wfdc_lvl3,',
'                                                   r_wfd.wfdc_lvl4,',
'                                                   r_wfd.wfdc_lvl_prj,',
'                                                   r_wfd.wfdc_accts,',
'                                                   r_wfd.wfdc_qc_ins_mode,',
'                                                   r_wfd.wfdc_qc_rev,',
'                                                   r_wfd.wfdc_coll_centr_id,',
'                                                   r_wfd.wfdc_inst_id,',
'                                                   r_wfd.wfdc_inst_ser_no,',
'                                                   NVL (r_wfd.wfdc_src_user, :GLOBAL_user),',
'                                                   1,',
'                                                   v_can_res,',
'                                                   v_res3,',
'                                                   var_msg,',
'                                                   var_err);',
'',
'            IF var_err IS NOT NULL',
'            THEN',
'               Raise_Application_Error (-20999, ''APX'' || var_err);',
'            ELSE',
'              v_error := ''Document Cancelled.'';',
'            END IF;',
'            END IF;',
'          CLOSE c_wfd;',
'END IF;',
'',
'     IF :P236131090_ACTION = ''R''',
'      THEN',
'        --Raise_Application_Error(-20999,''cancel'');',
'        OPEN c_wfd;',
'        FETCH c_wfd INTO r_wfd;',
'          IF c_wfd%NOTFOUND THEN',
'            Raise_Application_Error(-20999,''Record not found.'');',
'          ELSE',
'',
'            UPDATE work_flow_doc_control',
'               SET wfdc_select_flag = 0,',
'                   wfdc_nxt_status = ''R'',',
'                   wfdc_nxt_fwd_person = :P236131090_RTN_PERSON,',
'                   wfdc_nxt_message = :P236131090_WFT_MESSAGE,',
'                   WFDC_PRIORITY = :P236131090_WFT_PRIORITY',
'             WHERE wfdc_bu = :GLOBAL_bu',
'               AND wfdc_wf_no = :P236131090_P_WF_NO;',
'',
'            proc_wf_doc_return(r_wfd.wfdc_bu,',
'                                      r_wfd.wfdc_plnt,',
'                                      r_wfd.wfdc_type,',
'                                      r_wfd.wfdc_doc_pfx,',
'                                      r_wfd.wfdc_doc_no,',
'                                      r_wfd.wfdc_wf_no,',
'                                      :GLOBAL_user,',
'                                      :GLOBAL_EMP_ID,',
'                                      v_rtn_res);',
'              v_error := ''Document Returned.'';',
'          END IF;',
'        CLOSE c_wfd;',
'      END IF;',
'',
'      UPDATE WORK_FLOW_DOC_CONTROL',
'         SET WFDC_ACT = ''W''',
'       WHERE     WFDC_BU = V_APPR_BU',
'             AND WFDC_TYPE = :P236131090_P_WF_TYPE',
'             AND WFDC_WF_NO = V_WF_NO;',
'   --raise_application_error(-20999,''check'');',
'   END IF;',
'	    :P236131090_P_ERR := v_error;',
'   ',
'END;',
'Commit;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    proc_apex_err_msg_log(236131090,''Workflow'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'&P236131090_P_ERR.'
,p_internal_uid=>897270850201193037
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6376791465756113239)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Project Time Sheet Validation'
,p_static_id=>'project-time-sheet-validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P236131090_P_WF_TYPE = ''WF_PRJ_EMPTC'' THEN',
'   ',
'   DECLARE',
'      ',
'      CURSOR c1',
'          IS',
'      SELECT *',
'        FROM proj_emp_time_card',
'       WHERE petc_bu     = :GLOBAL_BU',
'         AND petc_plnt   = :P236131090_P_PLNT',
'         AND petc_doc_no = :P236131090_P_DOC_NO;',
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
,p_internal_uid=>897270481971193037
);
wwv_flow_imp.component_end;
end;
/
