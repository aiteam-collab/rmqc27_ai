prompt --application/shared_components/user_interface/lovs/lov_user_cre_emp21
begin
--   Manifest
--     LOV_USER_CRE_EMP21
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
 p_id=>wwv_flow_imp.id(7116864021477665890)
,p_lov_name=>'LOV_USER_CRE_EMP21'
,p_static_id=>'lov-user-cre-emp-4'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    emp_emp_id,',
'    emp_first_name1',
'    || '' ''',
'    || emp_middle_name1',
'    || '' ''',
'    || emp_last_name1 emp_name,',
'    empai_dept_id,',
'    (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = empai_bu',
'            AND dept_id = empai_dept_id',
'    )                 empai_dept_desc,',
'    empai_pos_id,',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = empai_bu',
'            AND hrpos_pos_id = empai_pos_id',
'            AND hrpos_active_flag = ''Y''',
'    )                 empai_pos_desc',
'FROM',
'    employees,',
'    emp_active_infos',
'WHERE',
'        emp_bu = empai_bu',
'    AND emp_emp_id = empai_emp_id',
'    AND emp_bu = :global_bu',
'    AND emp_status = ''A''',
'    AND NOT EXISTS (',
'        SELECT',
'            *',
'        FROM',
'            appl_users',
'        WHERE',
'                appluser_bu = :global_bu',
'            AND appluser_id <> :appluser_id',
'            AND appluser_emp_id = emp_emp_id',
'            AND appluser_status NOT IN ( ''D'' )',
'    )',
'ORDER BY',
'    emp_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_EMP_ID'
,p_display_column_name=>'EMP_EMP_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7116865219016665896)
,p_query_column_name=>'EMPAI_DEPT_DESC'
,p_heading=>'Department'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7116864753215665896)
,p_query_column_name=>'EMPAI_POS_DESC'
,p_heading=>'Position'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7116865550701665898)
,p_query_column_name=>'EMP_EMP_ID'
,p_heading=>'Employee'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7116864354199665895)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
