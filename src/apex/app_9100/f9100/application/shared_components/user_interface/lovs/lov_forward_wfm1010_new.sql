prompt --application/shared_components/user_interface/lovs/lov_forward_wfm1010_new
begin
--   Manifest
--     LOV_FORWARD_WFM1010(NEW)
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
 p_id=>wwv_flow_imp.id(7876803635543240679)
,p_lov_name=>'LOV_FORWARD_WFM1010(NEW)'
,p_static_id=>'lov-forward-wfm1010-new'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name,',
'       emp,',
'       user_id,',
'       appr_bu,',
'       appr_plnt,',
'       DECODE(appr_plnt, NULL,NULL,func_find_plnt_desc (appr_bu, appr_plnt, 1)) plnt_desc',
'  FROM (SELECT emp_name,',
'               emp,',
'               func_find_user_id (:global_bu, emp) user_id,',
'               :global_bu appr_bu,',
'               NULL appr_plnt',
'          FROM (SELECT LEVEL rw,',
'                             ocln_bu,',
'                             func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id) emp,',
'                             func_find_employee_desc (ocln_bu,func_find_wf_emp_pos_id(ocln_bu,ocln_par_position_id),1) emp_name',
'                        FROM (SELECT *',
'                                FROM org_chart_hd, org_chart_ln',
'                               WHERE ochd_bu = ocln_bu',
'                                 AND ochd_chart_no = ocln_chart_no',
'                                 AND ochd_status = ''A''',
'                                 AND TRUNC (SYSDATE) BETWEEN ochd_eff_from AND ochd_eff_to AND ocln_bu = :global_bu)',
'                       WHERE ocln_par_position_id IS NOT NULL',
'                  START WITH ocln_position_id = func_find_position_id (:global_bu, :global_user)',
'                  CONNECT BY ocln_position_id = PRIOR ocln_par_position_id) a,',
'                 appl_users',
'           WHERE appluser_bu = a.ocln_bu',
'             AND appluser_emp_id = a.emp',
'             AND appluser_status = ''A''',
'             AND func_find_wf_basis (:global_bu,:P236131010_WFDC_TYPE,:p236131010_wfdc_seq_no+1) = ''O''',
'        GROUP BY emp_name, emp, func_find_user_id ( :global_bu, emp)',
'       UNION ALL',
'        SELECT func_find_employee_desc (weh_appr_bu,weh_par_emp_id,1) emp_desc,',
'               weh_par_emp_id,',
'               func_find_user_id (weh_appr_bu, weh_par_emp_id) user1,',
'               weh_appr_bu,',
'               CASE WHEN wf_basis = ''E'' THEN NULL ELSE weh_appr_plnt END weh_appr_plnt',
'          FROM wf_emp_hierarchy,work_flow',
'         WHERE weh_bu = wf_bu  ',
'           AND wf_bus_proc_id = :P236131010_WFDC_TYPE',
'           AND weh_bu = :global_bu',
'           AND weh_emp_id = func_find_emp_id (:global_bu, :global_user)',
'           AND func_find_wf_basis ( :global_bu,:P236131010_WFDC_TYPE,:p236131010_wfdc_seq_no+1) = ''E''',
'UNION ALL',
'SELECT func_find_employee_desc(wfda_appr_bu,wfda_position,1) emp_desc,',
'wfda_position,',
'func_find_user_id(wfda_appr_bu,wfda_position) user1,wfda_appr_bu,wfda_plnt',
'  FROM work_flow,wf_direct_authorization',
' WHERE wf_bu = wfda_bu',
'   AND wf_bus_proc_id = wfda_type',
'   AND wfda_bu = :GLOBAL_bu',
'   AND wfda_type = :P236131010_WFDC_TYPE',
'   AND wfda_dflt_flag = ''Y''',
'   AND func_find_wf_basis(:GLOBAL_bu,:P236131010_WFDC_TYPE,:p236131010_wfdc_seq_no+1) = ''U'')'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876816074526254846)
,p_query_column_name=>'APPR_BU'
,p_heading=>'Appr Bu'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876816499442254848)
,p_query_column_name=>'APPR_PLNT'
,p_heading=>'Appr Plnt'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876815284997254845)
,p_query_column_name=>'EMP'
,p_heading=>'Equipment ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876814977357254845)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876816879458254848)
,p_query_column_name=>'PLNT_DESC'
,p_heading=>'Plnt Desc'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7876815734910254846)
,p_query_column_name=>'USER_ID'
,p_heading=>'User Id'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
