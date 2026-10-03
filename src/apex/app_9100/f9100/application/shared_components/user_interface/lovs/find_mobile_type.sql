prompt --application/shared_components/user_interface/lovs/find_mobile_type
begin
--   Manifest
--     FIND_MOBILE_TYPE
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
 p_id=>wwv_flow_imp.id(6999724949327875392)
,p_lov_name=>'FIND_MOBILE_TYPE'
,p_static_id=>'find-mobile-type'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT maahd_doc_no,',
'       DECODE (maahd_type, ''A'', ''Add Bus. Fun.'', ''R'', ''Remove Bus. Fun.'') AS maahd_type',
'  FROM mobile_app_access_hd',
' WHERE maahd_bu = :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'MAAHD_DOC_NO'
,p_display_column_name=>'MAAHD_DOC_NO'
,p_default_sort_column_name=>'MAAHD_DOC_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23879239739'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6999729604127883194)
,p_query_column_name=>'MAAHD_DOC_NO'
,p_heading=>'Doc. No.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6999730045522883195)
,p_query_column_name=>'MAAHD_TYPE'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
