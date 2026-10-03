prompt --application/shared_components/user_interface/lovs/sub_type_desc
begin
--   Manifest
--     SUB_TYPE_DESC
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
 p_id=>wwv_flow_imp.id(7273524411237648869)
,p_lov_name=>'SUB_TYPE_DESC'
,p_static_id=>'sub-type-desc'
,p_lov_query=>'SELECT DISTINCT APST_SUB_TYPE, APST_SUB_TYPE_DESC FROM APPL_VOU_SUB_TYPES;'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'APST_SUB_TYPE'
,p_display_column_name=>'APST_SUB_TYPE_DESC'
,p_default_sort_column_name=>'APST_SUB_TYPE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'24891572607'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7273532669608667425)
,p_query_column_name=>'APST_SUB_TYPE'
,p_heading=>'Sub Type'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7273532365397667425)
,p_query_column_name=>'APST_SUB_TYPE_DESC'
,p_heading=>'Sub Type Desc.'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
