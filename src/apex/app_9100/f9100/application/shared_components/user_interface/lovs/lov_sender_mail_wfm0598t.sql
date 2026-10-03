prompt --application/shared_components/user_interface/lovs/lov_sender_mail_wfm0598t
begin
--   Manifest
--     LOV_SENDER_MAIL (WFM0598T)
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
 p_id=>wwv_flow_imp.id(7612224307017247517)
,p_lov_name=>'LOV_SENDER_MAIL (WFM0598T)'
,p_static_id=>'lov-sender-mail-wfm0598t'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ',
'       (SELECT DECODE(dept_name1,2,NVL(dept_name2,dept_name1))',
'          FROM departments',
'         WHERE dept_bu = uma_bu',
'           AND dept_id = uma_department )dept_desc,',
'           uma_user_name',
'      -- uma_host,',
'     --  uma_port',
'  FROM user_mail_access',
' WHERE uma_bu = :GLOBAL_bu ',
'   AND uma_status = ''A''',
'   AND uma_user = :GLOBAL_user'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'UMA_USER_NAME'
,p_display_column_name=>'UMA_USER_NAME'
,p_default_sort_column_name=>'UMA_USER_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23519604655'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7612226821408262218)
,p_query_column_name=>'DEPT_DESC'
,p_heading=>'Department'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7612227234408262223)
,p_query_column_name=>'UMA_USER_NAME'
,p_heading=>'Sender'
,p_display_sequence=>5
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
