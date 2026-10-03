prompt --application/shared_components/user_interface/lovs/lov_bus_fun_name
begin
--   Manifest
--     LOV_BUS_FUN_NAME
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
 p_id=>wwv_flow_imp.id(6227758079114479581)
,p_lov_name=>'LOV_BUS_FUN_NAME'
,p_static_id=>'lov-bus-fun-name'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT APBUF_FUN_ID,',
'       DECODE ( (SELECT applctrl_desc_level',
'                   FROM appl_control',
'                  WHERE applctrl_bu = :global_bu),',
'               1, APBUF_FUN_DESC1,',
'               NVL (APBUF_FUN_DESC2, APBUF_FUN_DESC2))',
'          fun_desc',
'  FROM appl_bus_fun',
' WHERE apbuf_fun_id IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'APBUF_FUN_ID'
,p_display_column_name=>'APBUF_FUN_ID'
,p_default_sort_column_name=>'APBUF_FUN_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6227760135087483190)
,p_query_column_name=>'APBUF_FUN_ID'
,p_heading=>'Bus. Fun. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6227760501318483195)
,p_query_column_name=>'FUN_DESC'
,p_heading=>'Bus. Fun. Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
