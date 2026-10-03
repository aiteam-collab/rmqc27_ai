prompt --application/shared_components/user_interface/lovs/lov_hsn_code
begin
--   Manifest
--     LOV_HSN_CODE
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
 p_id=>wwv_flow_imp.id(11730784900042326332)
,p_lov_name=>'LOV_HSN_CODE'
,p_static_id=>'lov-hsn-code'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT GHC_HSN_CODE ,',
'             GHC_HSN_CODE_DESC,',
'             GHC_HSN_CODE_TYPE,',
'             DECODE(GHC_HSN_CODE_TYPE,''H'',''HSN'',''S'',''SAC'') CODE_TYPE',
'       from GST_HSN_CODES;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'GHC_HSN_CODE'
,p_display_column_name=>'GHC_HSN_CODE'
,p_default_sort_column_name=>'GHC_HSN_CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
