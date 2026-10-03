prompt --application/shared_components/user_interface/lovs/lov_emp_all
begin
--   Manifest
--     LOV_EMP_ALL
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
 p_id=>wwv_flow_imp.id(5848871566413016233)
,p_lov_name=>'LOV_EMP_ALL'
,p_static_id=>'lov-emp-all'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT emp_emp_id,',
'       LTRIM (RTRIM (emp_first_name1)) || '' '' || LTRIM (RTRIM (emp_middle_name1)) || '' '' || LTRIM (RTRIM (emp_last_name1)) emp_name',
'  FROM employees ',
' WHERE emp_bu = :GLOBAL_bu',
'   --AND emp_status <> ''A''',
' AND EMP_EMP_ID NOT IN ''ERP''',
' ORDER BY emp_emp_id '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'EMP_EMP_ID'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22724378815'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5848878655470023612)
,p_query_column_name=>'EFFHD_EMP_ID'
,p_heading=>'Emp.ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6440156235388692731)
,p_query_column_name=>'EMP_EMP_ID'
,p_heading=>'Emp.ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5848879037163023612)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Emp.Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
