prompt --application/pages/page_11613103801
begin
--   Manifest
--     PAGE: 11613103801
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
 p_id=>11613103801
,p_name=>'Vehicle Rent Calculation'
,p_alias=>'VEHICLE-RENT-CALCULATION1'
,p_step_title=>'Vehicle Rent Calculation'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9490105897055656202)
,p_plug_name=>'Vehicle Rent Calculation'
,p_static_id=>'vehicle-rent-calculation'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DAIRY_PER_VEH_RENT_CALC_HD'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Vehicle Rent Calculation'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9490105923292656202)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4008144087749045174
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486090609756642668)
,p_db_column_name=>'DPVRCH_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Dpvrch Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486093341176642676)
,p_db_column_name=>'DPVRCH_CRE_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Dpvrch Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486094938460642679)
,p_db_column_name=>'DPVRCH_CRE_DATE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Dpvrch Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486094545547642678)
,p_db_column_name=>'DPVRCH_CRE_EMP_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Dpvrch Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486093804609642676)
,p_db_column_name=>'DPVRCH_CRE_IP_ADDR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Dpvrch Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486094169492642676)
,p_db_column_name=>'DPVRCH_CRE_OS_USER'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Dpvrch Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486091822862642673)
,p_db_column_name=>'DPVRCH_DOC_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486091430610642673)
,p_db_column_name=>'DPVRCH_DOC_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486092148911642674)
,p_db_column_name=>'DPVRCH_EFF_FROM_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Date From'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486092582086642674)
,p_db_column_name=>'DPVRCH_EFF_TO_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Date To'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486090976172642673)
,p_db_column_name=>'DPVRCH_PLNT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Chilling Centre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486092943934642674)
,p_db_column_name=>'DPVRCH_REF'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Ref.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486097400922642693)
,p_db_column_name=>'DPVRCH_STATUS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486095428696642679)
,p_db_column_name=>'DPVRCH_UPD_BY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Dpvrch Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486096950324642693)
,p_db_column_name=>'DPVRCH_UPD_DATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Dpvrch Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486096586798642692)
,p_db_column_name=>'DPVRCH_UPD_EMP_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Dpvrch Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486095774192642679)
,p_db_column_name=>'DPVRCH_UPD_IP_ADDR'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Dpvrch Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7486096203953642679)
,p_db_column_name=>'DPVRCH_UPD_OS_USER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Dpvrch Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9490131898953665005)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20040419'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DPVRCH_PLNT:DPVRCH_EFF_FROM_DATE:DPVRCH_EFF_TO_DATE:DPVRCH_REF:DPVRCH_DOC_NO:DPVRCH_DOC_DATE:DPVRCH_STATUS'
);
wwv_flow_imp.component_end;
end;
/
