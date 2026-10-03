prompt --application/pages/page_3671135
begin
--   Manifest
--     PAGE: 3671135
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
 p_id=>3671135
,p_name=>'Tariff Code'
,p_alias=>'TARIFF-CODE1'
,p_step_title=>'Tariff Code'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11726006460726876409)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'HS_TARIFF_CODES'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11726006851109876409)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:367113501:&SESSION.::&DEBUG.:RP:P367113501_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>5582164821703355148
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726007422180876411)
,p_db_column_name=>'HTC_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Htc Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726008604732876412)
,p_db_column_name=>'HTC_CRE_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Htc Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726009744028876412)
,p_db_column_name=>'HTC_CRE_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Htc Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726011772074876414)
,p_db_column_name=>'HTC_CRE_EMP_ID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Htc Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726008965116876412)
,p_db_column_name=>'HTC_CRE_IP_ADDR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Htc Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726009357844876412)
,p_db_column_name=>'HTC_CRE_OS_USER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Htc Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726008145209876411)
,p_db_column_name=>'HTC_TARIFF_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Htc Tariff Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726007810148876411)
,p_db_column_name=>'HTC_TARIFF_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Htc Tariff Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726010143391876412)
,p_db_column_name=>'HTC_UPD_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Htc Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726011330027876414)
,p_db_column_name=>'HTC_UPD_DATE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Htc Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726012192513876414)
,p_db_column_name=>'HTC_UPD_EMP_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Htc Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726010606225876412)
,p_db_column_name=>'HTC_UPD_IP_ADDR'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Htc Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726011009647876414)
,p_db_column_name=>'HTC_UPD_OS_USER'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Htc Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11726007022939876411)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11726012633140876415)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11726006460726876409)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:367113501:&SESSION.::&DEBUG.:367113501'
);
wwv_flow_imp.component_end;
end;
/
