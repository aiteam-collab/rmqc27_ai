prompt --application/pages/page_00033
begin
--   Manifest
--     PAGE: 00033
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
 p_id=>33
,p_name=>'Output'
,p_alias=>'OUTPUT'
,p_page_mode=>'MODAL'
,p_step_title=>'Output'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16127035259201336555)
,p_plug_name=>'Output'
,p_static_id=>'output'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'BOM_OP_LN'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11127928549039431564)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:3000023:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11127929384390431564)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'CREATE'
,p_button_condition=>'P33_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11127929006866431564)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P33_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11127928167753431564)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'CHANGE'
,p_button_condition=>'P33_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11127941930128431573)
,p_branch_name=>'Go To Page 3000023'
,p_branch_action=>'f?p=&APP_ID.:424:&SESSION.::&DEBUG.::P424_ROWID_1:&P3000024_ROWID_1.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127930578922431565)
,p_name=>'P33_BOL_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'BOL_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127933733142431568)
,p_name=>'P33_BOL_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'BOL_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127934213907431568)
,p_name=>'P33_BOL_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'BOL_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127931396689431565)
,p_name=>'P33_BOL_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'BOL_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127933400214431567)
,p_name=>'P33_BOL_OP_QTY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_default=>'0'
,p_prompt=>'Quantity'
,p_source=>'BOL_OP_QTY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127930934274431565)
,p_name=>'P33_BOL_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'BOL_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127932138527431567)
,p_name=>'P33_BOL_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_prompt=>'Item'
,p_source=>'BOL_PROD_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT (prod_desc11||''-''|| prod_id || ''-'' || prod_rev) b, prod_id a',
'    FROM products, prod_plants',
'   WHERE     prod_bu = prodplnt_bu',
'         AND prod_id = prodplnt_prod_id',
'         AND prod_rev = prodplnt_prod_rev',
'         AND prodplnt_status = ''A''',
'         AND prod_status = ''A''',
'         AND prod_stocked = ''Y''',
'         AND prod_bu = :global_bu',
'         AND prodplnt_plnt = :P33_BOL_PLNT',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P33_BOL_PLNT'
,p_ajax_items_to_submit=>'P33_BOL_PLNT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>25
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127932570195431567)
,p_name=>'P33_BOL_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_prompt=>'Rev.'
,p_source=>'BOL_PROD_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127931766481431567)
,p_name=>'P33_BOL_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'BOL_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127934626911431568)
,p_name=>'P33_BOL_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'BOL_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127935021320431568)
,p_name=>'P33_BOL_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'BOL_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127933024250431567)
,p_name=>'P33_PROD_DESC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127929827259431565)
,p_name=>'P33_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_item_source_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11127930160673431565)
,p_name=>'P33_ROWID_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16127035259201336555)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11127939838940431571)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P33_BOL_OP_QTY IS NULL THEN',
'	return(''Quantity should must be entered.'');',
'ELSIF :P33_BOL_OP_QTY < 0 THEN',
'	return(''Quantity should not be negative.'');',
'elsif :P33_BOL_OP_QTY = 0 then',
'	return(''Quantity should be greater than zero.'');',
'	',
'	end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(11127933400214431567)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11127940253586431573)
,p_validation_name=>'prod_null'
,p_static_id=>'prod-null'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P33_BOL_PROD_ID IS NULL THEN',
'	return(''Item must be entered'');',
'elsIF :P33_BOL_PROD_ID IS NOT NULL THEN',
'	',
'	:P33_BOL_PROD_REV := func_find_max_prod_rev(:GLOBAL_bu,:P33_BOL_PROD_ID);',
'	',
'	DECLARE ',
'		CURSOR C1 IS',
'	   Select PROD_ID,',
'            PROD_REV,',
'            PROD_DESC11 ,',
'            prod_ext_desc1',
'      from products , prod_plants ',
'     where prod_bu = PRODPLNT_BU',
'       and prod_id = PRODPLNT_PROD_ID',
'       and prod_rev = PRODPLNT_PROD_REV',
'       and PRODPLNT_STATUS = ''A''',
'       and prod_stocked = ''Y''',
'       and prod_bu = :global_bu',
'       AND prodplnt_plnt = :P33_BOL_PLNT',
'       and PROD_ID = :P33_BOL_PROD_ID',
'       and prod_rev = :P33_bol_PROD_rev;',
'       ',
'       CR1 C1%ROWTYPE;',
'	BEGIN',
'		OPEN C1;',
'		FETCH C1 INTO CR1;',
'		IF C1%NOTFOUND THEN',
'			return(''Item not found'');',
'		ELSE',
'			:P33_PROD_DESC :=cr1.PROD_DESC11;',
'			:P33_BOL_ITEM_EXT_DESC := cr1.prod_ext_desc1;',
'		end if;',
'		close c1;',
'		end;',
'		 end if;',
'			'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(11127932138527431567)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11127941023610431573)
,p_name=>'Item_assign'
,p_static_id=>'item-assign'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_BOL_PROD_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11127941432291431573)
,p_event_id=>wwv_flow_imp.id(11127941023610431573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P33_PROD_DESC,P33_BOL_PROD_REV',
  'items_to_submit', 'P33_BOL_PLNT,P33_BOL_PROD_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT prod_desc11, prod_rev',
    'INTO :P33_PROD_DESC,:P33_BOL_PROD_REV',
    '    FROM products, prod_plants',
    '   WHERE     prod_bu = prodplnt_bu',
    '         AND prod_id = prodplnt_prod_id',
    '         AND prod_rev = prodplnt_prod_rev',
    '         AND prodplnt_status = ''A''',
    '         AND prod_status = ''A''',
    '         AND prod_stocked = ''Y''',
    '         AND prod_bu = :global_bu',
    '         AND prodplnt_plnt = :P33_BOL_PLNT',
    '         AND prod_id = :P33_BOL_PROD_ID;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11127935362193431568)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(16127035259201336555)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Output'
,p_static_id=>'initialize-form-output'
,p_internal_uid=>5645973526649820540
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11127935767334431568)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(16127035259201336555)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Output'
,p_static_id=>'process-form-output'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>5645973931790820540
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11127940593952431573)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Seq_creation'
,p_static_id=>'seq-creation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(BOL_SEQ_NO),0) + 1',
'  INTO :P33_BOL_SEQ_NO',
'  FROM BOM_OP_LN',
' WHERE BOL_BU = :GLOBAL_BU',
' AND BOL_PLNT = :P33_BOL_PLNT',
' AND BOL_DOC_NO = :P33_BOL_DOC_NO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11127929384390431564)
,p_internal_uid=>5645978758408820545
);
wwv_flow_imp.component_end;
end;
/
