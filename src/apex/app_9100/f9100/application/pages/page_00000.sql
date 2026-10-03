prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page - Desktop'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8035881652734526138)
,p_plug_name=>'Alert'
,p_static_id=>'alert'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':GLOBAL_LOGIN_PAGE = ''61'' AND 1=2'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11524504877495636787)
,p_plug_name=>'Find Menu'
,p_static_id=>'find-menu'
,p_region_name=>'SRCH7'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6250244938785402785)
,p_name=>'Title Card'
,p_static_id=>'title-card'
,p_region_name=>'exitpopup'
,p_template=>wwv_flow_imp.id(10650512437694505356)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-dialog-size1000x1000'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-callout:js-dialog-size600x400:t-Form--leftLabels'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_05'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT :global_user firstname,',
'        '' '' lastname,',
'       NULL image,',
'        (:global_bu_desc) email,',
'       :global_amt_desc workspace,',
'       CASE',
'          WHEN :global_user LIKE ''%ERPADMIN'' THEN ''ERPADMIN''',
'          ELSE ''ERPUSER''',
'       END',
'          role,',
'          ''hi'' role1,',
'       APEX_UTIL.prepare_url (''f?p='' || :app_id || '':1:'' || :app_session)',
'          edit_profil',
'  FROM DUAL'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6251298056244912141)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245758514402793)
,p_query_column_id=>8
,p_column_alias=>'EDIT_PROFIL'
,p_column_display_sequence=>70
,p_column_heading=>'Edit Profil'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245362871402789)
,p_query_column_id=>4
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>40
,p_column_heading=>'Email'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245130249402786)
,p_query_column_id=>1
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>10
,p_column_heading=>'<b>Firstname</b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245261694402788)
,p_query_column_id=>3
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>30
,p_column_heading=>'Image'
,p_column_format=>'PCT_GRAPH:::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245155703402787)
,p_query_column_id=>2
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>20
,p_column_heading=>'Lastname'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245557116402791)
,p_query_column_id=>6
,p_column_alias=>'ROLE'
,p_column_display_sequence=>60
,p_column_heading=>'Role'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245688817402792)
,p_query_column_id=>7
,p_column_alias=>'ROLE1'
,p_column_display_sequence=>80
,p_column_heading=>'Role1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250245529980402790)
,p_query_column_id=>5
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>50
,p_column_heading=>'Workspace'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8210367751780907536)
,p_name=>'Title Card 1'
,p_static_id=>'title-card-2'
,p_region_name=>'exitpopup'
,p_template=>wwv_flow_imp.id(10650510175351505351)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_05'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT :global_user firstname,',
'        '' '' lastname,',
'       NULL image,',
'       INITCAP (:global_bu_desc) email,',
'       :global_amt_desc workspace,',
'       CASE',
'          WHEN :global_user LIKE ''%ADMIN'' THEN ''ERPADMIN''',
'          ELSE ''ERPUSER''',
'       END',
'          role,',
'          ''hi'' role1,',
'       (SELECT empai_dept_desc',
'          FROM emp_active_info_view',
'         WHERE empai_bu     = :Global_bu',
'           AND empai_emp_id = :Global_cc_emp_id) department,',
'        (SELECT empai_pos_desc',
'          FROM emp_active_info_view',
'         WHERE empai_bu     = :Global_bu',
'           AND empai_emp_id = :Global_cc_emp_id) designation,           ',
'       APEX_UTIL.prepare_url (''f?p='' || :app_id || '':1:'' || :app_session)',
'          edit_profil',
'  FROM DUAL'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6251298056244912141)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368686789907545)
,p_query_column_id=>8
,p_column_alias=>'DEPARTMENT'
,p_column_display_sequence=>100
,p_column_heading=>'Department'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368751986907546)
,p_query_column_id=>9
,p_column_alias=>'DESIGNATION'
,p_column_display_sequence=>110
,p_column_heading=>'Designation'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368496740907543)
,p_query_column_id=>10
,p_column_alias=>'EDIT_PROFIL'
,p_column_display_sequence=>70
,p_column_heading=>'Edit Profil'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368169707907540)
,p_query_column_id=>4
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>40
,p_column_heading=>'Email'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210367926433907537)
,p_query_column_id=>1
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>10
,p_column_heading=>'<b>Firstname</b>'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368087839907539)
,p_query_column_id=>3
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>30
,p_column_heading=>'Image'
,p_column_format=>'PCT_GRAPH:::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210367960673907538)
,p_query_column_id=>2
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>20
,p_column_heading=>'Lastname'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368409432907542)
,p_query_column_id=>6
,p_column_alias=>'ROLE'
,p_column_display_sequence=>60
,p_column_heading=>'Role'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368583459907544)
,p_query_column_id=>7
,p_column_alias=>'ROLE1'
,p_column_display_sequence=>80
,p_column_heading=>'Role1'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8210368251028907541)
,p_query_column_id=>5
,p_column_alias=>'WORKSPACE'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6253947544836371798)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6250244938785402785)
,p_button_name=>'Amount_Mask'
,p_static_id=>'amount-mask'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'&GLOBAL_AMT_DESC.'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:902220501021:&SESSION.::&DEBUG.:RP,::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check-circle-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6253947336013371796)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6250244938785402785)
,p_button_name=>'CONTROL'
,p_static_id=>'control'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Control'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:18701:&SESSION.::&DEBUG.:RP,::'
,p_button_condition=>':GLOBAL_USER LIKE ''%ERPADMIN'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-gear'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6253947469326371797)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6250244938785402785)
,p_button_name=>'down'
,p_static_id=>'down'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Download Manual '
,p_button_position=>'EDIT'
,p_button_condition=>':GLOBAL_USER LIKE ''%ERPADMIN'' and 1=2'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7609337369257329129)
,p_name=>'P0_MSG_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11524504877495636787)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11524505274262636789)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11524504877495636787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_placeholder=>'Search Bus. Fun.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_named_lov=>'SEARCH'
,p_cSize=>150
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7014919865644989891)
,p_name=>'P0_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11524504877495636787)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11638730188094098104)
,p_name=>'Alerts'
,p_static_id=>'alerts'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11638730232123098105)
,p_event_id=>wwv_flow_imp.id(11638730188094098104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-apex-notification'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    "refresh": 1,',
    '    "mainIcon": "fa-bell",',
    '    "mainIconColor": "white",',
    '    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
    '    "mainIconBlinking": false,',
    '    "counterBackgroundColor": "rgb(232, 55, 55 )",',
    '    "counterFontColor": "white",',
    '    "linkTargetBlank": false,',
    '    "showAlways": false,',
    '    "browserNotifications": {',
    '        "enabled": true,',
    '        "cutBodyTextAfter": 100,',
    '        "link": false',
    '    },',
    '    "accept": {',
    '        "color": "#44e55c",',
    '        "icon": "fa-check"',
    '    },',
    '    "decline": {',
    '        "color": "#b73a21",',
    '        "icon": "fa-close"',
    '    },',
    '    "hideOnRefresh": false',
    '}')),
  'attribute_02', 'notification-menu',
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT ''fa-info-circle'' note_icon,',
    '       ''#3e6ebc'' note_icon_color,',
    '       (SELECT intmse_subject',
    '          FROM internal_message',
    '         WHERE intmse_bu     = imsrcvr_bu',
    '           AND intmse_msg_id = imsrcvr_msg_id) note_header,',
    '       (SELECT intmse_message',
    '          FROM internal_message',
    '         WHERE intmse_bu     = imsrcvr_bu',
    '           AND intmse_msg_id = imsrcvr_msg_id) note_text,',
    '       ''javascript:alert("Click on Notification Entry");void(0);'' note_link,',
    '       ''#3e6ebc'' note_color,',
    '       ''javascript:alert("Accepted");void(0);'' note_accept,',
    '       --NULL note_accept,',
    '       ''javascript:$s(P0_MSG_ID,''||imsrcvr_msg_id||'');void(0);''  note_decline,',
    '       --''javascript:alert("Declined");void(0);'' AS note_decline,       ',
    '       /* When enable Browser Notifications in ConfigJSON then you can select which notifications should not be fire browser not. */',
    '       0 AS no_browser_notification,',
    '       imsrcvr_msg_id',
    '  FROM int_msg_receivers',
    ' WHERE imsrcvr_bu        = :GLOBAL_BU',
    '   AND imsrcvr_rcvr_id   = :GLOBAL_USER',
    '   AND imsrcvr_read_flag = ''N''',
    ' ORDER BY imsrcvr_msg_id DESC')),
  'attribute_05', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5889364367732911929)
