prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
--   Manifest
--     REGION TEMPLATE: carousel-container
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
 p_id=>wwv_flow_imp.id(10650493495466505328)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
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
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_static_id=>'carousel-container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>wwv_imp_util.get_subscription_id(2865840475322558786,2540,'carousel-container',8842,null,'universal-theme')
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650498628710505337)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_static_id=>'nobodypadding'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650498956834505337)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_static_id=>'remember-carousel-slide'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650499427497505337)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_static_id=>'show-maximize-button'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650499625787505339)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_static_id=>'show-next-and-previous-buttons'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650499745690505339)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_static_id=>'show-region-icon'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650496613406505334)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_static_id=>'accent-1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650496819830505334)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_static_id=>'accent-2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650496942477505334)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_static_id=>'accent-3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650497164558505334)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_static_id=>'accent-4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650497347782505334)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_static_id=>'accent-5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(10650496413287505334)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650500219880505339)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_static_id=>'slide'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_imp.id(10650499933338505339)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650500378040505339)
,p_theme_id=>42
,p_name=>'SPIN'
,p_static_id=>'spin'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_imp.id(10650499933338505339)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650495416653505332)
,p_theme_id=>42
,p_name=>'240PX'
,p_static_id=>'240px'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650495564758505332)
,p_theme_id=>42
,p_name=>'320PX'
,p_static_id=>'320px'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650495817626505332)
,p_theme_id=>42
,p_name=>'480PX'
,p_static_id=>'480px'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650496204259505332)
,p_theme_id=>42
,p_name=>'640PX'
,p_static_id=>'640px'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(10650495220762505332)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650498161259505336)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_static_id=>'hideoverflow'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650499179671505337)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_static_id=>'scrollbody'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(10650497995674505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650497823186505336)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_static_id=>'hiddenheadernoat'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(10650497610874505336)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650498361759505336)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_static_id=>'hideregionheader'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(10650497610874505336)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650498793318505337)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_static_id=>'noborder'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650500547539505339)
,p_theme_id=>42
,p_name=>'STACKED'
,p_static_id=>'stacked'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(10650492194250505326)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650494605442505331)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_static_id=>'10-seconds'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_imp.id(10650494424508505331)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650494799351505331)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_static_id=>'15-seconds'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_imp.id(10650494424508505331)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650494976129505331)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_static_id=>'20-seconds'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_imp.id(10650494424508505331)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(10650495975708505332)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_static_id=>'5-seconds'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_imp.id(10650494424508505331)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(5534537605902693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534536974520693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534537282581693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534536890150693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534537220328693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534536757679693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534537036891693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534537396619693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(5534537500513693571)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(10650493757753505329)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
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
 p_id=>wwv_flow_imp.id(10650494032149505329)
,p_plug_template_id=>wwv_flow_imp.id(10650493495466505328)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_apexlang_name=>'slides'
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
