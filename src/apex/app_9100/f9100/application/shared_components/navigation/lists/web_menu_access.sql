prompt --application/shared_components/navigation/lists/web_menu_access
begin
--   Manifest
--     LIST: Web_Menu_Access
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
 p_id=>wwv_flow_imp.id(11121710478830519346)
,p_name=>'Web_Menu_Access'
,p_static_id=>'web-menu-access'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lvl,',
'       title,',
'       link,',
'       image',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               link,',
'               image,',
'               id2',
'          FROM (           SELECT LEVEL lv,',
'                                  ''#WORKSPACE_IMAGES#fa-dashboard'' image,',
'                                  (SELECT wbf_bus_fun_name',
'                   FROM wapl_bus_fun',
'                  WHERE wbf_bus_fun_id=id2)',
'                                     title,',
'                                  /*  DECODE (',
'                                       wbf_file_type,',
'                                       ''FOLD'', NULL,',
'                                          ''f?p=''',
'                                       || NVL (wbf_app_id, ''&APP_ID.'')',
'                                       || '':''',
'                                       || NVL (wbf_page_id, 1)',
'                                       || '':&SESSION.:::::'')*/',
'                                  NULL link,',
'                                  id2',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT wbf_par_fun_id,',
'                                                      wbf_bus_fun_id id2,',
'                                                      wbf_bus_fun_type,',
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
'                                                    FROM wapl_user_bus_fun_accs',
'                                                   WHERE wubfa_user_id = :global_user --DECODE (:global_user,:global_bu|| ''ERPADMIN'', ''ERPADMIN'', :global_user)',
'                                                  UNION ALL',
'                                                  SELECT wrbfa_bus_fun_id',
'                                                    FROM wapl_user_role_accs,',
'                                                         wapl_role_bus_fun_accs',
'                                                   WHERE wura_role_id = wrbfa_role_id',
'                                                         AND wura_user_id = :global_user)',
'                                   CONNECT BY id2 = PRIOR wbf_par_fun_id)',
'                            WHERE LEVEL <> 0',
'                            START WITH wbf_par_fun_id = NVL(:P4_NODE,''PROD'')',
'                       CONNECT BY wbf_par_fun_id = PRIOR id2',
'                ORDER SIBLINGS BY seq_no))'))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
