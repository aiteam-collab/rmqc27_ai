prompt --application/pages/page_00122
begin
--   Manifest
--     PAGE: 00122
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_page.create_page(
 p_id=>122
,p_name=>'Internal Message'
,p_alias=>'INTERNAL-MESSAGE2'
,p_step_title=>'Internal Message'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-header {',
'    -ms-flex-order: var(--a-cv-order-header,1);',
'    order: var(--a-cv-order-header,1);',
'    -ms-flex-align: center;',
'    align-items: center;',
'    display: grid;',
'    grid-template-columns: minmax(0,auto) minmax(0,1fr) minmax(0,auto);',
'    grid-template-areas: "icon-top icon-top icon-top icon-top" " icon body badge icon-end" "badge-bottom badge-bottom badge-bottom badge-bottom";',
'    padding-left: var(--a-cv-header-padding-x,16px);',
'    padding-right: var(--a-cv-header-padding-x,16px);',
'    padding-top: var(--a-cv-header-padding-y,16px);',
'    padding-bottom: var(--a-cv-header-padding-y,16px);',
'    background-color: var(--a-cv-header-background-color);',
'    color: var(--a-cv-header-text-color);',
'    /*background-color: #FF6347;*/',
'    background-image: linear-gradient(to top, #1de9b6 0%, #ffd180 100%); ',
'      border-bottom-width: var(--a-cv-header-border-width,1px);',
'    border-bottom-style: solid;',
'    border-bottom-color: var(--a-cv-header-border-color);',
'}',
'',
'#but {',
'    background-color: #26c6da ;;;',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    /*margin-bottom: 2px;*/',
'    /*margin-left: auto;*/',
'',
'   /* border-radius: 22px;*/',
'}',
'',
'#in {',
'    background-color: #7aa669 ;;;',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'   /* border-radius: 22px;*/',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.3rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'#co {',
'    background-color: var(--a-palette-info);',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    /*border-radius: 22px;*/',
'}'))
,p_step_template=>wwv_flow_imp.id(5639522199844485987)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6585539914363388633)
,p_plug_name=>'Compose'
,p_static_id=>'compose'
,p_region_template_options=>'#DEFAULT#:t-Region--accent3:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P122_TYPE'
,p_plug_display_when_cond2=>'CO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6585045299961302716)
,p_plug_name=>'Inbox'
,p_static_id=>'inbox'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       ''null'' card_title,',
'       ''fa-alert'' card_icon,',
'       IMSRCVR_MSG_ID,',
'           (SELECT INTMSE_SENDER_ID',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU       =:GLOBAL_BU',
'               AND INTMSE_MSG_ID   = IMSRCVR_MSG_ID)Sender,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'          (SELECT INTMSE_SUBJECT',
'             FROM INTERNAL_MESSAGE',
'            WHERE INTMSE_BU =:GLOBAL_BU',
'              AND INTMSE_MSG_ID = IMSRCVR_MSG_ID)Subject,   ',
'          (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU =:GLOBAL_BU',
'               AND INTMSE_MSG_ID =IMSRCVR_MSG_ID)"Date",  ',
'        --apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID:''||imsrcvr_msg_id)"Link",      ',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID',
'  from INT_MSG_RECEIVERS',
'  where IMSRCVR_BU=:global_bu',
'  and IMSRCVR_RCVR_ID=:global_user and IMSRCVR_ARCH_FLAG=''N''',
'  order by IMSRCVR_MSG_ID desc'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P122_TYPE'
,p_plug_display_when_cond2=>'IN'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(5745151396449734270)
,p_region_id=>wwv_flow_imp.id(6585045299961302716)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'Date'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'SUBJECT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-alert'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(5745151928154734270)
,p_card_id=>wwv_flow_imp.id(5745151396449734270)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_MSG_ID,P31_MSG_TYPE,P31_ARCHIVE:&IMSRCVR_MSG_ID.,I,&IMSRCVR_ARCH_FLAG.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6584391330185794383)
,p_plug_name=>'Internal Message'
,p_static_id=>'internal-message'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       ''null'' card_title,',
'       ''fa-alert'' card_icon,',
'       IMSRCVR_MSG_ID,',
'           (SELECT INTMSE_SENDER_ID',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU       =:GLOBAL_BU',
'               AND INTMSE_MSG_ID   = IMSRCVR_MSG_ID)Sender,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'          (SELECT INTMSE_SUBJECT',
'             FROM INTERNAL_MESSAGE',
'            WHERE INTMSE_BU =:GLOBAL_BU',
'              AND INTMSE_MSG_ID = IMSRCVR_MSG_ID)Subject,   ',
'          (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU =:GLOBAL_BU',
'               AND INTMSE_MSG_ID =IMSRCVR_MSG_ID)"Date",  ',
'        --apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID:''||imsrcvr_msg_id)"Link",      ',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID',
'  from INT_MSG_RECEIVERS',
'  where IMSRCVR_BU=:global_bu',
'  and IMSRCVR_RCVR_ID=:global_user and IMSRCVR_READ_FLAG = ''N''',
'  order by IMSRCVR_MSG_ID desc'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P122_TYPE'
,p_plug_display_when_cond2=>'UN'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(5745147597888734078)
,p_region_id=>wwv_flow_imp.id(6584391330185794383)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'Date'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'SUBJECT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-alert'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(5745147998178734146)
,p_card_id=>wwv_flow_imp.id(5745147597888734078)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_MSG_ID,P31_MSG_TYPE,P31_ARCHIVE:&IMSRCVR_MSG_ID.,I,&IMSRCVR_ARCH_FLAG.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6584808771705720461)
,p_plug_name=>'Static Content'
,p_static_id=>'static-content'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5745153325547734281)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6584808771705720461)
,p_button_name=>'Compose'
,p_static_id=>'compose'
,p_button_static_id=>'co'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.::P122_TYPE:CO'
,p_icon_css_classes=>'fa-calendar-check-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5745153708502734281)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6584808771705720461)
,p_button_name=>'Inbox'
,p_static_id=>'inbox'
,p_button_static_id=>'in'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inbox'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.::P122_TYPE:IN'
,p_icon_css_classes=>'fa-window-terminal'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5745148857937734224)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_button_name=>'Send'
,p_static_id=>'send'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Send'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-paper-plane-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5745152868303734274)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6584808771705720461)
,p_button_name=>'Unread'
,p_static_id=>'unread'
,p_button_static_id=>'but'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unread'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.::P122_TYPE:UN'
,p_icon_css_classes=>'fa-window-ban'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585542751568389395)
,p_name=>'P122_ATTACH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585543339341389401)
,p_name=>'P122_ATTACH_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585542576376389393)
,p_name=>'P122_CC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_prompt=>'Cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585542864060389396)
,p_name=>'P122_MESSAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_prompt=>'Plain Text'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585542687542389394)
,p_name=>'P122_SUBJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_prompt=>'Subject'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6585542436127389392)
,p_name=>'P122_TO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6585539914363388633)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6584816409839721264)
,p_name=>'P122_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6584808771705720461)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5745155374574734715)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Attachment No.'
,p_static_id=>'attachment-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(IMA_SEQ_NO),1)+1 ',
'	  INTO :P122_ATTACH_NO ',
'		FROM internal_message_attachment ',
'	 WHERE IMA_BU = :GLOBAL_BU;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5745148857937734224)
,p_internal_uid=>263193539031123687
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5745155126639734703)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Compose Send'
,p_static_id=>'compose-send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:P122_TO IS NULL)OR ',
'		 (:P122_SUBJECT IS NULL) OR',
'	 (:P122_MESSAGE IS NULL)',
'THEN',
'raise_application_error(-20999,''Please enter to/subject/message to continue.'');',
'ELSE',
'	proc_sender_names_validation(:GLOBAL_BU,:P122_TO);',
'END IF;',
'IF (:P122_CC IS NOT NULL)THEN',
'proc_sender_names_validation(:GLOBAL_BU,:P122_CC); ',
'END IF;',
'proc_int_msg_inserting (',
'   :global_bu,',
'--   :global.plnt,',
'   :global_user,',
'   SYSDATE,',
'   :P122_TO,',
'   :P122_CC,',
'   :P122_SUBJECT,',
'   :P122_MESSAGE,',
'	:P122_ATTACH_NO',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5745148857937734224)
,p_process_success_message=>'Your message has been sent.'
,p_internal_uid=>263193291096123675
);
wwv_flow_imp.component_end;
end;
/
