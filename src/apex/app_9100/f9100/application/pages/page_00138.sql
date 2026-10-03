prompt --application/pages/page_00138
begin
--   Manifest
--     PAGE: 00138
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
 p_id=>138
,p_name=>'Analytics'
,p_alias=>'TREE-NODE'
,p_step_title=>'Analytics'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#expandRegion.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[data-tooltip] {',
'    position: relative;',
'    display: inline-block;',
'}',
'',
'[data-tooltip]:before {',
'    position: absolute;',
'    padding: 2px 5px;',
'    border-radius: 10px;',
'    background-color: #000;',
'    color: #fff;',
'    width: 160px;',
'    /* top: 100%; */',
'    left: 100%;',
'    content: attr(data-tooltip);',
'}',
'',
'',
'.t-BadgeList--circular.t-BadgeList--xlarge .t-BadgeList-label, .t-BadgeList--dash.t-BadgeList--xlarge .t-BadgeList-label {',
'    font-size: 1.4rem;',
'    font-weight: 500;',
'}',
'',
'.t-HeroRegion-icon {',
'    border-radius: 4px;',
'    background-color: #e85d88;',
'    color: #ffffff;',
'}',
'',
'',
'',
'.t-BreadcrumbRegion {',
'    padding: 0px;',
'}',
'',
'.t-BreadcrumbRegion--useBreadcrumbTitle .t-Breadcrumb-item:last-child .t-Breadcrumb-label {',
'    overflow: hidden;',
'    display: block;',
'    text-align: center;',
'}',
'',
'',
'h1, h2, h3, h4, h5, h6 {',
'    line-height: 1.4;',
'}',
'',
'.t-Region--accent1 > .t-Region-header {',
'    background-color:  #b7d4e4;',
'    color: #672a2a;',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.5rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 450;',
'    font-style: inherit;',
'    font-family: inherit;',
'    color: black;',
'}',
'',
'.t-MediaList--cols .t-MediaList-item .t-MediaList-desc {',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'    font-style: inherit;',
'    font-family: inherit;',
'}',
'',
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
'}',
'',
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
'} ',
'',
'.t-Region-title {',
'    font-size: small !important;',
'    line-height: inherit;',
'    font-weight: 500;',
'    color: #040404;',
'}',
'',
'#EXP{',
'    color: white;',
'    background-color: #004153;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset;',
'}',
'#COL {',
'    color: #004153;',
'    font-weight: 500;',
'    background-color: #d3d0d0;',
'    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset;',
'}',
'.t-MediaList-icon {',
'    background-color: transparent;',
'    color: #004153;',
'}',
'',
'.t-MediaList-badgeWrap, .t-MediaList-body, .t-MediaList-iconWrap {',
'    padding: 16px;',
'    padding-left: 5px;',
'}',
'.t-MediaList-title {',
'    font-size: 1.2rem;',
'    line-height: 1.6rem;',
'    font-weight: 450;',
'    font-style: inherit;',
'    font-family: inherit;',
'    color: #004153;',
'}'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5965050053156769344)
,p_plug_name=>'Dashboard / Analytics'
,p_static_id=>'dashboard-analytics'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5965050138694769345)
,p_name=>'R1'
,p_static_id=>'r'
,p_parent_plug_id=>wwv_flow_imp.id(5965050849132769352)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_1/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') AND WBF_PAR_FUN_ID = :P138_MAIN_ID_1-- ''1004001''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051219303769355)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>90
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965050522536769348)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>30
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051067300769354)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>80
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965050966488769353)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>70
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965050249996769346)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965050788543769351)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>60
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965050628824769349)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>40
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6047063820208421439)
,p_name=>'R2'
,p_static_id=>'r-10'
,p_parent_plug_id=>wwv_flow_imp.id(6047063722690421438)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_2/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE WBF_PAR_FUN_ID = :P138_MAIN_ID_2 --''1005011''',
'               START WITH wbf_node_type IN (''RPT'',''FRM'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047064468885421446)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063991944421441)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047064386845421445)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047064242470421444)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063876084421440)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047064171520421443)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047064092259421442)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5965051500440769358)
,p_name=>'R3-1'
,p_static_id=>'r-2'
,p_parent_plug_id=>wwv_flow_imp.id(5965051429111769357)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_3/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') ',
'                           AND WBF_PAR_FUN_ID = :P138_MAIN_ID_3--''1005003''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052183893769365)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051663907769360)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052057664769364)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052003268769363)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051598549769359)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051845652769362)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965051741929769361)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5965052419707769367)
,p_name=>'R3-4'
,p_static_id=>'r-3'
,p_parent_plug_id=>wwv_flow_imp.id(5965052266789769366)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_6/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') ',
'                           AND WBF_PAR_FUN_ID = :P138_MAIN_ID_6--''1005004''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965053129074769374)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052605426769369)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052945241769373)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052900203769372)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052480275769368)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052805150769371)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965052652925769370)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5965053321422769376)
,p_name=>'R3-3'
,p_static_id=>'r-4'
,p_parent_plug_id=>wwv_flow_imp.id(5965053177308769375)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_5',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'')',
'                            AND WBF_PAR_FUN_ID = :P138_MAIN_ID_5--''1004006''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778404298923433)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965053480871769378)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778309929923432)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778225075923431)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5965053358120769377)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778123400923430)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995777968937923429)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5995778575876923435)
,p_name=>'R3-5'
,p_static_id=>'r-5'
,p_parent_plug_id=>wwv_flow_imp.id(5995778450866923434)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_7/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') ',
'                            AND WBF_PAR_FUN_ID = :P138_MAIN_ID_7 --''1004025''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995779260575923442)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778745250923437)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995779202316923441)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995779062805923440)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778715635923436)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778946900923439)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995778874897923438)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5995780424076923453)
,p_name=>'R4'
,p_static_id=>'r-6'
,p_parent_plug_id=>wwv_flow_imp.id(5995779495745923444)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_8/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') AND WBF_PAR_FUN_ID = :P138_MAIN_ID_8 --= ''1004113''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781096309923460)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780558623923455)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780982354923459)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780836384923458)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780506178923454)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780754802923457)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995780690067923456)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5995781276975923462)
,p_name=>'R5'
,p_static_id=>'r-7'
,p_parent_plug_id=>wwv_flow_imp.id(5995781186909923461)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_9/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'') ',
'                           AND WBF_PAR_FUN_ID = :P138_MAIN_ID_9--''1004028R''',
'               START WITH wbf_node_type IN (''RPT'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781978203923469)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781506718923464)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781894701923468)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781744896923467)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781378343923463)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781688787923466)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995781633288923465)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5995782197147923471)
,p_name=>'R6'
,p_static_id=>'r-8'
,p_parent_plug_id=>wwv_flow_imp.id(5995782120345923470)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_10/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''RPT'',''REP'') AND WBF_PAR_FUN_ID = :P138_MAIN_ID_10 --''1001068''',
'               START WITH wbf_node_type IN (''RPT'',''REP'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782930949923478)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782370007923473)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782797523923477)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782644667923476)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782291192923472)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782615014923475)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5995782529740923474)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6047062929329421430)
,p_name=>'R3-2'
,p_static_id=>'r-9'
,p_parent_plug_id=>wwv_flow_imp.id(6047062759440421429)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'        NULL LIST_TEXT,',
'       link,',
'       CASE WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y'' ELSE ''N'' END',
'          AS "is_current",',
'       ''fa '' ||image ICON_CLASS,',
'       wbf_node_type',
'  FROM (           SELECT LEVEL lvl,',
'                          wbf_par_fun_id,',
'                          wbf_node_type,',
'                          wbf_icon image,',
'                          NVL (',
'                             (SELECT albfn_target',
'                                FROM apex_lang_bus_fun_name',
'                               WHERE albfn_lang_type = :global_lang',
'                                     AND albfn_id = wbf_bus_fun_id),',
'                             wbf_bus_fun_name)',
'                             title,',
'                          DECODE (',
'                             wbf_node_type,',
'                             ''MOD'', NULL,',
'                                ''f?p=''',
'                             || NVL (wbf_appl_no, ''&APP_ID.'')',
'                             || '':''',
'                             || NVL (wbf_page_no, 1)',
'                             || '':''',
'                             || :APP_SESSION',
'                             || ''::::'')',
'                             link,',
'                          wbf_bus_fun_id,',
'                          wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P138_MAIN_ID_4/*',
'                                       UNION',
'                                       SELECT wbf_icon,',
'                                              wbf_appl_no,',
'                                              wbf_page_no,',
'                                              wbf_bus_fun_name,',
'                                              ubff_par_bus_fun_id wbf_par_fun_id,',
'                                              wbf_node_type,',
'                                              wbf_bus_fun_id,',
'                                              DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))',
'                                                 AS seq_no',
'                                         FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                        WHERE     wbf_bus_fun_id = ubff_bus_fun_id',
'                                              AND ubff_bu = :global_bu',
'                                              AND ubff_user_id = :global_user',
'                                              AND wbf_visible = ''Y''',
'                                              AND wbf_active_flag = ''Y''*/)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE WBF_PAR_FUN_ID = :P138_MAIN_ID_4 --''1004004''',
'               START WITH wbf_node_type IN (''RPT'',''FRM'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063628533421437)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063064631421432)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063444194421436)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063405684421435)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063035108421431)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063250874421434)
,p_query_column_id=>7
,p_column_alias=>'WBF_NODE_TYPE'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Node Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047063166922421433)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5965050849132769352)
,p_plug_name=>'Report-1'
,p_static_id=>'report'
,p_title=>'&P138_MAIN_1.'
,p_region_name=>'T47'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_1) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6047063722690421438)
,p_plug_name=>'Report-2'
,p_static_id=>'report-10'
,p_title=>'&P138_MAIN_2.'
,p_region_name=>'T48'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_2) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5965051429111769357)
,p_plug_name=>'Report-3'
,p_static_id=>'report-2'
,p_title=>'&P138_MAIN_3.'
,p_region_name=>'T49'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_3) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5965052266789769366)
,p_plug_name=>'Report-6'
,p_static_id=>'report-3'
,p_title=>'&P138_MAIN_6.'
,p_region_name=>'T52'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_6) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5965053177308769375)
,p_plug_name=>'Report-5'
,p_static_id=>'report-4'
,p_title=>'&P138_MAIN_5.'
,p_region_name=>'T51'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_5) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5995778450866923434)
,p_plug_name=>'Report-7'
,p_static_id=>'report-5'
,p_title=>'&P138_MAIN_7.'
,p_region_name=>'T53'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_7) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5995779495745923444)
,p_plug_name=>'Report-8'
,p_static_id=>'report-6'
,p_title=>'&P138_MAIN_8.'
,p_region_name=>'T54'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_8) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5995781186909923461)
,p_plug_name=>'Report-9'
,p_static_id=>'report-7'
,p_title=>'&P138_MAIN_9.'
,p_region_name=>'T55'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>110
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_9) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5995782120345923470)
,p_plug_name=>'Report-10'
,p_static_id=>'report-8'
,p_title=>'&P138_MAIN_10.'
,p_region_name=>'T56'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody:t-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>120
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_10) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6047062759440421429)
,p_plug_name=>'Report-4'
,p_static_id=>'report-9'
,p_title=>'&P138_MAIN_4.'
,p_region_name=>'T50'
,p_parent_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'func_bus_fun_user_id(:global_bu,:global_user,:P138_MAIN_ID_4) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6148688375189111175)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_button_name=>'COLLAPSEALL'
,p_static_id=>'collapseall'
,p_button_static_id=>'COL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Collapse All'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6148688281788111174)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_button_name=>'EXPANDALL'
,p_static_id=>'expandall'
,p_button_static_id=>'EXP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Expand All'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181425729145508872)
,p_name=>'P138_MAIN_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416828699800316)
,p_name=>'P138_MAIN_10'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181425825489508873)
,p_name=>'P138_MAIN_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181425874978508874)
,p_name=>'P138_MAIN_3'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181425964791508875)
,p_name=>'P138_MAIN_4'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181426074390508876)
,p_name=>'P138_MAIN_5'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181426174324508877)
,p_name=>'P138_MAIN_6'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416575941800313)
,p_name=>'P138_MAIN_7'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416653259800314)
,p_name=>'P138_MAIN_8'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416702728800315)
,p_name=>'P138_MAIN_9'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181426265940508878)
,p_name=>'P138_MAIN_ID_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416439077800312)
,p_name=>'P138_MAIN_ID_10'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181803057341837929)
,p_name=>'P138_MAIN_ID_2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181803189394837930)
,p_name=>'P138_MAIN_ID_3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181803298539837931)
,p_name=>'P138_MAIN_ID_4'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181803340484837932)
,p_name=>'P138_MAIN_ID_5'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6181803528974837933)
,p_name=>'P138_MAIN_ID_6'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416135413800309)
,p_name=>'P138_MAIN_ID_7'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416256781800310)
,p_name=>'P138_MAIN_ID_8'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5803416359247800311)
,p_name=>'P138_MAIN_ID_9'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(5965050053156769344)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6148688673284111178)
,p_name=>'Collapse All'
,p_static_id=>'collapse-all'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6148688375189111175)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6157674982646472029)
,p_event_id=>wwv_flow_imp.id(6148688673284111178)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'collapseRegion("T47");',
    'collapseRegion("T48");',
    'collapseRegion("T49");',
    'collapseRegion("T49");',
    'collapseRegion("T50");',
    'collapseRegion("T51");',
    'collapseRegion("T52");',
    'collapseRegion("T53");',
    'collapseRegion("T54");',
    'collapseRegion("T55");',
    'collapseRegion("T56");',
    'apex.item("EXP").show();',
    'apex.item("COL").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6148688525602111176)
