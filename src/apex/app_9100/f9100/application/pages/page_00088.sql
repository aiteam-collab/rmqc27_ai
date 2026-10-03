prompt --application/pages/page_00088
begin
--   Manifest
--     PAGE: 00088
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
 p_id=>88
,p_name=>'Security Policy'
,p_alias=>'POLICY'
,p_step_title=>'Security Policy'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//slideclose();',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#otp .t-Region-headerItems--title {',
'   padding-left: 175px;',
'   /* background: #003968; */',
'}',
'',
'#pass .t-Region-headerItems--title {',
'   padding-left: 150px;',
'}',
'',
'#PL .t-Region-headerItems--title {',
'   padding-left: 150px;',
'}',
'',
'#UN .t-Region-headerItems--title {',
'   padding-left: 155px;',
'}',
'',
'#UNEW .t-Region-headerItems--title {',
'   padding-left: 80px;',
'}',
'',
'.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: bold !important;',
'    color: rgb(255, 255, 255) !important;',
'    /* background: #003968; */',
'    /* color: #003968 !important; */',
'}',
'/* ',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    padding-top: var(--ut-region-header-padding-y, 8px);',
'    padding-bottom: var(--ut-region-header-padding-y, 8px);',
'    padding-left: var(--ut-region-header-padding-x, 12px);',
'    padding-right: var(--ut-region-header-padding-x, 12px);',
'    display: flex;',
'    align-items: center;',
'    background-color:  #003968;',
'} */',
'',
'',
'.t-Region-header {',
'    border-top-left-radius: var(--ut-region-border-radius, var(--ut-component-border-radius));',
'    border-top-right-radius: var(--ut-region-border-radius, var(--ut-component-border-radius));',
'    border-bottom-width: var(--ut-region-header-border-width, var(--ut-region-border-width, 1px));',
'    border-bottom-style: solid;',
'    border-bottom-color: var(--ut-region-header-border-color, var(--ut-region-border-color, rgba(0, 0, 0, 0.075)));',
'    background-color: #003968 !important;',
'    color: black !important;',
'    font-size: var(--ut-region-header-font-size, 16px);',
'    font-weight: var(--a-base-font-weight-semibold, 500);',
'    line-height: var(--ut-region-header-line-height, 7px);',
'    display: flex ;',
'    align-items: center;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5729961314730086765)
,p_plug_name=>'Dummy'
,p_static_id=>'dummy'
,p_parent_plug_id=>wwv_flow_imp.id(5729959414006086746)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5501945566818237934)
,p_plug_name=>'No. of Sessions'
,p_static_id=>'no-of-sessions'
,p_region_name=>'UNEW'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5729961176888086764)
,p_plug_name=>'Note : -'
,p_static_id=>'note'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><span style="color:tomato;font-size: 11px">Note : * - </b>',
'<span style="font-size:11px"> The password must be alphanumeric, contain at least one capital letter, one number, and one special character.'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6937084002290001339)
,p_plug_name=>'OTP Login'
,p_static_id=>'otp-login'
,p_region_name=>'otp'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6937084227933001341)
,p_plug_name=>'Password Expiry'
,p_static_id=>'password-expiry'
,p_region_name=>'pass'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5729959281396086745)
,p_plug_name=>'Password Length'
,p_static_id=>'password-length'
,p_region_name=>'UNEW'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6935052145436124368)
,p_plug_name=>'Security Policy'
,p_static_id=>'security-policy'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PDA_BU,',
'       PDA_OTP_FLAG,',
'       PDA_OTP_SOURCE,',
'       PDA_PW_EXP_RQRD,',
'       PDA_PW_EXP_DAYS,',
'       PDA_PW_EXP_DATE,',
'       PDA_CRE_BY,',
'       PDA_CRE_IP_ADDR,',
'       PDA_CRE_OS_USER,',
'       PDA_CRE_EMP_ID,',
'       PDA_CRE_DATE,',
'       PDA_UPD_BY,',
'       PDA_UPD_IP_ADDR,',
'       PDA_UPD_OS_USER,',
'       PDA_UPD_EMP_ID,',
'       PDA_UPD_DATE,',
'       PDA_PW_FREQ,',
'       PDA_USER_ID_MAX,',
'       PDA_USER_ID_MIN,',
'       PDA_USER_PASS_MAX,',
'       PDA_USER_PASS_MIN,',
'       PDA_OTP_EXP_TIME,',
'       PDA_NO_SESSION,',
'       PDA_LOGIN_ATTEMPT,',
'       PDA_IDLE_TIME',
'  from POLICY_DATA',
' where PDA_BU = :GLOBAL_BU'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828761506142222234)
,p_plug_name=>'Security Policy Update'
,p_static_id=>'security-policy-update'
,p_region_css_classes=>'js-dialog-size300x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5729959414006086746)
,p_plug_name=>'User Name Length'
,p_static_id=>'user-name-length'
,p_region_name=>'UNEW'
,p_parent_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5823629717419638571)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:2902:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6937084334880001342)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P88_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828761429701222233)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_button_name=>'SECURITY_POLICY_UPD'
,p_static_id=>'security-policy-upd'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6937084677715001346)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P88_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828761640231222235)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3828761506142222234)
,p_button_name=>'Update_add'
,p_static_id=>'update-add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828761765151222236)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(3828761506142222234)
,p_button_name=>'View_Update'
,p_static_id=>'view-update'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Update'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:223:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3828764157875222260)
,p_branch_name=>'Go To Page 224'
,p_branch_action=>'f?p=&APP_ID.:224:&SESSION.::&DEBUG.::P224_ROWID:&P88_UPD_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(3828761640231222235)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935052428582124370)
,p_name=>'P88_PDA_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PDA_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935053016119124376)
,p_name=>'P88_PDA_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083111576001330)
,p_name=>'P88_PDA_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937082943437001329)
,p_name=>'P88_PDA_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935053089659124377)
,p_name=>'P88_PDA_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935053235456124378)
,p_name=>'P88_PDA_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5572939990354743457)
,p_name=>'P88_PDA_IDLE_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5501945566818237934)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Idle Time'
,p_placeholder=>'Minutes'
,p_source=>'PDA_IDLE_TIME'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5593126396807045129)
,p_name=>'P88_PDA_LOGIN_ATTEMPT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6937084227933001341)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'3'
,p_prompt=>'Login Attempt'
,p_source=>'PDA_LOGIN_ATTEMPT'
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
 p_id=>wwv_flow_imp.id(5501945707932237935)
