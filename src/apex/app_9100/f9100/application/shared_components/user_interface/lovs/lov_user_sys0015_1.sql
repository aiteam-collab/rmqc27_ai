prompt --application/shared_components/user_interface/lovs/lov_user_sys0015_1
begin
--   Manifest
--     LOV_USER(SYS0015)1
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
 p_id=>wwv_flow_imp.id(7117306754661688765)
,p_lov_name=>'LOV_USER(SYS0015)1'
,p_static_id=>'lov-user-sys-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_id "User",',
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
,p_display_column_name=>'User'
,p_default_sort_column_name=>'User'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'17925024465'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117307948365688767)
,p_query_column_name=>'Name'
,p_heading=>'Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117307541280688765)
,p_query_column_name=>'Type'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117307213706688765)
,p_query_column_name=>'User'
,p_heading=>'User'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
