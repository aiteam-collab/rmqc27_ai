prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'Internal Alerts'
,p_alias=>'INTERNAL-ALERTS'
,p_step_title=>'Internal Alerts'
,p_warn_on_unsaved_changes=>'N'
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
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11684325212942445482)
,p_name=>'Archive'
,p_static_id=>'archive'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--accent9:t-Region--scrollBody'
,p_component_template_options=>'[object Object]'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT *',
'  FROM (   ',
'	SELECT CASE WHEN imsrcvr_read_flag = ''N'' THEN ''<B>''||imsrcvr_subj||''</B>  <img src = "#APP_IMAGES#new (4).png" width="20px" height="20px">'' ELSE imsrcvr_subj END "ALERT_SUBJ", ',
'          imsrcvr_msg "ALERT_MSG", ',
'          NULL "ALERT_ICON1",  ',
'          imsrcvr_icon "ALERT_ICON", ',
'          NULL "ALERT_ICON2",',
'          imsrcvr_date,',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) < 1 THEN',
'             apex_util.get_since(imsrcvr_date)',
'          ELSE',
'             TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'          imsrcvr_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||imsrcvr_msg_id||'',''||''A'') "ALERT_LINK"',
'     FROM (',
'   SELECT (SELECT intmse_subject',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT intmse_message',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          ''<span class="fa fa-archive" aria-hidden="true" style="color:#873600" title="Archive"></span>'' imsrcvr_archive,',
'          ''<span aria-hidden="true" class="fa fa-alert" style="color: rgb(62, 110, 188)"></span>'' imsrcvr_icon,',
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
'      AND (:P14_ARCHV_VIEW = ''A'' OR (imsrcvr_read_flag = ''N'' AND :P14_ARCHV_VIEW = ''U''))))',
'		WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P14_ARCHIVE_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'ORDER BY imsrcvr_date DESC'))
,p_display_when_condition=>':P14_TYPE = ''A'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P14_ARCHV_VIEW'
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
 p_id=>wwv_flow_imp.id(11684325919031445489)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684325825491445488)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684325693557445487)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684326059166445491)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684326029123445490)
,p_query_column_id=>9
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>6
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684325603340445486)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Msg'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684325515873445485)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>1
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684326250278445493)
,p_query_column_id=>6
,p_column_alias=>'IMSRCVR_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Imsrcvr Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11684326154678445492)
,p_query_column_id=>8
,p_column_alias=>'IMSRCVR_MSG_ID'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11679423280396002602)
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
 p_id=>wwv_flow_imp.id(11675085907579006186)
