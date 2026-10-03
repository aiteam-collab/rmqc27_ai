prompt --application/pages/page_1925190003
begin
--   Manifest
--     PAGE: 1925190003
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
 p_id=>1925190003
,p_name=>'Entity Creation'
,p_alias=>'ENTITY-CREATION'
,p_step_title=>'Entity Creation'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6937313010570326063)
,p_plug_name=>'Entity Block'
,p_static_id=>'entity-block'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6937312862647326062)
,p_plug_name=>'Password'
,p_static_id=>'password'
,p_parent_plug_id=>wwv_flow_imp.id(6937312169191326055)
,p_region_template_options=>'#DEFAULT#:t-Region--accent2:t-Region--noBorder:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6937312169191326055)
,p_plug_name=>'Password Block'
,p_static_id=>'password-block'
,p_region_name=>'password'
,p_region_css_classes=>'js-dialog-size500x200'
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
 p_id=>wwv_flow_imp.id(7001488130118493061)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_button_name=>'Ent_ok'
,p_static_id=>'ent-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6937312411792326057)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6937312862647326062)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937313966348326073)
,p_name=>'P1925190003_ADDRESS1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Address Line1'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937314088734326074)
,p_name=>'P1925190003_ADDRESS2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Address Line2'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937314184899326075)
,p_name=>'P1925190003_ADDRESS3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Address Line3'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937314418653326077)
,p_name=>'P1925190003_CITY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'City'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT city_name1,',
'       city_id',
'  FROM cities ',
' WHERE city_bu = ''PRIU''',
'   AND city_state_id IN(SELECT state_id',
'                          FROM states',
'                         WHERE state_cntry_id IN (''ARE'',''IND'',''THA'',''USA'') ',
'                            AND state_bu = ''PRIU'' ) '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
  'title', 'Select the City',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7001484858456493029)
,p_name=>'P1925190003_COUNTRY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Country'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT cntry_name1,',
'       cntry_id',
'  FROM countries',
' WHERE cntry_bu = ''PRIU''',
'   AND cntry_id = :P1925190003_COUNTRY'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7001485845125493039)
,p_name=>'P1925190003_CRT_PASS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6937312862647326062)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_password',
'  FROM wapl_bus_fun',
' WHERE wbf_form_id =''SYS0003'''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937313773649326071)
,p_name=>'P1925190003_EMAIL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Email Id'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(7001486224816493042)
,p_name=>'P1925190003_ENCRPT_PASS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6937312862647326062)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937313064646326064)
,p_name=>'P1925190003_ENTITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Entity'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6937313169453326065)
,p_name=>'P1925190003_ENTITY_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Entity Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6937313643513326070)
,p_name=>'P1925190003_MOBILE_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Mobile No.'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937312248737326056)
,p_name=>'P1925190003_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6937312862647326062)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937314271523326076)
,p_name=>'P1925190003_PINCODE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Pincode'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937314526297326078)
,p_name=>'P1925190003_STATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT state_name1,',
'       state_id',
'  FROM states,',
'       countries',
' WHERE cntry_bu = state_bu',
'   AND cntry_id = state_cntry_id ',
'   AND state_cntry_id IN (''ARE'',''IND'',''THA'',''USA'') ',
'   AND state_bu = ''PRIU'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
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
  'title', 'Select the State',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937313252089326066)
