prompt --application/shared_components/user_interface/lovs/lov_wf_role
begin
--   Manifest
--     LOV_WF_ROLE
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
 p_id=>wwv_flow_imp.id(6620642692313413843)
,p_lov_name=>'LOV_WF_ROLE'
,p_static_id=>'lov-wf-role'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT mrr_role_desc,',
'       mrr_role_id',
'  FROM mail_role_recipient',
' WHERE mrr_bu  = :Global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MRR_ROLE_ID'
,p_display_column_name=>'MRR_ROLE_DESC'
,p_default_sort_column_name=>'MRR_ROLE_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620663527063420332)
,p_query_column_name=>'MRR_ROLE_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620663077820420332)
,p_query_column_name=>'MRR_ROLE_ID'
,p_heading=>'Role ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
