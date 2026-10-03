prompt --application/shared_components/user_interface/lovs/user_access_loc
begin
--   Manifest
--     USER_ACCESS_LOC
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
 p_id=>wwv_flow_imp.id(5652809955012956610)
,p_lov_name=>'USER_ACCESS_LOC'
,p_static_id=>'user-access-loc'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WUPAL_PLNT_ID',
'  FROM WAPL_USER_PLNT_ACCESS_LN',
'where WUPAL_BU = :P83_WUPAH_BU',
'  and WUPAL_DOC_NO = :P83_WUPAH_DOC_NO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WUPAL_PLNT_ID'
,p_display_column_name=>'WUPAL_PLNT_ID'
,p_default_sort_column_name=>'WUPAL_PLNT_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'17701909718'
);
wwv_flow_imp.component_end;
end;
/
