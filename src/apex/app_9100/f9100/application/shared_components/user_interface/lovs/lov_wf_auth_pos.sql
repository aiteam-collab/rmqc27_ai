prompt --application/shared_components/user_interface/lovs/lov_wf_auth_pos
begin
--   Manifest
--     LOV_WF_AUTH_POS
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
 p_id=>wwv_flow_imp.id(6581794790389069604)
,p_lov_name=>'LOV_WF_AUTH_POS'
,p_static_id=>'lov-wf-auth-pos'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT func_find_position_desc(empai_bu, empai_pos_id,1)HRPOS_POS_NAME1,',
'        empai_pos_id HRPOS_POS_ID ',
'  FROM emp_active_infos,',
'       appl_users',
' WHERE empai_bu = appluser_bu',
'   AND empai_emp_id = appluser_emp_id',
'   AND appluser_status = ''A''',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(appluser_eff_from) AND TRUNC(appluser_eff_to)',
'   AND empai_bu = :wfda_appr_bu  ',
'   AND EXISTS (SELECT WF_AUTH_TYPE from WORK_FLOW WHERE WF_BU=:GLOBAL_BU AND WF_BUS_PROC_ID = :WFDA_TYPE AND WF_AUTH_TYPE  = ''P'')',
'--    AND :P236130010_WF_AUTH_TYPE = ''P''',
' UNION ALL   ',
'SELECT DECODE((SELECT applctrl_desc_level',
'                 FROM appl_control',
'                WHERE applctrl_bu = :wfda_appr_bu),1,',
'                emp_first_name1 || '' '' || emp_middle_name1 || '' '' || emp_last_name1,',
'                emp_first_name2 || '' '' || emp_middle_name2 || '' '' || emp_last_name2',
'               ) emp_name,',
'       emp_emp_id',
'  FROM employees',
' WHERE emp_bu = :wfda_appr_bu',
'--    AND :P236130010_WF_AUTH_TYPE = ''E''',
'   AND EXISTS (SELECT WF_AUTH_TYPE from WORK_FLOW WHERE WF_BU=:GLOBAL_BU AND WF_BUS_PROC_ID = :WFDA_TYPE AND WF_AUTH_TYPE  = ''E'')',
'   AND emp_emp_id IN(SELECT empai_emp_id',
'                       FROM emp_active_infos',
'                      WHERE empai_bu = :wfda_appr_bu',
'                     )',
'ORDER BY 1,2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'HRPOS_POS_ID'
,p_display_column_name=>'HRPOS_POS_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6581795200127069606)
,p_query_column_name=>'HRPOS_POS_ID'
,p_heading=>'Employee/Position'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6581795623015069606)
,p_query_column_name=>'HRPOS_POS_NAME1'
,p_heading=>'Employee/Position Name'
,p_display_sequence=>5
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
