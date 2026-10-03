prompt --application/shared_components/user_interface/lovs/lov_par_bus_fun
begin
--   Manifest
--     LOV_PAR_BUS_FUN
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
 p_id=>wwv_flow_imp.id(6597335263583928459)
,p_lov_name=>'LOV_PAR_BUS_FUN'
,p_static_id=>'lov-par-bus-fun'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT wbf_bus_fun_name,',
'       wbf_bus_fun_id',
'  FROM wapl_bus_fun',
' WHERE wbf_node_type IN (''MOD'')',
' ORDER BY wbf_bus_fun_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6597335537639928490)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Bus. Fun.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6597336020870928498)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Description'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
