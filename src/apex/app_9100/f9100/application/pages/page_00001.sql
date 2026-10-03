prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Events'
,p_alias=>'EVENTS1'
,p_step_title=>'Events'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region .t-Region-body {',
'    padding: 1px;',
'}',
'',
'#ANMT .t-MediaList-body {',
'    padding: 7px;',
'}',
'',
'/*#ANMT .t-MediaList--showIcons .t-MediaList-icon {',
'    width: 66px;',
'    height: 51px;',
'    background-color: #badbfb70;',
'    color: #ffffff;',
'     color: inherit;',
'     text-align: center;',
'    display: flex;',
'    justify-content: center;',
'    border-radius: 7px;',
'}*/',
'',
'#ANMT .t-MediaList--showIcons .t-MediaList-icon {',
'    width: 90px;',
'    height: 39px;',
'    background-color: #badbfb70;',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #ffffff;',
'    color: inherit;',
'    text-align: center;',
'    display: flex;',
'    justify-content: center;',
'    border-radius: 7px;',
'}',
'',
'#DOB .u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #50bcf74a;',
'    fill: #309FDB;',
'    color: #1d80d4;',
'    border-radius: 31px;',
'}',
'',
'#DOB .t-BadgeList--dash .t-BadgeList-wrap:focus-within, .t-BadgeList--circular .t-BadgeList-value a:hover {',
'    background-color: #50bcf74a !important;',
'    color: #1d80d4 !important;',
'}',
'',
'#WAL .u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #30db4030;',
'    fill: #309FDB;',
'    color: #2a7528;',
'    border-radius: 31px;',
'}',
'#WAL .t-BadgeList--dash .t-BadgeList-wrap:focus-within, .t-BadgeList--circular .t-BadgeList-value a:hover {',
'    background-color: #30db4030 !important;',
'    color: #2a7528 !important;',
'}',
'',
'#worka .u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #6d30db33;',
'    fill: #309FDB;',
'    color: #4c2267;',
'    border-radius: 31px;',
'}',
'',
'#worka .t-BadgeList--dash .t-BadgeList-wrap:focus-within, .t-BadgeList--circular .t-BadgeList-value a:hover {',
'    background-color: #6d30db33 !important;',
'    color: #4c2267 !important;',
'}',
'',
'.t-MediaList-badge {',
'    color: #2a7ba9;',
'    background-color: #fafafa;',
'}',
'',
'#padhd3 .t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    /*background-color: #e0d4f6;*/',
'    color: #3a1867;',
'    padding: 3px;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'#padhd1 .t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    /*background-color: #abd8f0;*/',
'    color: #0f3f67;',
'    padding: 3px;',
'    display: flex;',
'    align-items: center;',
'}',
'#padhd2 .t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    /*background-color: #d6f6d9;*/',
'    color: #195d2d;',
'    padding: 3px;',
'    display: flex;',
'    align-items: center;',
'}',
'#ANMT .t-MediaList-title {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'    font-weight: 700;',
'    color: #443afd;',
'}',
'',
'',
'#padhd3 .t-Button:not(.t-Button--simple):hover{',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;',
'}',
'',
' #padhd3 .t-Button:not(.t-Button--simple){',
'    color: #7f6005;',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset;',
'}',
'',
'#padhd1 .t-Button:not(.t-Button--simple):hover{',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;',
'}',
'',
' #padhd1 .t-Button:not(.t-Button--simple){',
'    color: #7f6005;',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset;',
'}',
'',
'#padhd2 .t-Button:not(.t-Button--simple):hover{',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;',
'}',
'',
' #padhd2 .t-Button:not(.t-Button--simple){',
'    color: #7f6005;',
'    background-color: #f9ecc8;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset;',
'}',
'',
'body {',
'    background-color: #FDFDFD;',
'    color: #0376af;',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502384203254095579)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_name=>'ANMT'
,p_parent_plug_id=>wwv_flow_imp.id(6286358979564519929)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_component_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc:t-MediaList--stack:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE ,',
'       ''fa fa-calendar'' LIST_ICON_VALUE,',
'        to_char(GN_DOC_DATE,''MON DD YY HH:MI'')   icon_class  ,',
'       GN_NOTI_HD list_title,',
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
'                btnText.innerHTML = "Read more"; ',
'                moreText.style.display = "none";',
'            } else {',
'                dots.style.display = "none";',
'                btnText.innerHTML = "Read less"; ',
'                moreText.style.display = "inline";',
'            }',
'            }',
'            </script>''',
'|| ''<div class="a"><SPAN STYLE="font-size:11px;  font-family:verdana"> ''',
'||',
'CASE',
'    WHEN length(initcap(GN_NOTI)) > 50 THEN',
'            substr(initcap(GN_NOTI), 1, 50)',
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
'        GN_NOTI',
'END',
'|| ''</SPAN></DIV>'' list_text,',
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
' --WHERE GN_BU = :global_bu',
'--   AND trunc(sysdate) BETWEEN trunc(gn_eff_from) AND trunc(gn_eff_to)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192168961643121580)
,p_query_column_id=>24
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>220
,p_column_heading=>'Gn Attach'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192162142679121572)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192164972230121575)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192166225095121577)
,p_query_column_id=>17
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192168201870121578)
,p_query_column_id=>22
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Cre Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192165375101121575)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Cre Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192165806881121577)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192170576979121583)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>280
,p_column_heading=>'Gn Doc Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192162552034121572)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192163824771121574)
,p_query_column_id=>11
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Due Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192170155697121583)
,p_query_column_id=>10
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Eff From'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192163361136121574)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>70
,p_column_heading=>'Gn Eff To'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192169334125121580)
,p_query_column_id=>25
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>230
,p_column_heading=>'Gn File Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192169743017121582)
,p_query_column_id=>26
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Mime Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192162997842121574)
,p_query_column_id=>8
,p_column_alias=>'GN_NOTI_BY'
,p_column_display_sequence=>60
,p_column_heading=>'Gn Noti By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192164212462121574)
,p_query_column_id=>12
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192166563148121577)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192167812128121578)
,p_query_column_id=>21
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192168564267121580)
,p_query_column_id=>23
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192167008890121578)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Upd Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192167343972121578)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192164630716121575)
,p_query_column_id=>13
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Visiblity'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192170932615121583)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>270
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6090468759030888075)
,p_query_column_id=>4
,p_column_alias=>'LIST_ICON_VALUE'
,p_column_display_sequence=>290
,p_column_heading=>'List Icon Value'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192161801887121571)
,p_query_column_id=>7
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>260
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192161375380121571)
,p_query_column_id=>6
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>250
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6511234566829017058)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement-2'
,p_parent_plug_id=>wwv_flow_imp.id(6286358979564519929)
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<img src=#APP_IMAGES#loudspeaker.png alt="Img" width="50" height="50"> <span  style = "font-size: 29px;" > Announcement<span>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502384561749095582)
,p_name=>'Birthday'
,p_static_id=>'birthday'
,p_region_name=>'DOB'
,p_parent_plug_id=>wwv_flow_imp.id(6502384321143095580)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#cake.png alt="Img" width="50" height="50" style = "margin-left: 42px;"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 15px; color: #262626;">''||''Birthday''||''</span>''||''</td>',
'    </tr>',
'        </table>'' "Birthday"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND emp_status = ''A''',
'    AND to_char(trunc(emp_dob), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dob, ''DDMM'') ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6192171975621121586)
,p_query_column_id=>1
,p_column_alias=>'Birthday'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.::P42_TYPE:BD'
,p_column_linktext=>'#Birthday#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6502384321143095580)
,p_plug_name=>'Events'
,p_static_id=>'events'
,p_parent_plug_id=>wwv_flow_imp.id(6286358979564519929)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6286358979564519929)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':global_bu NOT IN (''RGP'')'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6508109605690322642)
,p_plug_name=>'Past Events'
,p_static_id=>'past-events'
,p_parent_plug_id=>wwv_flow_imp.id(6502384321143095580)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:19px;color:#626ebd;">Past Events</b></center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6508111685664322663)
,p_name=>' <span aria-hidden="true" class="fa fa-birthday-cake fa-anim-vertical-shake"></span> Past Birthdays'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-birthday-cake-fa-anim-vertical-shake-span-past-birthdays'
,p_region_name=>'padhd1'
,p_parent_plug_id=>wwv_flow_imp.id(6508109605690322642)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       ''fa fa-birthday-cake''  ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       emp_emp_id,',
'       TO_CHAR (emp_dob, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE   EMP_BU = :global_bu',
'AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'order by TO_CHAR (emp_dob, ''DD MON'') desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192182390087121603)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Emp Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192181591252121603)
,p_query_column_id=>2
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192181160049121602)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>10
,p_column_heading=>'Label'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192182821960121603)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192183137207121605)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192181970368121603)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502385265476095589)
,p_name=>' <span aria-hidden="true" class="fa fa-birthday-cake fa-anim-vertical-shake"></span> Upcoming Birthdays'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-birthday-cake-fa-anim-vertical-shake-span-upcoming-birthdays'
,p_region_name=>'padhd1'
,p_parent_plug_id=>wwv_flow_imp.id(6502385071131095588)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       ''fa fa-birthday-cake''  ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       emp_emp_id,',
'       TO_CHAR (emp_dob, ''MON DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE   EMP_BU = :global_bu',
'AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'order by TO_CHAR (emp_dob, ''DD MON'') '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
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
 p_id=>wwv_flow_imp.id(6192175609117121594)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Emp Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192175192575121592)
