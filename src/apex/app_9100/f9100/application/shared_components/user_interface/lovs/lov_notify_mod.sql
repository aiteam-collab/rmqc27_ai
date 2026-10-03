prompt --application/shared_components/user_interface/lovs/lov_notify_mod
begin
--   Manifest
--     LOV_NOTIFY_MOD
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
 p_id=>wwv_flow_imp.id(7028407204781508992)
,p_lov_name=>'LOV_NOTIFY_MOD'
,p_static_id=>'lov-notify-mod'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT apbfmn_desc1,',
'       apbfmn_id',
'  FROM appl_bus_fun_module_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'APBFMN_ID'
,p_display_column_name=>'APBFMN_DESC1'
,p_default_sort_column_name=>'APBFMN_DESC1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7028408046072515363)
,p_query_column_name=>'APBFMN_DESC1'
,p_heading=>'Notification Desc.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7028407681202515360)
,p_query_column_name=>'APBFMN_ID'
,p_heading=>'Notification Id'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
