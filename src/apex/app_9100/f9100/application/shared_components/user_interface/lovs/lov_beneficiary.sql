prompt --application/shared_components/user_interface/lovs/lov_beneficiary
begin
--   Manifest
--     LOV_BENEFICIARY
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
 p_id=>wwv_flow_imp.id(6594672398723504901)
,p_lov_name=>'LOV_BENEFICIARY'
,p_static_id=>'lov-beneficiary'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'       emp_name,',
'       appluser_emp_id',
'  FROM appl_users,',
'       wapl_user_bus_fun_accs,',
'       wapl_bus_fun,',
'       employees',
'WHERE appluser_id      = wubfa_user_id',
'  AND wubfa_bus_fun_id = wbf_bus_fun_id',
'  AND emp_bu           = appluser_bu',
'  AND emp_emp_id       = appluser_emp_id',
'  AND wbf_visible      = ''Y''',
'  AND appluser_bu      = :GLOBAL_bu',
'  AND appluser_status  = ''A''',
'  AND appluser_user_type NOT IN (''O'',''S'',''C'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       wapl_user_bus_fun_accs,',
'       appl_users,',
'       wapl_bus_fun',
' WHERE appluser_id      = wubfa_user_id',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND appluser_bu      = suplr_bu',
'   AND wbf_visible      = ''Y''',
'   AND suplr_bu         = :GLOBAL_bu',
'   AND suplr_party_type = ''S''',
'   AND suplr_suplr_id   = appluser_suplr_id',
'   AND appluser_status  = ''A''',
'   and appluser_user_type IN (''S'')       ',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       wapl_user_bus_fun_accs,',
'       appl_users,',
'       wapl_bus_fun',
' WHERE appluser_id      = wubfa_user_id',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND appluser_bu      = suplr_bu',
'   AND wbf_visible      = ''Y''',
'   AND suplr_bu         = :GLOBAL_bu',
'   AND suplr_party_type = ''C''',
'   AND suplr_suplr_id   = appluser_cust_id',
'   AND appluser_status  = ''A''     ',
'   and appluser_user_type IN (''C'')       ',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_NAME'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6594675387925518809)
,p_query_column_name=>'APPLUSER_EMP_ID'
,p_heading=>'Emp./Party ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6594675747361518813)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Emp./Party Name'
,p_display_sequence=>5
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
