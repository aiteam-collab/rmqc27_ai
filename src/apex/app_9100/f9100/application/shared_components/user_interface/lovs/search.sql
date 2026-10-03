prompt --application/shared_components/user_interface/lovs/search
begin
--   Manifest
--     SEARCH
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
 p_id=>wwv_flow_imp.id(6328010520837971239)
,p_lov_name=>'SEARCH'
,p_static_id=>'search'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT UPPER(Wbf_bus_fun_name) title,',
'                wbf_page_no,wbf_seq_no',
' FROM wapl_bus_fun, wapl_user_bus_fun_accs',
'WHERE wbf_visible = ''Y'' AND WBF_ACTIVE_FLAG =''Y''',
'AND WUBFA_BU = :global_bu',
'AND wbf_bus_fun_id <> ''FAVOR''',
'AND wbf_bus_fun_id = wubfa_bus_fun_id',
'AND (TRUNC (SYSDATE) BETWEEN wubfa_date_from AND wubfa_date_to)',
'AND wubfa_user_id = :global_user',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TITLE'
,p_display_column_name=>'TITLE'
,p_default_sort_column_name=>'TITLE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22252240638'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7609370152056392146)
,p_query_column_name=>'TITLE'
,p_heading=>'Bus. Fun. Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7609369784499392145)
,p_query_column_name=>'WBF_PAGE_NO'
,p_heading=>'Page ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
