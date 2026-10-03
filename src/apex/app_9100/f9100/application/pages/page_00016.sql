prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Employee Quick Entry'
,p_alias=>'EMPLOYEE-QUICK-ENTRY'
,p_page_mode=>'MODAL'
,p_step_title=>'Employee Quick Entry'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'.t-Region--accent4>.t-Region-header {',
'    --ut-region-header-background-color: #dec553de;',
'    --ut-region-header-text-color: var(--u-color-4-contrast);',
'}',
'',
'.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #fff;',
'}',
'*/',
'',
'#config .t-Button--primary.t-Button--link {',
'    padding-top: 13px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8050227972351063544)
,p_plug_name=>'<b>Employee Quick Entry</b>'
,p_static_id=>'b-employee-quick-entry-b'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116722487523651776)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Designation'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116721732475651773)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_button_name=>'Close1'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116722105546651776)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P16_DEFAULT_VALUE'
,p_button_condition2=>'U'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116730717411651798)
,p_branch_name=>'Go To Page 1601'
,p_branch_action=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7116722105546651776)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8050230603099063578)
,p_name=>'P16_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7587322780206527984)
,p_name=>'P16_DEFAULT_VALUE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8050231081092063583)
,p_name=>'P16_DEPARTMENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Select the Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dept_name1,',
'       dept_id from departments',
'            where dept_bU = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Department'
,p_cSize=>150
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-shapes'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Department',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8050230959479063582)
,p_name=>'P16_DESIGNATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Designation '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT HRPOS_POS_NAME1,',
'       HRPOS_POS_ID  ',
'from HR_POSITIONS ',
' WHERE HRPOS_BU = :GLOBAL_BU',
'   AND HRPOS_ACTIVE_FLAG = ''Y'' ',
'order by HRPOS_POS_NAME1 asc '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Designation '
,p_cSize=>150
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-user-graduate'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Designation',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8050230690420063579)
,p_name=>'P16_EMPLOYEE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Emp. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when=>'((func_find_emp_code_mode(:GLOBAL_BU,''E'') <> ''M'' OR func_find_emp_code_mode(:GLOBAL_BU,''E'') IS NULL))'
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7583134032568716409)
,p_name=>'P16_MAIL_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Mail ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_icon_css_classes=>'fa-envelope-o'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'EMAIL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8050230851983063580)
,p_name=>'P16_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7583133835610716407)
,p_name=>'P16_PHONE_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_prompt=>'Mobile No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_attributes=>'style="text-align:right";'
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_icon_css_classes=>'fa-mobile'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7587322883356527985)
,p_name=>'P16_START_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8050227972351063544)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'DOJ'
,p_format_mask=>'DD-MON-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when=>'P16_DEFAULT_VALUE'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116728221106651788)
,p_validation_name=>'Department'
,p_static_id=>'department'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_DEPARTMENT IS NULL THEN',
'  ',
'  DECLARE',
'',
'   CURSOR C1',
'       IS',
'   SELECT COUNT(*) V_DEPT_CNT',
'     FROM DEPARTMENTS ',
'    WHERE DEPT_BU = :GLOBAL_BU;',
'',
'  CR1             C1%ROWTYPE;',
'',
' BEGIN',
'',
' OPEN C1;',
' FETCH C1 INTO CR1;',
'',
'     IF  CR1.V_DEPT_CNT >0 THEN',
'       RETURN(''Department must be enter.'');  ',
'     END IF;',
' END;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(8050231081092063583)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116727767454651787)
,p_validation_name=>'DESIGNATION'
,p_static_id=>'designation'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_DESIGNATION IS NULL THEN',
'  ',
'  DECLARE',
'',
'   CURSOR C1',
'       IS',
'   SELECT COUNT(*) V_POS_CNT',
'     FROM HR_POSITIONS ',
'    WHERE HRPOS_BU = :GLOBAL_BU',
'      AND hrpos_active_flag = ''Y'';',
'',
'  CR1             C1%ROWTYPE;',
'',
' BEGIN',
'',
' OPEN C1;',
' FETCH C1 INTO CR1;',
'',
'     IF  CR1.V_POS_CNT >0 THEN',
'       RETURN(''Designation must be enter.'');  ',
'     END IF;',
' END;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(8050230959479063582)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116726973431651787)
,p_validation_name=>'DOJ'
,p_static_id=>'doj'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_START_DATE > TRUNC(SYSDATE) THEN',
'  RETURN(''Employee DOJ should not be greater than Current date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(7587322883356527985)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116726553772651787)
,p_validation_name=>'email'
,p_static_id=>'email'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_MAIL_ID IS NULL THEN',
'  RETURN ''Email must be enter.'';',
'END IF;',
'',
'',
'IF :P16_MAIL_ID IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_email_id,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_bu         = :GLOBAL_bu ',
'           AND (emp_emp_id     <> :P16_EMPLOYEE OR :P16_EMPLOYEE IS NULL)',
'           AND emp_off_email_id = :P16_MAIL_ID;',
'',
'           cr1			c1%ROWTYPE;',
'    BEGIN',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'            IF c1%FOUND THEN ',
'                return(''Email Id already linked with another Employee.'');',
'            END IF;',
'        CLOSE c1;',
'    END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(7583134032568716409)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116727409344651787)
,p_validation_name=>'Employee name'
,p_static_id=>'employee-name'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P16_NAME is null then',
'    return(''Employee Name must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(8050230851983063580)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116725736017651785)
,p_validation_name=>'P16_EMPLOYEE'
,p_static_id=>'p16-employee'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'       IS',
'   SELECT *',
'     FROM emp_profile_control',
'    WHERE epc_bu = :GLOBAL_bu;',
'',
'      cr1				c1%ROWTYPE;',
'   ',
'BEGIN',
'   ',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'   ',
'      IF c1%NOTFOUND THEN',
'      	 RETURN(''Employee Portfolio Control not defined.'');',
'   	  ELSE',
'      	 IF cr1.epc_emp_code_mode = ''M'' AND  :P16_EMPLOYEE IS NULL THEN',
'           RETURN(''Employee ID should not be null.'');',
'      	 END IF;',
'      END IF;',
'   ',
'   CLOSE c1;',
'  ',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(8050230690420063579)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116726171658651785)
,p_validation_name=>'PHONE NO'
,p_static_id=>'phone-no'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_PHONE_NO IS NULL THEN',
'  RETURN ''Mobile  No. must be enter.'';',
'END IF;',
'',
'IF LENGTH(:P16_PHONE_NO) <> 10 THEN',
'   RETURN(''Enter the valid Mobile  No.'');',
'END IF;',
'',
'IF :P16_PHONE_NO IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_mobile_no,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_bu         = :GLOBAL_bu ',
'           AND (emp_emp_id     <> :P16_EMPLOYEE OR :P16_EMPLOYEE IS NULL)',
'           AND emp_off_mobile_no = :P16_PHONE_NO;',
'',
'           cr1			c1%ROWTYPE;',
'    BEGIN',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'            IF c1%FOUND THEN ',
'                return(''Mobile Number already linked with another Employee.'');',
'            END IF;',
'        CLOSE c1;',
'    END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116722105546651776)
,p_associated_item=>wwv_flow_imp.id(7583133835610716407)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116729699618651795)
,p_name=>'Close1'
,p_static_id=>'close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116721732475651773)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116730148925651796)
,p_event_id=>wwv_flow_imp.id(7116729699618651795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116728852235651792)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check_Validations'
,p_static_id=>'check-validations'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'       IS',
'   SELECT *',
'     FROM emp_profile_control',
'    WHERE epc_bu = :GLOBAL_bu;',
'',
'      cr1				c1%ROWTYPE;',
'   ',
'BEGIN',
'   ',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'   ',
'      IF c1%NOTFOUND THEN',
'      	 raise_application_error(-20010,''Employee Portfolio Control not defined.'');',
'   	  ELSE',
'      	 IF cr1.epc_emp_code_mode = ''M'' AND  :P16_EMPLOYEE IS NULL THEN',
'           raise_application_error(-20010,''Employee ID should not be null.'');',
'      	 END IF;',
'      END IF;',
'   ',
'   CLOSE c1;',
'  ',
'END;',
' ',
'DECLARE',
'	',
'   CURSOR c1',
'       IS',
'   SELECT *',
'     FROM emp_profile_control',
'    WHERE epc_bu = :GLOBAL_bu;',
' ',
'      cr1					c1%ROWTYPE;',
' ',
'BEGIN',
'   ',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'  ',
'         IF cr1.epc_emp_code_mode = ''A'' THEN',
'                     ',
'               IF :P16_EMPLOYEE IS NULL THEN  ',
'                  :P16_EMPLOYEE := cr1.epc_emp_next_id;',
'               END IF; ',
'',
'                 UPDATE emp_profile_control',
'                  SET epc_emp_next_id = func_find_next_id(cr1.epc_emp_next_id),',
'                      epc_upd_by	    = :GLOBAL_user,',
'                      epc_upd_date	  = SYSDATE',
'                WHERE epc_bu = :GLOBAL_bu; ',
'         END IF;',
'       ',
'   CLOSE c1;',
'   ',
'END;                 	 ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116722105546651776)
,p_internal_uid=>1634767016692040764
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116729268310651793)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Employee ID'
,p_static_id=>'employee-id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   IF ((func_find_emp_code_mode(:GLOBAL_BU,''E'') <> ''M'' OR func_find_emp_code_mode(:GLOBAL_BU,''E'') IS NULL)) THEN',
'      ',
'      SELECT epc_emp_next_id ',
'        INTO :P16_EMPLOYEE',
'        FROM emp_profile_control',
'       WHERE epc_bu = :Global_bu;',
'   ',
'   END IF;',
'',
'EXCEPTION   ',
'   WHEN NO_DATA_FOUND THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1634767432767040765
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116728456063651788)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from create employee'
,p_static_id=>'process-from-create-employee'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P16_EMPLOYEE IS NOT NULL THEN',
'   proc_cre_quick_employee(:GLOBAL_BU,:P16_EMPLOYEE,:P16_NAME,:P16_DESIGNATION,:P16_DEPARTMENT,:P16_PHONE_NO,:P16_MAIL_ID,:P16_START_DATE,:GLOBAL_USER);',
'   COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116722105546651776)
,p_process_success_message=>'Employee Created Successfully.'
,p_internal_uid=>1634766620520040760
);
wwv_flow_imp.component_end;
end;
/
