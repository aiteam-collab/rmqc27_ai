prompt --application/shared_components/user_interface/lovs/lov_prefix_uam1010
begin
--   Manifest
--     LOV_PREFIX(UAM1010)
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
 p_id=>wwv_flow_imp.id(7562357996043025229)
,p_lov_name=>'LOV_PREFIX(UAM1010)'
,p_static_id=>'lov-prefix-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT adp_pfx, ',
'--       adp_desc1,',
'--       adp_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = adp_bu',
'           AND bup_plant_id = adp_plnt) adp_plnt_desc,',
'--       adpl_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = adpl_bu',
'           AND bupld_plnt = adpl_plnt',
'           AND bupld_loc_id = adpl_loc_id) adpl_loc_name',
'  FROM appl_doc_prefixes,',
'       appl_doc_pfx_loc',
' WHERE adp_bu = :GLOBAL_bu',
'   AND adp_bu = adpl_bu',
'   AND adp_pfx = adpl_pfx',
'   AND adp_plnt = adpl_plnt',
' ORDER BY 2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ADP_PFX'
,p_display_column_name=>'ADP_PFX'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562359202569025231)
,p_query_column_name=>'ADPL_LOC_NAME'
,p_heading=>'Unit Location'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562358398100025231)
,p_query_column_name=>'ADP_PFX'
,p_heading=>'Prefix'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562358744686025231)
,p_query_column_name=>'ADP_PLNT_DESC'
,p_heading=>'Unit'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
