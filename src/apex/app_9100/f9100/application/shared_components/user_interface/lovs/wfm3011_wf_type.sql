prompt --application/shared_components/user_interface/lovs/wfm3011_wf_type
begin
--   Manifest
--     WFM3011_WF_TYPE
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
 p_id=>wwv_flow_imp.id(6828373881004285423)
,p_lov_name=>'WFM3011_WF_TYPE'
,p_static_id=>'wfm3011-wf-type'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT WFDC_TYPE, (SELECT UPPER(wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_bu AND wf_bus_proc_id = WFDC_TYPE) WFDCH_TYPE_DESC ',
'  from work_flow_log_vw',
'  WHERE WFDC_BU = :GLOBAL_BU'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDC_TYPE'
,p_display_column_name=>'WFDCH_TYPE_DESC'
,p_version_scn=>'23727527904'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6844142937448222875)
,p_query_column_name=>'WFDCH_TYPE_DESC'
,p_heading=>'WF Type Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6844142624751222875)
,p_query_column_name=>'WFDC_TYPE'
,p_heading=>'WF Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
