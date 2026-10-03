prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Legend'
,p_alias=>'LEGEND'
,p_page_mode=>'MODAL'
,p_step_title=>'Legend'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Button--noUI.t-Button--hot, .t-Button--noUI.t-Button--hot .t-Icon {',
'    color: #088def;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11187157272915559393)
,p_plug_name=>'Legend'
,p_static_id=>'legend'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11187157426592559394)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_button_name=>'add_button'
,p_static_id=>'add-button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11187157736741559398)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_button_name=>'Cancel_button'
,p_static_id=>'cancel-button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Close'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11187157964287559400)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_button_name=>'Delete_button'
,p_static_id=>'delete-button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Delete'
,p_icon_css_classes=>'fa-trash'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11524496336938386088)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_button_name=>'Line_Button'
,p_static_id=>'line-button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_icon_css_classes=>'fa-box-arrow-in-nw'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11187157556318559396)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_button_name=>'Save_button'
,p_static_id=>'save-button'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11187157521645559395)
,p_name=>'P3_ADD_NOTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<i> Hot - Yes , Style - Simple , Icon - fa-plus-circle </i></br><i>  : 1. Use the Button for Creation of New Record Like PR,PO,GRN</i>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11187157894815559399)
,p_name=>'P3_CANCEL_NOTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<i> - Use the Button to (Close) a Window</i>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11187158065081559401)
,p_name=>'P3_DELETE_NOTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<i> - Use the Button to Delete a Record (Single Row Delete)</i>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11524496432553386089)
,p_name=>'P3_LINE_NOTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<i> - Use the Item for Line Details</i>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11187157654139559397)
,p_name=>'P3_SAVE_NOTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11187157272915559393)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<i> - Use the Button for Save a Record While Creating PR,PO,GRN</i>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
