prompt --application/shared_components/user_interface/lovs/send_email_su
begin
--   Manifest
--     SEND_EMAIL_SU
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
 p_id=>wwv_flow_imp.id(7007052656893899735)
,p_lov_name=>'SEND_EMAIL_SU'
,p_static_id=>'send-email-su'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT func_find_dept_qry_desc(uma_bu,uma_department,1) dept_desc,',
'       uma_user_name,uma_host,uma_port',
'  FROM user_mail_access',
' WHERE uma_bu     = :GLOBAL_bu ',
'   AND uma_status = ''A''',
'   AND uma_user   = :GLOBAL_user'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'UMA_USER_NAME'
,p_display_column_name=>'UMA_USER_NAME'
,p_default_sort_column_name=>'UMA_USER_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7007065188577917993)
,p_query_column_name=>'DEPT_DESC'
,p_heading=>'Department'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7007065952023917995)
,p_query_column_name=>'UMA_HOST'
,p_heading=>'Host Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7007066373176917996)
,p_query_column_name=>'UMA_PORT'
,p_heading=>'Port'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7007065552007917995)
,p_query_column_name=>'UMA_USER_NAME'
,p_heading=>'Sender'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
