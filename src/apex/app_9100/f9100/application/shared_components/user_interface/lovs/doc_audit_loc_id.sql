prompt --application/shared_components/user_interface/lovs/doc_audit_loc_id
begin
--   Manifest
--     DOC_AUDIT_LOC_ID
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
 p_id=>wwv_flow_imp.id(6818778023351077380)
,p_lov_name=>'DOC_AUDIT_LOC_ID'
,p_static_id=>'doc-audit-loc-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT distinct dma_loc_id AS "Loc. ID",',
'        (SELECT bupld_loc_name',
'           FROM bus_unit_plants_loc_dtls',
'          WHERE bupld_bu = dma_bu',
'            AND bupld_loc_id = dma_loc_id)"Loc. Name"',
'   FROM doc_mgmt_audit',
'  WHERE dma_bu = :global_bu',
'   AND dma_loc_id IS NOT NULL'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'Loc. ID'
,p_display_column_name=>'Loc. Name'
,p_default_sort_column_name=>'Loc. Name'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23654597087'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818778798561080136)
,p_query_column_name=>'Loc. ID'
,p_heading=>'Loc. ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818778402238080134)
,p_query_column_name=>'Loc. Name'
,p_heading=>'Loc. Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
