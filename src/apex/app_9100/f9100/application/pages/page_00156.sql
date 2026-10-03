prompt --application/pages/page_00156
begin
--   Manifest
--     PAGE: 00156
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
 p_id=>156
,p_name=>'Data Management'
,p_alias=>'DATA-MANAGEMENT'
,p_step_title=>'Data Management'
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
 p_id=>wwv_flow_imp.id(7940120112386085074)
,p_plug_name=>'Data Management'
,p_static_id=>'data-management'
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
 p_id=>wwv_flow_imp.id(6172423699902054364)
,p_plug_name=>'Date Management - 4'
,p_static_id=>'date-management'
,p_title=>'&P156_DOC_4.'
,p_region_name=>'T14'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_4) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6804284284226963623)
,p_name=>'Date Management - 1'
,p_static_id=>'date-management-10'
,p_parent_plug_id=>wwv_flow_imp.id(7940120908362085082)
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' )',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID = :P156_DOC_ID_1--IN (''1010090'')',
'               START WITH wbf_node_type IN (''MIG'') ',
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
 p_id=>wwv_flow_imp.id(6144537301848994809)
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
 p_id=>wwv_flow_imp.id(6144535257705994807)
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
 p_id=>wwv_flow_imp.id(6144536853425994809)
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
 p_id=>wwv_flow_imp.id(6144536447606994809)
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
 p_id=>wwv_flow_imp.id(6144534932548994806)
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
 p_id=>wwv_flow_imp.id(6144536047225994807)
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
 p_id=>wwv_flow_imp.id(6144535636810994807)
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
 p_id=>wwv_flow_imp.id(7940121328504085086)