,p_name=>'P88_PDA_NO_SESSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5501945566818237934)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'5'
,p_prompt=>'Session'
,p_source=>'PDA_NO_SESSION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'style="text-align:right"; readonly=readonly'
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
 p_id=>wwv_flow_imp.id(5768665092109741029)
,p_name=>'P88_PDA_OTP_EXP_TIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6937084002290001339)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'5'
,p_prompt=>'OTP Validation Time'
,p_source=>'PDA_OTP_EXP_TIME'
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
 p_id=>wwv_flow_imp.id(6935052476087124371)
,p_name=>'P88_PDA_OTP_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6937084002290001339)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'N'
,p_prompt=>'Required'
,p_source=>'PDA_OTP_FLAG'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935052573391124372)
,p_name=>'P88_PDA_OTP_SOURCE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6937084002290001339)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'B'
,p_prompt=>'Source'
,p_source=>'PDA_OTP_SOURCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Email;M,SMS;S,Both;B'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935052919698124375)
,p_name=>'P88_PDA_PW_EXP_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_PW_EXP_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935052754576124374)
,p_name=>'P88_PDA_PW_EXP_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6937084227933001341)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Duration Days'
,p_source=>'PDA_PW_EXP_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="text-align:right";'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6935052668857124373)
,p_name=>'P88_PDA_PW_EXP_RQRD'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6937084227933001341)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'N'
,p_prompt=>'Required'
,p_source=>'PDA_PW_EXP_RQRD'
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
 p_id=>wwv_flow_imp.id(6937083690325001336)
