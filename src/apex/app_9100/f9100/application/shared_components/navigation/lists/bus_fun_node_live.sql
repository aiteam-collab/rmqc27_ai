prompt --application/shared_components/navigation/lists/bus_fun_node_live
begin
--   Manifest
--     LIST: Bus. Fun. Node - Live
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
 p_id=>wwv_flow_imp.id(11121661061309958996)
,p_name=>'Bus. Fun. Node - Live'
,p_static_id=>'bus-fun-node-live'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl, title,link, ',
'    CASE',
'        WHEN wbf_page_no = :APP_PAGE_ID THEN ''Y''',
'        ELSE ''N''',
'    END AS "is_current",image,wbf_node_type',
'  FROM (           SELECT LEVEL lvl,  wbf_par_fun_id, wbf_node_type, wbf_icon image, NVL (',
'                             (SELECT albfn_target FROM apex_lang_bus_fun_name  WHERE albfn_lang_type = :global_lang AND albfn_id = wbf_bus_fun_id), wbf_bus_fun_name)',
'                             title,',
'                             decode(wbf_node_type, ''MOD'', NULL, ''f?p=''||nvl(wbf_appl_no, ''&APP_ID.'')||'':''||nvl(wbf_page_no, 1)||'':''||:APP_SESSION||''::::'') link,',
'                          wbf_bus_fun_id, wbf_page_no',
'                     FROM (    SELECT DISTINCT *',
'                                 FROM (SELECT wbf_icon,wbf_appl_no,wbf_page_no,wbf_bus_fun_name,wbf_par_fun_id,wbf_node_type, wbf_bus_fun_id,',
'                                              DECODE (wbf_bus_fun_type,NULL, TO_CHAR (wbf_seq_no, ''0000000''),NVL (TO_CHAR (wbf_seq_no, ''0000000''),wbf_bus_fun_id))AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' --and wbf_web_visible = ''Y''',
'                                            AND WBF_BUS_FUN_ID IN (''DOC1011'',''1000300'',''1000200'',''1000120'',''1000110'',''1000100'')',
'                                         union',
'                                         SELECT wbf_icon,wbf_appl_no,wbf_page_no,wbf_bus_fun_name,wbf_par_fun_id,wbf_node_type, wbf_bus_fun_id,',
'                                              DECODE (wbf_bus_fun_type,NULL, TO_CHAR (wbf_seq_no, ''0000000''),NVL (TO_CHAR (wbf_seq_no, ''0000000''),wbf_bus_fun_id))AS seq_no',
'                                         FROM wapl_bus_fun',
'                                        WHERE wbf_visible = ''Y'' AND wbf_active_flag = ''Y'' --and wbf_web_visible = ''Y''',
'                                            AND WBF_BUS_FUN_ID IN (''1000400'')',
'                                            AND  wbf_bus_fun_id IN',
'                                         (SELECT wubfa_bus_fun_id',
'                                            FROM wapl_user_bus_fun_accs',
'                                           WHERE wubfa_bu = :global_bu',
'                                                 AND wubfa_user_id = :global_user',
'                                                 AND TRUNC (SYSDATE) BETWEEN wubfa_date_from',
'                                                                         AND wubfa_date_to))',
'                           CONNECT BY wbf_bus_fun_id = PRIOR wbf_par_fun_id)',
'               START WITH wbf_par_fun_id IS NULL',
'               CONNECT BY wbf_par_fun_id = PRIOR wbf_bus_fun_id',
'        ORDER SIBLINGS BY seq_no)'))
,p_version_scn=>'22981373418'
);
wwv_flow_imp.component_end;
end;
/
