prompt --application/pages/page_23613059818
begin
--   Manifest
--     PAGE: 23613059818
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
 p_id=>23613059818
,p_name=>'Whatsapp Send / Unsend'
,p_alias=>'WHATSAPP-SEND-UNSEND'
,p_step_title=>'Whatsapp Send / Unsend'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'   background: #00b1e7 !important;',
'}',
'.a-IRR-table {',
'   border-collapse: collapse;',
'   table-layout: auto;',
'   border-spacing: 0;',
'   white-space: nowrap;',
'   word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'   overflow: auto !important;',
' }'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7111537562702663153)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7111537884582663156)
,p_plug_name=>'Whatsapp'
,p_static_id=>'whatsapp'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wod_bu,',
'       wod_seq_no,',
'       wod_date,',
'       wod_userid,',
'       waul_benf_type,',
'       waul_benf_id,',
'       waul_benf_name,',
'       wod_country_code,',
'       wod_mobile_no,',
'       wod_template_id,',
'       wod_template_desc,',
'       wod_message,',
'       wod_status,',
'       wod_rqst_json,',
'       wod_response,',
'       wod_sel_flag',
'  FROM whatsapp_outbox_det, ',
'       whatsapp_api_user_list',
' WHERE wod_bu     = waul_bu ',
'   AND wod_userid = waul_userid',
'   AND wod_bu     = :GLOBAL_bu',
'   AND wod_seq_no = :P23613059818_SEQ_NO OR :P23613059818_SEQ_NO IS NULL;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Whatsapp'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7111537955642663157)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1629576120099052129
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538545528663163)
,p_db_column_name=>'WAUL_BENF_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Waul Benf Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538725278663164)
,p_db_column_name=>'WAUL_BENF_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Waul Benf Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538443242663162)
,p_db_column_name=>'WAUL_BENF_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Waul Benf Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538046306663158)
,p_db_column_name=>'WOD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wod Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538766519663165)
,p_db_column_name=>'WOD_COUNTRY_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wod Country Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538258325663160)
,p_db_column_name=>'WOD_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wod Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539180145663169)
,p_db_column_name=>'WOD_MESSAGE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wod Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538921084663166)
,p_db_column_name=>'WOD_MOBILE_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wod Mobile No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539519991663172)
,p_db_column_name=>'WOD_RESPONSE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wod Response'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539432593663171)
,p_db_column_name=>'WOD_RQST_JSON'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wod Rqst Json'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539591120663173)
,p_db_column_name=>'WOD_SEL_FLAG'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wod Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538163316663159)
,p_db_column_name=>'WOD_SEQ_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wod Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539252720663170)
,p_db_column_name=>'WOD_STATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wod Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539068858663168)
,p_db_column_name=>'WOD_TEMPLATE_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wod Template Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111539029805663167)
,p_db_column_name=>'WOD_TEMPLATE_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wod Template Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111538384941663161)
,p_db_column_name=>'WOD_USERID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Wod Userid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7115946545147885385)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16339848'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WOD_BU:WOD_SEQ_NO:WOD_DATE:WOD_USERID:WAUL_BENF_TYPE:WAUL_BENF_ID:WAUL_BENF_NAME:WOD_COUNTRY_CODE:WOD_MOBILE_NO:WOD_TEMPLATE_ID:WOD_TEMPLATE_DESC:WOD_MESSAGE:WOD_STATUS:WOD_RQST_JSON:WOD_RESPONSE:WOD_SEL_FLAG'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111537675013663154)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7111537562702663153)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7111537792101663155)
,p_branch_name=>'Go To Find'
,p_branch_action=>'f?p=&APP_ID.:23613059817:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7111537675013663154)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7111539733163663174)
,p_name=>'P23613059818_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7111537884582663156)
,p_prompt=>'Seq No'
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
wwv_flow_imp.component_end;
end;
/
