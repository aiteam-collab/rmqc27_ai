prompt --application/shared_components/user_interface/lovs/unit_lov
begin
--   Manifest
--     UNIT_LOV
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
 p_id=>wwv_flow_imp.id(11127191805393147895)
,p_lov_name=>'UNIT_LOV'
,p_static_id=>'unit-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bup_name1,bup_plant_id',
'  FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE     bup_bu = bu_id',
'       AND bup_bu = auba_bu',
'       AND bup_plant_id = auba_plant',
'       AND auba_user_id = :GLOBAL_USER',
'       AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)',
'       AND bup_bu = :GLOBAL_BU'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUP_PLANT_ID'
,p_display_column_name=>'BUP_NAME1'
,p_default_sort_column_name=>'BUP_NAME1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