,p_name=>'P1925190003_UNIT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6937313417383326067)
,p_name=>'P1925190003_UNIT_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Unit Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6937313565338326069)
,p_name=>'P1925190003_UPASSWORD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937313460377326068)
,p_name=>'P1925190003_USERNAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6937313010570326063)
,p_prompt=>'Username'
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
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001487093699493051)
,p_validation_name=>'P1925190003_EMAIL'
,p_static_id=>'p1925190003-email'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_EMAIL IS NULL THEN',
'	return(''Email Id must be entered.'');',
'END IF;',
'',
'IF :P1925190003_EMAIL IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_email_id,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_off_email_id = :P1925190003_EMAIL;',
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
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313773649326071)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001486615696493046)
,p_validation_name=>'P1925190003_ENTITY'
,p_static_id=>'p1925190003-entity'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_ENTITY IS NULL THEN',
'	return(''Enity must be entered.'');',
'END IF;	',
'',
'IF :P1925190003_ENTITY IS NOT NULL THEN',
'	',
'	DECLARE',
'		CURSOR c1',
'		    IS',
'		SELECT *',
'		  FROM business_units',
'		 WHERE bu_id = :P1925190003_ENTITY;',
'		 ',
'		 cr1						c1%ROWTYPE;',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'			IF c1%FOUND THEN',
'				 return(''Entity already exists.'');',
'			END IF;',
'		CLOSE c1;',
'	END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313064646326064)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001486648035493047)
,p_validation_name=>'P1925190003_ENTITY_NAME'
,p_static_id=>'p1925190003-entity-name'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_ENTITY_NAME IS NULL THEN',
'	return(''Enity Name must be entered.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313169453326065)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001486963249493050)
,p_validation_name=>'P1925190003_MOBILE_NO'
,p_static_id=>'p1925190003-mobile-no'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_MOBILE_NO IS NULL THEN',
'   return(''Mobile No. must be entered.'');',
'END IF;',
'',
'IF :P1925190003_MOBILE_NO IS NOT NULL AND LENGTH(:P1925190003_MOBILE_NO) <> 10 THEN',
'	return(''Enter a valid Mobile No.'');',
'END IF;	',
'',
'IF :P1925190003_MOBILE_NO IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_mobile_no,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_off_mobile_no = :P1925190003_MOBILE_NO;',
'',
'           cr1			c1%ROWTYPE;',
'    BEGIN',
'    		IF LENGTH(:P1925190003_MOBILE_NO) <> 10 THEN',
'    			return(''Enter a valid Mobile No.'');',
'    		END IF;',
'    		',
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
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313643513326070)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001486739540493048)
,p_validation_name=>'P1925190003_UNIT'
,p_static_id=>'p1925190003-unit'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_UNIT IS NULL THEN',
'	return(''Unit must be entered.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313252089326066)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7001486880817493049)
,p_validation_name=>'P1925190003_UNIT_NAME'
,p_static_id=>'p1925190003-unit-name'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1925190003_UNIT_NAME IS NULL THEN',
'	return(''Unit Name must be entered.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7001488130118493061)
,p_associated_item=>wwv_flow_imp.id(6937313417383326067)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001488811288493068)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6937312169191326055)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'load'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001488838238493069)
,p_event_id=>wwv_flow_imp.id(7001488811288493068)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-alert'
,p_action=>'NATIVE_ALERT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', '1')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001485514416493035)
,p_name=>'Ok'
,p_static_id=>'ok'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6937312411792326057)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001486527032493045)
,p_event_id=>wwv_flow_imp.id(7001485514416493035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1925190003_ENCRPT_PASS',
  'items_to_submit', 'P1925190003_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT func_get_hash(:P1925190003_PASSWORD,:P1925190003_PASSWORD)',
    '  INTO :P1925190003_ENCRPT_PASS',
    '  FROM dual;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001485688672493037)
,p_event_id=>wwv_flow_imp.id(7001485514416493035)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6937312169191326055)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001485821888493038)
,p_event_id=>wwv_flow_imp.id(7001485514416493035)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.message.clearErrors();',
    'var errorFlag= $v(''P1925190003_PASSWORD'');',
    'var crt_pass= $v(''P1925190003_CRT_PASS'');',
    'var encrpt_pass = $v(''P1925190003_ENCRPT_PASS'');',
    '',
    'if(errorFlag == '''') {',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P1925190003_PASSWORD",',
    '        message:    "Password must be entered.",',
    '        unsafe:     false',
    '    }',
    '])',
    'apex.da.cancelEvent.call(this);',
    '}',
    'else if(encrpt_pass != crt_pass) ',
    '{',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P1925190003_PASSWORD",',
    '        message:    "Incorrect Password.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001485571726493036)
,p_event_id=>wwv_flow_imp.id(7001485514416493035)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6937313010570326063)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001489556438493076)
,p_name=>'P1925190003_COUNT'
,p_static_id=>'p1925190003-count'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1925190003_COUNT'
,p_condition_element=>'P1925190003_COUNT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001489830809493078)
,p_event_id=>wwv_flow_imp.id(7001489556438493076)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6937313010570326063)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7002566052353654329)
,p_event_id=>wwv_flow_imp.id(7001489556438493076)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6937312169191326055)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7001487456013493055)
,p_name=>'P1925190003_STATE'
,p_static_id=>'p1925190003-state'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1925190003_STATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7001487622791493056)
,p_event_id=>wwv_flow_imp.id(7001487456013493055)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1925190003_COUNTRY',
  'items_to_submit', 'P1925190003_STATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P1925190003_STATE IS NOT NULL THEN',
    '	DECLARE',
    '			CURSOR c1',
    '			    IS',
    '			SELECT state_name1,',
    '			       state_id,',
    '			       state_cntry_id,',
    '			       cntry_name1',
    '			  FROM states,',
    '			       countries',
    '			 WHERE cntry_bu = state_bu',
    '			   AND cntry_id = state_cntry_id ',
    '			   AND state_cntry_id IN (''ARE'',''IND'',''THA'',''USA'') ',
    '			   AND state_bu = ''PRIU''',
    '			   AND state_id = :P1925190003_STATE;  ',
    '			   ',
    '			   cr1				c1%ROWTYPE;',
    '	BEGIN',
    '		OPEN c1;',
    '		FETCH c1 INTO cr1;',
    '			IF c1%FOUND THEN',
    '				:P1925190003_COUNTRY := cr1.state_cntry_id;',
    '			END IF;',
    '		CLOSE c1;',
    '	END;',
    'END IF;',
    '				')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7001489383851493074)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Entity Creation'
