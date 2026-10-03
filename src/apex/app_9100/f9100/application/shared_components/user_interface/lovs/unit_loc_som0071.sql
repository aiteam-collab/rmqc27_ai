prompt --application/shared_components/user_interface/lovs/unit_loc_som0071
begin
--   Manifest
--     UNIT_LOC_SOM0071
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
 p_id=>wwv_flow_imp.id(6083893969737157754)
,p_lov_name=>'UNIT_LOC_SOM0071'
,p_static_id=>'unit-loc-som'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bupld_loc_name,',
'       bupld_loc_id,',
'       bupld_plnt,',
'       FUNC_FIND_PLNT_QRY_DESC (bupld_bu, bupld_plnt, 1) plnt_name',
'  FROM BUS_UNIT_PLANTS_LOC_DTLS',
' WHERE bupld_bu = :global_bu',
' AND   BUPLD_ACTV_LOC_FLAG = ''Y'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_LOC_NAME'
,p_display_column_name=>'BUPLD_LOC_NAME'
,p_default_sort_column_name=>'BUPLD_LOC_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6083895665661160543)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Bupld Loc Id'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6083894476474160537)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Unit Location'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6083895307736160543)
,p_query_column_name=>'BUPLD_PLNT'
,p_heading=>'Bupld Plnt'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6083894861573160543)
,p_query_column_name=>'PLNT_NAME'
,p_heading=>'Plnt Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
