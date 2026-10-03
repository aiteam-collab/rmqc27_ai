prompt --application/pages/page_00127
begin
--   Manifest
--     PAGE: 00127
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
 p_id=>127
,p_name=>'Read Message'
,p_alias=>'READ-MESSAGE1'
,p_page_mode=>'MODAL'
,p_step_title=>'Read Message'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5746969878935836062)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6028785334136485773)
,p_plug_name=>'Read Message'
,p_static_id=>'read-message'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028786076711485781)
,p_name=>'P127_ATH_FILE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028785911575485779)
,p_name=>'P127_CC1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'Cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028785797506485778)
,p_name=>'P127_FROM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5746969944479836063)
,p_name=>'P127_IMSRCVR_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5746969878935836062)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028786155787485782)
,p_name=>'P127_INFO1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028785968147485780)
,p_name=>'P127_SUBJECT1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'Subject'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6028785691664485777)
,p_name=>'P127_TO1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6028785334136485773)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5746970235725836066)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREINSERT'
,p_static_id=>'preinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P127_IMSRCVR_MSG_ID IS NOT NULL THEN',
'SELECT :GLOBAL_user     ,',
'        INTMSE_SENDER_ID, --:MOVED.SENDER    ,',
'        INTMSE_CC_USERS ,',
'        INTMSE_SUBJECT  ,',
'        INTMSE_MESSAGE',
' INTO  :P127_TO1     ,',
'       :P127_FROM1   ,',
'       :P127_CC1     ,',
'       :P127_SUBJECT1,',
'       :P127_INFO1',
'  FROM INTERNAL_MESSAGE',
' WHERE INTMSE_BU     =:GLOBAL_BU',
'   AND INTMSE_MSG_ID =:P127_IMSRCVR_MSG_ID;',
'',
'    UPDATE int_msg_receivers',
'       SET imsrcvr_read_flag = ''Y''',
'     WHERE imsrcvr_bu       = :GLOBAL_BU',
'       AND imsrcvr_msg_id   = :P127_IMSRCVR_MSG_ID',
'       AND imsrcvr_rcvr_id  = :GLOBAL_user;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>265008400182225038
);
wwv_flow_imp.component_end;
end;
/
