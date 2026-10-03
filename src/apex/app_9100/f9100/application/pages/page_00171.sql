prompt --application/pages/page_00171
begin
--   Manifest
--     PAGE: 00171
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
 p_id=>171
,p_name=>'Notification Access'
,p_alias=>'NOTIFICATION-ACCESS'
,p_page_mode=>'MODAL'
,p_step_title=>'Notification Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6397155355458756137)
,p_plug_name=>'Notification Access'
,p_static_id=>'notification-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6397155987386756144)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6397156183925756146)
,p_branch_name=>'Go To 108'
,p_branch_action=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.::P108_ROWID:&P171_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6397155987386756144)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397155743744756141)
,p_name=>'P171_DOC_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397155608356756140)
,p_name=>'P171_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397155523285756139)
,p_name=>'P171_REFERENCE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_prompt=>'Reference'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397155842789756142)
,p_name=>'P171_ROWID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6397155386928756138)
,p_name=>'P171_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6397155355458756137)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Add;A,Modify;M'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6397156099325756145)
,p_validation_name=>'Reference'
,p_static_id=>'reference'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P171_REFERENCE IS NULL THEN',
'RETURN(''Reference must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6397155987386756144)
,p_associated_item=>wwv_flow_imp.id(6397155523285756139)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6397156356159756147)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert'
,p_static_id=>'insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P171_ROWID is null then',
'',
'      SELECT NVL(MAX(TO_NUMBER(WUDAH_DOC_NO)),''1000000000'') +1',
'      INTO :P171_DOC_NO',
'      FROM WAPL_USER_DABHBOARD_ACCS_HD',
'     WHERE WUDAH_BU         =   :GLOBAL_BU;',
'',
'INSERT INTO WAPL_USER_DABHBOARD_ACCS_HD(Wudah_bu,',
'                                        wudah_doc_no,',
'                                        wudah_type,',
'                                        wudah_ref,',
'										wudah_doc_date,',
'                                        wudah_status,',
'                                        wudah_cre_by,',
'                                        wudah_cre_ip_addr,',
'                                        wudah_cre_os_user,',
'                                        wudah_cre_date,',
'										wudah_cre_emp_id)',
'						        VALUES(:global_bu,',
'                                       :P171_DOC_NO,',
'                                       :P171_TYPE,',
'                                       :P171_REFERENCE,',
'                                       :P171_DOC_DATE,',
'                                       ''N'',',
'                                       :GLOBAL_USER,',
'                                       :GLOBAL_IP_ADDR,',
'                                       :GLOBAL_OS_USER,',
'                                       SYSDATE,',
'                                       :GLOBAL_EMP_NAME);',
'',
'        ',
'  APEX_APPLICATION.g_print_success_message := ''Document Created with Doc.No.:''|| :P171_DOC_NO;',
'',
'                   ',
'   SELECT ROWID',
'          INTO :P171_ROWID',
'          FROM WAPL_USER_DABHBOARD_ACCS_HD',
'         WHERE Wudah_bu    = :GLOBAL_BU',
'           AND Wudah_doc_no = :P171_DOC_NO; ',
'',
'        END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6397155987386756144)
,p_internal_uid=>917635372374835945
);
wwv_flow_imp.component_end;
end;
/
