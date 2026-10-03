prompt --application/shared_components/user_interface/lovs/lov_appl_users
begin
--   Manifest
--     LOV_APPL_USERS
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
 p_id=>wwv_flow_imp.id(6076669025240875885)
,p_lov_name=>'LOV_APPL_USERS'
,p_static_id=>'lov-appl-users'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_id d,appluser_id r,',
'              appluser_emp_id,',
'                 (SELECT emp_first_name1',
'                     FROM employees',
'                    WHERE appluser_bu=emp_bu',
'                        AND  appluser_emp_id=emp_emp_id',
'                        AND  appluser_status=''A''',
'                        AND appluser_bu=:global_bu)appluser_emp_name,',
'                (SELECT hrpos_pos_name1',
'                   FROM hr_positions',
'                 WHERE hrpos_bu = appluser_bu',
'                     AND hrpos_pos_id = appluser_pos_id',
'                     AND hrpos_bu =:global_bu)appluser_pos_name,',
'                 (SELECT dept_name1',
'                    FROM departments',
'                  WHERE dept_bu = appluser_bu',
'                       AND dept_id = appluser_dept_id',
'                       AND dept_bu=:global_bu',
'                       )appluser_dept_name            ',
'   FROM appl_users',
' WHERE appluser_bu=:global_bu ',
'      AND appluser_status=''A'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076855574073908159)
,p_query_column_name=>'APPLUSER_DEPT_NAME'
,p_heading=>'Department'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076854392977908157)
,p_query_column_name=>'APPLUSER_EMP_ID'
,p_heading=>'Employee'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076854773899908157)
,p_query_column_name=>'APPLUSER_EMP_NAME'
,p_heading=>'Employee Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076855176229908157)
,p_query_column_name=>'APPLUSER_POS_NAME'
,p_heading=>'Designation'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076854005613908157)
,p_query_column_name=>'D'
,p_heading=>'User Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6076853578818908153)
,p_query_column_name=>'R'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
