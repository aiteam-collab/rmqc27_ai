prompt --application/shared_components/user_interface/lovs/lov_copy_user_uam1010
begin
--   Manifest
--     LOV_COPY_USER(UAM1010)
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
 p_id=>wwv_flow_imp.id(7562455214123045354)
,p_lov_name=>'LOV_COPY_USER(UAM1010)'
,p_static_id=>'lov-copy-user-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       ',
'SELECT APPLUSER_ID "User",DECODE(APPLUSER_USER_TYPE,''E'',''Employee'',''S'',''Supplier'',''C'',''Customer'',''R'',''ADMIN'') "Type" ,',
'DECODE(APPLUSER_USER_TYPE,''E'',FUNC_FIND_EMPLOYEE_DESC(:global_BU,APPLUSER_EMP_ID,1),''R'',FUNC_FIND_EMPLOYEE_DESC(:global_BU,APPLUSER_EMP_ID,1),',
'''S'',func_find_suplr_desc(:global_BU,appluser_suplr_id,1),''C'',',
'func_find_cust_desc(:global_BU,appluser_cust_id,1)) "Name"',
'FROM APPL_USERS',
'WHERE APPLUSER_BU = :global_BU',
'   AND APPLUSER_STATUS = ''A''',
'   AND appluser_user_type IN (''E'',''S'',''C'',''R'')',
'   and APPLUSER_ID in (',
'      SELECT distinct UPA_USER_ID',
'        FROM user_prefix_access',
'       WHERE upa_bu = :global_bu)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'User'
,p_display_column_name=>'User'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562456366241045356)
,p_query_column_name=>'Name'
,p_heading=>'Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562456013215045356)
,p_query_column_name=>'Type'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562455555098045356)
,p_query_column_name=>'User'
,p_heading=>'User'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
