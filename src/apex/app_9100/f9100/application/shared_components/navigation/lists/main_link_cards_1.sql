prompt --application/shared_components/navigation/lists/main_link_cards_1
begin
--   Manifest
--     LIST: Main_Link(Cards)1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(5697200238160491188)
,p_name=>'Main_Link(Cards)1'
,p_static_id=>'main-link-cards'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lvl,title LIST_TITLE,link, --,Sub_title LIST_TEXT,',
' ''fa '' ||image ICON_CLASS,LIST_BADGE --,Sub_title',
'  from(',
'select lv-1 lvl, title, link,LIST_BADGE,',
'image,WBF_BUS_FUN_ID--Sub_title',
' from(',
'SELECT ',
'    level lv,',
'   image, (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'               /*  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE WBF_PAR_FUN_ID=id2',
'                  and wbf_seq_no = seq )',
'                                     Sub_title,*/',
'-- func_find_busfun_desc_apex(:global_bu, WBF_BUS_FUN_ID,DECODE(wbf_par_fun_id,''SUITE031'',''2'',''1'')) TITLE,',
'       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'WBF_BUS_FUN_ID,',
'  CASE WHEN  (SELECT COUNT(*)',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user',
'        AND ubff_bus_fun_id=id2)=1 THEN ''<span class="fa fa-heart" aria-hidden="true" style="color:red"></span>'' ELSE ''<span aria-hidden="true" class="fa fa-heart-o"></span>'' END ',
'                         LIST_BADGE',
'FROM ',
'    (',
'    SELECT DISTINCT * FROM ',
'    (',
'      SELECT ',
'            WBF_PAR_FUN_ID, ',
'            WBF_BUS_FUN_ID, ',
'             wbf_bus_fun_id id2,',
'            wbf_icon image, ',
'            WBF_BUS_FUN_NAME, ',
'WBF_BUS_FUN_TYPE,',
'WBF_APPL_NO,',
'WBF_PAGE_NO,',
'WBF_VISIBLE,',
'WBF_SEQ_NO seq,',
'            DECODE(wbf_bus_fun_type, NULL, ',
'                        TO_CHAR(WBF_SEQ_NO, ''0000000''), ',
'                        NVL(TO_CHAR(WBF_SEQ_NO, ''0000000''),WBF_BUS_FUN_ID) ) AS seq_no',
'        FROM wapl_bus_fun',
'where 1=1',
'and WBF_VISIBLE=''Y''',
'and WBF_BUS_FUN_ID <> ''FAVOR'' ',
')START WITH WBF_BUS_FUN_ID IN  (SELECT wubfa_bus_fun_id',
'                                                    FROM wapl_vert_bus_fun_asso,wapl_user_bus_fun_accs',
'                                                    WHERE wvbfa_bus_fun_id=wubfa_bus_fun_id ',
'                                                      AND (TRUNC(SYSDATE) BETWEEN wubfa_date_from  AND wubfa_date_to) ',
'                                                       AND wvbfa_vertical_id=:global_vertical',
'                                                      AND wubfa_user_id = :global_user ',
'                                                 )',
'CONNECT BY WBF_BUS_FUN_ID=PRIOR WBF_PAR_FUN_ID',
')',
'where level <> 1',
'START WITH WBF_PAR_FUN_ID is null --=NVL(:P4_NODE,''PROD'')',
'CONNECT BY WBF_PAR_FUN_ID=PRIOR WBF_BUS_FUN_ID',
'ORDER SIBLINGS BY seq_no)) ',
'',
'',
''))
,p_version_scn=>'17751217186'
);
wwv_flow_imp.component_end;
end;
/
