prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
--   Manifest
--     BUTTON TEMPLATE: text-with-icon
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(10650579844143505434)
,p_template_name=>'Text with Icon'
,p_static_id=>'text-with-icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>wwv_imp_util.get_subscription_id(2081382742158699622,2530,'text-with-icon',8842,null,'universal-theme')
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650580117476505434)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_static_id=>'hide-label-on-mobile'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650580694183505434)
,p_theme_id=>42
,p_name=>'PUSH'
,p_static_id=>'push'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(10650579319119505432)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650581125801505434)
,p_theme_id=>42
,p_name=>'SPIN'
,p_static_id=>'spin'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(10650579319119505432)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650580471413505434)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_static_id=>'lefticon'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(10650580276675505434)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650580873845505434)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_static_id=>'righticon'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_imp.id(10650580276675505434)
,p_template_types=>'BUTTON'
);
wwv_flow_imp.component_end;
end;
/
