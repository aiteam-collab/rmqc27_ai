prompt --application/shared_components/user_interface/templates/page/find_menu_scm
begin
--   Manifest
--     TEMPLATE: find-menu-scm
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(6856473426873635728)
,p_theme_id=>42
,p_name=>'Find Menu_SCM'
,p_static_id=>'find-menu-scm'
,p_internal_name=>'ROADMAP'
,p_is_popup=>false
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.theme42.initializePage.noSideCol();',
'if (typeof $.apex.interactiveReport === "function") {',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};',
'}'))
,p_css_file_urls=>'#WORKSPACE_FILES#FindMenuCSS.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Header-navBar {',
'    grid-area: inherit;',
'    display: grid;',
'    grid-template-columns: auto 1fr auto;',
'    grid-template-areas: "navbar-start navbar-middle navbar-end";',
'    align-items: center;',
'    gap: var(--ut-header-navbar-item-spacing, var(--ut-header-item-spacing, 8px));',
'}',
'',
'',
'.t-Alert--page .t-Alert-content {',
'    padding: 2px;',
'}',
'',
'.succ_msg {',
'    padding: 8px 6px 0px 8px;',
'    flex-grow: 1;',
'    flex-shrink: 1;',
'    flex-basis: auto;',
'    display: flex;',
'    flex-direction: column;',
'}',
'',
'',
'.t-Alert--horizontal .t-Alert-icon, .t-Alert--wizard .t-Alert-icon {',
'    border-top-left-radius: 8px;',
'    border-bottom-left-radius: 8px;',
'}',
'',
'.t-Alert--page{',
'		--ut-alert-icon-size: 17px;',
'		--ut-alert-icon-padding: 10px;',
'}',
'.t-Alert--page.t-Alert--success{',
'    --ut-alert-type-background-color: #0e8327db;',
'	 }',
'',
'',
'',
'.t-Footer-version {',
'    display: flex !important;',
'    margin-right: .8rem !important;',
'}',
'',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    color: black !important;',
'    font-weight: 300;',
'    font-size: small;',
'    white-space: nowrap;',
'}',
'',
'',
'.a-IRR-table td {',
'    border-color: var(--a-gv-cell-border-color);',
'    border-style: solid;',
'    border-width: var(--a-gv-cell-border-width, 1px);',
'    height: var(--a-gv-cell-height, 32px);',
'    padding-block-end: var(--a-gv-cell-padding-y, 4px);',
'    padding-block-start: var(--a-gv-cell-padding-y, 4px);',
'    padding-inline-end: var(--a-gv-cell-padding-x, 8px);',
'    padding-inline-start: var(--a-gv-cell-padding-x, 8px);',
'    white-space: nowrap;',
'}',
'/* ',
'.t-Footer-topButton {',
'    width: 30px !important;',
'    height: 30px !important;',
'    padding: 7px !important;',
'}',
'',
'',
'.t-Region {',
'    display: block;',
'    border-width: var(--ut-region-border-width, var(--ut-component-border-width, 1px));',
'    border-style: solid;',
'    border-color: var(--ut-region-border-color, var(--ut-component-border-color));',
'    border-radius: var(--ut-region-border-radius, var(--ut-component-border-radius));',
'    box-shadow: var(--ut-region-box-shadow, var(--ut-component-box-shadow));',
'    margin-bottom: var(--ut-region-margin, 16px);',
'    background-color: lightcyan;',
'    color: var(--ut-region-text-color, var(--ut-component-text-default-color));',
'    font-size: var(--ut-region-font-size, 14px);',
'    line-height: var(--ut-region-line-height, 20px);',
'}',
'.a-IRR-headerLink:hover {',
'    color: white !important;',
'    background: #00b1e7 !important;',
'}',
'.a-IRR-headerLink:hover {',
'    color: white !important;',
'    background: #00b1e7 !important;',
'}',
' */'))
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody" style="font-family:tahoma!important;font-size:2px!important;" >',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link"><!-- <span aria-hidden="true" class="fa fa-home"></span>&nbsp;&nbsp;-->  <span style = "font-size:14px;font-weight:300;" >&GLOBAL_BU_DESC. &nbsp;||&nbsp; &GLOBAL_PAGE_DESC.</span></a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'      <img src="&GLOBAL_API_URL.images/empimg/&GLOBAL_BU./&GLOBAL_EMP_ID." class="image_icon7 st" style = "width: 30px;height: 30px;border-radius: 75px;    margin-right: 9px;" alt="Profile Picture" onerror="this.onerror=null;this.src=''#APP_IMAGES#adm'
||'in-settings-male.png'';">',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>   ',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>      ',
'        <footer class="t-Footer" style="padding: 5px;" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">              ',
'              <div class="t-Footer-version">',
'					    <table style="width: 100%;">',
'							 <tr>',
'								<th class="u-textStart" style="color:#377e55;font-size: smaller;">&GLOBAL_BU_DESC.</th>',
'								<th style="text-align: end!important; color:green;font-size: 12px; font-weight:500;">ROADMAP ERP<span style="text-align: end!important; color:#a39e9e;font-size: 12px;font-weight:500;"> || </span> <span style="text-align: end!important; color:'
||'#238bb3;font-size: 12px;font-weight:500;">Roadmap IT Solutions</span></th>							',
'							 </tr>',
'						 </table>								',
'					 <!-- <span style="color:#377e55;font-weight: bolder;font-size: 16px;"><b>&GLOBAL_BU_DESC.</b></span>',
'					 <span style="color:#253979;font-weight: bolder;font-size: larger;"><b>Roadmap IT Solutions.</b></span> -->',
'			     </div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'           <!-- <h4 class="t-Alert-title">#SUCCESS_MESSAGE#</h4>-->',
'			<h6 class="succ_msg">',
'				#SUCCESS_MESSAGE#',
'			</h6>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(6856477326734635766)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_static_id=>'sticky-header-on-mobile'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856476868663635756)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_apexlang_name=>'beforeContentBody'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856474332218635755)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_apexlang_name=>'breadcrumbBar'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856473875022635755)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_apexlang_name=>'contentBody'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856475375823635755)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_apexlang_name=>'footer'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856474874598635755)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_apexlang_name=>'inlineDialogs'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856476378031635756)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_apexlang_name=>'pageHeader'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(6856475874634635755)
,p_page_template_id=>wwv_flow_imp.id(6856473426873635728)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_apexlang_name=>'pageNavigation'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp.component_end;
end;
/
