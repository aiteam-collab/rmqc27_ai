prompt --application/shared_components/user_interface/lovs/aam0004_par_bus_fun
begin
--   Manifest
--     AAM0004_PAR_BUS_FUN
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
 p_id=>wwv_flow_imp.id(6534622022327773426)
,p_lov_name=>'AAM0004_PAR_BUS_FUN'
,p_static_id=>'aam0004-par-bus-fun'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       wbf_node_type',
' FROM(',
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       wbf_bus_fun_alias_name,',
'       wbf_seq_no,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       DECODE(wbf_node_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM wapl_bus_fun',
'WHERE  wbf_par_fun_id IS NULL',
'   AND wbf_node_type = ''MOD''',
'  )',
'  ORDER BY wbf_seq_no',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_NAME'
,p_display_column_name=>'WBF_BUS_FUN_NAME'
,p_version_scn=>'18478332714'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534622857811781429)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Parent Bus.Fun.ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534622478309781426)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Parent Bus. Fun. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534623248036781429)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
