prompt --application/pages/page_00055
begin
--   Manifest
--     PAGE: 00055
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
 p_id=>55
,p_name=>'Workday Calendar'
,p_alias=>'WORKDAY-CALENDAR'
,p_page_mode=>'MODAL'
,p_step_title=>'Workday Calendar'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19917013114057801362)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19917028058992801389)
,p_plug_name=>'Workday Calendar'
,p_static_id=>'workday-calendar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ZWCHD_BU,',
'       ZWCHD_PLNT,',
'       ZWCHD_CLNDR_NO,',
'       ZWCHD_ZONE_ID,',
'       ZWCHD_YEAR,',
'       ZWCHD_START_DATE,',
'       ZWCHD_END_DATE,',
'       ZWCHD_STATUS,       ',
'       ZWCHD_CLNDR_ID,',
'       ZWCHD_GEN_CLNDR_FLAG,',
'       ZWCHD_CRE_BY,',
'       ZWCHD_CRE_IP_ADDR,',
'       ZWCHD_CRE_OS_USER,',
'       ZWCHD_CRE_DATE,',
'       ZWCHD_UPD_BY,',
'       ZWCHD_UPD_IP_ADDR,',
'       ZWCHD_UPD_OS_USER,',
'       ZWCHD_UPD_DATE,',
'       ZWCHD_CRE_EMP_ID,',
'       ZWCHD_UPD_EMP_ID',
'  from ZONE_WORKDAY_CALENDAR_HD',
' where  ZWCHD_BU = :GLOBAL_BU'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201617520753769205)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19917013114057801362)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P55_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201617044789769202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19917013114057801362)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P55_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6201636977802769238)
,p_branch_name=>'GO_TO_PAGE'
,p_branch_action=>'f?p=&APP_ID.:57:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201619401469769210)
,p_name=>'P55_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201619775720769210)
,p_name=>'P55_ZWCHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201618950077769208)
,p_name=>'P55_ZWCHD_CLNDR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_prompt=>'<b>Calendar</b>'
,p_source=>'ZWCHD_CLNDR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pc_clndr_name,',
'       pc_clndr_id',
'  FROM pyrl_clndr',
' WHERE pc_bu = :GLOBAL_bu',
' ORDER BY pc_clndr_name'))
,p_cSize=>32
,p_cMaxlength=>5
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when=>'P55_ZWCHD_STATUS'
,p_read_only_when2=>'A'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201618206695769207)
,p_name=>'P55_ZWCHD_CLNDR_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT MAX(NVL(zwchd_clndr_no, 1000000000)) + 1  "clndr_no"',
'     FROM zone_workday_calendar_hd ',
'    WHERE zwchd_bu = :GLOBAL_bu;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Calendar No.'
,p_source=>'ZWCHD_CLNDR_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6201623304652769214)
,p_name=>'P55_ZWCHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201624484168769217)
,p_name=>'P55_ZWCHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_format_mask=>'DD-MON-YYYY HH:MI:SSPM'
,p_source=>'ZWCHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201626515837769221)
,p_name=>'P55_ZWCHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201623671356769216)
,p_name=>'P55_ZWCHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201624122104769216)
,p_name=>'P55_ZWCHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201622463355769214)
,p_name=>'P55_ZWCHD_END_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_END_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201621336285769211)
,p_name=>'P55_ZWCHD_END_DATE_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ROWID IS NOT NULL THEN',
'   RETURN :P55_ZWCHD_END_DATE;',
'END IF;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>End Date</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201622892021769214)
,p_name=>'P55_ZWCHD_GEN_CLNDR_FLA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_default=>'N'
,p_source=>'ZWCHD_GEN_CLNDR_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201620206953769210)
,p_name=>'P55_ZWCHD_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201622162832769213)
,p_name=>'P55_ZWCHD_START_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_START_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201620932540769211)
,p_name=>'P55_ZWCHD_START_DATE_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ROWID IS NOT NULL THEN',
'   RETURN :P55_ZWCHD_START_DATE;',
'END IF;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Start Date</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201618610071769208)
,p_name=>'P55_ZWCHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_default=>'N'
,p_source=>'ZWCHD_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201624861637769217)
,p_name=>'P55_ZWCHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201626115339769219)
,p_name=>'P55_ZWCHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_format_mask=>'DD-MON-YYYY HH:MI:SSPM'
,p_source=>'ZWCHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201626860202769221)
,p_name=>'P55_ZWCHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201625288392769217)
,p_name=>'P55_ZWCHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201625700495769219)
,p_name=>'P55_ZWCHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_source=>'ZWCHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201620532629769211)
,p_name=>'P55_ZWCHD_YEAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_prompt=>'<b>Year</b>'
,p_source=>'ZWCHD_YEAR'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pcy_year pcy_year1,',
'       pcy_year',
'  FROM payroll_cal_year',
' WHERE pcy_bu = :GLOBAL_bu',
'   AND pcy_clndr_id = :P55_ZWCHD_CLNDR_ID',
' ORDER BY pcy_year DESC'))
,p_lov_cascade_parent_items=>'P55_ZWCHD_CLNDR_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P55_ZWCHD_STATUS'
,p_read_only_when2=>'A'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201621823431769213)
,p_name=>'P55_ZWCHD_ZONE_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_item_source_plug_id=>wwv_flow_imp.id(19917028058992801389)
,p_prompt=>'<b>Zone</b>'
,p_source=>'ZWCHD_ZONE_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT hz_desc1,',
'       hz_zone_id',
'  FROM holiday_zones',
' WHERE hz_bu = :GLOBAL_BU',
' ORDER BY hz_desc1'))
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P55_ZWCHD_STATUS'
,p_read_only_when2=>'A'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6201635314514769235)
,p_validation_name=>'VAL_CLNDR'
,p_static_id=>'val-clndr'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ZWCHD_CLNDR_ID IS NULL THEN',
'   RETURN ''Calendar must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6201618950077769208)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6201634494252769232)
,p_validation_name=>'VAL_YEAR'
,p_static_id=>'val-year'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ZWCHD_YEAR IS NULL THEN',
'   RETURN ''Year must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6201620532629769211)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6201634916864769235)
,p_validation_name=>'VAL_ZONE'
,p_static_id=>'val-zone'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ZWCHD_ZONE_ID IS NULL THEN',
'   RETURN ''Zone must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6201621823431769213)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6201635934531769235)
,p_name=>'set_value'
,p_static_id=>'set-value'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P55_ZWCHD_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6201636530360769236)
,p_event_id=>wwv_flow_imp.id(6201635934531769235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P55_ZWCHD_START_DATE_1,P55_ZWCHD_END_DATE_1,P55_ZWCHD_START_DATE,P55_ZWCHD_END_DATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P55_ZWCHD_CLNDR_ID,P55_ZWCHD_YEAR',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT pcy_start_date dummy1,',
    '       pcy_end_date dummy2,',
    '       pcy_start_date dummy3,',
    '       pcy_end_date dummy4',
    '  FROM payroll_cal_year',
    ' WHERE pcy_bu = :GLOBAL_BU',
    '   AND pcy_clndr_id = :P55_ZWCHD_CLNDR_ID',
    '   AND pcy_year = :P55_ZWCHD_YEAR')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201633982948769232)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(19917028058992801389)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Zone Calendar'
