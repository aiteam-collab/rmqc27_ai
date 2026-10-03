prompt --application/shared_components/navigation/lists/main_link_new
begin
--   Manifest
--     LIST: Main_Link(New)
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
 p_id=>wwv_flow_imp.id(6284854553977305695)
,p_name=>'Main_Link(New)'
,p_static_id=>'main-link-new'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lvl,title,',
'  CASE WHEN WBF_NODE_TYPE = ''MOD'' THEN',
'        NULL',
'       ELSE ',
'       link END LINK,',
'image from(',
'select lv-1 lvl, title, link,',
'IMAGE,WBF_BUS_FUN_ID,WBF_NODE_TYPE,WBF_PAR_FUN_ID  from(',
'SELECT ',
'    level lv,',
'   image,WBF_NODE_TYPE, (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'-- func_find_busfun_desc_apex(:global_bu, WBF_BUS_FUN_ID,DECODE(wbf_par_fun_id,''SUITE031'',''2'',''1'')) TITLE,',
'       CASE WHEN wbf_appl_no=''401'' THEN ',
'                   DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||777||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)'
||'||'',''||:APP_SESSION)',
'                                   ELSE',
'                  DECODE(wbf_bus_fun_type,''MOD'',NULL,''f?p=''||NVL(wbf_appl_no,''&APP_ID.'')||'':''||106||'':&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||NVL(wbf_page_no,1)|'
||'|'',''||:APP_SESSION)',
'                                   END link,',
'WBF_BUS_FUN_ID,WBF_PAR_FUN_ID ',
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
'WBF_BUS_FUN_TYPE,WBF_NODE_TYPE,',
'WBF_APPL_NO,',
'WBF_PAGE_NO,',
'WBF_VISIBLE,',
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
'and wbf_node_type  IN (''MOD'',''RPT'',''REP'')',
'START WITH WBF_PAR_FUN_ID is null --=NVL(:P4_NODE,''PROD'')',
'CONNECT BY WBF_PAR_FUN_ID=PRIOR WBF_BUS_FUN_ID',
'ORDER SIBLINGS BY seq_no)) ',
'',
'',
''))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
