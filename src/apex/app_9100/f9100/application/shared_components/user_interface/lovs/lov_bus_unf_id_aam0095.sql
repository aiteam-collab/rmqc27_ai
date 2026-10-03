prompt --application/shared_components/user_interface/lovs/lov_bus_unf_id_aam0095
begin
--   Manifest
--     LOV_BUS_UNF_ID(AAM0095)
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
 p_id=>wwv_flow_imp.id(5972931459774298193)
,p_lov_name=>'LOV_BUS_UNF_ID(AAM0095)'
,p_static_id=>'lov-bus-unf-id-aam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       wbf_node_type',
' FROM(',
'SELECT DISTINCT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       DECODE(wbf_node_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM wapl_bus_fun,',
'       wapl_bus_fun_access_view',
' WHERE wbf_bus_fun_id = wbfav_bus_fun_id',
'   AND wbf_visible         = ''Y''',
'   AND (wbfav_user_id  =  :P87_USER_ID OR :P87_USER_ID IS NULL)',
'  )',
'  ORDER BY wbf_node,wbf_bus_fun_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_NAME'
,p_default_sort_column_name=>'WBF_BUS_FUN_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534624284851784076)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534624727294784076)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Bus. Fun. Desc'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6534625127609784076)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
