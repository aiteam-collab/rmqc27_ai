prompt --application/shared_components/user_interface/lovs/wf_approve_doc_type
begin
--   Manifest
--     WF_APPROVE_DOC_TYPE
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
 p_id=>wwv_flow_imp.id(5527694483242947421)
,p_lov_name=>'WF_APPROVE_DOC_TYPE'
,p_static_id=>'wf-approve-doc-type'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    SELECT distinct  DECODE(FUNC_FIND_WF_TYPE_DESC(wfdv_bu,wfdv_type,1),''MRP'',''MRP'',',
'            INITCAP(FUNC_FIND_WF_TYPE_DESC(wfdv_bu,wfdv_type,1))) doc_type,',
'            wfdv_type',
'           FROM  work_flow_doc_view',
'           WHERE  wfdv_bu=:global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDV_TYPE'
,p_display_column_name=>'DOC_TYPE'
,p_default_sort_column_name=>'DOC_TYPE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'17790788330'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529211831654433896)
,p_query_column_name=>'DOC_TYPE'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529211497550433893)
,p_query_column_name=>'WFDV_TYPE'
,p_heading=>'Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
