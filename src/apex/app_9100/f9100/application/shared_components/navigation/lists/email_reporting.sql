prompt --application/shared_components/navigation/lists/email_reporting
begin
--   Manifest
--     LIST: Email Reporting
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
 p_id=>wwv_flow_imp.id(6320474590314699787)
,p_name=>'Email Reporting'
,p_static_id=>'email-reporting'
,p_required_patch=>wwv_flow_imp.id(6320463437561699696)
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6320474984451699792)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Email Reporting'
,p_static_id=>'email-reporting'
,p_list_item_link_target=>'f?p=&APP_ID.:236131010010:&SESSION.::&DEBUG.:236131010010:::'
,p_list_item_icon=>'fa-area-chart'
,p_list_text_01=>'Report of all email queued to be sent and those already sent'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