,p_query_column_id=>2
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Class'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192174827771121592)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>10
,p_column_heading=>'Label'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192176393179121594)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192174354989121592)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>70
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192175972507121594)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6508109882065322645)
,p_name=>' <span aria-hidden="true" class="fa fa-certificate fa-anim-vertical-shake"></span> Past Work Anniversary'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-certificate-fa-anim-vertical-shake-span-past-work-anniversary'
,p_region_name=>'padhd3'
,p_parent_plug_id=>wwv_flow_imp.id(6508109605690322642)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''fa fa-users''                              icon_class,',
'    emp_first_name1',
'    || '' ''',
'    || '' ''',
'    || ''(''',
'    || emp_emp_id',
'    || '')''                                     list_title,',
'    emp_start_date',
'    || '' (''',
'    || trunc((sysdate - emp_start_date) / 365)||'' ''||''Yrs.''||'')'' list_badge,',
'    (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )',
'    || ''-''',
'    || (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )                                          list_text',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192185808034121608)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192186568254121610)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192186959462121610)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192186152877121608)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502385416831095591)
,p_name=>' <span aria-hidden="true" class="fa fa-certificate fa-anim-vertical-shake"></span> Upcoming Work Anniversary'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-certificate-fa-anim-vertical-shake-span-upcoming-work-anniversary'
,p_region_name=>'padhd3'
,p_parent_plug_id=>wwv_flow_imp.id(6502385071131095588)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''fa fa-users''                              icon_class,',
'    emp_first_name1',
'    || '' ''',
'    || '' ''',
'    || ''(''',
'    || emp_emp_id',
'    || '')''                                     list_title,',
'    emp_start_date',
'    || '' (''',
'    || trunc((sysdate - emp_start_date) / 365)||'' ''||''Yrs.''||'')'' list_badge,',
'    (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )',
'    || ''-''',
'    || (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )                                          list_text',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND trunc((sysdate - emp_start_date) / 365) > 0',
'    AND to_char(emp_start_date, ''MMDD'') BETWEEN to_char(trunc(to_date(sysdate) + 1), ''MMDD'') AND to_char(trunc(to_date(sysdate) + 7),',
'    ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192179014095121599)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192179779933121600)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192180195792121600)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192179410215121599)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6508109768869322644)
,p_name=>' <span aria-hidden="true" class="fa fa-handshake-o fa-anim-vertical-shake"></span> Past Wedding Anniversary'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-handshake-o-fa-anim-vertical-shake-span-past-wedding-anniversary'
,p_region_name=>'padhd2'
,p_parent_plug_id=>wwv_flow_imp.id(6508109605690322642)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''fa fa-user-heart'' ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       TO_CHAR (EMP_DOM, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'  AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'order by TO_CHAR (EMP_DOM, ''MMDD'') desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192183909787121605)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192184715064121607)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_column_css_style=>'u-color-12-text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192185044711121607)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192184309520121607)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502385296654095590)
,p_name=>' <span aria-hidden="true" class="fa fa-handshake-o fa-anim-vertical-shake"></span> Upcoming Wedding Anniversary'
,p_static_id=>'span-aria-hidden-true-class-fa-fa-handshake-o-fa-anim-vertical-shake-span-upcoming-wedding-anniversary'
,p_region_name=>'padhd2'
,p_parent_plug_id=>wwv_flow_imp.id(6502385071131095588)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''fa fa-user-heart'' ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       TO_CHAR (EMP_DOM, ''MON DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'       order by TO_CHAR (EMP_DOM, ''DD MON'') ',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
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
 p_id=>wwv_flow_imp.id(6192177107540121596)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192177833263121597)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192178304012121597)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6192177448839121596)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6502385071131095588)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(6502384321143095580)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:19px;color:#47b9f7;">Upcoming Events</b></center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502384759980095584)
