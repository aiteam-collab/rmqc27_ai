prompt --application/pages/page_9313131010
begin
--   Manifest
--     PAGE: 9313131010
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
 p_id=>9313131010
,p_name=>'Open CMR'
,p_alias=>'OPEN_CMR_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Open CMR'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'.ui-dialog-titlebar-close .ui-icon {',
'    --jui-icon-background-image: none;',
'    --jui-icon-size: var(--jui-dialog-title-close-icon-size, 0px);',
'    text-indent: 0;',
'}  ',
'',
'',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5978600129819917340)
,p_plug_name=>'Open CMR Receipt'
,p_static_id=>'open-cmr-receipt'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       CMTHD_BU,',
'       CMTHD_PLNT,',
'       CMTHD_REF_PLNT,',
'       CMTHD_DOC_DATE,',
'       CMTHD_DOC_NO,',
'       CMTHD_CUST_ID,',
'       ( SELECT suplr_name1',
'           FROM suppliers',
'          WHERE suplr_bu = :GLOBAL_BU',
'           AND suplr_suplr_id = CMTHD_CUST_ID)CMTHD_CUST_DESC,',
'       CMTHD_DC_DATE,',
'       CMTHD_DC_NO,',
'       CMTHD_REF,',
'       DECODE(CMTHD_STATUS,''N'',''Draft'')CMTHD_STATUS,',
'       DECODE(CMTHD_STATUS,''N'',''BLUE'')COLOR_STATUS,',
'     --  DECODE(CMTRHD_TYPE,''E'',''CMR (External)'',''I'',''CMR (Internal)'',''MR'',''Cust. Mat. Return'') CMTRHD_TYPE,',
'       DECODE(CMTHD_TYPE,''CR'',''CMR(EXTERNAL)'',''I'',''CMR(INTERNAL)'')CMTHD_TYPE,',
'       CMTHD_CUST_PO_NO,',
'       CMTHD_CUST_PO_DATE,',
'       CMTHD_CRE_BY,',
'       CMTHD_CRE_IP_ADDR,',
'       CMTHD_CRE_OS_USER,',
'       CMTHD_CRE_DATE,',
'       CMTHD_UPD_BY,',
'       CMTHD_UPD_IP_ADDR,',
'       CMTHD_UPD_OS_USER,',
'       CMTHD_UPD_DATE,',
'       CMTHD_CRE_EMP_ID,',
'       CMTHD_UPD_EMP_ID,',
'       CMTHD_PLNT_LOC_ID,',
'       CMTHD_PLNT_LOC_NAME,',
'       CMTHD_DOC_PFX',
'  FROM CUST_MAT_TRANS_HD',
' WHERE CMTHD_BU = :GLOBAL_BU',
'   AND CMTHD_STATUS =''N''',
' '))
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
 p_id=>wwv_flow_imp.id(5978600190989917341)
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
,p_internal_uid=>496638355446306313
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603270796917372)
,p_db_column_name=>'CMTHD_BU'
,p_display_order=>310
,p_column_identifier=>'C'
,p_column_label=>'Cmthd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015210296521036)
,p_db_column_name=>'CMTHD_CRE_BY'
,p_display_order=>450
,p_column_identifier=>'Q'
,p_column_label=>'Cmthd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015477597521039)
,p_db_column_name=>'CMTHD_CRE_DATE'
,p_display_order=>480
,p_column_identifier=>'T'
,p_column_label=>'Cmthd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015942339521044)
,p_db_column_name=>'CMTHD_CRE_EMP_ID'
,p_display_order=>530
,p_column_identifier=>'Y'
,p_column_label=>'Cmthd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015333618521037)
,p_db_column_name=>'CMTHD_CRE_IP_ADDR'
,p_display_order=>460
,p_column_identifier=>'R'
,p_column_label=>'Cmthd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015402216521038)
,p_db_column_name=>'CMTHD_CRE_OS_USER'
,p_display_order=>470
,p_column_identifier=>'S'
,p_column_label=>'Cmthd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603857543917378)
,p_db_column_name=>'CMTHD_CUST_DESC'
,p_display_order=>370
,p_column_identifier=>'I'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603828758917377)
,p_db_column_name=>'CMTHD_CUST_ID'
,p_display_order=>360
,p_column_identifier=>'H'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015098819521035)
,p_db_column_name=>'CMTHD_CUST_PO_DATE'
,p_display_order=>440
,p_column_identifier=>'P'
,p_column_label=>'Cmthd Cust Po Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014992712521034)
,p_db_column_name=>'CMTHD_CUST_PO_NO'
,p_display_order=>430
,p_column_identifier=>'O'
,p_column_label=>'Cmthd Cust Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014523170521029)
,p_db_column_name=>'CMTHD_DC_DATE'
,p_display_order=>380
,p_column_identifier=>'J'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY '
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014601342521030)
,p_db_column_name=>'CMTHD_DC_NO'
,p_display_order=>390
,p_column_identifier=>'K'
,p_column_label=>'Cmthd Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979016632693521050)
,p_db_column_name=>'CMTHD_DOC_DATE'
,p_display_order=>580
,p_column_identifier=>'AE'
,p_column_label=>'Cmthd Doc Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603683927917376)
,p_db_column_name=>'CMTHD_DOC_NO'
,p_display_order=>350
,p_column_identifier=>'G'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_format_mask=>'DD-MM-YYYY '
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979016422025521048)
,p_db_column_name=>'CMTHD_DOC_PFX'
,p_display_order=>570
,p_column_identifier=>'AC'
,p_column_label=>'Cmthd Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603352292917373)
,p_db_column_name=>'CMTHD_PLNT'
,p_display_order=>320
,p_column_identifier=>'D'
,p_column_label=>'Unit '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979016140015521046)
,p_db_column_name=>'CMTHD_PLNT_LOC_ID'
,p_display_order=>550
,p_column_identifier=>'AA'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979016262559521047)
,p_db_column_name=>'CMTHD_PLNT_LOC_NAME'
,p_display_order=>560
,p_column_identifier=>'AB'
,p_column_label=>'Loc. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014693848521031)
,p_db_column_name=>'CMTHD_REF'
,p_display_order=>400
,p_column_identifier=>'L'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603483427917374)
,p_db_column_name=>'CMTHD_REF_PLNT'
,p_display_order=>330
,p_column_identifier=>'E'
,p_column_label=>'Cmthd Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014814409521032)
,p_db_column_name=>'CMTHD_STATUS'
,p_display_order=>410
,p_column_identifier=>'M'
,p_column_label=>'Cmthd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979014923190521033)
,p_db_column_name=>'CMTHD_TYPE'
,p_display_order=>420
,p_column_identifier=>'N'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015629714521040)
,p_db_column_name=>'CMTHD_UPD_BY'
,p_display_order=>490
,p_column_identifier=>'U'
,p_column_label=>'Cmthd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015873130521043)
,p_db_column_name=>'CMTHD_UPD_DATE'
,p_display_order=>520
,p_column_identifier=>'X'
,p_column_label=>'Cmthd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979016045918521045)
,p_db_column_name=>'CMTHD_UPD_EMP_ID'
,p_display_order=>540
,p_column_identifier=>'Z'
,p_column_label=>'Cmthd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015727782521041)
,p_db_column_name=>'CMTHD_UPD_IP_ADDR'
,p_display_order=>500
,p_column_identifier=>'V'
,p_column_label=>'Cmthd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5979015801992521042)
,p_db_column_name=>'CMTHD_UPD_OS_USER'
,p_display_order=>510
,p_column_identifier=>'W'
,p_column_label=>'Cmthd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978603173383917371)
,p_db_column_name=>'COLOR_STATUS'
,p_display_order=>300
,p_column_identifier=>'B'
,p_column_label=>'Color Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5978602971047917369)
,p_db_column_name=>'ROWID'
,p_display_order=>280
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5979046668290536507)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4970849'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CMTHD_PLNT_LOC_ID:CMTHD_PLNT:CMTHD_DOC_NO:CMTHD_DC_DATE:CMTHD_TYPE:CMTHD_CUST_ID:CMTHD_CUST_DESC:CMTHD_REF'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5582758620197892529)
,p_plug_name=>'Open CMR Report'
,p_static_id=>'open-cmr-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       CMTRHD_BU,',
'       CMTRHD_PLNT,',
'       CMTRHD_REF_PLNT,',
'       CMTRHD_DOC_DATE,',
'       CMTRHD_DOC_NO,',
'       CMTRHD_CUST_ID,',
'       ( SELECT suplr_name1',
'           FROM suppliers',
'          WHERE suplr_bu = :GLOBAL_BU',
'           AND suplr_suplr_id = CMTRHD_CUST_ID)CMTRHD_CUST_DESC,',
'       CMTRHD_DC_DATE,',
'       CMTRHD_DC_NO,',
'       CMTRHD_REF,',
'       DECODE(CMTRHD_STATUS,''N'',''Draft'')CMTRHD_STATUS,',
'       DECODE(CMTRHD_STATUS,''N'',''BLUE'')COLOR_STATUS,',
'     --  DECODE(CMTRHD_TYPE,''E'',''CMR (External)'',''I'',''CMR (Internal)'',''MR'',''Cust. Mat. Return'') CMTRHD_TYPE,',
'       DECODE(CMTRHD_TYPE,''E'',''CMR(EXTERNAL)'',''I'',''CMR(INTERNAL)'',''MR'',''Customer Material Return'')CMTRHD_TYPE,',
'       CMTRHD_CUST_PO_NO,',
'       CMTRHD_CUST_PO_DATE,',
'       CMTRHD_CRE_BY,',
'       CMTRHD_CRE_IP_ADDR,',
'       CMTRHD_CRE_OS_USER,',
'       CMTRHD_CRE_DATE,',
'       CMTRHD_UPD_BY,',
'       CMTRHD_UPD_IP_ADDR,',
'       CMTRHD_UPD_OS_USER,',
'       CMTRHD_UPD_DATE,',
'       CMTRHD_CRE_EMP_ID,',
'       CMTRHD_UPD_EMP_ID,',
'       CMTRHD_PLNT_LOC_ID,',
'       CMTRHD_PLNT_LOC_NAME,',
'       CMTRHD_TAX_FLAG,',
'       CMTRHD_DOC_PFX',
'  FROM CUST_MAT_TRANS_RETURN_HD',
' WHERE CMTRHD_BU = :GLOBAL_BU',
'   AND CMTRHD_STATUS =''N''',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(5582758718373892530)
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
,p_internal_uid=>100796882830281502
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582758819643892531)
,p_db_column_name=>'CMTRHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Cmtrhd Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760043551892544)
,p_db_column_name=>'CMTRHD_CRE_BY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Cmtrhd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760388780892547)
,p_db_column_name=>'CMTRHD_CRE_DATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Cmtrhd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760925061892552)
,p_db_column_name=>'CMTRHD_CRE_EMP_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Cmtrhd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760213971892545)
,p_db_column_name=>'CMTRHD_CRE_IP_ADDR'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Cmtrhd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760275039892546)
,p_db_column_name=>'CMTRHD_CRE_OS_USER'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Cmtrhd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761799477892561)
,p_db_column_name=>'CMTRHD_CUST_DESC'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759266750892536)
,p_db_column_name=>'CMTRHD_CUST_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759964619892543)
,p_db_column_name=>'CMTRHD_CUST_PO_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Cmtrhd Cust Po Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759925317892542)
,p_db_column_name=>'CMTRHD_CUST_PO_NO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Cmtrhd Cust Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759344720892537)
,p_db_column_name=>'CMTRHD_DC_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cmtrhd Dc Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759490955892538)
,p_db_column_name=>'CMTRHD_DC_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Cmtrhd Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759051394892534)
,p_db_column_name=>'CMTRHD_DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759137329892535)
,p_db_column_name=>'CMTRHD_DOC_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761421154892557)
,p_db_column_name=>'CMTRHD_DOC_PFX'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Doc. Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582758842972892532)
,p_db_column_name=>'CMTRHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761050473892554)
,p_db_column_name=>'CMTRHD_PLNT_LOC_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761201379892555)
,p_db_column_name=>'CMTRHD_PLNT_LOC_NAME'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Cmtrhd Plnt Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759599615892539)
,p_db_column_name=>'CMTRHD_REF'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582758943841892533)
,p_db_column_name=>'CMTRHD_REF_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Cmtrhd Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759645334892540)
,p_db_column_name=>'CMTRHD_STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style ="color:#COLOR_STATUS#; font-weight:bold;">#CMTRHD_STATUS#</div>',
'',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761247444892556)
,p_db_column_name=>'CMTRHD_TAX_FLAG'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Cmtrhd Tax Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582759782990892541)
,p_db_column_name=>'CMTRHD_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'CMR Doc.Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760467978892548)
,p_db_column_name=>'CMTRHD_UPD_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Cmtrhd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760802781892551)
,p_db_column_name=>'CMTRHD_UPD_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Cmtrhd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760987811892553)
,p_db_column_name=>'CMTRHD_UPD_EMP_ID'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Cmtrhd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760625120892549)
,p_db_column_name=>'CMTRHD_UPD_IP_ADDR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Cmtrhd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582760660816892550)
,p_db_column_name=>'CMTRHD_UPD_OS_USER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cmtrhd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761993694892563)
,p_db_column_name=>'COLOR_STATUS'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Color Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5582761469727892558)
,p_db_column_name=>'ROWID'
,p_display_order=>280
,p_is_primary_key=>'Y'
,p_column_identifier=>'AB'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5583493882627149660)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1015321'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'CMTRHD_PLNT_LOC_ID:CMTRHD_PLNT:CMTRHD_DOC_PFX:CMTRHD_DOC_NO:CMTRHD_DOC_DATE:CMTRHD_TYPE:CMTRHD_CUST_ID:CMTRHD_CUST_DESC:CMTRHD_REF'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5995965692011053040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5978600129819917340)
,p_button_name=>'Close_Btn'
,p_static_id=>'close-btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5995965761436053041)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5995965692011053040)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5995965918825053042)
,p_event_id=>wwv_flow_imp.id(5995965761436053041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
