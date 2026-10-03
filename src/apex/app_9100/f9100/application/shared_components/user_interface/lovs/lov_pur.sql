prompt --application/shared_components/user_interface/lovs/lov_pur
begin
--   Manifest
--     LOV_PUR
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
 p_id=>wwv_flow_imp.id(7704060110883732507)
,p_lov_name=>'LOV_PUR'
,p_static_id=>'lov-pur'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT glac_acct_desc1,',
'         glac_acct,',
'         DECODE (',
'            (CASE',
'                WHEN glac_sub_grp_type IN (''SAP'', ''SAC'', ''SAD'')',
'                THEN',
'                   ''S''',
'                WHEN glac_sub_grp_type IN',
'                        (''CAR'', ''CAD'', ''CPBG'', ''CRET'', ''CSD'', ''CEMD'')',
'                THEN',
'                   ''C''',
'                ELSE',
'                   ''O''',
'             END),',
'            ''S'', ''Suppliers'',',
'            ''C'', ''Customers'',',
'            ''O'', ''Others'')',
'            ledger_type,',
'         (CASE',
'             WHEN glac_sub_grp_type IN (''SAP'', ''SAC'', ''SAD'')',
'             THEN',
'                ''S''',
'             WHEN glac_sub_grp_type IN',
'                     (''CAR'', ''CAD'', ''CPBG'', ''CRET'', ''CSD'', ''CEMD'')',
'             THEN',
'                ''C''',
'             ELSE',
'                ''O''',
'          END)',
'            ledger_type_value,',
'         glac_suplr_id,',
'         glac_cust_id,',
'         DECODE (glac_sub_grp_type,',
'                 ''CAP'', ''Capital account'',',
'                 ''LNL'', ''Loans (Liability)'',',
'                 ''CUL'', ''Current liabilities'',',
'                 ''IVS'', ''Investments'',',
'                 ''CAS'', ''Current assets'',',
'                 ''BRH'', ''Branch/Divisions'',',
'                 ''MXA'', ''Misc. Expenses (asset)'',',
'                 ''SPA'', ''Suspense A/c'',',
'                 ''DI'', ''Direct Incomes'',',
'                 ''DE'', ''Direct Expenses'',',
'                 ''II'', ''Indirect Incomes'',',
'                 ''IE'', ''Indirect Expenses'',',
'                 ''BOD'', ''Bank OD A/c'',',
'                 ''SL'', ''Secured Loans'',',
'                 ''UL'', ''Unsecured Loans'',',
'                 ''PRV'', ''Provisions'',',
'                 ''DPS'', ''Deposits (assets)'',',
'                 ''LAS'', ''Loans & Advances (Assets)'',',
'                 ''SAP'', ''Sundry Creditors'',',
'                 ''SAD'', ''Supplier(ADV)'',',
'                 ''SAC'', ''Supplier(ACC)'',',
'                 ''SSD'', ''Supplier(SD)'',',
'                 ''CAR'', ''Sundry Debtors'',',
'                 ''CAD'', ''Customer(ADV)'',',
'                 ''CPBG'', ''Customer(PBG)'',',
'                 ''CSD'', ''Customer(SD)'',',
'                 ''CRET'', ''Customer(RETN)'',',
'                 ''CEMD'', ''Customer(EMD)'',',
'                 ''BANK'', ''Bank'',',
'                 ''CASH'', ''Cash'',',
'                 ''TDS'', ''TDS'',',
'                 ''ESI'', ''ESI'',',
'                 ''SVT'', ''Tax'',',
'                 ''TCS'', ''TCS'',',
'                 ''IMP'', ''Imprest'',',
'                 ''STK'', ''Inventory'',',
'                 ''OS'', ''Opening Stock'',',
'                 ''P'', ''Purchase Accounts'',',
'                 ''S'', ''Sales Accounts'',',
'                 ''RE'', ''Reserves & Surplus/Rtnd Erng'',',
'                 ''FA'', ''Fixed Asset'',',
'                 ''AD'', ''Accumulated  Depreciation'',',
'                 ''DEP'', ''Depreciation'',',
'                 ''DNT'', ''Duties and Taxes'',',
'                 ''OTHR'', ''Others'',',
'                 ''CWP'', ''Capital WIP'',',
'                 ''RCWP'', ''Capital WIP - RND'',',
'                 ''PCK'', ''Packing Credit'',',
'                 ''BDS'', ''Bills Discounting'',',
'                 ''DD'', ''Duty Drawback'',',
'                 ''EC'', ''Emp. Curr. Acct.'',',
'                 ''INEX'', ''Interest Expenses'',',
'                 ''OPB'', ''Opening TB'')',
'            AS glac_sub_grp_type',
'    FROM gl_accts',
'   WHERE glac_bu = :GLOBAL_bu AND glac_acct_status = ''A''',
'         AND glac_sub_grp_type NOT IN (''BANK'', ''BKI'', ''BKR'',''IMP'',''SAP'',''SAD'',''SAC'',''SSD'',''CAR'',''CAD'',''CPBG'',''CSD'',''CRET'',''CEMD'',''TDS'',',
'                                                        ''CASH'',''ESI'',''PF'',''SVT'',''TCS'',''STLA'',''LTLA'',''STLL'',''LTLL'',''LAS'',''BOD'')',
'ORDER BY glac_acct_desc1 ASC'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'GLAC_ACCT'
,p_display_column_name=>'GLAC_ACCT_DESC1'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7704060580461736593)
,p_query_column_name=>'GLAC_ACCT'
,p_heading=>'Account'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7704061016969736593)
,p_query_column_name=>'GLAC_ACCT_DESC1'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7704061354598736593)
,p_query_column_name=>'GLAC_SUB_GRP_TYPE'
,p_heading=>'Sub Group Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
