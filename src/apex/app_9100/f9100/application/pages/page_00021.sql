prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_name=>'Main Menu'
,p_alias=>'MAIN-MENU'
,p_step_title=>'Main Menu'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="manifest" href="/manifest.json" />',
'<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>',
'<script>',
'    var OneSignal = window.OneSignal || [];',
'	    //let myCustomUniqueUserId = "abc";',
'    var myElement = document.getElementById("P1_NEW");',
'     //let myCustomUniqueUserId = $v("#P1_NEW").text();',
'    //  y = $v("P2_DISPLAY_ONLY");',
'  OneSignal.push(function() {',
'    OneSignal.init({',
'      appId: "3a4cdf95-0a92-4c04-be91-51c4159acfb7",',
'    });',
'    OneSignal.setDefaultTitle("Roadmap IT Solutions Pvt Ltd");',
'    OneSignal.setDefaultNotificationUrl("https://webapp.roadmaperp.com:8449/apex/f?p=700");  ',
'	    //OneSignal.setEmail(myCustomUniqueUserId);',
'      OneSignal.setExternalUserId(myElement);',
'  });',
'</script>'))
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
'.t-Body-title .t-HeroRegion-title, .t-Body-title .t-HeroRegion-col--content {',
'    color: royalblue;',
'    margin-left: 5px;',
'}',
'',
'.t-Body-title, .t-PageBody--masterDetail #t_Body_content_offset {',
'  --  background-color: rgba(222,225,228,.9);',
'  -- background-color: rgba(56, 155, 255, 0.19);',
'    background:linear-gradient(to right, #1fa2ff, #12d8fa, #a6ffcb);',
'}',
'',
'.t-BreadcrumbRegion {',
'    padding: 0px;',
'}',
'',
'',
'.t-Body-contentInner {',
'    padding: 16px;',
'    flex-grow: 1;',
'    width: 100%;',
'    padding-top: 0px;',
'}',
'',
'.t-BreadcrumbRegion--useBreadcrumbTitle .t-Breadcrumb-item:last-child .t-Breadcrumb-label {',
'    overflow: hidden;',
'    display: block;',
'    text-align: center;',
'}',
'',
'a {',
'    color: #0436adf0;',
'    font-family: inherit;',
'    font-size: large;',
'}',
'',
'h1, h2, h3, h4, h5, h6 {',
'    line-height: 1.4;',
'}',
'',
'.t-Body-contentInner {',
'    padding: 16px;',
'    flex-grow: 1;',
'    width: 100%;',
'    padding-top: 0px;',
'    background-color: #ececec4d;',
'}',
'',
'.t-Region--accent1 > .t-Region-header {',
'    background-color: #b3d9ef;',
'    color: black;',
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
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6427124670595564469)
,p_name=>'Analytics'
,p_static_id=>'analytics'
,p_parent_plug_id=>wwv_flow_imp.id(6268443355030084974)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title,',
'       NULL LIST_TEXT,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'               title, Sub_title,',
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
'                                  (SELECT wbf_bus_fun_mis_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                    /* (SELECT wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)*/',
'                                    /* (SELECT wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = (select wbf_par_fun_id',
'                                       from wapl_bus_fun',
'                                       where wbf_bus_fun_id = id2))Sub_title,*/',
'                                     WBF_BUS_FUN_NARRATION Sub_title,',
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
'                                                      wbf_visible,WBF_BUS_FUN_NARRATION,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wubfa_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wubfa_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun,wapl_user_bus_fun_accs',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      and wbf_bus_fun_id = wubfa_bus_fun_id',
'                                                      AND wubfa_user_id = :global_user ',
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
'                            where wbf_node_type  IN (''RPT'')',
'                            START WITH wbf_node_type  IN (''RPT'') --wbf_par_fun_id IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))',
'                WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 )',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291103529317268453)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>80
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291103061984268451)
,p_query_column_id=>8
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291102316615268448)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291102665994268450)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6287573020824182893)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291101449395268443)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_column_html_expression=>'<b><span title="#SUB_TITLE#">#LIST_TITLE#</span></b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291101039324268439)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6307360102484271763)
,p_query_column_id=>3
,p_column_alias=>'SUB_TITLE'
,p_column_display_sequence=>100
,p_column_heading=>'Sub Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11893766702290947376)
,p_plug_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--noPadding:t-HeroRegion--hideIcon:t-HeroRegion--iconsCircle:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6268443355030084974)
,p_plug_name=>'Dashboard / Analytics'
,p_static_id=>'dashboard-analytics'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent1:t-Region--scrollBody:margin-top-md:margin-bottom-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM(SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title LIST_TEXT,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'    title,Sub_title,',
'    link,',
'    wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'   LIST_BADGE,',
'    image,',
'    id2',
'          FROM (SELECT LEVEL lv,',
' wbf_icon image,',
' (SELECT wbf_bus_fun_name',
'        FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id=id2)',
'    title,',
'    WBF_BUS_FUN_NARRATION  Sub_title,',
'  CASE WHEN wbf_appl_no=''401'' THEN ',
'        DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP'
||'_SESSION)',
'  ELSE',
'       DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP_'
||'SESSION)',
'  END link,',
'       /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:AP'
||'P_SESSION)',
'  link, */',
' id2,wbf_bus_fun_short_name',
'       FROM (    SELECT DISTINCT *',
'        FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'          wbf_bus_fun_id id2,',
'          wbf_page_no,',
'          wbf_bus_fun_type,',
'          wbf_appl_no,WBF_BUS_FUN_NARRATION,',
'          --      wbf_app_id,',
'          --      wbf_page_id,',
'          wbf_visible,',
'          DECODE (',
'  wbf_bus_fun_type,',
'  NULL, TO_CHAR (wbf_seq_no,',
'      ''0000000''),',
'  NVL (',
'     TO_CHAR (wbf_seq_no, ''0000000''),',
'     wbf_bus_fun_id))',
'  AS seq_no',
'     FROM wapl_bus_fun',
'    WHERE     1 = 1',
'          AND wbf_visible = ''Y''',
'          AND wbf_bus_fun_id <> ''FAVOR'')',
'  START WITH id2 IN',
'     (SELECT wubfa_bus_fun_id',
'        FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'        WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'          AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'AND wvbfa_vertical_id=:global_vertical',
'          AND wubfa_user_id = :global_user)',
'  CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'      --WHERE LEVEL <> 0 --AND ',
'      where wbf_node_type  IN (''RPT'')',
'      START WITH wbf_par_fun_id IS NULL',
' CONNECT BY wbf_par_fun_id = PRIOR id2',
'     ORDER SIBLINGS BY seq_no)))'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6320458030320687964)
,p_name=>'Favourite'
,p_static_id=>'favourite'
,p_parent_plug_id=>wwv_flow_imp.id(6320457830251687962)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title ,',
'       NULL LIST_TEXT,',
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
'                                  (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                     /*(SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)*/',
'                                      WBF_BUS_FUN_NARRATION Sub_title,',
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
'                                                      wbf_bus_fun_type,WBF_BUS_FUN_NARRATION,',
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
'                            where wbf_node_type  IN (''RPT'',''REP'',''SET'',''FRM'')',
'                            AND  (SELECT COUNT (*)',
'                           FROM user_bus_fun_favourites_apex',
'                            WHERE     ubff_bu = :global_bu',
'                               AND ubff_user_id = :global_user',
'                               AND ubff_bus_fun_id = id2) = 1',
'                            START WITH wbf_par_fun_id IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))',
'                WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 )',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458728938687970)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458742969687971)
,p_query_column_id=>8
,p_column_alias=>'ID2'
,p_column_display_sequence=>70
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458471921687968)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458615317687969)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458379270687967)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458294145687966)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_column_html_expression=>'<b><span title="#SUB_TITLE#">#LIST_TITLE#</span></b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458216656687965)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320459226074687975)
,p_query_column_id=>3
,p_column_alias=>'SUB_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'Sub Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6320457830251687962)
,p_plug_name=>'Frequently Used'
,p_static_id=>'frequently-used'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--accent1:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM(SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title ,',
'       NULL LIST_TEXT,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'  title,Sub_title,',
'  link,',
'  wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'   LIST_BADGE,',
'  image,',
'  id2',
'          FROM (           SELECT LEVEL lv,',
'            wbf_icon image,',
'            (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'      FROM wapl_bus_fun',
'     WHERE wbf_bus_fun_id=id2)',
'  title,',
'  /*(SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'    FROM wapl_bus_fun',
'   WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)*/',
'   WBF_BUS_FUN_NARRATION Sub_title,',
'/* DECODE (',
'    wbf_bus_fun_type,',
'    ''MOD'', NULL,',
'       ''f?p=''',
'    || NVL (''&APP_ID.'', ''&APP_ID.'')',
'    || '':''',
'    || NVL (wbf_page_no, 1)',
'    || '':&SESSION.:::::'')*/',
'    CASE WHEN wbf_appl_no=''401'' THEN ',
'      DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP_S'
||'ESSION)',
'ELSE',
'     DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP_SE'
||'SSION)',
'END link,',
'       /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:AP'
||'P_SESSION)',
'link, */',
'            id2,wbf_bus_fun_short_name',
'       FROM (    SELECT DISTINCT *',
'      FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'          wbf_bus_fun_id id2,',
'          wbf_page_no,',
'          wbf_bus_fun_type,WBF_BUS_FUN_NARRATION,',
'          wbf_appl_no,',
'          --    wbf_app_id,',
'          --    wbf_page_id,',
'          wbf_visible,',
'          DECODE (',
'wbf_bus_fun_type,',
'NULL, TO_CHAR (wbf_seq_no,',
'      ''0000000''),',
'NVL (',
'   TO_CHAR (wbf_seq_no, ''0000000''),',
'   wbf_bus_fun_id))',
'AS seq_no',
'     FROM wapl_bus_fun',
'    WHERE 1 = 1',
'          AND wbf_visible = ''Y''',
'          AND wbf_bus_fun_id <> ''FAVOR'')',
'START WITH id2 IN',
'     (SELECT wubfa_bus_fun_id',
'        FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'        WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'          AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'           AND wvbfa_vertical_id=:global_vertical',
'          AND wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'  )CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'      --WHERE LEVEL <> 0 --AND ',
'      where wbf_node_type  IN (''RPT'',''REP'',''SET'',''FRM'')',
'      AND  (SELECT COUNT (*)',
'     FROM user_bus_fun_favourites_apex',
'      WHERE     ubff_bu = :global_bu',
'         AND ubff_user_id = :global_user',
'         AND ubff_bus_fun_id = id2) = 1',
'      START WITH wbf_par_fun_id IS NULL',
' CONNECT BY wbf_par_fun_id = PRIOR id2',
'   ORDER SIBLINGS BY seq_no))',
'   WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 ))'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6573146772882317485)
,p_plug_name=>'Main_Link(New)'
,p_static_id=>'main-link-new'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(6284923758647865578)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(10650563189065505418)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6268443472606084975)
,p_plug_name=>'Operational Reports'
,p_static_id=>'operational-reports'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent1:t-Region--scrollBody:margin-bottom-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM (SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'     title,Sub_title,',
'     link,',
'     wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'     LIST_BADGE,',
'     image,',
'     id2',
'FROM ( SELECT LEVEL lv,',
'    wbf_icon image,',
'    (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id=id2)',
'       title,',
'       (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)Sub_title,',
'     CASE WHEN wbf_appl_no=''401'' THEN ',
'         DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:AP'
||'P_SESSION)',
'     ELSE',
'        DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP'
||'_SESSION)',
'     END link,',
'    id2,wbf_bus_fun_short_name',
'         FROM (    SELECT DISTINCT *',
' FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'    wbf_bus_fun_id id2,',
'    wbf_page_no,',
'    wbf_bus_fun_type,',
'    wbf_appl_no,',
'    wbf_visible,',
'    DECODE (',
'       wbf_bus_fun_type,',
'       NULL, TO_CHAR (wbf_seq_no,',
'  ''0000000''),',
'       NVL (',
'TO_CHAR (wbf_seq_no, ''0000000''),',
'wbf_bus_fun_id))',
'       AS seq_no',
'         FROM wapl_bus_fun',
'        WHERE     1 = 1',
'    AND wbf_visible = ''Y''',
'    AND wbf_bus_fun_id <> ''FAVOR'')',
'     START WITH id2 IN',
'         (SELECT wubfa_bus_fun_id',
'  FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'  WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'    AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'     AND wvbfa_vertical_id=:global_vertical',
'    AND wubfa_user_id = :global_user)',
'     CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'        --WHERE LEVEL <> 0 --AND ',
'        where wbf_node_type  IN (''REP'')',
'        START WITH wbf_par_fun_id IS NULL',
'   CONNECT BY wbf_par_fun_id = PRIOR id2',
'      ORDER SIBLINGS BY seq_no)))'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6434488844136529344)
,p_name=>'Reports'
,p_static_id=>'reports'
,p_parent_plug_id=>wwv_flow_imp.id(6268443472606084975)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title ,',
'       NULL LIST_TEXT,',
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
'                                  (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                     /*(SELECT wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)*/',
'                                      WBF_BUS_FUN_NARRATION Sub_title,',
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
'                                                      wbf_appl_no,WBF_BUS_FUN_NARRATION,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wubfa_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wubfa_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun ,wapl_user_bus_fun_accs',
'                                                WHERE     1 = 1',
'                                                     and wbf_bus_fun_id = wubfa_bus_fun_id',
'                                                      AND wubfa_user_id = :global_user ',
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
'                            where wbf_node_type  IN (''REP'')',
'                            START WITH wbf_node_type  IN (''REP'') --wbf_par_fun_id IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))',
'                WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291108248114268478)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291107891204268475)
,p_query_column_id=>8
,p_column_alias=>'ID2'
,p_column_display_sequence=>60
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291107049494268470)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291107493942268473)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291106644574268467)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291106275688268464)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_column_html_expression=>'<b><span title="#SUB_TITLE#">#LIST_TITLE#</span></b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291105847515268461)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6287573144784182895)
,p_query_column_id=>3
,p_column_alias=>'SUB_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'Sub Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6317503549844190987)
,p_plug_name=>'Search '
,p_static_id=>'search'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6427125775297564480)
,p_plug_name=>'Setup'
,p_static_id=>'setup'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM(SELECT lvl,',
'       title LIST_TITLE,',
'       Sub_title list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'     title,Sub_title,',
'     link,',
'     wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'     LIST_BADGE,',
'     image,',
'     id2',
'FROM ( SELECT LEVEL lv,',
'    wbf_icon image,',
'    (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id=id2)',
'       title,',
'       (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)Sub_title,',
'     /* DECODE (',
'         wbf_bus_fun_type,',
'         ''MOD'', NULL,',
'  ''f?p=''',
'         || NVL (''&APP_ID.'', ''&APP_ID.'')',
'         || '':''',
'         || NVL (wbf_page_no, 1)',
'         || '':&SESSION.:::::'')*/',
'         CASE WHEN wbf_appl_no=''401'' THEN ',
'         DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:AP'
||'P_SESSION)',
'     ELSE',
'        DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP'
||'_SESSION)',
'     END link,',
'         /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:'
||'APP_SESSION)',
'     link, */',
'    id2,wbf_bus_fun_short_name',
'         FROM (    SELECT DISTINCT *',
' FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'    wbf_bus_fun_id id2,',
'    wbf_page_no,',
'    wbf_bus_fun_type,',
'    wbf_appl_no,',
'    --       wbf_app_id,',
'    --       wbf_page_id,',
'    wbf_visible,',
'    DECODE (',
'       wbf_bus_fun_type,',
'       NULL, TO_CHAR (wbf_seq_no,',
'  ''0000000''),',
'       NVL (',
'TO_CHAR (wbf_seq_no, ''0000000''),',
'wbf_bus_fun_id))',
'       AS seq_no',
'         FROM wapl_bus_fun',
'        WHERE     1 = 1',
'    AND wbf_visible = ''Y''',
'    AND wbf_bus_fun_id <> ''FAVOR'')',
'     START WITH id2 IN',
'         (SELECT wubfa_bus_fun_id',
'  FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'  WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'    AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'     AND wvbfa_vertical_id=:global_vertical',
'    AND wubfa_user_id = :global_user)',
'     CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'        --WHERE LEVEL <> 0 --AND ',
'        where wbf_node_type  IN (''SET'')',
'        START WITH wbf_par_fun_id IS NULL',
'   CONNECT BY wbf_par_fun_id = PRIOR id2',
'      ORDER SIBLINGS BY seq_no)))'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6434489622328529352)
,p_name=>'Setup'
,p_static_id=>'setup-2'
,p_parent_plug_id=>wwv_flow_imp.id(6427125775297564480)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       Sub_title ,',
'       NULL list_text,',
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
'                                  (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                    /* (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)*/',
'                                      WBF_BUS_FUN_NARRATION Sub_title,',
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
'                                                      wbf_bus_fun_type,WBF_BUS_FUN_NARRATION,',
'                                                      wbf_appl_no,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wubfa_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wubfa_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun,WAPL_USER_BUS_FUN_ACCS',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      and wbf_bus_fun_id = wubfa_bus_fun_id',
'                                                      AND wubfa_user_id = :global_user',
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
'                            where wbf_node_type  IN (''SET'')',
'                            START WITH wbf_node_type  IN (''SET'') --wbf_par_fun_id IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))',
'                WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291114992048268536)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291114572930268532)
,p_query_column_id=>8
,p_column_alias=>'ID2'
,p_column_display_sequence=>60
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291113845582268517)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291114143214268520)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291113433446268515)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291113086838268511)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_column_html_expression=>'<b><span title="#SUB_TITLE#">#LIST_TITLE#</span></b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291112662247268506)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320458910934687972)
,p_query_column_id=>3
,p_column_alias=>'SUB_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'Sub Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6427125714187564479)
,p_plug_name=>'Transaction'
,p_static_id=>'transaction'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--accent1:t-Region--scrollBody:margin-bottom-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM (SELECT lvl,',
'       title LIST_TITLE,',
'       Sub_title list_text,',
'       link,',
'       LIST_BADGE,',
'       ''fa '' ||image ICON_CLASS,id2',
'  FROM (SELECT lv - 1 lvl,',
'     title,Sub_title,',
'     link,',
'     wbf_bus_fun_short_name,',
'        CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'     LIST_BADGE,',
'     image,',
'     id2',
'FROM ( SELECT LEVEL lv,',
'    wbf_icon image,',
'    (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id=id2)',
'       title,',
'       (SELECT wbf_bus_fun_name',
'         FROM wapl_bus_fun',
'        WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)Sub_title,',
'     /* DECODE (',
'         wbf_bus_fun_type,',
'         ''MOD'', NULL,',
'  ''f?p=''',
'         || NVL (''&APP_ID.'', ''&APP_ID.'')',
'         || '':''',
'         || NVL (wbf_page_no, 1)',
'         || '':&SESSION.:::::'')*/',
'         CASE WHEN wbf_appl_no=''401'' THEN ',
'         DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:AP'
||'P_SESSION)',
'     ELSE',
'        DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:APP'
||'_SESSION)',
'     END link,',
'         /*DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)||'',''||:'
||'APP_SESSION)',
'     link, */',
'    id2,wbf_bus_fun_short_name',
'         FROM (    SELECT DISTINCT *',
' FROM (SELECT wbf_icon,wbf_par_fun_id,wbf_bus_fun_short_name,wbf_node_type,',
'    wbf_bus_fun_id id2,',
'    wbf_page_no,',
'    wbf_bus_fun_type,',
'    wbf_appl_no,',
'    --       wbf_app_id,',
'    --       wbf_page_id,',
'    wbf_visible,',
'    DECODE (',
'       wbf_bus_fun_type,',
'       NULL, TO_CHAR (wbf_seq_no,',
'  ''0000000''),',
'       NVL (',
'TO_CHAR (wbf_seq_no, ''0000000''),',
'wbf_bus_fun_id))',
'       AS seq_no',
'         FROM wapl_bus_fun',
'        WHERE     1 = 1',
'    AND wbf_visible = ''Y''',
'    AND wbf_bus_fun_id <> ''FAVOR'')',
'     START WITH id2 IN',
'         (SELECT wubfa_bus_fun_id',
'  FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'  WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'    AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'     AND wvbfa_vertical_id=:global_vertical',
'    AND wubfa_user_id = :global_user )',
'     CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'        --WHERE LEVEL <> 0 --AND ',
'        where wbf_node_type  IN (''FRM'')',
'        START WITH wbf_par_fun_id IS NULL',
'   CONNECT BY wbf_par_fun_id = PRIOR id2',
'      ORDER SIBLINGS BY seq_no)))'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6434488040294529336)
,p_name=>'Transaction'
,p_static_id=>'transaction-2'
,p_parent_plug_id=>wwv_flow_imp.id(6427125714187564479)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--4cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title LIST_TITLE,',
'       --wbf_bus_fun_short_name ',
'       NULL list_text,',
'       Sub_title,',
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
'                                  (SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                     /*(SELECT wbf_bus_fun_mis_name wbf_bus_fun_name',
'                                       FROM wapl_bus_fun',
'                                      WHERE wbf_bus_fun_id = WBF_PAR_FUN_ID)Sub_title,*/',
'                                      Sub_title,',
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
'                                                     wbf_appl_no,WBF_BUS_FUN_NARRATION  Sub_title,',
'                                                      --                 wbf_app_id,',
'                                                      --                 wbf_page_id,',
'                                                      wbf_visible,',
'                                                      DECODE (',
'                                                         wbf_bus_fun_type,',
'                                                         NULL, TO_CHAR (wubfa_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (wubfa_seq_no, ''0000000''),',
'                                                            wbf_bus_fun_id))',
'                                                         AS seq_no',
'                                                 FROM wapl_bus_fun,WAPL_USER_BUS_FUN_ACCS',
'                                                WHERE     1 = 1',
'                                                      AND wbf_visible = ''Y''',
'                                                      and wbf_bus_fun_id = wubfa_bus_fun_id',
'                                                      AND wubfa_user_id = :global_user ',
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
'                            where wbf_node_type  IN (''FRM'')',
'                            START WITH wbf_node_type  IN (''FRM'') --wbf_par_fun_id IS NULL',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))',
'                WHERE (INSTR(UPPER(title), UPPER(NVL(:P21_SEARCH, title))) > 0 )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291111690646268501)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291111296879268498)
,p_query_column_id=>8
,p_column_alias=>'ID2'
,p_column_display_sequence=>60
,p_column_heading=>'Id2'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291110460601268492)
,p_query_column_id=>5
,p_column_alias=>'LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291110910462268495)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291110112587268489)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291109721594268487)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_column_html_expression=>'<b><span title="#SUB_TITLE#">#LIST_TITLE#</span></b>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6291109275141268486)
,p_query_column_id=>1
,p_column_alias=>'LVL'
,p_column_display_sequence=>10
,p_column_heading=>'Lvl'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320459075186687974)
,p_query_column_id=>4
,p_column_alias=>'SUB_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'Sub Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6291132265882268668)
,p_button_sequence=>10
,p_button_name=>'close'
,p_static_id=>'close'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6291104473040268456)
,p_name=>'P21_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11893766702290947376)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317503669335190988)
,p_name=>'P21_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6317503549844190987)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_placeholder=>'Search Here..'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_grid_column=>8
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6291104836540268459)
,p_name=>'P21_UN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11893766702290947376)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317503760090190989)
,p_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317503923753190990)
,p_event_id=>wwv_flow_imp.id(6317503760090190989)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6427124670595564469)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6320459269452687976)
,p_name=>'Favourites'
,p_static_id=>'favourites'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6320459408617687977)
,p_event_id=>wwv_flow_imp.id(6320459269452687976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6320458030320687964)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317503968701190991)
,p_name=>'Reports'
,p_static_id=>'reports'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317504069191190992)
,p_event_id=>wwv_flow_imp.id(6317503968701190991)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6434488844136529344)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317504422282190995)
,p_name=>'Setup'
,p_static_id=>'setup'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317504517978190996)
,p_event_id=>wwv_flow_imp.id(6317504422282190995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6434489622328529352)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317504161131190993)
,p_name=>'Transaction'
,p_static_id=>'transaction'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317504251837190994)
,p_event_id=>wwv_flow_imp.id(6317504161131190993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6434488040294529336)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
