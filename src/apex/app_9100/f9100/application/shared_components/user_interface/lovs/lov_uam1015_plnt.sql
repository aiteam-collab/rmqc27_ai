prompt --application/shared_components/user_interface/lovs/lov_uam1015_plnt
begin
--   Manifest
--     LOV_UAM1015_PLNT
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
 p_id=>wwv_flow_imp.id(6648886983927605518)
,p_lov_name=>'LOV_UAM1015_PLNT'
,p_static_id=>'lov-uam1015-plnt'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT AUBA_PLANT,',
'       (SELECT BUP_NAME1',
'          FROM bus_unit_plants',
'         WHERE BUP_BU = AUBA_BU',
'           AND BUP_PLANT_ID = AUBA_PLANT ) PLANT_NAME',
'  FROM APPL_USER_PLANT_ACCESS',
' WHERE AUBA_BU  = :GLOBAL_bu',
' ORDER BY 1',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PLANT_NAME'
,p_display_column_name=>'PLANT_NAME'
,p_default_sort_column_name=>'PLANT_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6648889579913614199)
,p_query_column_name=>'AUBA_PLANT'
,p_heading=>'Unit'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6648889235078614198)
,p_query_column_name=>'PLANT_NAME'
,p_heading=>'Unit  Desc.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
