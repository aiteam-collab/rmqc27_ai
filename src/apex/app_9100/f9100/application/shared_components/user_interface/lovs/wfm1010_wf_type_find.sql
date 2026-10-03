prompt --application/shared_components/user_interface/lovs/wfm1010_wf_type_find
begin
--   Manifest
--     WFM1010_WF_TYPE_FIND
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
 p_id=>wwv_flow_imp.id(8233940893265392692)
,p_lov_name=>'WFM1010_WF_TYPE_FIND'
,p_static_id=>'wfm1010-wf-type-find'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT distinct (SELECT  (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",WFDC_TYPE',
'            FROM WORK_FLOW_DOC_CONTROL',
'           WHERE WFDC_BU = :global_bu',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                :global_emp_id)',
'                 AND (wfdc_type, wfdc_status) NOT IN',
'                        (SELECT WFAA_WF_ID, WFAA_STATUS',
'                           FROM WORK_FLOW_APPR_ACTVT',
'                          WHERE WFAA_BU = :GLOBAL_BU',
'                                AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                                       (  SELECT WFAA_WF_ID,',
'                                                 MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                            FROM WORK_FLOW_APPR_ACTVT',
'                                           WHERE WFAA_BU = :GLOBAL_BU',
'                                        GROUP BY WFAA_WF_ID))',
'                 AND wfdc_status NOT IN (''C'', ''R'', ''S'')',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'Doc.Type'
,p_display_column_name=>'Doc.Type'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8233948110480395634)
,p_query_column_name=>'Doc.Type'
,p_heading=>'Doc. Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8233947700054395629)
,p_query_column_name=>'WFDC_TYPE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
