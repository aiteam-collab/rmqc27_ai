prompt --application/shared_components/user_interface/lovs/pom1020_lov_suplr
begin
--   Manifest
--     POM1020_LOV_SUPLR
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
 p_id=>wwv_flow_imp.id(7700598229008485823)
,p_lov_name=>'POM1020_LOV_SUPLR'
,p_static_id=>'pom1020-lov-suplr'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select suplr_suplr_id ,decode((select applctrl_desc_level from appl_control',
'where applctrl_bu = :global_bu),1,suplr_name1,suplr_name2) Discription',
'from suppliers where ',
'suplr_bu = :global_bu',
'AND suplr_black_list_flg = ''N''',
'order by',
'decode((select applctrl_desc_level from appl_control',
'where applctrl_bu = :global_bu),1,suplr_name1,suplr_name2)',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SUPLR_SUPLR_ID'
,p_display_column_name=>'SUPLR_SUPLR_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700598945151485824)
,p_query_column_name=>'DISCRIPTION'
,p_heading=>'Supplier Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7700598541279485823)
,p_query_column_name=>'SUPLR_SUPLR_ID'
,p_heading=>'Supplier'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
