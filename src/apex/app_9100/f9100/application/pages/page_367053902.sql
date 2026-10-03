prompt --application/pages/page_367053902
begin
--   Manifest
--     PAGE: 367053902
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
 p_id=>367053902
,p_name=>'Overhead Rate'
,p_alias=>'OVERHEAD-RATE1'
,p_step_title=>'Overhead Rate'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5890292584940340651)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MFG_RES_OH_RATES'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5890293019977340651)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:367053903:&SESSION.::&DEBUG.:RP:P367053903_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>408331184433729623
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890293469863340654)
,p_db_column_name=>'MROH_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Mroh Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890295920930340657)
,p_db_column_name=>'MROH_CRE_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Mroh Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890297078987340657)
,p_db_column_name=>'MROH_CRE_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Mroh Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890299079062340660)
,p_db_column_name=>'MROH_CRE_EMP_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Mroh Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890296309956340657)
,p_db_column_name=>'MROH_CRE_IP_ADDR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Mroh Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890296663511340657)
,p_db_column_name=>'MROH_CRE_OS_USER'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Mroh Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890294704250340656)
,p_db_column_name=>'MROH_EFF_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Mroh Eff Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890295455833340656)
,p_db_column_name=>'MROH_OH_RATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Mroh Oh Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890293884612340654)
,p_db_column_name=>'MROH_PLNT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Mroh Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890294292380340654)
,p_db_column_name=>'MROH_RES_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Mroh Res Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890295067395340656)
,p_db_column_name=>'MROH_SUB_ELMNT_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Mroh Sub Elmnt Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890297457937340659)
,p_db_column_name=>'MROH_UPD_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Mroh Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890298641430340660)
,p_db_column_name=>'MROH_UPD_DATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Mroh Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890299505084340660)
,p_db_column_name=>'MROH_UPD_EMP_ID'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Mroh Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890297900088340659)
,p_db_column_name=>'MROH_UPD_IP_ADDR'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Mroh Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890298302362340659)
,p_db_column_name=>'MROH_UPD_OS_USER'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Mroh Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5890293047642340651)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5890302460493342751)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4083407'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:MROH_BU:MROH_PLNT:MROH_RES_ID:MROH_EFF_DATE:MROH_SUB_ELMNT_ID:MROH_OH_RATE:MROH_CRE_BY:MROH_CRE_IP_ADDR:MROH_CRE_OS_USER:MROH_CRE_DATE:MROH_UPD_BY:MROH_UPD_IP_ADDR:MROH_UPD_OS_USER:MROH_UPD_DATE:MROH_CRE_EMP_ID:MROH_UPD_EMP_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5889510444363411165)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5890292584940340651)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:3670539:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5890299947163340662)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5890292584940340651)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Overhead Rate'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:367053903:&SESSION.::&DEBUG.:367053903::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp.component_end;
end;
/
