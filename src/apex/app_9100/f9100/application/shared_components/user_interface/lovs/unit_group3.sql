prompt --application/shared_components/user_interface/lovs/unit_group3
begin
--   Manifest
--     UNIT_GROUP3
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
 p_id=>wwv_flow_imp.id(7959160330204732063)
,p_lov_name=>'UNIT_GROUP3'
,p_static_id=>'unit-group-4'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' /*SELECT distinct upgrp_desc1, upgrp_group_id',
'  FROM unit_plant_groups, bus_unit_plants, appl_user_plant_access',
' WHERE     UPGRP_BU = :global_bu',
'       AND UPGRP_BU = bup_bu',
'       AND upgrp_group_id = bup_group_id',
'       AND bup_bu = auba_bu',
'       AND bup_plant_id = auba_plant',
'       AND auba_user_id = :global_user*/',
'',
'',
'SELECT bupld_loc_id,bupld_loc_name,bupld_plnt,func_find_plnt_desc(:GLOBAL_bu,bupld_plnt,1) plnt_desc',
'  FROM bus_unit_plants_loc_dtls',
' WHERE bupld_bu = :GLOBAL_bu    ',
'       '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUPLD_LOC_ID'
,p_display_column_name=>'BUPLD_LOC_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7959160719588732067)
,p_query_column_name=>'BUPLD_LOC_ID'
,p_heading=>'Location'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7959161129172732070)
,p_query_column_name=>'BUPLD_LOC_NAME'
,p_heading=>'Location Desc'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
