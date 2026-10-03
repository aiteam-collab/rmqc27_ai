prompt --application/shared_components/reports/report_queries/test
begin
--   Manifest
--     REPORT QUERY: test
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_shared_query(
 p_id=>wwv_flow_imp.id(6268218934026656546)
,p_name=>'test'
,p_static_id=>'TEST_786257098483045518'
,p_include_session_state=>'N'
,p_format=>'PDF'
,p_output_file_name=>'test'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_shared.create_shared_query_stmnt(
 p_id=>wwv_flow_imp.id(6268220482291661821)
,p_shared_query_id=>wwv_flow_imp.id(6268218934026656546)
,p_name=>'test1'
,p_display_sequence=>1
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_sql_statement=>'SELECT cust_cust_id FROM CUSTOMERS WHERE cust_bu=:global_bu '
);
wwv_flow_imp.component_end;
end;
/
