prompt --application/shared_components/logic/application_processes/global_fav
begin
--   Manifest
--     APPLICATION PROCESS: GLOBAL_FAV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(7378503452583458295)
,p_process_sequence=>2
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GLOBAL_FAV'
,p_static_id=>'global-fav'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   V_FAV VARCHAR2(5) :=''N'';',
'BEGIN  ',
'',
'   SELECT NVL(wubfa_user_fav,''N'')',
'     INTO V_FAV',
'     FROM wapl_bus_fun,wapl_user_bus_fun_accs',
'    WHERE wubfa_bus_fun_id = wbf_bus_fun_id',
'      AND (wubfa_fav_bu = :Global_bu OR wubfa_fav_bu IS NULL)',
'      AND wubfa_user_id = :Global_user',
'      AND wbf_appl_no = :APP_ID',
'      AND wbf_visible =''Y''',
'      AND wbf_page_no = :APP_PAGE_ID;',
'',
'   proc_upd_favour_web (:Global_bu,',
'                        V_FAV,',
'                        :APP_ID,',
'                        :APP_PAGE_ID,',
'                        :Global_user);',
'   COMMIT;',
'   SELECT wubfa_user_fav',
'     INTO V_FAV',
'     FROM wapl_bus_fun,wapl_user_bus_fun_accs',
'    WHERE wubfa_bus_fun_id = wbf_bus_fun_id',
'      AND wubfa_fav_bu = :Global_bu',
'      AND wubfa_user_id = :Global_user',
'      AND wbf_appl_no = :APP_ID',
'      AND wbf_visible =''Y''',
'      AND wbf_page_no = :APP_PAGE_ID;',
'   htp.p(V_FAV);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>'22157294069'
);
wwv_flow_imp.component_end;
end;
/
