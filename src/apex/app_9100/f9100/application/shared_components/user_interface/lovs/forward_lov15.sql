prompt --application/shared_components/user_interface/lovs/forward_lov15
begin
--   Manifest
--     FORWARD_LOV15
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
 p_id=>wwv_flow_imp.id(6376803495097113253)
,p_lov_name=>'FORWARD_LOV15'
,p_static_id=>'forward-lov-7'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name d,emp r,emp_name "Name",emp "Employee",user_id "User",appr_bu "Reporting Entity",appr_plnt "Reporting Unit Desc.",func_find_plnt_desc (appr_bu, appr_plnt, 1) "Reporting Unit"',
'  FROM (   SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, 1)',
'                  emp_name,',
'               weh_par_emp_id emp,',
'               func_find_user_id (weh_appr_bu, weh_par_emp_id) user_id,',
'               weh_appr_bu appr_bu,',
'               weh_appr_plnt appr_plnt',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :GLOBAL_bu',
'               AND weh_emp_id = :GLOBAL_EMP_ID--func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
'               AND func_find_wf_basis (:GLOBAL_bu, :P236131090_P_WF_TYPE,1) = ''E''',
'           AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
'       UNION ALL',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'       WFDA_APPR_BU,',
'       WFDA_PLNT',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, :P236131090_P_WF_TYPE,1) = ''U''',
'       AND NOT EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y'')',
'      UNION ALL',
'       SELECT func_find_employee_desc(prj_bu, prj_cont_mgr, 1) emp_desc,',
'       prj_cont_mgr,',
'       func_find_user_id(prj_bu, prj_cont_mgr) user1,',
'       prj_bu,',
'       prj_plnt',
'  FROM projects',
' WHERE prj_bu = :global_bu',
'   AND prj_proj_id = :P236131090_P_PRJ_ID',
'       AND EXISTS(SELECT 1 FROm work_flow WHERE wf_bu = :GLOBAL_bu AND wf_bus_proc_id = :P236131090_P_WF_TYPE AND wf_proj_based_flag = ''Y''))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'R'
,p_version_scn=>'22700196806'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376803907456113264)
,p_query_column_name=>'D'
,p_heading=>'D'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376805150471113266)
,p_query_column_name=>'Employee'
,p_heading=>'Employee'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376804372097113266)
,p_query_column_name=>'Name'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376804711820113266)
,p_query_column_name=>'R'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376805902538113266)
,p_query_column_name=>'Reporting Entity'
,p_heading=>'Reporting Entity'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376806709264113266)
,p_query_column_name=>'Reporting Unit'
,p_heading=>'Reporting Unit Desc.'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376806289908113266)
,p_query_column_name=>'Reporting Unit Desc.'
,p_heading=>'Reporting Unit'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376805539839113266)
,p_query_column_name=>'User'
,p_heading=>'User'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