,p_name=>'Inbox'
,p_static_id=>'inbox'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--accent13:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT *',
'  FROM (',
'	SELECT CASE WHEN imsrcvr_read_flag = ''N'' THEN ''<B>''||imsrcvr_subj||''</B>  <img src = "#APP_IMAGES#new (4).png" width="20px" height="20px">'' ELSE imsrcvr_subj END "ALERT_SUBJ", ',
'          imsrcvr_msg "ALERT_MSG", ',
'          imsrcvr_archive "ALERT_ICON1",  ',
'          imsrcvr_icon "ALERT_ICON", ',
'          imsrcvr_delete "ALERT_ICON2",',
'          imsrcvr_date,',
'          CASE WHEN TRUNC(SYSDATE - imsrcvr_date) < 1 THEN',
'             apex_util.get_since(imsrcvr_date)',
'          ELSE',
'             TO_CHAR(imsrcvr_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'          imsrcvr_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||imsrcvr_msg_id||'',''||''I'') "ALERT_LINK"',
'     FROM (',
'   SELECT (SELECT intmse_subject',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_subj,',
'          (SELECT intmse_message',
'             FROM internal_message',
'            WHERE intmse_bu     = imsrcvr_bu',
'              AND intmse_msg_id = imsrcvr_msg_id) imsrcvr_msg,',
'          ''<span class="fa fa-archive" aria-hidden="true" style="color:#873600" title="Archive"></span>'' imsrcvr_archive,',
'          ''<span aria-hidden="true" class="fa fa-alert" style="color: rgb(62, 110, 188)"></span>'' imsrcvr_icon,',
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
'      AND (:P14_INBOX_VIEW = ''A'' OR (imsrcvr_read_flag = ''N'' AND :P14_INBOX_VIEW = ''U''))))',
'	   WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P14_INBOX_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'	 ',
'ORDER BY imsrcvr_date DESC'))
,p_display_when_condition=>':P14_TYPE IN (''I'' ,''U'')'
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P14_INBOX_VIEW'
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
 p_id=>wwv_flow_imp.id(11679423124018002600)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'Alert Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679423016289002599)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>6
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679422917635002598)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Icon1'
,p_column_link=>'javascript:$s(''P14_ARCH_MSG_ID'',''#IMSRCVR_MSG_ID#''); apex.confirm(''Do you want to Archive?'', ''AR'');'
,p_column_linktext=>'#ALERT_ICON1#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679424102764002610)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>9
,p_column_heading=>'Alert Icon2'
,p_column_link=>'javascript:$s(''P14_DEL_MSG_ID'',''#IMSRCVR_MSG_ID#''); apex.confirm(''Do you want to Delete?'', ''DL'');'
,p_column_linktext=>'#ALERT_ICON2#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679423129651002601)
,p_query_column_id=>9
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>8
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679422738092002597)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Msg'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11679422718585002596)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675087965706006207)
,p_query_column_id=>6
,p_column_alias=>'IMSRCVR_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Imsrcvr Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11675086196830006189)
,p_query_column_id=>8
,p_column_alias=>'IMSRCVR_MSG_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11685816810517271871)
,p_name=>'Sent'
,p_static_id=>'sent'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--accent9:t-Region--scrollBody'
,p_component_template_options=>'[object Object]'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT *',
'  FROM (   ',
' SELECT intmse_subject "ALERT_SUBJ", ',
'          intmse_message "ALERT_MSG", ',
'          intmse_icon "ALERT_ICON", ',
'          NULL "ALERT_ICON1", ',
'          NULL "ALERT_ICON2", ',
'          intmse_sent_date,',
'          CASE WHEN TRUNC(SYSDATE - intmse_sent_date) < 1 THEN',
'             apex_util.get_since(intmse_sent_date)',
'          ELSE',
'             TO_CHAR(intmse_sent_date, ''DD.MM.RRRR HH:MI:SS AM'')',
'          END "ALERT_DATE",',
'          intmse_msg_id,',
'          apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID,P11_MSG_TYPE:''||intmse_msg_id||'',''||''S'') "ALERT_LINK"',
'     FROM (',
'   SELECT intmse_subject,',
'          intmse_message,',
'          intmse_sent_date,',
'          ''<span aria-hidden="true" class="fa fa-alert" style="color: rgb(62, 110, 188)"></span>'' intmse_icon,',
'          intmse_msg_id',
'     FROM internal_message',
'    WHERE intmse_bu        = :GLOBAL_BU',
'      AND intmse_sender_id = :GLOBAL_USER))',
'		WHERE  (INSTR (UPPER (NVL (ALERT_SUBJ, '' '')),UPPER (NVL (:P14_SENT_SEARCH, NVL (ALERT_SUBJ, '' '')))) > 0)',
'ORDER BY intmse_sent_date DESC'))
,p_display_when_condition=>'P14_TYPE'
,p_display_when_cond2=>'S'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P14_ARCHV_VIEW'
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
 p_id=>wwv_flow_imp.id(11685817356469271877)
,p_query_column_id=>7
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685817295289271876)
,p_query_column_id=>3
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685818072736271884)
,p_query_column_id=>4
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>8
,p_column_heading=>'Alert Icon1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685818205697271885)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ICON2'
,p_column_display_sequence=>9
,p_column_heading=>'Alert Icon2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685817527150271878)
,p_query_column_id=>9
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685817082095271874)
,p_query_column_id=>2
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Msg'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685816929421271873)
,p_query_column_id=>1
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>1
,p_column_heading=>'Alert Subj'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685817966879271883)
,p_query_column_id=>8
,p_column_alias=>'INTMSE_MSG_ID'
,p_column_display_sequence=>7
,p_column_heading=>'Intmse Msg Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11685817862234271882)
,p_query_column_id=>6
,p_column_alias=>'INTMSE_SENT_DATE'
,p_column_display_sequence=>6
,p_column_heading=>'Intmse Sent Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11684326922562445499)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_button_name=>'BTN_ARCHV'
,p_static_id=>'btn-archv'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Archive'
,p_button_redirect_url=>'javascript:$s(''P14_TYPE'',''A'');apex.submit(''Archieve'');'
,p_icon_css_classes=>'fa-archive'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11679423435709002604)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_button_name=>'BTN_COMPOSE'
,p_static_id=>'btn-compose'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-envelope-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11679423556815002605)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_button_name=>'BTN_INBOX'
,p_static_id=>'btn-inbox'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inbox - Unread (&P14_INBOX_CNT.)'
,p_button_redirect_url=>'javascript:$s(''P14_TYPE'',''I'');apex.submit(''Inbox'');'
,p_icon_css_classes=>'fa-inbox'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11685816178087271865)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_button_name=>'BTN_SENTS'
,p_static_id=>'btn-sents'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sent'
,p_button_redirect_url=>'javascript:$s(''P14_TYPE'',''S'');apex.submit(''Sent'');'
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5992552780627363635)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_button_name=>'BTN_UNREAD'
,p_static_id=>'btn-unread'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unread'
,p_button_redirect_url=>'javascript:$s(''P14_TYPE'',''U'');apex.submit(''Unread'');'
,p_icon_css_classes=>'fa-envelope-pointer'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6024819422290292363)
,p_name=>'P14_ARCHIVE_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11684325212942445482)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
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
 p_id=>wwv_flow_imp.id(11684325238044445483)
