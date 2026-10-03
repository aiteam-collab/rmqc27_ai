prompt --application/pages/page_00137
begin
--   Manifest
--     PAGE: 00137
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
 p_id=>137
,p_name=>'Setup'
,p_alias=>'DASHBOARD-SETUP'
,p_step_title=>'Setup'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#expandRegion.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.theme && apex.theme.toggleLeftDrawer) {',
'    apex.theme.toggleLeftDrawer(false); // false = close drawer',
'}'))
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
'',
'.t-MediaList-icon {',
'    background-color: transparent;',
'    color: #004153;',
'}',
'.t-MediaList-badgeWrap, .t-MediaList-body, .t-MediaList-iconWrap {',
'    padding: 16px;',
'    padding-left: 5px;',
'}',
'.t-MediaList-title {',
'    font-size: 1.2rem;',
'    line-height: 1rem;',
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
 p_id=>wwv_flow_imp.id(6621260973768831704)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6157677250206472052)
,p_plug_name=>'Setup'
,p_static_id=>'setup'
,p_parent_plug_id=>wwv_flow_imp.id(6621260973768831704)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6175754807779916073)
,p_plug_name=>'Setup-10'
,p_static_id=>'setup-10'
,p_title=>'&P137_SETUP_10.'
,p_region_name=>'T10'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>120
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_10_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6175753836915916064)
,p_name=>'Setup_10'
,p_static_id=>'setup-11'
,p_parent_plug_id=>wwv_flow_imp.id(6175754807779916073)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' --and wbf_web_visible = ''Y''',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_10_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_10_ID'
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
 p_id=>wwv_flow_imp.id(6175754608264916071)
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
 p_id=>wwv_flow_imp.id(6175754089077916066)
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
 p_id=>wwv_flow_imp.id(6175754439218916070)
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
 p_id=>wwv_flow_imp.id(6175754343285916069)
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
 p_id=>wwv_flow_imp.id(6175753998178916065)
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
 p_id=>wwv_flow_imp.id(6175754259088916068)
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
 p_id=>wwv_flow_imp.id(6175754211202916067)
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
 p_id=>wwv_flow_imp.id(6621261769744831712)
,p_plug_name=>'Setup-1'
,p_static_id=>'setup-12'
,p_title=>'&P137_SETUP_1.'
,p_region_name=>'T1'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_icon_css_classes=>'fa-gear'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_1_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6621261059306831705)
,p_name=>'Setup_1'
,p_static_id=>'setup-13'
,p_parent_plug_id=>wwv_flow_imp.id(6621261769744831712)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_icon_css_classes=>'fa-gear'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols:t-MediaList--iconsRounded:t-Report--hideNoPagination'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' ',
'                                        AND WBF_PAR_FUN_ID = :P137_SETUP_1_ID',
'                                       /*UNION',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_1_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_1_ID'
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
 p_id=>wwv_flow_imp.id(6138204934008673473)
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
 p_id=>wwv_flow_imp.id(6138203714672673471)
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
 p_id=>wwv_flow_imp.id(6138205708592673474)
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
 p_id=>wwv_flow_imp.id(6138205239520673473)
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
 p_id=>wwv_flow_imp.id(6138203323640673471)
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
 p_id=>wwv_flow_imp.id(6138204480807673473)
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
 p_id=>wwv_flow_imp.id(6138204066002673471)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>40
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6651990416357985804)
,p_plug_name=>'Setup-3'
,p_static_id=>'setup-14'
,p_title=>'&P137_SETUP_3.'
,p_region_name=>'T3'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_3_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6651991344688985813)
,p_name=>'Setup_3'
,p_static_id=>'setup-15'
,p_parent_plug_id=>wwv_flow_imp.id(6651990416357985804)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P137_SETUP_3_ID',
'                                       /*UNION',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_3_ID',
'                           --(''1001003'')--,''1001004'',''1001006'',''1001011'',''1001051'',''1001025'')',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_3_ID'
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
 p_id=>wwv_flow_imp.id(6138194923757673453)
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
 p_id=>wwv_flow_imp.id(6138192891048673449)
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
 p_id=>wwv_flow_imp.id(6138194447756673451)
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
 p_id=>wwv_flow_imp.id(6138194040515673451)
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
 p_id=>wwv_flow_imp.id(6138192472806673448)
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
 p_id=>wwv_flow_imp.id(6138193662614673449)
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
 p_id=>wwv_flow_imp.id(6138193248970673449)
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
 p_id=>wwv_flow_imp.id(6651992107521985821)
