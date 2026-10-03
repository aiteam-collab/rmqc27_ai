prompt --application/pages/page_00802
begin
--   Manifest
--     PAGE: 00802
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
 p_id=>802
,p_name=>'Attachment'
,p_alias=>'ATTACHMENT6'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''a.nolink'').attr("onclick","return false;" );',
'attch_cnt();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.savebtn .fa-plus::before {',
'  color: rgb(14, 159, 45) !important;',
'}',
'',
'.t-Button--simple.t-Button--hot:hover .t-Icon, .t-Button--simple.t-Button--hot:focus .t-Icon, .t-Button--simple.t-Button--hot.is-active .t-Icon {',
'    color: rgb(14, 159, 45) !important;',
'}',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: whitesmoke !important;',
'}',
'',
'',
'#P802_DM_DUE_DATE .a-Button--calendar,',
'#P802_DM_RET_DATE .a-Button--calendar{',
'     display: none !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(6470303034115005558)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_dialog_chained=>'N'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8360947793539130482)
,p_plug_name=>'File'
,p_static_id=>'file'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6924552779212812008)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_static_id=>'Upload'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'javascript:$x(''Upload'').disabled=true; apex.submit(''Upload''); setTimeout(function() {$x(''Upload'').disabled=false;}, 2000);'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10933181321820662740)
,p_name=>'P802_DM_ATTCH_FLAG'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142419501447315)
,p_name=>'P802_DM_CPC_ID'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10844660620780727124)
,p_name=>'P802_DM_DATE_FROM'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10844660683421727125)
,p_name=>'P802_DM_DATE_TO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879787549217456926)
,p_name=>'P802_DM_DOC_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8360948895090130511)
,p_name=>'P802_DM_DUE_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_prompt=>'Due Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183143090164447322)
,p_name=>'P802_DM_EMP_ID'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_EMP_ID'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142307745447314)
,p_name=>'P802_DM_ENTITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>':GLOBAL_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10844662554883727144)
,p_name=>'P802_DM_EXP_FLAG'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879790695343456932)
,p_name=>'P802_DM_MODULE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142942414447320)
,p_name=>'P802_DM_NOTES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notes'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879790263413456930)
,p_name=>'P802_DM_PARTY_ID'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_PARTY_ID'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879789898025456930)
,p_name=>'P802_DM_PARTY_TYPE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_PARTY_TYPE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183143045696447321)
,p_name=>'P802_DM_PROD_ID'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_ITEM_ID'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336801793082021)
,p_name=>'P802_DM_PROD_REV'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_ITEM_REV'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10911124471964744320)
,p_name=>'P802_DM_REQ_DOC_NO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10911124569313744321)
,p_name=>'P802_DM_REQ_DOC_REV'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142641137447317)
,p_name=>'P802_DM_RET_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_prompt=>'Retention End Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142170522447313)
,p_name=>'P802_DM_RET_END_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879789490140456930)
,p_name=>'P802_DM_SEQ_NO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10834623871891307650)
,p_name=>'P802_DM_SUB_VOU_TYPE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_VOU_TYPE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142801960447319)
,p_name=>'P802_DM_TAGS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8183142547274447316)
,p_name=>'P802_DM_TRN_DESC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879787947150456927)
,p_name=>'P802_DM_VOU_LEVEL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'O'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879787080566456926)
,p_name=>'P802_DM_VOU_NO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_VOU_NO'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879789063423456930)
,p_name=>'P802_DM_VOU_PFX'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_VOU_PFX'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879788669835456929)
,p_name=>'P802_DM_VOU_PLNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_PLNT'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10834623832933307649)
,p_name=>'P802_DM_VOU_PLNT_LOC'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_PLNT_LOC'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10834623989561307651)
,p_name=>'P802_DM_VOU_SEQ_NO'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_item_default=>'P800_REF_VOU_SEQ'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879788335797456929)
,p_name=>'P802_DM_VOU_TYPE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10792440013318854342)
,p_name=>'P802_DOC_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT dmdt_desc d,UPPER(dmdt_desc) r',
'    FROM doc_mgmt_doc_type,doc_mgmt_user_access',
'   WHERE dmdt_bu = dmua_bu',
'     AND dmdt_desc = dmua_doc_type',
'     AND dmdt_bu = :global_bu',
'     AND dmua_user = :GLOBAL_user',
'     and dmua_add_access = ''Y''',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Doc. Type')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879786728841456924)
,p_name=>'P802_FILE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_prompt=>'File'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_read_only_when=>'P802_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'Y',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879786260614456920)
,p_name=>'P802_FILE_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9957805902933058705)
,p_name=>'P802_GB_DOC_NO'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9962042711234797226)
,p_name=>'P802_GB_STATUS'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879791157780456932)
,p_name=>'P802_PAGE_NO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9879791542009456934)
,p_name=>'P802_ROWID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8360947793539130482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6924564623365812031)
,p_validation_name=>'DOC_TYPE'
,p_static_id=>'doc-type'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/*',
'IF :P802_FILE_NAME IS NOT NULL THEN',
'DECLARE',
'	v_desc VARCHAR2(50);',
'BEGIN',
'  SELECT COUNT(*)',
'   INTO v_desc',
'   FROM doc_mgmt,',
'        prospects',
'  WHERE prosp_bu = dm_bu',
'    AND prosp_prosp_id = DM_PARTY_ID',
'    AND dm_bu = :GLOBAL_bu',
'    AND prosp_prosp_id = :P802_DM_PARTY_ID',
'    AND dm_file_narr = :P802_FILE_NAME;',
'    ',
'IF v_desc >0 THEN',
' return(''Cannot Insert Duplicate Entry.'');',
'END IF;',
'END;',
'END IF;',
'',
'if :P802_FILE_NAME is null then ',
'return(''File Name must be entered.'');',
'end if;',
'',
'',
'',
'IF :P802_FILE_NAME IS NOT NULL THEN',
'DECLARE',
'	v_desc VARCHAR2(50);',
'BEGIN',
'  SELECT COUNT(*)',
'   INTO v_desc',
'   FROM doc_mgmt',
'  WHERE DM_BU = :GLOBAL_BU',
'    AND dm_file_narr = :P802_FILE_NAME',
'	   AND dm_vou_type = :p802_dm_vou_type',
'      AND dm_vou_pfx = :P802_DM_VOU_PFX',
'      AND dm_vou_no = :P802_DM_VOU_NO;  ',
'    ',
'IF v_desc >0 THEN',
' return(''Cannot Insert Duplicate Entry.'');',
'END IF;',
'END;',
'END IF;*/',
'if :P802_DOC_TYPE is null then ',
'return(''Doc. Type must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6924552779212812008)
,p_associated_item=>wwv_flow_imp.id(10792440013318854342)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6924564220390812030)
,p_validation_name=>'FILE'
,p_static_id=>'file'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P802_ROWID IS NULL AND :P802_FILE IS NULL THEN ',
'  RETURN ''File must be selected.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(6924552779212812008)
,p_associated_item=>wwv_flow_imp.id(9879786728841456924)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6924566106240812033)
,p_name=>'Process For Doc Type'
,p_static_id=>'process-for-doc-type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P802_DOC_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6924566669289812034)
,p_event_id=>wwv_flow_imp.id(6924566106240812033)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P802_DM_EXP_FLAG,P802_DM_ATTCH_FLAG',
  'items_to_submit', 'P802_DOC_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '  SELECT dmdt_exp_flag,dmdt_att_flag',
    '    INTO :P802_DM_EXP_FLAG,:P802_DM_ATTCH_FLAG',
    '    FROM doc_mgmt_doc_type     ',
    '   WHERE TRIM(dmdt_desc) = :P802_DOC_TYPE;',
    '  EXCEPTION WHEN OTHERS THEN ',
    '  :P802_DM_EXP_FLAG :=''N'';',
    '  :P802_DM_ATTCH_FLAG:=''N'';   ',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6924565348908812033)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6924552779212812008)