,p_static_id=>'entity-creation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	v_res		NUMBER(5);',
'BEGIN',
'	proc_create_new_entity(:P1925190003_ENTITY,							--p_bu',
'								  :P1925190003_ENTITY_NAME,	 			--p_bu_name     ',
'								  :P1925190003_UNIT,								--p_plnt        ',
'								  :P1925190003_UNIT_NAME,					--p_plnt_name   ',
'								  :P1925190003_USERNAME,						--p_username    ',
'								  :P1925190003_UPASSWORD,						--p_password    ',
'								  :P1925190003_EMAIL,						--p_email_id    ',
'								  :P1925190003_MOBILE_NO,					--p_mobile_no   ',
'							     NVL(:P1925190003_ADDRESS1,''NO:5,REPUBLIC STREET,''),						--p_bu_add1     ',
'								  NVL(:P1925190003_ADDRESS2,''REDDIARPALAYAM''),						--p_bu_add2     ',
'								  NVL(:P1925190003_ADDRESS3,	''PONDICHERRY''),					--p_bu_add3     ',
'								  NULL,																--p_bu_po_box   ',
'								  NVL(:P1925190003_PINCODE,''605010''),						--p_bu_pin      ',
'								  NVL(:P1925190003_CITY,''PDY''),						--p_bu_city     ',
'								  NVL(:P1925190003_STATE,''PY''),					--p_bu_state    ',
'								  NVL(:P1925190003_COUNTRY,''IND''),				--p_bu_country  ',
'								  NVL(:P1925190003_ADDRESS1,''ROADMAP IT SOLUTIONS PVT. LTD.,''),			  	--p_plnt_add1   ',
'								  NVL(:P1925190003_ADDRESS2,''REDDIARPALAYAM''),					--p_plnt_add2   ',
'								  NVL(:P1925190003_ADDRESS3,''PONDICHERRY''),					--p_plnt_add3   ',
'								  NULL,																--p_plnt_po_box ',
'								  NVL(:P1925190003_PINCODE,''605010''),						--p_plnt_pin    ',
'								  NVL(:P1925190003_CITY,''PY''),					--p_plnt_city   ',
'								  NVL(:P1925190003_STATE,''PY''),					--p_plnt_state  ',
'								  NVL(:P1925190003_COUNTRY,''IND''));',
'	',
'	 ',
'	INSERT INTO entity_log(el_entity	,',
'								el_entity_name	,',
'								el_unit_id	,',
'								el_unit_name	,',
'								el_username	,',
'								el_password	,',
'								el_mobile_no	,',
'								el_email_id	,',
'								el_address1	,',
'								el_address2	,',
'								el_address3	,',
'								el_pincode	,',
'								el_city_id	,',
'								el_state_id	,',
'								el_cntry_id	,',
'								el_cre_by	,',
'								el_cre_date	,',
'								el_cre_ip_addr	,',
'								el_cre_os_user	,',
'								el_cre_emp_id	)',
'				     VALUES(:P1925190003_ENTITY		,',
'							 	:P1925190003_ENTITY_NAME	,',
'							 	:P1925190003_UNIT		,',
'							 	:P1925190003_UNIT_NAME	,',
'					 			:P1925190003_USERNAME	,',
'					 			:P1925190003_PASSWORD	,',
'					 			:P1925190003_MOBILE_NO	,',
'					 			:P1925190003_EMAIL	,',
'					 			:P1925190003_ADDRESS1	,',
'					 			:P1925190003_ADDRESS2	,',
'					 			:P1925190003_ADDRESS3	,',
'					 			:P1925190003_PINCODE	,',
'					 			:P1925190003_CITY	,',
'					 			:P1925190003_STATE	,',
'					 			:P1925190003_COUNTRY,',
'					 			:Global_user,',
'					 			SYSDATE,',
'					 			:Global_ip,',
'					 			NULL,',
'					 			:Global_emp_id);',
' ',
'	COMMIT;',
'	',
'	SELECT COUNT(*)',
'	  INTO v_res',
'	  FROM business_units',
'	 WHERE bu_id = 	:P1925190003_ENTITY;',
'	 										 ',
'	IF v_res = 1 THEN',
'		 apex_application.g_print_success_message := ''<span>Entity Created Successfully.</span>'';',
'	ELSE',
'		 apex_application.g_print_success_message :=''<span>Entity Not Created.</span>'';',
'   END IF;',
'',
'   :P1925190003_COUNT := 1;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7001488130118493061)
,p_internal_uid=>1519527548307882046
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7002566285608654331)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'New'
,p_static_id=>'new'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1520604450065043303
);
wwv_flow_imp.component_end;
end;
/
