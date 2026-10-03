prompt --application/pages/page_1113008001
begin
--   Manifest
--     PAGE: 1113008001
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
 p_id=>1113008001
,p_name=>'Edit Error Message'
,p_alias=>'EDIT-ERROR-MESSAGE'
,p_page_mode=>'MODAL'
,p_step_title=>'Error Message'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6034230247395332677)
,p_plug_name=>'Add Error Message'
,p_static_id=>'add-error-message'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1113008001_BTN_TYPE'
,p_plug_display_when_cond2=>'A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6034228833770332662)
,p_plug_name=>'Error Message'
,p_static_id=>'error-message'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1113008001_BTN_TYPE'
,p_plug_display_when_cond2=>'E'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6034230082892332675)
,p_plug_name=>'Region Items'
,p_static_id=>'region-items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6223583702801989533)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6034230247395332677)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6034229244394332667)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6034228833770332662)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6227764981965488450)
,p_branch_name=>'gotohomepage'
,p_branch_action=>'f?p=&APP_ID.:11130080:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6223583702801989533)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6227765064679488451)
,p_branch_name=>'gotohomepage'
,p_branch_action=>'f?p=&APP_ID.:11130080:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6034229244394332667)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034230390176332678)
,p_name=>'P1113008001_ADD_GRP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6034230247395332677)
,p_prompt=>'Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6223583450561989531)
,p_name=>'P1113008001_ADD_MSG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6034230247395332677)
,p_prompt=>'Message'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6223583627192989532)
,p_name=>'P1113008001_ADD_PWD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6034230247395332677)
,p_prompt=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6223583238966989529)
,p_name=>'P1113008001_ADD_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6034230247395332677)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034230215181332676)
,p_name=>'P1113008001_BTN_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6034230082892332675)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034228917287332663)
,p_name=>'P1113008001_GROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6034228833770332662)
,p_prompt=>'Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034229097329332665)
,p_name=>'P1113008001_MESSAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6034228833770332662)
,p_prompt=>'Message'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034229185146332666)
,p_name=>'P1113008001_PASSWORD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6034228833770332662)
,p_prompt=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6034228960236332664)
,p_name=>'P1113008001_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6034228833770332662)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6223583774460989534)
,p_validation_name=>'Add Group ID'
,p_static_id=>'add-group-id'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_ADD_GRP IS NULL THEN ',
'RETURN(''Group must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6223583702801989533)
,p_associated_item=>wwv_flow_imp.id(6034230390176332678)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6223584023605989536)
,p_validation_name=>'Add Message'
,p_static_id=>'add-message'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_ADD_MSG IS NULL THEN ',
'RETURN(''Message must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6223583702801989533)
,p_associated_item=>wwv_flow_imp.id(6223583450561989531)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6223584071616989537)
,p_validation_name=>'Add Password'
,p_static_id=>'add-password'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_ADD_PWD IS NULL THEN',
'RETURN(''Password must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6223583702801989533)
,p_associated_item=>wwv_flow_imp.id(6223583627192989532)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6223583862209989535)
,p_validation_name=>'Add Type'
,p_static_id=>'add-type'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_ADD_TYPE IS NULL THEN ',
'RETURN(''Type must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6223583702801989533)
,p_associated_item=>wwv_flow_imp.id(6223583238966989529)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6034229385082332668)
,p_validation_name=>'Group ID'
,p_static_id=>'group-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_GROUP IS NULL THEN',
'RETURN(''Group must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6034229244394332667)
,p_associated_item=>wwv_flow_imp.id(6034228917287332663)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6034229544628332670)
,p_validation_name=>'Message'
,p_static_id=>'message'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_MESSAGE IS NULL THEN',
'RETURN(''Message must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6034229244394332667)
,p_associated_item=>wwv_flow_imp.id(6034229097329332665)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6034229705297332671)
,p_validation_name=>'Password'
,p_static_id=>'password'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_PASSWORD IS NULL THEN',
'RETURN(''Password must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6034229244394332667)
,p_associated_item=>wwv_flow_imp.id(6034229185146332666)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6034229466405332669)
,p_validation_name=>'Type'
,p_static_id=>'type'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113008001_TYPE IS NULL THEN',
'RETURN(''Type must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6034229244394332667)
,p_associated_item=>wwv_flow_imp.id(6034228960236332664)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6223584279156989539)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Add Error Message'
,p_static_id=>'process-for-add-error-message'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	',
'      CURSOR c1',
'          IS',
'      SELECT bfa_password',
'        FROM bus_fun_access;',
'	 ',
'         cr1						c1%ROWTYPE;',
'	 ',
'BEGIN	 ',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'    ',
'         IF c1%NOTFOUND THEN',
'   	        Raise_Application_Error(-20999,''APX''||''Password not defined.'');',
'	       ELSE',
'	    	 ',
'	    	    IF cr1.bfa_password <> func_get_hash(NULL, :P1113008001_ADD_PWD) THEN',
'	    	       Raise_Application_Error(-20999,''APX''||''Invalid password.'');',
'	    	    END IF;',
'	    	 ',
'	       END IF;',
'	       ',
'	    CLOSE c1;',
'	 ',
'END;',
'',
'IF :P1113008001_ADD_GRP IS NOT NULL AND :P1113008001_ADD_TYPE IS NOT NULL THEN',
'	 ',
'   DECLARE',
'	 	  ',
'	 CURSOR c1',
'	 	 IS',
'	 SELECT *',
'	   FROM err_column_groups',
'      WHERE ecg_group_id = :P1113008001_ADD_GRP 	     ',
'        AND ecg_err_type = :P1113008001_ADD_TYPE;',
'	 	     ',
'    cr1				c1%ROWTYPE;',
'	 	  ',
'	 BEGIN',
'	 	  ',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	     ',
'	 	     IF c1%FOUND THEN',
'                  Raise_Application_Error(-20999,''APX''||''Group already exists.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c1;',
'	 	  ',
'	 END;',
'	 	 ',
'END IF;',
'',
'IF :P1113008001_ADD_GRP IS NOT NULL AND :P1113008001_ADD_TYPE IS NOT NULL AND :P1113008001_ADD_MSG IS NOT NULL AND :P1113008001_ADD_PWD IS NOT NULL THEN',
'	 ',
'	 INSERT INTO err_column_groups(ecg_group_id  ,',
'								   ecg_err_type  ,',
'								   ecg_group_msg1,',
'								   ecg_group_msg2,',
'								   ecg_cre_by    ,',
'								   ecg_cre_date  )',
'					VALUES(TRIM(:P1113008001_ADD_GRP),',
'					       TRIM(:P1113008001_ADD_TYPE),',
'					       TRIM(:P1113008001_ADD_MSG),',
'					       TRIM(:P1113008001_ADD_MSG),',
'					       :GLOBAL_user,',
'					       SYSDATE);',
'													       ',
'     COMMIT;',
'	 ',
'     apex_application.g_print_success_message := ''Message added successfully.'';',
'	 --alert_msg(''Message added successfully.'',''N'');',
'																 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6223583702801989533)
,p_internal_uid=>741622443613378511
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6034229871419332673)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Edit Error Message'
,p_static_id=>'process-for-edit-error-message'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c1',
'        IS',
'    SELECT bfa_password',
'      FROM bus_fun_access;',
'	 ',
' cr1		  c1%ROWTYPE;',
'	 ',
'BEGIN',
' OPEN c1;',
' FETCH c1 INTO cr1;',
'    IF c1%NOTFOUND THEN',
'   	    Raise_Application_Error(-20999,''APX''||''Password not defined.'');',
'	       ELSE',
'	    	 ',
'	    	    IF cr1.bfa_password <> func_get_hash(NULL, :P1113008001_PASSWORD) THEN',
'	    	       Raise_Application_Error(-20999,''APX''||''Invalid password.'');',
'	    	    END IF;',
'	    	 ',
'	       END IF;',
'	       ',
'	    CLOSE c1;',
'	 ',
'   END;',
'',
'IF :P1113008001_GROUP IS NOT NULL AND :P1113008001_TYPE IS NOT NULL AND :P1113008001_MESSAGE IS NOT NULL AND :P1113008001_PASSWORD IS NOT NULL THEN',
'	 ',
'	 UPDATE err_column_groups ',
'	    SET ecg_group_id   = :P1113008001_GROUP,',
'	        ecg_err_type   = :P1113008001_TYPE,',
'	        ecg_group_msg1 = :P1113008001_MESSAGE,',
'	        ecg_group_msg2 = :P1113008001_MESSAGE,',
'	        ecg_upd_by     = :GLOBAL_user,',
'	        ecg_upd_date   = SYSDATE',
'	  WHERE ecg_group_id = :P1113008001_GROUP',
'	    AND ecg_err_type = :P1113008001_TYPE;',
'													       ',
'     COMMIT;',
'	   apex_application.g_print_success_message := ''Message updated successfully.'';',
'	 --alert_msg(''Message updated successfully.'',''N'');',
'																 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6034229244394332667)
,p_internal_uid=>552268035875721645
);
wwv_flow_imp.component_end;
end;
/
