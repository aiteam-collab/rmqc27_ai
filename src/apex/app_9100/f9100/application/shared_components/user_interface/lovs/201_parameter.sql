prompt --application/shared_components/user_interface/lovs/201_parameter
begin
--   Manifest
--     201_PARAMETER
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
 p_id=>wwv_flow_imp.id(7296335514725140278)
,p_lov_name=>'201_PARAMETER'
,p_static_id=>'201-parameter'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ASVRP_SEQ_NO, ASVRP_RPT_PARAM FROM APPL_SUB_VOU_RPT_PARAM',
'WHERE ASVRP_BU = :GLOBAL_BU ',
'   AND ASVRP_RPT_ID = :P201_RPT_ID;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'ASVRP_RPT_PARAM'
,p_display_column_name=>'ASVRP_RPT_PARAM'
,p_default_sort_column_name=>'ASVRP_SEQ_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'24928753917'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7296335982405142900)
,p_query_column_name=>'ASVRP_RPT_PARAM'
,p_heading=>'Parameter'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7296336370931142902)
,p_query_column_name=>'ASVRP_SEQ_NO'
,p_heading=>'Seq No.'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
