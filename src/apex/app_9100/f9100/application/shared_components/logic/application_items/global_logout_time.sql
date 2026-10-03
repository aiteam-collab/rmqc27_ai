prompt --application/shared_components/logic/application_items/global_logout_time
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_LOGOUT_TIME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(5547041125339634535)
,p_name=>'GLOBAL_LOGOUT_TIME'
,p_protection_level=>'N'
,p_version_scn=>'17807715065'
);
wwv_flow_imp.component_end;
end;
/
