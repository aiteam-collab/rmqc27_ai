prompt --application/pages/page_93131282
begin
--   Manifest
--     PAGE: 93131282
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
 p_id=>93131282
,p_name=>'Mod. Trans.'
,p_alias=>'MOD-TRANS'
,p_step_title=>'Mod. Trans.'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7587943729944368166)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>5
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DMTH_BU,',
'       DMTH_DOC_NO,',
'       TO_DATE(DMTH_UPTO_DATE,:GLOBAL_DATE_FORMAT)DMTH_UPTO_DATE,',
'       DMTH_CRE_BY,',
'       DMTH_CRE_IP_ADDR,',
'       DMTH_CRE_OS_USER,',
'       DMTH_CRE_DATE,',
'       DMTH_UPD_BY,',
'       DMTH_UPD_IP_ADDR,',
'       DMTH_UPD_OS_USER,',
'       DMTH_UPD_DATE,',
'       DMTH_CRE_EMP_ID,',
'       DMTH_UPD_EMP_ID',
'  from DLY_MOD_TRANS_HD',
' where DMTH_BU = :GLOBAL_bu',
' order by To_Number(DMTH_DOC_NO) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(7587943744680368167)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2105981909136757139
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587943890818368168)
,p_db_column_name=>'DMTH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Dmth Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944168924368171)
,p_db_column_name=>'DMTH_CRE_BY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dmth Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944529918368174)
,p_db_column_name=>'DMTH_CRE_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dmth Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7589850328927850629)
,p_db_column_name=>'DMTH_CRE_EMP_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Dmth Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944253935368172)
,p_db_column_name=>'DMTH_CRE_IP_ADDR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Dmth Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944339490368173)
,p_db_column_name=>'DMTH_CRE_OS_USER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dmth Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587943950794368169)
,p_db_column_name=>'DMTH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:931312821:&SESSION.::&DEBUG.::P931312821_ROWID:#ROWID#'
,p_column_linktext=>'#DMTH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944547126368175)
,p_db_column_name=>'DMTH_UPD_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dmth Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944856768368178)
,p_db_column_name=>'DMTH_UPD_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dmth Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7589850366357850630)
,p_db_column_name=>'DMTH_UPD_EMP_ID'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Dmth Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944729364368176)
,p_db_column_name=>'DMTH_UPD_IP_ADDR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Dmth Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944818049368177)
,p_db_column_name=>'DMTH_UPD_OS_USER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dmth Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7587944091795368170)
,p_db_column_name=>'DMTH_UPTO_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7589850501929850631)
,p_db_column_name=>'ROWID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7589860508809852567)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21078987'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'DMTH_BU:DMTH_DOC_NO:DMTH_UPTO_DATE:DMTH_CRE_BY:DMTH_CRE_IP_ADDR:DMTH_CRE_OS_USER:DMTH_CRE_DATE:DMTH_UPD_BY:DMTH_UPD_IP_ADDR:DMTH_UPD_OS_USER:DMTH_UPD_DATE:DMTH_CRE_EMP_ID:DMTH_UPD_EMP_ID:ROWID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7589850546530850632)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7587943729944368166)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:931312821:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp.component_end;
end;
/
