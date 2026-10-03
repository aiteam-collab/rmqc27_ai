prompt --application/shared_components/navigation/lists/dynamic_tree
begin
--   Manifest
--     LIST: Dynamic_Tree
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
 p_id=>wwv_flow_imp.id(11049879175080028832)
,p_name=>'Dynamic_Tree'
,p_static_id=>'dynamic-tree'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 lvl,',
'       title,',
'       link,',
'       NULL,',
'       image',
'  FROM (SELECT lv - 1 lvl,',
'               title,',
'               DECODE (',
'                  ''FOLD'',',
'                  ''FOLD'',',
'                     ''f?p=''',
'                  || NVL (700, ''&APP_ID.'')',
'                  || '':''',
'                  || 4',
'                  || '':&SESSION.::NO:RP:P4_NODE,P4_NODE_DESC:''',
'                  || apbuf_fun_id',
'                  || '',''',
'                  || title,NULL)',
'                  link,',
'               image,',
'               apbuf_fun_id',
'          FROM (           SELECT LEVEL lv,',
'                                  apbuf_mis_image image,',
'                                  func_find_busfun_desc (',
'                                     :global_bu,',
'                                     apbuf_fun_id,',
'                                     DECODE (apbuf_par_fun_id, ''SUITE031'', ''2'', ''1''))',
'                                     title,',
'                                  apbuf_fun_id',
'                             FROM (    SELECT DISTINCT *',
'                                         FROM (SELECT apbuf_mis_image,',
'                                                      apbuf_par_fun_id,',
'                                                      apbuf_fun_id,',
'                                                      apbuf_gif_icon_name,',
'                                                      apbuf_file_name,',
'                                                      apbuf_file_type,',
'                                                      --                 apbuf_app_id,',
'                                                      --                 apbuf_page_id,',
'                                                      apbuf_visible,',
'                                                      DECODE (',
'                                                         apbuf_file_type,',
'                                                         NULL, TO_CHAR (apbuf_seq_no,',
'                                                                        ''0000000''),',
'                                                         NVL (',
'                                                            TO_CHAR (apbuf_seq_no,',
'                                                                     ''0000000''),',
'                                                            apbuf_fun_id))',
'                                                         AS seq_no',
'                                                 FROM appl_bus_fun',
'                                                WHERE     1 = 1',
'                                                      AND apbuf_visible = ''Y''',
'                                                      AND apbuf_fun_id <> ''FAVOR'')',
'                                   START WITH apbuf_fun_id IN',
'                                                 (SELECT abra_bus_fun_id',
'                                                    FROM appl_bf_role_access',
'                                                   WHERE abra_bu = :global_bu',
'                                                         AND abra_role_id =',
'                                                                DECODE (',
'                                                                   :global_user,',
'                                                                   :global_bu',
'                                                                   || ''ERPADMIN'', ''ERPADMIN'',',
'                                                                   :global_user))',
'                                   CONNECT BY apbuf_fun_id = PRIOR apbuf_par_fun_id)',
'                            WHERE LEVEL = 1',
'                       START WITH apbuf_par_fun_id = ''PROD''',
'                       CONNECT BY apbuf_par_fun_id = PRIOR apbuf_fun_id',
'                ORDER SIBLINGS BY seq_no))'))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
