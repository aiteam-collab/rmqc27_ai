prompt --application/shared_components/user_interface/templates/report/copy_of_copy_of_bootstrap
begin
--   Manifest
--     ROW TEMPLATE: copy-of-copy-of-bootstrap
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(5554171804334413838)
,p_row_template_name=>'Copy of Copy of Bootstrap'
,p_static_id=>'copy-of-copy-of-bootstrap'
,p_internal_name=>'DB1'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#bootstrap.bundle.min.js',
'#APP_FILES#counterup.min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'class parallaxTiltEffect {',
'',
'  constructor({element, tiltEffect}) {',
'',
'    this.element = element;',
'    this.container = this.element.querySelector(".container1");',
'    this.size = [300, 360];',
'    [this.w, this.h] = this.size;',
'',
'    this.tiltEffect = tiltEffect;',
'',
'    this.mouseOnComponent = false;',
'',
'    this.handleMouseMove = this.handleMouseMove.bind(this);',
'    this.handleMouseEnter = this.handleMouseEnter.bind(this);',
'    this.handleMouseLeave = this.handleMouseLeave.bind(this);',
'    this.defaultStates = this.defaultStates.bind(this);',
'    this.setProperty = this.setProperty.bind(this);',
'    this.init = this.init.bind(this);',
'',
'    this.init();',
'  }',
'',
'  handleMouseMove(event) {',
'    const {offsetX, offsetY} = event;',
'',
'    let X;',
'    let Y;',
'',
'    if (this.tiltEffect === "reverse") {',
'      X = ((offsetX - (this.w/2)) / 3) / 3;',
'      Y = (-(offsetY - (this.h/2)) / 3) / 3;',
'    }',
'',
'    else if (this.tiltEffect === "normal") {',
'      X = (-(offsetX - (this.w/2)) / 3) / 3;',
'      Y = ((offsetY - (this.h/2)) / 3) / 3;',
'    }',
'',
'    this.setProperty(''--rY'', X.toFixed(2));',
'    this.setProperty(''--rX'', Y.toFixed(2));',
'',
'    this.setProperty(''--bY'', (80 - (X/4).toFixed(2)) + ''%'');',
'    this.setProperty(''--bX'', (50 - (Y/4).toFixed(2)) + ''%'');',
'  }',
'',
'  handleMouseEnter() {',
'    this.mouseOnComponent = true;',
'    this.container.classList.add("container1--active");',
'  }',
'',
'  handleMouseLeave() {',
'    this.mouseOnComponent = false;',
'    this.defaultStates();',
'  }',
'',
'  defaultStates() {',
'    this.container.classList.remove("container1--active");',
'    this.setProperty(''--rY'', 0);',
'    this.setProperty(''--rX'', 0);',
'    this.setProperty(''--bY'', ''80%'');',
'    this.setProperty(''--bX'', ''50%'');',
'  }',
'',
'  setProperty(p, v) {',
'    return this.container.style.setProperty(p, v);',
'  }',
'',
'  init() {',
'    this.element.addEventListener(''mousemove'', this.handleMouseMove);',
'    this.element.addEventListener(''mouseenter'', this.handleMouseEnter);',
'    this.element.addEventListener(''mouseleave'', this.handleMouseLeave);',
'  }',
'',
'}',
'',
'const $ = e => document.querySelector(e);',
'',
'const wrap1 = new parallaxTiltEffect({',
'  element: $(''.wrap--1''),',
'  tiltEffect: ''reverse''',
'});',
'',
'',
'// $(document).ready(function(){',
'//   $(''#t_Button_navControl'').click(function(){',
'//       var myid = $(''#t_Button_navControl'').attr(''aria-expanded'');',
'//       console.log(myid+''test'');',
'//       if (myid == ''true'') {  ',
'//             $(''.card_adj'').removeClass("t-Cards--5cols");',
'//             $(''.card_adj'').addClass("t-Cards--4cols");',
'//       }',
'//       else {',
'//          $(''.card_adj'').removeClass("t-Cards--4cols");',
'//          $(''.card_adj'').addClass("t-Cards--5cols");',
'//          }',
'//   });',
'// });',
'',
'',
'$(document).ready(function() {',
'',
'        $(''.counter'').each(function () {',
'    $(this).prop(''Counter'',0).animate({',
'        Counter: $(this).text()',
'    }, {',
'        duration: 10000,',
'        easing: ''swing'',',
'        step: function (now) {',
'            $(this).text(Math.ceil(now));',
'        }',
'    });',
'});',
' ',
'});'))
,p_css_file_urls=>'#APP_FILES#bootstrap.min.css'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.container {',
'    width: 100%;',
'    padding-right: 0px;',
'    padding-left: 0px;',
'    margin-right: auto;',
'    margin-left: auto;',
'}',
'@media (min-width: 1200px) {',
'    .container, .container-lg, .container-md, .container-sm, .container-xl {',
'        max-width: 100%;',
'    }',
'}',
'.gradient-deep-1 {',
'    background: linear-gradient(270deg, #E8FFF9 0%, #D1FFF3 100%);',
'}',
'',
'.left-line::before {',
'    position: absolute;',
'    content: "";',
'    width: 125px;',
'    height: 4px;',
'    background-color: #16a34a !important;',
'    border-radius: 100px;',
'    margin: 0px 55px;',
'    bottom: -1px;',
'    box-shadow: 2px 1px 7px 0px rgba(29, 128, 252, 0.6);',
'}',
'.line-bg-primary::before {',
'    background-color: #16a34a !important;',
'    box-shadow: 2px 1px 7px 0px rgba(29, 128, 252, 0.6);',
'}',
'</style>',
'',
'<div class="col t-Cards-item #CARD_MODIFIERS#">',
'    <div style="height: 100px;" class="shadow border-0 w-100 card mb-3 gradient-deep-1 left-line line-bg-primary position-relative overflow-hidden">',
'    <div class="row g-0">',
'',
'        <div class="col-9">',
'        <div class="card-body ps-4">        ',
'            <h2 class="card-title counter" style="font-size: 40px; font-weight: bold;">#VALUE#</h2>',
'        </div>',
'        </div>',
'',
'        <div class="col-3 d-inline-flex justify-content-center align-items-center">',
'                <span class="p-3 me-5" style="background-color: #00ffe13d; border-radius: 10px;">',
'                <span class="fa fa-folder-chart fa-lg" style="font-size: 25px; color: #446480; font-weight: bold;"></span>',
'                </span>',
'        </div>',
'        ',
'        <p class="card-text ps-4" style="font-size: 12px; font-weight: bold; line-height: 1.4;">#NAME#</p>',
'        ',
'    </div>',
'    </div>',
'</div>',
'',
''))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template_before_rows=>'<div class="row row1 row-cols-1 row-cols-md-3 g-3 t-Cards #COMPONENT_CSS_CLASSES# card_adj" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--basic:t-Cards--3cols:t-Cards--animColorFill'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554177779230413942)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_static_id=>'display-subtitle'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554180608006413945)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_static_id=>'use-theme-colors'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554176229362413940)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_static_id=>'card-raise-card'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(10650535913549505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554175805635413938)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_static_id=>'cards-color-fill'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(10650535913549505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554172624884413931)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_static_id=>'2-lines'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554173340210413935)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_static_id=>'3-lines'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554174218771413935)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_static_id=>'4-lines'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554179002328413943)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_static_id=>'hidden-body-text'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554179367127413943)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_static_id=>'icons-rounded'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(10650538049513505387)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554179797740413943)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_static_id=>'icons-square'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(10650538049513505387)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554176991242413940)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_static_id=>'display-icons'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(10650536646245505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554177340122413942)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_static_id=>'display-initials'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(10650536646245505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554172235172413920)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_static_id=>'2-columns'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554173014049413934)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_static_id=>'3-columns'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554173815292413935)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_static_id=>'4-columns'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554174535968413938)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_static_id=>'5-columns'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554178625241413943)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_static_id=>'float'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554180208128413945)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_static_id=>'span-horizontally'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554174956259413938)
,p_theme_id=>42
,p_name=>'BASIC'
,p_static_id=>'basic'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554175379325413938)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_static_id=>'block'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554176581305413940)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_static_id=>'compact'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(5554178222417413942)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_static_id=>'featured'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(5554171804334413838)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp.component_end;
end;
/
