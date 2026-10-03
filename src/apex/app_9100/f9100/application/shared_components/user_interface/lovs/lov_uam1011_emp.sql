prompt --application/shared_components/user_interface/lovs/lov_uam1011_emp
begin
--   Manifest
--     LOV_UAM1011_EMP
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
 p_id=>wwv_flow_imp.id(6642738612743789385)
,p_lov_name=>'LOV_UAM1011_EMP'
,p_static_id=>'lov-uam1011-emp'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct  TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 )',
'       emp_name,',
'           appluser_emp_id',
'  from appl_users,',
'       wapl_bus_fun_access_view,',
'       wapl_bus_fun,',
'       employees',
'where appluser_id           = wbfav_user_id',
'    and appluser_bu         = wbfav_bu',
'    and wbfav_bus_fun_id = wbf_bus_fun_id',
'    and appluser_bu         = emp_bu',
'    and appluser_emp_id  = emp_emp_id',
'    and wbf_visible           = ''Y''',
'    and appluser_bu          =  :GLOBAL_bu',
'     and appluser_status     = ''A''',
'    and appluser_user_type <> ''O''',
'    and appluser_user_type NOT IN (''S'',''C'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users,',
'       wapl_bus_fun_access_view',
' WHERE appluser_bu  = wbfav_bu',
'   and appluser_id = wbfav_user_id',
'   and appluser_bu      = suplr_bu',
'   and suplr_bu         = :GLOBAL_bu',
'   AND suplr_party_type = ''S''',
'      AND appluser_suplr_id = suplr_suplr_id ',
'   AND appluser_status  = ''A''  ',
'   and appluser_user_type IN (''S'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users,',
'       wapl_bus_fun_access_view',
' WHERE appluser_bu  = wbfav_bu',
'   and appluser_id = wbfav_user_id',
'   and appluser_bu      = suplr_bu',
'   and suplr_bu         =  :GLOBAL_bu',
'   AND suplr_party_type = ''C''',
'      AND appluser_cust_id = suplr_suplr_id',
'   AND appluser_status  = ''A''   ',
'   and appluser_user_type IN (''C'')',
'ORDER BY 1 '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMP_NAME'
,p_display_column_name=>'EMP_NAME'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6642740625908794940)
,p_query_column_name=>'APPLUSER_EMP_ID'
,p_heading=>'Employee/Party ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6642740182710794931)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Employee/Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
