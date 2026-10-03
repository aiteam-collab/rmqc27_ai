prompt --application/shared_components/user_interface/lovs/lov_vertical_id
begin
--   Manifest
--     LOV_VERTICAL_ID
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
 p_id=>wwv_flow_imp.id(6455528706872775548)
,p_lov_name=>'LOV_VERTICAL_ID'
,p_static_id=>'lov-vertical-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EV_VERTICAL_DESC,',
'       EV_VERTICAL_ID',
'    FROM  ERP_VERTICAL',
'   WHERE :P86_WBF_STD_VERT_TYPE = ''V'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'EV_VERTICAL_ID'
,p_display_column_name=>'EV_VERTICAL_DESC'
,p_version_scn=>'23253237602'
);
wwv_flow_imp.component_end;
end;
/
