prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_name=>'Events'
,p_alias=>'EVENTS'
,p_step_title=>'Events'
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
'    background: url(#APP_IMAGES#28.jpg) no-repeat;    ',
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
'    /* background: url(rmqc21/r/700/files/static/v46/balloon1.jpg) no-repeat 50% 50%; */',
'    background: url(rmqc21/r/700/files/static/v46/28.jpg) no-repeat;',
'    background-size: cover;',
'    color: indigo;',
'    font-weight: bolder;',
'    /* font-size: 20px; */',
'}',
'',
'.t-Card {',
'    transition: all .1s cubic-bezier(0, 0, 0.64, 0.13);',
'    border-radius: 19px;',
'    box-shadow: 0 3px 4px -4px rgb(0, 122, 255,1);',
'    width: calc(100% - 16px);',
'    margin: 8px;',
'}',
'',
'.t-MediaList--cols {',
'    box-shadow: -1px -1px 0 0 #e0e0e00f inset;',
'}',
'',
'------------------------------------------------------------------------------------------------------',
'/*',
'',
'.t-MediaList--cols .t-MediaList-item .t-MediaList-desc {',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'    font-style: inherit;',
'    font-family: inherit;',
'}',
'/*',
'.t-MediaList-title {',
'    font-size: 1.2rem;',
'    line-height: 1rem;',
'    font-weight: 450;',
'    font-style: inherit;',
'    font-family: inherit;',
'    color: #000000b5;',
'}',
'',
'.t-MediaList--showIcons .t-MediaList-iconWrap {',
'    display: flex;',
'    padding-right: 0px;',
'    padding-top: 4px;',
'    padding-bottom: 0px;',
'    margin-top: 1px;',
'}',
'',
'',
'.t-MediaList--cols.t-MediaList--4cols .t-MediaList-item {',
'    width: 25%;',
'    border-radius: 1px;',
'    border-color: white;',
'}*/',
'/*',
'#logo1 .t-Cards--featured .t-Card-titleWrap h3 {',
'    font-size: 1.1rem;',
'    margin-bottom: 0;',
'}',
'    ',
'',
'.t-Card-icon .t-Icon {',
'    width: 100%;',
'    height: 100%;',
'    color: slateblue;',
'    font-weight: 600;',
'    font-size: 52px;',
'    background: white;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    border-radius: 0px;',
'}',
'*/'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7178011407019983696)
,p_plug_name=>'<b>Past Events</b>'
,p_static_id=>'b-past-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7178010660052983688)
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
 p_id=>wwv_flow_imp.id(7178011865417983700)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7178011783442983699)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7178011531954983697)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7178011627297983698)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7178010719402983689)
,p_plug_name=>'<b>Upcoming Events</b>'
,p_static_id=>'b-upcoming-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7178010660052983688)
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
'       ''<table>',
'      <colgroup>',
'        <col span="50">',
'         <col >',
'      </colgroup>',
'      <tr class="colm">',
'              <th class="thh">Line</th>',
'      </tr>',
'      <tr *ngFor="let item of details" class="colm">',
'              <td class="th"style="color: #253979;"  </td>',
'              <td class="th"><b> {{emp_first_name1}} </b></td>',
'      </tr>',
'    </table>'' card',
'      -- listagg (emp_first_name1|| '' (''||emp_emp_id||'') : ''|| TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'     --   card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       ''<table>',
'      <colgroup>',
'        <col span="50">',
'         <col >',
'      </colgroup>',
'      <tr class="colm">',
'              <th class="thh">Line</th>',
'      </tr>',
'      <tr *ngFor="let item of details" class="colm">',
'              <td class="th"style="color: #253979;"  </td>',
'              <td class="th"><b> {{emp_first_name1}} </b></td>',
'      </tr>',
'    </table>'' card',
'      -- listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'       -- card',
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
 p_id=>wwv_flow_imp.id(6353560575616026798)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6353560446945026797)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6353560318281026795)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6353560394563026796)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6550689711465365391)
,p_name=>'Birthdays'
,p_static_id=>'birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6946565597810886134)
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
'                 ''||'' src = "''||apex_util.get_blob_file_src(''P25_EMPIMG_IMAGE'', employee_images.rowid)||''" height = "10px!important" width = "10px!important" />'')   ',
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
 p_id=>wwv_flow_imp.id(6353630014472148979)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353630404925148981)
,p_query_column_id=>3
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353630752341148982)
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
 p_id=>wwv_flow_imp.id(6353631563385148982)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353631172570148982)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6946564759456886125)
