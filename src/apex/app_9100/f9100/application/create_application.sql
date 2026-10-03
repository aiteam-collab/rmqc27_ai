prompt --application/create_application
begin
--   Manifest
--     FLOW: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'RMQC27_AI')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Roadmap ERP')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'LOGINPAGE')
,p_application_group=>wwv_flow_imp.id(1679778316123978127)
,p_application_group_name=>'RMQC27'
,p_application_group_static_id=>'rmqc'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'2F4A167DA422B74A3AF29F83F3217FAB3579F267A684B473D91E25549569CCB7'
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_compatibility_mode=>'24.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_allow_feedback_yn=>'Y'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(10650463415975505293)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Roadmap ERP'
,p_app_builder_icon_name=>'erplogo.jpg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>' '
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_referrer_policy=>'strict-origin-when-cross-origin'
,p_runtime_api_usage=>'T:O:W'
,p_pass_ecid=>'N'
,p_authorize_public_pages_yn=>'Y'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_tokenize_row_search=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Roadmap ERP'
,p_substitution_string_02=>'GLOBAL_URL_API'
,p_substitution_value_02=>'https://webapp.roadmaperp.com:8449/apex/rmqc22'
,p_substitution_string_03=>'APP_LOGIN'
,p_substitution_value_03=>':GLOBAL_LOGIN_PAGE'
,p_substitution_string_04=>'GLOBAL_LOGIN_PAGE'
,p_substitution_value_04=>'LOGIN'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461317160345
,p_version_scn=>'93388845'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&GLOBAL_MAIN_APP.:165:&APP_SESSION.'
,p_login_url=>'f?p=&GLOBAL_MAIN_APP.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(10650567730402505423)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#app-icon.css?version=#APP_VERSION#',
'#WORKSPACE_FILES#fontstylesheet.css',
'#APP_FILES#report_font_css.css',
'#WORKSPACE_FILES#report_action_hide.css'))
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#interactive_grid.js',
'#WORKSPACE_FILES#SERCH.js',
'#APP_IMAGES#Hide_Show.js'))
,p_include_legacy_javascript=>'PRE18:18'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(11125024541144351665)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(10650568730786505423)
,p_nav_bar_template_options=>'#DEFAULT#:js-menu-callout'
,p_translation_method=>'TRANSLATION_APPS'
);
wwv_flow_imp.component_end;
end;
/
