prompt --application/shared_components/user_interface/lovs/lov_uam1016_plnt_loc
begin
--   Manifest
--     LOV_UAM1016_PLNT_LOC
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
 p_id=>wwv_flow_imp.id(6644635614535351424)
,p_lov_name=>'LOV_UAM1016_PLNT_LOC'
,p_static_id=>'lov-uam1016-plnt-loc'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wupav_plnt_loc_id,wupav_plnt_loc_name ',
'  FROM wapl_user_plnt_access_view',
' WHERE wupav_bu =   :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WUPAV_PLNT_LOC_NAME'
,p_display_column_name=>'WUPAV_PLNT_LOC_NAME'
,p_default_sort_column_name=>'WUPAV_PLNT_LOC_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6644636368142361432)
,p_query_column_name=>'WUPAV_PLNT_LOC_ID'
,p_heading=>'Location'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6644635947260361431)
,p_query_column_name=>'WUPAV_PLNT_LOC_NAME'
,p_heading=>'Description'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
