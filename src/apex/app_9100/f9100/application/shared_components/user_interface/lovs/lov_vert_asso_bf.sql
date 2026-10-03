prompt --application/shared_components/user_interface/lovs/lov_vert_asso_bf
begin
--   Manifest
--     LOV_VERT_ASSO_BF
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
 p_id=>wwv_flow_imp.id(7568323044868821731)
,p_lov_name=>'LOV_VERT_ASSO_BF'
,p_static_id=>'lov-vert-asso-bf'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_name,',
'       wbf_vert_bus_fun_name,',
'       wbf_bus_fun_id,',
'       DECODE(wbf_node_type, ''FRM'', ''Form'', ''RPT'', ''Analytics'', ''REP'', ''Reports'', ''Others'') wbf_node_type',
'  FROM wapl_bus_fun',
' WHERE wbf_node_type IN (''FRM'', ''RPT'', ''SET'', ''REP'')',
'       AND (:WVBFA_VERTICAL_ID NOT IN (''40001'',''40002'',''40003'',''40004''))',
'UNION ALL',
'SELECT wbf_bus_fun_name,',
'       wbf_vert_bus_fun_name,',
'       wbf_bus_fun_id,',
'       DECODE(wbf_node_type, ''FRM'', ''Form'', ''RPT'', ''Analytics'', ''REP'', ''Reports'', ''Others'') wbf_node_type',
'  FROM wapl_bus_fun',
' WHERE wbf_node_type IN (''FRM'', ''RPT'', ''SET'', ''REP'')',
'       AND wbf_vertical_id IN (''40001'',''40002'',''40003'',''40004'')',
'       AND wbf_vertical_id =:WVBFA_VERTICAL_ID',
' ORDER BY wbf_bus_fun_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7568359029705860359)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Bus. Fun.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7568359433300860360)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7568360137236860360)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7568359816332860360)
,p_query_column_name=>'WBF_VERT_BUS_FUN_NAME'
,p_heading=>'Vert. Description'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
