prompt --application/shared_components/user_interface/lovs/doc_audit_item
begin
--   Manifest
--     DOC_AUDIT_ITEM
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
 p_id=>wwv_flow_imp.id(6818759657919012058)
,p_lov_name=>'DOC_AUDIT_ITEM'
,p_static_id=>'doc-audit-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_prod_id,',
'       (SELECT (prod_desc11 || '' '' || prod_desc21)',
'          FROM products',
'         WHERE prod_bu = dma_bu',
'           AND prod_id = dma_prod_id',
'           AND prod_rev = dma_prod_rev)',
'             dm_prod_desc,dma_bu,',
'       dma_prod_rev',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :global_bu',
'   AND dma_prod_id IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'DMA_PROD_ID'
,p_display_column_name=>'DM_PROD_DESC'
,p_default_sort_column_name=>'DM_PROD_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23654477033'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818762423553018655)
,p_query_column_name=>'DMA_PROD_ID'
,p_heading=>'Item'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818762795486018655)
,p_query_column_name=>'DMA_PROD_REV'
,p_heading=>'Rev.'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818763236416018656)
,p_query_column_name=>'DM_PROD_DESC'
,p_heading=>'Item Desc.'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
