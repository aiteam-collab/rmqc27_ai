prompt --application/shared_components/user_interface/lovs/lov_sys0015_emp
begin
--   Manifest
--     LOV_SYS0015_EMP
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
 p_id=>wwv_flow_imp.id(5679815972353075042)
,p_lov_name=>'LOV_SYS0015_EMP'
,p_static_id=>'lov-sys0015-emp'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_id || appluser_emp_id "User",',
'       appluser_id,',
'       DECODE (',
'          appluser_user_type,',
'          ''E'', ''Employee'',',
'          ''O'', ''Employee'',          ',
'          ''S'', ''Supplier'',',
'          ''C'', ''Customer''',
'       ) "Type",',
'       DECODE (',
'          appluser_user_type,',
'          ''E'', func_find_employee_desc (',
'                  :GLOBAL_bu,',
'                  appluser_emp_id,',
'                  1',
'               ),',
'          ''O'', func_find_employee_desc (',
'                  :GLOBAL_bu,',
'                  appluser_emp_id,',
'                  1',
'               ),               ',
'          ''S'', func_find_party_name (',
'                  :GLOBAL_bu,',
'                  appluser_suplr_id,',
'                  1',
'               ),',
'          ''C'', (SELECT suplr_name1',
'                  FROM Suppliers',
'                 WHERE     suplr_name1 = :GLOBAL_bu',
'                       AND suplr_suplr_id = appluser_cust_id',
'                       AND suplr_status = ''A''',
'                       AND suplr_party_type = ''C''))',
'          "Name"',
'  FROM appl_users',
' WHERE appluser_bu = :GLOBAL_bu AND appluser_status = ''A'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'User'
,p_display_column_name=>'APPLUSER_ID'
,p_default_sort_column_name=>'User'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'17948644858'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5680389783497317345)
,p_query_column_name=>'APPLUSER_ID'
,p_heading=>'User'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5679817130614075043)
,p_query_column_name=>'Name'
,p_heading=>'Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5679816707937075043)
,p_query_column_name=>'Type'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5679816284347075042)
,p_query_column_name=>'User'
,p_heading=>'User'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
