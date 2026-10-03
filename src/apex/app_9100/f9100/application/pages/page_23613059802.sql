prompt --application/pages/page_23613059802
begin
--   Manifest
--     PAGE: 23613059802
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
 p_id=>23613059802
,p_name=>'Send / Unsend - Email'
,p_alias=>'SEND-UNSEND-EMAIL1'
,p_page_mode=>'MODAL'
,p_step_title=>'Send / Unsend - Email'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7007007352973787141)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7005664949200381257)
,p_plug_name=>'EMAIL_OUTBOX_HD'
,p_static_id=>'email-outbox-hd'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMAIL_OUTBOX_HD'
,p_query_where=>'EOH_BU = :GLOBAL_bu'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007007444999787142)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7007007352973787141)
,p_button_name=>'Attachment'
,p_static_id=>'attachment'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Attachment'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-paperclip'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007009030237787157)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7007007352973787141)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:23613059801:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007007263797787140)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7007007352973787141)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P23613059802_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007007974461787147)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7007007352973787141)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007007201941787139)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7007007352973787141)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P23613059802_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7007008873680787156)
,p_branch_name=>'Attachment Page 90'
,p_branch_action=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.::P90_DM_VOU_LEVEL,P90_DM_PARTY_TYPE,P90_DM_VOU_TYPE,P90_DM_MODULE,P90_PAGE_NO,P90_DM_VOU_NO,P90_DM_DOC_NO,P90_ROWID:,,,,,,,&P23613059802_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7007007444999787142)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007007099349787138)
,p_name=>'P23613059802_CC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_prompt=>'CC'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665689574381264)
,p_name=>'P23613059802_EOH_BODY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_prompt=>'Body'
,p_source=>'EOH_BODY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665215589381259)
,p_name=>'P23613059802_EOH_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666680379381274)
,p_name=>'P23613059802_EOH_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666986032381277)
,p_name=>'P23613059802_EOH_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006446897787132)
,p_name=>'P23613059802_EOH_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666791725381275)
,p_name=>'P23613059802_EOH_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666840187381276)
,p_name=>'P23613059802_EOH_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665391924381261)
,p_name=>'P23613059802_EOH_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665316681381260)
,p_name=>'P23613059802_EOH_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665935431381266)
,p_name=>'P23613059802_EOH_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006810202787135)
,p_name=>'P23613059802_EOH_MAIL_SEND_OPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_MAIL_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006682920787134)
,p_name=>'P23613059802_EOH_MAIL_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_MAIL_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666614180381273)
,p_name=>'P23613059802_EOH_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665440787381262)
,p_name=>'P23613059802_EOH_SNDR_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_prompt=>'From'
,p_source=>'EOH_SNDR_EMAIL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SEND_EMAIL_SU'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the From email',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666283656381270)
,p_name=>'P23613059802_EOH_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665581148381263)
,p_name=>'P23613059802_EOH_SUBJ'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_prompt=>'Subject'
,p_source=>'EOH_SUBJ'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666399592381271)
,p_name=>'P23613059802_EOH_UNIT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005667055756381278)
,p_name=>'P23613059802_EOH_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006337881787131)
,p_name=>'P23613059802_EOH_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006618538787133)
,p_name=>'P23613059802_EOH_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006138537787129)
,p_name=>'P23613059802_EOH_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006312375787130)
,p_name=>'P23613059802_EOH_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665774748381265)
,p_name=>'P23613059802_EOH_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666149294381269)
,p_name=>'P23613059802_EOH_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666068365381268)
,p_name=>'P23613059802_EOH_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005665977034381267)
,p_name=>'P23613059802_EOH_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7005666475610381272)
,p_name=>'P23613059802_EOH_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'EOH_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006842038787136)
,p_name=>'P23613059802_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_item_source_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7007006988219787137)
,p_name=>'P23613059802_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7005664949200381257)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7005665070142381258)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7005664949200381257)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Send / Unsend - Email'
,p_static_id=>'initialize-form-send-unsend-email'
,p_internal_uid=>1523703234598770230
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007007865879787146)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK'
,p_static_id=>'ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	CURSOR c1',
'	IS',
'	SELECT 1',
'	  FROM user_mail_access',
'	 WHERE uma_bu        = :GLOBAL_bu',
'	   AND uma_user_name = :P23613059802_EOH_SNDR_EMAIL;',
'	   ',
'	cr1			            c1%ROWTYPE;	   ',
'	',
' v_mail     	               VARCHAR2(500) := :P23613059802_TO||'';''||:P23613059802_CC||'';'';',
' v_cnt      	               NUMBER;',
' v_ind_mail 	               VARCHAR2(500);',
' v_seq_no		               NUMBER;',
' pos1     		               NUMBER;',
' pos2     		               NUMBER;',
'BEGIN ',
'	',
'	IF :P23613059802_EOH_SNDR_EMAIL IS NULL THEN',
'		RAISE_APPLICATION_ERROR (-20999,''Sender(From) Mail ID must be entered.'');',
'	END IF;',
'	',
'	',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
'	',
'	IF c1%NOTFOUND THEN',
'		RAISE_APPLICATION_ERROR (-20999,''User Mail Access not configured for the given Sender e-Mail ID.'');',
'	END IF;',
'	',
'	CLOSE c1;',
'	',
'	DELETE ',
'     FROM email_outbox_rcvr_list',
'	 WHERE eorl_bu     = :GLOBAL_bu',
'	   AND eorl_doc_no = :P23613059802_EOH_DOC_NO;',
'',
'	SELECT NVL(MAX(eorl_seq_no),0) + 1',
'	  INTO v_seq_no',
'	  FROM email_outbox_rcvr_list',
'	 WHERE eorl_bu     = :GLOBAL_bu',
'	   AND eorl_doc_no = :P23613059802_EOH_DOC_NO;		 ',
'	',
'	INSERT INTO email_outbox_rcvr_list (eorl_bu,',
'													eorl_doc_no,',
'													eorl_seq_no,',
'													eorl_rcvr_email,',
'													eorl_cc_email,',
'													eorl_rcvr_id,',
'													eorl_rcvr_type,',
'													eorl_sel_flag,',
'													eorl_cre_by,',
'													eorl_cre_date)',
'									    VALUES (:GLOBAL_bu,',
'													:P23613059802_EOH_DOC_NO,',
'													v_seq_no,',
'													:P23613059802_TO,',
'													:P23613059802_CC,',
'													NULL,',
'													''E'',',
'													''N'',  -- :EMAIL_OUTBOX_HD.select_flag,',
'													:GLOBAL_user,',
'													SYSDATE);    ',
'		',
'	commit;',
'END;		',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7007007974461787147)
,p_internal_uid=>1525046030336176118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007007809145787145)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PRE INSERT'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P23613059802_ROWID IS NULL THEN',
'',
'   SELECT NVL(MAX(eoh_doc_no),0) + 1 ',
'     INTO :P23613059802_EOH_DOC_NO',
'     FROM email_outbox_hd',
'    WHERE eoh_bu = :GLOBAL_bu;',
'',
'   :P23613059802_EOH_CRE_BY      := :GLOBAL_bu ;',
'   :P23613059802_EOH_CRE_DATE    := SYSDATE ;',
'   :P23613059802_EOH_CRE_EMP_ID  := :GLOBAL_EMP_ID ;',
'   -- :P23613059802_EOH_CRE_IP_ADDR := :',
'   -- :P23613059802_EOH_CRE_OS_USER := :',
'',
'ELSE ',
'',
'   :P23613059802_EOH_UPD_BY      := :GLOBAL_bu ;',
'   :P23613059802_EOH_UPD_DATE    := SYSDATE ;',
'   :P23613059802_EOH_UPD_EMP_ID  := :GLOBAL_EMP_ID ;',
'   -- :P23613059802_EOH_UPD_IP_ADDR := :',
'   -- :P23613059802_EOH_UPD_OS_USER := :',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1525045973602176117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007007578731787143)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7005664949200381257)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form  EMAIL_OUTBOX_HD'
,p_static_id=>'process-form-email-outbox-hd'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7007007263797787140)
,p_process_success_message=>'Inserted Successfully.'
,p_internal_uid=>1525045743188176115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007007709112787144)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7005664949200381257)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form  EMAIL_OUTBOX_HD_1'
,p_static_id=>'process-form-email-outbox-hd-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7007007201941787139)
,p_process_success_message=>'Updateted Successfully.'
,p_internal_uid=>1525045873569176116
);
wwv_flow_imp.component_end;
end;
/
