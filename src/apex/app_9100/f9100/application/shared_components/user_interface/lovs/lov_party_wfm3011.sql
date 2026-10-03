prompt --application/shared_components/user_interface/lovs/lov_party_wfm3011
begin
--   Manifest
--     LOV_PARTY_WFM3011
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
 p_id=>wwv_flow_imp.id(6829135935373316131)
,p_lov_name=>'LOV_PARTY_WFM3011'
,p_static_id=>'lov-party-wfm-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfdc_benf_id,',
'        (SELECT suplr_name1',
'           FROM suppliers',
'          WHERE suplr_bu       = wfdc_bu',
'            AND suplr_suplr_id = wfdc_benf_id ) wfdc_benf_name',
'  FROM work_flow_doc_control',
' WHERE wfdc_benf_id IS NOT NULL',
'   AND wfdc_bu = :GLOBAL_bu',
'GROUP BY wfdc_benf_id,wfdc_benf_name,wfdc_bu',
' ORDER BY wfdc_benf_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDC_BENF_ID'
,p_display_column_name=>'WFDC_BENF_NAME'
,p_version_scn=>'23668766897'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6829136239469316153)
,p_query_column_name=>'WFDC_BENF_ID'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6829136663553316153)
,p_query_column_name=>'WFDC_BENF_NAME'
,p_heading=>'Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
