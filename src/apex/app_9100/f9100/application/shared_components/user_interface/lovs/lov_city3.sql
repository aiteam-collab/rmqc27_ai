prompt --application/shared_components/user_interface/lovs/lov_city3
begin
--   Manifest
--     LOV_CITY3
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
 p_id=>wwv_flow_imp.id(8020281104030029334)
,p_lov_name=>'LOV_CITY3'
,p_static_id=>'lov-city'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select city_id r,',
'        city_name1 cityname,',
'        state_name1 statename,',
'        state_id,',
'        cntry_name1 cntryname,',
'        cntry_id',
' from',
' cities,states,countries',
' where CITY_BU = STATE_BU',
'   AND CITY_BU = CNTRY_BU',
'   AND CITY_BU = :GLOBAL_BU',
'   AND city_state_id=state_id',
'   and state_cntry_id=cntry_id ;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'CITYNAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020281447662029371)
,p_query_column_name=>'CITYNAME'
,p_heading=>'City Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020283017474029390)
,p_query_column_name=>'CNTRYNAME'
,p_heading=>'Country Name'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020283419363029390)
,p_query_column_name=>'CNTRY_ID'
,p_heading=>'Country'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020281867520029388)
,p_query_column_name=>'R'
,p_heading=>'City'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020282145859029388)
,p_query_column_name=>'STATENAME'
,p_heading=>'State Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020282555195029390)
,p_query_column_name=>'STATE_ID'
,p_heading=>'State'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
