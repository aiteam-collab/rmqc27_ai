prompt --application/shared_components/user_interface/templates/report/theme_default
begin
--   Manifest
--     ROW TEMPLATE: theme-default
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
 p_id=>wwv_flow_imp.id(6251298056244912141)
,p_row_template_name=>'Theme Default'
,p_static_id=>'theme-default'
,p_internal_name=>'THEME_DEFAULT'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#exitpopup").dialog({',
'',
'    autoOpen: false,',
'    modal: false,',
'    dialogClass: ''PROF_DID''',
'',
'',
'});',
'',
'',
'$(''html'')',
'    .bind(',
'        ''click'',',
'        function(e) {',
'            if ($(''#exitpopup'').dialog(''isOpen'') && !$(e.target).is(''.ui-dialog, a'') && !$(e.target).closest(''.ui-dialog'').length && !$(e.target).is(''.image_icon'')&&!$(e.target).is(''.ui-dialog-titlebar-close'')) {',
'                $(''#exitpopup'').dialog(''close'');',
'',
'',
'                $(''.image_icon'').removeClass(''et'');',
'                $(''.image_icon'').addClass(''st'');',
'            }',
'        }',
'    );'))
,p_css_file_urls=>'#APP_IMAGES#Menu7.css'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="accountMenu_menu" class="a-Header-accountDialog" tabindex="-1">',
'    <div>',
'        <div> ',
'            <center>',
'                <img src="&GLOBAL_URL_API./images/empimg/&GLOBAL_BU./&GLOBAL_EMP_ID." class="image_icon7 st" style="border: 0px; -moz-border-radius: 64px; -webkit-border-radius: 64px;" class="a-Header-photo" alt="Profile Picture"  cover;" alt="Profil'
||'e Picture" onerror="this.onerror=null;this.src=''#APP_IMAGES#admin-settings-male.png'';">      ',
'            </center>',
'            <a href="#EDIT_PROFIL#" class="a-Header-accountDialog-editProfile a-Menu-item a-Menu-label" id="EDIT_PROFILE_LINK">Hi, &GLOBAL_EMP_NAME. (&GLOBAL_EMP_ID.)</a>',
'        </div>',
'        <div> <!-- class="a-MediaBlock-content"-->',
'            <div class="a-Menu-label a-Menu-item" tabindex="-1">',
'                <span class="a-Header-dialogText a-Header-dialogName">#FIRSTNAME# #LASTNAME#</span>',
'                <span class="a-Header-dialogText a-Header-dialogUsername">#EMAIL#</span></div>',
'            <div class="a-Menu-label a-Menu-item" tabindex="-1">',
'                <span class="a-Header-dialogLabel">Department</span>',
'             <span class="a-Header-dialogValue">#DEPARTMENT#</span>',
'            <!--</div><div class="a-Menu-label a-Menu-item"  tabindex="-1">-->',
'                <span class="a-Header-dialogLabel">Designation</span>',
'             <span class="a-Header-dialogValue">#DESIGNATION#</span></div>             ',
'            <div class="a-Menu-label a-Menu-item" tabindex="-1">',
'                <span class="a-Header-dialogLabel">Role</span><span class="a-Header-dialogValue">#ROLE#</span></div>',
'        </div>',
'    </div>',
'</div>'))
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_translate_this_template=>'Y'
);
wwv_flow_imp.component_end;
end;
/
