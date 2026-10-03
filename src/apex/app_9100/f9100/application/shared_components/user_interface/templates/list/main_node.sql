prompt --application/shared_components/user_interface/templates/list/main_node
begin
--   Manifest
--     LIST TEMPLATE: main-node
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
 p_id=>wwv_flow_imp.id(11050117033660632620)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Main_Node'
,p_static_id=>'main-node'
,p_internal_name=>'MAIN_NODE'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'@media (max-width: 2800px) {',
'    .t_ul {',
'    background: white;',
'    height: 525px;',
'    column-gap: 20px;',
'    -webkit-column-count: 1;',
'}',
'    ',
'}',
'',
'@media (max-width: 800px) {',
'    .t_ul {',
'    background: white;',
'    height: 525px;',
'    column-gap: 20px;',
'    -webkit-column-count: 2;',
'}',
'    ',
'}',
'',
'',
'',
'li {',
'    font-size: 1.2rem;',
'    padding-right: 4px;',
'}',
'',
'',
'',
'ul {',
'    list-style-type: none;',
'    color: #030110;',
'    background:transparent;',
'    ',
'}',
'',
'',
'',
'',
'ol, ul {',
'    margin: 0.7rem 0rem;',
'    padding: 0;',
'}',
'',
'',
'',
'a {',
'     color: none; ',
'    font-weight: 600;',
'}',
'',
'.t-DialogRegion--noPadding .t-DialogRegion-body {',
'    padding: 0;',
'    overflow: initial;',
'}',
'',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-addActions:js-tabLike:js-showSubMenuIcons:js-menu-callout'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul class="t_ul">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" style="color:green;"  title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" style="color:darkorchid; font-weight: 700; font-size: larger;" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>  '
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(11050117457902632631)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_static_id=>'add-actions'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(11050117033660632620)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(11050117833250632631)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_static_id=>'behave-like-tabs'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(11050117033660632620)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(11050118319090632631)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_static_id=>'display-menu-callout'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(11050117033660632620)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(11050118664129632632)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_static_id=>'show-sub-menu-icons'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(11050117033660632620)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp.component_end;
end;
/
