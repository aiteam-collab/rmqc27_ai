prompt --application/shared_components/user_interface/lovs/doc_audit_emp
begin
--   Manifest
--     DOC_AUDIT_EMP
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
 p_id=>wwv_flow_imp.id(6818770589518037875)
,p_lov_name=>'DOC_AUDIT_EMP'
,p_static_id=>'doc-audit-emp'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_emp_id R,',
'       (SELECT trim ( emp_first_name1',
'               || '' ''',
'               || emp_middle_name1',
'               || '' ''',
'               || emp_last_name1)',
'          FROM employees',
'         WHERE emp_bu = dma_bu ',
'           AND emp_emp_id = dma_emp_id)  d',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_BU ',
' AND dma_emp_id IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23654561620'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818774383776046592)
,p_query_column_name=>'D'
,p_heading=>'Emp. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818774777380046592)
,p_query_column_name=>'R'
,p_heading=>'Emp. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
