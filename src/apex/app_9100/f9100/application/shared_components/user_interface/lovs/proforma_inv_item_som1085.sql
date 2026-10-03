prompt --application/shared_components/user_interface/lovs/proforma_inv_item_som1085
begin
--   Manifest
--     PROFORMA_INV_ITEM_SOM1085
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
 p_id=>wwv_flow_imp.id(6078677731489717081)
,p_lov_name=>'PROFORMA_INV_ITEM_SOM1085'
,p_static_id=>'proforma-inv-item-som'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT prod_desc11,prodplnt_prod_id',
'  FROM products,prod_plants',
' WHERE prodplnt_bu = prod_bu',
'   AND prodplnt_prod_id = prod_id',
'   AND prodplnt_prod_rev = prod_rev',
'   AND prod_status = ''A''',
'   AND prod_stocked = ''N''',
'   AND prodplnt_bu = :GLOBAL_bu',
'   AND prodplnt_plnt = :P191513108514_PIOTC_PLNT;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PROD_DESC11'
,p_display_column_name=>'PROD_DESC11'
,p_default_sort_column_name=>'PROD_DESC11'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6078678699923721907)
,p_query_column_name=>'PRODPLNT_PROD_ID'
,p_heading=>'Prod. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6078679095046721907)
,p_query_column_name=>'PROD_DESC11'
,p_heading=>'Prod. Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
