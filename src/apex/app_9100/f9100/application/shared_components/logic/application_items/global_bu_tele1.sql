prompt --application/shared_components/logic/application_items/global_bu_tele1
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_BU_TELE1
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
 p_id=>wwv_flow_imp.id(5759504842190919828)
,p_name=>'GLOBAL_BU_TELE1'
,p_protection_level=>'I'
,p_version_scn=>'18007482580'
);
wwv_flow_imp.component_end;
end;
/
