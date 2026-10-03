prompt --application/pages/page_00052
begin
--   Manifest
--     PAGE: 00052
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
 p_id=>52
,p_name=>'Copy of (MENU)'
,p_alias=>'COPY-OF-MENU'
,p_step_title=>'Copy of (MENU)'
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
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12066475227809556300)
,p_name=>'Analytics'
,p_static_id=>'analytics'
,p_parent_plug_id=>wwv_flow_imp.id(12105407026272975993)
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
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
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
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P52_NODE,P52_NODE_DESC'
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
 p_id=>wwv_flow_imp.id(6405944273510113037)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405945115314113040)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405943860674113034)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405944679023113038)
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
 p_id=>wwv_flow_imp.id(6405943455050113028)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405943127518113024)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405942695471113020)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>2
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12112743773431736515)
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
 p_id=>wwv_flow_imp.id(7237471339373446236)
,p_name=>'Reports'
,p_static_id=>'reports'
,p_parent_plug_id=>wwv_flow_imp.id(12105407026272975993)
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
'                      -- DECODE (wbf_bus_fun_type,''MOD'', NULL,''f?p=''|| NVL (400, 400)|| '':''|| NVL (111, 1)|| '':&SESSION.:::::'')',
'                                   CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.:4'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,'
||'4)||'',''||:APP_SESSION)',
'                          WHEN wbf_appl_no = ''800''  THEN',
'                    DECODE (''FOLD'',''FOLD'', ''f?p=''|| NVL (wbf_appl_no, ''&APP_ID.'') || '':'' || NVL(WBF_PAGE_NO,4)|| '':&SESSION.::NO:RP:P52_NODE,P52_NODE_DESC:''|| wbf_par_fun_id|| '',''|| (SELECT wbf_bus_fun_name',
'                              FROM wapl_bus_fun WHERE wbf_bus_fun_id =id2),NULL) ',
'                                  ELSE',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   END link,',
'               --DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.:4'')||'':''||106||'':&SESSION.:4:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,4)||'',''||:APP_SESSION)'
||'                 ',
'                                  id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                                                      wbf_bus_fun_id id2,wvbfa_bus_fun_id,',
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
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM (SELECT lvl,',
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
'wbf_icon image,',
'(SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'   title,',
'                      -- DECODE (wbf_bus_fun_type,''MOD'', NULL,''f?p=''|| NVL (400, 400)|| '':''|| NVL (111, 1)|| '':&SESSION.:::::'')',
' CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.:4'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,'
||'4)||'',''||:APP_SESSION)',
'                          WHEN wbf_appl_no = ''900''  THEN',
'                    DECODE (''FOLD'',''FOLD'', ''f?p=''|| NVL (wbf_appl_no, ''&APP_ID.'') || '':'' || NVL(WBF_PAGE_NO,4)|| '':&SESSION.::NO:RP:P52_NODE,P52_NODE_DESC:''|| id2|| '',''|| (SELECT wbf_bus_fun_name',
'                              FROM wapl_bus_fun WHERE wbf_bus_fun_id =id2),NULL) ',
'ELSE',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
' END link,',
'               --DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.:4'')||'':''||106||'':&SESSION.:4:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,4)||'',''||:APP_SESSION)'
||'                 ',
'id2,wbf_bus_fun_short_name',
'                             FROM (    SELECT DISTINCT *',
'       FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'                    wbf_bus_fun_id id2,wvbfa_bus_fun_id,',
'                    wbf_page_no,',
'                    wbf_bus_fun_type,',
'                    wbf_appl_no,',
'                    --                 wbf_app_id,',
'                    --                 wbf_page_id,',
'                    wbf_visible,',
'                    DECODE (',
'                       wbf_bus_fun_type,',
'                       NULL, TO_CHAR (wbf_seq_no,',
'    ''0000000''),NVL (TO_CHAR (wvbfa_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                FROM wapl_bus_fun,wapl_vert_bus_fun_asso',
'                               WHERE wbf_bus_fun_id=wvbfa_bus_fun_id  ',
'                    AND wbf_visible = ''Y''',
'                    AND wbf_bus_fun_id <> ''FAVOR'')',
' START WITH id2 IN',
'               (SELECT wubfa_bus_fun_id',
'                  FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                  WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                    AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                     AND wvbfa_vertical_id=:global_vertical',
'                    AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                )',
' CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  =''REP''',
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P52_NODE,P52_NODE_DESC'
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
 p_id=>wwv_flow_imp.id(6405938032433112982)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405938833958112995)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405937536156112981)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405938394711112987)
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
 p_id=>wwv_flow_imp.id(6405937136134112978)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405936795142112976)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405936418970112973)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12105407120986975994)
