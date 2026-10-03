prompt --application/shared_components/user_interface/lovs/wfm1010_party_find
begin
--   Manifest
--     WFM1010_PARTY_FIND
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
 p_id=>wwv_flow_imp.id(8233505972620273826)
,p_lov_name=>'WFM1010_PARTY_FIND'
,p_static_id=>'wfm1010-party-find'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfdc_benf_id,',
'      /* CASE WHEN wfdc_benf_type = ''S'' THEN (SELECT suplr_name1 FROM suppliers WHERE suplr_bu = wfdc_bu AND suplr_suplr_id = wfdc_benf_id)',
'            WHEN wfdc_benf_type = ''C'' THEN (SELECT suplr_name1 FROM suppliers WHERE suplr_bu = wfdc_bu AND suplr_suplr_id = wfdc_benf_id) ',
'            ELSE wfdc_benf_id END */',
'       (CASE WHEN wfdc_benf_type = ''S'' THEN func_find_party_name(wfdc_bu,wfdc_spplr_id,1)',
'         WHEN wfdc_benf_type = ''C'' THEN func_find_party_name(wfdc_bu,wfdc_cust_id,1)',
'         WHEN  wfdc_benf_type = ''E'' THEN func_find_employee_desc(wfdc_bu,wfdc_benf_id,1)',
'END)  ',
'wfdc_benf_name/*,',
'       CASE wfdc_benf_type WHEN ''S'' THEN ''Supplier''',
'                           WHEN ''C'' THEN ''Customer''',
'       END wfdc_benf_type*/',
'  FROM work_flow_doc_control',
' WHERE wfdc_benf_id IS NOT NULL',
'   AND wfdc_bu = :GLOBAL_bu',
' ORDER BY wfdc_benf_name'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFDC_BENF_ID'
,p_display_column_name=>'WFDC_BENF_NAME'
,p_version_scn=>'18047658350'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8233513178836282365)
,p_query_column_name=>'WFDC_BENF_ID'
,p_heading=>'Party ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8233513983360282371)
,p_query_column_name=>'WFDC_BENF_NAME'
,p_heading=>'Party Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
