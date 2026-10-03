prompt --application/shared_components/user_interface/lovs/wfm3011_wf_no
begin
--   Manifest
--     WFM3011_WF_NO
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
 p_id=>wwv_flow_imp.id(6861025946934336312)
,p_lov_name=>'WFM3011_WF_NO'
,p_static_id=>'wfm3011-wf-no'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT wfdc_wf_no',
'  from work_flow_log_vw',
'  WHERE WFDC_BU = :GLOBAL_BU'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDC_WF_NO'
,p_display_column_name=>'WFDC_WF_NO'
,p_default_sort_column_name=>'WFDC_WF_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23727551699'
);
wwv_flow_imp.component_end;
end;
/
