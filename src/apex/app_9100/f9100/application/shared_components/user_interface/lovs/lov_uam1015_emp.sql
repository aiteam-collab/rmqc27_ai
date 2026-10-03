prompt --application/shared_components/user_interface/lovs/lov_uam1015_emp
begin
--   Manifest
--     LOV_UAM1015_EMP
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
 p_id=>wwv_flow_imp.id(6648848002609511398)
,p_lov_name=>'LOV_UAM1015_EMP'
,p_static_id=>'lov-uam1015-emp'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct  trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'       emp_name,',
'       appluser_emp_id',
'  from appl_users,',
'       appl_user_plant_access,',
'       employees',
' where appluser_bu  = auba_bu',
'   and appluser_id = auba_user_id',
'   and appluser_bu = emp_bu',
'   and appluser_emp_id = emp_emp_id',
'   and appluser_bu =:GLOBAL_bu',
'   and appluser_status = ''A''',
'   and appluser_user_type NOT IN (''O'',''S'',''C'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users,',
'       appl_user_plant_access',
' WHERE appluser_bu  = auba_bu',
'   and appluser_id = auba_user_id',
'   and appluser_bu      = suplr_bu',
'   and suplr_bu         = :Global_bu',
'   AND suplr_party_type = ''S''',
'   AND suplr_suplr_id   = appluser_suplr_id',
'   AND appluser_status  = ''A''  ',
'   and appluser_user_type IN (''S'')',
'UNION ALL',
'SELECT DISTINCT suplr_name1,',
'       suplr_suplr_id',
'  FROM suppliers,',
'       appl_users,',
'       appl_user_plant_access',
' WHERE appluser_bu  = auba_bu',
'   and appluser_id = auba_user_id',
'   and appluser_bu      = suplr_bu',
'   and suplr_bu         = :Global_bu',
'   AND suplr_party_type = ''C''',
'   AND suplr_suplr_id   = appluser_cust_id',
'   AND appluser_status  = ''A''   ',
'   and appluser_user_type IN (''C'')',
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
 p_id=>wwv_flow_imp.id(6648851576336517956)
,p_query_column_name=>'APPLUSER_EMP_ID'
,p_heading=>'Employee/Party ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6648851206508517948)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Employee/Party Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
