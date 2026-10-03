prompt --application/shared_components/navigation/lists/new_menu_bar_819607547754860922
begin
--   Manifest
--     LIST: New_Menu_Bar-819607547754860922
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
 p_id=>wwv_flow_imp.id(6301569383298471950)
,p_name=>'New_Menu_Bar-819607547754860922'
,p_static_id=>'new-menu-bar'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301575940229471954)
,p_list_item_display_sequence=>11
,p_list_item_link_text=>' &ACTIVE.'
,p_static_id=>'active'
,p_parent_list_item_id=>wwv_flow_imp.id(6301575209638471954)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301570795708471951)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Approvals (&GLOBAL_APPR_CNT.)'
,p_static_id=>'approvals-global-appr-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-list fam-check fam-is-success'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_APPR_CNT <>0'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_text_01=>'&GLOBAL_APPR_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="Approvals'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301569942161471951)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Check Form ID'
,p_static_id=>'check-form-id'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301575209638471954)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'Favourites'
,p_static_id=>'favourites'
,p_list_item_icon=>'fa-star'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301575533915471954)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&GLOBAL_EMP_NAME.'
,p_static_id=>'global-emp-name'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301570344643471951)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Legend'
,p_static_id=>'legend'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-list-alt'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301573935687471953)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Mail - Unsent (&GLOBAL_MAIL_UNSENT_CNT.)'
,p_static_id=>'mail-unsent-global-mail-unsent-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:MUN:'
,p_list_item_icon=>'fa-envelope-o fam-x fam-is-danger'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_MAIL_UNSENT_CNT<>0'
,p_list_item_disp_condition2=>'SQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_text_01=>'&GLOBAL_MAIL_UNSENT_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="Mail - Unsent'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301572012990471953)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Messages (&GLOBAL_MSG_CNT.)'
,p_static_id=>'messages-global-msg-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:MSG:'
,p_list_item_icon=>'fa-comments'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_text_02=>'<h6 class="lowercase" title="Messages'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301572363394471953)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Messages (&GLOBAL_MSG_CNT.)'
,p_static_id=>'messages-global-msg-cnt-2'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::P5_TYPE:MSG:'
,p_list_item_icon=>'fa-comments'
,p_list_item_icon_attributes=>'open: function( event, ui ) { closeDialogClickOutside(this); }'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_MSG_CNT<>0'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_text_02=>'<h6 class="lowercase" title="Messages'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301569570606471951)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_list_item_icon_attributes=>'open: function( event, ui ) { closeDialogClickOutside(this); }'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-2'
,p_list_item_link_target=>'f?p=&APP_ID.:5000002:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_list_text_01=>'&GLOBAL_TOT_NOTF.'
,p_list_text_02=>'<h6 class="lowercase" title="Menu'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301572752662471953)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-3'
,p_list_item_link_target=>'javascript:openModal(''SRCH7'');'
,p_list_item_icon=>'fa-search'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301574818899471954)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'&nbsp;'
,p_static_id=>'nbsp-4'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_text_02=>'<h6 class="lowercase" title="Sign Out'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301573560039471953)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Notifications (&GLOBAL_NOT_CNT.)'
,p_static_id=>'notifications-global-not-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:NOTIFY:'
,p_list_item_icon=>'fa-bullhorn'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_NOT_CNT<>0'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301574346862471954)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'SMS - Unsent (&GLOBAL_SMS_UNSENT_CNT.)'
,p_static_id=>'sms-unsent-global-sms-unsent-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:SUN:'
,p_list_item_icon=>'fa-mobile fam-x fam-is-danger'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_SMS_UNSENT_CNT <>0'
,p_list_item_disp_condition2=>'SQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_text_01=>'&GLOBAL_SMS_UNSENT_CNT.'
,p_list_text_02=>'<h6 class="lowercase" title="SMS - Unsent'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301571208545471951)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Tasks (&GLOBAL_TASK_CNT.)'
,p_static_id=>'tasks-global-task-cnt'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_TYPE:TASK:'
,p_list_item_icon=>'fa-clipboard-check-alt'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>':GLOBAL_TASK_CNT <>0'
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(6301571610927471951)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6301573154018471953)
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
