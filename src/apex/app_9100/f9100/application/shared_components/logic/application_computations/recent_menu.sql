prompt --application/shared_components/logic/application_computations/recent_menu
begin
--   Manifest
--     APPLICATION COMPUTATION: RECENT_MENU
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(6914470663806904403)
,p_computation_sequence=>10
,p_computation_item=>'RECENT_MENU'
,p_static_id=>'recent-menu'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PAGE_NAME,application_id,application_name,PAGE_ID,page_view_type,APEX_SESSION_ID,view_dt ',
'from (select application_id,application_name,PAGE_NAME,PAGE_ID,page_view_type,APEX_SESSION_ID,max(view_date) view_dt',
'from apex_workspace_activity_log ',
'where APEX_USER= :global_user and trunc(VIEW_DATE) = trunc(sysdate)  and page_view_type = ''Ajax''',
'and APEX_SESSION_ID = :GLOBAL_SESSION',
'group by application_id,application_name,PAGE_NAME,PAGE_ID,page_view_type,APEX_SESSION_ID',
'order by 7 desc',
')where rownum <=5;',
''))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26773910933'
);
wwv_flow_imp.component_end;
end;
/