,p_static_id=>'initialize-form-zone-calendar'
,p_internal_uid=>719672147405158204
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201633612940769230)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(19917028058992801389)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Workday Calendar'
,p_static_id=>'process-form-workday-calendar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Workday Calendar Successfully Updated.'
,p_internal_uid=>719671777397158202
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201635626664769235)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'process_pre_insert'
,p_static_id=>'process-pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P55_ROWID IS NULL THEN',
'   						   ',
'   :P55_ZWCHD_BU          := :GLOBAL_bu;',
'   :P55_ZWCHD_CRE_BY      := :GLOBAL_USER;',
'   :P55_ZWCHD_CRE_IP_ADDR := :GLOBAL_IP_ADDR;',
'   :P55_ZWCHD_CRE_OS_USER := :GLOBAL_OS_USER;',
'   :P55_ZWCHD_CRE_EMP_ID  := :GLOBAL_EMP;',
'   :P55_ZWCHD_CRE_DATE    := TO_CHAR(SYSDATE, ''DD-MON-YYYY HH:MI:SSPM'');',
'   ',
'    DECLARE',
'',
'       CURSOR c1',
'           IS',
'       SELECT *',
'         FROM zone_workday_calendar_hd',
'        WHERE zwchd_bu = :GLOBAL_bu',
'          AND zwchd_clndr_no <> :P55_ZWCHD_CLNDR_NO',
'          AND zwchd_clndr_id = :P55_ZWCHD_CLNDR_ID',
'          AND zwchd_zone_id  = :P55_ZWCHD_ZONE_ID',
'          AND zwchd_year     = :P55_ZWCHD_YEAR',
'          AND zwchd_status NOT IN (''I'');',
'',
'          cr1								c1%ROWTYPE;',
'',
'    BEGIN',
'',
'       OPEN c1;',
'       FETCH c1 INTO cr1;',
'',
'          IF c1%FOUND THEN',
'             RAISE_APPLICATION_ERROR(-20999,''Workday Calendar already Exists. Calendar No. : ''||cr1.zwchd_clndr_no);',
'          END IF;',
'',
'       CLOSE c1;',
'',
'    END;   ',
'   ',
'END IF;',
'',
'IF :P55_ROWID IS NOT NULL THEN',
'    ',
'   :P55_ZWCHD_UPD_BY      := :GLOBAL_USER;',
'   :P55_ZWCHD_UPD_IP_ADDR := :GLOBAL_IP_ADDR;',
'   :P55_ZWCHD_UPD_OS_USER := :GLOBAL_OS_USER;',
'   :P55_ZWCHD_UPD_EMP_ID  := :GLOBAL_EMP;',
'   :P55_ZWCHD_UPD_DATE    := TO_CHAR(SYSDATE, ''DD-MON-YYYY HH:MI:SSPM'');',
' ',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>719673791121158207
);
wwv_flow_imp.component_end;
end;
/
