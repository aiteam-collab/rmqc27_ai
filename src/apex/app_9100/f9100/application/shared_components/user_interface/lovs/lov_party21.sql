prompt --application/shared_components/user_interface/lovs/lov_party21
begin
--   Manifest
--     LOV_PARTY21
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
 p_id=>wwv_flow_imp.id(6316011318192320767)
,p_lov_name=>'LOV_PARTY21'
,p_static_id=>'lov-party-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT party, desc1,curr, TYPE, party_type, part, suplr_part_flag',
'  FROM (SELECT suplr_suplr_id party,suplr_name1 desc1,suplr_currency curr,  DECODE (suplr_suplr_id, NULL, NULL, ''Partner'') TYPE,  DECODE (suplr_suplr_id, NULL, NULL, ''P'') party_type,',
'               ''S'' part,   suplr_part_flag    FROM suppliers, suplr_plant_accts,gl_accts,  acct_type_codes',
'         WHERE     suplr_bu = spla_bu',
'               AND suplr_suplr_id = spla_suplr_id AND spla_bu = glac_bu AND spla_acct = glac_acct AND atc_bu = glac_bu AND atc_code = glac_acct_type_code AND atc_sup_cust_type = ''S''      AND suplr_bu = :global_bu   AND :P116132066_PARTFLAG = ''N'' AND '
||'EXISTS',
'                      (SELECT 1    FROM customers   WHERE cust_bu = suplr_bu         AND cust_suplr_id = suplr_suplr_id)   AND (func_find_apm_buyer_flg (:global_bu) = ''N'' OR func_find_apm_buyer_flg (:global_bu) IN (''N'', ''S'')  OR (func_find_apm_buyer_'
||'flg (:global_bu) = ''B''  AND func_find_apm_buyer_flg (:global_bu) = ''Y''',
'                        AND EXISTS',
'                               (  SELECT 1  FROM pur_order_hd, buyers, appl_users WHERE     poh_bu = buyer_bu AND poh_buyer_id = buyer_id AND buyer_bu = appluser_bu AND buyer_emp_id = appluser_emp_id AND poh_status NOT IN (''C'', ''L'')    AND appluser_b'
||'u = :global_bu   AND appluser_id = :global_user   AND poh_suplr_id = suplr_suplr_id GROUP BY appluser_id, poh_suplr_id)))    UNION ALL   SELECT suplr_suplr_id party,suplr_name1 desc1, suplr_currency curr,    DECODE (suplr_suplr_id, NULL, NULL, ''Suppl'
||'ier'') TYPE,  DECODE (suplr_suplr_id, NULL, NULL, ''S'') party_type,    ''S'' part, suplr_part_flag  FROM suppliers,   suplr_plant_accts,     gl_accts,   acct_type_codes WHERE     suplr_bu = spla_bu   AND suplr_suplr_id = spla_suplr_id  AND spla_bu = glac'
||'_bu  AND spla_acct = glac_acct  AND atc_bu = glac_bu  AND atc_code = glac_acct_type_code AND atc_sup_cust_type = ''S'' AND :P116132066_PARTFLAG = ''N''   AND suplr_bu = :global_bu  AND NOT EXISTS',
'                          (SELECT 1   FROM gl_accts b, acct_type_codes k  WHERE     b.glac_bu = spla_bu   AND b.glac_acct = spla_acct   AND k.atc_bu = glac_bu AND k.atc_code = glac_acct_type_code        AND k.atc_sup_cust_type = ''C'')     AND NOT EXIS'
||'TS',
'                          (SELECT 1 FROM customers WHERE cust_bu = suplr_bu     AND cust_suplr_id = suplr_suplr_id)   AND (func_find_apm_buyer_flg (:global_bu) = ''N''     OR func_find_apm_buyer_flg (:global_bu) IN (''N'', ''S'')    OR (func_find_apm_buyer'
||'_flg (:global_bu) = ''B''        AND func_find_apm_buyer_flg (:global_bu) = ''Y''   AND EXISTS     (  SELECT 1    FROM pur_order_hd, buyers, appl_users   WHERE     poh_bu = buyer_bu AND poh_buyer_id = buyer_id AND buyer_bu = appluser_bu   AND buyer_emp_i'
||'d = appluser_emp_id  AND poh_status NOT IN (''C'', ''L'')   AND appluser_bu = :global_bu         AND appluser_id = :global_user  AND poh_suplr_id = suplr_suplr_id       GROUP BY appluser_id, poh_suplr_id)))      UNION ALL   SELECT suplr_suplr_id,  suplr_'
||'name1,  suplr_currency curr,  DECODE (suplr_suplr_id, NULL, NULL, ''Supplier'') TYPE,   DECODE (suplr_suplr_id, NULL, NULL, ''S'') party_type, ''S'' part, suplr_part_flag   FROM suppliers    WHERE     suplr_bu = :global_bu AND suplr_class NOT IN (''T'', ''E'','
||' ''V'', ''L'')    AND (suplr_part_flag = ''Y'')   AND :P116132066_PARTFLAG = ''Y''   AND (func_find_apm_buyer_flg (:global_bu) = ''N''      OR func_find_apm_buyer_flg (:global_bu) IN (''N'', ''S'')    OR (func_find_apm_buyer_flg (:global_bu) = ''B''  AND func_find_a'
||'pm_buyer_flg (:global_bu) = ''Y''  AND EXISTS',
'                               (  SELECT 1  FROM pur_order_hd, buyers, appl_users      WHERE     poh_bu = buyer_bu   AND poh_buyer_id = buyer_id   AND buyer_bu = appluser_bu   AND buyer_emp_id = appluser_emp_id   AND poh_status NOT IN (''C'', ''L'')    A'
||'ND appluser_bu = :global_bu AND appluser_id = :global_user        AND poh_suplr_id = suplr_suplr_id       GROUP BY appluser_id, poh_suplr_id))))      ORDER BY desc1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTY'
,p_display_column_name=>'PARTY'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316187802112674209)
,p_query_column_name=>'CURR'
,p_heading=>'Curr'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316187332672674209)
,p_query_column_name=>'DESC1'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316188987587674211)
,p_query_column_name=>'PART'
,p_heading=>'Part'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316186933425674209)
,p_query_column_name=>'PARTY'
,p_heading=>'Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316188547077674211)
,p_query_column_name=>'PARTY_TYPE'
,p_heading=>'Party Type'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316189376954674211)
,p_query_column_name=>'SUPLR_PART_FLAG'
,p_heading=>'Suplr Part Flag'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6316188164091674209)
,p_query_column_name=>'TYPE'
,p_heading=>'Party Type'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