,p_plug_name=>'Setup-4'
,p_static_id=>'setup-16'
,p_title=>'&P137_SETUP_4.'
,p_region_name=>'T4'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_4_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6651992197587985822)
,p_name=>'Setup_4'
,p_static_id=>'setup-17'
,p_parent_plug_id=>wwv_flow_imp.id(6651992107521985821)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID IN (:P137_SETUP_4_ID)',
'                                       /*UNION',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') ',
'                           AND WBF_PAR_FUN_ID IN (:P137_SETUP_4_ID)--,''1001028'',''1001029'')',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_4_ID'
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
 p_id=>wwv_flow_imp.id(6138202127698673468)
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
 p_id=>wwv_flow_imp.id(6138200051659673465)
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
 p_id=>wwv_flow_imp.id(6138201660198673467)
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
 p_id=>wwv_flow_imp.id(6138201259983673467)
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
 p_id=>wwv_flow_imp.id(6138199698785673465)
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
 p_id=>wwv_flow_imp.id(6138200897814673467)
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
 p_id=>wwv_flow_imp.id(6138200525582673465)
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
 p_id=>wwv_flow_imp.id(6651993040957985830)
,p_plug_name=>'Setup-5'
,p_static_id=>'setup-18'
,p_title=>'&P137_SETUP_5.'
,p_region_name=>'T5'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_5_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6651993117759985831)
,p_name=>'Setup_5'
,p_static_id=>'setup-19'
,p_parent_plug_id=>wwv_flow_imp.id(6651993040957985830)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P137_SETUP_5_ID/*',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_5_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_5_ID'
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
 p_id=>wwv_flow_imp.id(6138198499446673459)
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
 p_id=>wwv_flow_imp.id(6138196465143673456)
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
 p_id=>wwv_flow_imp.id(6138198130234673459)
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
 p_id=>wwv_flow_imp.id(6138197683597673457)
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
 p_id=>wwv_flow_imp.id(6138196037240673456)
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
 p_id=>wwv_flow_imp.id(6138197308316673457)
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
 p_id=>wwv_flow_imp.id(6138196869377673457)
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
 p_id=>wwv_flow_imp.id(6160334318579790529)
,p_plug_name=>'Setup-6'
,p_static_id=>'setup-2'
,p_title=>'&P137_SETUP_6.'
,p_region_name=>'T6'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_6_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6703274643302483798)
,p_plug_name=>'Setup-2'
,p_static_id=>'setup-20'
,p_title=>'&P137_SETUP_2.'
,p_region_name=>'T2'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_2_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6703274740820483799)
,p_name=>'Setup_2'
,p_static_id=>'setup-21'
,p_parent_plug_id=>wwv_flow_imp.id(6703274643302483798)
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' and wbf_par_fun_id IN (:P137_SETUP_2_ID)',
'                                       /*UNION',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_par_fun_id IN (:P137_SETUP_2_ID)---''1031001'',''1011001'',''1021001'',''1041001'')',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_2_ID'
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
 p_id=>wwv_flow_imp.id(6138208858044673482)
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
 p_id=>wwv_flow_imp.id(6138206902680673479)
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
 p_id=>wwv_flow_imp.id(6138208514684673481)
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
 p_id=>wwv_flow_imp.id(6138208120693673481)
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
 p_id=>wwv_flow_imp.id(6138209263348673482)
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
 p_id=>wwv_flow_imp.id(6138207692597673481)
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
 p_id=>wwv_flow_imp.id(6138207261701673479)
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
 p_id=>wwv_flow_imp.id(6160334368015790530)
,p_name=>'Setup_6'
,p_static_id=>'setup-3'
,p_parent_plug_id=>wwv_flow_imp.id(6160334318579790529)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P137_SETUP_6_ID/*',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_6_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_6_ID'
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
 p_id=>wwv_flow_imp.id(6160335067617790537)
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
 p_id=>wwv_flow_imp.id(6160334569032790532)
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
 p_id=>wwv_flow_imp.id(6160334949490790536)
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
 p_id=>wwv_flow_imp.id(6160334862478790535)
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
 p_id=>wwv_flow_imp.id(6160334495547790531)
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
 p_id=>wwv_flow_imp.id(6160334804189790534)
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
 p_id=>wwv_flow_imp.id(6160334661701790533)
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
 p_id=>wwv_flow_imp.id(6160335194442790538)
,p_plug_name=>'Setup-7'
,p_static_id=>'setup-4'
,p_title=>'&P137_SETUP_7.'
,p_region_name=>'T7'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_7_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6160335253038790539)
,p_name=>'Setup_7'
,p_static_id=>'setup-5'
,p_parent_plug_id=>wwv_flow_imp.id(6160335194442790538)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P137_SETUP_7_ID',
'                                       /*UNION',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_7_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_7_ID'
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
 p_id=>wwv_flow_imp.id(6160335997090790546)
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
 p_id=>wwv_flow_imp.id(6160335489247790541)
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
 p_id=>wwv_flow_imp.id(6160335862346790545)
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
 p_id=>wwv_flow_imp.id(6160335742544790544)
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
 p_id=>wwv_flow_imp.id(6160335413202790540)
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
 p_id=>wwv_flow_imp.id(6160335655103790543)
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
 p_id=>wwv_flow_imp.id(6160335571305790542)
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
 p_id=>wwv_flow_imp.id(6175752206710916047)
,p_plug_name=>'Setup-8'
,p_static_id=>'setup-6'
,p_title=>'&P137_SETUP_8.'
,p_region_name=>'T8'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_8_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6175752261981916048)
,p_name=>'Setup_8'
,p_static_id=>'setup-7'
,p_parent_plug_id=>wwv_flow_imp.id(6175752206710916047)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' AND WBF_PAR_FUN_ID = :P137_SETUP_8_ID)',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_8_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_8_ID'
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
 p_id=>wwv_flow_imp.id(6175753024398916055)
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
 p_id=>wwv_flow_imp.id(6175752522479916050)
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
 p_id=>wwv_flow_imp.id(6175752855034916054)
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
 p_id=>wwv_flow_imp.id(6175752746624916053)
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
 p_id=>wwv_flow_imp.id(6175752405595916049)
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
 p_id=>wwv_flow_imp.id(6175752734692916052)
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
 p_id=>wwv_flow_imp.id(6175752602769916051)
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
 p_id=>wwv_flow_imp.id(6175754713495916072)
,p_plug_name=>'Setup-9'
,p_static_id=>'setup-8'
,p_title=>'&P137_SETUP_9.'
,p_region_name=>'T9'
,p_parent_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P137_SETUP_9_ID) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6175753062308916056)
,p_name=>'Setup_9'
,p_static_id=>'setup-9'
,p_parent_plug_id=>wwv_flow_imp.id(6175754713495916072)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' --and wbf_web_visible = ''Y''',
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
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''SET'') AND WBF_PAR_FUN_ID = :P137_SETUP_9_ID',
'               START WITH wbf_node_type IN (''SET'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P137_SETUP_9_ID'
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
 p_id=>wwv_flow_imp.id(6175753762565916063)
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
 p_id=>wwv_flow_imp.id(6175753278154916058)
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
 p_id=>wwv_flow_imp.id(6175753701636916062)
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
 p_id=>wwv_flow_imp.id(6175753573527916061)
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
 p_id=>wwv_flow_imp.id(6175753169606916057)
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
 p_id=>wwv_flow_imp.id(6175753506908916060)
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
 p_id=>wwv_flow_imp.id(6175753382241916059)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6130947587060872033)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6621260973768831704)
,p_button_name=>'Collapse'
,p_static_id=>'collapse'
,p_button_static_id=>'COL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6130947505663872032)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6621260973768831704)
,p_button_name=>'Expand'
,p_static_id=>'expand'
,p_button_static_id=>'EXP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Expand All'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6148687943710111171)
,p_name=>'P137_DUMMY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6621260973768831704)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5576874140362960976)
,p_name=>'P137_SETUP_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751361850916039)
,p_name=>'P137_SETUP_10'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175752081940916046)
,p_name=>'P137_SETUP_10_ID'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5576874341937960978)
,p_name=>'P137_SETUP_1_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750384649916029)
,p_name=>'P137_SETUP_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750521523916030)
,p_name=>'P137_SETUP_2_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750543475916031)
,p_name=>'P137_SETUP_3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750723013916032)
,p_name=>'P137_SETUP_3_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750809950916033)
,p_name=>'P137_SETUP_4'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751442579916040)
,p_name=>'P137_SETUP_4_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750874528916034)
,p_name=>'P137_SETUP_5'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751542968916041)
,p_name=>'P137_SETUP_5_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175750951324916035)
,p_name=>'P137_SETUP_6'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751680473916042)
,p_name=>'P137_SETUP_6_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751055213916036)
,p_name=>'P137_SETUP_7'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751804372916043)
,p_name=>'P137_SETUP_7_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751232024916037)
,p_name=>'P137_SETUP_8'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751893974916044)
,p_name=>'P137_SETUP_8_ID'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175751286765916038)
,p_name=>'P137_SETUP_9'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6175752018269916045)
,p_name=>'P137_SETUP_9_ID'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6157677250206472052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6130947707276872034)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6130947505663872032)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6130947833665872035)
,p_event_id=>wwv_flow_imp.id(6130947707276872034)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'expandRegion("T1");',
    'expandRegion("T2");',
    'expandRegion("T3");',
    'expandRegion("T4");',
    'expandRegion("T5");',
    'expandRegion("T6");',
    'expandRegion("T7");',
    'expandRegion("T8");',
    'expandRegion("T9");',
    'expandRegion("T10");',
    'apex.item("EXP").hide();',
    'apex.item("COL").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6130947969753872037)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6130947587060872033)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6130948085753872038)
,p_event_id=>wwv_flow_imp.id(6130947969753872037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'collapseRegion("T1");',
    'collapseRegion("T2");',
    'collapseRegion("T3");',
    'collapseRegion("T4");',
    'collapseRegion("T5");',
    'collapseRegion("T6");',
    'collapseRegion("T7");',
    'collapseRegion("T8");',
    'collapseRegion("T9");',
    'collapseRegion("T10");',
    'apex.item("EXP").show();',
    'apex.item("COL").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5576874319614960977)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Assign Title'
,p_static_id=>'assign-title'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  --SELECT wbf_bus_fun_id,wbf_bus_fun_name INTO :P137_SETUP_1_ID,:P137_SETUP_1 FROM wapl_bus_fun WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 1;',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_1_ID,:P137_SETUP_1',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 1;',
'  EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_1 := ''Setup-1''; :P137_SETUP_1_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_2_ID,:P137_SETUP_2',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 2;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_2 := ''Setup-2''; :P137_SETUP_2_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_3_ID,:P137_SETUP_3',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 3;',
'  EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_3 := ''Setup-3''; :P137_SETUP_3_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_4_ID,:P137_SETUP_4',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 4;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_4 := ''Setup-4''; :P137_SETUP_4_ID := NULL;',
'END;',
'',
'BEGIN',
' SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_5_ID,:P137_SETUP_5',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 5;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_5 := ''Setup-5''; :P137_SETUP_5_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_6_ID,:P137_SETUP_6',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 6;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_6 := ''Setup-6''; :P137_SETUP_6_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_7_ID,:P137_SETUP_7',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 7;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_7 := ''Setup-7''; :P137_SETUP_7_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_8_ID,:P137_SETUP_8',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 8;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_8 := ''Setup-8''; :P137_SETUP_8_ID := NULL;',
'END;',
'',
'BEGIN',
' SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_9_ID,:P137_SETUP_9',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 9;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_9 := ''Setup-9''; :P137_SETUP_9_ID := NULL;',
'END;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P137_SETUP_10_ID,:P137_SETUP_10',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000100'' AND wbf_seq_no = 10;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P137_SETUP_10 := ''Setup-10''; :P137_SETUP_10_ID := NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>94912484071349949
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6145060284555038358)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SETUP'
,p_static_id=>'setup'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROC_APEX_TREE_NODE_RETURN(:GLOBAL_BU,:GLOBAL_USER,:APP_ID,:APP_PAGE_ID,:APP_SESSION);',
'PROC_COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>663098449011427330
);
wwv_flow_imp.component_end;
end;
/