,p_name=>'P88_PDA_PW_FREQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6937084227933001341)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_default=>'D'
,p_prompt=>'Frequency'
,p_source=>'PDA_PW_FREQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Days;D,Months;M,Year;Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083150677001331)
,p_name=>'P88_PDA_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083610173001335)
,p_name=>'P88_PDA_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083471004001334)
,p_name=>'P88_PDA_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083247164001332)
,p_name=>'P88_PDA_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083365237001333)
,p_name=>'P88_PDA_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'PDA_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5729959504933086747)
,p_name=>'P88_PDA_USER_ID_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5729959414006086746)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Maximum'
,p_source=>'PDA_USER_ID_MAX'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'style="text-align:right"; readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5729959591941086748)
,p_name=>'P88_PDA_USER_ID_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5729959414006086746)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Minimum'
,p_source=>'PDA_USER_ID_MIN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'style="text-align:right"; readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5729959720279086749)
,p_name=>'P88_PDA_USER_PASS_MAX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5729959281396086745)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Maximum'
,p_source=>'PDA_USER_PASS_MAX'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'style="text-align:right"; readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5729959783863086750)
,p_name=>'P88_PDA_USER_PASS_MIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5729959281396086745)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_prompt=>'Minimum'
,p_source=>'PDA_USER_PASS_MIN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'style="text-align:right"; readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5729960482589086757)
,p_name=>'P88_READ_ONLY'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6937083779666001337)
,p_name=>'P88_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_item_source_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3828764066925222259)
,p_name=>'P88_UPD_ROWID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6935052145436124368)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5729960375895086756)
,p_validation_name=>'Maximum Pass'
,p_static_id=>'maximum-pass'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF length(:P88_PDA_USER_PASS_MAX) > 15 THEN',
'   RETURN (''Password Should not exceed 15 characters'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(5729959720279086749)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5729960193925086754)
,p_validation_name=>'Maximum User ID'
,p_static_id=>'maximum-user-id'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P88_PDA_USER_ID_MAX IS NULL THEN',
'   RETURN(''Maximum should not be null.'');',
'END IF;',
'',
'IF :P88_PDA_USER_ID_MAX < 0 THEN',
'   RETURN(''Maximum should not be negative.'');',
'END IF;',
'',
'IF :P88_PDA_USER_ID_MAX IS NOT NULL AND INSTR(:P88_PDA_USER_ID_MAX, ''.'') > 0 THEN',
'   RETURN(''Maximum should not be in decimal.'');',
'END IF;',
'',
'IF length(:P88_PDA_USER_ID_MAX) > 14 THEN',
'   RETURN (''Maximum Should not exceed 14 characters'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(5729959504933086747)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5729960273384086755)
,p_validation_name=>'Minimum Pass'
,p_static_id=>'minimum-pass'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF length(:P88_PDA_USER_PASS_MIN) < 3 THEN',
'   RETURN (''Password must be atleast 3 characters'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(5729959783863086750)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5729960063607086753)
,p_validation_name=>'Minimum User ID'
,p_static_id=>'minimum-user-id'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P88_PDA_USER_ID_MIN IS NULL THEN',
'   RETURN(''Minimum should not be null.'');',
'END IF;',
'',
'IF :P88_PDA_USER_ID_MIN < 0 THEN',
'   RETURN(''Minimum should not be negative.'');',
'END IF;',
'',
'IF :P88_PDA_USER_ID_MIN IS NOT NULL AND INSTR(:P88_PDA_USER_ID_MIN, ''.'') > 0 THEN',
'   RETURN(''Minimum should not be in decimal.'');',
'END IF;',
'',
'IF length(:P88_PDA_USER_ID_MIN) < 3 THEN',
'   RETURN (''Minimum must be atleast 3 characters'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(5729959591941086748)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6937084802467001347)
,p_validation_name=>'P88_PDA_PW_EXP_DAYS'
,p_static_id=>'p88-pda-pw-exp-days'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P88_PDA_PW_EXP_RQRD = ''Y'' THEN',
'',
'IF :P88_PDA_PW_EXP_DAYS IS NULL THEN',
'   RETURN(''Duration days should not be null.'');',
'END IF;',
'IF :P88_PDA_PW_EXP_DAYS < 0 THEN',
'   RETURN(''Duration days should not be negative.'');',
'END IF;',
'IF :P88_PDA_PW_EXP_DAYS IS NOT NULL AND INSTR(:P88_PDA_PW_EXP_DAYS, ''.'') > 0 THEN',
'   RETURN(''Duration days should not be in decimal.'');',
'END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(6935052754576124374)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3828761811722222237)
,p_name=>'open_regean'
,p_static_id=>'open-regean'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3828761429701222233)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3828761876838222238)
,p_event_id=>wwv_flow_imp.id(3828761811722222237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3828761506142222234)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5729961512921086767)
,p_name=>'OTP_FLAG'
,p_static_id=>'otp-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_PDA_OTP_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5729961586027086768)
,p_event_id=>wwv_flow_imp.id(5729961512921086767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P88_PDA_OTP_SOURCE',
  'items_to_submit', 'P88_PDA_OTP_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P88_PDA_OTP_FLAG = ''N'' THEN',
    '   :P88_PDA_OTP_SOURCE := ''B'';',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5729960597660086758)
