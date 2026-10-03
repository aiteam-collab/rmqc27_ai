prompt --application/shared_components/user_interface/templates/list/tabs
begin
--   Manifest
--     LIST TEMPLATE: tabs
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(10650574569378505426)
,p_list_template_current=>'<li class="t-Tabs-item is-active #A03#" id="#A01#"><a href="#LINK#" class="t-Tabs-link #A04#"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-Tabs-link #A04#"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_static_id=>'tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_reference_id=>wwv_imp_util.get_subscription_id(3288206686691809997,2550,'tabs',8842,null,'universal-theme')
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650574904952505426)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_static_id=>'above-label'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_imp.id(10650572298652505425)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650575237873505426)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_static_id=>'inline-with-label'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_imp.id(10650572298652505425)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650575078395505426)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_static_id=>'fill-labels'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650575497606505428)
,p_theme_id=>42
,p_name=>'LARGE'
,p_static_id=>'large'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_imp.id(10650565047973505420)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650576030301505428)
,p_theme_id=>42
,p_name=>'SMALL'
,p_static_id=>'small'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_imp.id(10650565047973505420)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650575717454505428)
,p_theme_id=>42
,p_name=>'PILL'
,p_static_id=>'pill'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_imp.id(10650560696422505415)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650575881568505428)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_static_id=>'simple'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650574569378505426)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_imp.id(10650560696422505415)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_imp.component_end;
end;
/