,p_process_success_message=>'Document Uploaded.'
,p_internal_uid=>1445044365123891831
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6924565707910812033)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Attachment'
,p_static_id=>'initialize-form-attachment'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1445044724125891831
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6924564963385812031)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For  Upload File'
,p_static_id=>'process-for-upload-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C1',
'   IS',
'      SELECT dm_doc_no',
'        FROM doc_mgmt',
'       WHERE dm_bu = :global_bu',
'		 AND dm_vou_pfx = :P802_DM_VOU_PFX',
'		 AND dm_vou_no = :P802_DM_VOU_NO;',
'',
'   v_image        apex_application_temp_files.blob_content%TYPE;',
'   v_filename     apex_application_temp_files.filename%TYPE;',
'   v_doc_name     VARCHAR2 (200);',
'   v_doc_no       VARCHAR2 (15);',
'   v_mime_type    VARCHAR2 (200);',
'   v_att_seq_no   NUMBER (5);',
'   v_dir_name     VARCHAR2 (25);',
'   CR1            C1%ROWTYPE;',
'   v_file_size    VARCHAR2 (200);',
'BEGIN',
'   IF :P802_ROWID IS NULL',
'   THEN',
'      OPEN C1;',
'',
'      FETCH C1 INTO CR1;',
'',
'      CLOSE C1;',
'',
'      IF CR1.dm_doc_no IS NULL',
'      THEN',
'         SELECT NVL (MAX (TO_NUMBER (dm_doc_no)), 1000000000) + 1',
'           INTO v_doc_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu;',
'      ELSE',
'         v_doc_no := CR1.dm_doc_no;',
'      END IF;',
'',
'      BEGIN',
'         SELECT apst_vou_type',
'           INTO :P802_DM_VOU_TYPE',
'           FROM appl_vou_sub_types',
'          WHERE apst_bu = :global_bu',
'            AND apst_sub_type = :P802_DM_SUB_VOU_TYPE;',
'      EXCEPTION',
'         WHEN OTHERS',
'         THEN',
'            NULL;',
'      END;',
'',
'      IF :P802_DM_SUB_VOU_TYPE IN (''BE'', ''BEP'')',
'      THEN',
'         :P802_DM_VOU_TYPE := :P802_DM_SUB_VOU_TYPE;',
'         :P802_DM_MODULE := ''CFG'';',
'      ELSIF :P802_DM_SUB_VOU_TYPE IN (''ADVP'')',
'      THEN',
'         :P802_DM_VOU_TYPE := :P802_DM_SUB_VOU_TYPE;',
'         :P802_DM_MODULE := ''APM'';',
'      ELSIF :P802_DM_SUB_VOU_TYPE IN (''ARR'')',
'      THEN',
'         :P802_DM_VOU_TYPE := :P802_DM_SUB_VOU_TYPE;',
'         :P802_DM_MODULE := ''ARM'';',
'      END IF;',
'',
'      IF :P802_DM_EMP_ID IS NOT NULL',
'      THEN',
'         :P802_DM_VOU_TYPE := ''E_ATT'';',
'         :P802_DM_SUB_VOU_TYPE := ''E_ATT'';',
'      END IF;',
'',
'      IF :P802_DM_VOU_TYPE IS NOT NULL',
'      THEN',
'         BEGIN',
'            SELECT apt_module',
'              INTO :P802_DM_MODULE',
'              FROM appl_pfx_types',
'             WHERE apt_bu = :global_bu AND apt_pfx_type = :P802_DM_VOU_TYPE;',
'         EXCEPTION',
'            WHEN OTHERS',
'            THEN',
'               NULL;',
'         END;',
'      END IF;',
'',
'      IF :P802_DM_PARTY_ID IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'      THEN',
'         SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'           INTO v_att_seq_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu AND dm_party_id = :P802_DM_PARTY_ID;',
'      END IF;',
'',
'      IF :P802_DM_VOU_PLNT IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'      THEN',
'         SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'           INTO v_att_seq_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu AND dm_party_id = :P802_DM_VOU_PLNT;',
'      END IF;',
'',
'      IF :P802_DM_VOU_PLNT_LOC IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'      THEN',
'         SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'           INTO v_att_seq_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu AND dm_party_id = :P802_DM_VOU_PLNT_LOC;',
'      END IF;',
'',
'      IF :P802_DM_PROD_ID IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'      THEN',
'         SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'           INTO v_att_seq_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu AND dm_party_id = :P802_DM_PROD_ID;',
'      END IF;',
'',
'      IF :P802_DM_VOU_NO IS NOT NULL',
'      THEN',
'         SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'           INTO v_att_seq_no',
'           FROM doc_mgmt',
'          WHERE dm_bu = :global_bu',
'			AND (dm_vou_pfx = :P802_DM_VOU_PFX OR :P802_DM_VOU_PFX IS NULL)',
'			AND dm_vou_no = :P802_DM_VOU_NO;',
'      END IF;',
'',
'      DECLARE',
'         l_files   apex_t_varchar2;',
'      BEGIN',
'         IF :P802_FILE IS NOT NULL',
'         THEN',
'            l_files := apex_string.split (:P802_FILE, '':'');',
'',
'            FOR i IN 1 .. l_files.COUNT',
'            LOOP',
'               v_image := NULL;',
'               v_filename := NULL;',
'               v_doc_name := NULL;',
'               v_mime_type := NULL;',
'               v_file_size := NULL;',
'',
'               BEGIN',
'                  SELECT blob_content,',
'                         filename,',
'                            SUBSTR (filename, 1, INSTR (filename, ''.'') - 1)',
'                         || ''(''',
'                         || v_doc_no',
'                         || '').''',
'                         || SUBSTR (filename, INSTR (filename, ''.'', -1) + 1),',
'                         mime_type,',
'                         CASE',
'                            WHEN DBMS_LOB.getlength (blob_content) < 1024',
'                            THEN',
'                               DBMS_LOB.getlength (blob_content) || '' Bytes''',
'                            WHEN DBMS_LOB.getlength (blob_content) <',
'                                    1024 * 1024',
'                            THEN',
'                               ROUND (',
'                                  DBMS_LOB.getlength (blob_content) / 1024,',
'                                  2)',
'                               || '' KB''',
'                            ELSE',
'                               ROUND (',
'                                    DBMS_LOB.getlength (blob_content)',
'                                  / 1024',
'                                  / 1024,',
'                                  2)',
'                               || '' MB''',
'                         END',
'                    INTO v_image,',
'                         v_filename,',
'                         v_doc_name,',
'                         v_mime_type,',
'                         v_file_size',
'                    FROM apex_application_temp_files',
'                   WHERE UPPER (name) = UPPER (l_files (i));',
'               EXCEPTION',
'                  WHEN NO_DATA_FOUND',
'                  THEN',
'                     v_att_seq_no := v_att_seq_no + 1;',
'                     CONTINUE;',
'               END;',
'',
'               IF :P802_DOC_TYPE IS NOT NULL',
'               THEN',
'                  v_dir_name := ''APEX_ATTACH_DIR'';',
'',
'                  SELECT NVL (MAX (TO_NUMBER (dm_doc_no)), 1000000000) + 1',
'                    INTO v_doc_no',
'                    FROM doc_mgmt',
'                   WHERE dm_bu = :global_bu;',
'',
'                  INSERT INTO doc_mgmt (dm_bu,',
'                                        dm_doc_no,',
'                                        dm_vou_level,',
'                                        dm_vou_type,',
'                                        dm_vou_plnt,',
'                                        dm_vou_pfx,',
'                                        dm_vou_no,',
'                                        dm_vou_seq_no,',
'                                        dm_party_type,',
'                                        dm_party_id,',
'                                        dm_prod_id,',
'                                        dm_prod_rev,',
'                                        dm_file_narr,',
'                                        dm_doc_type,',
'                                        dm_doc_name,',
'                                        dm_blob,',
'                                        dm_cre_by,',
'                                        dm_cre_ip_addr,',
'                                        dm_cre_os_user,',
'                                        dm_cre_date,',
'                                        dm_cre_emp_id,',
'                                        dm_attach_id,',
'                                        dm_bus_fun_id,',
'                                        dm_block_name,',
'                                        dm_table_name,',
'                                        dm_mime_type,',
'                                        dm_file_name,',
'                                        dm_party_name,',
'                                        dm_loc_type,',
'                                        dm_attach_dir,',
'                                        dm_module,',
'                                        dm_vou_seq2_no,',
'                                        dm_vou_seq3_no,',
'                                        dm_vou_seq4_no,',
'                                        dm_mail_flag,',
'                                        dm_att_seq_no,',
'                                        dm_type_desc,',
'                                        dm_sub_vou_type,',
'                                        dm_loc_id,',
'                                        dm_req_doc_no,',
'                                        dm_req_doc_rev,',
'                                        dm_entity,',
'                                        dm_cpc_id,',
'                                        dm_trn_desc,',
'                                        dm_ret_date,',
'                                        dm_ret_end_date,',
'                                        dm_due_date,',
'                                        dm_tags,',
'                                        dm_notes,',
'                                        dm_emp_id,',
'                                        dm_file_size)',
'                       VALUES (',
'                                 :global_bu,',
'                                 v_doc_no,',
'                                 :P802_DM_VOU_LEVEL,',
'                                 :P802_DM_VOU_TYPE,',
'                                 :P802_DM_VOU_PLNT,',
'                                 :P802_DM_VOU_PFX,',
'                                 :P802_DM_VOU_NO,',
'                                 :P802_DM_VOU_SEQ_NO,',
'                                 NVL (:P802_DM_PARTY_TYPE, ''S''),',
'                                 :P802_DM_PARTY_ID,',
'                                 NULL,',
'                                 NULL,',
'                                 :P802_FILE_NAME,',
'                                 NULL,',
'                                 v_doc_name,',
'                                 NULL,',
'                                 :global_user,',
'                                 NULL,',
'                                 NULL,',
'                                 SYSDATE,',
'                                 NULL,',
'                                 NULL,',
'                                 NULL,',
'                                 NULL,',
'                                 NULL,',
'                                 v_mime_type,',
'                                 v_doc_name,',
'                                 NULL,',
'                                 ''D'',',
'                                 v_dir_name,',
'                                 :P802_DM_MODULE,',
'                                 NULL,',
'                                 NULL,',
'                                 NULL,',
'                                 ''N'',',
'                                 v_att_seq_no,',
'                                 :P802_DOC_TYPE,',
'                                 :P802_DM_SUB_VOU_TYPE,',
'                                 :P802_DM_VOU_PLNT_LOC,',
'                                 :P802_DM_REQ_DOC_NO,',
'                                 NVL (:P802_DM_REQ_DOC_REV, 0),',
'                                 :P802_DM_ENTITY,',
'                                 :P802_DM_CPC_ID,',
'                                 :P802_DM_TRN_DESC,',
'                                 TO_DATE (:P802_DM_RET_DATE,:global_rpt_date_mask),',
'                                 TO_DATE (:P802_DM_RET_DATE,:global_rpt_date_mask),',
'                                 TO_DATE (:P802_DM_DUE_DATE,:global_rpt_date_mask),',
'                                 :P802_DM_TAGS,',
'                                 :P802_DM_NOTES,',
'                                 :P802_DM_EMP_ID,',
'                                 v_file_size);',
'',
'                  IF v_image IS NOT NULL',
'                  THEN',
'                     proc_file_upload_apex (v_image, v_dir_name, v_doc_name);',
'                  END IF;',
'               END IF;',
'',
'               v_att_seq_no := v_att_seq_no + 1;',
'            END LOOP;',
'',
'            COMMIT;',
'         ELSE',
'            apex_error.add_error (',
'               p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'               p_display_location   => apex_error.c_inline_in_notification);',
'         END IF;',
'      END;',
'   ELSE',
'      UPDATE doc_mgmt',
'         SET dm_type_desc = :P802_DOC_TYPE,',
'             dm_due_date  = TO_DATE (:P802_DM_DUE_DATE,:global_rpt_date_mask),',
'			 dm_ret_date  = TO_DATE (:P802_DM_RET_DATE,:global_rpt_date_mask),',
'             dm_ret_end_date = TO_DATE (:P802_DM_RET_DATE,:global_rpt_date_mask),',
'			 dm_tags      = :P802_DM_TAGS,',
'             dm_notes     = :P802_DM_NOTES,',
'             dm_upd_by    = :global_user,',
'             dm_upd_ip_addr = :global_ip_addr,',
'             dm_upd_os_user = :global_os_user,',
'             dm_upd_date  = SYSDATE,',
'             dm_upd_emp_id = :global_emp_id',
'	   WHERE ROWID        = :P802_ROWID; ',
'       COMMIT;			 ',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6924552779212812008)
,p_internal_uid=>1445043979600891829
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3662111527180016332)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For  Upload File OLD'
,p_static_id=>'process-for-upload-file-old'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR C1',
'    IS',
'    SELECT dm_doc_no',
'      FROM doc_mgmt',
'     WHERE dm_bu = :global_bu',
'       AND dm_vou_pfx = :P802_DM_VOU_PFX',
'       AND dm_vou_no = :P802_DM_VOU_NO;',
'',
'    v_image        apex_application_temp_files.blob_content%TYPE;',
'    v_filename     apex_application_temp_files.filename%TYPE;',
'    v_doc_name     VARCHAR2 (200);',
'    v_doc_no       VARCHAR2 (15);',
'    v_mime_type    VARCHAR2 (200);',
'    v_att_seq_no   NUMBER (5);',
'    v_dir_name     VARCHAR2 (25);',
'    CR1            C1%ROWTYPE;',
'    v_file_size    VARCHAR2 (200);',
'BEGIN',
'    IF CR1.dm_doc_no IS NULL',
'    THEN',
'        SELECT NVL (MAX (TO_NUMBER (dm_doc_no)), 1000000000) + 1',
'          INTO v_doc_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu;',
'    END IF;',
'       ',
'    BEGIN',
'      SELECT APST_VOU_TYPE ',
'        INTO :P802_DM_VOU_TYPE',
'        FROM APPL_VOU_SUB_TYPES',
'       WHERE APST_BU =:global_bu    ',
'         AND APST_SUB_TYPE = :P802_DM_SUB_VOU_TYPE;',
'     EXCEPTION WHEN OTHERS THEN ',
'                NULL;',
'    END;   ',
'    IF :P802_DM_SUB_VOU_TYPE IN (''BE'',''BEP'')',
'    THEN',
'       :P802_DM_VOU_TYPE:=:P802_DM_SUB_VOU_TYPE;',
'       :P802_DM_MODULE  :=''CFG'';',
'    ELSIF :P802_DM_SUB_VOU_TYPE IN (''ADVP'')',
'    THEN',
'       :P802_DM_VOU_TYPE:=:P802_DM_SUB_VOU_TYPE;',
'       :P802_DM_MODULE  :=''APM''; ',
'    ELSIF :P802_DM_SUB_VOU_TYPE IN (''ARR'')',
'    THEN',
'       :P802_DM_VOU_TYPE:=:P802_DM_SUB_VOU_TYPE;',
'       :P802_DM_MODULE  :=''ARM'';     ',
'    END IF;  ',
'    IF :P802_DM_EMP_ID IS NOT NULL THEN',
'       :P802_DM_VOU_TYPE:=''E_ATT'';',
'       :P802_DM_SUB_VOU_TYPE:=''E_ATT'';',
'    END IF;',
'    IF :P802_DM_VOU_TYPE IS NOT NULL THEN  ',
'        BEGIN',
'            SELECT apt_module',
'              INTO :P802_DM_MODULE',
'              FROM appl_pfx_types',
'             WHERE apt_bu = :global_bu AND apt_pfx_type =:P802_DM_VOU_TYPE;            ',
'            EXCEPTION WHEN OTHERS THEN ',
'                NULL;',
'        END;       ',
'    END IF;',
'',
'    IF :P802_DM_PARTY_ID IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'    THEN',
'        SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'          INTO v_att_seq_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu',
'           AND dm_party_id = :P802_DM_PARTY_ID;',
'    END IF; ',
'',
'    IF :P802_DM_VOU_PLNT IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'    THEN',
'        SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'          INTO v_att_seq_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu',
'           AND dm_party_id = :P802_DM_VOU_PLNT;',
'    END IF;',
'',
'    IF :P802_DM_VOU_PLNT_LOC IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'    THEN',
'        SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'          INTO v_att_seq_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu',
'           AND dm_party_id = :P802_DM_VOU_PLNT_LOC;',
'    END IF;',
'',
'    IF :P802_DM_PROD_ID IS NOT NULL AND :P802_DM_VOU_NO IS NULL',
'    THEN',
'        SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'          INTO v_att_seq_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu',
'           AND dm_party_id = :P802_DM_PROD_ID;',
'    END IF;',
'',
'    IF :P802_DM_VOU_NO IS NOT NULL THEN',
'        SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'          INTO v_att_seq_no',
'          FROM doc_mgmt',
'         WHERE dm_bu = :global_bu           ',
'           AND (dm_vou_pfx = :P802_DM_VOU_PFX OR :P802_DM_VOU_PFX IS NULL)',
'           AND dm_vou_no = :P802_DM_VOU_NO;',
'    END IF;      ',
'',
'    IF :P802_FILE IS NOT NULL',
'    THEN',
'        SELECT blob_content,',
'               filename,',
'                  SUBSTR (filename, 1, INSTR (filename, ''.'') - 1)',
'               || ''(''',
'               || v_doc_no',
'               || '')''',
'               || ''.''',
'               || SUBSTR (filename,',
'                          INSTR (filename, ''.'', -1) + 1,',
'                          LENGTH (filename) - INSTR (filename, ''.'', -1)),',
'               mime_type,',
'               CASE ',
'                    WHEN DBMS_LOB.GETLENGTH(blob_content) < 1024 THEN ',
'                        DBMS_LOB.GETLENGTH(blob_content) || '' Bytes''',
'                    WHEN DBMS_LOB.GETLENGTH(blob_content) < 1024*1024 THEN ',
'                        ROUND(DBMS_LOB.GETLENGTH(blob_content)/1024,2) || '' KB''',
'                    ELSE ',
'                        ROUND(DBMS_LOB.GETLENGTH(blob_content)/1024/1024,2) || '' MB''',
'                END AS file_size_display',
'          INTO v_image,',
'               v_filename,',
'               v_doc_name,',
'               v_mime_type,',
'               v_file_size',
'          FROM apex_application_temp_files',
'         WHERE UPPER (name) = UPPER (:P802_FILE);',
'',
'    END IF;',
'',
'    IF :P802_DOC_TYPE IS NOT NULL',
'    THEN',
'        v_dir_name := ''APEX_ATTACH_DIR'';',
'',
'        INSERT INTO doc_mgmt (',
'                    dm_bu,',
'                    dm_doc_no,',
'                    dm_vou_level,',
'                    dm_vou_type,',
'                    dm_vou_plnt,',
'                    dm_vou_pfx,',
'                    dm_vou_no,',
'                    dm_vou_seq_no,',
'                    dm_party_type,',
'                    dm_party_id,',
'                    dm_prod_id,',
'                    dm_prod_rev,',
'                    dm_file_narr,',
'                    dm_doc_type,',
'                    dm_doc_name,',
'                    dm_blob,',
'                    dm_cre_by,',
'                    dm_cre_ip_addr,',
'                    dm_cre_os_user,',
'                    dm_cre_date,',
'                    dm_cre_emp_id,',
'                    dm_attach_id,',
'                    dm_bus_fun_id,',
'                    dm_block_name,',
'                    dm_table_name,',
'                    dm_mime_type,',
'                    dm_file_name,',
'                    dm_party_name,',
'                    dm_loc_type,',
'                    dm_attach_dir,',
'                    dm_module,',
'                    dm_vou_seq2_no,',
'                    dm_vou_seq3_no,',
'                    dm_vou_seq4_no,',
'                    dm_mail_flag,',
'                    dm_att_seq_no,',
'                    dm_type_desc,',
'                    dm_sub_vou_type,',
'                    dm_loc_id,',
'                    --dm_from_date,',
'                    --dm_to_date,',
'                    dm_req_doc_no,',
'                    dm_req_doc_rev,',
'                    dm_entity,',
'                    dm_cpc_id,',
'                    dm_trn_desc,',
'                    dm_ret_date,',
'                    dm_ret_end_date,',
'                    dm_due_date,',
'                    dm_tags,',
'                    dm_notes,',
'                    dm_emp_id,',
'                    dm_file_size',
'                    )',
'            VALUES (',
'                   :global_bu,',
'                   v_doc_no,',
'                   :P802_DM_VOU_LEVEL,',
'                   :P802_DM_VOU_TYPE,',
'                   :P802_DM_VOU_PLNT,',
'                   :P802_DM_VOU_PFX,',
'                   :P802_DM_VOU_NO,',
'                   :P802_DM_VOU_SEQ_NO,',
'                   NVL(:P802_DM_PARTY_TYPE,''S''),',
'                   :P802_DM_PARTY_ID,',
'                   NULL,',
'                   NULL,',
'                   :P802_FILE_NAME,',
'                   NULL,',
'                   v_doc_name,',
'                   NULL,',
'                   :global_user,',
'                   NULL,',
'                   NULL,',
'                   SYSDATE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   V_MIME_TYPE,',
'                   v_doc_name,--v_filename,',
'                   NULL,',
'                   ''D'',',
'                   v_dir_name,',
'                   :P802_DM_MODULE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   ''N'',',
'                   v_att_seq_no,',
'                   :P802_DOC_TYPE,',
'                   :P802_DM_SUB_VOU_TYPE,',
'                   :P802_DM_VOU_PLNT_LOC,',
'                   --TO_DATE(:P802_DM_DATE_FROM,:global_rpt_date_mask),',
'                   --TO_DATE(:P802_DM_DATE_TO,:global_rpt_date_mask),',
'                   :P802_DM_REQ_DOC_NO,',
'                   NVL(:P802_DM_REQ_DOC_REV,0),',
'                   :P802_DM_ENTITY,',
'                   :P802_DM_CPC_ID,',
'                   :P802_DM_TRN_DESC,',
'                   TO_DATE(:P802_DM_RET_DATE,:global_rpt_date_mask),',
'                   TO_DATE(:P802_DM_RET_DATE,:global_rpt_date_mask),',
'                   TO_DATE(:P802_DM_DUE_DATE,:global_rpt_date_mask),',
'                   :P802_DM_TAGS,',
'                   :P802_DM_NOTES,',
'                   :P802_DM_EMP_ID,',
'                   v_file_size',
'                   );',
'',
'        IF v_image IS NOT NULL',
'        THEN',
'            proc_file_upload_apex (v_image, v_dir_name, v_doc_name);',
'        END IF; ',
'',
'        COMMIT;',
'    ELSE',
'        apex_error.add_error (',
'            p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'            p_display_location   => apex_error.c_inline_in_notification);',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6924552779212812008)
,p_process_when_type=>'NEVER'
,p_internal_uid=>3590007754851829002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3790589914309573031)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process To Reinsert'
,p_static_id=>'process-to-reinsert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT dm_type_desc,',
'           dm_due_date,',
'           dm_ret_date,',
'           dm_ret_end_date,',
'           dm_tags,',
'           dm_notes',
'    INTO   :P802_DOC_TYPE,',
'           :P802_DM_DUE_DATE,',
'           :P802_DM_RET_DATE,',
'           :P802_DM_RET_DATE,',
'           :P802_DM_TAGS,',
'           :P802_DM_NOTES',
'    FROM   doc_mgmt',
'    WHERE  ROWID = :P802_ROWID;',
'EXCEPTION WHEN OTHERS THEN NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P802_ROWID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>3718486141981385701
);
wwv_flow_imp.component_end;
end;
/