,p_name=>'Auto Dismiss Success Message'
,p_static_id=>'auto-dismiss-success-message'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5889364489398911930)
,p_event_id=>wwv_flow_imp.id(5889364367732911929)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '   ',
    'apex.jQuery(function() {',
    '',
    '  apex.theme42.util.configAPEXMsgs({',
    '',
    '    autoDismiss: true,',
    '',
    '    duration: 1500',
    '    // duration is optional (Default is 3000 milliseconds)',
    '',
    '  });',
    '',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6253947680410371799)
,p_name=>'Close_Model'
,p_static_id=>'close-model'
,p_event_sequence=>130
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.image_icon7.et'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6253947733143371800)
,p_event_id=>wwv_flow_imp.id(6253947680410371799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'javascript:closeModal("exitpopup");',
    '$(''.image_icon7'').removeClass(''et'');',
    '$(''.image_icon7'').addClass(''st'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6253947872398371801)
,p_name=>'Close_Model_Main'
,p_static_id=>'close-model-main'
,p_event_sequence=>140
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.image_icon7.et'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6253948000312371802)
,p_event_id=>wwv_flow_imp.id(6253947872398371801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'javascript:closeModal("exitpopup1");',
    '$(''.image_icon8'').removeClass(''et'');',
    '$(''.image_icon8'').addClass(''st'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5774025702855863436)
