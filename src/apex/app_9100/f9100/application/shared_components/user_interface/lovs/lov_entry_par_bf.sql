prompt --application/shared_components/user_interface/lovs/lov_entry_par_bf
begin
--   Manifest
--     LOV_ENTRY_PAR_BF
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
 p_id=>wwv_flow_imp.id(7446216129819360023)
,p_lov_name=>'LOV_ENTRY_PAR_BF'
,p_static_id=>'lov-entry-par-bf'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT wbf_bus_fun_name,',
'        wbf_bus_fun_id,',
'        wbf_bus_fun_alias_name',
'   FROM wapl_bus_fun',
'  WHERE wbf_node_type IN (''MOD'')',
'  ORDER BY wbf_bus_fun_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_ID'
,p_default_sort_column_name=>'WBF_BUS_FUN_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'25936711813'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6957914470228001146)
,p_query_column_name=>'WBF_BUS_FUN_ALIAS_NAME'
,p_heading=>'Par. Bus. Fun Alias Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7659894015869611343)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Par. Bus. Fun.'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7659894390166611343)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Par. Bus. Fun. Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