,p_name=>'P14_ARCHV_VIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11684325212942445482)
,p_item_default=>'A'
,p_prompt=>'Inbox View'
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
 p_id=>wwv_flow_imp.id(11684324932575445480)
,p_name=>'P14_ARCH_MSG_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11675085907579006186)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11684323561147445466)
,p_name=>'P14_BTN_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11684328015757445510)
,p_name=>'P14_DEL_MSG_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11675085907579006186)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11684323716696445467)
,p_name=>'P14_INBOX_CNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6024819295540292362)
,p_name=>'P14_INBOX_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11675085907579006186)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>7
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
 p_id=>wwv_flow_imp.id(11684324681389445477)
,p_name=>'P14_INBOX_VIEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11675085907579006186)
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
 p_id=>wwv_flow_imp.id(6024819469014292364)
,p_name=>'P14_SENT_SEARCH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11685816810517271871)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-ssearchm fa-'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5992537620296264030)
,p_name=>'P14_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11679423280396002602)
,p_item_default=>'I'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6024819792391292367)
,p_name=>'Archive_Search'
,p_static_id=>'archive-search'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_ARCHIVE_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6024819886157292368)
,p_event_id=>wwv_flow_imp.id(6024819792391292367)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11684325212942445482)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11684327019101445500)
,p_name=>'Button Archive'
,p_static_id=>'button-archive'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11684326922562445499)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684327274482445503)
,p_event_id=>wwv_flow_imp.id(11684327019101445500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_BTN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'A')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11684324028101445470)
,p_name=>'Button Compose'
,p_static_id=>'button-compose'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11679423435709002604)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684324050334445471)
,p_event_id=>wwv_flow_imp.id(11684324028101445470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_BTN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'C')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11684323753355445468)
,p_name=>'Button Inbox'
,p_static_id=>'button-inbox'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11679423556815002605)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684323910389445469)
,p_event_id=>wwv_flow_imp.id(11684323753355445468)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_BTN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'I')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11685816239697271866)
,p_name=>'Button Sents'
,p_static_id=>'button-sents'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11685816178087271865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11685816419686271867)
,p_event_id=>wwv_flow_imp.id(11685816239697271866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_BTN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'S')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5992537675286264031)
,p_name=>'Button_unread'
,p_static_id=>'button-unread'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5992552780627363635)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5992537807503264032)
,p_event_id=>wwv_flow_imp.id(5992537675286264031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'U,P14_BTN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'U')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11684327382208445504)
,p_name=>'P14_ARCHV_VIEW'
,p_static_id=>'p14-archv-view'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_ARCHV_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684327433015445505)
,p_event_id=>wwv_flow_imp.id(11684327382208445504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11684325212942445482)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11684324731838445478)
,p_name=>'P14_INBOX_VIEW'
,p_static_id=>'p14-inbox-view'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_INBOX_VIEW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11684324891016445479)
,p_event_id=>wwv_flow_imp.id(11684324731838445478)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11675085907579006186)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6024819606229292365)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_INBOX_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6024819726394292366)
,p_event_id=>wwv_flow_imp.id(6024819606229292365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11675085907579006186)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6024820007147292369)
,p_name=>'Sent_Search'
,p_static_id=>'sent-search'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_SENT_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6024820061527292370)
,p_event_id=>wwv_flow_imp.id(6024820007147292369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11685816810517271871)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11684328070488445511)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Process'
,p_static_id=>'delete-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE',
'  FROM int_msg_receivers',
' WHERE imsrcvr_bu        = :GLOBAL_BU',
'   AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'   AND imsrcvr_msg_id    = :P14_DEL_MSG_ID;',
'    ',
'COMMIT;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Message deleted successfully.'
,p_internal_uid=>6202366234944834483
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11685816048657271864)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inbox_cnt'
,p_static_id=>'inbox-cnt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)',
' INTO :P14_INBOX_CNT',
'  FROM int_msg_receivers',
' WHERE imsrcvr_bu        = :GLOBAL_BU',
'   AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'   AND imsrcvr_read_flag = ''N'';'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6203854213113660836
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11684327877023445509)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Archive'
,p_static_id=>'process-archive'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE int_msg_receivers',
'   SET imsrcvr_arch_flag = ''Y''',
' WHERE imsrcvr_bu        = :GLOBAL_BU',
'   AND imsrcvr_rcvr_id   = :GLOBAL_USER',
'   AND imsrcvr_msg_id    = :P14_ARCH_MSG_ID',
'   AND imsrcvr_arch_flag = ''N'';',
'    ',
'COMMIT;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'AR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Message Archived successfully.'
,p_internal_uid=>6202366041479834481
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11685819408153271897)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Type'
,p_static_id=>'type'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''I''',
'  INTO :P14_BTN_TYPE',
'  FROM dual;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6203857572609660869
);
wwv_flow_imp.component_end;
end;
/
