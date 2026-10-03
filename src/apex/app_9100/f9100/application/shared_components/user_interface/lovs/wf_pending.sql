prompt --application/shared_components/user_interface/lovs/wf_pending
begin
--   Manifest
--     WF_PENDING
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
 p_id=>wwv_flow_imp.id(5529030358124080767)
,p_lov_name=>'WF_PENDING'
,p_static_id=>'wf-pending'
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
,p_version_scn=>'17793192086'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529116673113217992)
,p_query_column_name=>'WF_BUS_PROC_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529116293237217992)
,p_query_column_name=>'WF_BUS_PROC_ID'
,p_heading=>'Proc.ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
