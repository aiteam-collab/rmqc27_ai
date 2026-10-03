prompt --application/shared_components/user_interface/lovs/pom1020_lov_item
begin
--   Manifest
--     POM1020_LOV_ITEM
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
 p_id=>wwv_flow_imp.id(7700595922856485818)
,p_lov_name=>'POM1020_LOV_ITEM'
,p_static_id=>'pom1020-lov-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT suprprod_prod_id,',
'                suprprod_prod_rev,',
'                func_find_prod_desc ( :global_bu,',
'                                        suprprod_prod_id,',
'                                        suprprod_prod_rev,',
'                                       1)',
'                   description,',
'						 suprprod_prod_id||''~''||suprprod_prod_rev DUM',
'  FROM suplr_products,',
'       prod_plants',
' WHERE suprprod_bu = prodplnt_bu',
'   AND suprprod_plnt = prodplnt_plnt',
'   AND suprprod_prod_id = prodplnt_prod_id',
'   AND suprprod_prod_rev = prodplnt_prod_rev',
'   AND suprprod_type = :P161513102501_prchd_prod_type',
'   AND suprprod_suplr_id = :P161513102501_prchd_suplr',
'   AND suprprod_bu = :GLOBAL_bu',
'   AND suprprod_plnt = :P161513102501_prchd_plnt',
'   AND prodplnt_status = ''A''',
'   AND suprprod_pur_price_basis = ''C''',
'   AND func_find_pur_item_source(:GLOBAL_bu,:P161513102501_prchd_suplr) = ''Y''',
'   AND :P161513102501_PRCHD_SKS_MST_TY = ''M''',
'UNION ALL',
'SELECT DISTINCT prodplnt_prod_id,',
'       prodplnt_prod_rev,',
'       prod_desc11 description,',
'		  prodplnt_prod_id||''~''||prodplnt_prod_rev DUM',
'  FROM products,prod_plants',
' WHERE prod_bu = prodplnt_bu',
'   AND prod_id = prodplnt_prod_id ',
'   AND prod_rev = prodplnt_prod_rev ',
'   AND prod_status = ''A''',
'   AND prodplnt_status = ''A''',
'   AND prodplnt_pur_price_basis =''C''',
'   AND prodplnt_bu = :GLOBAL_bu',
'   AND prodplnt_plnt = :P161513102501_prchd_plnt',
'   AND func_find_pur_item_source(:GLOBAL_bu,:P161513102501_prchd_suplr) = ''N''',
'   AND :P161513102501_PRCHD_SKS_MST_TY = ''M''',
'UNION ALL',
'SELECT DISTINCT prodplnt_prod_id,prodplnt_prod_rev,prod_desc11 description,prodplnt_prod_id||''~''||prodplnt_prod_rev DUM',
'  FROM products,prod_plants,trans_charge_item_assoc',
' WHERE prod_bu = prodplnt_bu',
'   AND prod_id = prodplnt_prod_id ',
'   AND prod_rev = prodplnt_prod_rev ',
'   AND tcia_bu = prod_bu',
'   AND tcia_prod_id = prod_id',
'   AND tcia_prod_rev = prod_rev',
'   AND prod_status = ''A''',
'   AND prodplnt_status = ''A''',
'   AND prodplnt_pur_price_basis =''C''',
'   AND prod_bu = :GLOBAL_bu',
'   AND prodplnt_plnt = :P161513102501_prchd_plnt',
'   AND :P161513102501_PRCHD_SKS_MST_TY <> ''M''',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'DUM'
,p_display_column_name=>'SUPRPROD_PROD_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700597115013485820)
,p_query_column_name=>'DESCRIPTION'
,p_heading=>'Item Desc.'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700597450278485821)
,p_query_column_name=>'DUM'
,p_heading=>'Dum'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700596251314485820)
,p_query_column_name=>'SUPRPROD_PROD_ID'
,p_heading=>'Item'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700596635590485820)
,p_query_column_name=>'SUPRPROD_PROD_REV'
,p_heading=>'Rev.'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
