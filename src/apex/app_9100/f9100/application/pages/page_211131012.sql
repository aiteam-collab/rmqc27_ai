prompt --application/pages/page_211131012
begin
--   Manifest
--     PAGE: 211131012
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
 p_id=>211131012
,p_name=>'Password'
,p_alias=>'PASSWORD'
,p_page_mode=>'MODAL'
,p_step_title=>'Password'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region--accent4>.t-Region-header {',
'    --ut-region-header-background-color: #723caf4a;',
'    --ut-region-header-text-color: var(--u-color-4-contrast);',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'200'
,p_dialog_width=>'500'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9610659930520149923)
,p_plug_name=>'Password'
,p_static_id=>'password'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562393276223034284)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9610659930520149923)
,p_button_name=>'Exit_Form'
,p_static_id=>'exit-form'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Exit Form'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7562392920745034284)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9610659930520149923)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7562395348912034287)
,p_branch_name=>'Go To Page 211131012'
,p_branch_action=>'f?p=&APP_ID.:211131010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7562393276223034284)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7562395751276034288)
,p_branch_name=>'Go To Page 211131011'
,p_branch_action=>'f?p=&APP_ID.:211131011:&SESSION.::&DEBUG.::P211131011_ROWID:&P211131012_ROW_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7562392920745034284)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562393711774034284)
,p_name=>'P211131012_ENTER_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9610659930520149923)
,p_prompt=>'Enter the Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_colspan=>8
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562394069588034285)
,p_name=>'P211131012_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9610659930520149923)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7562394510247034285)
,p_name=>'P211131012_ROW_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9610659930520149923)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7562394929603034287)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ok_button'
,p_static_id=>'ok-button'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	',
'	CURSOR C1',
'	   IS',
'	 SELECT 1',
'    FROM bus_fun_access',
'   WHERE bfa_password = func_get_hash(:P211131012_ENTER_PASSWORD,:P211131012_ENTER_PASSWORD);',
'	 ',
'	 CR1 C1%ROWTYPE;',
'	',
'	',
'BEGIN',
'	',
'	OPEN C1;',
'	FETCH C1 INTO CR1;',
'	',
'	IF C1%FOUND THEN ',
'		:P211131012_PAGE_ID := ''211131010'';',
'	ELSE',
'		 ',
'		 raise_application_error(-20999,''Incorrect Password'');',
'		',
'  END IF;',
'	',
'	CLOSE C1;',
'	',
'	',
'END;',
'',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7562392920745034284)
,p_internal_uid=>2080433094059423259
);
wwv_flow_imp.component_end;
end;
/
