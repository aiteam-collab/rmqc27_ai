prompt --application/pages/page_00224
begin
--   Manifest
--     PAGE: 00224
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
 p_id=>224
,p_name=>'Security Policy Update'
,p_alias=>'SECURITY-POLICY-UPDATE'
,p_step_title=>'Security Policy Update'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setItemStyle(itemName) {',
'    $("#" + itemName).attr("style", "background: #ffffe0 !important;");',
'    $("#" + itemName+ "_DISPLAY").attr("style", "background: #ffffe0 !important;");',
'    $("#" + itemName+ "_input").attr("style", "background: #ffffe0 !important;");',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P224_PDU_NEW_OTP_FLAG") !== $v("P224_PDU_OLD_OTP_FLAG"))',
'{',
'setItemStyle("P224_PDU_NEW_OTP_FLAG");',
'}',
'',
'if ($v("P224_PDU_NEW_OTP_SOURCE") !== $v("P224_PDU_OLD_OTP_SOURCE"))',
'{',
'setItemStyle("P224_PDU_NEW_OTP_SOURCE");',
'}',
'',
'if ($v("P224_PDU_NEW_PW_EXP_RQRD") !== $v("P224_PDU_OLD_PW_EXP_RQRD"))',
'{',
'setItemStyle("P224_PDU_NEW_PW_EXP_RQRD");',
'}',
'',
'if ($v("P224_PDU_NEW_PW_EXP_DAYS") !== $v("P224_PDU_OLD_PW_EXP_DAYS"))',
'{',
'setItemStyle("P224_PDU_NEW_PW_EXP_DAYS");',
'}',
'',
'if ($v("P224_PDU_NEW_PW_EXP_DATE") !== $v("P224_PDU_OLD_PW_EXP_DATE"))',
'{',
'setItemStyle("P224_PDU_NEW_PW_EXP_DATE");',
'}',
'',
'if ($v("P224_PDU_NEW_PW_FREQ") !== $v("P224_PDU_OLD_PW_FREQ"))',
'{',
'setItemStyle("P224_PDU_NEW_PW_FREQ");',
'}',
'',
'if ($v("P224_PDU_NEW_USER_ID_MAX") !== $v("P224_PDU_OLD_USER_ID_MAX"))',
'{',
'setItemStyle("P224_PDU_NEW_USER_ID_MAX");',
'}',
'',
'if ($v("P224_PDU_NEW_USER_ID_MIN") !== $v("P224_PDU_OLD_USER_ID_MIN"))',
'{',
'setItemStyle("P224_PDU_NEW_USER_ID_MIN");',
'}',
'',
'if ($v("P224_PDU_NEW_USER_PASS_MAX") !== $v("P224_PDU_OLD_USER_PASS_MAX"))',
'{',
'setItemStyle("P224_PDU_NEW_USER_PASS_MAX");',
'}',
'',
'if ($v("P224_PDU_NEW_USER_PASS_MIN") !== $v("P224_PDU_OLD_USER_PASS_MIN"))',
'{',
'setItemStyle("P224_PDU_NEW_USER_PASS_MIN");',
'}',
'',
'if ($v("P224_PDU_NEW_OTP_EXP_TIME") !== $v("P224_PDU_OLD_OTP_EXP_TIME"))',
'{',
'setItemStyle("P224_PDU_NEW_OTP_EXP_TIME");',
'}',
'',
'if ($v("P224_PDU_NEW_NO_SESSION") !== $v("P224_PDU_OLD_NO_SESSION"))',
'{',
'setItemStyle("P224_PDU_NEW_NO_SESSION");',
'}',
'',
'if ($v("P224_PDU_NEW_IDLE_TIME") !== $v("P224_PDU_OLD_IDLE_TIME"))',
'{',
'setItemStyle("P224_PDU_NEW_IDLE_TIME");',
'}',
'',
'if ($v("P224_PDU_NEW_LOGIN_ATTEMPT") !== $v("P224_PDU_OLD_LOGIN_ATTEMPT"))',
'{',
'setItemStyle("P224_PDU_NEW_LOGIN_ATTEMPT");',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828734964766221251)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828763081159222250)
,p_plug_name=>'No. of Sessions New'
,p_static_id=>'no-of-sessions-new'
,p_parent_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762565030222244)
,p_plug_name=>'No. of Sessions Old'
,p_static_id=>'no-of-sessions-old'
,p_parent_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828763221460222251)
,p_plug_name=>'OTP Login New'
,p_static_id=>'otp-login-new'
,p_parent_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762702458222246)
,p_plug_name=>'OTP Login Old'
,p_static_id=>'otp-login-old'
,p_parent_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828763359083222252)
,p_plug_name=>'Password Expiry New'
,p_static_id=>'password-expiry-new'
,p_parent_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762797553222247)
,p_plug_name=>'Password Expiry Old'
,p_static_id=>'password-expiry-old'
,p_parent_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762994773222249)
,p_plug_name=>'Password Length New'
,p_static_id=>'password-length-new'
,p_parent_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762432818222243)
,p_plug_name=>'Password Length Old'
,p_static_id=>'password-length-old'
,p_parent_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762242219222241)
,p_plug_name=>'Remarks'
,p_static_id=>'remarks'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762118178222240)
,p_plug_name=>'Security Policy New'
,p_static_id=>'security-policy-new'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762017059222239)
,p_plug_name=>'Security Policy Old'
,p_static_id=>'security-policy-old'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828701058193221215)
,p_plug_name=>'Security Policy Update'
,p_static_id=>'security-policy-update'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'POLICY_DATA_UPD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762930598222248)
,p_plug_name=>'User Name Length New'
,p_static_id=>'user-name-length-new'
,p_parent_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828762301146222242)
,p_plug_name=>'User Name Length Old'
,p_static_id=>'user-name-length-old'
,p_parent_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'BD'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828763385162222253)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(3828734964766221251)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828737561744221258)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(3828734964766221251)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&nbsp;'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P224_ROWID IS NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828737154005221258)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(3828734964766221251)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&nbsp;'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P224_ROWID IS NOT NULL'
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828714611845221236)
,p_name=>'P224_PDU_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828716224385221237)
,p_name=>'P224_PDU_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828715031258221236)
,p_name=>'P224_PDU_APPR_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_APPR_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828715415893221236)
,p_name=>'P224_PDU_APPR_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_APPR_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828715858690221236)
,p_name=>'P224_PDU_APPR_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_APPR_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828701441851221217)
,p_name=>'P224_PDU_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828716634901221237)
,p_name=>'P224_PDU_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828718250795221239)
,p_name=>'P224_PDU_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828717793542221239)
,p_name=>'P224_PDU_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828717005384221237)
,p_name=>'P224_PDU_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828717424944221237)
,p_name=>'P224_PDU_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828702218241221222)
,p_name=>'P224_PDU_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828701830239221220)
,p_name=>'P224_PDU_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828707402090221230)
,p_name=>'P224_PDU_NEW_IDLE_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(3828763081159222250)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Idle Time'
,p_source=>'PDU_NEW_IDLE_TIME'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828707855887221230)
,p_name=>'P224_PDU_NEW_LOGIN_ATTEMPT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(3828763359083222252)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Login Attempt'
,p_source=>'PDU_NEW_LOGIN_ATTEMPT'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1;1,2;2,3;3'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828707027417221228)
,p_name=>'P224_PDU_NEW_NO_SESSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(3828763081159222250)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Session'
,p_source=>'PDU_NEW_NO_SESSION'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828706599670221228)
,p_name=>'P224_PDU_NEW_OTP_EXP_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(3828763221460222251)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'OTP Validation Time'
,p_source=>'PDU_NEW_OTP_EXP_TIME'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1 Minutes;1,2 Minutes;2,3 Minutes;3,4 Minutes;4,5 Minutes;5'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828702669944221225)
,p_name=>'P224_PDU_NEW_OTP_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3828763221460222251)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Required'
,p_source=>'PDU_NEW_OTP_FLAG'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828703039869221225)
,p_name=>'P224_PDU_NEW_OTP_SOURCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3828763221460222251)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Source'
,p_source=>'PDU_NEW_OTP_SOURCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Email;E,SMS;S,Both;B'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828704203634221226)
,p_name=>'P224_PDU_NEW_PW_EXP_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_NEW_PW_EXP_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828703871330221226)
,p_name=>'P224_PDU_NEW_PW_EXP_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(3828763359083222252)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Duration Days'
,p_source=>'PDU_NEW_PW_EXP_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828703376250221225)
,p_name=>'P224_PDU_NEW_PW_EXP_RQRD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3828763359083222252)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Required'
,p_source=>'PDU_NEW_PW_EXP_RQRD'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828704653571221226)
,p_name=>'P224_PDU_NEW_PW_FREQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(3828762118178222240)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_NEW_PW_FREQ'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828704988968221226)
,p_name=>'P224_PDU_NEW_USER_ID_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3828762930598222248)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Maximum'
,p_source=>'PDU_NEW_USER_ID_MAX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828705424569221226)
,p_name=>'P224_PDU_NEW_USER_ID_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3828762930598222248)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Minimum'
,p_source=>'PDU_NEW_USER_ID_MIN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828705821133221228)
,p_name=>'P224_PDU_NEW_USER_PASS_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3828762994773222249)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Maximum'
,p_source=>'PDU_NEW_USER_PASS_MAX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828706233042221228)
,p_name=>'P224_PDU_NEW_USER_PASS_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3828762994773222249)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Minimum'
,p_source=>'PDU_NEW_USER_PASS_MIN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828713056328221234)
,p_name=>'P224_PDU_OLD_IDLE_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(3828762565030222244)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Idle Time'
,p_source=>'PDU_OLD_IDLE_TIME'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828713444989221234)
,p_name=>'P224_PDU_OLD_LOGIN_ATTEMPT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(3828762797553222247)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Login Attempt'
,p_source=>'PDU_OLD_LOGIN_ATTEMPT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828712617762221234)
,p_name=>'P224_PDU_OLD_NO_SESSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(3828762565030222244)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Session'
,p_source=>'PDU_OLD_NO_SESSION'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828712264594221233)
,p_name=>'P224_PDU_OLD_OTP_EXP_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(3828762702458222246)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'OTP Validation Time'
,p_source=>'PDU_OLD_OTP_EXP_TIME'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1 Minutes;1,2 Minutes;2,3 Minutes;3,4 Minutes;4,5 Minutes;5'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828708238085221230)
,p_name=>'P224_PDU_OLD_OTP_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(3828762702458222246)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Required'
,p_source=>'PDU_OLD_OTP_FLAG'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828708588980221231)
,p_name=>'P224_PDU_OLD_OTP_SOURCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(3828762702458222246)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Source'
,p_source=>'PDU_OLD_OTP_SOURCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Email;E,SMS;S,Both;B'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828709860657221231)
,p_name=>'P224_PDU_OLD_PW_EXP_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_OLD_PW_EXP_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828709438551221231)
,p_name=>'P224_PDU_OLD_PW_EXP_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(3828762797553222247)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Duration Days'
,p_source=>'PDU_OLD_PW_EXP_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828709060900221231)
,p_name=>'P224_PDU_OLD_PW_EXP_RQRD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(3828762797553222247)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Required'
,p_source=>'PDU_OLD_PW_EXP_RQRD'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828710186639221231)
,p_name=>'P224_PDU_OLD_PW_FREQ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(3828762017059222239)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_OLD_PW_FREQ'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828710580563221233)
,p_name=>'P224_PDU_OLD_USER_ID_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3828762301146222242)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Maximum'
,p_source=>'PDU_OLD_USER_ID_MAX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828711020269221233)
,p_name=>'P224_PDU_OLD_USER_ID_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3828762301146222242)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Minimum'
,p_source=>'PDU_OLD_USER_ID_MIN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828711427009221233)
,p_name=>'P224_PDU_OLD_USER_PASS_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3828762432818222243)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Maximum'
,p_source=>'PDU_OLD_USER_PASS_MAX'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828711852547221233)
,p_name=>'P224_PDU_OLD_USER_PASS_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3828762432818222243)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Minimum'
,p_source=>'PDU_OLD_USER_PASS_MIN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(3828714215883221234)
,p_name=>'P224_PDU_REMARKS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(3828762242219222241)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_prompt=>'Remarks'
,p_source=>'PDU_REMARKS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828713853182221234)
,p_name=>'P224_PDU_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828718592401221239)
,p_name=>'P224_PDU_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828720257436221240)
,p_name=>'P224_PDU_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828719852129221240)
,p_name=>'P224_PDU_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828718978209221239)
,p_name=>'P224_PDU_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828719443397221239)
,p_name=>'P224_PDU_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'PDU_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828761293287222232)
,p_name=>'P224_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_item_source_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828763644760222255)
,p_name=>'P224_WF_NO'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(3828701058193221215)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3828737928586221259)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(3828701058193221215)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Security Policy Update'
,p_static_id=>'initialize-form-security-policy-update'
,p_internal_uid=>3756634156258033929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3832223801676231931)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process form Preinsert'
,p_static_id=>'process-form-preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P224_ROWID IS NULL THEN',
'   ',
'   :P224_PDU_CRE_BY     := :GLOBAL_USER;',
'   :P224_PDU_CRE_DATE   := SYSDATE;',
'   :P224_PDU_CRE_EMP_ID := :GLOBAL_EMP_ID;',
'',
'ELSE',
'   ',
'   :P224_PDU_UPD_BY     := :GLOBAL_USER;',
'   :P224_PDU_UPD_DATE   := SYSDATE;',
'   :P224_PDU_UPD_EMP_ID := :GLOBAL_EMP_ID;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3760120029348044601
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3828738277521221259)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(3828701058193221215)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Security Policy Update'
,p_static_id=>'process-form-security-policy-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>3756634505193033929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3828763724008222256)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ROWID'
,p_static_id=>'rowid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P224_ROWID IS NULL THEN',
'BEGIN',
'  SELECT ROWID   ',
'    INTO :P224_ROWID',
'    FROM POLICY_DATA_UPD',
'   WHERE PDU_BU = :GLOBAL_bu',
'     AND PDU_DOC_NO = :P224_PDU_DOC_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN   ',
'  :P224_ROWID := NULL;',
'END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3756659951680034926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3828763534574222254)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P224_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P224_PDU_DOC_NO',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P224_WF_NO;',
'END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3756659762246034924
);
wwv_flow_imp.component_end;
end;
/
