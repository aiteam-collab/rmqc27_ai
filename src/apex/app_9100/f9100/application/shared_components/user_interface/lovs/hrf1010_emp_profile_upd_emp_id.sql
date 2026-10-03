prompt --application/shared_components/user_interface/lovs/hrf1010_emp_profile_upd_emp_id
begin
--   Manifest
--     HRF1010-EMP_PROFILE_UPD(EMP-ID)
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
 p_id=>wwv_flow_imp.id(6974734051098358001)
,p_lov_name=>'HRF1010-EMP_PROFILE_UPD(EMP-ID)'
,p_static_id=>'hrf1010-emp-profile-upd-emp-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  DISTINCT TRIM (',
'                emp_first_name1',
'             || '' ''',
'             || emp_middle_name1',
'             || '' ''',
'             || emp_last_name1) ||''(''||emp_emp_id||'')'' emp_name,',
'              emp_emp_id',
'    FROM employees,',
'         emp_profiles_hd',
' WHERE emp_bu = ephd_bu',
'       AND emp_emp_id = ephd_emp_id',
'       AND emp_bu = :Global_bu',
'       AND EPHD_STATUS NOT IN (''C'') AND',
'EXISTS (SELECT auba_plant',
'          FROM employees,',
'               appl_user_plant_access',
'         WHERE emp_bu         = auba_bu',
'           AND emp_asgnd_plnt = auba_plant',
'           AND auba_bu        = :GLOBAL_bu',
'           AND auba_user_id   = :GLOBAL_user',
'           AND emp_emp_id     = EPHD_EMP_ID',
'           AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_NAME'
,p_display_column_name=>'EMP_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6974735938748366349)
,p_query_column_name=>'EMP_EMP_ID'
,p_heading=>'Employee'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6974735567060366345)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
