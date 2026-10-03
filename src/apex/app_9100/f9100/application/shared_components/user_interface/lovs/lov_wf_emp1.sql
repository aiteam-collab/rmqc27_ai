prompt --application/shared_components/user_interface/lovs/lov_wf_emp1
begin
--   Manifest
--     LOV_WF_EMP1
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
 p_id=>wwv_flow_imp.id(5945117193259612592)
,p_lov_name=>'LOV_WF_EMP1'
,p_static_id=>'lov-wf-emp-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfda_position,',
'       CASE WHEN wf_auth_type = ''E'' THEN (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'                                            FROM employees',
'                                           WHERE emp_bu = wf_bu',
'                                             AND emp_emp_id = wfda_position)',
'            WHEN wf_auth_type = ''P'' THEN (SELECT hrpos_pos_name1',
'                                            FROM hr_positions',
'                                           WHERE hrpos_bu = wf_bu',
'                                             AND hrpos_pos_id = wfda_position)',
'       END wfda_pos_name ',
'  FROM WF_DIRECT_AUTHORIZATION,',
'       work_flow',
' WHERE wf_bu  = wfda_bu',
'   AND wf_bus_proc_id = wfda_type',
'   AND wf_bu = :Global_bu',
'GROUP BY wfda_position,wf_auth_type,wf_bu',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDA_POSITION'
,p_display_column_name=>'WFDA_POSITION'
,p_default_sort_column_name=>'WFDA_POSITION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'18193303062'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945117951123612592)
,p_query_column_name=>'WFDA_POSITION'
,p_heading=>'Emp. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945117596950612592)
,p_query_column_name=>'WFDA_POS_NAME'
,p_heading=>'Emp. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
