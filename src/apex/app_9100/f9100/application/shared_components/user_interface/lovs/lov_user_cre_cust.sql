prompt --application/shared_components/user_interface/lovs/lov_user_cre_cust
begin
--   Manifest
--     LOV_USER_CRE_CUST
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
 p_id=>wwv_flow_imp.id(7055314165922922685)
,p_lov_name=>'LOV_USER_CRE_CUST'
,p_static_id=>'lov-user-cre-cust'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       suplr_suplr_id,',
'       suplr_name1',
'  FROM suppliers',
' WHERE suplr_bu     = :GLOBAL_BU',
'   AND suplr_status = ''A''',
'   AND suplr_party_type =''C''',
'   AND ''C'' = :P21113001502_APPLUSER_USER_TYPE',
'   AND NOT EXISTS (SELECT *',
'                     FROM appl_users',
'                    WHERE appluser_bu = :GLOBAL_BU',
'                      AND appluser_id <> :P21113001502_APPLUSER_ID',
'                      AND appluser_cust_id = suplr_suplr_id)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SUPLR_SUPLR_ID'
,p_display_column_name=>'SUPLR_SUPLR_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7055314937878922688)
,p_query_column_name=>'SUPLR_NAME1'
,p_heading=>'Cust. Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7055314571723922687)
,p_query_column_name=>'SUPLR_SUPLR_ID'
,p_heading=>'Cust. ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