,p_name=>'Birthdays'
,p_static_id=>'birthdays-2'
,p_parent_plug_id=>wwv_flow_imp.id(6946565597810886134)
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
 p_id=>wwv_flow_imp.id(6353633881708148989)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353633102038148989)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353632679393148987)
,p_query_column_id=>3
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353633450602148989)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6946566451706886142)
,p_name=>'Birthdays'
,p_static_id=>'birthdays-3'
,p_parent_plug_id=>wwv_flow_imp.id(6946566376997886141)
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
 p_id=>wwv_flow_imp.id(6353647638468149036)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353646887959149034)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353647288920149034)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353646437508149032)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6974161039018685165)
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
 p_id=>wwv_flow_imp.id(16447410700414775422)
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
 p_id=>wwv_flow_imp.id(11405723142248402491)
,p_plug_name=>'Hi ,&P25_EMP_NAME.<br><font color="#34495e"  size="2px">&APP_USER.</font>'
,p_static_id=>'hi-p25-emp-name-br-font-color-34495e-size-2px-app-user-font'
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
 p_id=>wwv_flow_imp.id(10868459362470077122)
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
 p_id=>wwv_flow_imp.id(6353611348956148900)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>2
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353610604650148896)
,p_query_column_id=>1
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Card Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353611802152148900)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card Subtitle'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353610935380148898)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7248538924609657365)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
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
 p_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(11731815075115443523)
,p_plug_name=>'&P25_EMP_NAME.'
,p_static_id=>'p25-emp-name'
,p_parent_plug_id=>wwv_flow_imp.id(11731815003538443522)
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
 p_id=>wwv_flow_imp.id(6946564669058886124)
,p_plug_name=>'Past Events'
,p_static_id=>'past-events'
,p_parent_plug_id=>wwv_flow_imp.id(7178010660052983688)
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
 p_id=>wwv_flow_imp.id(6946566376997886141)
,p_plug_name=>'Past Tab'
,p_static_id=>'past-tab'
,p_parent_plug_id=>wwv_flow_imp.id(6946564669058886124)
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
 p_id=>wwv_flow_imp.id(11405723202041402492)
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
 p_id=>wwv_flow_imp.id(6353614734675148917)
,p_query_column_id=>3
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>3
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353614380260148915)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353614014278148915)
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
 p_id=>wwv_flow_imp.id(6353615617548148917)
,p_query_column_id=>5
,p_column_alias=>'PAGE_NO'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353615196832148917)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11731815003538443522)
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
 p_id=>wwv_flow_imp.id(7280006181592044132)
,p_name=>'Recent Birthdays'
,p_static_id=>'recent-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353623606211148953)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353623193235148953)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353622797237148951)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7280006572350044136)
,p_name=>'Recent Wedding Anniversary'
,p_static_id=>'recent-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353625041990148956)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353624637907148956)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353624292088148954)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7292326314541585290)
,p_name=>'Recent Work Anniversary'
,p_static_id=>'recent-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353626560151148961)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353625746916148959)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353626165763148961)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7252629735758982657)
,p_name=>'Today Birthday'
,p_static_id=>'today-birthday'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_column=>10
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   count(EMP_FIRST_NAME1 )LIST_BADGE,''Birthday'' LIST_TITLE,',
'      null LIST_TEXT,null ICON_CLASS',
'      FROM employees',
'     WHERE EMP_BU = :GLOBAL_BU ',
'           AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  = TO_CHAR (',
'                                                           TRUNC (',
'                                                              TO_DATE (SYSDATE)),',
'                                                           ''MMDD'')',
'UNION ALL',
'  SELECT  count(EMP_FIRST_NAME1 )LIST_BADGE,  ''Wedding Anniversary''   LIST_TITLE,',
'   null LIST_TEXT,null ICON_CLASS',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'UNION ALL',
'SELECT count(EMP_FIRST_NAME1)LIST_BADGE, ''Work Anniversary'' LIST_TITLE,',
'  null LIST_TEXT,null ICON_CLASS',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD'')',
'--ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353561408830026806)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353561322324026805)
,p_query_column_id=>1
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>40
,p_column_heading=>'List Badge'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353561043868026803)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353561002584026802)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7252630095611982660)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-2'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7252718512940376874)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-3'
,p_parent_plug_id=>wwv_flow_imp.id(7252630095611982660)
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
 p_id=>wwv_flow_imp.id(7252627475021982634)
,p_name=>'TodayWedding'
,p_static_id=>'todaywedding'
,p_parent_plug_id=>wwv_flow_imp.id(7252630237992982662)
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
 p_id=>wwv_flow_imp.id(6353651628060149056)
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
 p_id=>wwv_flow_imp.id(7252630392054982663)
