prompt --application/pages/page_00049
begin
--   Manifest
--     PAGE: 00049
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
 p_id=>49
,p_name=>'Alerts'
,p_step_title=>'Inbox'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.table_all {',
'    border-collapse: collapse;',
'    border-spacing: 75px;',
'    border: 0px solid #fbce4a;',
'    padding: 0px;',
'    /* background-color:#f4f4f4;  */',
'	 background-color: aliceblue;',
'	 color: rgb(17, 17, 17); ',
'	 font-family: Verdana;',
'	 border-left:5px solid var(--dx-g-green-vibrant-60);',
'	 /* height: 50px; */',
'	 /* width: 50%; */',
'	  }',
'.table_all:hover{',
'	background-color:#e1e7e2;',
'',
'}',
'.row {',
'    margin-right: -8px;',
'    margin-left: -8px;',
'    /* background-color: #f4f4f4; */',
'} ',
'.td_all {',
'    border: 0px solid #D5DBDB;',
'    padding: 0px;',
'	 vertical-align: top;',
'}',
'.t-Form-fieldContainer--floatingLabel.apex-item-wrapper--has-icon .apex-item-has-icon {',
'    text-indent: 3.1rem;',
'    border-radius: 300px;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6024816505757292334)
,p_name=>'Alerts'
,p_static_id=>'alerts'
,p_region_name=>'alters'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style="color:#8d3a00;font-size: 15px;">''||ALERT_SUBJ||''</span>'' ALERT_SUBJ,',
'		--  ''<span',
'		--    style="display: inline-block;',
'      --   width: 325px;',
'      --   white-space: nowrap;',
'      --   overflow: hidden !important;',
'      --   text-overflow: ellipsis;">''||ALERT_MSG||''</span>'' ALERT_MSG,',
'		  ''<span style="display: inline-block; width: 564px; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;">''||ALERT_MSG||''</span>'' ALERT_MSG,',
'		',
'			-- ALERT_MSG,',
'			ALERT_ICON1,',
'			ALERT_ICON,',
'			NULL ALERT_MSG1,',
'			''<span style="color:#0703f1;font-size: 11px">''||ALERT_DATE||''</span>'' ALERT_DATE,',
'			ALERT_LINK',
'',
'  FROM (SELECT CASE',
'                  WHEN LENGTH (imsrcvr_subj) > 38',
'                  THEN',
'                     SUBSTR (imsrcvr_subj, 1, 38) || ''...''',
'                  ELSE',
'                     imsrcvr_subj',
'               END',
'					-- ',
'                  "ALERT_SUBJ",',
'               imsrcvr_msg "ALERT_MSG",',
'               NULL ALERT_MSG1,',
'               imsrcvr_close "ALERT_ICON1",',
'               imsrcvr_icon "ALERT_ICON",',
'               imsrcvr_date,',
'               CASE',
'                  WHEN TRUNC (SYSDATE - imsrcvr_date) <= 1',
'                  THEN',
'                     APEX_UTIL.get_since (imsrcvr_date)',
'                  ELSE',
'                     TO_CHAR (imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'               END',
'                  "ALERT_DATE",',
'               /*CASE WHEN TRUNC(SYSDATE - imsrcvr_date) <= 1 THEN',
'                    CASE WHEN MOD(TRUNC((SYSDATE - imsrcvr_date) * 24), 24) = 0 THEN',
'                            MOD(TRUNC((SYSDATE - imsrcvr_date) * 1440), 60)||'' min ago''',
'                            ELSE',
'                            MOD(TRUNC((SYSDATE - imsrcvr_date) * 24), 24)||'' hour ''||MOD(TRUNC((SYSDATE - imsrcvr_date) * 1440), 60)||'' min ago''',
'                            END',
'                        ELSE',
'                           TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'                      END "ALERT_DATE",*/',
'               imsrcvr_msg_id,',
'               APEX_UTIL.prepare_url (',
'                     ''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''',
'                  || ''P11_MSG_ID:''',
'                  || imsrcvr_msg_id)',
'                  "ALERT_LINK"',
'          FROM (SELECT (SELECT intmse_subject',
'                          FROM internal_message',
'                         WHERE intmse_bu = imsrcvr_bu',
'                               AND intmse_msg_id = imsrcvr_msg_id)',
'                          imsrcvr_subj,',
'                       (SELECT intmse_message',
'                          FROM internal_message',
'                         WHERE intmse_bu = imsrcvr_bu',
'                               AND intmse_msg_id = imsrcvr_msg_id)',
'                          imsrcvr_msg,',
'                       ''<span class="fa fa-times-circle" aria-hidden="true" style="color:tomato"></span>''',
'                          imsrcvr_close,',
'                       ''<span aria-hidden="true" class="fa fa-alert" style="color:rgb(49 183 6);font-size: 20px;padding: 0px;"></span>''',
'                          imsrcvr_icon,',
'                       (SELECT intmse_sent_date',
'                          FROM internal_message',
'                         WHERE intmse_bu = imsrcvr_bu',
'                               AND intmse_msg_id = imsrcvr_msg_id)',
'                          imsrcvr_date,',
'                       imsrcvr_msg_id',
'                  FROM int_msg_receivers',
'                WHERE     imsrcvr_bu = :GLOBAL_BU',
'                       AND imsrcvr_rcvr_id = :GLOBAL_USER',
'                       AND imsrcvr_read_flag = ''N''))',
' WHERE (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),',
'               UPPER (NVL (:P49_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'       ',
'',
'ORDER BY imsrcvr_date DESC',
'',
'-- WHERE ROWNUM <= 10'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P49_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>999999999
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No messages matched your search. Try using search option...'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'TOP_AND_BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024817044334292340)
,p_query_column_id=>6
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>60
,p_column_heading=>'Alert Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024816934212292338)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024816816251292337)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>30
,p_column_heading=>'Alert Icon1'
,p_column_link=>'javascript:$s(''P49_MSG_ID'',''#IMSRCVR_MSG_ID#'');'
,p_column_linktext=>'#ALERT_ICON1#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024817300923292342)
,p_query_column_id=>7
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>80
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024820323970292372)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>90
,p_column_heading=>'Alert Msg'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024820488404292374)
,p_query_column_id=>5
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>100
,p_column_heading=>'Alert Msg1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6024816539343292335)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>10
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6024817450267292344)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6024816505757292334)
,p_button_name=>'BTN_VIW_ALL'
,p_static_id=>'btn-viw-all'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'View All'
,p_button_position=>'TOP_AND_BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6024817380520292343)
,p_name=>'P49_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6024816505757292334)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6024817711871292346)
,p_name=>'P49_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6024816505757292334)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-sm fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6024817758143292347)
,p_name=>'SEARCH'
,p_static_id=>'search'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P49_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6024817861484292348)
,p_event_id=>wwv_flow_imp.id(6024817758143292347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6024816505757292334)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
