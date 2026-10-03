prompt --application/shared_components/user_interface/lovs/lov_wf_pfx
begin
--   Manifest
--     LOV_WF_PFX
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
 p_id=>wwv_flow_imp.id(6617141975092745085)
,p_lov_name=>'LOV_WF_PFX'
,p_static_id=>'lov-wf-pfx'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT adp_desc1,adp_pfx',
'  FROM appl_doc_prefixes',
' WHERE adp_bu = :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ADP_PFX'
,p_display_column_name=>'ADP_DESC1'
,p_default_sort_column_name=>'ADP_DESC1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6617152823598750259)
,p_query_column_name=>'ADP_DESC1'
,p_heading=>'Pfx. Desc'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6617152339394750257)
,p_query_column_name=>'ADP_PFX'
,p_heading=>'Pfx.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
