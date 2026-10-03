prompt --application/shared_components/user_interface/lovs/198_sub_vou_type
begin
--   Manifest
--     198_SUB_VOU_TYPE
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
 p_id=>wwv_flow_imp.id(7274185617128338762)
,p_lov_name=>'198_SUB_VOU_TYPE'
,p_static_id=>'198-sub-vou-type'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT ABVR_TYPE,',
'DECODE(ABVR_TYPE,''N'',''Standard'',''DM'',''Domestic'',''EX'',''Export'')ABVR_TYPE_DESC',
' FROM APPL_SUB_VOU_RPTS WHERE ABVR_TYPE IN (''N'',''DM'',''EX'');'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ABVR_TYPE'
,p_display_column_name=>'ABVR_TYPE_DESC'
,p_default_sort_column_name=>'ABVR_TYPE_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'24893161445'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7274187976219345045)
,p_query_column_name=>'ABVR_TYPE'
,p_heading=>'Sub Vou. Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7274187513850345044)
,p_query_column_name=>'ABVR_TYPE_DESC'
,p_heading=>'Sub Vou. Type Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