,p_name=>'Wedding'
,p_static_id=>'wedding'
,p_region_name=>'WAL'
,p_parent_plug_id=>wwv_flow_imp.id(6502384321143095580)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#anniversary.png alt="Img" width="50" height="50"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 15px; color: #262626;">''||''Wedding Anniversary''||''</span>''||''</td>',
'        </tr>',
'        </table>'' "Wedding Anniversary"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND emp_status = ''A''',
'    AND to_char(trunc(emp_dom), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dom, ''DDMM'') ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6192173365415121589)
,p_query_column_id=>1
,p_column_alias=>'Wedding Anniversary'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.::P42_TYPE:WA'
,p_column_linktext=>'#Wedding Anniversary#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6502384884616095586)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_region_name=>'worka'
,p_parent_plug_id=>wwv_flow_imp.id(6502384321143095580)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#work.png alt="Img" width="50" height="50"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 15px; color: #262626;">''||''Work Anniversary''||''</span>''||''</td>',
'        </tr>',
'        </table>'' "Work Anniversary"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND emp_status = ''A''',
'    AND trunc((sysdate - emp_start_date) / 365) > 0',
'    AND to_char(emp_start_date, ''MMDD'') = to_char(sysdate, ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6192172639211121586)
,p_query_column_id=>1
,p_column_alias=>'Work Anniversary'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.::P42_TYPE:WAN'
,p_column_linktext=>'#Work Anniversary#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6195347762510141400)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6502384203254095579)
,p_button_name=>'Detail'
,p_static_id=>'detail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--hoverIconPush:t-Button--gapRight:t-Button--padTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Detail'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1002:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'u-color-23'
,p_icon_css_classes=>'fa-angle-right'
,p_button_cattributes=>'ACCESSKEY="S"'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192188160428121611)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192188728730121613)
,p_event_id=>wwv_flow_imp.id(6192188160428121611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5886974639956724859)
,p_process_sequence=>10
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
,p_internal_uid=>405012804413113831
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5886974631380724858)
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
,p_internal_uid=>405012795837113830
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192187382396121611)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p1_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p1_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p1_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p1_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p1_search, 1)',
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
,p_internal_uid=>710225546852510583
);
wwv_flow_imp.component_end;
end;
/
