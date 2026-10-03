prompt --application/shared_components/user_interface/lovs/lov_unit_loc_pfx_uam1010
begin
--   Manifest
--     LOV_UNIT_LOC_PFX(UAM1010)
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
 p_id=>wwv_flow_imp.id(7562359895738025232)
,p_lov_name=>'LOV_UNIT_LOC_PFX(UAM1010)'
,p_static_id=>'lov-unit-loc-pfx-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bupld_loc_name,',
'      bupld_loc_id,',
'--       bupld_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = bupld_bu',
'           AND bup_plant_id = bupld_plnt) bupld_plnt_desc',
'  FROM bus_unit_plants_loc_dtls,',
'       appl_doc_pfx_loc',
' WHERE bupld_bu = :GLOBAL_bu',
'   AND bupld_bu = adpl_bu',
'   AND adpl_pfx   = :UPAL_PFX',
'   AND bupld_plnt = adpl_plnt',
'AND adpl_loc_id = bupld_loc_id',
' ORDER BY bupld_loc_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_LOC_ID'
,p_display_column_name=>'BUPLD_LOC_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562361134785025234)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Location Id'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562360334938025232)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Location'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562360712551025234)
,p_query_column_name=>'BUPLD_PLNT_DESC'
,p_heading=>'Bupld Plnt Desc'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
