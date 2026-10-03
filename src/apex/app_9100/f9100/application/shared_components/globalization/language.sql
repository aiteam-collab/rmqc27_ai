prompt --application/shared_components/globalization/language
begin
--   Manifest
--     LANGUAGE MAP: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7026513635114846703)
,p_translation_flow_id=>166
,p_translation_flow_language_cd=>'fr'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7119231585961230487)
,p_translation_flow_id=>167
,p_translation_flow_language_cd=>'es'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7119234055787235757)
,p_translation_flow_id=>168
,p_translation_flow_language_cd=>'zh'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7119237980677237610)
,p_translation_flow_id=>169
,p_translation_flow_language_cd=>'ja'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7119242245294239663)
,p_translation_flow_id=>171
,p_translation_flow_language_cd=>'th'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(7119870099948315845)
,p_translation_flow_id=>172
,p_translation_flow_language_cd=>'ar'
,p_direction_right_to_left=>'Y'
);
wwv_flow_imp.component_end;
end;
/
