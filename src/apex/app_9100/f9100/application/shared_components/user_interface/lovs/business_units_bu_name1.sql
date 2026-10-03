prompt --application/shared_components/user_interface/lovs/business_units_bu_name1
begin
--   Manifest
--     BUSINESS_UNITS.BU_NAME1
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
 p_id=>wwv_flow_imp.id(5619361424855999409)
,p_lov_name=>'BUSINESS_UNITS.BU_NAME1'
,p_static_id=>'business-units-bu-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'BUSINESS_UNITS'
,p_return_column_name=>'BU_ID'
,p_display_column_name=>'BU_NAME1'
,p_default_sort_column_name=>'BU_NAME1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
