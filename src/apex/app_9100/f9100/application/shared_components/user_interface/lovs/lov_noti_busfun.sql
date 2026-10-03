prompt --application/shared_components/user_interface/lovs/lov_noti_busfun
begin
--   Manifest
--     LOV_NOTI_BUSFUN
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
 p_id=>wwv_flow_imp.id(6561160700388670442)
,p_lov_name=>'LOV_NOTI_BUSFUN'
,p_static_id=>'lov-noti-busfun'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       wbf_node_type',
' FROM(',
' SELECT DISTINCT wbf_bus_fun_id,',
'       wbf_bus_fun_name,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       DECODE(wbf_node_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM wapl_bus_fun,',
'       wa_user_notif_access_hd,',
'       wa_user_notif_access_ln',
' WHERE wbf_bus_fun_id = wunahd_user_id',
'   AND wbf_visible = ''Y''',
'   AND wunahd_bu = :GLOBAL_BU',
'   AND wunahd_bu = wunaln_bu',
'   AND wunahd_doc_no = wunaln_doc_no',
'   AND (wunahd_user_id = :P179_USER_ID OR :P179_USER_ID IS NULL)',
'  )',
'  ORDER BY wbf_node,wbf_bus_fun_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'WBF_BUS_FUN_ID'
,p_display_column_name=>'WBF_BUS_FUN_NAME'
,p_default_sort_column_name=>'WBF_BUS_FUN_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22802712384'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6561167737834678252)
,p_query_column_name=>'WBF_BUS_FUN_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6561167483272678252)
,p_query_column_name=>'WBF_BUS_FUN_NAME'
,p_heading=>'Bus. Fun. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6561168141159678252)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Node Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