,p_name=>'Dashboard Btn'
,p_static_id=>'dashboard-btn'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5774025744794863437)
,p_event_id=>wwv_flow_imp.id(5774025702855863436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var B1 = $(''#BT1''); // Get the button using its ID',
    'var TGT1 = $(''#Clear''); // Target object where you want to move the button',
    'var B2 = $(''#Clear'');',
    'var TGT2 = $(''.t-Button--hideShow'');',
    '',
    '// Insert the button before the target object',
    'B2.insertBefore(TGT2);',
    'B1.insertBefore(TGT1);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190736366461310135)
,p_name=>'Expand'
,p_static_id=>'expand'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190736515776310136)
,p_event_id=>wwv_flow_imp.id(6190736366461310135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#t_TreeNav").on("treeviewactivatenode", function(e, ui) {',
    '    var n$ = $(e.originalEvent.target).closest(".a-TreeView-content");',
    '    if (ui.nodes.length > 0 && ui.nodes[0].link === "") {',
    '        if (n$.parent().hasClass("is-expandable")) {',
    '            $(this).treeView("expand", n$)',
    '        } else if (n$.parent().hasClass("is-collapsible")) {',
    '            $(this).treeView("collapse", n$)',
    '        }',
    '    }   ',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11668606937481999367)
,p_name=>'Favi'
,p_static_id=>'favi'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11668607058186999368)
,p_event_id=>wwv_flow_imp.id(11668606937481999367)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-apex-notification'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    "refresh": 5,',
    '    "mainIcon": "fa-heart",',
    '    "mainIconColor": "white",',
    '    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
    '    "mainIconBlinking": false,',
    '    "counterBackgroundColor": "transparent",',
    '    "counterBox-shadow": "0 1px 3px rgb(0 0 0 / 0%)",',
    '    "counterFontColor": "transparent",',
    '    "linkTargetBlank": false,',
    '    "showAlways": false,',
    '    "browserNotifications": {',
    '        "enabled": false,',
    '        "cutBodyTextAfter": 100,',
    '        "link": false',
    '    },',
    '    "accept": {',
    '        "color": "#44e55c",',
    '        "icon": "fa-check"',
    '    },',
    '    "decline": {',
    '        "color": "#b73a21",',
    '        "icon": "fa-close"',
    '    },',
    '    "hideOnRefresh": false',
    '}')),
  'attribute_02', 'notification-menu1',
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT ''fa-star'' note_icon,',
    '       ''#3e6ebc'' note_icon_color,',
    '        ubff_bus_fun_id,',
    '        wbf_bus_fun_name note_header,        ',
    '          ( SELECT t.wbf_bus_fun_name',
    '   FROM wapl_bus_fun t',
    '  WHERE t.wbf_bus_fun_id=s.wbf_par_fun_id)  note_text,',
    '    --DECODE(wbf_node_type,''RPT'',DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL('
