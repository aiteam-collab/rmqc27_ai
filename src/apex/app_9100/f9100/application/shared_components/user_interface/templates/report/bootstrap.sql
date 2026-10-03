prompt --application/shared_components/user_interface/templates/report/bootstrap
begin
--   Manifest
--     ROW TEMPLATE: bootstrap
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
 p_id=>wwv_flow_imp.id(8011271552534964784)
,p_row_template_name=>'Bootstrap'
,p_static_id=>'bootstrap'
,p_internal_name=>'DB1'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#bootstrap.bundle.min.js',
'#APP_FILES#counterup.min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function(){',
'  $(''#t_Button_navControl'').click(function(){',
'      var myid = $(''#t_Button_navControl'').attr(''aria-expanded'');',
'      if (myid == ''true'') {',
'            // $(''.t-Cards-item'').css({',
'            // ''width'': ''25% !important''',
'            // });            ',
'            $(''.card_adj'').removeClass("t-Cards--5cols"); //#R2464416793306016429_cards',
'            $(''.card_adj'').addClass("t-Cards--4cols");',
'      }',
'      else {',
'         // $(''.t-Cards-item'').css({',
'         //    ''width'': ''20% !important''',
'         //    });',
'         $(''.card_adj'').removeClass("t-Cards--4cols");',
'         $(''.card_adj'').addClass("t-Cards--5cols");',
'         }',
'  });',
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
'.shake:hover .shaking { ',
'  animation-name: horizontal-shaking;',
'  animation-duration: 0.5s;',
'  }',
'.scale { ',
'  transition: 0.5s ease;',
'  }',
'.scale:hover { ',
'  transform:  scale(1.05);',
'  animation-duration: 1.5s;',
'  transition: .3s ease;',
'  }',
'',
'.scale:hover .des:before { ',
'  top: 0%;',
'  transition: .4s ease;',
'  }',
' ',
'@keyframes horizontal-shaking {',
' 0% { transform: translateX(0) }',
' 25% { transform: translateX(5px) }',
' 50% { transform: translateX(-5px) }',
' 75% { transform: translateX(5px) }',
' 100% { transform: translateX(0) }',
'}',
'.row1 {',
'    margin-right: calc(var(--bs-gutter-x)* 0.5) !important;',
'    margin-left: calc(var(--bs-gutter-x)* 0.5) !important;',
'}',
'.des{',
'overflow: hidden;',
'}',
'.des:before {',
'  content: '''';',
'  display: block;',
'  width: 100%;',
'  height: 100%;',
'  background-color: #446480;',
'  position: absolute;',
'  z-index: -1;',
'  top: 100%;',
'}',
'.scale:hover .ico span, .scale:hover .shaking, .scale:hover .fst-italic {',
'    color: white !important;',
'    text-shadow: 2px 2px 3px black; ',
'}',
'.scale a {',
'    text-decoration: none; ',
'}',
'</style>',
'',
'<div class="overflow-hidden col py-1 t-Cards-item #CARD_MODIFIERS#">',
'   <div class="w-100 pt-2 pb-0 shake scale" style="border-bottom:7px solid #446480; border-radius: 6px; background-color: #CFDDE8; height: 90px; overflow: hidden;">',
'      <a href="#CARD_LINK#">',
'      <div class="des">',
'      <div class="d-flex align-items-start">',
'         <div class="ps-3 pt-2 ico">',
'            <span aria-hidden="true" class="fa fa-folder-chart fa-lg" style="font-size: 28px; color: #446480;"></span>',
'         </div>',
'         <div class="d-flex align-items-end flex-column w-100 px-3">',
'            <h1 class="fw-bolder text-right shaking" style="font-size: 40px; color: #446480;">#VALUE#</h1>',
'         </div>         ',
'      </div>',
'         <div class="pe-3 d-flex align-items-end" style="height: 22px;">',
'            <h5 class="mb-0 w-100 text-end fst-italic fw-bold" style="font-size: 10.5px; margin: 1.5px; color: #446480;">#NAME#</h5>',
'         </div>',
'         </div>',
'         </a>',
'   </div>',
'</div>',
'',
'',
''))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template_before_rows=>'<div class="row row1 row-cols-1 row-cols-md-4 g-3 t-Cards #COMPONENT_CSS_CLASSES# card_adj" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
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
 p_id=>wwv_flow_imp.id(8011277610044964824)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_static_id=>'display-subtitle'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011280339538964832)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_static_id=>'use-theme-colors'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011276017760964823)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_static_id=>'card-raise-card'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(10650535913549505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011275559526964821)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_static_id=>'cards-color-fill'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(10650535913549505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011272360638964817)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_static_id=>'2-lines'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011273231740964818)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_static_id=>'3-lines'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011273936070964820)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_static_id=>'4-lines'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011278741237964829)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_static_id=>'hidden-body-text'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(10650534085162505382)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011279222726964831)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_static_id=>'icons-rounded'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(10650538049513505387)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011279601597964831)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_static_id=>'icons-square'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(10650538049513505387)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011276810777964824)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_static_id=>'display-icons'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(10650536646245505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011277181725964824)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_static_id=>'display-initials'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(10650536646245505386)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011271950569964810)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_static_id=>'2-columns'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011272822796964818)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_static_id=>'3-columns'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011273541426964820)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_static_id=>'4-columns'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011274408839964820)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_static_id=>'5-columns'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011278340041964826)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_static_id=>'float'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011280029996964831)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_static_id=>'span-horizontally'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(10650530266015505379)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011274743631964821)
,p_theme_id=>42
,p_name=>'BASIC'
,p_static_id=>'basic'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011275189718964821)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_static_id=>'block'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011276351438964823)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_static_id=>'compact'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(8011277950352964824)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_static_id=>'featured'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(8011271552534964784)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(10650532302293505381)
,p_template_types=>'REPORT'
);
wwv_flow_imp.component_end;
end;
/
