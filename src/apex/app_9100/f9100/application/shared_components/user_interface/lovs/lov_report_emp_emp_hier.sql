prompt --application/shared_components/user_interface/lovs/lov_report_emp_emp_hier
begin
--   Manifest
--     LOV_REPORT_EMP_EMP_HIER
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
 p_id=>wwv_flow_imp.id(6528110832563336393)
,p_lov_name=>'LOV_REPORT_EMP_EMP_HIER'
,p_static_id=>'lov-report-emp-emp-hier'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT func_find_employee_desc (empai_bu, empai_emp_id, 1) name1,',
'       empai_emp_id',
'  FROM emp_active_infos, appl_users',
' WHERE empai_bu 	= appluser_bu',
'   AND empai_emp_id 	= appluser_emp_id',
'   AND empai_bu 	= :WEH_APPR_BU',
'   AND empai_emp_id 	<> :WEH_EMP_ID',
'   AND appluser_status 	= ''A''',
' GROUP BY empai_bu, empai_emp_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPAI_EMP_ID'
,p_display_column_name=>'EMPAI_EMP_ID'
,p_default_sort_column_name=>'EMPAI_EMP_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6528136019359342921)
,p_query_column_name=>'EMPAI_EMP_ID'
,p_heading=>'Employee'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6528135608166342921)
,p_query_column_name=>'NAME1'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
