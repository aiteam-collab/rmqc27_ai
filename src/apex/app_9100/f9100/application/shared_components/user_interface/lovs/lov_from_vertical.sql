prompt --application/shared_components/user_interface/lovs/lov_from_vertical
begin
--   Manifest
--     LOV_FROM_VERTICAL
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
 p_id=>wwv_flow_imp.id(7569542666595726895)
,p_lov_name=>'LOV_FROM_VERTICAL'
,p_static_id=>'lov-from-vertical'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ev_vertical_desc,',
'       ev_vertical_id',
'  FROM erp_vertical',
' WHERE (ev_vertical_id <> :P1113009501_BL_TO_VERT_ID',
'  AND :P1113009501_STD_VERT_TYPE = ''V''  OR :P1113009501_BL_BUS_FUN_VERT = ''B'')',
' ORDER BY ev_vertical_desc',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EV_VERTICAL_ID'
,p_display_column_name=>'EV_VERTICAL_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7569544700129736218)
,p_query_column_name=>'EV_VERTICAL_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7569544315840736218)
,p_query_column_name=>'EV_VERTICAL_ID'
,p_heading=>'Vertical'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
