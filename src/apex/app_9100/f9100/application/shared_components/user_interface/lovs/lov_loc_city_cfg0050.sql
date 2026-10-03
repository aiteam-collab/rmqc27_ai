prompt --application/shared_components/user_interface/lovs/lov_loc_city_cfg0050
begin
--   Manifest
--     LOV_LOC_CITY(CFG0050)
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
 p_id=>wwv_flow_imp.id(8020286322841029440)
,p_lov_name=>'LOV_LOC_CITY(CFG0050)'
,p_static_id=>'lov-loc-city-cfg'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT city_name1 city_desc,',
'       city_id, ',
'       state_name1 state_desc,',
'       state_id,',
'       Cntry_name1 country_desc,',
'       cntry_id ',
'  FROM cities,states,countries',
' WHERE CITY_BU = STATE_BU',
'   AND CITY_BU = CNTRY_BU',
'   AND CITY_BU = :GLOBAL_BU',
'   AND city_state_id = state_id ',
'   AND state_cntry_id = cntry_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CITY_ID'
,p_display_column_name=>'CITY_DESC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020286663366029440)
,p_query_column_name=>'CITY_DESC'
,p_heading=>'City Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020287079286029440)
,p_query_column_name=>'CITY_ID'
,p_heading=>'City'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020288702050029442)
,p_query_column_name=>'CNTRY_ID'
,p_heading=>'Country'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020288325379029442)
,p_query_column_name=>'COUNTRY_DESC'
,p_heading=>'Country Name'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020287471559029440)
,p_query_column_name=>'STATE_DESC'
,p_heading=>'State Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020287866377029442)
,p_query_column_name=>'STATE_ID'
,p_heading=>'State'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
