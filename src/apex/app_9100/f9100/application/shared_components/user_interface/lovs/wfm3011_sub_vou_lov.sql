prompt --application/shared_components/user_interface/lovs/wfm3011_sub_vou_lov
begin
--   Manifest
--     WFM3011_SUB_VOU_LOV
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
 p_id=>wwv_flow_imp.id(6844192095438273648)
,p_lov_name=>'WFM3011_SUB_VOU_LOV'
,p_static_id=>'wfm3011-sub-vou-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT Distinct wfdc_sub_vou_type,func_find_sub_vou_type_desc(wfdc_bu,wfdc_sub_vou_type)  AS Sub_Vou ',
'   FROM work_flow_doc_control ',
'  WHERE wfdc_bu =:GLOBAL_bu ',
'    AND wfdc_sub_vou_type IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'WFDC_SUB_VOU_TYPE'
,p_display_column_name=>'SUB_VOU'
,p_default_sort_column_name=>'WFDC_SUB_VOU_TYPE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23706131248'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6844194266292277314)
,p_query_column_name=>'SUB_VOU'
,p_heading=>'Sub Vou. Type Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6844194625963277314)
,p_query_column_name=>'WFDC_SUB_VOU_TYPE'
,p_heading=>'Sub Vou. Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
