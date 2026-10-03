prompt --application/shared_components/user_interface/lovs/ess_copy_user_access
begin
--   Manifest
--     ESS_COPY_USER_ACCESS
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
 p_id=>wwv_flow_imp.id(5974530401554013211)
,p_lov_name=>'ESS_COPY_USER_ACCESS'
,p_static_id=>'ess-copy-user-access'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id AS User_ID , appluser_emp_id AS Employee_ID,',
'       (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          FROM employees',
'         WHERE emp_bu   = :GLOBAL_BU',
'           AND emp_emp_id = appluser_emp_id ) AS Employee_Name',
'  FROM appl_users,',
'       bus_fun_role_access_apex',
' WHERE appluser_id = bfraa_user_id',
'   AND appluser_bu = :GLOBAL_BU ',
'   AND appluser_status = ''A''',
'   AND appluser_user_type IN (''E'',''R'')',
'   AND appluser_id <> :P167_EBFAH_USER_ID'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'USER_ID'
,p_display_column_name=>'USER_ID'
,p_default_sort_column_name=>'USER_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22443461476'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5974535004728018445)
,p_query_column_name=>'EMPLOYEE_ID'
,p_heading=>'Employee ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5974534281876018444)
,p_query_column_name=>'EMPLOYEE_NAME'
,p_heading=>'Employee Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5974534635916018445)
,p_query_column_name=>'USER_ID'
,p_heading=>'User ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
