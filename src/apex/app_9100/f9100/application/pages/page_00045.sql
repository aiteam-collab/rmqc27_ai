prompt --application/pages/page_00045
begin
--   Manifest
--     PAGE: 00045
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
 p_id=>45
,p_name=>'SMS Send'
,p_alias=>'SMS-SEND1'
,p_step_title=>'SMS Send'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5981433492570966078)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5990678332414851576)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  SOH_BU,',
'       SOH_DOC_NO,',
'       SOH_DOC_DATE,',
'       SOH_SNDR_MOB_NO,',
'       SOH_BODY,',
'       SOH_USER_ID,',
'       SOH_EMP_ID,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_STATUS,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO',
'  from SMS_OUTBOX_VW',
'  where sorl_bu  = :global_bu',
'  '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(5990721651437913731)
,p_region_id=>wwv_flow_imp.id(5990678332414851576)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'SOH_EMP_ID'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SOH_BODY'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'SORL_BU'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5990690026597851593)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5990678332414851576)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:46'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5990721489576913729)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5981433492570966078)
,p_button_name=>'Send'
,p_static_id=>'send'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Send'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5990721623427913730)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5981433492570966078)
,p_button_name=>'Unsend'
,p_static_id=>'unsend'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Unsend'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp.component_end;
end;
/