,p_name=>'Expand All'
,p_static_id=>'expand-all'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6148688281788111174)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6148688570345111177)
,p_event_id=>wwv_flow_imp.id(6148688525602111176)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'expandRegion("T47");',
    'expandRegion("T48");',
    'expandRegion("T49");',
    'expandRegion("T50");',
    'expandRegion("T51");',
    'expandRegion("T52");',
    'expandRegion("T53");',
    'expandRegion("T54");',
    'expandRegion("T55");',
    'expandRegion("T56");',
    'apex.item("EXP").hide();',
    'apex.item("COL").show();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6145060838714038364)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Main Analytics'
,p_static_id=>'main-analytics'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROC_APEX_TREE_NODE_RETURN(:GLOBAL_BU,:GLOBAL_USER,:APP_ID,:APP_PAGE_ID,:APP_SESSION);',
'PROC_COMMIT;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_1,:P138_MAIN_1',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 1;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_1 := ''Report-1''; :P138_MAIN_ID_1 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_2,:P138_MAIN_2',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 2;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_2 := ''CRM''; :P138_MAIN_ID_2 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_3,:P138_MAIN_3',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 3;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_3 := ''Purchase''; :P138_MAIN_ID_3 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_4,:P138_MAIN_4',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 4;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_4 := ''Subcontract''; :P138_MAIN_ID_4 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_5,:P138_MAIN_5',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 5;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_5 := ''Inventory''; :P138_MAIN_ID_5 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_6,:P138_MAIN_6',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 6;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_6 := ''Sales''; :P138_MAIN_ID_6 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_7,:P138_MAIN_7',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 7;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_7 := ''Quality''; :P138_MAIN_ID_7 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_8,:P138_MAIN_8',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 8;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_8 := ''PP & Shop Floor''; :P138_MAIN_ID_8 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_9,:P138_MAIN_9',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 9;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_9 := ''Plant Maintenance''; :P138_MAIN_ID_9 := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'  INTO :P138_MAIN_ID_10,:P138_MAIN_10',
'  FROM wapl_bus_fun',
' WHERE wbf_par_fun_id = ''DOC1011'' AND wbf_seq_no = 10;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P138_MAIN_10 := ''Payroll''; :P138_MAIN_ID_10 := NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>663099003170427336
);
wwv_flow_imp.component_end;
end;
/
