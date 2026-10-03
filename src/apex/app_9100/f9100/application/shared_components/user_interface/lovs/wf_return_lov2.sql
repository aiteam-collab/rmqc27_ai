prompt --application/shared_components/user_interface/lovs/wf_return_lov2
begin
--   Manifest
--     WF_RETURN_LOV2
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
 p_id=>wwv_flow_imp.id(6376807346420113269)
,p_lov_name=>'WF_RETURN_LOV2'
,p_static_id=>'wf-return-lov-3'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT emp_name "Name", emp_id "Employee", type1 "Type",func_find_user_id(:global_bu,emp_id) user1',
'  FROM (SELECT func_find_employee_desc(:GLOBAL_bu,CASE WHEN wfdcl_auth_type = ''P'' THEN func_find_wf_emp_pos_id(:GLOBAL_bu,wfdcl_ctrl_person)',
'                                                         WHEN wfdcl_auth_type = ''E'' THEN wfdcl_ctrl_person',
'                                                    END,1) emp_name,',
'               CASE WHEN wfdcl_auth_type = ''P'' THEN',
'		         func_find_wf_emp_pos_id(:GLOBAL_bu,wfdcl_ctrl_person)',
'		    WHEN wfdcl_auth_type = ''E'' THEN',
'		         wfdcl_ctrl_person',
'	       END emp_id,',
'               ROWNUM rno,',
'               DECODE (seq_no, 1, ''Creator'', ''Sender'') type1,',
'               wfdcl_bu fwd_entity,',
'               wfdcl_plnt fwd_plnt',
'          FROM (  SELECT wfdcl_bu,wfdcl_plnt,wfdcl_auth_type,wfdcl_ctrl_person, MIN(wfdcl_seqno) seq_no',
'                    FROM work_flow_doc_control,wf_doc_control_log',
'                   WHERE wfdc_bu = wfdcl_bu',
'                     AND wfdc_wf_no = wfdcl_wf_no',
'                     AND (wfdcl_src_bu  = :GLOBAL_bu OR (wfdcl_src_bu IS NULL AND wfdcl_bu = :GLOBAL_bu))',
'                     AND wfdcl_type = :P236131090_P_WF_TYPE',
'                     AND wfdcl_wf_no = :P236131090_P_WF_NO',
'                     AND wfdcl_ctrl_person <> :P236131090_P_CTRL_PERSON',
'		     AND wfdc_rtn_act = 0',
'                GROUP BY wfdcl_bu,wfdcl_plnt,wfdcl_ctrl_person,wfdcl_auth_type',
'		UNION ALL',
'		SELECT wfdcl_bu,wfdcl_plnt,wfdcl_auth_type,wfdcl_ctrl_person, MIN(wfdcl_seqno) seq_no',
'                    FROM work_flow_doc_control,wf_doc_control_log',
'                   WHERE wfdc_bu = wfdcl_bu',
'                     AND wfdc_wf_no = wfdcl_wf_no',
'                     AND (wfdcl_src_bu  = :GLOBAL_bu OR (wfdcl_src_bu IS NULL AND wfdcl_bu = :GLOBAL_bu))',
'                     AND wfdcl_type = :P236131090_P_WF_TYPE',
'                     AND wfdcl_wf_no = :P236131090_P_WF_NO',
'                     AND wfdcl_ctrl_person = :P236131090_P_CTRL_PERSON',
'		     AND wfdc_rtn_act = 1',
'                GROUP BY wfdcl_bu,wfdcl_plnt,wfdcl_ctrl_person,wfdcl_auth_type',
'                ORDER BY seq_no))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'Employee'
,p_display_column_name=>'Employee'
,p_default_sort_column_name=>'Name'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22700196807'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376808961988113270)
,p_query_column_name=>'Employee'
,p_heading=>'Employee'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376808578616113270)
,p_query_column_name=>'Name'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376808148920113270)
,p_query_column_name=>'Type'
,p_heading=>'Type'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6376807707134113270)
,p_query_column_name=>'USER1'
,p_heading=>'User'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
