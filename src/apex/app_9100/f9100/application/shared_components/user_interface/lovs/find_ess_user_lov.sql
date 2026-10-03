prompt --application/shared_components/user_interface/lovs/find_ess_user_lov
begin
--   Manifest
--     FIND_ESS_USER_LOV
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
 p_id=>wwv_flow_imp.id(5977169468337235792)
,p_lov_name=>'FIND_ESS_USER_LOV'
,p_static_id=>'find-ess-user-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id AS User_ID , appluser_emp_id AS Employee_ID,',
'       (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          FROM employees',
'         WHERE emp_bu   = :GLOBAL_BU',
'           AND emp_emp_id = appluser_emp_id ) AS Employee_Name',
'  FROM appl_users,',
'       ess_bu_fun_access_hd',
' WHERE appluser_bu = :GLOBAL_BU ',
'   AND appluser_bu = ebfah_bu',
'   AND appluser_id = ebfah_user_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'USER_ID'
,p_display_column_name=>'USER_ID'
,p_default_sort_column_name=>'USER_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22445795165'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977170512441235805)
,p_query_column_name=>'EMPLOYEE_ID'
,p_heading=>'Employee ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977169746068235805)
,p_query_column_name=>'EMPLOYEE_NAME'
,p_heading=>'Employee Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977170158249235805)
,p_query_column_name=>'USER_ID'
,p_heading=>'User ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
