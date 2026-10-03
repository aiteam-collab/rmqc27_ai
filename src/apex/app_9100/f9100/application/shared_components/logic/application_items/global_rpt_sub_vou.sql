prompt --application/shared_components/logic/application_items/global_rpt_sub_vou
begin
--   Manifest
--     APPLICATION ITEM: GLOBAL_RPT_SUB_VOU
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
 p_id=>wwv_flow_imp.id(8033821119775627185)
,p_name=>'GLOBAL_RPT_SUB_VOU'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
