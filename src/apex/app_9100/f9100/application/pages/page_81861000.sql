prompt --application/pages/page_81861000
begin
--   Manifest
--     PAGE: 81861000
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
 p_id=>81861000
,p_name=>'Employee Master'
,p_alias=>'EMPLOYEE-MASTER1'
,p_step_title=>'Employee Master'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(11124861197562318725)
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11150768714096991498)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EMPLOYEES'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11150769070997991498)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:8186100001:&SESSION.::&DEBUG.:RP:P8186100001_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>5006927041591470237
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150769574967991501)
,p_db_column_name=>'EMP_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150774345413991504)
,p_db_column_name=>'EMP_CRE_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Emp Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150775601023991504)
,p_db_column_name=>'EMP_CRE_DATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Emp Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150774749024991504)
,p_db_column_name=>'EMP_CRE_IP_ADDR'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Emp Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150775131871991504)
,p_db_column_name=>'EMP_CRE_OS_USER'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Emp Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150772404205991503)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Emp Dob'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150769944559991501)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Emp Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150770370599991501)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Emp First Name1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150771592450991501)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Emp Gender'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150773133853991503)
,p_db_column_name=>'EMP_LAST_PROC_PERIOD'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Emp Last Proc Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150772803812991503)
,p_db_column_name=>'EMP_LAST_PROC_YEAR'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Emp Last Proc Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150772004849991503)
,p_db_column_name=>'EMP_MARITAL_STATUS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Emp Marital Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150770811976991501)
,p_db_column_name=>'EMP_MIDDLE_NAME1'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Emp Middle Name1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150773936244991503)
,p_db_column_name=>'EMP_NLITY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Emp Nlity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150773580923991503)
,p_db_column_name=>'EMP_RELIGION'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Emp Religion'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150771209186991501)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Emp Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150775954256991504)
,p_db_column_name=>'EMP_UPD_BY'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Emp Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150777190598991506)
,p_db_column_name=>'EMP_UPD_DATE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Emp Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150776370115991506)
,p_db_column_name=>'EMP_UPD_IP_ADDR'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Emp Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150776814052991506)
,p_db_column_name=>'EMP_UPD_OS_USER'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Emp Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150769223278991498)
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
 p_id=>wwv_flow_imp.id(11150778323353991932)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50069363'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:EMP_BU:EMP_EMP_ID:EMP_FIRST_NAME1:EMP_MIDDLE_NAME1:EMP_START_DATE:EMP_GENDER:EMP_MARITAL_STATUS:EMP_DOB:EMP_LAST_PROC_YEAR:EMP_LAST_PROC_PERIOD:EMP_RELIGION:EMP_NLITY:EMP_CRE_BY:EMP_CRE_IP_ADDR:EMP_CRE_OS_USER:EMP_CRE_DATE:EMP_UPD_BY:EMP_UPD_IP'
||'_ADDR:EMP_UPD_OS_USER:EMP_UPD_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11150777694584991506)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11150768714096991498)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:8186100001:&SESSION.::&DEBUG.:8186100001'
);
wwv_flow_imp.component_end;
end;
/
