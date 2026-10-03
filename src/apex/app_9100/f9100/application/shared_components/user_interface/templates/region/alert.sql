prompt --application/shared_components/user_interface/templates/region/alert
begin
--   Manifest
--     REGION TEMPLATE: alert
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(10650486579108505317)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_static_id=>'alert'
,p_internal_name=>'ALERT'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>wwv_imp_util.get_subscription_id(2039236646100190748,2540,'alert',8842,null,'universal-theme')
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650487218515505320)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_static_id=>'coloredbackground'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650488992042505321)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_static_id=>'horizontal'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(10650488734407505321)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650490156449505323)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_static_id=>'wizard'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(10650488734407505321)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650488606765505321)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_static_id=>'hide-icons'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_imp.id(10650488399005505321)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650489428978505323)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_static_id=>'show-custom-icons'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_imp.id(10650488399005505321)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650489799160505323)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_static_id=>'usedefaulticons'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_imp.id(10650488399005505321)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650487975348505321)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_static_id=>'hiddenheader'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_imp.id(10650487776260505321)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650488207431505321)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_static_id=>'hiddenheadernoat'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_imp.id(10650487776260505321)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650487603012505320)
,p_theme_id=>42
,p_name=>'DANGER'
,p_static_id=>'danger'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_imp.id(10650487403733505320)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650489190537505323)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_static_id=>'information'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_imp.id(10650487403733505320)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650489594276505323)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_static_id=>'success'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_imp.id(10650487403733505320)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650489955351505323)
,p_theme_id=>42
,p_name=>'WARNING'
,p_static_id=>'warning'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_imp.id(10650487403733505320)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534535176608693570)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_apexlang_name=>'close'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534535056215693570)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_apexlang_name=>'create'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534535325577693570)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_apexlang_name=>'next'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534535398455693570)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_apexlang_name=>'previous'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(10650486896167505318)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_apexlang_name=>'regionBody'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534534938297693570)
,p_plug_template_id=>wwv_flow_imp.id(10650486579108505317)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_apexlang_name=>'subRegions'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp.component_end;
end;
/
