prompt --application/shared_components/user_interface/lovs/lov_party
begin
--   Manifest
--     LOV_PARTY
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
 p_id=>wwv_flow_imp.id(6316000995854285812)
,p_lov_name=>'LOV_PARTY'
,p_static_id=>'lov-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT party,',
'                  desc1,',
'                  curr,',
'                  TYPE,',
'                  party_type,',
'                  part,',
'                  suplr_part_flag',
'    FROM (SELECT cust_cust_id party,',
'                 cust_name1 desc1,',
'                 cust_currency curr,',
'                 DECODE (cust_cust_id, NULL, NULL, ''Customer'') TYPE,',
'                 DECODE (cust_cust_id, NULL, NULL, ''C'') party_type,',
'                 ''C'' part,',
'                 cust_part_flag suplr_part_flag',
'            FROM customers',
'           WHERE     cust_bu = :global_bu',
'                 AND cust_status = ''A''',
'                 AND cust_suplr_id IS NULL',
'                 AND :P118132066_FLAG_PARENT = ''N''',
'                 AND NOT EXISTS',
'                            (SELECT 1',
'                               FROM suppliers',
'                              WHERE suplr_bu = cust_bu',
'                                    AND suplr_cust_id = cust_cust_id)',
'          UNION',
'          SELECT suplr_cust_id,',
'                 suplr_name1 desc1,',
'                 suplr_currency curr,',
'                 DECODE (suplr_cust_id, NULL, NULL, ''Partner'') TYPE,',
'                 DECODE (suplr_cust_id, NULL, NULL, ''P'') party_type,',
'                 ''C'' part,',
'                 suplr_part_flag',
'            FROM suppliers',
'           WHERE     suplr_bu = :global_bu',
'                 AND suplr_status = ''A''',
'                 AND suplr_cust_id IS NOT NULL',
'                 AND :P118132066_FLAG_PARENT = ''N''',
'          UNION ALL',
'          SELECT cust_cust_id party,',
'                 cust_name1 desc1,',
'                 cust_currency curr,',
'                 DECODE (cust_cust_id, NULL, NULL, ''Customer'') TYPE,',
'                 DECODE (cust_cust_id, NULL, NULL, ''C'') party_type,',
'                 ''C'' part,',
'                 cust_part_flag suplr_part_flag',
'            FROM customers',
'           WHERE     cust_bu = :global_bu',
'                 AND cust_status = ''A''',
'                 AND (cust_part_flag = ''Y'')',
'                 AND :P118132066_FLAG_PARENT = ''Y'')',
'ORDER BY desc1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTY'
,p_display_column_name=>'PARTY'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316190833550678728)
,p_query_column_name=>'CURR'
,p_heading=>'Curr'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316190474983678726)
,p_query_column_name=>'DESC1'
,p_heading=>'Desc1'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316192437741678729)
,p_query_column_name=>'PART'
,p_heading=>'Part'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316163118990613470)
,p_query_column_name=>'PARTY'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316191235276678728)
,p_query_column_name=>'PARTY_TYPE'
,p_heading=>'Party Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316192111611678728)
,p_query_column_name=>'SUPLR_PART_FLAG'
,p_heading=>'Suplr Part Flag'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316191703102678728)
,p_query_column_name=>'TYPE'
,p_heading=>'Type'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
