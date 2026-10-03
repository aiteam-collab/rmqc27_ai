prompt --application/shared_components/user_interface/templates/region/collapsible
begin
--   Manifest
--     REGION TEMPLATE: collapsible
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
 p_id=>wwv_flow_imp.id(10650500665378505339)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_static_id=>'collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>wwv_imp_util.get_subscription_id(2662888092628347716,2540,'collapsible',8842,null,'universal-theme')
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650505013935505345)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_static_id=>'nobodypadding'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650505381023505345)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_static_id=>'remember-collapsible-state'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502426488505342)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_static_id=>'accent-1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502539900505342)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_static_id=>'accent-2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502798755505342)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_static_id=>'accent-3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502994803505342)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_static_id=>'accent-4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650503173425505342)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_static_id=>'accent-5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650501608847505340)
,p_theme_id=>42
,p_name=>'240PX'
,p_static_id=>'240px'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650501805762505340)
,p_theme_id=>42
,p_name=>'320PX'
,p_static_id=>'320px'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502000390505340)
,p_theme_id=>42
,p_name=>'480PX'
,p_static_id=>'480px'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650502218767505342)
,p_theme_id=>42
,p_name=>'640PX'
,p_static_id=>'640px'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650504379099505343)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_static_id=>'hideoverflow'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650505740233505346)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_static_id=>'scrollbody'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650504818647505345)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_static_id=>'icons-plus-or-minus'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_imp.id(10650504610033505345)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650503976246505343)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_static_id=>'conrtols-position-end'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_imp.id(10650503747431505343)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650503611535505343)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_static_id=>'collapsed'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(10650503419112505343)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650504136936505343)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_static_id=>'expanded'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(10650503419112505343)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650505171423505345)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_static_id=>'noborder'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650505531461505345)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_static_id=>'remove-ui-decoration'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650506001023505346)
,p_theme_id=>42
,p_name=>'STACKED'
,p_static_id=>'stacked'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534538272440693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_apexlang_name=>'change'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534537904416693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
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
 p_id=>wwv_flow_imp.id(5534538010745693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_apexlang_name=>'copy'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534537828550693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
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
 p_id=>wwv_flow_imp.id(5534537659311693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_apexlang_name=>'edit'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534538096171693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
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
 p_id=>wwv_flow_imp.id(5534538202938693571)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
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
 p_id=>wwv_flow_imp.id(10650500978919505340)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
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
 p_id=>wwv_flow_imp.id(10650501282395505340)
,p_plug_template_id=>wwv_flow_imp.id(10650500665378505339)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_apexlang_name=>'subRegions'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp.component_end;
end;
/
