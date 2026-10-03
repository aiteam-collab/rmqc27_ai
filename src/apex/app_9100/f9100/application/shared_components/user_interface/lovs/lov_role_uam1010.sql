prompt --application/shared_components/user_interface/lovs/lov_role_uam1010
begin
--   Manifest
--     LOV_ROLE_UAM1010
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
 p_id=>wwv_flow_imp.id(7562440171016041003)
,p_lov_name=>'LOV_ROLE_UAM1010'
,p_static_id=>'lov-role-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT abr_role_desc1,abr_role_id ',
'  FROM APPL_BF_ROLES',
' WHERE abr_bu = :GLOBAL_bu ',
'   AND abr_sys_admin = ''N'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ABR_ROLE_ID'
,p_display_column_name=>'ABR_ROLE_ID'
,p_default_sort_column_name=>'ABR_ROLE_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562441013364041006)
,p_query_column_name=>'ABR_ROLE_DESC1'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562440573418041006)
,p_query_column_name=>'ABR_ROLE_ID'
,p_heading=>'Role'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
