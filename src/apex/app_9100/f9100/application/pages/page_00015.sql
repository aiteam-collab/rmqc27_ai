prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_name=>'Navigation Menu'
,p_alias=>'NAVIGATION-MENU-COPY'
,p_step_title=>'Navigation Menu'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0rem;',
'    display: flex;',
'    align-items: center;',
'    padding-bottom: 4px;',
'}',
'',
'.t-Region-title {',
'    font-size: inherit;',
'    line-height: inherit;',
'    font-weight: 700;',
'    color: #E91E63;',
'}',
'',
'',
'.t-MediaList-title {',
'    font-size: 1.2rem;',
'    line-height: 2rem;',
'    font-weight: 500;',
'    color: #333d46;',
'}',
'',
'',
'',
'.t-MediaList-badge {',
'    display: inline-block;',
'    font-size: 1.0rem;',
'    line-height: 2rem;',
'    background-color: rgba(0,0,0,.05);',
'    padding: 0 8px;',
'    border-radius: 2px;',
'    --min-width: 27px;',
'    text-align: center;',
'}',
'',
'',
'',
'.t-DialogRegion-buttons, .ui-dialog.ui-dialog--inline .ui-dialog-titlebar {',
'    flex-shrink: 0;',
'    text-align: center;',
'    /* font-size: 40px; */',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11249579754810366164)
,p_name=>'Analytics'
,p_static_id=>'analytics'
,p_parent_plug_id=>wwv_flow_imp.id(11288511553273785857)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--cols t-MediaList--5cols:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       ''fa '' ||image ICON_CLASS,',
'       LIST_BADGE,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   -- DECODE (wbf_bus_fun_type,''MOD'', NULL,''f?p=''|| NVL (400, 400)|| '':''|| NVL (111, 1)|| '':&SESSION.:::::'')',
'                   CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                                /*  UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user */',
'                                                     --    AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''RPT''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(400,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1))',
'                                   link,',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user */',
'                                                     --    AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''RPT''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P15_NODE,P15_NODE_DESC'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5000000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250928897333833137)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250929690555833143)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250928473158833134)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250929265340833140)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>6
,p_column_heading=>'List Badge'
,p_column_link=>'javascript: $s(''P4_BUS_FUN_ID'',''#ID2#''); $s(''P4_REQ'',''FAVI'');'
,p_column_linktext=>'#LIST_BADGE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250928079835833131)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250927642047833129)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250927252203833128)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>2
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256977667336302972)
,p_name=>'Customer Relationship Management'
,p_static_id=>'customer-relationship-management'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       null list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                             /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000022''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978180160302977)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978372532302979)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977909160302974)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978306109302978)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978047766302976)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977969872302975)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977814835302973)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256976761414302963)
,p_name=>'Financial Management'
,p_static_id=>'financial-management'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,Sub_title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                     (SELECT wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)Sub_title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                             /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000001''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977407954302969)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977602961302971)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>80
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977082281302966)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>30
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977497090302970)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>70
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977257603302968)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977223290302967)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>40
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256977015486302965)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>20
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11295848300432546379)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256980939236303005)
,p_name=>'HR & Payroll'
,p_static_id=>'hr-payroll'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000019''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981442366303010)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257936999550220562)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981184437303007)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981561249303011)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981383244303009)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981308118303008)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256981123463303006)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256916435839145562)
,p_name=>'Main_Menu'
,p_static_id=>'main-menu'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl, title list_title,link,null list_text, ''NO'',''fa '' || image ICON_CLASS',
'  FROM (WITH node',
'             AS (SELECT lvl,title,link,NULL,image,wbf_bus_fun_type,wbf_par_fun_id,id2',
'                   FROM (SELECT lv lvl, title, link,image, wbf_bus_fun_type,wbf_par_fun_id,id2',
'                           FROM (           SELECT LEVEL lv,',
'                                                   wbf_par_fun_id,',
'                                                   wbf_bus_fun_type,',
'                                                   wbf_icon image,',
'                                                   (SELECT wbf_bus_fun_name',
'                                                      FROM wapl_bus_fun',
'                                                     WHERE wbf_bus_fun_id = id2)',
'                                                      title,',
'                                                   DECODE (',
'                                                      ''FOLD'',''FOLD'',    ''f?p=''|| NVL (700, ''&APP_ID.'') || '':'' || 4|| '':&SESSION.::NO:RP:P4_NODE,P4_NODE_DESC:''|| id2|| '',''|| (SELECT wbf_bus_fun_name',
'                                                                    FROM wapl_bus_fun WHERE wbf_bus_fun_id =id2),NULL) link,id2',
'                                              FROM (    SELECT DISTINCT *',
'                                                          FROM (SELECT wbf_icon, wbf_par_fun_id, wbf_bus_fun_id id2, wbf_node_type wbf_bus_fun_type, wbf_visible,',
'                                                                       DECODE ( wbf_bus_fun_type, NULL, TO_CHAR ( wbf_seq_no,  ''0000000''),',
'                                                                          NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  AND ',
'                                                                 wbf_visible = ''Y'' AND wbf_bus_fun_id <> ''FAVOR'')',
'                                                    START WITH id2 IN',
'                                                                  (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user',
'                                                                 /*  UNION ALL',
'                                                                   SELECT wrbfa_bus_fun_id FROM wapl_user_role_accs,wapl_role_bus_fun_accs',
'                                                                    WHERE wura_role_id = wrbfa_role_id',
'                                                                          AND wura_user_id =:global_user',
'AND wrbfa_vertical_id IN (SELECT bwva_vert_id',
'   FROM be_web_vert_asso',
'  WHERE bwva_bu=:global_bu)*/',
')',
'                                                    CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                                             WHERE --LEVEL IN (1,2)  AND',
'                                                   wbf_bus_fun_type = ''MOD''',
'                                        START WITH wbf_par_fun_id IS NULL',
'                                        CONNECT BY wbf_par_fun_id = PRIOR id2',
'                                 ORDER SIBLINGS BY seq_no',
')))',
'        SELECT lvl,title,CASE  WHEN (SELECT COUNT (*) FROM node tm1 WHERE tm1.wbf_par_fun_id = tr1.id2) > 0 THEN NULL ELSE link END  link,NULL, image FROM node tr1)',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256916624054145563)
,p_query_column_id=>5
,p_column_alias=>'''NO'''
,p_column_display_sequence=>10
,p_column_heading=>'&#x27;no&#x27;'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256917060743145568)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256916751766145565)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>30
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256917001302145567)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256916915231145566)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>40
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256916682755145564)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>20
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256980056601302996)
,p_name=>'Main_Menu'
,p_static_id=>'main-menu-2'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                             DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_'
||'page_no,1)||'',''||:APP_SESSION)',
'                                   link, ',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'',''MOD'')',
'                            START WITH wbf_par_fun_id = ''1000001''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980586185303001)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980731556303003)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980274392302998)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980677499303002)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980517439303000)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980415160302999)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980187385302997)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6246069846985554590)
,p_name=>'Menu'
,p_static_id=>'menu'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 as sort_order,',
'''https://www.google.com/'' as LINK1,',
'''Users'' title,',
'''250'' data,',
'''fa-users fa-fw fa-3x'' as icon_class,',
'''dark-blue'' as class1,',
'''dark-blue'' as class2,',
'''https://www.google.com/'' as link',
'from dual',
'union all',
'Select 2 as sort_order,',
'''https://www.google.com/'' as LINK1,',
'''Online'' title,',
'''150'' data,',
'''fa-phone fa-fw fa-3x'' as icon_class,',
'''red'' as class1,',
'''red'' as class2,',
'''https://www.google.com/'' as link',
'from dual',
'union all',
'Select 3 as sort_order,',
'''https://www.google.com/'' as LINK1,',
'''Off-line'' title,',
'''100'' data,',
'''fa-area-chart fa-fw fa-3x'' as icon_class,',
'''orange'' as class1,',
'''orange'' as class2,',
'''https://www.google.com/'' as link',
'from dual',
'union all',
'Select 4 as sort_order,',
'''https://www.google.com/'' as LINK1,',
'''Pending'' title,',
'''250'' data,',
'''fa fa-download fa-fw fa-3x'' as icon_class,',
'''green'' as class1,',
'''green'' as class2,',
'''https://www.google.com/'' as link',
'from dual'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071461476554606)
,p_query_column_id=>6
,p_column_alias=>'CLASS1'
,p_column_display_sequence=>140
,p_column_heading=>'Class1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071623787554607)
,p_query_column_id=>7
,p_column_alias=>'CLASS2'
,p_column_display_sequence=>150
,p_column_heading=>'Class2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071400440554605)
,p_query_column_id=>4
,p_column_alias=>'DATA'
,p_column_display_sequence=>130
,p_column_heading=>'Data'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246070808590554599)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>90
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246070716289554598)
,p_query_column_id=>8
,p_column_alias=>'LINK'
,p_column_display_sequence=>80
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071195982554603)
,p_query_column_id=>2
,p_column_alias=>'LINK1'
,p_column_display_sequence=>110
,p_column_heading=>'Link1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071070113554602)
,p_query_column_id=>1
,p_column_alias=>'SORT_ORDER'
,p_column_display_sequence=>100
,p_column_heading=>'Sort Order'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246071267858554604)
,p_query_column_id=>3
,p_column_alias=>'TITLE'
,p_column_display_sequence=>120
,p_column_heading=>'Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6246068805314554579)
,p_name=>'New'
,p_static_id=>'new'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBF_APPL_NO LIST_TITLE,WBF_BUS_FUN_NAME LIST_TEXT from(select WBF_NODE_TYPE,count(WBF_BUS_FUN_NAME)fun_name',
',WBF_BUS_FUN_NAME,WBF_APPL_NO from wapl_bus_fun',
'group by WBF_NODE_TYPE,WBF_APPL_NO,WBF_BUS_FUN_NAME);'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246069355073554585)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6246069313455554584)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6254593354824471562)
,p_name=>'New'
,p_static_id=>'new-2'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl, title list_title,link,null list_text, ''NO'',''fa '' || image ICON_CLASS',
'  FROM (WITH node',
'             AS (SELECT lvl,title,link,NULL,image,wbf_bus_fun_type,wbf_par_fun_id,id2',
'                   FROM (SELECT lv lvl, title, link,image, wbf_bus_fun_type,wbf_par_fun_id,id2',
'                           FROM (           SELECT LEVEL lv,',
'                                                   wbf_par_fun_id,',
'                                                   wbf_bus_fun_type,',
'                                                   wbf_icon image,',
'                                                   (SELECT wbf_bus_fun_name',
'                                                      FROM wapl_bus_fun',
'                                                     WHERE wbf_bus_fun_id = id2)',
'                                                      title,',
'                                                   DECODE (',
'                                                      ''FOLD'',''FOLD'',    ''f?p=''|| NVL (700, ''&APP_ID.'') || '':'' || 4|| '':&SESSION.::NO:RP:P4_NODE,P4_NODE_DESC:''|| id2|| '',''|| (SELECT wbf_bus_fun_name',
'                                                                    FROM wapl_bus_fun WHERE wbf_bus_fun_id =id2),NULL) link,id2',
'                                              FROM (    SELECT DISTINCT *',
'                                                          FROM (SELECT wbf_icon, wbf_par_fun_id, wbf_bus_fun_id id2, wbf_node_type wbf_bus_fun_type, wbf_visible,',
'                                                                       DECODE ( wbf_bus_fun_type, NULL, TO_CHAR ( wbf_seq_no,  ''0000000''),',
'                                                                          NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  AND ',
'                                                                 wbf_visible = ''Y'' AND wbf_bus_fun_id <> ''FAVOR'')',
'                                                    START WITH id2 IN',
'                                                                  (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user',
'                                                                 /*  UNION ALL',
'                                                                   SELECT wrbfa_bus_fun_id FROM wapl_user_role_accs,wapl_role_bus_fun_accs',
'                                                                    WHERE wura_role_id = wrbfa_role_id',
'                                                                          AND wura_user_id =:global_user',
'AND wrbfa_vertical_id IN (SELECT bwva_vert_id',
'   FROM be_web_vert_asso',
'  WHERE bwva_bu=:global_bu)*/',
')',
'                                                    CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                                             WHERE --LEVEL IN (1,2)  AND',
'                                                   wbf_bus_fun_type = ''MOD''',
'                                        START WITH wbf_par_fun_id IS NULL',
'                                        CONNECT BY wbf_par_fun_id = PRIOR id2',
'                                 ORDER SIBLINGS BY seq_no',
')))',
'        SELECT lvl,title,CASE  WHEN (SELECT COUNT (*) FROM node tm1 WHERE tm1.wbf_par_fun_id = tr1.id2) > 0 THEN NULL ELSE link END  link,NULL, image FROM node tr1)',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6254593967290471568)
,p_query_column_id=>5
,p_column_alias=>'''NO'''
,p_column_display_sequence=>40
,p_column_heading=>'&#x27;no&#x27;'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6255309559514494769)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>160
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6255309199442494765)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>130
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6255309483091494768)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>150
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6255309358554494767)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6254594459546471573)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>90
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256979311881302988)
,p_name=>'PM & EHS'
,p_static_id=>'pm-ehs'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000018''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979734101302993)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256980001115302995)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979497089302990)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979871220302994)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979715857302992)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979625258302991)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979416221302989)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6257940526714220597)
,p_name=>'Production Planning'
,p_static_id=>'production-planning'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000013''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940943847220602)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941184718220604)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940642713220599)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941105412220603)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940849733220601)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940812927220600)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940592631220598)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6257937118347220563)
,p_name=>'Project Management'
,p_static_id=>'project-management'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000027''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937535170220568)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937801204220570)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937267305220565)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937668480220569)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937463244220567)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937344755220566)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257937143736220564)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6257941304000220605)
,p_name=>'Quality Management'
,p_static_id=>'quality-management'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000025''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941738535220610)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6258368147880854062)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941475223220607)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941893736220611)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941655554220609)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941599640220608)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257941352640220606)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6420575866374256100)
,p_name=>'Reports'
,p_static_id=>'reports'
,p_parent_plug_id=>wwv_flow_imp.id(11288511553273785857)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--cols t-MediaList--5cols:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       ''fa '' ||image ICON_CLASS,',
'       LIST_BADGE,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   -- DECODE (wbf_bus_fun_type,''MOD'', NULL,''f?p=''|| NVL (400, 400)|| '':''|| NVL (111, 1)|| '':&SESSION.:::::'')',
'                                   CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  ',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                                 /* UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                     --    AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''REP''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(400,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1))',
'                                   link,',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user',
'                                                  /*UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                     --    AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''REP''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P15_NODE,P15_NODE_DESC'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5000000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250922690204833095)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250923499882833101)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250922298637833092)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250923123700833096)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_column_link=>'javascript: $s(''P4_BUS_FUN_ID'',''#ID2#''); $s(''P4_REQ'',''FAVI'');'
,p_column_linktext=>'#LIST_BADGE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250921884257833089)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250921469192833087)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250921105025833068)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11288511647987785858)
,p_name=>'Setup'
,p_static_id=>'setup'
,p_parent_plug_id=>wwv_flow_imp.id(11288511553273785857)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--cols t-MediaList--5cols:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'        LIST_BADGE,',
'       link,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               wbf_bus_fun_short_name,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                             DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_'
||'page_no,1)||'',''||:APP_SESSION)',
'                                   link, ',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                        NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  AND  wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                                /*  UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user */',
'                                                     --    AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''SET''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                             DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_'
||'page_no,1)||'',''||:APP_SESSION)',
'                                   link, ',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user',
'                                                /*  UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user */',
'                                                      --   AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''SET''',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250932343119833159)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250932646713833162)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250931937788833156)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250931556381833154)
,p_query_column_id=>4
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>6
,p_column_heading=>'List Badge'
,p_column_link=>'javascript: $s(''P4_BUS_FUN_ID'',''#ID2#''); $s(''P4_REQ'',''FAVI'');'
,p_column_linktext=>'#LIST_BADGE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250931188586833153)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250930818140833151)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250930355802833146)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>2
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6257939678636220589)
,p_name=>'Shop Floor'
,p_static_id=>'shop-floor'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000016''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940202763220594)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940411690220596)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257939929318220591)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940285372220595)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257940111621220593)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257939975571220592)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6257939730660220590)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6256978489925302980)
,p_name=>'Supply Chain Management'
,p_static_id=>'supply-chain-management'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'                            /* DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                   link, */',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wbf_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            --WHERE LEVEL <> 0 --AND ',
'                            where wbf_node_type  IN (''RPT'',''REP'')',
'                            START WITH wbf_par_fun_id = ''1000009''--IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6255800623444524082)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978952730302985)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979148346302987)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978644282302982)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256979047428302986)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978893516302984)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978782737302983)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6256978581489302981)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11288511553273785857)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11157210098180020257)
,p_name=>'Transactions'
,p_static_id=>'transactions'
,p_parent_plug_id=>wwv_flow_imp.id(11288511553273785857)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--cols t-MediaList--5cols:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  wbf_icon image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                   /* DECODE (',
'                                       wbf_bus_fun_type,',
'                                       ''MOD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (''&APP_ID.'', ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_no, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                             DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_'
||'page_no,1)||'',''||:APP_SESSION)',
'                                   link, ',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_page_no,',
'                                                      wbf_bus_fun_type,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wbf_seq_no,',
'                                                                        ''0000000''),NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                                                                 WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  ',
'                                                      AND wbf_visible = ''Y''',
'                                                      AND wbf_bus_fun_id <> ''FAVOR'')',
'                                   START WITH id2 IN',
'                                                 (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                          --  WHERE LEVEL <> 0 AND wbf_node_type  NOT IN (''RPT'',''SET'',''REP'')',
'                            START WITH wbf_par_fun_id = NVL(:P15_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P15_NODE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250926211586833118)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250926552267833120)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250925388740833114)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250925748426833117)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>6
,p_column_heading=>'List Badge'
,p_column_link=>'javascript: $s(''P4_BUS_FUN_ID'',''#ID2#''); $s(''P4_REQ'',''FAVI'');'
,p_column_linktext=>'#LIST_BADGE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250924935394833111)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>5
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250924594708833109)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6250924180021833106)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>1
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250934611758833173)
,p_name=>'P15_BUS_FUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11295848300432546379)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250934950387833173)
,p_name=>'P15_NODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11295848300432546379)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250933085055833164)
,p_name=>'P15_NODE_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11288511647987785858)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250935363812833173)
,p_name=>'P15_NODE_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11295848300432546379)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250933430515833167)
,p_name=>'P15_NODE_DESC_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11288511647987785858)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250935792444833175)
,p_name=>'P15_REQ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11295848300432546379)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6250934220350833171)
,p_name=>'P15_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11295848300432546379)
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
 p_id=>wwv_flow_imp.id(6250938323700833198)
,p_name=>'Favi'
,p_static_id=>'favi'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_REQ'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250938750612833198)
,p_event_id=>wwv_flow_imp.id(6250938323700833198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P15_BUS_FUN_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '',
    '',
    'CURSOR C1 IS',
    ' SELECT *',
    '   FROM user_bus_fun_favourites_apex',
    '  WHERE ubff_bu=:global_bu',
    '    AND ubff_user_id=:global_user',
    '    AND ubff_bus_fun_id=:P15_BUS_FUN_ID;',
    '',
    'v_seq NUMBER(3);',
    '',
    'cr1 c1%ROWTYPE;',
    '',
    'BEGIN',
    '',
    'OPEN c1;',
    'FETCH c1 INTO cr1;',
    'IF c1%FOUND THEN ',
    '',
    'DELETE user_bus_fun_favourites_apex',
    '  WHERE ubff_bu=:global_bu',
    '    AND ubff_user_id=:global_user',
    '    AND ubff_bus_fun_id=:P15_BUS_FUN_ID;',
    '',
    'ELSE  ',
    '',
    'SELECT NVL(max(ubff_seq_no),0) + 1 into v_seq',
    '  FROM user_bus_fun_favourites',
    ' WHERE ubff_bu=:global_bu;',
    '',
    '',
    'INSERT INTO user_bus_fun_favourites_apex (ubff_bu,',
    '                                     ubff_user_id,',
    '                                     ubff_bus_fun_id,',
    '                                     ubff_seq_no,',
    '                                     ubff_gif_icon_name,',
    '                                     ubff_cre_by,',
    '                                     ubff_cre_date)',
    '     VALUES (:global_bu,',
    '             :global_user,',
    '             :P15_BUS_FUN_ID,',
    '             v_seq,',
    '             ''forms'',',
    '             :global_user,',
    '             sysdate);',
    '',
    'END IF;',
    'COMMIT;',
    'END;             ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250939319691833198)
,p_event_id=>wwv_flow_imp.id(6250938323700833198)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11288511647987785858)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250939759410833200)
,p_event_id=>wwv_flow_imp.id(6250938323700833198)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11157210098180020257)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250940239837833200)
,p_event_id=>wwv_flow_imp.id(6250938323700833198)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11249579754810366164)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250940754367833200)
,p_event_id=>wwv_flow_imp.id(6250938323700833198)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6420575866374256100)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6250937333438833193)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6250937870050833196)
,p_event_id=>wwv_flow_imp.id(6250937333438833193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'SRCH_MENU',
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6250936985544833192)
,p_process_sequence=>14
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Favi'
,p_static_id=>'favi'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'',
'CURSOR C1 IS',
' SELECT *',
'   FROM user_bus_fun_favourites_apex',
'  WHERE ubff_bu=:global_bu',
'    AND ubff_user_id=:global_user',
'    AND ubff_bus_fun_id=:P15_BUS_FUN_ID;',
'',
'v_seq NUMBER(3);',
'',
'cr1 c1%ROWTYPE;',
'',
'BEGIN',
'',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'IF c1%FOUND THEN ',
'',
'DELETE user_bus_fun_favourites_apex',
'  WHERE ubff_bu=:global_bu',
'    AND ubff_user_id=:global_user',
'    AND ubff_bus_fun_id=:P15_BUS_FUN_ID;',
'',
'ELSE  ',
'',
'SELECT NVL(max(ubff_seq_no),0) + 1 into v_seq',
'  FROM user_bus_fun_favourites',
' WHERE ubff_bu=:global_bu;',
'',
'',
'INSERT INTO user_bus_fun_favourites_apex (ubff_bu,',
'                                     ubff_user_id,',
'                                     ubff_bus_fun_id,',
'                                     ubff_seq_no,',
'                                     ubff_gif_icon_name,',
'                                     ubff_cre_by,',
'                                     ubff_cre_date)',
'     VALUES (:global_bu,',
'             :global_user,',
'             :P15_BUS_FUN_ID,',
'             v_seq,',
'             ''forms'',',
'             :global_user,',
'             sysdate);',
'',
'END IF;',
'COMMIT;',
'END;             '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>768975150001222164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6250936581834833192)
,p_process_sequence=>24
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p15_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p15_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT DISTINCT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p15_search AND wbf_visible=''Y'';',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p15_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p15_search, 1)',
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
,p_internal_uid=>768974746291222164
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6250936172783833187)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>':GLOBAL_PAGE_DESC:=:P15_NODE_DESC;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>768974337240222159
);
wwv_flow_imp.component_end;
end;
/
