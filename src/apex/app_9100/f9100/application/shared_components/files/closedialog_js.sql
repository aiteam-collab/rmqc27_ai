prompt --application/shared_components/files/closedialog_js
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
wwv_flow_imp.g_varchar2_table(1) := '66756E6374696F6E20636C6F73654469616C6F67436C69636B4F75747369646528656C656D297B0D0A2020202428272E75692D7769646765742D6F7665726C617927292E636C69636B2866756E6374696F6E28297B0D0A2020202020202428656C656D29';
wwv_flow_imp.g_varchar2_table(2) := '2E6469616C6F672827636C6F736527293B0D0A2020207D293B0D0A7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11677768960905604175)
,p_file_name=>'closeDialog.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
