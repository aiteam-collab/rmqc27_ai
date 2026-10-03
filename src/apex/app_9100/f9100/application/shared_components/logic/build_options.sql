prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(10687173015659875379)
,p_build_option_name=>'Feature: Access Control'
,p_static_id=>'feature-access-control'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'1'
,p_feature_identifier=>'APPLICATION_ACCESS_CONTROL'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6320463437561699696)
,p_build_option_name=>'Feature: Email Reporting'
,p_static_id=>'feature-email-reporting'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'1'
,p_feature_identifier=>'APPLICATION_EMAIL_REPORTING'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(7619582453551492551)
,p_build_option_name=>'Never'
,p_static_id=>'never'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(7031259516264491845)
,p_build_option_name=>'Temprary not used'
,p_static_id=>'temprary-not-used'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
