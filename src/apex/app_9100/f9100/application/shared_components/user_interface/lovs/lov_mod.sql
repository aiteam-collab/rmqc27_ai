prompt --application/shared_components/user_interface/lovs/lov_mod
begin
--   Manifest
--     LOV_MOD
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
 p_id=>wwv_flow_imp.id(6029437456761437704)
,p_lov_name=>'LOV_MOD'
,p_static_id=>'lov-mod'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT func_find_module_desc(cun_notfn_mod,:GLOBAL_user1) mod_desc,cun_notfn_mod',
'   FROM NOTIFICATION_ALERT',
'where cun_user_id = :global_user',
'group by cun_notfn_mod'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CUN_NOTFN_MOD'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
