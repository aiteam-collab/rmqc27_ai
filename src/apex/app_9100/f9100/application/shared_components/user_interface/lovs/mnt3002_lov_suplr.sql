prompt --application/shared_components/user_interface/lovs/mnt3002_lov_suplr
begin
--   Manifest
--     MNT3002_LOV_SUPLR
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
 p_id=>wwv_flow_imp.id(7086152654107908684)
,p_lov_name=>'MNT3002_LOV_SUPLR'
,p_static_id=>'mnt3002-lov-suplr'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUPLR_SUPLR_ID,SUPLR_NAME1',
'  FROM SUPPLIERS',
' WHERE SUPLR_BU         = :GLOBAL_BU',
'   AND SUPLR_STATUS     = ''A''',
'   AND SUPLR_PARTY_TYPE = ''S''',
'GROUP BY SUPLR_SUPLR_ID,SUPLR_NAME1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'SUPLR_SUPLR_ID'
,p_display_column_name=>'SUPLR_SUPLR_ID'
,p_default_sort_column_name=>'SUPLR_SUPLR_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'26360875777'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7086154559217912452)
,p_query_column_name=>'SUPLR_NAME1'
,p_heading=>'Supplier Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7086154127081912452)
,p_query_column_name=>'SUPLR_SUPLR_ID'
,p_heading=>'Supplier ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
