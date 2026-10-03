prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Read Message'
,p_alias=>'READ-MESSAGE'
,p_step_title=>'Inbox'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11679419275239002562)
,p_plug_name=>'Inbox'
,p_static_id=>'inbox'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11679419824077002567)
,p_plug_name=>'Unread Inbox'
,p_static_id=>'unread-inbox'
,p_parent_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   ',
'   CURSOR c1',
'       IS',
'   SELECT imsrcvr_subj,',
'          imsrcvr_msg,',
'          imsrcvr_close,',
'          imsrcvr_icon,',
'          imsrcvr_date,',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) <= 1 THEN',
'             TO_CHAR(imsrcvr_date, ''HH:MI AM'')|| '' (''|| apex_util.get_since(imsrcvr_date)||'')''',
'          ELSE',
'             TO_CHAR(imsrcvr_date, ''Dy DD-Mon-YYYY HH:MI AM'')',
'          END imsrcvr_date_since,',
'          imsrcvr_sender,',
'          imsrcvr_to_user,',
'          imsrcvr_cc_user,',
'          imsrcvr_msg_id',
'     FROM (',
'   SELECT (SELECT TRIM(intmse_subject)',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT TRIM(intmse_message)',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          ''<span class="fa fa-times-circle" aria-hidden="true" style="color:tomato"></span>'' imsrcvr_close,',
'          ''<span aria-hidden="true" class="fa fa-info-circle fa-lg" style="color: rgb(62, 110, 188)"></span>'' imsrcvr_icon,',
'          (SELECT intmse_sent_date',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_date,',
'          (SELECT intmse_sender_id',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_sender,    ',
'          (SELECT intmse_to_users',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_to_user,  ',
'          (SELECT intmse_cc_users',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_cc_user,  ',
'          imsrcvr_msg_id',
'     FROM int_msg_receivers',
'    WHERE imsrcvr_bu        = :GLOBAL_BU',
'      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'      AND imsrcvr_msg_id    = :P11_MSG_ID)',
'ORDER BY imsrcvr_date DESC;',
'',
'      cr1                            c1%ROWTYPE;',
'   ',
'   CURSOR c2(c_sender             VARCHAR2)',
'       IS',
'   SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'     FROM employees',
'    WHERE emp_bu = :GLOBAL_BU',
'      AND emp_emp_id IN (SELECT appluser_emp_id',
'                           FROM appl_users',
'                          WHERE appluser_bu = :GLOBAL_BU',
'                            AND appluser_id = c_sender);',
'      ',
'      cr2                            c2%ROWTYPE;',
'',
'      v_html                        CLOB;',
'      v_sender                      VARCHAR2(1000);',
'      v_sent_to                     CLOB;',
'      v_to_user                     CLOB;',
'      v_cc_user                     CLOB;',
'      ',
'BEGIN',
'   ',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'   CLOSE c1;',
'   ',
'   OPEN c2(cr1.imsrcvr_sender);',
'   FETCH c2 INTO cr2;',
'      ',
'      IF c2%FOUND THEN',
'         v_sender := cr2.emp_name;',
'      ELSE',
'         v_sender := cr1.imsrcvr_sender;',
'      END IF;',
'      ',
'   CLOSE c2;',
'   ',
'   FOR i IN (SELECT REGEXP_SUBSTR(cr1.imsrcvr_to_user, ''[^,]+'', 1, LEVEL) to_users FROM dual CONNECT BY REGEXP_SUBSTR(cr1.imsrcvr_to_user, ''[^,]+'', 1, LEVEL) IS NOT NULL)',
'   LOOP',
'',
'      OPEN c2(i.to_users);',
'      FETCH c2 INTO cr2;',
'      ',
'         IF c2%FOUND THEN',
'            v_to_user := v_to_user||'', ''||cr2.emp_name;',
'         ELSE',
'            v_to_user := v_to_user||'', ''||cr1.imsrcvr_sender;',
'         END IF;',
'      ',
'      CLOSE c2;',
'',
'   END LOOP i;',
'   ',
'   v_sent_to := v_to_user;',
'   v_to_user := ''To : ''||LTRIM(v_to_user, '', '');',
'   ',
'   FOR i IN (SELECT REGEXP_SUBSTR(cr1.imsrcvr_cc_user, ''[^,]+'', 1, LEVEL) cc_users FROM dual CONNECT BY REGEXP_SUBSTR(cr1.imsrcvr_cc_user, ''[^,]+'', 1, LEVEL) IS NOT NULL)',
'   LOOP',
'',
'      OPEN c2(i.cc_users);',
'      FETCH c2 INTO cr2;',
'      ',
'         IF c2%FOUND THEN',
'            v_cc_user := v_cc_user||'', ''||cr2.emp_name;',
'         ELSE',
'            v_cc_user := v_cc_user||'', ''||cr1.imsrcvr_sender;',
'         END IF;',
'      ',
'      CLOSE c2;',
'',
'   END LOOP i;',
'   ',
'   v_sent_to := LTRIM(v_sent_to||v_cc_user, '', '');',
'   v_cc_user := ''CC : ''||LTRIM(v_cc_user, '', '');   ',
'   ',
'   v_html := ''<style>',
'              hr.new3 ',
'              {',
'                 border-top: 1px dotted #7F8C8D;',
'              }',
'              ',
'              pre',
'              {',
'                 font-family: Arial;',
'                 font-size: 1.2rem;',
'              }',
'              ',
'              </style>',
'              <body>',
'              <table width="100%" border="0">',
'              <tr>',
'              <td></td>',
'              <td><h3>''||cr1.imsrcvr_subj||''<h3></td>',
'              <td></td>',
'              </tr>',
'              <tr>',
'              <td width="3%">''||cr1.imsrcvr_icon||''</td>',
'              <td><b>''||v_sender||''</b><br><span style="font-size: 10px;',
'                                                        letter-spacing: .3px;',
'                                                        color: #5f6368;',
'                                                        line-height: 10px;',
'                                                        font-weight: 500">''||''To :''||v_sent_to||''</span> <span style="font-size: 10px;',
'                                                        letter-spacing: .3px;',
'                                                        color: #5f6368;',
'                                                        line-height: 10px;',
'                                                        font-weight: 500"',
'                                                        class="fa fa-external-link"></span></td>',
'              <td align="right"><span style="font-size: 11px; color:#2980B9; font-weight: 600">''||cr1.imsrcvr_date_since||''</span></td>',
'              </tr>',
'              <tr>',
'              <td></td>',
'              <td colspan="2"><span style="font-size: 13px; color:#1C2833"><pre style="white-space:pre-wrap">''||cr1.imsrcvr_msg||''</pre></span></td>',
'              </tr>',
'              <tr>',
'              <td></td>',
'              <td colspan="2"><br><hr class="new3"></td>',
'              </tr>',
'              </table>',
'            </body>'';',
'   ',
'   htp.p(v_html);',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11679419682138002566)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_button_name=>'BTN_ARCHIVE'
,p_static_id=>'btn-archive'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Archive'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-archive'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11679419454623002564)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_button_name=>'BTN_BACK'
,p_static_id=>'btn-back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11679419594156002565)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_button_name=>'BTN_DELETE'
,p_static_id=>'btn-delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Delete'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-trash'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11679419391594002563)
,p_name=>'P11_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11684327823622445508)
,p_name=>'P11_MSG_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11679419275239002562)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11679424173343002611)
,p_name=>'Page Update'
,p_static_id=>'page-update'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684323207991445462)
,p_event_id=>wwv_flow_imp.id(11679424173343002611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P11_MSG_TYPE = ''I'' THEN',
    '',
    '   UPDATE int_msg_receivers',
    '      SET imsrcvr_read_flag = ''Y''',
    '    WHERE imsrcvr_bu        = :GLOBAL_BU',
    '      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
    '      AND imsrcvr_msg_id    = :P11_MSG_ID',
    '      AND imsrcvr_read_flag = ''N'';',
    '    ',
    '   COMMIT;',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
