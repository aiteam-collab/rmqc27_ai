prompt --application/shared_components/user_interface/lovs/lov_wf_id1
begin
--   Manifest
--     LOV_WF_ID1
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
 p_id=>wwv_flow_imp.id(5945118546807612593)
,p_lov_name=>'LOV_WF_ID1'
,p_static_id=>'lov-wf-id-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_bus_proc_desc,',
'       wf_bus_proc_id',
'  FROM work_flow',
' WHERE wf_bu = :Global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WF_BUS_PROC_ID'
,p_display_column_name=>'WF_BUS_PROC_ID'
,p_default_sort_column_name=>'WF_BUS_PROC_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'18193303066'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945118958586612593)
,p_query_column_name=>'WF_BUS_PROC_DESC'
,p_heading=>'Work Flow Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945119386427612593)
,p_query_column_name=>'WF_BUS_PROC_ID'
,p_heading=>'Work Flow Id'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
