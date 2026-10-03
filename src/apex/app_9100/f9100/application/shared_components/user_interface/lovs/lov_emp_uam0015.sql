prompt --application/shared_components/user_interface/lovs/lov_emp_uam0015
begin
--   Manifest
--     LOV_EMP_UAM0015
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
 p_id=>wwv_flow_imp.id(8132640806818400540)
,p_lov_name=>'LOV_EMP_UAM0015'
,p_static_id=>'lov-emp-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select distinct trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)  emp_name,',
'       appluser_emp_id',
'  from appl_users,',
'       employees',
' where appluser_bu     = emp_bu',
'   and appluser_emp_id = emp_emp_id',
'   and appluser_bu     = :Global_bu',
'   and appluser_user_type NOT IN (''S'',''C'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users',
' WHERE appluser_bu      = suplr_bu',
'   AND suplr_bu         = :Global_bu',
'   AND suplr_party_type = ''S''',
'   AND suplr_suplr_id   = appluser_suplr_id',
'   AND appluser_user_type IN (''S'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1 ,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users',
' WHERE appluser_bu      = suplr_bu',
'   AND suplr_bu         = :Global_bu',
'   AND suplr_party_type = ''C''',
'   AND suplr_suplr_id   = appluser_cust_id',
'   AND appluser_user_type IN (''C'')'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_NAME'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8132643808218405829)
,p_query_column_name=>'APPLUSER_EMP_ID'
,p_heading=>'Employee/Party ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8132643430897405823)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Employee/Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
