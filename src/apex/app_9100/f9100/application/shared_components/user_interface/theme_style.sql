prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 42
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10658658980040234081)
,p_theme_id=>42
,p_name=>'ERP'
,p_static_id=>'erp'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#5e6087","@g_Nav-Active-BG":"#b7d4e4","@g_Nav-Active-FG":"#ffffff","@g_Nav-BG":"#386273","@g_Nav-FG":"#f4f4f4","@g_Header-BG":"#0b447c","@g_Header-FG":"#ffffff","@Nav-Exp":"320px","@Actions-Exp":"240px","@g_Nav-A'
||'ccent-BG":"#386273","@g_Nav-Accent-FG":"#ffffff","@g_Nav-Badge-BG":"#386273","@g_Nav-Badge-FG":"#ffffff","@g_NavBarMenu-Active-BG":"#386273","@g_NavBarMenu-Active-FG":"#ffffff","@Head-Height":"40px","@l_Button-Primary-BG":"#ffffff","@l_Button-Primary'
||'-Text":"#0c0c0c","@g_Focus":"#004153","@g_Link-Base":"#004153"},"customCSS":".t-Form-fieldContainer--floatingLabel {\n    --ut-field-label-font-size: 1.2rem;\n}\n\n\nbody .ui-corner-all {\n    border-radius: 2px;\n    border-radius: 9px;\n}\n\n.t-Tab'
||'s--simple .t-Tabs-item.is-active .t-Tabs-link {\n    box-shadow: 0 -2px 0 #FF9800 inset;\n    background: #f1f1f1;\n    border-top-left-radius: 8px;\n    border-top-right-radius: 8px;\n    font-weight: 900;\n    color: #3F51B5;\n}\n\n.t-Form-fieldCon'
||'tainer--floatingLabel .t-Form-label \n{\n    font-size: 1.2rem;\n   // font-family: Arial;  \n}\n\n/*for item  readonly  by sentha */ \n.t-Form-fieldContainer--floatingLabel .t-Form-itemWrapper .apex-item-display-only{\n    border: 1px solid #dfdfdf;'
||'\n}\n\n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem;\n    //font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item'
||'-display-only {\n    font-size: 1.2rem;\n    //font-family: Arial;  \n}\n/*\n.a-IRR-table tr td {\n    font-size: 1.1rem;\n    font-weight: 600;\n    font-family: system-ui;\n}*/\n\n .t-Report-colHead {\n    font-size: 1.2rem;\n    line-height: 1.6re'
||'m;\n    border-right-width: 0;\n}\n\n.t-Report-cell {\n    font-size: 1.1rem;\n    line-height: 1.6rem;\n    border-right-width: 0;\n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-label \n{\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\'
||'n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display'
||'-only {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.a-Switch input[type=checkbox]:checked + .a-Switch-toggle \n{\n    background-color: #229954;\n}\n\n.t-Body .t-Tabs--simple .t-Tabs-link {\n    color: #1c1c1c;\n    font-weight: 600;\n '
||'   font-size: 1.2rem;\n    font-family: system-ui;\n}\n\n.t-Button--simple.t-Button--hot {\n    box-shadow: 0 0 0 2px #5C6BC0 inset;\n    background-color: #5C6BC0;\n}\n\n.t-Button--simple.t-Button--hot, .t-Button--simple.t-Button--hot .t-Icon {\n   '
||' color: white;\n}\n\n.t-Button--simple.t-Button--hot:hover, .t-Button--simple.t-Button--hot:focus, .t-Button--simple.t-Button--hot.is-active {\n    background-color: #cbcbcd;\n    color: #ffffff;\n}\n/*Tool Tip */\n\n/* Add this attribute to the elem'
||'ent that needs a tooltip */\n[data-tooltip] {\n  position: relative;\n  display: inline-block;\n}\n\n/* Hide the tooltip content by default */\n[data-tooltip]:before,\n[data-tooltip]:after {\n  visibility: hidden;\n  opacity: 0;\n  pointer-events: no'
||'ne;\n}\n\n/* Position tooltip above the element */\n[data-tooltip]:before {\n    position: absolute;\n    padding: 2px 5px;\n    border-radius: 5px;\n    background-color:#395371;\n    color: #fff;\n    width: 160px;\n    left: 100%;\n    content: at'
||'tr(data-tooltip);\n}\n\n\n/* Show tooltip content on hover */\n[data-tooltip]:hover:before,\n[data-tooltip]:hover:after {\n  visibility: visible;\n  z-index: 999;\n  white-space:pre-wrap;\n  opacity: 1;\n}\n\n.t-Button--navBar .t-Button-badge {\n    '
||'border-radius: 2px;\n    background-color: rgb(90, 104, 173);\n}\n\n.apex-side-nav.js-navCollapsed .t-Body-nav, .apex-side-nav.js-navCollapsed .t-Body-nav .t-TreeNav {\n    width: 49px;\n    \n}\nbody .ui-widget-header {\n    border-color: #ebebeb;\n'
||'    color: #ffffff;\n    background-color: #3199b9;\n}/*\n.a-IRR-headerLink, .a-IRR-headerLink:hover {\n    text-decoration: none;\n    background: #00b1e7  !important;\n    color: #ffffff !important;\n}*/\nbody .ui-widget-header {\n    border-color:'
||' #ebebeb;\n    background-color: #61717e;\n    color: #ffffff;\n    background: linear-gradient(90deg, rgb(97 134 153) 0%, rgb(10 157 157) 35%, rgb(44 194 225) 100%);\n}\n\n.borcol .t-MediaList {\n    border-color: #f9f9f9;\n    background-color: #ff'
||'ffff;\n}\n\n .borcol .t-MediaList--cols {\n    box-shadow: -1px -1px 0 0 #f9f9f9 inset;\n}\n\n/* Button Color*/\n\n.t-Button--primary.t-Button--link {\n    --a-button-border-color: transparent;\n    --a-button-background-color: transparent;\n    --a-'
||'button-box-shadow: none;\n    --a-button-text-color: #ffffff;\n}\n\n.t-Button--noUI.t-Button--primary, .t-Button--link.t-Button--primary, .t-Button--noUI.t-Button--primary .t-Icon, .t-Button--link.t-Button--primary .t-Icon {\n    color: #cdcdcd !impo'
||'rtant;\n}\n\n/*AJAY*/\n\n/*TAB COLOR*/\n\n.t-Tabs--simple .t-Tabs-item.is-active .t-Tabs-link {\n    background: #f1f1f1;\n    border-top-left-radius: 8px;\n    border-top-right-radius: 8px;\n    font-weight: 900;\n    color: #146629;\n}\n\n.text7 .t'
||'ext .text8 {\n    font-weight: 500 !important;\n    font-size: 12px !important;\n    font-family: inherit;\n}\n\n\n\n/* No. of. rows Selected remove*/\n.a-GV-status {\n    color: #707070;\n    display: none;\n}\n\n\n/*Highlight the popupLOV */\n.a-Po'
||'pupLOV-results .popup-lov-highlight {\n    font-weight: var(--a-popuplov-highlight-font-weight,var(--a-base-font-weight-heavy,900));\n    color: #386273;\n}\n\n/*popup*/\n.a-PopupLOV-results .a-IconList-item:hover {\n    background-color: powderblue;'
||'\n    color: #262626;\n    box-shadow: 0 0 0 1px powderblue inset;\n}\n/* grid-white color */\n.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {\n    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,700));\n  '
||'  background: whitesmoke;\n}\n.a-GV-cell .a-Button.a-Button--actions {\n    --a-button-padding-y: 6px;\n    --a-button-padding-x: 8px;\n    background: white;\n}\n.a-GV-table td, .a-GV-table th {\n    overflow: hidden;\n    white-space: nowrap;\n    '
||'text-overflow: ellipsis;\n    background: white;\n}\n\n.a-GV-table tr.is-selected .a-GV-cell {\n    background-color:white;\n}\n\n.addbtn{\n                color: blue  !important;;\n}\n\n.printbtn{\n                color: rgb(211, 96, 19);\n}\n\n.sa'
||'vebtn{\n                color: green !important;\n}\n.closebtn {\n    color: red  !important;;\n}\n\n .t-TreeNav .a-TreeView-node--topLevel>.a-TreeView-content .a-TreeView-label {\n    line-height: 40px;\n    padding: 0;\n    margin: 0;\n    font-siz'
||'e: 12px;\n}\n \n.t-Button--noUI.t-Button--primary, .t-Button--link.t-Button--primary, .t-Button--noUI.t-Button--primary .t-Icon, .t-Button--link.t-Button--primary .t-Icon {\n    color: #345463 !important;\n}\n.t-TreeNav .a-TreeView-node--topLevel .a-'
||'TreeView-content.is-hover {\n    color: black !important;\n}\n.t-TreeNav .a-TreeView-node--topLevel .a-TreeView-content.is-hover  .fa{\n    color: black !important;\n}\n\n.a-Button:before, .t-Button:before, .ui-button:before {\n    z-index: unset;\n}'
||'\n#P0_SEARCH_input {\n    height: 20px !important;     \n}  \n\n.addbtn{\n                color: blue;\n}\n\n.printbtn{\n              color: #004153;\n;\n}\n\n.savebtn{\n                color: rgb(14, 159, 45);\n} \n.closebtn{\n                color'
||': \t#FF0000;\n}\n\n.closebtn1{\n                color: \t#FF0000;\n}\n\n.cancelbtn{\n                color: \t#FF0000;\n}\n","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#5179137996255313879.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(11195788550188618929)
,p_theme_id=>42
,p_name=>'ERP (Copy)'
,p_static_id=>'erp-copy'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":".t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.4rem;\n    border-radius: 5px;\n}\n\nbody .ui-corner-all {\n    border-radius: 2px;\n    border-radius: 9'
||'px;\n}\n\n.t-Tabs--simple .t-Tabs-item.is-active .t-Tabs-link {\n    box-shadow: 0 -2px 0 #FF9800 inset;\n    background: #f1f1f1;\n    border-top-left-radius: 12px;\n    border-top-right-radius: 12px;\n    font-weight: 900;\n    color: #3F51B5;\n}\n'
||'\n.t-Form-fieldContainer--floatingLabel .t-Form-label \n{\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem'
||';\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.a-IRR-table tr td {\n    font-size: 1.1rem;\n    font-weight: 600;\n  '
||'  font-family: system-ui;\n}\n\n .t-Report-colHead {\n    font-size: 1.2rem;\n    line-height: 1.6rem;\n    border-right-width: 0;\n}\n\n.t-Report-cell {\n    font-size: 1.1rem;\n    line-height: 1.6rem;\n    border-right-width: 0;\n}\n\n.t-Form-fiel'
||'dContainer--floatingLabel .t-Form-label \n{\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem;\n    font-fa'
||'mily: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.a-Switch input[type=checkbox]:checked + .a-Switch-toggle \n{\n    background-color: '
||'#229954;\n}\n\n.t-Body .t-Tabs--simple .t-Tabs-link {\n    color: #1c1c1c;\n    font-weight: 600;\n    font-size: 1.2rem;\n    font-family: system-ui;\n}\n\n.t-Button--simple.t-Button--hot {\n    box-shadow: 0 0 0 2px #5C6BC0 inset;\n    background-c'
||'olor: #5C6BC0;\n}\n\n.t-Button--simple.t-Button--hot, .t-Button--simple.t-Button--hot .t-Icon {\n    color: white;\n}\n\n.t-Button--simple.t-Button--hot:hover, .t-Button--simple.t-Button--hot:focus, .t-Button--simple.t-Button--hot.is-active {\n    ba'
||'ckground-color: #5c6bc0;\n    color: #ffffff;\n}\n","vars":{"@g_Accent-BG":"rgba(55, 126, 84, 1)","@g_Form-Item-FG":"rgba(240, 226, 240, 0.77)"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#5051946520782097668.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(6363366978799930101)
,p_theme_id=>42
,p_name=>'ERP (NEW)'
,p_static_id=>'erp-new'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"rgba(52, 73, 94, 1)","@g_Form-Item-FG":"rgba(0, 0, 0, 0.77)","@g_Focus":"rgba(52, 73, 94, 1)","@g_Nav-Active-BG":"#bf7e1f","@g_Nav-BG":"#0063b2","@Side-Exp":"240px","@Nav-Exp":"320px","@Actions-Exp":"240px","@g_N'
||'av-FG":"#ffffff","@g_Nav-Active-FG":"#ffffff","@g_NavBarMenu-Active-BG":"#6e6f75","@g_NavBarMenu-Active-FG":"#ffffff","@Head-Height":"40px","@l_Button-Primary-BG":"#d2d2df","@l_Button-Primary-Text":"#ffffff"},"customCSS":".t-Form-fieldContainer--floa'
||'tingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.4rem;\n    border-radius: 5px;\n}\n\nbody .ui-corner-all {\n    border-radius: 2px;\n    border-radius: 9px;\n}\n\n.t-Tabs--simple .t-Tabs-item.is-'
||'active .t-Tabs-link {\n    box-shadow: 0 -2px 0 #FF9800 inset;\n    background: #f1f1f1;\n    border-top-left-radius: 8px;\n    border-top-right-radius: 8px;\n    font-weight: 900;\n    color: #3F51B5;\n}\n\n.t-Form-fieldContainer--floatingLabel .t-F'
||'orm-label \n{\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-f'
||'ieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.a-IRR-table tr td {\n    font-size: 1.1rem;\n    font-weight: 600;\n    font-family: system-ui;\n}\n\n .t-Report-c'
||'olHead {\n    font-size: 1.2rem;\n    line-height: 1.6rem;\n    border-right-width: 0;\n}\n\n.t-Report-cell {\n    font-size: 1.1rem;\n    line-height: 1.6rem;\n    border-right-width: 0;\n}\n\n.t-Form-fieldContainer--floatingLabel .t-Form-label \n{\'
||'n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.t-Form-fieldContainer-'
||'-floatingLabel .t-Form-inputContainer .apex-item-display-only {\n    font-size: 1.2rem;\n    font-family: Arial;  \n}\n\n.a-Switch input[type=checkbox]:checked + .a-Switch-toggle \n{\n    background-color: #229954;\n}\n\n.t-Body .t-Tabs--simple .t-Ta'
||'bs-link {\n    color: #1c1c1c;\n    font-weight: 600;\n    font-size: 1.2rem;\n    font-family: system-ui;\n}\n\n.t-Button--simple.t-Button--hot {\n    box-shadow: 0 0 0 2px #5C6BC0 inset;\n    background-color: #5C6BC0;\n}\n\n.t-Button--simple.t-But'
||'ton--hot, .t-Button--simple.t-Button--hot .t-Icon {\n    color: white;\n}\n\n.t-Button--simple.t-Button--hot:hover, .t-Button--simple.t-Button--hot:focus, .t-Button--simple.t-Button--hot.is-active {\n    background-color: #5c6bc0;\n    color: #ffffff'
||';\n}\n/*Tool Tip */\n\n/* Add this attribute to the element that needs a tooltip */\n[data-tooltip] {\n  position: relative;\n  display: inline-block;\n}\n\n/* Hide the tooltip content by default */\n[data-tooltip]:before,\n[data-tooltip]:after {\n  '
||'visibility: hidden;\n  opacity: 0;\n  pointer-events: none;\n}\n\n/* Position tooltip above the element */\n[data-tooltip]:before {\n    position: absolute;\n    padding: 2px 5px;\n    border-radius: 5px;\n    background-color:#395371;\n    color: #f'
||'ff;\n    width: 160px;\n    /* top: 100%; */\n    left: 100%;\n    content: attr(data-tooltip);\n}\n\n\n/* Show tooltip content on hover */\n[data-tooltip]:hover:before,\n[data-tooltip]:hover:after {\n  visibility: visible;\n  z-index: 999;\n  white-'
||'space:pre-wrap;\n  opacity: 1;\n}\n\n.t-Button--navBar .t-Button-badge {\n    border-radius: 2px;\n    background-color: rgb(90, 104, 173);\n}\n\n/*saranya\n.t-Header-branding {\n    background: linear-gradient( \n90deg\n ,#0d274c,#1c53a3);\n}*/\n\n\'
||'n.apex-side-nav.js-navCollapsed .t-Body-nav, .apex-side-nav.js-navCollapsed .t-Body-nav .t-TreeNav {\n    width: 49px;\n    \n}\nbody .ui-widget-header {\n    border-color: #ebebeb;\n    /* background-image: linear-gradient(-20deg, #ddd6f3 0%, #3199b'
||'9 100%, #3199b9 100%); */\n    color: #ffffff;\n    background-color: #3199b9;\n}\n.a-IRR-headerLink, .a-IRR-headerLink:hover {\n    text-decoration: none;\n    background: #853f65e8 !important;\n    color: #ffffff !important;\n    font-family: Arial'
||' !important;\n}\nbody .ui-widget-header {\n    border-color: #ebebeb;\n    /* background-color: #2c6494; */\n    background-color: #61717e;\n    color: #ffffff;\n    background: linear-gradient(90deg, rgb(97 134 153) 0%, rgb(10 157 157) 35%, rgb(44 1'
||'94 225) 100%);\n}\n\n.borcol .t-MediaList {\n    border-color: #f9f9f9;\n    background-color: #ffffff;\n}\n\n .borcol .t-MediaList--cols {\n    box-shadow: -1px -1px 0 0 #f9f9f9 inset;\n}\n\n/* Button Color*/\n\n.t-Button--primary.t-Button--link {\n'
||'    --a-button-border-color: transparent;\n    --a-button-background-color: transparent;\n    --a-button-box-shadow: none;\n    --a-button-text-color: #7a2048;\n}\n\n.t-Button--noUI.t-Button--primary, .t-Button--link.t-Button--primary, .t-Button--noU'
||'I.t-Button--primary .t-Icon, .t-Button--link.t-Button--primary .t-Icon {\n    color: #7a2048 !important;\n}\n\n/*AJAY*/\n\n/*TAB COLOR*/\n\n.t-Tabs--simple .t-Tabs-item.is-active .t-Tabs-link {\n    /* box-shadow: 0 -2px 0 #FF9800 inset; */\n    back'
||'ground: #f1f1f1;\n    border-top-left-radius: 8px;\n    border-top-right-radius: 8px;\n    font-weight: 900;\n    color: #146629;\n}\n/*\n.t-Body .t-Tabs--simple .t-Tabs-link {\n    color: #0e597c;\n    font-weight: 900;\n    font-size: 1.2rem;\n    '
||'font-family: system-ui;\n    border-top-left-radius: 12px;\n    border-top-right-radius: 12px;\n}\n\n*/\n.text7 .text .text8 {\n    font-weight: 500 !important;\n    font-size: 12px !important;\n    font-family: inherit;\n}\n\n\n\n/* No. of. rows Sel'
||'ected remove*/\n.a-GV-status {\n    color: #707070;\n    display: none;\n}\n\n\n/*Highlight the popupLOV */\n.a-PopupLOV-results .popup-lov-highlight {\n    font-weight: var(--a-popuplov-highlight-font-weight,var(--a-base-font-weight-heavy,900));\n  '
||'  color: #0572ce;\n}\n\n/*popup*/\n.a-PopupLOV-results .a-IconList-item:hover {\n    background-color: powderblue;\n    color: #262626;\n    box-shadow: 0 0 0 1px powderblue inset;\n}\n/* grid-white color */\n.a-GV-table th.a-GV-header, .a-GV-table t'
||'h.a-GV-headerGroup {\n    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,700));\n    background: whitesmoke;\n}\n.a-GV-cell .a-Button.a-Button--actions {\n    --a-button-padding-y: 6px;\n    --a-button-padding-x: 8px;\n'
||'    background: white;\n}\n.a-GV-table td, .a-GV-table th {\n    overflow: hidden;\n    white-space: nowrap;\n    text-overflow: ellipsis;\n    background: white;\n}\n\n.a-GV-table tr.is-selected .a-GV-cell {\n    background-color:white;\n}","useCust'
||'omLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#881405143256319073.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10650581564540505437)
,p_theme_id=>42
,p_name=>'Vista'
,p_static_id=>'vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10650581800412505437)
,p_theme_id=>42
,p_name=>'Vita'
,p_static_id=>'vita'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>wwv_imp_util.get_subscription_id(2719875314571594493,2010,'vita',8842,null,'universal-theme')
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10650582022544505437)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_static_id=>'vita-dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>wwv_imp_util.get_subscription_id(3543348412015319650,2010,'vita-dark',8842,null,'universal-theme')
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10650582213219505437)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_static_id=>'vita-red'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>wwv_imp_util.get_subscription_id(1938457712423918173,2010,'vita-red',8842,null,'universal-theme')
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(10650582399906505437)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_static_id=>'vita-slate'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>wwv_imp_util.get_subscription_id(3291983347983194966,2010,'vita-slate',8842,null,'universal-theme')
);
wwv_flow_imp.component_end;
end;
/
