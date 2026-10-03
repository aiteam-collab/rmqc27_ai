prompt --application/shared_components/user_interface/lovs/lov_cust_id_cfg0211
begin
--   Manifest
--     LOV CUST_ID  - CFG0211
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
 p_id=>wwv_flow_imp.id(6322732251177235820)
,p_lov_name=>'LOV CUST_ID  - CFG0211'
,p_static_id=>'lov-cust-id-cfg'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  CUST_NAME1,',
'CUST_CUST_ID',
'from customers ',
'where cust_bu=:global_bu',
'and cust_status=''A''',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CUST_CUST_ID'
,p_display_column_name=>'CUST_CUST_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6322748125174242232)
,p_query_column_name=>'CUST_CUST_ID'
,p_heading=>'Customers'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6322748480669242234)
,p_query_column_name=>'CUST_NAME1'
,p_heading=>'Customer Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
