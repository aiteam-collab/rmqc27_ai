prompt --application/shared_components/user_interface/lovs/employee
begin
--   Manifest
--     EMPLOYEE
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
 p_id=>wwv_flow_imp.id(10666665961778279637)
,p_lov_name=>'EMPLOYEE'
,p_static_id=>'employee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_emp_id,',
'       emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,',
'       empai_dept_id,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu',
'           AND dept_id = empai_dept_id) empai_dept_desc,',
'       empai_pos_id,',
'       (SELECT hrpos_pos_name1',
'          FROM hr_positions',
'         WHERE hrpos_bu     = empai_bu',
'           AND hrpos_pos_id = empai_pos_id) empai_pos_desc',
'  FROM employees,',
'       emp_active_infos',
' WHERE emp_bu     = empai_bu',
'   AND emp_emp_id = empai_emp_id',
'   AND emp_bu     = :GLOBAL_bu',
'   AND emp_status = ''A''',
'      AND NOT EXISTS (SELECT *',
'                     FROM appl_users',
'                    WHERE appluser_bu = :GLOBAL_bu',
'                      AND appluser_id <> :APPLUSER_ID',
'                      AND appluser_emp_id = emp_emp_id',
'                      AND appluser_status NOT IN (''D'')) ',
' ORDER BY emp_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_EMP_ID'
,p_display_column_name=>'EMP_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666667787952287432)
,p_query_column_name=>'EMPAI_DEPT_DESC'
,p_heading=>'Empai Dept Desc'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666667382452287432)
,p_query_column_name=>'EMPAI_DEPT_ID'
,p_heading=>'Empai Dept Id'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666668574118287432)
,p_query_column_name=>'EMPAI_POS_DESC'
,p_heading=>'Empai Pos Desc'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666668175934287432)
,p_query_column_name=>'EMPAI_POS_ID'
,p_heading=>'Empai Pos Id'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666666622768287431)
,p_query_column_name=>'EMP_EMP_ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(10666667003469287432)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Emp Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