||'wbf_page_no,1)||'',''||:APP_SESSION),''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP_SESSION'
||') note_link,',
    '       CASE WHEN wbf_appl_no=''401'' THEN ',
    '                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
    '                                   ELSE',
    '                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
    '                                   END note_link,''#3e6ebc'' note_color',
    '  FROM user_bus_fun_favourites_apex,wapl_bus_fun s',
    ' WHERE  wbf_bus_fun_id = ubff_bus_fun_id AND ubff_bu = :global_bu AND ubff_user_id = :global_user',
    ' ORDER BY ubff_cre_date DESC')),
  'attribute_05', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6250244741912402783)
,p_name=>'Open Modal'
,p_static_id=>'open-modal'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.image_icon7.st'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250244847790402784)
,p_event_id=>wwv_flow_imp.id(6250244741912402783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'javascript:openModal("exitpopup");',
    '$(''.image_icon7'').removeClass(''st'');',
    '$(''.image_icon7'').addClass(''et'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6250246016959402795)
,p_name=>'Open Modal Main'
,p_static_id=>'open-modal-main'
,p_event_sequence=>120
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.image_icon8.st'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250246041576402796)
,p_event_id=>wwv_flow_imp.id(6250246016959402795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'javascript:openModal("exitpopup1");',
    '$(''.image_icon8'').removeClass(''st'');',
    '$(''.image_icon8'').addClass(''et'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5816456057013053839)
,p_name=>'P0_SEARCH'
,p_static_id=>'p0-search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5816456248767053841)
,p_event_id=>wwv_flow_imp.id(5816456057013053839)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Global_item'
,p_static_id=>'global-item'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'GLOBAL_SEARCH',
  'items_to_submit', 'P0_SEARCH',
  'language', 'PLSQL',
  'plsql_code', ':GLOBAL_SEARCH :=:P0_SEARCH;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5816456407849053842)
,p_event_id=>wwv_flow_imp.id(5816456057013053839)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Javascript'
,p_static_id=>'javascript'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.page.cancelWarnOnUnsavedChanges();',
    'globalsearch();',
    'apex.page.cancelWarnOnUnsavedChanges();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8200203274130983458)
