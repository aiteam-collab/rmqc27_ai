prompt --application/shared_components/navigation/lists/new_menu_bar_5643062705600740637
begin
--   Manifest
--     LIST: New_Menu_Bar-5643062705600740637
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(11125024541144351665)
,p_name=>'New_Menu_Bar-5643062705600740637'
,p_static_id=>'new-menu-bar-2'
,p_version_scn=>'25919815646'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11668718061691134418)
,p_list_item_display_sequence=>11
,p_list_item_link_text=>' &ACTIVE.'
,p_static_id=>'active'
,p_parent_list_item_id=>wwv_flow_imp.id(11666504698480036457)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6335985903988299456)
,p_list_item_display_sequence=>52
,p_list_item_link_text=>'Announcement'
,p_static_id=>'announcement'
,p_list_item_link_target=>'f?p=&APP_ID.:1002:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bullhorn'
,p_parent_list_item_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125026415949351671)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Approvals1 (&GLOBAL_APPR_CNT.)'
,p_static_id=>'approvals1-global-appr-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:RP,CIR:::'
,p_list_item_icon=>'fa-clipboard-list fam-check fam-is-success'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_APPR_CNT <>0'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_text_01=>'&GLOBAL_APPR_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="Approvals'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11131021187452230934)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Check Form ID'
,p_static_id=>'check-form-id'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6267901495306816023)
,p_list_item_display_sequence=>41
,p_list_item_link_text=>'CL Count(&EMP_CL_COUNT.)'
,p_static_id=>'cl-count-emp-cl-count'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_USER IN (''SMPLERPADMIN'',''SESERPADMIN'',''PPSERPADMIN'')'
,p_list_item_disp_condition2=>'PLSQL'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6335967497167207112)
,p_list_item_display_sequence=>51
,p_list_item_link_text=>'Directory'
,p_static_id=>'directory'
,p_list_item_link_target=>'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.::P1001_TYPE:D:'
,p_list_item_icon=>'fa-phone'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6330101861923983191)
,p_list_item_display_sequence=>94
,p_list_item_link_text=>'Email'
,p_static_id=>'email'
,p_list_item_link_target=>'f?p=&APP_ID.:19251900042:&SESSION.::&DEBUG.::P19251900042_BACK:N:'
,p_list_item_icon=>'fa-envelope-heart'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6258312458059796201)
,p_list_item_display_sequence=>53
,p_list_item_link_text=>'Events'
,p_static_id=>'events'
,p_list_item_link_target=>'f?p=&APP_ID.:1025:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar-o'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_text_02=>'<h6 class="lowercase" title="Events'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11666504698480036457)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'Favourites'
,p_static_id=>'favourites'
,p_list_item_icon=>'fa-star'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125028406726351675)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'&GLOBAL_EMP_NAME.'
,p_static_id=>'global-emp-name'
,p_list_item_link_target=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6335979269066288017)
,p_list_item_display_sequence=>61
,p_list_item_link_text=>'Help Desk'
,p_static_id=>'help-desk'
,p_list_item_link_target=>'f?p=&APP_ID.:1026:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-question-circle'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6336011130895304989)
,p_list_item_display_sequence=>81
,p_list_item_link_text=>'Holiday Details'
,p_static_id=>'holiday-details'
,p_list_item_link_target=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar-user'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6035001651022268418)
,p_list_item_display_sequence=>91
,p_list_item_link_text=>'IM/Mail/SMS/Whatsapp'
,p_static_id=>'im-mail-sms-whatsapp'
,p_list_item_link_target=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-commenting'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'1 = 2'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'ALWAYS'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6329164260904954791)
,p_list_item_display_sequence=>92
,p_list_item_link_text=>'Internal Messages'
,p_static_id=>'internal-messages'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::P30_BACK:N:'
,p_list_item_icon=>'fa-comments'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11205727795577250959)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Legend'
,p_static_id=>'legend'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-list-alt'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125027133557351673)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Mail - Unsent (&GLOBAL_MAIL_UNSENT_CNT.)'
,p_static_id=>'mail-unsent-global-mail-unsent-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_TYPE:MUN:'
,p_list_item_icon=>'fa-envelope-o fam-x fam-is-danger'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_text_01=>'&GLOBAL_MAIL_UNSENT_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="Mail - Unsent'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125026744433351671)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Messages (&GLOBAL_MSG_CNT.)'
,p_static_id=>'messages-global-msg-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comments'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_text_02=>'<h6 class="lowercase" title="Messages'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11703478336878983918)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Messages (&GLOBAL_MSG_CNT.)'
,p_static_id=>'messages-global-msg-cnt-2'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.::P5_TYPE:MSG:'
,p_list_item_icon=>'fa-comments'
,p_list_item_icon_attributes=>'open: function( event, ui ) { closeDialogClickOutside(this); }'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_text_02=>'<h6 class="lowercase" title="Messages'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11191495993204218828)
,p_list_item_display_sequence=>0
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp'
,p_list_item_link_target=>'javascript:document.getElementById(''P0_SEARCH'').focus();'
,p_list_item_icon=>'fa-2d-mode navbar-search'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6335961724231161379)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-2'
,p_list_item_icon=>'fa-list'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11669463122444479311)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&nbsp;1'
,p_static_id=>'nbsp-3'
,p_list_item_link_target=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_list_item_icon_attributes=>'open: function( event, ui ) { closeDialogClickOutside(this); }'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-4'
,p_list_item_link_target=>'f?p=&APP_ID.:5000002:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_list_text_01=>'&GLOBAL_TOT_NOTF.'
,p_list_text_02=>'<h6 class="lowercase" title="Menu" '
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125028787805351675)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-5'
,p_list_item_link_target=>'f?p=&APP_ID.:LOGIN:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sign-out'
,p_list_text_02=>'<h6 class="lowercase" title="Sign Out'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125028013547351675)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Notifications (&GLOBAL_NOT_CNT.)'
,p_static_id=>'notifications-global-not-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:NOTIFY:'
,p_list_item_icon=>'fa-bullhorn'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_NOT_CNT<>0 '
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6914504964976969274)
,p_list_item_display_sequence=>101
,p_list_item_link_text=>'Recent_Menu'
,p_static_id=>'recent-menu'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6914510408843972896)
,p_list_item_display_sequence=>111
,p_list_item_link_text=>'&RECENT_MENU.'
,p_static_id=>'recent-menu-2'
,p_parent_list_item_id=>wwv_flow_imp.id(6914504964976969274)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6330094421117969761)
,p_list_item_display_sequence=>93
,p_list_item_link_text=>'SMS'
,p_static_id=>'sms'
,p_list_item_link_target=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P19251900041_BACK:N:'
,p_list_item_icon=>'fa-envelope'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125027563672351673)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'SMS - Unsent (&GLOBAL_SMS_UNSENT_CNT.)'
,p_static_id=>'sms-unsent-global-sms-unsent-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:SUN:'
,p_list_item_icon=>'fa-mobile fam-x fam-is-danger'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_text_01=>'&GLOBAL_SMS_UNSENT_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="SMS - Unsent'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11125025583192351671)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Tasks (&GLOBAL_TASK_CNT.)'
,p_static_id=>'tasks-global-task-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-check-alt'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6330112009913996231)
,p_list_item_display_sequence=>95
,p_list_item_link_text=>'WhatsApp'
,p_static_id=>'whatsapp'
,p_list_item_link_target=>'f?p=&APP_ID.:19251900043:&SESSION.::&DEBUG.::P19251900043_BACK:N:'
,p_list_item_icon=>'fa-users-chat'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(11125025174645351671)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11555130549356278159)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Work Menu'
,p_static_id=>'work-menu'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-clock'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
