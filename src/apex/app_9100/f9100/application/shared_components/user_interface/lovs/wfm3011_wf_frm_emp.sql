prompt --application/shared_components/user_interface/lovs/wfm3011_wf_frm_emp
begin
--   Manifest
--     WFM3011_WF_FRM_EMP
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
 p_id=>wwv_flow_imp.id(6846139472950948127)
,p_lov_name=>'WFM3011_WF_FRM_EMP'
,p_static_id=>'wfm3011-wf-frm-emp'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT wfdc_from_emp, wfdc_from_emp_name',
'  from WORKFLOW_USERWISE_VW',
'  WHERE WFDC_BU = :GLOBAL_BU'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDC_FROM_EMP'
,p_display_column_name=>'WFDC_FROM_EMP'
,p_default_sort_column_name=>'WFDC_FROM_EMP'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23709852426'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6846184634619067569)
,p_query_column_name=>'WFDC_FROM_EMP'
,p_heading=>'Emp ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6846185069745067570)
,p_query_column_name=>'WFDC_FROM_EMP_NAME'
,p_heading=>'Emp Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
