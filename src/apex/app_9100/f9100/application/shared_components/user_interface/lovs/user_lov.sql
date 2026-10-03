prompt --application/shared_components/user_interface/lovs/user_lov
begin
--   Manifest
--     USER_LOV
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
 p_id=>wwv_flow_imp.id(7055171429113893409)
,p_lov_name=>'USER_LOV'
,p_static_id=>'user-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  DISTINCT appluser_id,',
'        DECODE(appluser_user_type,''R'',''Admin User'',''E'',''Functional User'',''O'',''Role Based User'',''U'',''ESS User'',''S'',''Supplier'',',
'        ''C'',''Customer'',''P'',''POS User'',''M'',''Mobile User'',''L'',''Limited Access User'') appluser_user_type',
'  from appl_users where appluser_bu =:global_bu',
'ORDER BY appluser_id',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'APPLUSER_ID'
,p_display_column_name=>'APPLUSER_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7055171797879893412)
,p_query_column_name=>'APPLUSER_ID'
,p_heading=>'User ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7055172193509893417)
,p_query_column_name=>'APPLUSER_USER_TYPE'
,p_heading=>'User Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
