prompt --application/pages/page_01002
begin
--   Manifest
--     PAGE: 01002
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
 p_id=>1002
,p_name=>'Announcement'
,p_alias=>'ANNOUNCEMENT'
,p_step_title=>'Announcement'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Card-title {',
'    color: #005a70;',
'    font-weight: bolder;',
'}',
'',
'/*DEFAULT*/',
'.t-Region-header{',
'   background-color:#5D6D7E;',
'    color: snow;',
'    line-height: 0em!important;',
'}',
'.t-Region h2.t-Region-title {',
'     color: snow;',
'}',
'/*END*/',
'',
'.t-Region--accent4>.t-Region-header {',
'    background-color: rgba(199, 102, 193, 0.7);',
'    border-bottom: 1px solid #c766c1;',
'}',
'',
'.a-IRR-headerLink {',
'    padding: 12px;',
'    display: block;',
'    text-align: inherit;',
'    color: #292b2b;',
'}',
'',
'',
' ',
'  .a-IRR-pagination-item:last-child .a-IRR-button.a-IRR-button--pagination, .btn-flat, .a-IRR-dialog .ui-button {',
'     border: none;',
'     display: inline-block;',
'     height: 20px;',
'     line-height: 20px;',
'     outline: 0;',
'     text-transform: uppercase;',
'     vertical-align: middle;',
'     -webkit-tap-highlight-color: transparent;',
'}',
'',
'',
'',
'.a-IRR-header {',
'        background-color: rgb(14, 195, 87) !important;',
'}',
'',
'',
'',
'.apex-side-nav.js-navCollapsed .t-Body-nav, .apex-side-nav.js-navCollapsed .t-Body-nav .t-TreeNav {',
'    width: 60px;',
'}',
'.apex-side-nav.js-navCollapsed .t-Body-content, .apex-side-nav.js-navCollapsed .t-Body-side, .apex-side-nav.js-navCollapsed .t-Body-title {',
'    margin-left: 60px;',
'}',
'',
'',
'#but1 {',
'    background-color:#5148ff;;',
'    color: #fff;',
'    border-radius: 100%;',
'    height: 40px;',
'}',
'',
'.t-Card--compact .t-Card-desc, .t-Cards--compact .t-Card .t-Card-desc {',
'    font-size: 2.1rem;',
'    line-height: 1.6rem;',
'}',
'',
'.THIS .slds-truncate {',
'    white-space: normal;',
'}',
'',
'/*.t-Cards--featured .t-Card .t-Card-wrap, .t-Card--featured .t-Card-wrap {',
'    background-color: #56e43c;',
'}*/',
'',
'.t-Card-info {',
'    font-size: 1.4rem;',
'    line-height: 1.6rem;',
'    margin-top: 12px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'',
'.t-Card--compact .t-Card-title, .t-Cards--compact .t-Card .t-Card-title {',
'    font-size: 1.6rem;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    position: relative;',
'    top: 50%;',
'    -webkit-transform: translateY(-50%);',
'    -ms-transform: translateY(-50%);',
'    transform: translateY(-50%);',
'    white-space: nowrap;',
'    overflow: hidden;',
'    font-weight: bold;',
'    text-overflow: ellipsis;',
'}',
'',
'.t-Card--compact .t-Card-title, .t-Cards--compact .t-Card .t-Card-title {',
'    font-size: 1.6rem;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    position: relative;',
'    top: 50%;',
'    -webkit-transform: translateY(-50%);',
'    -ms-transform: translateY(-50%);',
'    transform: translateY(-50%);',
'    white-space: nowrap;',
'    overflow: hidden;',
'    font-weight: bold;',
'    text-overflow: ellipsis;',
'    COLOR: royalblue;',
'}',
'',
'.btn-large, .a-IRR-toolbar .a-IRR-controlGroup.a-IRR-controlGroup--search button, .a-IRR-toolbar .a-IRR-controlGroup.a-IRR-controlGroup--options button, .a-IRR-toolbar .a-IRR-button.a-IRR-button--reportView {',
'    background-color: deepskyblue;',
'    height: 31px !important;',
'    line-height: 14px !important;',
'}',
'',
'',
'',
'.t-Header-navBar {',
'    margin-right: 8px;',
'    margin-top: 10px;',
'}',
'',
'/*.t-Card-wrap {',
'    border-radius: 2px;',
'    background-color: #56e43c;',
'}*/',
'',
'.a-IRR-table tr td {',
'    background-color: #ffffff;',
'    color: #404040;',
'    font-weight: 500;',
'}',
'',
'.t-Button--noUI.t-Button--warning, .t-Button--link.t-Button--warning, .t-Button--noUI.t-Button--warning .t-Icon, .t-Button--link.t-Button--warning .t-Icon {',
'    color: white;',
'}',
'#ANMT .t-MediaList--showIcons .t-MediaList-icon {',
'    width: 66px;',
'    height: 51px;',
'    background-color: #badbfb70;',
'    color: #ffffff;',
'     color: inherit;',
'     text-align: center;',
'    display: flex;',
'    justify-content: center;',
'    border-radius: 7px;',
'}',
'#ANMT .t-MediaList-title {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'    font-weight: 700;',
'    color: #443afd;',
'}',
'.t-MediaList-badge {',
'    background-color: #076d11;',
'    border-radius: 12px;',
'    color: white;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6713239927480261341)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6831902416645232466)
,p_name=>'Announcement'
,p_static_id=>'announcement-2'
,p_region_name=>'ANMT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_component_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc:t-MediaList--showBadges:t-MediaList--stack:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
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
'    WHEN length(initcap(GN_NOTI)) > 550 THEN',
'            substr(initcap(GN_NOTI), 1, 550)',
'            || ''<span id="dots''',
'            || GN_DOC_NO',
'            || ''">..</span><span id="more''',
'            || GN_DOC_NO',
'            || ''">''',
'            || substr(initcap(GN_NOTI), 551, length(initcap(GN_NOTI)))',
'            || ''</span><p id="myBtn''',
'            || GN_DOC_NO',
'            || ''"  onclick="myFunction(''',
'            || GN_DOC_NO',
'            || '')" style="color:green; cursor: pointer;" >Read more</button>''',
'    ELSE',
'        GN_NOTI',
'END',
'|| ''</SPAN></DIV>'' list_text,',
'       ''Notified By : ''||GN_NOTI_BY LIST_BADGE,',
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
'       GN_ATTACH ,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION',
' WHERE GN_BU = :global_bu',
'   AND SYSDATE BETWEEN GN_EFF_FROM AND GN_EFF_TO',
'   AND GN_STATUS = ''P'''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
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
 p_id=>wwv_flow_imp.id(6201064508691904207)
,p_query_column_id=>24
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>310
,p_column_heading=>'Gn Attach'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201862109247988458)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201864868096988474)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201866074043988478)
,p_query_column_id=>17
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201868108760988483)
,p_query_column_id=>22
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Cre Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201865327122988475)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Cre Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201865641723988477)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201870517913988502)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>280
,p_column_heading=>'Gn Doc Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201862513123988460)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201863662514988467)
,p_query_column_id=>11
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Due Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201870089264988502)
,p_query_column_id=>10
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Eff From'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201863277381988464)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>70
,p_column_heading=>'Gn Eff To'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201869318752988486)
,p_query_column_id=>25
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>230
,p_column_heading=>'Gn File Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201869653972988499)
,p_query_column_id=>26
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Mime Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201864082515988471)
,p_query_column_id=>12
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201866526519988478)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201867679630988483)
,p_query_column_id=>21
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201868439422988485)
,p_query_column_id=>23
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201866844215988480)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Upd Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201867294268988482)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201864443600988472)
,p_query_column_id=>13
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Visiblity'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201870755931988505)
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
 p_id=>wwv_flow_imp.id(6201064257591904205)
