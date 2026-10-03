prompt --application/shared_components/user_interface/lovs/find_ess_bus_fun_lov
begin
--   Manifest
--     FIND_ESS_BUS_FUN_LOV
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
 p_id=>wwv_flow_imp.id(5977309906216446570)
,p_lov_name=>'FIND_ESS_BUS_FUN_LOV'
,p_static_id=>'find-ess-bus-fun-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bfa_menu_id,',
'       bfa_menu_desc,',
'       wbf_node_type',
' FROM(',
'SELECT DISTINCT bfa_menu_id,',
'       bfa_menu_desc,',
'       decode(bfa_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       decode(bfa_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM bus_fun_apex,',
'       ess_bu_fun_access_ln',
' WHERE bfa_menu_id = ebfal_bus_fun_id',
'  )',
'  ORDER BY wbf_node,bfa_menu_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BFA_MENU_ID'
,p_display_column_name=>'BFA_MENU_DESC'
,p_default_sort_column_name=>'BFA_MENU_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22445800150'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977329503611506370)
,p_query_column_name=>'BFA_MENU_DESC'
,p_heading=>'Bus. Fun. Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977329978310506370)
,p_query_column_name=>'BFA_MENU_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977310918864446586)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
