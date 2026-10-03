prompt --application/shared_components/navigation/lists/list_view
begin
--   Manifest
--     LIST: List View
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(6257542401099257404)
,p_name=>'List View'
,p_static_id=>'list-view'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6257542548285257404)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6257542981257257407)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tab View'
,p_static_id=>'tab-view'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
