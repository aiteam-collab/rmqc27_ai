prompt --application/shared_components/user_interface/lovs/lov_module_uam1010
begin
--   Manifest
--     LOV_MODULE_UAM1010
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
 p_id=>wwv_flow_imp.id(7562441579100041007)
,p_lov_name=>'LOV_MODULE_UAM1010'
,p_static_id=>'lov-module-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT UPPER(NVL(APPL_DESC1,ABFV_MODULE)) MODULE_DESC,ABFV_MODULE',
'   FROM applications,appl_bus_fun_vert,APPL_BUS_FUN',
'  WHERE appl_id(+) = abfv_module',
'    AND apbuf_fun_id = abfv_fun_id',
'    AND abfv_vertical_id = :P211131013_UBFAH_VERT_ID',
' AND apbuf_bus_fun_type IN (''C'',''E'',''Q'',''R'')',
' ORDER BY ABFV_MODULE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ABFV_MODULE'
,p_display_column_name=>'MODULE_DESC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562442358955041009)
,p_query_column_name=>'ABFV_MODULE'
,p_heading=>'Module'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562441958440041007)
,p_query_column_name=>'MODULE_DESC'
,p_heading=>'Description'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
