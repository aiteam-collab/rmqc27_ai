prompt --application/shared_components/user_interface/lovs/doc_audit_unit
begin
--   Manifest
--     DOC_AUDIT_UNIT
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
 p_id=>wwv_flow_imp.id(6818811103069495691)
,p_lov_name=>'DOC_AUDIT_UNIT'
,p_static_id=>'doc-audit-unit'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT  dma_plnt_id R,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = dma_bu ',
'           AND bup_plant_id = dma_plnt_id',
'       ) D',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_BU',
'   AND dma_plnt_id IS NOT NULL',
' ORDER BY dma_plnt_id   ',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23655010788'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818814671952511427)
,p_query_column_name=>'D'
,p_heading=>'Unit Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6818815048878511428)
,p_query_column_name=>'R'
,p_heading=>'Unit'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
