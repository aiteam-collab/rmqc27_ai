prompt --application/shared_components/files/notification_css
begin
--   Manifest
--     APP STATIC FILES: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E742D4865616465722D6C6F676F2C202E742D486561646572202E742D427574746F6E2D2D6865616465722E69732D6163746976652C202E742D486561646572202E742D427574746F6E2D2D686561646572207B0D0A20202020636F6C6F723A20236635';
wwv_flow_imp.g_varchar2_table(2) := '303130313B0D0A7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(6337195716043159848)
,p_file_name=>'notification.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