,p_plug_name=>'TodayWedding'
,p_static_id=>'todaywedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(7252630237992982662)
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
 p_id=>wwv_flow_imp.id(7168625759021689562)
,p_name=>'Upcoming Birthdays'
,p_static_id=>'upcoming-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353620532840148942)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353620202735148942)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353619799780148940)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7178010660052983688)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
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
 p_id=>wwv_flow_imp.id(6946564488638886123)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events-2'
,p_parent_plug_id=>wwv_flow_imp.id(7178010660052983688)
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
 p_id=>wwv_flow_imp.id(6946565597810886134)
,p_plug_name=>'Upcoming Tab'
,p_static_id=>'upcoming-tab'
,p_parent_plug_id=>wwv_flow_imp.id(6946564488638886123)
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
 p_id=>wwv_flow_imp.id(7252645030793983790)
,p_name=>'Upcoming Wedding Anniversary'
,p_static_id=>'upcoming-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353622123976148946)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353621670255148946)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353621325379148946)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7252645965721983800)
,p_name=>'Upcoming Work Anniversary'
,p_static_id=>'upcoming-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7168626215310689566)
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
 p_id=>wwv_flow_imp.id(6353628040013148967)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353627292042148965)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353627683114148965)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7252630237992982662)
,p_plug_name=>'Wedding'
,p_static_id=>'wedding'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
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
 p_id=>wwv_flow_imp.id(6946564816323886126)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6946565597810886134)
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
 p_id=>wwv_flow_imp.id(6353635785070148996)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>40
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353635026052148995)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353634599277148993)
,p_query_column_id=>3
,p_column_alias=>'EMP_FIRST_NAME1'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353635381076148995)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6946566753029886145)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(6946566376997886141)
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
 p_id=>wwv_flow_imp.id(6353643880792149028)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353643031752149028)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353643515292149028)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353642723431149026)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6946565052194886128)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6946565597810886134)
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
 p_id=>wwv_flow_imp.id(6353637633998149000)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353636928209148998)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353637262687149000)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353636465539148998)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_column_heading=>'Name1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6946567034453886148)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(6946566376997886141)
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
 p_id=>wwv_flow_imp.id(6353645769277149031)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>30
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353645005832149029)
,p_query_column_id=>4
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353645360862149031)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6353644621149149029)
,p_query_column_id=>1
,p_column_alias=>'NAME1'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7252684341415204721)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-3'
,p_parent_plug_id=>wwv_flow_imp.id(6974161039018685165)
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
 p_id=>wwv_flow_imp.id(7252628385244982643)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7252684341415204721)
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
 p_id=>wwv_flow_imp.id(6353648648407149039)
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
 p_id=>wwv_flow_imp.id(7252630707997982667)
,p_plug_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7252684341415204721)
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
 p_id=>wwv_flow_imp.id(6353616430148148921)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11731815075115443523)
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
 p_id=>wwv_flow_imp.id(6353616839516148923)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11731815075115443523)
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
 p_id=>wwv_flow_imp.id(6353612849213148907)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11405723142248402491)
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
 p_id=>wwv_flow_imp.id(6353632015606148984)
,p_name=>'P25_EMPIMG_IMAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6550689711465365391)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6353613270443148911)
,p_name=>'P25_EMP_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11405723142248402491)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6353612186258148900)
,p_name=>'P25_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10868459362470077122)
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
 p_id=>wwv_flow_imp.id(6353617297886148925)
,p_name=>'P25_NEW_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11731815075115443523)
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
 p_id=>wwv_flow_imp.id(6353618337120148932)
,p_name=>'P25_NODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16447410700414775422)
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
 p_id=>wwv_flow_imp.id(6353618801058148932)
,p_name=>'P25_NODE_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16447410700414775422)
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
 p_id=>wwv_flow_imp.id(6353618012002148926)
,p_name=>'P25_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16447410700414775422)
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
 p_id=>wwv_flow_imp.id(6353653064602149062)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6353653583737149064)
,p_event_id=>wwv_flow_imp.id(6353653064602149062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6353652686333149061)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Employee_Name'
,p_static_id=>'employee-name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'   SELECT emp_first_name1',
'     INTO :p25_emp_name',
'     FROM employees',
'    WHERE emp_bu=:global_bu',
'      AND emp_emp_id = :global_emp_id;',
'    ',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>871690850789538033
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6353652312307149059)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p25_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p25_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p25_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p25_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p25_search, 1)',
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
,p_internal_uid=>871690476763538031
);
wwv_flow_imp.component_end;
end;
/
