prompt --application/shared_components/globalization/dyntranslations
begin
--   Manifest
--     DYNAMIC TRANSLATIONS: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_dynamic_translation(
 p_id=>wwv_flow_imp.id(7117767497411540518)
,p_language=>'fr'
,p_from=>'Events'
,p_to=>unistr('\00C9v\00E9nements')
);
wwv_flow_imp.component_end;
end;
/