,p_name=>'P0_SEARCH_1'
,p_static_id=>'p0-search-2'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8200203377977983459)
,p_event_id=>wwv_flow_imp.id(8200203274130983458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Global_item'
,p_static_id=>'global-item'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'GLOBAL_SEARCH',
  'items_to_submit', 'P0_SEARCH',
  'language', 'PLSQL',
  'plsql_code', ':GLOBAL_SEARCH :=:P0_SEARCH;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8200203535436983460)
,p_event_id=>wwv_flow_imp.id(8200203274130983458)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Javascript'
,p_static_id=>'javascript'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.page.cancelWarnOnUnsavedChanges();',
    'globalsearch();',
    'apex.page.cancelWarnOnUnsavedChanges();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6774631910190199552)
,p_name=>'Recent'
,p_static_id=>'recent'
,p_event_sequence=>200
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774632033231199553)
,p_event_id=>wwv_flow_imp.id(6774631910190199552)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-apex-notification'
,p_action=>'PLUGIN_APEX.NOTIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '    "refresh": 5,',
    '    "mainIcon": "fa-star",',
    '    "mainIconColor": "white",',
    '    "mainIconBackgroundColor": "rgba(70,70,70,0.9)",',
    '    "mainIconBlinking": false,',
    '    "counterBackgroundColor": "rgb(232, 55, 55 )",',
    '    "counterFontColor": "white",',
    '    "linkTargetBlank": false,',
    '    "showAlways": false,',
    '    "browserNotifications": {',
    '        "enabled": true,',
    '        "cutBodyTextAfter": 100,',
    '        "link": false',
    '    },',
    '    "accept": {',
    '        "color": "#44e55c",',
    '        "icon": "fa-check"',
    '    },',
    '    "decline": {',
    '        "color": "#b73a21",',
    '        "icon": "fa-close"',
    '    },',
    '    "hideOnRefresh": true',
    '}')),
  'attribute_02', 'notification-menu',
  'attribute_04', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT ''fa-star'' NOTE_ICON,',
    '       application_id,',
    '       application_name NOTE_TEXT,',
    '       PAGE_NAME NOTE_HEADER,',
    '            ''f?p='' || NVL (application_id, ''&APP_ID.'') ',
    '            --|| '':'' || 106',
    '            --|| '':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
    '            --|| :global_user',
    '            --|| '',''',
    '            --|| :global_p',
    '            || '':''',
    '            || NVL (PAGE_ID, 1)',
    '            || '':''',
    '            || :GLOBAL_SESSION',
    '            note_link,',
    '       PAGE_ID,',
    '       page_view_type,',
    '       APEX_SESSION_ID,',
    '       view_dt',
    '  FROM (  SELECT  application_id,',
    '                 application_name,',
    '                 PAGE_NAME,',
    '                 PAGE_ID,',
    '                 page_view_type,',
    '                 APEX_SESSION_ID,',
    '                 MAX (view_date) view_dt',
    '            FROM apex_workspace_activity_log,WAPL_BUS_FUN',
    '           WHERE     APEX_USER = :global_user',
    '                 AND TRUNC (VIEW_DATE) = trunc(sysdate)',
    '                 AND page_view_type = ''Ajax''',
    '                 AND apex_session_id = :GLOBAL_SESSION',
    '                 AND WBF_PAGE_NO = PAGE_ID AND WBF_VISIBLE = ''Y''',
    '               --   AND EXISTS(SELECT 1 FROM WAPL_BUS_FUN',
    '               --               WHERE WBF_PAGE_NO = PAGE_ID)',
    '        GROUP BY application_id,',
    '                 application_name,',
    '                 PAGE_NAME,',
    '                 PAGE_ID,',
    '                 page_view_type,',
    '                 APEX_SESSION_ID',
    '        ORDER BY 7 DESC)',
    ' WHERE ROWNUM <= 5;')),
  'attribute_05', 'Y')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5766975578040949629)
,p_name=>'tree'
,p_static_id=>'tree'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5766975705375949630)
,p_event_id=>wwv_flow_imp.id(5766975578040949629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(document).ready(function() {',
    '    var selectedNode = $(''#t_TreeNav'').data(''apex-tree'').getSelectedNode();',
    '    if (selectedNode) {',
    '        selectedNode.expand();',
    '    }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11638931780815732294)
,p_name=>'Update Messages'
,p_static_id=>'update-messages'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_MSG_ID'
,p_condition_element=>'P0_MSG_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11638931909685732295)
,p_event_id=>wwv_flow_imp.id(11638931780815732294)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P0_MSG_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' UPDATE int_msg_receivers',
    '    SET imsrcvr_read_flag = ''Y''',
    '  WHERE imsrcvr_bu        = :GLOBAL_BU',
    '    AND imsrcvr_rcvr_id   = :GLOBAL_USER',
    '    AND imsrcvr_msg_id    = :P0_MSG_ID',
    '    AND imsrcvr_read_flag = ''N'';',
    '    ',
    'COMMIT;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
