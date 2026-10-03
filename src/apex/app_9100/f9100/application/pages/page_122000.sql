prompt --application/pages/page_122000
begin
--   Manifest
--     PAGE: 122000
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
 p_id=>122000
,p_name=>'Open Debit'
,p_alias=>'OPEN-DEBIT'
,p_step_title=>'Open Debit'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table td {',
'    white-space: nowrap;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5529476118636019729)
,p_plug_name=>'Debit Note'
,p_static_id=>'debit-note'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       sihd_bu,',
'       sihd_plnt_loc_id,',
'       sihd_plant,',
'       sihd_type,',
'       sihd_doc_no,',
'       sihd_doc_date,',
'       sihd_inv_date,',
'       sihd_inv_pfx,',
'       sihd_inv_no,',
'       sihd_cust_id,',
'       sihd_cust_name,',
'       DECODE(sihd_status,''N'',''Draft'',''E'',''Entry Completed'',''I'',''Invoiced'',''C'',''Cancelled'')Status,',
'       sihd_sub_vou_type,',
'       sihd_cre_by,',
'       sihd_cre_emp_id,',
'       sihd_cre_ip_addr,',
'       sihd_cre_os_user,',
'       sihd_cre_date,',
'       sihd_rtn_goods_dtls,',
'       sihd_rtn_source',
'  FROM sales_invoices_hd,sales_invoices_ln',
' WHERE sihd_bu =:GLOBAL_bu',
'   AND sihd_bu = siln_bu',
'   AND sihd_doc_no = siln_doc_no',
'   AND sihd_status = ''N''',
'   AND sihd_type =''PR'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(5529476219906019730)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47514384362408702
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476295614019731)
,p_db_column_name=>'SIHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sihd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477561624019744)
,p_db_column_name=>'SIHD_CRE_BY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sihd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529478013375019748)
,p_db_column_name=>'SIHD_CRE_DATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Sihd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477645123019745)
,p_db_column_name=>'SIHD_CRE_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Sihd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477813008019746)
,p_db_column_name=>'SIHD_CRE_IP_ADDR'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Sihd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477919702019747)
,p_db_column_name=>'SIHD_CRE_OS_USER'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Sihd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477217689019740)
,p_db_column_name=>'SIHD_CUST_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477334200019741)
,p_db_column_name=>'SIHD_CUST_NAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476834697019736)
,p_db_column_name=>'SIHD_DOC_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476733444019735)
,p_db_column_name=>'SIHD_DOC_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476898901019737)
,p_db_column_name=>'SIHD_INV_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sihd Inv Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477056819019739)
,p_db_column_name=>'SIHD_INV_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'DN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476974542019738)
,p_db_column_name=>'SIHD_INV_PFX'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Inv. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476492490019733)
,p_db_column_name=>'SIHD_PLANT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476385064019732)
,p_db_column_name=>'SIHD_PLNT_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529478047335019749)
,p_db_column_name=>'SIHD_RTN_GOODS_DTLS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Sihd Rtn Goods Dtls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529478173295019750)
,p_db_column_name=>'SIHD_RTN_SOURCE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Sihd Rtn Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529477458682019743)
,p_db_column_name=>'SIHD_SUB_VOU_TYPE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Sihd Sub Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529476546868019734)
,p_db_column_name=>'SIHD_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5529478294209019751)
,p_db_column_name=>'STATUS'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5529509814385052346)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'475480'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SIHD_PLNT_LOC_ID:SIHD_PLANT:SIHD_TYPE:SIHD_DOC_NO:SIHD_DOC_DATE:SIHD_INV_PFX:SIHD_INV_NO:SIHD_CUST_ID:SIHD_CUST_NAME'
);
wwv_flow_imp.component_end;
end;
/
