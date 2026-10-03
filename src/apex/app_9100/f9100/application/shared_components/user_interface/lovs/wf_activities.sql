prompt --application/shared_components/user_interface/lovs/wf_activities
begin
--   Manifest
--     WF_ACTIVITIES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(5528800194394910738)
,p_lov_name=>'WF_ACTIVITIES'
,p_static_id=>'wf-activities'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WF_BUS_PROC_ID,',
'       WF_BUS_PROC_DESC',
'  FROM WORK_FLOW',
' WHERE WF_BU= :GLOBAL_BU',
'ORDER BY 2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WF_BUS_PROC_ID'
,p_display_column_name=>'WF_BUS_PROC_DESC'
,p_version_scn=>'17790358832'
);
wwv_flow_imp.component_end;
end;
/
