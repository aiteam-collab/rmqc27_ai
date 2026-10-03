prompt --application/shared_components/user_interface/lovs/unit_loc35
begin
--   Manifest
--     UNIT_LOC35
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
 p_id=>wwv_flow_imp.id(6190630381113792978)
,p_lov_name=>'UNIT_LOC35'
,p_static_id=>'unit-loc-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT bupld_loc_name || '' - '' || ''('' || bupld_plnt || '')'' bupld_loc_name, bupld_loc_id',
'    FROM bus_unit_plants_loc_dtls, appl_user_plant_access, business_units',
'   WHERE     bupld_bu = :global_bu',
'         AND bupld_bu = auba_bu',
'         AND bupld_loc_id = auba_plnt_loc_id',
'         AND auba_user_id = :global_user',
'         AND bupld_actv_loc_flag = ''Y''',
'         AND bu_id = bupld_bu',
'ORDER BY bupld_loc_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_LOC_ID'
,p_display_column_name=>'BUPLD_LOC_NAME'
,p_version_scn=>'22606027084'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6190630754564792978)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Location ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6190631138454792978)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Location Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
