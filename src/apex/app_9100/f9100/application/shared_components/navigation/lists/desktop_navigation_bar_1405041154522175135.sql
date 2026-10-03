prompt --application/shared_components/navigation/lists/desktop_navigation_bar_1405041154522175135
begin
--   Manifest
--     LIST: Desktop Navigation Bar-1405041154522175135
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
 p_id=>wwv_flow_imp.id(6887002990065786163)
,p_name=>'Desktop Navigation Bar-1405041154522175135'
,p_static_id=>'desktop-navigation-bar'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6887009748837819209)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6887010586564819209)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'&GLOBAL_EMP_NAME.'
,p_static_id=>'global-emp-name'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6887010149350819209)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6887009748837819209)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6887009388686819206)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp'
,p_list_item_link_target=>'f?p=800:9999'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
