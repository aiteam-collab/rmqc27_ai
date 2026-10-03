prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Favourite Menu'
,p_alias=>'FAVOURITE-MENU'
,p_step_title=>'Favourite Menu'
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
 p_id=>wwv_flow_imp.id(6388094598180675455)
,p_name=>'Favourites'
,p_static_id=>'favourites'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--cols t-MediaList--4cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title LIST_TEXT,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,',
'		id2',
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
'                            where wbf_node_type  IN (''RPT'',''REP'',''FRM'',''SET'')',
'                            AND  (SELECT COUNT (*)',
'                           FROM user_bus_fun_favourites_apex',
'                            WHERE     ubff_bu = :global_bu',
'                               AND ubff_user_id = :global_user',
'                               AND ubff_bus_fun_id = id2) = 1',
'                            START WITH wbf_par_fun_id IS NULL',
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
 p_id=>wwv_flow_imp.id(6274986599644893937)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6274987366306893943)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>80
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6274985380671893929)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>30
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6274986932560893940)
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
 p_id=>wwv_flow_imp.id(6274986148544893936)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6274985765737893932)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>40
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6274984931139893926)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>20
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11426966137198918871)
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
 p_id=>wwv_flow_imp.id(6388034272605518054)
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
 p_id=>wwv_flow_imp.id(6275014157006894112)
,p_query_column_id=>5
,p_column_alias=>'''NO'''
,p_column_display_sequence=>10
,p_column_heading=>'&#x27;no&#x27;'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6275016168468894118)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6275014963423894115)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>30
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6275015826334894118)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6275015340703894117)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>40
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6275014566433894114)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>20
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6274983084353893920)
,p_name=>'P17_BUS_FUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11426966137198918871)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6274983484058893921)
,p_name=>'P17_NODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11426966137198918871)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6274983882988893921)
,p_name=>'P17_NODE_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11426966137198918871)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6274984241397893923)
,p_name=>'P17_REQ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11426966137198918871)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6274982716747893915)
,p_name=>'P17_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11426966137198918871)
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
 p_id=>wwv_flow_imp.id(6275018676457894128)
,p_name=>'Favi'
,p_static_id=>'favi'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_REQ'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6275019172197894128)
,p_event_id=>wwv_flow_imp.id(6275018676457894128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P17_BUS_FUN_ID',
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
    '    AND ubff_bus_fun_id=:P17_BUS_FUN_ID;',
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
    '    AND ubff_bus_fun_id=:P17_BUS_FUN_ID;',
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
    '             :P17_BUS_FUN_ID,',
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6275017792179894123)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6275018247038894125)
,p_event_id=>wwv_flow_imp.id(6275017792179894123)
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
 p_id=>wwv_flow_imp.id(6275017423237894123)
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
'    AND ubff_bus_fun_id=:P17_BUS_FUN_ID;',
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
'    AND ubff_bus_fun_id=:P17_BUS_FUN_ID;',
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
'             :P17_BUS_FUN_ID,',
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
,p_internal_uid=>793055587694283095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6275016942423894123)
,p_process_sequence=>24
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p17_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p17_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT DISTINCT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p17_search AND wbf_visible=''Y'';',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p17_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p17_search, 1)',
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
,p_internal_uid=>793055106880283095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6275016622731894121)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>':GLOBAL_PAGE_DESC:=:P17_NODE_DESC;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>793054787188283093
);
wwv_flow_imp.component_end;
end;
/
