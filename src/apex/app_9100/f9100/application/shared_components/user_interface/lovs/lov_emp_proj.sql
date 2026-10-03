prompt --application/shared_components/user_interface/lovs/lov_emp_proj
begin
--   Manifest
--     LOV_EMP_PROJ
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
 p_id=>wwv_flow_imp.id(6324569573905904862)
,p_lov_name=>'LOV_EMP_PROJ'
,p_static_id=>'lov-emp-proj'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1,',
'       emp_emp_id',
'   FROM employees',
' WHERE emp_bu  = :GLOBAL_BU',
'   AND emp_include_payroll = ''Y''',
'   AND emp_status = ''A''',
' ORDER BY emp_emp_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'EMP_EMP_ID'
,p_display_column_name=>'EMP_EMP_ID'
,p_version_scn=>'23148776261'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6324680297119914230)
,p_query_column_name=>'EMP_EMP_ID'
,p_heading=>'Emp.ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6324680774378914230)
,p_query_column_name=>'EMP_FIRST_NAME1'
,p_heading=>'Emp.Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
