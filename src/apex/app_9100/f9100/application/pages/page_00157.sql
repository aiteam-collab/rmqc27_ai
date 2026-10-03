prompt --application/pages/page_00157
begin
--   Manifest
--     PAGE: 00157
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
 p_id=>157
,p_name=>'MRM'
,p_alias=>'MRM'
,p_step_title=>'MRM'
,p_autocomplete_on_off=>'OFF'
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
'.t-MediaList-icon {',
'    background-color: transparent;',
'    color: #004153;',
'}',
'.t-MediaList-badgeWrap, .t-MediaList-body, .t-MediaList-iconWrap {',
'    padding: 16px;',
'    padding-left: 5px;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5730065939025985906)
,p_plug_name=>'MRM'
,p_static_id=>'mrm'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6935875719676035847)
,p_name=>'MRM'
,p_static_id=>'mrm-2'
,p_parent_plug_id=>wwv_flow_imp.id(5730065939025985906)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
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
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y''',
'                                           AND wbf_bus_fun_id IN(',
'                                                            SELECT WBFALN_BUS_FUN_ID',
'                                                              FROM wa_bu_fun_access_hd, wa_bu_fun_access_ln',
'                                                             WHERE     WBFAHD_BU = WBFAln_BU',
'                                                                   AND WBFAHD_DOC_NO = WBFAln_DOC_NO',
'                                                                   AND WBFAHD_STATUS = ''P''',
'                                                                   AND WBFAHD_TYPE = ''M''',
'                                                                   AND WBFAhd_USER_ID = WBFALN_USER_ID',
'                                                                   AND WBFAHD_BU = :global_bu',
'                                                                   AND WBFAHD_USER_ID = :global_user',
'                                                                   --AND (TRUNC (SYSDATE) BETWEEN WBFAHD_EFF_FROM AND WBFAHD_EFF_TO)',
'                                                                   )',
'                                       )',
'                           START WITH wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to)',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id)',
'               START WITH wbf_node_type IN (''FRM'',''RPT'',''MIG'',''SET'',''REP'') ',
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
 p_id=>wwv_flow_imp.id(5611390688327282689)
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
 p_id=>wwv_flow_imp.id(5611389888370282689)
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
 p_id=>wwv_flow_imp.id(5611389518979282689)
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
 p_id=>wwv_flow_imp.id(5611389100745282689)
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
 p_id=>wwv_flow_imp.id(5611388766922282687)
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
 p_id=>wwv_flow_imp.id(5611391117147282691)
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
 p_id=>wwv_flow_imp.id(5611390382536282689)
,p_query_column_id=>5
,p_column_alias=>'is_current'
,p_column_display_sequence=>30
,p_column_heading=>'Is Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
