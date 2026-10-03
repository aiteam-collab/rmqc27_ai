prompt --application/shared_components/navigation/breadcrumbs/sto_order
begin
--   Manifest
--     MENU: STO ORDER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(5706013599903207581)
,p_name=>'STO ORDER'
,p_static_id=>'sto-order'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5706056574739260746)
,p_parent_id=>wwv_flow_imp.id(5706049857731249788)
,p_short_name=>'Detail'
,p_static_id=>'detail'
,p_link=>'f?p=&APP_ID.:25340025303:&SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5706042540373234687)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:25340025303:&SESSION.::&DEBUG.:::'
,p_page_id=>25340025303
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5706049857731249788)
,p_parent_id=>wwv_flow_imp.id(5706042540373234687)
,p_short_name=>'Territory'
,p_static_id=>'territory'
,p_link=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_page_id=>41
);
wwv_flow_imp.component_end;
end;
/
