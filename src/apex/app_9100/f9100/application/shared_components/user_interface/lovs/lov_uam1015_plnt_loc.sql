prompt --application/shared_components/user_interface/lovs/lov_uam1015_plnt_loc
begin
--   Manifest
--     LOV_UAM1015_PLNT_LOC
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
 p_id=>wwv_flow_imp.id(6648866230415552565)
,p_lov_name=>'LOV_UAM1015_PLNT_LOC'
,p_static_id=>'lov-uam1015-plnt-loc'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT auba_plnt_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = auba_bu',
'            AND bupld_plnt  = auba_plant',
'           AND bupld_loc_id = auba_plnt_loc_id ) loc_name',
'  FROM appl_user_plant_access',
' WHERE auba_bu  = :GLOBAL_bu',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'LOC_NAME'
,p_display_column_name=>'LOC_NAME'
,p_default_sort_column_name=>'LOC_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6648867687899558276)
,p_query_column_name=>'AUBA_PLNT_LOC_ID'
,p_heading=>'Location'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6648867299942558274)
,p_query_column_name=>'LOC_NAME'
,p_heading=>'Location Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
