prompt --application/shared_components/user_interface/lovs/unit2
begin
--   Manifest
--     UNIT2
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
 p_id=>wwv_flow_imp.id(6190629766029792977)
,p_lov_name=>'UNIT2'
,p_static_id=>'unit'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    SELECT bup_name1, bup_plant_id',
'    FROM business_units, bus_unit_plants, appl_user_plant_access',
'   WHERE     bup_bu = bu_id',
'         AND bup_bu = auba_bu',
'         AND bup_plant_id = auba_plant',
'         AND auba_user_id = :global_user',
'         AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'         AND bup_bu = :global_bu',
'ORDER BY bup_rpt_print_seq'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUP_PLANT_ID'
,p_display_column_name=>'BUP_NAME1'
,p_version_scn=>'22606027083'
);
wwv_flow_imp.component_end;
end;
/