,p_name=>'Setup'
,p_static_id=>'setup'
,p_parent_plug_id=>wwv_flow_imp.id(12105407026272975993)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
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
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
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
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
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
 p_id=>wwv_flow_imp.id(6405945811857113046)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405946224500113048)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405948146571113056)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405947792167113054)
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
 p_id=>wwv_flow_imp.id(6405947392544113053)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405946948462113051)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405946608934113049)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>2
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12105407026272975993)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11974105571179210393)
,p_name=>'Transactions'
,p_static_id=>'transactions'
,p_parent_plug_id=>wwv_flow_imp.id(12105407026272975993)
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
'                            -- DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wb'
||'f_page_no,1)||'',''||:APP_SESSION)',
'                                --   link, ',
'                                CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.:52'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no'
||',52)||'',''||:APP_SESSION)',
'                          WHEN wbf_appl_no = ''800''  THEN',
'                    DECODE (''FOLD'',''FOLD'', ''f?p=''|| NVL (wbf_appl_no, ''&APP_ID.'') || '':'' || NVL(WBF_PAGE_NO,52)|| '':&SESSION.::NO:RP:P52_NODE,P52_NODE_DESC:''|| wbf_par_fun_id|| '',''|| (SELECT wbf_bus_fun_name',
'                              FROM wapl_bus_fun WHERE wbf_bus_fun_id =id2),NULL) ',
'                                  ELSE',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
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
'                                               /*   UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user*/',
'                                                  --       AND wrbfa_vertical_id=NVL(:global_vertical,''0001'')',
'                                                 )',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0 AND wbf_node_type  NOT IN (''RPT'',''SET'',''REP'')',
'                            START WITH wbf_par_fun_id = NVL(:P52_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P52_NODE'
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
 p_id=>wwv_flow_imp.id(6405941615569113013)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'Icon Class'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405942003999113015)
,p_query_column_id=>7
,p_column_alias=>'ID2'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405940647618113009)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405941149428113010)
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
 p_id=>wwv_flow_imp.id(6405940250565113006)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>5
,p_column_heading=>'List Text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405939921056113004)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'List Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6405939452721113003)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>1
,p_column_heading=>'Lvl'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405949947738113067)
,p_name=>'P52_BUS_FUN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12112743773431736515)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405950428207113067)
,p_name=>'P52_NODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12112743773431736515)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405948537642113057)
,p_name=>'P52_NODE_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12105407120986975994)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405950767422113068)
,p_name=>'P52_NODE_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12112743773431736515)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405948882230113062)
,p_name=>'P52_NODE_DESC_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12105407120986975994)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405951158396113068)
,p_name=>'P52_REQ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12112743773431736515)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6405949575374113063)
,p_name=>'P52_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12112743773431736515)
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
 p_id=>wwv_flow_imp.id(6405953658442113073)
,p_name=>'Favi'
,p_static_id=>'favi'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_REQ'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6405954135767113073)
,p_event_id=>wwv_flow_imp.id(6405953658442113073)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P52_BUS_FUN_ID',
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
    '    AND ubff_bus_fun_id=:P52_BUS_FUN_ID;',
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
    '    AND ubff_bus_fun_id=:P52_BUS_FUN_ID;',
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
    '             :P52_BUS_FUN_ID,',
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
 p_id=>wwv_flow_imp.id(6405954671760113073)
,p_event_id=>wwv_flow_imp.id(6405953658442113073)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12105407120986975994)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6405955175378113074)
,p_event_id=>wwv_flow_imp.id(6405953658442113073)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11974105571179210393)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6405955729215113076)
,p_event_id=>wwv_flow_imp.id(6405953658442113073)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12066475227809556300)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6405956148669113076)
,p_event_id=>wwv_flow_imp.id(6405953658442113073)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7237471339373446236)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6405952818064113071)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P52_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6405953257795113071)
,p_event_id=>wwv_flow_imp.id(6405952818064113071)
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
 p_id=>wwv_flow_imp.id(6405952347696113070)
,p_process_sequence=>20
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
'    AND ubff_bus_fun_id=:P52_BUS_FUN_ID;',
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
'    AND ubff_bus_fun_id=:P52_BUS_FUN_ID;',
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
'             :P52_BUS_FUN_ID,',
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
,p_internal_uid=>923990512152502042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6405952001749113070)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p52_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p52_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT DISTINCT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p52_search AND wbf_visible=''Y'';',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p52_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p52_search, 1)',
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
,p_internal_uid=>923990166205502042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6405951566943113070)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>':GLOBAL_PAGE_DESC:=:P52_NODE_DESC;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>923989731399502042
);
wwv_flow_imp.component_end;
end;
/
