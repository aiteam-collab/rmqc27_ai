prompt --application/shared_components/user_interface/lovs/find_ess_doc_no
begin
--   Manifest
--     FIND_ESS_DOC_NO
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
 p_id=>wwv_flow_imp.id(5977728532532712770)
,p_lov_name=>'FIND_ESS_DOC_NO'
,p_static_id=>'find-ess-doc-no'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ebfah_doc_no,',
'    decode(ebfah_type, ''A'', ''Add Bus. Fun.'', ''R'', ''Remove Bus. Fun.'') ebfah_type',
'FROM',
'    ess_bu_fun_access_hd',
'WHERE',
'    ebfah_bu = :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'EBFAH_DOC_NO'
,p_display_column_name=>'EBFAH_DOC_NO'
,p_default_sort_column_name=>'EBFAH_DOC_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22445783013'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977735649852731914)
,p_query_column_name=>'EBFAH_DOC_NO'
,p_heading=>'Doc. No.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5977735258798731914)
,p_query_column_name=>'EBFAH_TYPE'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
