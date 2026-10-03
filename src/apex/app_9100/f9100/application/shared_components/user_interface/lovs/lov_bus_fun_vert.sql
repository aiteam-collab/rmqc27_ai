prompt --application/shared_components/user_interface/lovs/lov_bus_fun_vert
begin
--   Manifest
--     LOV_BUS_FUN_VERT
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
 p_id=>wwv_flow_imp.id(7446058581817253731)
,p_lov_name=>'LOV_BUS_FUN_VERT'
,p_static_id=>'lov-bus-fun-vert'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ev_vertical_desc wv_vertical_name,',
'       ev_vertical_id wv_vertical_id',
'  FROM erp_vertical ',
' ORDER BY ev_vertical_desc '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WV_VERTICAL_ID'
,p_display_column_name=>'WV_VERTICAL_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7446062878969264479)
,p_query_column_name=>'WV_VERTICAL_ID'
,p_heading=>'Vertical'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7446063290546264479)
,p_query_column_name=>'WV_VERTICAL_NAME'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
