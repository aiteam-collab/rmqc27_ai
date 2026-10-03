prompt --application/shared_components/user_interface/lovs/wfm0600t_lov
begin
--   Manifest
--     WFM0600T LOV
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
 p_id=>wwv_flow_imp.id(7600592457177798779)
,p_lov_name=>'WFM0600T LOV'
,p_static_id=>'wfm0600t-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   ',
'select DECODE (',
'                WAUL_BENF_TYPE,',
'                ''S'', ''Supplier'', ''C'', ''Customer'', ''E'', ''Employee'')',
'                AS BENF_TYPE1,WAUL_BENF_TYPE, WAUL_BENF_ID, WAUL_BENF_NAME, WAUL_COUNTRY_CODE, WAUL_WA_MOB_NO, WAUL_USERID  from whatsapp_api_user_list',
'where WAUL_BU = :GLOBAL_bu',
'    and WAUL_ACT_STATUS = ''A'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WAUL_BENF_ID'
,p_display_column_name=>'WAUL_BENF_ID'
,p_default_sort_column_name=>'WAUL_BENF_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600669357888870718)
,p_query_column_name=>'BENF_TYPE1'
,p_heading=>'Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600611197532833548)
,p_query_column_name=>'WAUL_BENF_ID'
,p_heading=>'ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600611605059833548)
,p_query_column_name=>'WAUL_BENF_NAME'
,p_heading=>'Beneficiary Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600610811511833548)
,p_query_column_name=>'WAUL_BENF_TYPE'
,p_heading=>'Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600611986325833548)
,p_query_column_name=>'WAUL_COUNTRY_CODE'
,p_heading=>'Country Code'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600612802814833549)
,p_query_column_name=>'WAUL_USERID'
,p_heading=>'User ID'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7600612404895833549)
,p_query_column_name=>'WAUL_WA_MOB_NO'
,p_heading=>'Mobile Number'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
