prompt --application/shared_components/user_interface/lovs/aam0004_bus_fun_id
begin
--   Manifest
--     AAM0004_BUS_FUN_ID
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
 p_id=>wwv_flow_imp.id(6534614594638747987)
,p_lov_name=>'AAM0004_BUS_FUN_ID'
,p_static_id=>'aam0004-bus-fun-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_id,',
'       (wbf_bus_fun_name)wbf_bus_fun_name,',
'       (wbf_node_type)wbf_node_type,',
'       wbf_node',
' FROM(',
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       DECODE(wbf_node_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM wapl_bus_fun',
'  )',
'  ORDER BY wbf_node,wbf_bus_fun_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_NAME'
,p_display_column_name=>'WBF_BUS_FUN_NAME'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534619985114761481)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534619620753761478)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Bus. Fun. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6662251406485494626)
,p_query_column_name=>'WBF_NODE'
,p_heading=>'Wbf Node'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534620433891761481)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
