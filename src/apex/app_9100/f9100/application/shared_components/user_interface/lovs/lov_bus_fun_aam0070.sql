prompt --application/shared_components/user_interface/lovs/lov_bus_fun_aam0070
begin
--   Manifest
--     LOV_BUS_FUN_AAM0070
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
 p_id=>wwv_flow_imp.id(6546344985765919556)
,p_lov_name=>'LOV_BUS_FUN_AAM0070'
,p_static_id=>'lov-bus-fun-aam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name fun_desc ',
'FROM  wapl_bus_fun ',
'WHERE wbf_form_id is not null',
'  AND wbf_node_type not in (''MOD'')'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_ID'
,p_default_sort_column_name=>'FUN_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6546345793495919570)
,p_query_column_name=>'FUN_DESC'
,p_heading=>'Description'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6546345342894919563)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Business Function'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
