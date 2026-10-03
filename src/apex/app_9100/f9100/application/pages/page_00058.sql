prompt --application/pages/page_00058
begin
--   Manifest
--     PAGE: 00058
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
 p_id=>58
,p_name=>'Internal Alerts'
,p_alias=>'ALERTS1'
,p_step_title=>'Internal Alerts'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.onscroll = function() {myFunction()};',
'',
'var header = document.getElementById("rgn_buttons");',
'var sticky = header.offsetTop;',
'',
'function myFunction() {',
'  if (window.pageYOffset > sticky) {',
'    header.classList.add("sticky");',
'  } else {',
'    header.classList.remove("sticky");',
'  }',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#rgn_buttons',
'{',
'background-attachment: fixed;',
'}',
'',
'.t-Body .t-Tabs--simple .t-Tabs-link {',
'    color: #1c1c1c;',
'    font-weight: 600;',
'    font-size: 1.2rem;',
'    font-family: system-ui;',
'}',
'',
'.t-Tabs--simple .t-Tabs-item.is-active .t-Tabs-link {',
'    box-shadow: 0 -2px 0 #FF5722 inset;',
'    border-top-left-radius: 0px;',
'    border-top-right-radius: 0px;',
'',
'}',
'.table_all {',
'    border-collapse: collapse;',
'    border-spacing: 75px;',
'    border: 0px solid #D5DBDB;',
'    padding: 5px;',
'    font-size: 1.6rem;',
'	 font-weight: 500;',
'}',
'.td_all {',
'    border: 0px solid #D5DBDB;',
'    padding: 5px;',
'	 font-size: 11.5px;',
'	 color: #6157ec;',
'	 /* background-color: #f4f4f4; */',
'	 ',
'}',
'.td_all:hover{',
'	background-color:#e1e7e2;',
'}',
'.row {',
'    margin-right: -8px;',
'    margin-left: -8px;',
'    /* background-color: #f4f4f4; */',
'}',
'.td_all {',
'    border: 0px solid #D5DBDB;',
'    padding: 5px;',
'	 background-color: aliceblue;',
'}',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 1.2rem;',
'    display: flex;',
'    align-items: center;',
'    background-color: lightseagreen;',
'}',
'.t-Region--accent13 > .t-Region-header {',
'    background-color: lightseagreen;',
'    color: #ffffff;',
'}',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background: linear-gradient(43deg, #b78241, #995f24a6);',
'    color: #ffffff;',
'}',
'.t-Body-contentInner {',
'    margin: 0 auto;',
'    max-width: 100%;',
'    background: linear-gradient(to right, #a3a09c4a 0%, rgb(153 140 121 / 10%) 100%);',
'',
'}',
'.t-Region--scrollBody>.t-Region-bodyWrap>.t-Region-body {',
'    overflow: auto;',
'    background: linear-gradient(to right, #8973544a 0%, rgb(153 140 121 / 10%) 100%);',
'}',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 1.2rem;',
'    display: flex;',
'    align-items: center;',
'    background-color: lightseagreen;',
'    color: white;',
'}',
'.t-Region-header {',
'    border-bottom-color: rgba(0, 0, 0, 0.075);',
'    background-color: lightseagreen;',
'}',
'.t-Form-fieldContainer--floatingLabel.apex-item-wrapper--has-icon .apex-item-has-icon {',
'    text-indent: 3.1rem;',
'    border-radius: 300px;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6029794930858755968)
,p_name=>'Archive'
,p_static_id=>'archive'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style="color:#a96a3f;font-size: 14px;">''||ALERT_SUBJ||''</span>'' ALERT_SUBJ,',
'		  ''<span style="display: inline-block; width: 564px; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;">''||ALERT_MSG||''</span>'' ALERT_MSG,',
'			ALERT_ICON,',
'			NULL ALERT_MSG1,',
'			NULL ALERT_ICON1, ',
'			NULL ALERT_ICON2,',
'			''<span style="color:#0703f1;font-size: 11px">''||ALERT_DATE||''</span>'' ALERT_DATE,',
'			ALERT_LINK',
'  FROM (',
'   SELECT CASE WHEN imsrcvr_read_flag = ''N'' THEN ''<B>''||imsrcvr_subj||''</B>  <img src = "#APP_IMAGES#new (4).png" width="20px" height="20px">'' ELSE imsrcvr_subj END "ALERT_SUBJ", ',
'          ''<span style="color:#382828; font-size:11px;">''||imsrcvr_msg||''</span>'' "ALERT_MSG", ',
'			  NULL ALERT_MSG1,',
'			  NULL ALERT_ICON1, ',
'			  NULL ALERT_ICON2,',
'          imsrcvr_icon "ALERT_ICON", ',
'          imsrcvr_date,',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) < 1 THEN',
'             apex_util.get_since(imsrcvr_date)',
'          ELSE',
'             TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'          imsrcvr_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||imsrcvr_msg_id||'',''||''A'') "ALERT_LINK"',
'     FROM (',
'   SELECT (SELECT INITCAP(intmse_subject)',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT intmse_message',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          ''<span class="fa fa-archive" aria-hidden="true" style="color:#873600" title="Archive"></span>'' imsrcvr_archive,',
'          ''<span aria-hidden="true" class="fa fa-alert" style="color:rgb(49 183 6)"></span>'' imsrcvr_icon,',
'         ''<span aria-hidden="true" class="fa fa-trash" style="color:#EC7063" title="Delete"></span>'' imsrcvr_delete,',
'          (SELECT intmse_sent_date',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_date,',
'          imsrcvr_msg_id,',
'         imsrcvr_read_flag',
'     FROM int_msg_receivers',
'    WHERE imsrcvr_bu        = :GLOBAL_BU',
'      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'      AND imsrcvr_arch_flag = ''N''',
'      AND (:P58_ARCH_VIEW = ''A'' OR (imsrcvr_read_flag = ''N'' AND :P58_ARCH_VIEW = ''U''))))',
'		WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P58_ARCHIVE_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'ORDER BY imsrcvr_date DESC'))
,p_display_when_condition=>':P58_TYPE = ''A'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P58_ARCH_VIEW,,P58_ARCHIVE_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11682605297332255734)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No messages matched your search. Try using search option...'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029795627655755975)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>50
,p_column_heading=>'Alert Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029795305590755972)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029976854201811750)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>80
,p_column_heading=>'Alert Icon1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029976997556811751)
,p_query_column_id=>6
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>90
,p_column_heading=>'Alert Icon2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029795782221755977)
,p_query_column_id=>8
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029795098581755970)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>20
,p_column_heading=>'Alert Msg'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029976749022811749)
,p_query_column_id=>4
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>70
,p_column_heading=>'Alert Msg1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029794936808755969)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>10
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6029791915451755938)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_name=>'rgn_buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6029793515417755954)
,p_name=>'Inbox'
,p_static_id=>'inbox'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--accent13:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style="color:#a96a3f;font-size: 14px;">''||ALERT_SUBJ||''</span>'' ALERT_SUBJ,',
'		  ''<span style="display: inline-block; width: 564px; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;">''||ALERT_MSG||''</span>'' ALERT_MSG,',
'			ALERT_ICON1,',
'			ALERT_ICON2,',
'			ALERT_ICON,',
'			NULL ALERT_MSG1,',
'			''<span style="color:#0703f1;font-size: 11px">''||ALERT_DATE||''</span>'' ALERT_DATE,',
'			ALERT_LINK',
'  FROM (',
'   SELECT CASE WHEN imsrcvr_read_flag = ''N'' THEN ''<B>''||imsrcvr_subj||''</B>  <img src = "#APP_IMAGES#new (4).png" width="20px" height="20px">'' ELSE imsrcvr_subj END "ALERT_SUBJ", ',
'          ''<span style="color:#382828; font-size:12px;">''||imsrcvr_msg||''</span>'' "ALERT_MSG", ',
'',
'          imsrcvr_archive "ALERT_ICON1",  ',
'          imsrcvr_icon "ALERT_ICON", ',
'          imsrcvr_delete "ALERT_ICON2",',
'			 imsrcvr_date, ',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) < 1 THEN ',
'			    ',
'             apex_util.get_since(imsrcvr_date)',
'			 ELSE',
'             TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'',
'          END "ALERT_DATE",',
'			 NULL ALERT_MSG1,',
'          imsrcvr_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||imsrcvr_msg_id||'',''||''I'') "ALERT_LINK"',
'     FROM (',
'   SELECT (SELECT INITCAP(intmse_subject)',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT intmse_message',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          	''<span class="fa fa-archive" aria-hidden="true" style="color:#873600"></span>'' imsrcvr_archive,',
'          	''<span aria-hidden="true" class="fa fa-alert" style="color:rgb(49 183 6)"></span>'' imsrcvr_icon,',
'         	''<span aria-hidden="true" class="fa fa-trash" style="color:#EC7063"></span>'' imsrcvr_delete,',
'          (SELECT intmse_sent_date',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_date,',
'          imsrcvr_msg_id,',
'         imsrcvr_read_flag',
'     FROM int_msg_receivers',
'    WHERE imsrcvr_bu        = :GLOBAL_BU',
'      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'      AND imsrcvr_arch_flag = ''N''',
'      AND (:P58_INBOX_VIEW = ''A'' OR (imsrcvr_read_flag = ''N'' AND :P58_INBOX_VIEW = ''U''))))',
'       WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P58_INBOX_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'     ',
'ORDER BY imsrcvr_date DESC',
'   '))
,p_display_when_condition=>':P58_TYPE IN (''I'' ,''U'')'
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P58_INBOX_VIEW,P58_INBOX_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11682605297332255734)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No messages matched your search. Try using search option...'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029794158268755961)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Alert Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208591900489441)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>110
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208655820489442)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>120
,p_column_heading=>'Alert Icon1'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208780658489443)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>130
,p_column_heading=>'Alert Icon2'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029794390084755963)
,p_query_column_id=>8
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>90
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029793637737755956)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>40
,p_column_heading=>'Alert Msg'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031207435503489429)
,p_query_column_id=>6
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>100
,p_column_heading=>'Alert Msg1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029793589616755955)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>30
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6029974869664811730)
,p_name=>'Sent'
,p_static_id=>'sent'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT ''<span style="color:#a96a3f;font-size: 14px;">''||ALERT_SUBJ||''</span>'' ALERT_SUBJ,',
'		  ''<span style="display: inline-block; width: 564px; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;">''||ALERT_MSG||''</span>'' ALERT_MSG,',
'			-- ALERT_ICON1,',
'			ALERT_ICON,',
'			NULL ALERT_MSG1,',
'			NULL "ALERT_ICON1", ',
'         NULL "ALERT_ICON2", ',
'			''<span style="color:#0703f1;font-size: 11px">''||ALERT_DATE||''</span>'' ALERT_DATE,',
'			ALERT_LINK',
'  FROM (   ',
' SELECT   INITCAP(intmse_subject) "ALERT_SUBJ", ',
'         ''<span style="color:black; font-size:12px;">''||intmse_message||''</span>'' "ALERT_MSG", ',
'          intmse_icon "ALERT_ICON", ',
'          NULL "ALERT_ICON1", ',
'          NULL "ALERT_ICON2", ',
'          intmse_sent_date,',
'          CASE WHEN TRUNC(SYSDATE - intmse_sent_date) < 1 THEN',
'             apex_util.get_since(intmse_sent_date)',
'          ELSE',
'             TO_CHAR(intmse_sent_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'			 NULL ALERT_MSG1,',
'          intmse_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||intmse_msg_id||'',''||''S'') "ALERT_LINK"',
'     FROM (',
'   SELECT intmse_subject,',
'          intmse_message,',
'          intmse_sent_date,',
'          ''<span aria-hidden="true" class="fa fa-alert" style="color:rgb(49 183 6)"></span>'' intmse_icon,',
'          intmse_msg_id',
'     FROM internal_message',
'    WHERE intmse_bu        = :GLOBAL_BU',
'      AND intmse_sender_id = :GLOBAL_USER))',
'		WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P58_SENT_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'ORDER BY intmse_sent_date DESC'))
,p_display_when_condition=>'P58_TYPE'
,p_display_when_cond2=>'S'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P58_ARCHV_VIEW,P58_SENT_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11682605297332255734)
,p_query_num_rows=>15
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
 p_id=>wwv_flow_imp.id(6029975599901811737)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>40
