prompt --application/shared_components/navigation/lists/main_link
begin
--   Manifest
--     LIST: Main Link
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
 p_id=>wwv_flow_imp.id(6283948088580883918)
,p_name=>'Main Link'
,p_static_id=>'main-link'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lvl,title,link,image from(',
'select lv-1 lvl, title, link,IMAGE,apbuf_fun_id from(',
'SELECT ',
'    level lv,',
'  ''#WORKSPACE_IMAGES#fa-dashboard'' IMAGE,',
' func_find_busfun_desc_apex(:global_bu, apbuf_fun_id,DECODE(apbuf_par_fun_id,''SUITE031'',''2'',''1'')) TITLE,',
'decode(apbuf_file_type,''FOLD'',null,''f?p=''||nvl(apbuf_app_id,''&APP_ID.'')||'':''||nvl(apbuf_page_id,1)||'':&SESSION.:::::'') link,',
'apbuf_fun_id',
'FROM ',
'    (',
'    SELECT DISTINCT * FROM ',
'    (',
'      SELECT ',
'            apbuf_par_fun_id, ',
'            apbuf_fun_id, ',
'            APBUF_GIF_ICON_NAME, ',
'            apbuf_file_name, ',
'APBUF_FILE_TYPE,',
'apbuf_app_id,',
'apbuf_page_id,',
'APBUF_VISIBLE,',
'            DECODE(apbuf_file_type, NULL, ',
'                        TO_CHAR(apbuf_seq_no, ''0000000''), ',
'                        NVL(TO_CHAR(apbuf_seq_no, ''0000000''),apbuf_fun_id) ) AS seq_no',
'        FROM APPL_BUS_FUN_apex',
'where 1=1',
'and apbuf_visible=''Y''',
'and apbuf_fun_id <> ''FAVOR'' /*',
'and ((apbuf_fun_id NOT IN (''MISCORP'',''MISPRIN'',''MISDIS'') AND (SELECT bu_franchise',
'                  FROM business_units',
'                WHERE bu_id=:global_bu)=''R'') OR (apbuf_fun_id NOT IN (''MISCORP'',''MISPRIN'') AND (SELECT bu_franchise',
'                  FROM business_units',
'                WHERE bu_id=:global_bu)=''D'') OR (apbuf_fun_id NOT IN (''MISCORP'') AND (SELECT bu_franchise',
'                  FROM business_units',
'                WHERE bu_id=:global_bu)=''P'') OR  (SELECT bu_franchise',
'                  FROM business_units',
'                WHERE bu_id=:global_bu)=''C'' OR (SELECT bu_franchise',
'                  FROM business_units',
'                WHERE bu_id=:global_bu)=''N'') */',
')START WITH apbuf_fun_id IN (',
'select ABRA_BUS_FUN_ID from appl_bf_role_access_apex',
'where abra_bu= :global_bu',
'and abra_role_id=:global_user)',
'CONNECT BY apbuf_fun_id=PRIOR apbuf_par_fun_id',
')',
'where level <> 1',
'START WITH apbuf_par_fun_id =''PROD''',
'CONNECT BY apbuf_par_fun_id=PRIOR apbuf_fun_id',
'ORDER SIBLINGS BY seq_no)) '))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
