prompt --application/shared_components/user_interface/lovs/lov_emp_emp_hier
begin
--   Manifest
--     LOV_EMP_EMP_HIER
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
 p_id=>wwv_flow_imp.id(6525246450096276962)
,p_lov_name=>'LOV_EMP_EMP_HIER'
,p_static_id=>'lov-emp-emp-hier'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   (SELECT',
'    (DECODE',
'       (',
'        (SELECT applctrl_desc_level',
'         FROM     appl_control',
'         WHERE    applctrl_bu = emp_bu),1,',
'        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)),',
'    NVL(',
'        LTRIM(RTRIM(emp_first_name2)) ||  LTRIM(RTRIM(emp_middle_name2)) || LTRIM(RTRIM(emp_last_name2)),',
'        LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1))))) emp_name',
'    FROM  employees',
'    WHERE emp_bu = EMPAI_BU',
'    AND   emp_emp_id = EMPAI_EMP_ID) name1,',
'            EMPAI_EMP_ID',
'  FROM EMP_ACTIVE_INFOS',
' WHERE EMPAI_BU = :GLOBAL_BU'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPAI_EMP_ID'
,p_display_column_name=>'EMPAI_EMP_ID'
,p_default_sort_column_name=>'EMPAI_EMP_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525249943255283257)
,p_query_column_name=>'EMPAI_EMP_ID'
,p_heading=>'Emp. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525249537416283257)
,p_query_column_name=>'NAME1'
,p_heading=>'Emp. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
