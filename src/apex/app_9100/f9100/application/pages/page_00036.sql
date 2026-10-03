prompt --application/pages/page_00036
begin
--   Manifest
--     PAGE: 00036
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
 p_id=>36
,p_name=>'Events(Last Copy)'
,p_alias=>'EVENTS-LAST-COPY'
,p_step_title=>'Events(Last Copy)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-HeroRegion-title {',
'    font-size: 1.5rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'    color: #5C6BC0;',
'}',
'',
'.t-HeroRegion-wrap {',
'    padding: 16px;',
'    display: flex;',
'    padding-bottom: 0px;',
'    flex-direction: row;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 500;',
'}',
'',
'a {',
'    color: #000000;',
'}',
'',
'.t-HeroRegion--featured.t-HeroRegion--centered .t-HeroRegion-wrap {',
'    flex-direction: column;',
'    text-align: center;',
'    background: url(#APP_IMAGES#profilebg3.png);   ',
'    background-size: contain;',
'}',
'',
'',
'.t-Button--simple.t-Button--hot {',
'    box-shadow: 0 0 0 0px #5C6BC0 inset;',
'    background-color: #5C6BC0;',
'}',
'',
'.t-Button, .a-Button, .ui-button {',
'    border: none;',
'    text-shadow: none;',
'    border-radius: 4px;',
'    transition: background-color 0.2s ease, box-shadow 0.2s ease, color 0.2s ease;',
'}',
'',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input + label, .apex-button-group input + label, .t-Button:not(.t-Button--simple), .ui-button, .a-Button, .a-Button.a-Button--popupLOV, .a-IG-button.a-IG-button--controls {',
'',
'    box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.125) inset;',
'}',
'',
'',
'/*BADGE*/',
'.a-DetailedContentList-badge {',
'    -webkit-text-overflow: ellipsis;',
'    -moz-text-overflow: ellipsis;',
'    -ms-text-overflow: ellipsis;',
'    -o-text-overflow: ellipsis;',
'    text-align: right;',
'    font-size: 15px;',
'    color: #004e61;',
'    white-space: nowrap;',
'    padding-right: 12px;',
'    width: 15%;',
'    font-weight: bolder;',
'}',
'.a-DetailedContentList-title {',
'    width: 90%;',
'    font-size: 14px;',
'    font-weight: 400;',
'    color: #404040;',
'    padding-left: 12px;',
'    font-weight: bolder;',
'}',
'body .a-DetailedContentList-icon {',
'    width: 1%;',
'    text-align: center;',
'    color: #004e61;',
'    padding-left: 12px;',
'    height: 40px;',
'    vertical-align: middle;',
'}',
'/*ANIM*/',
'/*',
'.t-Region-header {',
'    border-bottom-color: rgba(0, 0, 0, 0.075);',
'    background-color: #c0effb;//#efc13a;',
'    color: #262626;',
'}*/',
'',
'.t-Region-header {',
'    border-bottom-color: rgba(0, 0, 0, 0.075);',
'    color: #5c1e03;',
'    font-weight: bolder;',
'}',
'.t-Report-colHead {',
'    font-size: 1.2rem;',
'    line-height: 1.6rem;',
'    border-right-width: 0;',
'    background: pink;',
'}',
'',
'#rpt a {',
'    color: white;',
'}',
'',
'',
'/*BG*/',
'body {',
'   /* background: url(#APP_IMAGES#balloon1.jpg) no-repeat 50% 50%;*/',
' //   background: url(#APP_IMAGES#profilebg3.png) no-repeat;    ',
'    background-size: cover;',
'    color: #242424;',
' /*   font-weight: bolder;*/',
'',
'',
'}',
'.t-BadgeList--dash .t-BadgeList-label {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'    font-weight: bolder;',
'}',
'',
'.a-DetailedContentList-body-row-content {',
'    color: #2bb31b;',
'    /* font-size: larger; */',
'    font-weight: bold;',
'    font-style: inherit;',
'    font-size: 12px;',
'}',
'',
'',
'.a-DetailedContentList-title {',
'    width: 90%;',
'    font-size: 14px;',
'    font-weight: 400;',
'    color: blue;',
'    padding-left: 12px;',
'    font-weight: bolder;',
'    font-style: inherit;',
'}',
'',
'body {',
'    /* background: url(rmqc21/r/700/files/static/v46/balloon1.jpg) no-repeat 50% 50%; #APP_IMAGES#bottom.gif  rmqc21/r/700/files/static/v46/#APP_IMAGES#profilebg3.png*/',
'    background: url(#APP_IMAGES#CAke.jpg) no-repeat;',
'     background-size: cover;',
'   /* color: indigo;',
' /*   font-weight: bolder;',
'     font-size: 20px; */',
'}',
'',
'',
'',
'',
'element.style {',
'    color: #ffffff;',
'    font-weight: bolder;',
'    font-size: 16px;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7708676133359289368)
,p_plug_name=>'<b>Past Events</b>'
,p_static_id=>'b-past-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7708675386392289360)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_display_column=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Past Birthdays'' label,',
'       COUNT (*) VALUE,',
'       ''fa-birthday-cake'' AS icon,',
'       listagg (emp_first_name1|| '' (''||emp_emp_id||'') : ''|| TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708676591757289372)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708676509782289371)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708676258294289369)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708676353637289370)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7708675445742289361)
,p_plug_name=>'<b>Upcoming Events</b>'
,p_static_id=>'b-upcoming-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7708675386392289360)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_column=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       COUNT (*) VALUE,',
'       ''fa-birthday-cake'' AS icon,',
'       listagg (emp_first_name1|| '' (''||emp_emp_id||'') : ''|| TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708675936397289366)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708675845450289365)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708675650333289363)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7708675798025289364)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7081354437804671063)
,p_name=>'Birthdays'
,p_static_id=>'birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7477230324150191806)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--3cols:t-MediaList--iconsSquare:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' LIST_TITLE,TO_CHAR (emp_dob, ''MON - DD'') LIST_TEXT,emp_first_name1  Emp_name,emp_emp_id,',
'(NVL((DECODE(NVL(dbms_lob.getlength(EMPIMG_IMAGE),0),0,null,',
'                ''<img alt="''||apex_escape.html_attribute(EMPIMG_BU)||''',
'                          "style="border: 0px; border-radius: "20px!important""',
'                 ''||'' src = "''||apex_util.get_blob_file_src(''P36_EMPIMG_IMAGE'', employee_images.rowid)||''" height = "10px!important" width = "10px!important" />'')   ',
'          ), ( case when  EMP_GENDER=''F'' THEN  ''<img src=''''#APP_IMAGES#user.png''''>''',
'                          ELSE  ''<img src=''''#APP_IMAGES#user.png''''>'' END ',
'                )))            AS LIST_ICON',
'  FROM employees,EMPLOYEE_IMAGES',
' WHERE emp_bu = :global_bu',
' AND   emp_bu =EMPIMG_BU (+)',
'AND  emp_emp_id = EMPIMG_EMP_ID (+)',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 1),',
'                                                        ''MMDD'')',
'                                                 AND TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 7),',
'                                                        ''MMDD'')'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192103993435117242)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192103620469117242)
,p_query_column_id=>3
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192104422693117242)
,p_query_column_id=>5
,p_column_alias=>'LIST_ICON'
,p_column_display_sequence=>50
,p_column_heading=>'List Icon'
,p_column_format=>'PCT_GRAPH:#f8a9a9::'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192103167976117241)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192102736298117241)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477229485796191797)
,p_name=>'Birthdays'
,p_static_id=>'birthdays-2'
,p_parent_plug_id=>wwv_flow_imp.id(7477230324150191806)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') dob,emp_first_name1  Emp_name,emp_emp_id ',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 1),',
'                                                        ''MMDD'')',
'                                                 AND TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 7),',
'                                                        ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192105853456117250)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192106654401117253)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192106327063117253)
,p_query_column_id=>3
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192105468665117249)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477231178046191814)
,p_name=>'Birthdays'
,p_static_id=>'birthdays-3'
,p_parent_plug_id=>wwv_flow_imp.id(7477231103337191813)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name1,TO_CHAR (emp_dob, ''MON - DD'') dob,',
'emp_first_name1 Name ,emp_emp_id ID',
' FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192112228388117264)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192112979561117264)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192112545294117264)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192111827754117263)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7504825765357990837)
,p_plug_name=>'Body'
,p_static_id=>'body'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16978075426754081094)
,p_plug_name=>'Find Menu'
,p_static_id=>'find-menu'
,p_region_name=>'SRCH7'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11936387868587708163)
,p_plug_name=>'Hi ,&P36_EMP_NAME.<br><font color="#34495e"  size="2px">&APP_USER.</font>'
,p_static_id=>'hi-p36-emp-name-br-font-color-34495e-size-2px-app-user-font'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--featured t-HeroRegion--centered:t-HeroRegion--hideIcon:t-HeroRegion--iconsCircle'
,p_plug_template=>wwv_flow_imp.id(11196068840915939571)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_plug_customized=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11399124088809382794)
,p_name=>'Menu'
,p_static_id=>'menu'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--featured t-Cards--block force-fa-lg:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''f?p=''||nvl(701,''&APP_ID.'')||'':''||''erp_fin''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'       ''Finance''CARD_TITLE,',
'       ''fa-dollar'' CARD_ICON,',
'       ''Finance Entry Screen and Report Details''  CARD_SUBTITLE',
'  FROM DUAL ',
'UNION ALL',
'SELECT ''f?p=''||nvl(702,''&APP_ID.'')||'':''||''erp_scm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'        ''Supply Chain Management''CARD_TITLE,',
'       ''fa-users'' CARD_ICON,',
'       ''SCM Entry Screen and Report Details''',
'  FROM DUAL',
'UNION ALL',
'SELECT ''f?p=''||nvl(703,''&APP_ID.'')||'':''||''erp_pmf''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'         ''Planning and Manufacturing''CARD_TITLE,',
'       ''fa-code-fork'' CARD_ICON,',
'       ''PMF Entry Screen and Report Details''',
'  FROM DUAL',
' UNION ALL',
' SELECT ''f?p=''||nvl(704,''&APP_ID.'')||'':''||''erp_hrm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'        ''Human Resources / Payroll''CARD_TITLE,',
'       ''fa-users'' CARD_ICON,',
'       ''HR Entry Screen and Report Details''',
'  FROM DUAL'))
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
 p_id=>wwv_flow_imp.id(6192135456564117311)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>2
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192134660916117310)
,p_query_column_id=>1
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Card Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192135848829117311)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card Subtitle'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192135077831117311)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779203650948963037)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(7504825765357990837)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:2.0em;color:#096640;">Events</b><center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7699290941649995238)
,p_plug_name=>'Overall'
,p_static_id=>'overall'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'23=5'
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12262479801454749195)
,p_plug_name=>'&P36_EMP_NAME.'
,p_static_id=>'p36-emp-name'
,p_parent_plug_id=>wwv_flow_imp.id(12262479729877749194)
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>wwv_flow_imp.id(11196068840915939571)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7477229395398191796)
,p_plug_name=>'Past Events'
,p_static_id=>'past-events'
,p_parent_plug_id=>wwv_flow_imp.id(7708675386392289360)
,p_icon_css_classes=>'fa-calendar-clock'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7477231103337191813)
,p_plug_name=>'Past Tab'
,p_static_id=>'past-tab'
,p_parent_plug_id=>wwv_flow_imp.id(7477229395398191796)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11936387928380708164)
,p_name=>'Profile'
,p_static_id=>'profile'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--horizontal:t-MediaList--iconsRounded'
,p_display_point=>'REGION_POSITION_03'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT list_title, list_text, ''fa '' || icon_class icon_class,TYPE,page_no',
'  FROM (SELECT ''Approvals - ''||:GLOBAL_APPR_CNT list_title, NULL list_text,  ''fa-clipboard-list'' icon_class,''APPR'' TYPE,236131010 page_no FROM DUAL WHERE :GLOBAL_APPR_CNT<>0',
'        UNION ALL',
'        SELECT ''Tasks - ''||:GLOBAL_TASK_CNT list_title,',
'               NULL list_text,',
'               ''fa-clipboard-check-alt'' icon_class,''TASK'' TYPE,5 page_no',
'          FROM DUAL       WHERE :GLOBAL_TASK_CNT<>0     ',
'        UNION ALL',
'        SELECT ''Messages - ''||:GLOBAL_MSG_CNT, NULL, ''fa-comments'' icon,''MSG'',5 FROM DUAL         WHERE :GLOBAL_MSG_CNT<>0',
'        UNION ALL',
'        SELECT ''Notifications - ''||:GLOBAL_NOT_CNT, NULL, ''fa-bullhorn'' icon,''NOTIFY'',5 FROM DUAL WHERE :GLOBAL_NOT_CNT<>0',
'        UNION ALL',
'        SELECT ''Mail Unsent - ''||:GLOBAL_MAIL_UNSENT_CNT, NULL, ''fa-envelope-o fam-x fam-is-danger'' icon,''MUN'',5 FROM DUAL WHERE :GLOBAL_MAIL_UNSENT_CNT<>0',
'        UNION ALL',
'        SELECT ''SMS Unsent - ''||:GLOBAL_SMS_UNSENT_CNT, NULL, ''fa-mobile fam-x fam-is-danger'' icon,''SUN'',5 FROM DUAL WHERE :GLOBAL_SMS_UNSENT_CNT<>0)'))
,p_display_condition_type=>'NEVER'
,p_customized=>'1'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192138835442117321)
,p_query_column_id=>3
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>3
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192138441544117319)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192138085560117319)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_column_link=>'f?p=&APP_ID.:#PAGE_NO#:&SESSION.::&DEBUG.::P5_TYPE:#TYPE#'
,p_column_linktext=>'#LIST_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192139722475117324)
,p_query_column_id=>5
,p_column_alias=>'PAGE_NO'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192139271202117321)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12262479729877749194)
,p_plug_name=>'Profile'
,p_static_id=>'profile-2'
,p_region_name=>'PROFILE'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:margin-top-none:margin-bottom-none:margin-left-none'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7810670907931349804)
,p_name=>'Recent Birthdays'
,p_static_id=>'recent-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOB,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU --AND SE_EMP_STATUS = ''A''',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Birthdays.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'Upcoming'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192130966369117303)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192130624678117303)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192130154633117302)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7810671298689349808)
,p_name=>'Recent Wedding Anniversary'
,p_static_id=>'recent-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--accent2:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1|| '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOM,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT         ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Wedding Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192132484623117307)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192132060495117305)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192131724357117305)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7822991040880890962)
,p_name=>'Recent Work Anniversary'
,p_static_id=>'recent-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_start_date || '' ('' || TRUNC ( (SYSDATE - emp_start_date) / 365) || '' yrs)'' CARD_TEXT, ',
'       EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'       NULL CARD_SUBTEXT',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'')   BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY TRUNC ( (SYSDATE - emp_start_date) / 365) asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Work Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192134009076117308)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192133162076117307)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192133543516117308)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783294821951288332)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday'
,p_parent_plug_id=>wwv_flow_imp.id(7504825765357990837)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7783294462098288329)
,p_name=>'Today Birthday'
,p_static_id=>'today-birthday-2'
,p_parent_plug_id=>wwv_flow_imp.id(7783294821951288332)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT   count(EMP_FIRST_NAME1 )     "Birthday"    ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192121827316117285)
,p_query_column_id=>1
,p_column_alias=>'Birthday'
,p_column_display_sequence=>1
,p_column_heading=>'Birthday'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Birthday#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783383239279682546)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-3'
,p_parent_plug_id=>wwv_flow_imp.id(7783294821951288332)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT   EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID     CARD_TITLE    ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY EMP_FIRST_NAME1 asc /*to_char(EMP_DOB,''DDMM'') asc*/'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'CARD_TITLE')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7783292201361288306)
,p_name=>'TodayWedding'
,p_static_id=>'todaywedding'
,p_parent_plug_id=>wwv_flow_imp.id(7783294964332288334)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  count(EMP_FIRST_NAME1 )  "Wedding Anniversary"       ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Data Found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192123060384117288)
,p_query_column_id=>1
,p_column_alias=>'Wedding Anniversary'
,p_column_display_sequence=>1
,p_column_heading=>'Wedding anniversary'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Wedding Anniversary#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783295118394288335)
,p_plug_name=>'TodayWedding'
,p_static_id=>'todaywedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(7783294964332288334)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1  || '' - ''  || EMP_EMP_ID   EMP_FIRST_NAME1   ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY EMP_FIRST_NAME1 /*to_char(EMP_DOM,''DDMM'') asc*/'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'EMP_FIRST_NAME1')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7699290485360995234)
,p_name=>'Upcoming Birthdays'
,p_static_id=>'upcoming-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--5cols:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOB,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU --AND SE_EMP_STATUS = ''A''',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'') BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Birthdays.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'Upcoming'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192126475692117294)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192126094409117294)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192125672563117294)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7708675386392289360)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(7504825765357990837)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7477229214978191795)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events-2'
,p_parent_plug_id=>wwv_flow_imp.id(7708675386392289360)
,p_icon_css_classes=>'fa-calendar-o'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7477230324150191806)
,p_plug_name=>'Upcoming Tab'
,p_static_id=>'upcoming-tab'
,p_parent_plug_id=>wwv_flow_imp.id(7477229214978191795)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7783309757133289462)
,p_name=>'Upcoming Wedding Anniversary'
,p_static_id=>'upcoming-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--accent2:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1|| '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOM,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT         ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'') BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Wedding Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192127954231117297)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192127619171117296)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192127229038117296)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7783310692061289472)
,p_name=>'Upcoming Work Anniversary'
,p_static_id=>'upcoming-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7699290941649995238)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_start_date || '' ('' || TRUNC ( (SYSDATE - emp_start_date) / 365) || '' yrs)'' CARD_TEXT, ',
'       EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'       NULL CARD_SUBTEXT',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'')  BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY TRUNC ( (SYSDATE - emp_start_date) / 365) asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Work Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192128634998117300)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192129064931117300)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192129487793117300)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783294964332288334)
,p_plug_name=>'Wedding'
,p_static_id=>'wedding'
,p_parent_plug_id=>wwv_flow_imp.id(7504825765357990837)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477229542663191798)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7477230324150191806)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') day,',
'emp_first_name1,emp_emp_id',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 1),',
'                                                        ''MMDD'')',
'                                                 AND TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 7),',
'                                                        ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192107735961117257)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>40
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192108603740117258)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192108209140117257)
,p_query_column_id=>3
,p_column_alias=>'EMP_FIRST_NAME1'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192107368261117255)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477231479369191817)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7477231103337191813)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name1,TO_CHAR (emp_dob, ''MON - DD'') day,',
'emp_first_name1 Name ,emp_emp_id ID',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192114049555117267)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192114862848117269)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192114449346117267)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192113657221117266)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477229778534191800)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7477230324150191806)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1|| '' (''|| emp_emp_id|| '') '' name1,TO_CHAR (emp_dob, ''MON - DD'') day,',
'emp_first_name1 Name ,emp_emp_id ID',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (',
'                                                       TRUNC (',
'                                                          TO_DATE (SYSDATE)',
'                                                          + 1),',
'                                                       ''MMDD'')',
'                                                AND TO_CHAR (',
'                                                       TRUNC (',
'                                                          TO_DATE (SYSDATE)',
'                                                          + 7),',
'                                                       ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192109660409117260)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192110481346117261)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192110051651117260)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192109270998117260)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_column_heading=>'Name1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7477231760793191820)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7477231103337191813)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1|| '' (''|| emp_emp_id|| '') '' name1,TO_CHAR (emp_dob, ''MON - DD'') day,',
'emp_first_name1 Name ,emp_emp_id ID',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192115988460117271)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192116734891117272)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192116431895117271)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192115579660117271)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783349067754510393)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-3'
,p_parent_plug_id=>wwv_flow_imp.id(7504825765357990837)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7783293111584288315)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7783349067754510393)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(EMP_FIRST_NAME1) "Work Anniversary"',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD'')',
'--ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Data Found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192124335226117291)
,p_query_column_id=>1
,p_column_alias=>'Work Anniversary'
,p_column_display_sequence=>1
,p_column_heading=>'Work anniversary'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Work Anniversary#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7783295434337288339)
,p_plug_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7783349067754510393)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1 || '' - '' || emp_emp_id || ''('' || yrs || '' Yrs)'' name',
'  FROM (SELECT emp_first_name1,',
'               TRUNC ( (SYSDATE - emp_start_date) / 365) yrs,',
'               emp_emp_id',
'          FROM employees',
'         WHERE emp_bu = :global_bu',
'               AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'               AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD''))',
'               order by EMP_FIRST_NAME1  asc'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'NAME')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192140713041117325)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12262479801454749195)
,p_button_name=>'Access'
,p_static_id=>'access'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Access Details'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192141068669117325)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12262479801454749195)
,p_button_name=>'CHNG_PSW'
,p_static_id=>'chng-psw'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Password'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192136940301117314)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11936387868587708163)
,p_button_name=>'Profile'
,p_static_id=>'profile'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Profile'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192104764608117244)
,p_name=>'P36_EMPIMG_IMAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7081354437804671063)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192137342744117317)
,p_name=>'P36_EMP_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11936387868587708163)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192136258115117311)
,p_name=>'P36_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11399124088809382794)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''https://mis.roadmaperp.com/apex/f?p=''||nvl(702,''&APP_ID.'')||'':''||''erp_scm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE:GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK',
'  FROM DUAL ',
'  '))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192141524949117327)
,p_name=>'P36_NEW_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12262479801454749195)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192142563147117335)
,p_name=>'P36_NODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16978075426754081094)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192143025660117335)
,p_name=>'P36_NODE_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16978075426754081094)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6192142211424117330)
,p_name=>'P36_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16978075426754081094)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SEARCH'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-flashlight'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192144133745117341)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192144730130117344)
,p_event_id=>wwv_flow_imp.id(6192144133745117341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192143778378117341)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Employee_Name'
,p_static_id=>'employee-name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'   SELECT emp_first_name1',
'     INTO :p36_emp_name',
'     FROM employees',
'    WHERE emp_bu=:global_bu',
'      AND emp_emp_id = :global_emp_id;',
'    ',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>710181942834506313
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192143429049117339)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p36_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p36_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p36_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p36_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p36_search, 1)',
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
,p_internal_uid=>710181593505506311
);
wwv_flow_imp.component_end;
end;
/
