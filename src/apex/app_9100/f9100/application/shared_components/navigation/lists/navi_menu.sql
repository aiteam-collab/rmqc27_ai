prompt --application/shared_components/navigation/lists/navi_menu
begin
--   Manifest
--     LIST: Navi_Menu
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
 p_id=>wwv_flow_imp.id(11198676484619564643)
,p_name=>'Navi_Menu'
,p_static_id=>'navi-menu'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl, title,link,NULL,image',
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
'                                                                          NVL (TO_CHAR (wbf_seq_no,''0000000''),wbf_bus_fun_id)) AS seq_no',
'                                                                  FROM wapl_bus_fun',
'                                                                 WHERE wbf_visible = ''Y'' AND wbf_bus_fun_id <> ''FAVOR'')',
'                                                    START WITH id2 IN',
'                                                                  (SELECT wubfa_bus_fun_id FROM wapl_user_bus_fun_accs',
'                                                                    WHERE wubfa_user_id = :global_user ',
'                                                                   UNION ALL',
'                                                                   SELECT wrbfa_bus_fun_id FROM wapl_user_role_accs,wapl_role_bus_fun_accs',
'                                                                    WHERE wura_role_id = wrbfa_role_id',
'                                                                          AND wura_user_id =:global_user)',
'                                                    CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                                             WHERE LEVEL IN (1,2)',
'                                                   AND wbf_bus_fun_type = ''MOD''',
'                                        START WITH wbf_par_fun_id IS NULL',
'                                        CONNECT BY wbf_par_fun_id = PRIOR id2',
'                                 ORDER SIBLINGS BY seq_no',
')))',
'        SELECT lvl,title,CASE  WHEN (SELECT COUNT (*) FROM node tm1 WHERE tm1.wbf_par_fun_id = tr1.id2) > 0 THEN NULL ELSE link END  link,NULL, image FROM node tr1)'))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
