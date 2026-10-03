prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Alerts'
,p_alias=>'ALERTS'
,p_step_title=>'Inbox'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ui-dialog.t-Dialog-page--wizard .ui-dialog-titlebar {',
'    display: none!important;',
'    background-color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11638933202566732308)
,p_name=>'Alerts'
,p_static_id=>'alerts'
,p_region_name=>'alerts'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (',
'SELECT CASE WHEN LENGTH(imsrcvr_subj) > 38 THEN SUBSTR(imsrcvr_subj, 1, 38)||''...'' ELSE imsrcvr_subj END "ALERT_SUBJ", ',
'          imsrcvr_msg "ALERT_MSG", ',
'          imsrcvr_close "ALERT_ICON1",  ',
'          imsrcvr_icon "ALERT_ICON", ',
'          imsrcvr_date,',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) <= 1 THEN',
'             apex_util.get_since(imsrcvr_date)',
'          ELSE',
'             TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'          /*CASE WHEN TRUNC(SYSDATE - imsrcvr_date) <= 1 THEN',
'               CASE WHEN MOD(TRUNC((SYSDATE - imsrcvr_date) * 24), 24) = 0 THEN',
'       				MOD(TRUNC((SYSDATE - imsrcvr_date) * 1440), 60)||'' min ago''',
'       				ELSE',
'       				MOD(TRUNC((SYSDATE - imsrcvr_date) * 24), 24)||'' hour ''||MOD(TRUNC((SYSDATE - imsrcvr_date) * 1440), 60)||'' min ago''',
'       				END',
'       		    ELSE',
'       			   TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'		 	    END "ALERT_DATE",*/',
'          imsrcvr_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID:''||imsrcvr_msg_id) "ALERT_LINK"',
'     FROM (',
'   SELECT (SELECT intmse_subject',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT intmse_message',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          ''<span class="fa fa-times-circle" aria-hidden="true" style="color:tomato"></span>'' imsrcvr_close,',
'          ''<span aria-hidden="true" class="fa fa-info-circle fa-lg" style="color: rgb(62, 110, 188)"></span>'' imsrcvr_icon,',
'          (SELECT intmse_sent_date',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_date,',
'          imsrcvr_msg_id',
'     FROM int_msg_receivers',
'    WHERE imsrcvr_bu        = :GLOBAL_BU',
'      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'      AND imsrcvr_read_flag = ''N'')',
'ORDER BY imsrcvr_date DESC) WHERE ROWNUM <= 10'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>999999999
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084817032006175)
,p_query_column_id=>6
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084704690006174)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084619845006173)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Icon1'
,p_column_link=>'javascript:$s(''P8_MSG_ID'',''#IMSRCVR_MSG_ID#'');'
,p_column_linktext=>'#ALERT_ICON1#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675085448316006182)
,p_query_column_id=>8
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>7
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084461154006172)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Msg'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084421129006171)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>1
,p_column_heading=>'Alert Subj'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11652195700984892865)
,p_query_column_id=>5
,p_column_alias=>'IMSRCVR_DATE'
,p_column_display_sequence=>8
,p_column_heading=>'Imsrcvr Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675084882922006176)
,p_query_column_id=>7
,p_column_alias=>'IMSRCVR_MSG_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Imsrcvr Msg Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11675085009728006177)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11638933202566732308)
,p_button_name=>'BTN_VIEW_ALL'
,p_static_id=>'btn-view-all'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'View All'
,p_button_position=>'TOP_AND_BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11675085115334006178)
,p_name=>'P8_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11638933202566732308)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11675085216187006179)
,p_name=>'Update Alerts'
,p_static_id=>'update-alerts'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_MSG_ID'
,p_condition_element=>'P8_MSG_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11675085237952006180)
,p_event_id=>wwv_flow_imp.id(11675085216187006179)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P8_MSG_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' UPDATE int_msg_receivers',
    '    SET imsrcvr_read_flag = ''Y''',
    '  WHERE imsrcvr_bu        = :GLOBAL_BU',
    '    AND imsrcvr_rcvr_id   = :GLOBAL_USER',
    '    AND imsrcvr_msg_id    = :P8_MSG_ID',
    '    AND imsrcvr_read_flag = ''N'';',
    '    ',
    'COMMIT;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11675085531890006183)
,p_event_id=>wwv_flow_imp.id(11675085216187006179)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11638933202566732308)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
