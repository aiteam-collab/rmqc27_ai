prompt --application/shared_components/user_interface/lovs/doc_cost_centers
begin
--   Manifest
--     DOC_COST_CENTERS
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
 p_id=>wwv_flow_imp.id(6829841500157325959)
,p_lov_name=>'DOC_COST_CENTERS'
,p_static_id=>'doc-cost-centers'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dma_cpc_id R,',
'       (SELECT pcc_desc',
'          FROM PROFIT_COST_CENTERS',
'         WHERE pcc_bu = :global_bu ',
'             AND pcc_cc_code = dma_cpc_id)  D',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_BU ',
'      AND dma_cpc_id IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23670582993'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6829841806183325984)
,p_query_column_name=>'D'
,p_heading=>'CPC Dec.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6829842265688325986)
,p_query_column_name=>'R'
,p_heading=>'CPC'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
