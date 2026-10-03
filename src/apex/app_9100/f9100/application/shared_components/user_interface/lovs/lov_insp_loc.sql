prompt --application/shared_components/user_interface/lovs/lov_insp_loc
begin
--   Manifest
--     LOV_INSP_LOC
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
 p_id=>wwv_flow_imp.id(11145019115696354645)
,p_lov_name=>'LOV_INSP_LOC'
,p_static_id=>'lov-insp-loc'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Inside'' d,',
'       ''I'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Outside'' d,',
'       ''O'' r',
'  FROM dual'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
