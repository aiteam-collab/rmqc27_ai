prompt --application/shared_components/user_interface/templates/list/badge_list
begin
--   Manifest
--     LIST TEMPLATE: badge-list
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
 p_id=>wwv_flow_imp.id(10650559402141505414)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_static_id=>'badge-list'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>wwv_imp_util.get_subscription_id(2062482847268086664,2550,'badge-list',8842,null,'universal-theme')
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650560458773505415)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_static_id=>'apply-theme-colors'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650562035104505417)
,p_theme_id=>42
,p_name=>'LARGE'
,p_static_id=>'large'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(10650561866261505417)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650562298234505417)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_static_id=>'medium'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(10650561866261505417)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650562451623505417)
,p_theme_id=>42
,p_name=>'SMALL'
,p_static_id=>'small'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(10650561866261505417)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650562859978505418)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_static_id=>'xlarge'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(10650561866261505417)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650563074979505418)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_static_id=>'xxlarge'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(10650561866261505417)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650559714861505415)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_static_id=>'2columngrid'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650559855387505415)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_static_id=>'3columngrid'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650560114579505415)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_static_id=>'4columngrid'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650560254829505415)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_static_id=>'5columngrid'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650561033833505415)
,p_theme_id=>42
,p_name=>'FIXED'
,p_static_id=>'fixed'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650561277017505417)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_static_id=>'flexiblebox'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650561527466505417)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_static_id=>'floatitems'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650562630337505417)
,p_theme_id=>42
,p_name=>'STACKED'
,p_static_id=>'stacked'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(10650555259844505407)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650560853517505415)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_static_id=>'circular'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(10650560696422505415)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650561721797505417)
,p_theme_id=>42
,p_name=>'GRID'
,p_static_id=>'grid'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(10650559402141505414)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(10650560696422505415)
,p_template_types=>'LIST'
);
wwv_flow_imp.component_end;
end;
/
