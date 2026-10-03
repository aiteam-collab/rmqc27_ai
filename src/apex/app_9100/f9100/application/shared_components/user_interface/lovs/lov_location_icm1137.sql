prompt --application/shared_components/user_interface/lovs/lov_location_icm1137
begin
--   Manifest
--     LOV_LOCATION - ICM1137
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
 p_id=>wwv_flow_imp.id(7700593297182485782)
,p_lov_name=>'LOV_LOCATION - ICM1137'
,p_static_id=>'lov-location-icm'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bupld_loc_id, ',
'       BUPLD_LOC_NAME,',
'		 BUPLD_ADDR1||'',''||BUPLD_ADDR2||'',''||BUPLD_ADDR3 Address,',
'		 bup_plant_id,',
'		 bup_name1',
'  FROM bus_unit_plants_loc_dtls, ',
'       bus_unit_plants',
' WHERE bup_bu = bupld_bu',
'   AND bup_plant_id = bupld_plnt',
'   AND bupld_bu = :GLOBAL_bu',
'	'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_LOC_NAME'
,p_display_column_name=>'BUPLD_LOC_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700595261462485784)
,p_query_column_name=>'ADDRESS'
,p_heading=>'Address'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700593649059485782)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Location'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700594067951485782)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Location Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700594855696485784)
,p_query_column_name=>'BUP_NAME1'
,p_heading=>'Unit Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700594436945485784)
,p_query_column_name=>'BUP_PLANT_ID'
,p_heading=>'Unit'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
