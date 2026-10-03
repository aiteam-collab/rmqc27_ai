prompt --application/shared_components/user_interface/templates/region/standard
begin
--   Manifest
--     REGION TEMPLATE: standard
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
 p_id=>wwv_flow_imp.id(10650517649530505364)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_static_id=>'standard'
,p_internal_name=>'STANDARD'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>wwv_imp_util.get_subscription_id(4070912133526059312,2540,'standard',8842,null,'universal-theme')
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522994293505370)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_static_id=>'nobodypadding'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650523756782505371)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_static_id=>'show-maximize-button'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650523939862505371)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_static_id=>'show-region-icon'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650519376516505365)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_static_id=>'accent-1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650519545756505367)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_static_id=>'accent-10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650519780361505367)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_static_id=>'accent-11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650520015842505367)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_static_id=>'accent-12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650520167305505367)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_static_id=>'accent-13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650520414576505367)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_static_id=>'accent-14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650520580871505367)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_static_id=>'accent-15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650520762050505368)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_static_id=>'accent-2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650521026333505368)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_static_id=>'accent-3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650521199107505368)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_static_id=>'accent-4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650521370727505368)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_static_id=>'accent-5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650521591304505368)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_static_id=>'accent-6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650521794342505368)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_static_id=>'accent-7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522009712505370)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_static_id=>'accent-8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522195756505370)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_static_id=>'accent-9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650518621484505365)
,p_theme_id=>42
,p_name=>'240PX'
,p_static_id=>'240px'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650518774319505365)
,p_theme_id=>42
,p_name=>'320PX'
,p_static_id=>'320px'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650519006233505365)
,p_theme_id=>42
,p_name=>'480PX'
,p_static_id=>'480px'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650519228481505365)
,p_theme_id=>42
,p_name=>'640PX'
,p_static_id=>'640px'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522566326505370)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_static_id=>'hideoverflow'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650523566343505371)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_static_id=>'scrollbody'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522333862505370)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_static_id=>'hiddenheadernoat'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(10650497610874505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650522782760505370)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_static_id=>'hideregionheader'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(10650497610874505336)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650523176164505370)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_static_id=>'noborder'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650523423465505370)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_static_id=>'remove-ui-decoration'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650524198390505371)
,p_theme_id=>42
,p_name=>'STACKED'
,p_static_id=>'stacked'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650524358604505371)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_static_id=>'text-content'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534544507230693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534543892869693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534544226792693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534543807726693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534544107769693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_apexlang_name=>'delete'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534543677328693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534543966998693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_apexlang_name=>'help'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534544296322693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(5534544398402693579)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(10650517937855505364)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
 p_id=>wwv_flow_imp.id(10650518245038505364)
,p_plug_template_id=>wwv_flow_imp.id(10650517649530505364)
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
