prompt --application/shared_components/user_interface/lovs/lov_mobile_user
begin
--   Manifest
--     LOV_MOBILE_USER
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
 p_id=>wwv_flow_imp.id(6993569932100168267)
,p_lov_name=>'LOV_MOBILE_USER'
,p_static_id=>'lov-mobile-user'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id AS User_ID , ',
'       DECODE(appluser_user_type,''R'',''Admin'',',
'                                 ''E'',''Functional'',',
'                                 ''U'',''ESS Portal'',',
'                                 ''P'',''POS User'',',
'                                 ''C'',''Customer Portal'',',
'                                 ''S'',''Supplier Portal'',',
'                                 ''O'',''Role Based User'',',
'                                 ''M'',''Mobile App'',',
'                                 ''L'',''Limited Access User'',',
'                                 ''T'',''Subcontract Portal'',',
'                                 ''D'',''Module Specific'',',
'                                 ''G'',''Management'') appluser_user_type,',
'       appluser_emp_id AS Employee_ID,',
'       (SELECT DISTINCT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'         FROM employees',
'        WHERE appluser_bu     = emp_bu',
'          AND appluser_emp_id = emp_emp_id',
'          AND appluser_user_type NOT IN (''S'',''C'')',
'        UNION ALL',
'       SELECT DISTINCT suplr_name1',
'         FROM suppliers',
'        WHERE appluser_bu      = suplr_bu',
'          AND suplr_party_type IN (''S'')',
'          AND suplr_suplr_id   = appluser_suplr_id',
'          AND appluser_user_type IN (''S'',''T'')',
'        UNION ALL',
'       SELECT DISTINCT suplr_name1',
'         FROM suppliers',
'        WHERE appluser_bu      = suplr_bu',
'          AND suplr_party_type = ''C''',
'          AND suplr_suplr_id   = appluser_cust_id',
'          AND appluser_user_type IN (''C'') ',
'	   )  emp_name',
'  FROM appl_users,',
'       mobile_app_access_hd',
' WHERE appluser_bu = :GLOBAL_BU ',
'   AND appluser_bu = maahd_bu',
'   AND appluser_id = maahd_user_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'USER_ID'
,p_display_column_name=>'USER_ID'
,p_default_sort_column_name=>'USER_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23957360605'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7060892802689908187)
,p_query_column_name=>'APPLUSER_USER_TYPE'
,p_heading=>'User Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6993570965286173480)
,p_query_column_name=>'EMPLOYEE_ID'
,p_heading=>'Emp. ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7060893237728908187)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Emp. Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6993570511920173480)
,p_query_column_name=>'USER_ID'
,p_heading=>'Username'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
