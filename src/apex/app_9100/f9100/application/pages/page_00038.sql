prompt --application/pages/page_00038
begin
--   Manifest
--     PAGE: 00038
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
 p_id=>38
,p_name=>'Apex Template'
,p_alias=>'WEB-APEX-TEMPLATE1'
,p_step_title=>'APEX TEMPLATE'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6192438113107552074)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>'select "ROWID","WAT_DOC_NAME",sys.dbms_lob.getlength("WAT_ATTACH")"WAT_ATTACH","WAT_CRE_BY","WAT_CRE_DATE","WAT_UPD_BY","WAT_UPD_DATE","WAT_MIME_TYPE","WAT_FILE_NAME","WAT_DOC_NO"from "WEB_APEX_TEMPLATE"'
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6192438499057552075)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:P39_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>320096166875700518
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192438616615552075)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192439819092552078)
,p_db_column_name=>'WAT_ATTACH'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Attachment'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DOWNLOAD:WEB_APEX_TEMPLATE:WAT_ATTACH:ROWID::WAT_MIME_TYPE:WAT_FILE_NAME:::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192440177026552078)
,p_db_column_name=>'WAT_CRE_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Wat Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192440600077552078)
,p_db_column_name=>'WAT_CRE_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Wat Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192439349632552078)
,p_db_column_name=>'WAT_DOC_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc. Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192442585399552083)
,p_db_column_name=>'WAT_DOC_NO'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192442137087552083)
,p_db_column_name=>'WAT_FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192441802890552082)
,p_db_column_name=>'WAT_MIME_TYPE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192441015504552080)
,p_db_column_name=>'WAT_UPD_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Wat Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192441350898552080)
,p_db_column_name=>'WAT_UPD_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wat Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6192443731794553527)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3201014'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WAT_DOC_NO:WAT_DOC_NAME:WAT_ATTACH:WAT_MIME_TYPE:WAT_FILE_NAME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192443036843552083)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6192438113107552074)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:39'
);
wwv_flow_imp.component_end;
end;
/