,p_query_column_id=>8
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>300
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201860833322988450)
,p_query_column_id=>4
,p_column_alias=>'LIST_ICON_VALUE'
,p_column_display_sequence=>290
,p_column_heading=>'List Icon Value'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6201861642342988457)
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
 p_id=>wwv_flow_imp.id(6201861312243988455)
,p_query_column_id=>6
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>250
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6870976594585877207)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement-3'
,p_region_name=>'notification'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'h3.normal {',
'    font-style: normal;',
'    font-family: "Monotype Corsiva";',
'    font-weight: bold;',
'     color: Crimson;',
' }',
'h3.norm {',
'    font-style: normal;',
'    font-family: "Monotype Corsiva";',
'    font-weight: bold;',
'    color: Black;',
'    text-align: left;',
'   padding-right:20px',
'}',
'h3.nor {',
'    font-style: normal;',
'    font-family: "Monotype Corsiva";',
'    font-weight: bold;',
'    color: Crimson;',
'    text-align: left;',
'   padding-right:20px',
'}',
'     h2.normal{',
'        text-align: left;',
'        font-family: "Monotype Corsiva";',
'          font-weight: bold;',
'          padding:5px;',
'    }',
'f1.awesome {',
'    font-family: futura;',
'    font-style: italic;',
'    width: 90%;',
'    margin: 12px -347px;',
'    color: #313131;',
'    text-align: center;',
'    font-size: 25px;',
'    font-weight: bold;',
'    position: absolute;  ',
'    -webkit-animation: colorchange 20s infinite alternate;',
'}',
'@-webkit-keyframes colorchange {',
'      0% {',
'        color: blue;',
'      }',
'      ',
'      10% {',
'        color: #8e44ad;',
'      }',
'      ',
'      20% {',
'        color: #1abc9c;',
'      }',
'      ',
'      30% {',
'        color: #d35400;',
'      }',
'      ',
'      40% {',
'        color: blue;',
'      }',
'      ',
'      50% {',
'        color: #34495e;',
'      }',
'      ',
'      60% {',
'        color: blue;',
'      }',
'      ',
'      70% {',
'        color: #2980b9;',
'      }',
'      80% {',
'        color: #f1c40f;',
'      }',
'      ',
'      90% {',
'        color: #2980b9;',
'      }',
'      ',
'      100% {',
'        color: pink;',
'      }',
'    }    ',
'</style>',
'<!-- Content Display -->',
'<h3 class=normal><f1 class=awesome>&GLOBAL_NOTFICATION_HEADER. </f1></h3>',
'<br>',
'<br>',
'<h3 class=normal>Dear All,</h3>',
'<br>',
'<h3>',
'<font color = ''black''>   ',
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
'',
' &nbsp;<h2 class=normal>&GLOBAL_NOTFICATION. </h2>',
'    <br>',
'    <br>',
'       ',
'&nbsp;&nbsp;&nbsp;<h3 class=norm><f1>Thanks&nbsp;&&nbsp;Regards,</f1></h3> ',
'<h3 class=nor><f1>&GLOBAL_NOTFIED_BY. </f1></h3> ',
'    <br>',
'</font>',
'     </h3>',
'',
'<!-- Image Display -->',
'<!--  <span>',
'<img src=#APP_IMAGES#game_event.bmp alt="Roadmap" align="middle"',
' style="border-style:top" width="1000" height="600"/><br><br>',
'</span> -->',
'',
''))
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1002_TYPE=''N'' AND :GLOBAL_NOTICE_CNT <>0  AND 1=7'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7071074540806860780)
,p_plug_name=>'Completed Loans'
,p_static_id=>'completed-loans'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1002_TYPE=''CL'''
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6785227152419307913)
,p_plug_name=>'InProgress Loans'
,p_static_id=>'inprogress-loans'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1002_TYPE=''IL'''
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6785227433853307915)
,p_plug_name=>'InProgress Loans'
,p_static_id=>'inprogress-loans-2'
,p_parent_plug_id=>wwv_flow_imp.id(6785227152419307913)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ''Plan'' trck,',
'          elr_rqst_no,',
'         elr_loan_id,',
'         (SELECT loan_desc1',
'            FROM loans',
'           WHERE loan_bu = elr_bu AND loan_loan_id = elr_loan_id) loan_desc,',
'         SUM(elr_aprvd_amt) Loan,',
'         SUM(elr_rtnbl_amt - elr_rtnd_amt) bal_pay',
'    FROM emp_loans_request',
'   WHERE     elr_bu = :global_bu',
'         AND elr_emp_id = :global_emp_id',
'         AND (elr_loan_id=:P1002_ORDER_NO)',
'         AND elr_status IN (''D'',''L'')',
'GROUP BY elr_emp_id,',
'         elr_loan_id,',
'         elr_bu,',
'         elr_rqst_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6785227520159307916)
,p_max_row_count=>'10000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No inprogress loan to display.'
,p_max_rows_per_page=>'5'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>','
,p_internal_uid=>641385490752786655
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336024210991318281)
,p_db_column_name=>'BAL_PAY'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336023027201318279)
,p_db_column_name=>'ELR_LOAN_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Loan No.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336023767395318281)
,p_db_column_name=>'ELR_RQST_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Request No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336024544144318282)
,p_db_column_name=>'LOAN'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Approved Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336023377891318279)
,p_db_column_name=>'LOAN_DESC'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Loan Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336024999266318282)
,p_db_column_name=>'TRCK'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Details'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP:P36_TYPE,P36_ORDER_NO:LP1,#ELR_RQST_NO#'
,p_column_linktext=>'#TRCK#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6785690998748704926)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LOAN_DESC:LOAN:BAL_PAY:TRCK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6790034761647468112)
,p_plug_name=>'Job Vacancy'
,p_static_id=>'job-vacancy'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1002_TYPE=''V'''
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6713238943964261332)
,p_plug_name=>'Job Vacancy'
,p_static_id=>'job-vacancy-2'
,p_parent_plug_id=>wwv_flow_imp.id(6790034761647468112)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT hmrln_job_id,',
'       (SELECT jtitle_title1',
'          FROM job_titles',
'         WHERE jtitle_bu = hmrln_bu',
'           AND jtitle_job_id = hmrln_job_id) hmrln_job_desc,',
'       hmrln_rqrd_qty,',
'       hmrln_rqrd_date,',
'       DECODE(hmrln_empl_type,''E'',''Company'',''C'',''Contract - ''||hmrln_rqrd_dur,''R'',''Trainee'',''T'',''Temporary'',''S'',''Subcontract'') hmrln_empl_type,',
'       hmrln_min_exp_lvl_rqrd,',
'       hmrln_job_loc',
'  FROM hrp_manpower_request_hd,',
'       hrp_manpower_request_ln',
' WHERE hmrhd_bu = hmrln_bu',
'   AND hmrhd_rqst_no = hmrln_rqst_no',
'   AND hmrhd_bu = :GLOBAL_bu',
'   AND hmrhd_status IN (''N'')',
' ORDER BY hmrln_job_desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6713239129100261333)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>569397099693740072
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336033598137318312)
,p_db_column_name=>'HMRLN_EMPL_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Employee Type'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336032406115318309)
,p_db_column_name=>'HMRLN_JOB_DESC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Job Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336031948228318306)
,p_db_column_name=>'HMRLN_JOB_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Hmrln Job Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336034340906318314)
,p_db_column_name=>'HMRLN_JOB_LOC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336033991148318314)
,p_db_column_name=>'HMRLN_MIN_EXP_LVL_RQRD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Min. Exp.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336033156818318312)
,p_db_column_name=>'HMRLN_RQRD_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Required Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336032775146318311)
,p_db_column_name=>'HMRLN_RQRD_QTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. of Employees'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6713704226022828972)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261436'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'HMRLN_JOB_DESC:HMRLN_RQRD_DATE:HMRLN_EMPL_TYPE:HMRLN_MIN_EXP_LVL_RQRD:HMRLN_JOB_LOC:HMRLN_RQRD_QTY'
,p_sort_column_1=>'HMRLN_RQRD_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6867305262029802871)
,p_name=>'Job Vacancy'
,p_static_id=>'job-vacancy-3'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT    ROWNUM SEARCH_TITLE,',
'           NULL SEARCH_DESC,',
'           ''Job Title  '' LABEL_01,',
'          (SELECT jtitle_title1',
'               FROM job_titles',
'              WHERE jtitle_bu = hmrln_bu AND jtitle_job_id = hmrln_job_id) VALUE_01,',
'          ''Eff. Date  '' LABEL_02,',
'          hmrln_rqrd_date VALUE_02,',
'         ''Type  '' LABEL_03,',
'         DECODE (hmrln_empl_type,',
'                    ''E'', ''Company'',',
'                    ''C'', ''Contract - '' || hmrln_rqrd_dur,',
'                    ''R'', ''Trainee'',',
'                    ''T'', ''Temporary'',',
'                    ''S'', ''Subcontract'') VALUE_03,',
'          ''Min. Exp.  '' LABEL_04,',
'         hmrln_min_exp_lvl_rqrd VALUE_04,',
'          ''Location  '' LABEL_05,',
'          hmrln_job_loc VALUE_05',
'    FROM hrp_manpower_request_hd, hrp_manpower_request_ln',
'   WHERE     hmrhd_bu = hmrln_bu',
'         AND hmrhd_rqst_no = hmrln_rqst_no',
'         AND hmrhd_bu = :global_bu',
'         AND hmrhd_status IN (''N'')',
'ORDER BY 1'))
,p_display_when_condition=>':P1002_TYPE=''V'' AND 1=7'
,p_display_when_cond2=>'SQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546413350505396)
,p_query_num_rows=>2
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
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
 p_id=>wwv_flow_imp.id(6336036227779318318)
,p_query_column_id=>3
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>1
,p_column_heading=>'Label 01'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336037028587318320)
,p_query_column_id=>5
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>2
,p_column_heading=>'Label 02'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336037784688318321)
,p_query_column_id=>7
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>3
,p_column_heading=>'Label 03'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336038611693318323)
,p_query_column_id=>9
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>4
,p_column_heading=>'Label 04'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336039348014318325)
,p_query_column_id=>11
,p_column_alias=>'LABEL_05'
,p_column_display_sequence=>5
,p_column_heading=>'Label 05'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336035788163318318)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>12
,p_column_heading=>'Search Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336035369128318317)
,p_query_column_id=>1
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>11
,p_column_heading=>'Search Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336036535871318320)
,p_query_column_id=>4
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336037423996318321)
,p_query_column_id=>6
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>7
,p_column_heading=>'Value 02'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336038177857318323)
,p_query_column_id=>8
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>8
,p_column_heading=>'Value 03'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336039013383318325)
,p_query_column_id=>10
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>9
,p_column_heading=>'Value 04'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336039757545318326)
,p_query_column_id=>12
,p_column_alias=>'VALUE_05'
,p_column_display_sequence=>10
,p_column_heading=>'Value 05'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6974733098132998982)
,p_name=>'Job Vacancy'
,p_static_id=>'job-vacancy-4'
,p_region_name=>'emp'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--showIcon:t-Region--accent3:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--displayIcons:t-Cards--cols:t-Cards--desc-2ln:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Job Title : ''',
'       || (SELECT jtitle_title1',
'             FROM job_titles',
'            WHERE jtitle_bu = hmrln_bu AND jtitle_job_id = hmrln_job_id)',
'          card_title,',
'       hmrln_rqrd_qty card_text,',
'       ''Eff. Date : '' || hmrln_rqrd_date || '' | '' || ''Type : ''',
'       || DECODE (hmrln_empl_type,',
'                  ''E'', ''Company'',',
'                  ''C'', ''Contract - '' || hmrln_rqrd_dur,',
'                  ''R'', ''Trainee'',',
'                  ''T'', ''Temporary'',',
'                  ''S'', ''Subcontract'')',
'       || '' | ''',
'       || ''Min. Exp. : ''',
'       || hmrln_min_exp_lvl_rqrd',
'       || '' | ''',
'       || ''Location : ''',
'       || hmrln_job_loc',
'          card_subtext',
'  FROM hrp_manpower_request_hd, hrp_manpower_request_ln',
' WHERE     hmrhd_bu = hmrln_bu',
'       AND hmrhd_rqst_no = hmrln_rqst_no',
'       AND hmrhd_bu = :global_bu',
'       AND hmrhd_status IN (''N'')'))
,p_display_when_condition=>':P1002_TYPE=''V'' AND 1=7'
,p_display_when_cond2=>'SQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'Upcoming'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336041994276318332)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336041563937318331)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336041192874318329)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7070671222944660629)
,p_plug_name=>'Loan Completed'
,p_static_id=>'loan-completed'
,p_parent_plug_id=>wwv_flow_imp.id(7071074540806860780)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT elr_rqst_no,',
'       elr_loan_id,',
'       (SELECT loan_desc1',
'            FROM loans',
'           WHERE loan_bu = elr_bu AND loan_loan_id = elr_loan_id)',
'            loan_desc,',
'       elr_rqst_date,',
'       elr_rqst_amt,',
'       elr_aprvd_amt',
'  FROM emp_loans_request',
'     WHERE elr_bu = :global_bu ',
'     AND elr_emp_id = :global_emp_id',
'     AND elr_status IN(''R'')',
'--GROUP BY elr_rqst_no,elr_emp_id,elr_loan_id, elr_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7070671319105660629)
,p_max_row_count=>'10000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No completed project to display.'
,p_max_rows_per_page=>'5'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>','
,p_internal_uid=>926829289699139368
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336045286905318340)
,p_db_column_name=>'ELR_APRVD_AMT'
,p_display_order=>55
,p_column_identifier=>'AC'
,p_column_label=>'Approved Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336043383339318336)
,p_db_column_name=>'ELR_LOAN_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Loan No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336044903548318340)
,p_db_column_name=>'ELR_RQST_AMT'
,p_display_order=>45
,p_column_identifier=>'AB'
,p_column_label=>'Request Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336044451757318339)
,p_db_column_name=>'ELR_RQST_DATE'
,p_display_order=>35
,p_column_identifier=>'AA'
,p_column_label=>'Request Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336044124706318339)
,p_db_column_name=>'ELR_RQST_NO'
,p_display_order=>25
,p_column_identifier=>'Z'
,p_column_label=>'Request No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336043656824318337)
,p_db_column_name=>'LOAN_DESC'
,p_display_order=>15
,p_column_identifier=>'X'
,p_column_label=>'Loan Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7070680676467664565)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261546'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LOAN_DESC:ELR_RQST_NO:ELR_RQST_DATE:ELR_RQST_AMT:ELR_APRVD_AMT'
,p_sum_columns_on_break=>'ELR_RQST_AMT:ELR_APRVD_AMT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6787324098355530240)
,p_plug_name=>'Loan Plan'
,p_static_id=>'loan-plan'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1002_TYPE IN (''LP'',''LP1'')'
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6787324291683530242)
,p_plug_name=>'Loan Plans'
,p_static_id=>'loan-plans'
,p_parent_plug_id=>wwv_flow_imp.id(6787324098355530240)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eldp_seq_no,',
'       eldp_order_no,',
'       eldp_ded_year,',
'       eldp_ded_period,',
'       eldp_op_prin_amt,',
'       eldp_ded_amt,',
'       eldp_prin_due_amt,',
'       eldp_int_due_amt,',
'       eldp_os_amt,',
'       CASE eldp_ded_status WHEN ''N'' THEN ''New'' WHEN ''I'' THEN ''In Progress'' WHEN ''C'' THEN ''Completed'' END eldp_ded_status          ',
'  FROM emp_loans_ded_plan',
' WHERE eldp_bu = :global_bu',
'   AND eldp_order_no = :p1002_order_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6787324343602530243)
,p_max_row_count=>'10000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No inprogress loan to display.'
,p_max_rows_per_page=>'5'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>','
,p_internal_uid=>643482314196008982
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336028659231318295)
,p_db_column_name=>'ELDP_DED_AMT'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Ded. Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336027862063318293)
,p_db_column_name=>'ELDP_DED_PERIOD'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336030309189318298)
,p_db_column_name=>'ELDP_DED_STATUS'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336027447148318292)
,p_db_column_name=>'ELDP_DED_YEAR'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336029451693318296)
,p_db_column_name=>'ELDP_INT_DUE_AMT'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Interest'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336028309848318293)
,p_db_column_name=>'ELDP_OP_PRIN_AMT'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Opening'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336027075517318290)
,p_db_column_name=>'ELDP_ORDER_NO'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Order No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336029883817318298)
,p_db_column_name=>'ELDP_OS_AMT'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Closing'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336029099628318296)
,p_db_column_name=>'ELDP_PRIN_DUE_AMT'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Principal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6336026697322318289)
,p_db_column_name=>'ELDP_SEQ_NO'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6790049139175485960)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261394'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'ELDP_SEQ_NO:ELDP_DED_YEAR:ELDP_DED_PERIOD:ELDP_DED_AMT:ELDP_PRIN_DUE_AMT:ELDP_INT_DUE_AMT:ELDP_OP_PRIN_AMT:ELDP_OS_AMT:ELDP_DED_STATUS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6792731890753533738)
,p_name=>'&nbsp;'
,p_static_id=>'nbsp'
,p_parent_plug_id=>wwv_flow_imp.id(6713239927480261341)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured force-fa-lg:t-Cards--3cols:t-Cards--animRaiseCard'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  --DECODE(gn_due_date,NULL,NULL,''Due Date : ''|| gn_due_date) card_subtext, --List_Badge,',
'               gn_noti card_text,        --List_Text,',
'               gn_noti_hd card_title,     --List_Title',
'               ''Notified By : ''||GN_NOTI_BY card_subtext',
'  FROM group_notification',
' WHERE gn_bu =:GLOBAL_BU',
'--   AND TRUNC(SYSDATE) BETWEEN TRUNC(gn_eff_from) AND TRUNC(gn_eff_to)',
'-- AND (:P1002_TYPE=''N''  AND :GLOBAL_NOTICE_CNT <>0)',
'  /* AND GN_STATUS = ''P''',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(gn_eff_from) AND TRUNC(gn_eff_to)',
'--and gne_emp_id =:global_emp_id',
'    AND (SELECT distinct GNE_EMP_ID',
'              FROM GROUP_NOTIFICATION_EMPLOYEES',
'             WHERE     GNE_BU = :GLOBAL_BU',
'                   AND GNE_DOC_NO = GN_DOC_NO',
'                   AND GNE_EMP_ID = :GLOBAL_EMP_ID) = :GLOBAL_EMP_ID;*/',
'  ',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
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
 p_id=>wwv_flow_imp.id(6336020069935318267)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336019281956318265)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6336019693081318267)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6785227044533307912)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336020458433318267)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6792731890753533738)
,p_button_name=>'back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336022269666318276)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6785227152419307913)
,p_button_name=>'Back_1'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336042725726318332)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7071074540806860780)
,p_button_name=>'Back'
,p_static_id=>'back-3'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336025966661318287)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6787324098355530240)
,p_button_name=>'Loan_plan_Back'
,p_static_id=>'loan-plan-back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336040473229318328)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6870976594585877207)
,p_button_name=>'Notification_back'
,p_static_id=>'notification-back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6336031310956318303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6790034761647468112)
,p_button_name=>'Vacancy_Back'
,p_static_id=>'vacancy-back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6336021599983318275)
,p_name=>'P1002_ORDER_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6785227044533307912)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6336021221210318271)
,p_name=>'P1002_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6785227044533307912)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
