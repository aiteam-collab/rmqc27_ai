prompt --application/shared_components/user_interface/lovs/forward_lov_wfm0010_a
begin
--   Manifest
--     FORWARD_LOV_WFM0010_A
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
 p_id=>wwv_flow_imp.id(8125784717709095207)
,p_lov_name=>'FORWARD_LOV_WFM0010_A'
,p_static_id=>'forward-lov-wfm0010-a'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct emp_name D,emp_name, emp  FROM (SELECT emp ,emp r,emp_name ,emp "Employee", user_id "Type", user_unit "Unit" FROM (SELECT emp_name, emp,func_find_user_id (:global_bu, emp) user_id,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLO'
||'BAL_BU,emp)) user_unit FROM (SELECT LEVEL rw,ocln_bu,',
'func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id)',
'emp,func_find_employee_desc (ocln_bu,func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id),1) emp_name',
' FROM (SELECT *  FROM org_chart_hd, org_chart_ln',
'WHERE ochd_bu = ocln_bu    AND ochd_chart_no = ocln_chart_no',
'    AND ochd_status = ''A''    AND TRUNC (SYSDATE) BETWEEN ochd_eff_from AND ochd_eff_to',
'    AND ocln_bu = :global_bu)WHERE ocln_par_position_id IS NOT NULL',
' START WITH ocln_position_id = func_find_position_id (:global_bu,:global_user) CONNECT BY NOCYCLE ocln_position_id = PRIOR ocln_par_position_id) a,',
' appl_users   WHERE   appluser_bu = a.ocln_bu',
'AND appluser_emp_id = a.emp AND appluser_status = ''A''',
'--AND func_find_wf_basis (:global_bu,:P236131010_WFDC_TYPE,(:P236131010_WFDC_SEQ_NO+1)) = ''O''',
'GROUP BY emp_name, emp, func_find_user_id (:global_bu, emp)',
'UNION ALL',
'SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, ''1'') emp_desc,weh_par_emp_id,weh_par_emp_id user_id,',
'func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,weh_par_emp_id)) user_unit',
'  FROM wf_emp_hierarchy',
' WHERE     weh_bu = :global_bu AND weh_emp_id = :global_emp_id',
'--AND func_find_wf_basis (:global_bu, :P236131010_WFDC_TYPE,(:P236131010_WFDC_SEQ_NO+1)) = ''E''',
'/*union all',
'SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,WFDA_POSITION,func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'      WFDA_PLNT',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'AND wfda_dflt_flag = ''Y''*/)',
'--AND func_find_wf_basis (:GLOBAL_bu, :P236131010_WFDC_TYPE,(:P236131010_WFDC_SEQ_NO+1)) = ''U'')',
' WHERE :P236131040_wfdc_act IN (''A'', ''F'')',
'UNION ALL',
'SELECT  emp_id d, emp_id r, emp_name, emp_id, type1,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp_id)) user_unit',
'  FROM (SELECT DECODE (wfdcl_auth_type,''E'', func_find_employee_desc (:global_bu,',
'     wfdcl_ctrl_person,',
'     ''1''),',
'''P'', func_find_employee_desc (:global_bu,func_find_wf_emp_pos_id (:global_bu, wfdcl_ctrl_person),',
'   ''1''))',
'emp_name,',
'DECODE (wfdcl_auth_type,  ''E'', wfdcl_ctrl_person,''P'', func_find_wf_emp_pos_id (:global_bu, wfdcl_ctrl_person))',
'emp_id,',
'ROWNUM rno,',
'DECODE (ROWNUM, 1, ''Creator'', ''Sender'') type1',
'  FROM (  SELECT wfdcl_ctrl_person,MIN (wfdcl_seqno) seq_no,wfdcl_auth_type',
'  FROM wf_doc_control_log',
' WHERE     wfdcl_bu = :global_bu',
'  AND wfdcl_type = :P236131040_wfdc_type AND wfdcl_wf_no IN (SELECT WFDC_WF_NO FROM work_flow_doc_control WHERE WFDC_BU = :global_bu AND WFDC_SELECT_FLAG = 1)',
'AND wfdcl_ctrl_person <> :P236131040_wfdc_ctrl_person',
'GROUP BY wfdcl_ctrl_person, wfdcl_auth_type',
'ORDER BY 2))',
' WHERE :P236131040_wfdc_act = ''R'')'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'18006294364'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8126106794012312295)
,p_query_column_name=>'EMP'
,p_heading=>'Employee'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8126107130979312421)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Employee Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
