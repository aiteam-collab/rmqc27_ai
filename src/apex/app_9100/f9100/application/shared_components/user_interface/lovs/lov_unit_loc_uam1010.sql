prompt --application/shared_components/user_interface/lovs/lov_unit_loc_uam1010
begin
--   Manifest
--     LOV_UNIT_LOC(UAM1010)
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
 p_id=>wwv_flow_imp.id(7562355675731025228)
,p_lov_name=>'LOV_UNIT_LOC(UAM1010)'
,p_static_id=>'lov-unit-loc-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bupld_loc_name,',
'       bupld_loc_id, ',
'       bupld_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = bupld_bu',
'           AND bup_plant_id = bupld_plnt) bupld_plnt_desc',
'FROM bus_unit_plants_loc_dtls',
'WHERE bupld_bu = :GLOBAL_bu',
'AND bupld_actv_loc_flag = ''Y''',
'ORDER BY bupld_loc_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_PLNT'
,p_display_column_name=>'BUPLD_PLNT_DESC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562356052180025228)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Location'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562356484116025228)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Loc. Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562356875701025228)
,p_query_column_name=>'BUPLD_PLNT'
,p_heading=>'Unit'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562357248717025229)
,p_query_column_name=>'BUPLD_PLNT_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