,p_plug_name=>'Date Management - 2'
,p_static_id=>'date-management-11'
,p_title=>'&P156_DOC_2.'
,p_region_name=>'T12'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_2) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7940121559670085088)
,p_name=>'Date Management - 2'
,p_static_id=>'date-management-12'
,p_parent_plug_id=>wwv_flow_imp.id(7940121328504085086)
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_2--= ''10000902''',
'               START WITH wbf_node_type IN (''MIG'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P156_DOC_ID_2'
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
 p_id=>wwv_flow_imp.id(6144472579907994684)
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
 p_id=>wwv_flow_imp.id(6144470632372994682)
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
 p_id=>wwv_flow_imp.id(6144472169308994684)
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
 p_id=>wwv_flow_imp.id(6144471752950994684)
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
 p_id=>wwv_flow_imp.id(6144470203112994681)
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
 p_id=>wwv_flow_imp.id(6144471364951994682)
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
 p_id=>wwv_flow_imp.id(6144470998466994682)
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
 p_id=>wwv_flow_imp.id(7970849554975239174)
,p_plug_name=>'Date Management - 3'
,p_static_id=>'date-management-13'
,p_title=>'&P156_DOC_3.'
,p_region_name=>'T13'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_3) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7970850483306239183)
,p_name=>'Date Management - 3'
,p_static_id=>'date-management-14'
,p_parent_plug_id=>wwv_flow_imp.id(7970849554975239174)
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
'                                              /*DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))*/',
'                                               wbf_seq_no  AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' )',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_3--IN(''10000901'')',
'               START WITH wbf_node_type IN (''MIG'') ',
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
 p_id=>wwv_flow_imp.id(6144476221173994692)
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
 p_id=>wwv_flow_imp.id(6144474150836994688)
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
 p_id=>wwv_flow_imp.id(6144475767202994690)
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
 p_id=>wwv_flow_imp.id(6144475391841994690)
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
 p_id=>wwv_flow_imp.id(6144473795368994688)
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
 p_id=>wwv_flow_imp.id(6144474945010994690)
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
 p_id=>wwv_flow_imp.id(6144474569450994688)
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
 p_id=>wwv_flow_imp.id(6172423749304054365)
,p_name=>'Date Management - 4'
,p_static_id=>'date-management-2'
,p_parent_plug_id=>wwv_flow_imp.id(6172423699902054364)
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
'                                              /*DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))*/',
'                                               wbf_seq_no  AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_4--IN(''10000901'')',
'               START WITH wbf_node_type IN (''MIG'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P156_DOC_ID_4'
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
 p_id=>wwv_flow_imp.id(6172424491634054372)
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
 p_id=>wwv_flow_imp.id(6172423985773054367)
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
 p_id=>wwv_flow_imp.id(6172424430280054371)
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
 p_id=>wwv_flow_imp.id(6172424314138054370)
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
 p_id=>wwv_flow_imp.id(6172423885393054366)
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
 p_id=>wwv_flow_imp.id(6172424220700054369)
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
 p_id=>wwv_flow_imp.id(6172424053762054368)
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
 p_id=>wwv_flow_imp.id(6172424590714054373)
,p_plug_name=>'Date Management - 5'
,p_static_id=>'date-management-3'
,p_title=>'&P156_DOC_5.'
,p_region_name=>'T15'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_5) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6172424694634054374)
,p_name=>'Date Management - 5'
,p_static_id=>'date-management-4'
,p_parent_plug_id=>wwv_flow_imp.id(6172424590714054373)
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
'                                              /*DECODE (',
'                                                 wbf_bus_fun_type,',
'                                                 NULL, TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                 NVL (TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                      wbf_bus_fun_id))*/',
'                                               wbf_seq_no  AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_5--IN(''10000901'')',
'               START WITH wbf_node_type IN (''MIG'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P156_DOC_ID_5'
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
 p_id=>wwv_flow_imp.id(6177806745763427531)
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
 p_id=>wwv_flow_imp.id(6172424887678054376)
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
 p_id=>wwv_flow_imp.id(6177806722446427530)
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
 p_id=>wwv_flow_imp.id(6177806616719427529)
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
 p_id=>wwv_flow_imp.id(6172424825232054375)
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
 p_id=>wwv_flow_imp.id(6172425113165054378)
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
 p_id=>wwv_flow_imp.id(6172424939385054377)
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
 p_id=>wwv_flow_imp.id(6177806900184427532)
,p_plug_name=>'Date Management - 6'
,p_static_id=>'date-management-5'
,p_title=>'&P156_DOC_6.'
,p_region_name=>'T16'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_6) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6177806968064427533)
,p_name=>'Date Management - 6'
,p_static_id=>'date-management-6'
,p_parent_plug_id=>wwv_flow_imp.id(6177806900184427532)
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
'                                               wbf_seq_no  AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_6--IN(''10000901'')',
'               START WITH wbf_node_type IN (''MIG'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P156_DOC_ID_6'
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
 p_id=>wwv_flow_imp.id(6177807729971427540)
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
 p_id=>wwv_flow_imp.id(6177807162980427535)
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
 p_id=>wwv_flow_imp.id(6177807627374427539)
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
 p_id=>wwv_flow_imp.id(6177807463009427538)
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
 p_id=>wwv_flow_imp.id(6177807114983427534)
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
 p_id=>wwv_flow_imp.id(6177807352128427537)
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
 p_id=>wwv_flow_imp.id(6177807259091427536)
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
 p_id=>wwv_flow_imp.id(6177807750271427541)
,p_plug_name=>'Date Management - 7'
,p_static_id=>'date-management-7'
,p_title=>'&P156_DOC_7.'
,p_region_name=>'T17'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>110
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_7) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6177807845588427542)
,p_name=>'Date Management - 7'
,p_static_id=>'date-management-8'
,p_parent_plug_id=>wwv_flow_imp.id(6177807750271427541)
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
'                                               wbf_seq_no  AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'')',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id) WHERE wbf_node_type IN (''MIG'') ',
'                           AND WBF_PAR_FUN_ID  = :P156_DOC_ID_7--IN(''10000901'')',
'               START WITH wbf_node_type IN (''MIG'') ',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P156_DOC_ID_7'
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
 p_id=>wwv_flow_imp.id(6177808570395427549)
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
 p_id=>wwv_flow_imp.id(6177808051119427544)
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
 p_id=>wwv_flow_imp.id(6177808453848427548)
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
 p_id=>wwv_flow_imp.id(6177808341094427547)
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
 p_id=>wwv_flow_imp.id(6177807977823427543)
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
 p_id=>wwv_flow_imp.id(6177808254808427546)
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
 p_id=>wwv_flow_imp.id(6177808185618427545)
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
 p_id=>wwv_flow_imp.id(7940120908362085082)
,p_plug_name=>'Date Management - 1'
,p_static_id=>'date-management-9'
,p_title=>'&P156_DOC_1.'
,p_region_name=>'T11'
,p_parent_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>' func_bus_fun_user_id(:global_bu,:global_user,:P156_DOC_ID_1) =1'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6130948399527872041)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7940120112386085074)
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
 p_id=>wwv_flow_imp.id(6130948281840872040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_button_name=>'EXPAND'
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
 p_id=>wwv_flow_imp.id(6172420237822054330)
,p_name=>'P156_DOC_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420415144054331)
,p_name=>'P156_DOC_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420528815054332)
,p_name=>'P156_DOC_3'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420569163054333)
,p_name=>'P156_DOC_4'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420714422054334)
,p_name=>'P156_DOC_5'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420766261054335)
,p_name=>'P156_DOC_6'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172420843789054336)
,p_name=>'P156_DOC_7'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421040597054338)
,p_name=>'P156_DOC_ID_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421163985054339)
,p_name=>'P156_DOC_ID_2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421306647054340)
,p_name=>'P156_DOC_ID_3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421354449054341)
,p_name=>'P156_DOC_ID_4'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421478457054342)
,p_name=>'P156_DOC_ID_5'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421573093054343)
,p_name=>'P156_DOC_ID_6'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6172421645926054344)
,p_name=>'P156_DOC_ID_7'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7940120112386085074)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6130948483826872042)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6130948281840872040)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6130948585355872043)
,p_event_id=>wwv_flow_imp.id(6130948483826872042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'expandRegion("T11");',
    'expandRegion("T12");',
    'expandRegion("T13");',
    'expandRegion("T14");',
    'expandRegion("T15");',
    'expandRegion("T16");',
    'apex.item("EXP").hide();',
    'apex.item("COL").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6130948753876872045)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6130948399527872041)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6130948885431872046)
,p_event_id=>wwv_flow_imp.id(6130948753876872045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'collapseRegion("DOC1");',
    'collapseRegion("DOC2");',
    'collapseRegion("DOC3");',
    'collapseRegion("DOC4");',
    'collapseRegion("DOC5");',
    'collapseRegion("DOC6");',
    'apex.item("EXP").show();',
    'apex.item("COL").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6145061034164038365)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Data Management'
,p_static_id=>'data-management'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROC_APEX_TREE_NODE_RETURN(:GLOBAL_BU,:GLOBAL_USER,:APP_ID,:APP_PAGE_ID,:APP_SESSION);',
'PROC_COMMIT;',
'',
'BEGIN',
'  SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_1,:P156_DOC_1',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 1;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_1 := ''Date Management-1''; :P156_DOC_ID_1 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_2,:P156_DOC_2',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 2;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_2 := ''Date Management-2''; :P156_DOC_ID_1 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_3,:P156_DOC_3',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 3;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_3 := ''Date Management-3''; :P156_DOC_ID_1 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_4,:P156_DOC_4',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 4;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_4 := ''Date Management-4''; :P156_DOC_ID_4 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_5,:P156_DOC_5',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 5;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_5 := ''Date Management-5''; :P156_DOC_ID_5 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_6,:P156_DOC_6',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 6;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_6 := ''Date Management-6''; :P156_DOC_ID_6 := NULL;',
'END;',
'',
'BEGIN',
'    SELECT wbf_bus_fun_id,wbf_bus_fun_name',
'    INTO :P156_DOC_ID_7,:P156_DOC_7',
'    FROM wapl_bus_fun',
'   WHERE wbf_par_fun_id = ''1000300'' AND wbf_seq_no = 7;',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN :P156_DOC_7 := ''Date Management-7''; :P156_DOC_ID_7 := NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>663099198620427337
);
wwv_flow_imp.component_end;
end;
/