,p_name=>'Read only'
,p_static_id=>'read-only'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_PDA_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5729960675839086759)
,p_event_id=>wwv_flow_imp.id(5729960597660086758)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P88_PDA_PW_EXP_DAYS,P88_READ_ONLY',
  'items_to_submit', 'P88_PDA_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P88_PDA_PW_EXP_RQRD IN (''N'') THEN',
    '   :P88_PDA_PW_EXP_DAYS := 0;',
    '   :P88_READ_ONLY       := ''READONLY = READONLY'';',
    'ELSE',
    '   :P88_READ_ONLY       := NULL;',
    '   :P88_PDA_PW_EXP_DAYS := 30;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5729960878905086761)
,p_name=>'Required'
,p_static_id=>'required'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P88_PDA_PW_EXP_RQRD'
,p_condition_element=>'P88_PDA_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5729961077192086763)
,p_event_id=>wwv_flow_imp.id(5729960878905086761)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P88_PDA_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5729960977255086762)
,p_event_id=>wwv_flow_imp.id(5729960878905086761)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P88_PDA_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6935052261714124369)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(6935052145436124368)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Policy'
,p_static_id=>'initialize-form-policy'
,p_internal_uid=>1453090426170513341
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729960759899086760)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POST QUREY'
,p_static_id=>'post-qurey'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P88_PDA_PW_EXP_RQRD IN (''N'') THEN',
'   :P88_PDA_PW_EXP_DAYS := 0;',
'   :P88_READ_ONLY       := ''READONLY = READONLY'';',
'ELSE',
'   :P88_READ_ONLY       := NULL;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247998924355475732
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6937084470809001344)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P88_ROWID IS NULL THEN',
'   :P88_PDA_CRE_BY      := :GLOBAL_USER;',
'   :P88_PDA_CRE_IP_ADDR := :GLOBAL_IP;',
'   :P88_PDA_CRE_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P88_PDA_CRE_DATE    := SYSDATE;',
'ELSE',
'   :P88_PDA_UPD_BY      := :GLOBAL_USER;',
'   :P88_PDA_UPD_IP_ADDR := :GLOBAL_IP;',
'   :P88_PDA_UPD_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P88_PDA_UPD_DATE    := SYSDATE;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1455122635265390316
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3828763774132222257)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for  Security Policy Update'
,p_static_id=>'process-for-security-policy-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'	CURSOR c1',
'		IS',
'    SELECT * ',
'      FROM policy_data_upd',
'     WHERE pdu_bu = :GLOBAL_BU',
'       AND pdu_status IN (''E'');',
'',
'	CURSOR c2',
'		IS',
'    SELECT ROWID',
'      FROM policy_data_upd',
'     WHERE pdu_bu = :GLOBAL_BU',
'       AND pdu_status = ''N'';',
'',
'	cr1                 c1%ROWTYPE;',
'	cr2                 c2%ROWTYPE;',
'	v_out           	VARCHAR2(15);',
'	v_rowid				VARCHAR2(50);',
'',
'BEGIN',
'',
'	OPEN c1;',
'    FETCH c1 INTO cr1;',
'',
'		IF c1%FOUND THEN',
'		   RAISE_APPLICATION_ERROR(-20999,''Security Policy update failed. The document is in "Entry Completed" status, so it cannot be updated.'');',
'		ELSE',
'		   	OPEN c2;',
'			FETCH c2 INTO cr2;',
'',
'				IF c2%FOUND THEN',
'					:P88_UPD_ROWID := cr2.ROWID;',
'				ELSE',
'',
'                    proc_upd_security_policy(:GLOBAL_BU,:GLOBAL_USER,v_out);',
'',
'					SELECT ROWID',
'					  INTO :P88_UPD_ROWID',
'					  FROM policy_data_upd',
'					 WHERE pdu_bu     = :GLOBAL_BU',
'					   AND pdu_status = ''N''',
'					   AND pdu_doc_no = v_out;',
'   ',
'				END IF;',
'	',
'			CLOSE c2;',
'		END IF;',
'	',
'	CLOSE c1;',
'  ',
'EXCEPTION WHEN NO_DATA_FOUND THEN   ',
'    :P88_UPD_ROWID := NULL;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(3828761640231222235)
,p_internal_uid=>3756660001804034927
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6937084580643001345)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6935052145436124368)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Policy'
,p_static_id=>'process-form-policy'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1455122745099390317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6937083896458001338)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rowid_process'
,p_static_id=>'rowid-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   SELECT rowid',
'     INTO :P88_ROWID',
'     FROM policy_data',
'    WHERE pda_bu = :Global_bu;',
'',
'EXCEPTION',
'   WHEN NO_DATA_FOUND THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1455122060914390310
);
wwv_flow_imp.component_end;
end;
/
