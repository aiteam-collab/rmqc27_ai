prompt --application/shared_components/user_interface/lovs/doc_audit_party
begin
--   Manifest
--     DOC_AUDIT_PARTY
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
 p_id=>wwv_flow_imp.id(6818826788582555914)
,p_lov_name=>'DOC_AUDIT_PARTY'
,p_static_id=>'doc-audit-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_party_id R,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = dma_bu ',
'           AND suplr_suplr_id = dma_party_id) AS  D',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu',
'',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23655077284'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818922234632567842)
,p_query_column_name=>'D'
,p_heading=>'Ref. Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818922658140567842)
,p_query_column_name=>'R'
,p_heading=>'Ref. Party ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