,p_column_heading=>'Alert Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208273955489438)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>110
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208401346489439)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>120
,p_column_heading=>'Alert Icon1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6031208466847489440)
,p_query_column_id=>6
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>130
,p_column_heading=>'Alert Icon2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029975770199811739)
,p_query_column_id=>8
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>50
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029975058580811732)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>20
,p_column_heading=>'Alert Msg'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029976397449811745)
,p_query_column_id=>4
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>100
,p_column_heading=>'Alert Msg1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6029974965697811731)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>10
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029793034696755949)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_button_name=>'BTN_ARCHV'
,p_static_id=>'btn-archv'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Archive'
,p_button_redirect_url=>'javascript:$s(''P58_TYPE'',''A'');apex.submit(''Archieve'');'
,p_icon_css_classes=>'fa-archive'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029792722839755946)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_button_name=>'BTN-COMPOSE'
,p_static_id=>'btn-compose'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:47::'
,p_icon_css_classes=>'fa-envelope-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029792764436755947)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_button_name=>'BTN-INBOX'
,p_static_id=>'btn-inbox'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inbox - Unread(&P58_INBOX_CNT.)'
,p_button_redirect_url=>'javascript:$s(''P58_TYPE'',''I'');apex.submit(''Inbox'');'
,p_icon_css_classes=>'fa-inbox'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029792871550755948)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_button_name=>'BTN_SENTS'
,p_static_id=>'btn-sents'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sent'
,p_button_redirect_url=>'javascript:$s(''P58_TYPE'',''S'');apex.submit(''Sent'');'
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029793065437755950)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_button_name=>'BTN_UNREAD'
,p_static_id=>'btn-unread'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unread'
,p_button_redirect_url=>'javascript:$s(''P58_TYPE'',''U'');apex.submit(''Unread'');'
,p_icon_css_classes=>'fa-envelope-pointer'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029974794561811729)
,p_name=>'P58_ARCHIVE_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6029794930858755968)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029794700606755966)
,p_name=>'P58_ARCH_MSG_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6029793515417755954)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029795900210755978)
,p_name=>'P58_ARCH_VIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6029794930858755968)
,p_prompt=>'Arch View'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All;A,Unread;U'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:margin-top-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029793189282755951)
,p_name=>'P58_BTN_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029794789364755967)
,p_name=>'P58_DEL_MSG_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6029793515417755954)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029792208979755941)
,p_name=>'P58_INBOX_CNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029794595169755965)
,p_name=>'P58_INBOX_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6029793515417755954)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029794462071755964)
,p_name=>'P58_INBOX_VIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6029793515417755954)
,p_item_default=>'A'
,p_prompt=>'Inbox View'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All;A,Unread;U'
,p_cHeight=>1
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:margin-top-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029975899072811740)
,p_name=>'P58_SENT_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6029974869664811730)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6029793321436755952)
,p_name=>'P58_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6029791915451755938)
,p_item_default=>'I'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6031208109273489436)
,p_name=>'Archv_Search'
,p_static_id=>'archv-search'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_ARCHIVE_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6031208208919489437)
,p_event_id=>wwv_flow_imp.id(6031208109273489436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029794930858755968)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6031207858541489434)
,p_name=>'P14_ARCHV_VIEW'
,p_static_id=>'p14-archv-view'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_ARCH_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6031207958224489435)
,p_event_id=>wwv_flow_imp.id(6031207858541489434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029794930858755968)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6031207682020489432)
,p_name=>'P58_INBOX_VIEW'
,p_static_id=>'p58-inbox-view'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_INBOX_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6031207781995489433)
,p_event_id=>wwv_flow_imp.id(6031207682020489432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029793515417755954)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6031207523341489430)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_INBOX_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6031207622172489431)
,p_event_id=>wwv_flow_imp.id(6031207523341489430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029793515417755954)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6029975970418811741)
,p_name=>'Sent_search'
,p_static_id=>'sent-search'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P58_SENT_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6029976070393811742)
,p_event_id=>wwv_flow_imp.id(6029975970418811741)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029974869664811730)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
