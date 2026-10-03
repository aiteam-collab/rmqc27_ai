prompt --application/pages/page_00061
begin
--   Manifest
--     PAGE: 00061
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
 p_id=>61
,p_name=>'Roadmap ERP'
,p_alias=>'EVENTS3'
,p_step_title=>'Roadmap ERP'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
' .t-Region{',
'  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;',
'}',
'#ANMT .t-MediaList-badge {',
'    color: #6e6b6b;',
'    font-size: small;',
'    background-color: transparent;',
'}',
'',
'.t-MediaList-icon {',
'    background-color: transparent;',
'    color: lightsalmon;',
'}',
'',
'.u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #ff2e60;',
'    fill: #309FDB;',
'    color: #ffffff;',
'}',
'',
'.u-colors > :nth-child(45n + 2) .u-color {',
'    background-color: #801a33;',
'    fill: #13B6CF;',
'    color: #e4f9fd;',
'}',
'',
'.u-colors > :nth-child(45n + 3) .u-color {',
'    background-color: #fdaf25;',
'    fill: #2EBFBC;',
'    color: #f0fcfb;',
'}',
'.u-colors > :nth-child(45n + 4) .u-color {',
'    background-color: #00ebed;',
'    fill: #3CAF85;',
'    color: #f0faf6;',
'}',
'.u-colors > :nth-child(45n + 5) .u-color {',
'    background-color: #ffc522;',
'    fill: #81BB5F;',
'    color: #ffffff;',
'}',
'.u-colors > :nth-child(45n + 6) .u-color {',
'    background-color: #dda96b;',
'    fill: #DDDE53;',
'    color: #2a2a08;',
'}',
'.u-colors > :nth-child(45n + 7) .u-color {',
'    background-color: #ef525e;',
'    fill: #FBCE4A;',
'    color: #443302;',
'}',
'.t-Body-content {',
'    background-image: url("#APP_IMAGES#05-01.jpg");',
'    background-repeat: no-repeat;',
'    background-size: cover; ',
'	 //background-color: white;',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.2rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'',
'#profile .t-Body-contentInner {',
'    padding: 0px;',
'    flex-grow: 1;',
'    width: 35%;',
'}',
'',
'.t-Cards--compact .t-Card-titleWrap {',
'    box-shadow: transparent;',
'}',
'',
'#profile .t-Card-wrap {',
'    border-radius: 3px;',
'    border: transparent;',
'    background-clip: #fdfdfd;',
'    width: 100%;',
'}',
'',
'#profile .t-Card :hover',
'{',
'   background-color: #fdfdfd;',
'}',
'',
'.t-Cards--compact .t-Card-titleWrap {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 4px 4px 12px 100px;',
'}',
'#profile .t-Cards--compact.t-Cards--displaySubtitle .t-Card-subtitle ',
'{',
'    display: block;',
'    font-size: 12px;',
'    line-height: 0px;',
'    padding-top: 10px;',
'    font-weight: 400;',
'    color: #0b447c;',
'    padding-left: 143px;',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8035881739092526139)
,p_plug_name=>'Alert'
,p_static_id=>'alert'
,p_region_template_options=>'#DEFAULT#:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<h5>Please contact Administrator to provide DashBoard Access.</h5>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7654949281587173935)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_name=>'ANMT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:margin-left-none:margin-right-md'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE ,',
'		 to_char(GN_DOC_DATE,''Mon DD, YYYY HH:MI AM'') list_text,',
'       --''fa fa-calendar'' LIST_ICON_VALUE,',
'        to_char(GN_DOC_DATE,''Mon DD YYYY HH:MI AM'')   list_badge,',
'		  ''fa fa-bullhorn'' icon_class  ,',
'       --''<span aria-hidden="true" class="fa fa-bullhorn fa-anim-vertical-shake" style="color: #000B79;"></span>''|| ''    '' ||INITCAP(GN_NOTI_HD) list_title,',
'       ''<style>',
'            #more''',
'|| GN_DOC_NO',
'|| ''{',
'                display: none;',
'            }',
'        </style>    ',
'        <script>',
'            function myFunction(GN_DOC_NO) {',
'            var dots = document.getElementById("dots" + GN_DOC_NO);',
'            var moreText = document.getElementById("more" + GN_DOC_NO);',
'            var btnText = document.getElementById("myBtn" + GN_DOC_NO);',
'                ',
'            if (dots.style.display === "none") {',
'                dots.style.display = "inline";',
'                btnText.innerHTML = "Read More"; ',
'                moreText.style.display = "none";',
'            } else {',
'                dots.style.display = "none";',
'                btnText.innerHTML = "Read Less"; ',
'                moreText.style.display = "inline";',
'            }',
'            }',
'            </script>''',
'|| ''<div class="a"><SPAN STYLE="font-size:12px; "> ''',
'||',
'CASE',
'    WHEN length(initcap(GN_NOTI)) > 100 THEN',
'            substr(initcap(GN_NOTI), 1, 100)',
'            || ''<span id="dots''',
'            || GN_DOC_NO',
'            || ''">..</span><span id="more''',
'            || GN_DOC_NO',
'            || ''">''',
'            || substr(initcap(GN_NOTI), 51, length(initcap(GN_NOTI)))',
'            || ''</span><p id="myBtn''',
'            || GN_DOC_NO',
'            || ''"  onclick="myFunction(''',
'            || GN_DOC_NO',
'            || '')" style="color:green; cursor: pointer;" >Read more</button>''',
'    ELSE',
'        initcap(GN_NOTI)',
'END',
'|| ''</SPAN></DIV>''  list_title,',
'       GN_NOTI_BY,',
'       GN_EFF_TO,',
'       GN_EFF_FROM,',
'       GN_DUE_DATE,',
'       GN_STATUS,',
'       GN_VISIBLITY,',
'       GN_CRE_BY,',
'       GN_CRE_IP_ADDR,',
'       GN_CRE_OS_USER,',
'       GN_CRE_DATE,',
'       GN_UPD_BY,',
'       GN_UPD_IP_ADDR,',
'       GN_UPD_OS_USER,',
'       GN_UPD_DATE,',
'       GN_CRE_EMP_ID,',
'       GN_UPD_EMP_ID,',
'       GN_ATTACH,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION',
' WHERE GN_BU = :global_bu',
'   AND trunc(sysdate) BETWEEN trunc(gn_eff_from) AND trunc(gn_eff_to)'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634537003616689451)
,p_query_column_id=>24
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>220
,p_column_heading=>'Gn Attach'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634527818695689403)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634532973356689424)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634534136204689432)
,p_query_column_id=>17
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634536165563689445)
,p_query_column_id=>22
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Cre Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634533414013689428)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Cre Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634533762285689431)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634528539894689409)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>280
,p_column_heading=>'Gn Doc Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634528159237689407)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634531828829689421)
,p_query_column_id=>11
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Due Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634531365603689420)
,p_query_column_id=>10
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Eff From'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634530982728689420)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>70
,p_column_heading=>'Gn Eff To'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634537358492689454)
,p_query_column_id=>25
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>230
,p_column_heading=>'Gn File Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634537747029689456)
,p_query_column_id=>26
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Mime Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634530583191689418)
,p_query_column_id=>8
,p_column_alias=>'GN_NOTI_BY'
,p_column_display_sequence=>60
,p_column_heading=>'Gn Noti By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634532220104689423)
,p_query_column_id=>12
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634534626526689432)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634535808808689437)
,p_query_column_id=>21
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634536630306689448)
,p_query_column_id=>23
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634534976537689434)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Upd Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634535416545689435)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634532606704689423)
,p_query_column_id=>13
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Visiblity'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634529404541689413)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>270
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6624316633147083667)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>300
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634530223988689417)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>260
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6634529786284689415)
,p_query_column_id=>7
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>250
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6817075649842754029)
,p_name=>'Events'
,p_static_id=>'events'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--textContent:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--basic:t-Cards--displayInitials:t-Cards--3cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard:t-Report--hideNoPagination'
,p_grid_column_span=>8
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Birthday</span>'' "CARD_SUBTITLE",',
'       COUNT (emp_first_name1)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#Bday-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'        --''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,	',
'       1 seq_no	   ',
'  FROM employees',
' WHERE emp_bu = :global_bu AND emp_status = ''A''',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') =',
'              TO_CHAR (TRUNC (TO_DATE (SYSDATE)), ''MMDD'')	   ',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Wedding Anniversary</span>'' "CARD_SUBTITLE",',
'       COUNT (emp_first_name1)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#Ani-02-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'       -- ''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,	',
'       2 seq_no	   ',
'  FROM employees',
' WHERE emp_bu = :global_bu AND emp_status = ''A''',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') =',
'              TO_CHAR (TRUNC (TO_DATE (SYSDATE)), ''MMDD'')	',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Work Anniversary</span>'' "CARD_SUBTITLE",',
'       COUNT (emp_first_name1)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#WorkAni-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'      --  ''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,	',
'       3 seq_no	   ',
'  FROM employees',
' WHERE emp_bu = :global_bu AND emp_status = ''A''',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') =',
'              TO_CHAR (TRUNC (TO_DATE (SYSDATE)), ''MMDD'')	',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Approvals</span>'' "CARD_SUBTITLE",',
'       COUNT(*)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#App-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'       -- ''f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:RP'' CARD_LINK,    ',
'       4 seq_no       ',
'FROM work_flow_doc_control  ',
' WHERE wfdc_bu = :GLOBAL_BU',
'   AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_BU, :GLOBAL_USER) ',
'    OR  wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:GLOBAL_BU, :GLOBAL_USER))',
'   AND (wfdc_type, wfdc_status) NOT IN (SELECT wfaa_wf_id, wfaa_status',
'                                          FROM work_flow_appr_actvt',
'                                         WHERE wfaa_bu = :GLOBAL_BU ',
'                                           AND (wfaa_wf_id, wfaa_seq_no) IN (SELECT wfaa_wf_id, MAX(wfaa_seq_no) wfaa_seq_no',
'                                                                               FROM work_flow_appr_actvt',
'                                                                              WHERE wfaa_bu = :GLOBAL_BU ',
'                                                                              GROUP BY wfaa_wf_id))',
'  AND wfdc_status NOT IN (''C'',''R'',''S'')  	',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Tasks</span>'' "CARD_SUBTITLE",',
'       COUNT(*)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#Tasks-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'       -- ''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,    ',
'       5 seq_no       ',
'    FROM sch_activities',
'  WHERE scha_bu=:global_bu ',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">SMS</span>'' "CARD_SUBTITLE",',
'       COUNT(*)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#SMS-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'       -- ''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,    ',
'       6 seq_no       ',
'  FROM sms_outbox_vw',
' WHERE soh_bu = :global_bu     			  ',
'UNION ALL',
'SELECT ''<span style = "color:#000B79; margin-left: 10px;font-weight: bolder;text-align:center;">Mail</span>'' "CARD_SUBTITLE",',
'       COUNT(*)',
'          "CARD_INITIALS",',
'       ''<img src=#APP_IMAGES#UMail-01.png alt="Img" width="75" height="75" style = "margin-left: 42px;">'' card_title,',
'       -- ''f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP'' CARD_LINK,    ',
'       7 seq_no      ',
'  fROM email_outbox_vw',
' WHERE eoh_bu = :global_bu',
'   --AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'ORDER BY seq_no ASC  ',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6817075906498754031)
,p_query_column_id=>2
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>20
,p_column_heading=>'Card Initials'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6817075814930754030)
,p_query_column_id=>1
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6817075947369754032)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6825746184515499168)
,p_query_column_id=>4
,p_column_alias=>'SEQ_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7617981943733821376)
,p_name=>'New'
,p_static_id=>'new'
,p_region_name=>'profile'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--spanHorizontally:t-Cards--desc-4ln:t-Cards--animColorFill'
,p_display_column=>10
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   ''<b>''||''Welcome''||''</b>'' CARD_TITLE,--CARD_SUBTEXT,',
'         ''<b>''||:GLOBAL_EMP_NAME||''</b>'' CARD_SUBTEXT, --CARD_TEXT,',
'   DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<img align= "right" alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''P6_DM_BLOB'', ROWID)||''" height = "60" width = "60"/>'
||''')',
'        CARD_TEXT, -- CARD_TITLE,',
'        ''<span align ="right"><b>''||''Profile''||''</b></span>'' CARD_SUBTITLE',
'',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no = :GLOBAL_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'UNION ALL',
'SELECT  ''<b>''||''Welcome''||''</b>'' CARD_TITLE, --CARD_SUBTEXT,',
'        ''<b>''||:GLOBAL_EMP_NAME||''</b>'' CARD_SUBTEXT, --CARD_TEXT,',
' CASE WHEN  EMP_GENDER=''F'' ',
'            THEN ''<img align= "right" alt="''||apex_escape.html_attribute(:GLOBAL_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "60" width = "60"/>''',
'            ELSE ''<img align= "right" alt="''||apex_escape.html_attribute(:GLOBAL_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile.png'''' height = "60" width = "60"/>''',
'       END',
'      CARD_TEXT, -- CARD_TITLE,',
'        ''<span align ="right"><b>''||''Profile''||''</b></span>''  CARD_SUBTITLE',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :GLOBAL_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL);',
'',
'',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7657225908794344732)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7617982221748821378)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Subtitle'
,p_column_link=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#CARD_SUBTITLE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7657225618032344729)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7617982074749821377)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7667560409383734034)
,p_name=>'New1'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(7617981943733821376)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<img align= "right" alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''P6_DM_BLOB'', ROWID)||''" height = "60" width = "60"/>'
||''')',
'        CARD_TITLE,',
'        ''<b>''||:GLOBAL_EMP_NAME||''</b>'' CARD_TEXT,',
'        ''<span align ="right"><b>''||''Profile''||''</b></span>'' CARD_SUBTITLE, ',
'        NULL CARD_SUBTEXT',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:GLOBAL_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'UNION ALL',
'SELECT CASE WHEN  EMP_GENDER=''F'' ',
'            THEN ''<img align= "right" alt="''||apex_escape.html_attribute(:GLOBAL_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "60" width = "60"/>''',
'            ELSE ''<img align= "right" alt="''||apex_escape.html_attribute(:GLOBAL_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile.png'''' height = "60" width = "60"/>''',
'       END ',
'       CARD_TITLE,',
'      --   ''<center><b>''||:GLOBAL_EMP_NAME||''</b></center>'' CARD_TEXT,',
'        ''<center><b>''||EMP_FIRST_NAME1||'' ''||EMP_MIDDLE_NAME1||'' ''||EMP_LAST_NAME1||''</b></center>'' CARD_TEXT,',
'        ''<span align ="right"><b>''||''Profile''||''</b></span>'' CARD_SUBTITLE, ',
'        NULL CARD_SUBTEXT',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :GLOBAL_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL);',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7667560823068734038)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7667560720475734037)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Subtitle'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7667560619712734036)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7667560439812734035)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7797701473266389229)
,p_name=>'NEW PR'
,p_static_id=>'new-pr'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--displayIcons:t-Cards--3cols:t-Cards--desc-2ln:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''Welcome'' CARD_TITLE,',
'    (',
'        SELECT',
'            CASE',
'                WHEN emp_gender = ''F'' THEN',
'                    ''<img align= "right" alt="''',
'                    || apex_escape.html_attribute(:global_emp_id)',
'                    || ''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''',
'                    || '' src=''''#APP_IMAGES#women.png'''' height = "60" width = "60"/>''',
'                ELSE',
'                    ''<img align= "right" alt="''',
'                    || apex_escape.html_attribute(:global_emp_id)',
'                    || ''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''',
'                    || '' src=''''#APP_IMAGES#profile.png'''' height = "60" width = "60"/>''',
'            END card_title',
'        FROM',
'            employees',
'        WHERE',
'                emp_bu = :global_bu',
'            AND emp_emp_id = :global_emp_id',
'    )         CARD_SUBTEXT,',
'    ( SELECT',
'             emp_first_name1',
'             || '' ''',
'             || emp_middle_name1',
'             || '' ''',
'             || emp_last_name1 emp_name',
'        FROM',
'             employees',
'       WHERE',
'             emp_bu = :global_bu',
'         AND emp_emp_id = :global_emp_id',
'            ) CARD_SUBTITLE,',
'    ''Logout''  CARD_TEXT',
'FROM',
'    dual;',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6317347974241491467)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7797702226917389236)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>70
,p_column_heading=>'Card Subtext'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7797701996126389234)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>50
,p_column_heading=>'Card Subtitle'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7797702130297389235)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Card Text'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7797701934994389233)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>40
,p_column_heading=>'Card Title'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8035881890554526140)
,p_name=>'P61_ALERT1'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8035882089195526142)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_condition_element=>'P61_ALERT1'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ALERT1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8035882153290526143)
,p_event_id=>wwv_flow_imp.id(8035882089195526142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8035881739092526139)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6634556049661689517)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P61_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6634556634363689518)
,p_event_id=>wwv_flow_imp.id(6634556049661689517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8035881981260526141)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Alert'
,p_static_id=>'alert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :GLOBAL_LOGIN_PAGE = ''61'' THEN',
'   :P61_ALERT1 := ''ALERT1'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2553920145716915113
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6634555310708689513)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'color'
,p_static_id=>'color'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' CURSOR C1',
' is',
'   SELECT * FROM mis_amt_type',
'         WHERE mat_bu = :global_bu AND mat_user = :global_user',
'         and mat_color is NOT NULL;',
'   ',
'   CR1   C1%ROWTYPE;',
'BEGIN',
'   OPEN C1;',
'   FETCH C1 into CR1;',
'    IF C1%NOTFOUND THEN',
'    INSERT INTO mis_amt_type (MAT_BU,',
'                          MAT_USER,',
'                          MAT_AMT_TYPE,',
'                          MAT_AMT_MASK,',
'                          MAT_CRE_DATE,',
'                          MAT_MASK,',
'                          MAT_MASK_COST,',
'                          MAT_MASK_EXCH,',
'                          MAT_RPT_TYPE,',
'                          MAT_COLOR,',
'                          MAT_RPT_COLOR,',
'                          MAT_RPT_FNT_COLOR)',
'     VALUES (:global_bu,',
'             :global_user,',
'             ''A'',',
'             1,',
'             SYSDATE,',
'             ''999G999G999G999G999G999G990'',',
'             ''99G99G99G99G99G99G99G99G990D00'',',
'             ''999G999G999G999G999G999G990D00000000'',',
'             ''R'',',
'             ''#0b447c'',',
'             ''#00b1e7'',',
'             ''#ffffff'');',
'',
'   COMMIT;',
'   END IF;',
'   CLOSE C1;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1152593475165078485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6634554876184689513)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_color'
,p_static_id=>'insert-color'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 3/12/2022 2:48:39 PM (QP5 v5.163.1008.3004) */',
'--raise_application_error(-20999,:GLOBAL_BU||''-''||:GLOBAL_USER);',
'DECLARE',
' CURSOR C1',
' is',
'   SELECT * FROM mis_amt_type',
'         WHERE mat_bu = :global_bu AND mat_user = :global_user;',
'   ',
'   CR1   C1%ROWTYPE;',
'BEGIN',
'   OPEN C1;',
'   FETCH C1 into CR1;',
'    IF C1%NOTFOUND THEN',
'    INSERT INTO mis_amt_type (MAT_BU,',
'                          MAT_USER,',
'                          MAT_AMT_TYPE,',
'                          MAT_AMT_MASK,',
'                          MAT_CRE_DATE,',
'                          MAT_MASK,',
'                          MAT_MASK_COST,',
'                          MAT_MASK_EXCH,',
'                          MAT_RPT_TYPE,',
'                          MAT_COLOR,',
'                          MAT_RPT_COLOR,',
'                          MAT_RPT_FNT_COLOR)',
'     VALUES (:global_bu,',
'             :global_user,',
'             ''A'',',
'             1,',
'             SYSDATE,',
'             ''999G999G999G999G999G999G990'',',
'             ''99G99G99G99G99G99G99G99G990D00'',',
'             ''999G999G999G999G999G999G990D00000000'',',
'             ''R'',',
'             ''#0b447c'',',
'             ''#00b1e7'',',
'             ''#ffffff'');',
'',
'   COMMIT;',
'   END IF;',
'   --raise_application_error(-20999,cr1.MAT_COLOR||''-''||cr1.MAT_RPT_COLOR||''-''||cr1.MAT_RPT_FNT_COLOR);',
'   CLOSE C1;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1152593040641078485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6634555650469689515)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P0_SEARCH IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :P0_SEARCH;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:P0_SEARCH;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:P0_SEARCH, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:P0_SEARCH, 1)',
'      || '',''',
'      || :app_session);',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'Raise_Application_Error(-20999,''Application not defined for the Page.'');',
'   ',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1152593814926078487
);
wwv_flow_imp.component_end;
end;
/
