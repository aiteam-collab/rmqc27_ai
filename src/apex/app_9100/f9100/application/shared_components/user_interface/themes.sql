prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 42
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(10650582612163505440)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'1.5'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(10658658980040234081)
,p_default_page_template=>wwv_flow_imp.id(11134577066937722959)
,p_default_dialog_template=>wwv_flow_imp.id(10650478229710505311)
,p_error_template=>wwv_flow_imp.id(10650470393802505303)
,p_printer_friendly_template=>wwv_flow_imp.id(10650482615684505314)
,p_login_template=>wwv_flow_imp.id(10650470393802505303)
,p_default_button_template=>wwv_flow_imp.id(10650579805006505434)
,p_default_region_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_chart_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_form_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_reportr_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_wizard_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_menur_template=>wwv_flow_imp.id(10650527065007505375)
,p_default_listr_template=>wwv_flow_imp.id(10650517649530505364)
,p_default_irr_template=>wwv_flow_imp.id(10650515782604505361)
,p_default_report_template=>wwv_flow_imp.id(10650546578386505396)
,p_default_label_template=>wwv_flow_imp.id(10650578635815505431)
,p_default_menu_template=>wwv_flow_imp.id(10650581164484505434)
,p_default_list_template=>wwv_flow_imp.id(10650576822232505428)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(10650567730402505423)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(10650566178965505420)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(10650491255404505325)
,p_default_dialogr_template=>wwv_flow_imp.id(10650490324422505325)
,p_default_option_label=>wwv_flow_imp.id(10650578635815505431)
,p_default_required_label=>wwv_flow_imp.id(10650579001665505432)
,p_default_navbar_list_template=>wwv_flow_imp.id(10650568730786505423)
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.5/')
,p_files_version=>266
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4070917134413059350,2000,'universal-theme',8842)
);
wwv_flow_imp.component_end;
end;
/
