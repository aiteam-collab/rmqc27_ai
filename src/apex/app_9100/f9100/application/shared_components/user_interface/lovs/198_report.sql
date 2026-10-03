prompt --application/shared_components/user_interface/lovs/198_report
begin
--   Manifest
--     198_REPORT
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
 p_id=>wwv_flow_imp.id(7295979278580741780)
,p_lov_name=>'198_REPORT'
,p_static_id=>'198-report'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'            ABVR_RPT_ID  ',
'    FROM APPL_SUB_VOU_RPTS,APPL_VOU_SUB_TYPES',
'    WHERE ABVR_BU = APST_BU',
'        AND ABVR_SUB_VOU_TYPE = APST_SUB_TYPE',
'        AND ABVR_BU = :GLOBAL_BU',
'        AND ABVR_TYPE = :RSJR_TYPE',
'        AND APST_SUB_TYPE = :RSJR_SUB_TYPE;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'ABVR_RPT_ID'
,p_display_column_name=>'ABVR_RPT_ID'
,p_version_scn=>'24940835784'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7295980574001747833)
,p_query_column_name=>'ABVR_RPT_ID'
,p_heading=>'Report ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
