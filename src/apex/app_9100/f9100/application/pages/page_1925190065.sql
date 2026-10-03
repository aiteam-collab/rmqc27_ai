prompt --application/pages/page_1925190065
begin
--   Manifest
--     PAGE: 1925190065
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
 p_id=>1925190065
,p_name=>'User Session History'
,p_alias=>'USER-SESSION-HISTORY'
,p_step_title=>'User Session History'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #9ac7fae8 !important;',
'    color: #000000a4 !important;',
'    font-family: Arial !important;',
'    text-align: center;',
'    HEIGHT: 125PX;',
'} */',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
' .t-fht-thead {',
'    overflow: auto !important;',
' }'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7610799021609483713)
,p_plug_name=>'LOGIN_AUDIT_INFO_APEX'
,p_static_id=>'login-audit-info-apex'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WULD_USER_ID               "Login User ID",',
'       WULD_APEX_WORKSPACE_NAME   "Login Workspace Name",',
'       WULD_APEX_APP_ID           "Login Application ID",',
'       WULD_APEX_SESSION_ID       "Current Session ID",',
'       WULD_ORCL_SID              "Current Oracle SID",',
'       WULD_ORCL_SERIALNO         "Current Oracle Serial#",',
'       WULD_HTTP_HOST             "Application Host ID",',
'       WULD_LOC_IP_ADDR           "Unique Address Generated With Local IP And Browser",',
'       WULD_PUB_IP_ADDR           "User Public IP Address",',
'       WULD_REMOTE_ADDR           "Application Remote IP Address",',
'       CASE WHEN WULD_BROWSER = ''edge'' THEN',
'        ''#APP_FILES#edge.png''',
'       WHEN WULD_BROWSER = ''chromium based edge'' THEN ',
'        ''#APP_FILES#edge.png''',
'       WHEN WULD_BROWSER = ''chrome'' THEN  ',
'        ''#APP_FILES#chrome.png'' ',
'       WHEN WULD_BROWSER = ''opera'' THEN ',
'        ''#APP_FILES#opera.png''  ',
'       WHEN WULD_BROWSER = ''firefox'' THEN ',
'        ''#APP_FILES#firefox.png'' ',
'       WHEN WULD_BROWSER = ''safari'' THEN   ',
'        ''#APP_FILES#safari.png''',
'       ELSE',
'        ''#APP_FILES#browser.png''     END  "User Browser",',
'       WULD_DEVICETYPE            "User Device Type",',
'       CASE WHEN WULD_ISMOBILE  = ''true''   THEN',
'       ''<span class="fa fa-mobile" aria-hidden="true"></span>'' ',
'       ELSE',
'       ''<span aria-hidden="true" class="fa fa-desktop"></span>''    END    "User Device Is Mobile OR Not",',
'       CASE WHEN WULD_ISTOUCHDEVICE = ''true'' THEN',
'       ''<span aria-hidden="true" class="fa fa-hand-pointer-o"></span>''   ',
'       ELSE',
'       ''<span aria-hidden="true" class="fa fa-keyboard-o"></span>''  END  "User Device Interface",',
'       WULD_LANGUAGE              "User Device Language",',
'       WULD_PLATFORM              "User Device Platform",',
'       WULD_SCREENHEIGHT          "User Device Screen Height",',
'       WULD_SCREENWIDTH           "User Device Screen Width",',
'       WULD_TIMEZONE              "User Time Zone",',
'       WULD_USERAGENT             "User Browser Useragent",',
'       WULD_LAT                   "User Latitude",',
'       WULD_LNG                   "User Longitude",',
'       TO_CHAR(WULD_SESS_CREATED,''DD-MM-YYYY HH24:MI'') "Application Current Session Created On",',
'       TO_CHAR(WULD_IDLE_TIMEOUT_ON,''DD-MM-YYYY HH24:MI'')       "Application Idle Timeout On",',
'       TO_CHAR(WULD_LIFE_TIMEOUT_ON ,''DD-MM-YYYY HH24:MI'')      "Application Life Timeout On"	,',
'       WULD_LOGIN_SEQ "SEQ"	,',
'        ''<span class="fa fa-accordion" aria-hidden="true"></span>'' "USED Bus. Function"',
'  FROM wa_user_login_dtls',
'-- WHERE TRUNC(TO_DATE(WULD_SESS_CREATED)) < TRUNC(SYSDATE)',
' ORDER BY WULD_SESS_CREATED desc,WULD_USER_ID,WULD_LOGIN_SEQ'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'LOGIN_AUDIT_INFO_APEX'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7610799128453483713)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2128837292909872685
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611731958501365121)
,p_db_column_name=>'Application Current Session Created On'
,p_display_order=>62
,p_column_identifier=>'Z'
,p_column_label=>'Login Date'
,p_column_html_expression=>'<div style="width: 100px; word-wrap: break-word;">#Application Current Session Created On#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610800731254483741)
,p_db_column_name=>'Application Host ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Host ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611732046709365122)
,p_db_column_name=>'Application Idle Timeout On'
,p_display_order=>72
,p_column_identifier=>'AA'
,p_column_label=>'Application Idle Timeout On'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611732204194365123)
,p_db_column_name=>'Application Life Timeout On'
,p_display_order=>82
,p_column_identifier=>'AB'
,p_column_label=>'Application Life Timeout On'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610801875199483744)
,p_db_column_name=>'Application Remote IP Address'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Remote IP'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611731745012365119)
,p_db_column_name=>'Current Oracle SID'
,p_display_order=>42
,p_column_identifier=>'X'
,p_column_label=>'Oracle SID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611731852434365120)
,p_db_column_name=>'Current Oracle Serial#'
,p_display_order=>52
,p_column_identifier=>'Y'
,p_column_label=>'Oracle Serial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610800312860483738)
,p_db_column_name=>'Current Session ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Session ID'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611731641121365118)
,p_db_column_name=>'Login Application ID'
,p_display_order=>32
,p_column_identifier=>'W'
,p_column_label=>'Application ID'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610799461563483733)
,p_db_column_name=>'Login User ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610799876617483736)
,p_db_column_name=>'Login Workspace Name'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Workspace'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611732289977365124)
,p_db_column_name=>'SEQ'
,p_display_order=>92
,p_column_identifier=>'AC'
,p_column_label=>'#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7733973247723558225)
,p_db_column_name=>'USED Bus. Function'
,p_display_order=>102
,p_column_identifier=>'AE'
,p_column_label=>'Used Bus. Function'
,p_column_link=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.::P70_SESSION_ID,P70_USER_ID,P70_WORKSPACE_NAME:#Current Session ID#,#Login User ID#,#Login Workspace Name#'
,p_column_linktext=>'<div style="width: 80px; word-wrap: break-word; color:blue;">#USED Bus. Function#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and instr(nvl(:REQUEST,''~''),''PDF'') = 0 and instr(nvl(:REQUEST,''~''),''HTMLD'') = 0'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610801116246483743)
,p_db_column_name=>'Unique Address Generated With Local IP And Browser'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Unique Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610802297733483746)
,p_db_column_name=>'User Browser'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Browser'
,p_column_html_expression=>'<img src="#User Browser#" alt="#User Browser#" width="20" height="20">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610805858560483752)
,p_db_column_name=>'User Browser Useragent'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Useragent'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610803501325483747)
,p_db_column_name=>'User Device Interface'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Device Interface'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and instr(nvl(:REQUEST,''~''),''PDF'') = 0 and instr(nvl(:REQUEST,''~''),''HTMLD'') = 0'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610803083824483747)
,p_db_column_name=>'User Device Is Mobile OR Not'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Device'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and instr(nvl(:REQUEST,''~''),''PDF'') = 0 and instr(nvl(:REQUEST,''~''),''HTMLD'') = 0'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610803916926483749)
,p_db_column_name=>'User Device Language'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Language'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610804330425483749)
,p_db_column_name=>'User Device Platform'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Platform'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610804717016483750)
,p_db_column_name=>'User Device Screen Height'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Screen Height'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610805081812483750)
,p_db_column_name=>'User Device Screen Width'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Screen Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610802735864483746)
,p_db_column_name=>'User Device Type'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Device Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610806302667483752)
,p_db_column_name=>'User Latitude'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Latitude'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610806691680483754)
,p_db_column_name=>'User Longitude'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Longitude'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610801516712483744)
,p_db_column_name=>'User Public IP Address'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Public IP'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7610805534832483750)
,p_db_column_name=>'User Time Zone'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Time Zone'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7610809967343486385)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5878265'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Application Current Session Created On:Login User ID:Login Workspace Name:Login Application ID:Current Oracle SID:Current Oracle Serial#:Current Session ID:USED Bus. Function:Application Host ID:Unique Address Generated With Local IP And Browser:User'
||' Public IP Address:Application Remote IP Address:User Browser:User Device Type:User Device Is Mobile OR Not:User Device Interface:User Device Language:User Device Platform:User Device Screen Height:User Device Screen Width:User Time Zone:User Latitud'
||'e:User Longitude'
);
wwv_flow_imp.component_end;
end;
/
