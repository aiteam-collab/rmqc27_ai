prompt --application/shared_components/user_interface/lovs/wf_activities_auth
begin
--   Manifest
--     WF_ACTIVITIES_AUTH
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
 p_id=>wwv_flow_imp.id(5528865252845002482)
,p_lov_name=>'WF_ACTIVITIES_AUTH'
,p_static_id=>'wf-activities-auth'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct decode(WF_AUTH_TYPE,''E'',''Employee'',''P'',''Position'') Auth_desc,',
'                WF_AUTH_TYPE',
'          from work_flow',
'          where WF_BU = :global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WF_AUTH_TYPE'
,p_display_column_name=>'AUTH_DESC'
,p_default_sort_column_name=>'AUTH_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'17790510106'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529041024709109487)
,p_query_column_name=>'AUTH_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5529040542367109487)
,p_query_column_name=>'WF_AUTH_TYPE'
,p_heading=>'Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
