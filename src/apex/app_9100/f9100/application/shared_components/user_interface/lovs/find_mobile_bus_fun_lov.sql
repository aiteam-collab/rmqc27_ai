prompt --application/shared_components/user_interface/lovs/find_mobile_bus_fun_lov
begin
--   Manifest
--     FIND_MOBILE_BUS_FUN_LOV
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
 p_id=>wwv_flow_imp.id(6963362694433140816)
,p_lov_name=>'FIND_MOBILE_BUS_FUN_LOV'
,p_static_id=>'find-mobile-bus-fun-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bfm_menu_id,',
'       bfm_menu_desc,',
'       wbf_node_type',
' FROM(',
'SELECT DISTINCT bfm_menu_id,',
'       bfm_menu_desc,',
'       decode(bfm_type,''FORM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       decode(bfm_type,''SET'',1,''FRM'',2,''REP'',3,''RPT'',4,''MOD'',5) wbf_node',
'  FROM bus_fun_mobile,',
'       mobile_bu_fun_access_ln',
' WHERE bfm_menu_id = mbfal_bus_fun_id',
'  )',
'  ORDER BY wbf_node_type,bfm_menu_id',
'  '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BFM_MENU_ID'
,p_display_column_name=>'BFM_MENU_DESC'
,p_default_sort_column_name=>'BFM_MENU_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'25911231077'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6963363481570140848)
,p_query_column_name=>'BFA_MENU_DESC'
,p_heading=>'Bus. Fun. Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6963363051623140846)
,p_query_column_name=>'BFA_MENU_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6963403575647223465)
,p_query_column_name=>'BFM_MENU_DESC'
,p_heading=>'Bus. Fun. Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6963403087015223465)
,p_query_column_name=>'BFM_MENU_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6963363838858140848)
,p_query_column_name=>'WBF_NODE_TYPE'
,p_heading=>'Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
