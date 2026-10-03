prompt --application/pages/page_00112
begin
--   Manifest
--     PAGE: 00112
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
 p_id=>112
,p_name=>'Expiry Stock'
,p_alias=>'EXPIRY-STOCK'
,p_page_mode=>'MODAL'
,p_step_title=>'Expiry Stock'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8245120890388864831)
,p_plug_name=>'Expiry Stock'
,p_static_id=>'expiry-stock'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STTR_BU,',
'       DECODE(STTR_SOURCE_DOC,',
'      ''DE'', ''DE'',',
'      ''DR'',''DER'',',
'      ''GI'',''GI'',',
'      ''IS'',''IS'',',
'      ''IC'',''IC'',',
'      ''MCM'',''MCM'',',
'      ''MI'',''MI'',',
'      ''MW'',''MIW'',',
'      ''MR'',''MR'',',
'      ''ME'',''MRTN'',',
'      ''PO'',''PO'',',
'      ''GRN'',''GRN(PR)'',',
'      ''PR'',''PR'',',
'      ''RJN'',''PRTN'',',
'      ''QC'',''QC'',',
'      ''RE'',''RRE'',',
'      ''RL'',''RFR'',',
'      ''RRN'',''RWPO'',',
'      ''SO'',''SO'',',
'      ''SR'',''SRTN'',',
'      ''MC'',''SCR'',',
'      ''MRS'',''SCRRTN'',',
'      ''SS'',''SCS'',',
'      ''SE'',''SE'',',
'      ''FE'',''SOR'',',
'      ''SW'',''SSW'',',
'      ''TP'',''STS'',',
'      ''SA'',''SA'',',
'      ''ST'',''ST'',',
'      ''SRN'',''GRN(SC)'',',
'      ''NS'',''NGS'',',
'      ''RD'',''ERD'',',
'      ''LMS'',''LMS'',',
'      ''LO'',''LO'',',
'      ''LR'',''LR'',',
'      ''TPL'',''TPL'',',
'      ''SMC'',''SMC'',',
'      ''PMC'',''PMC'',',
'      ''RMC'',''RMC'',',
'      ''SFR'',''SFR'',',
'      ''RR'',''RR'',',
'      ''CMR'',''CMR'',',
'      ''CRT'',''CRT'',',
'      ''LI'',''LI'',',
'      ''FRM'',''FRM'',',
'      ''LE'',''LIU'',',
'      ''CR'',''PK'',',
'      ''RP'',''RP'',',
'      ''RB'',''RB'',',
'      ''FS'',''FS'',',
'      ''CRR'',''PKR'',',
'      ''RPR'',''RPR'',',
'      ''SP'',''SP'',',
'      ''SEG'',''SEG'',',
'      ''DMMC'',''DMMC'',',
'      ''STMC'',''STMC'',',
'      ''RRMC'',''RRMC'',',
'      ''RAMC'',''RAMC'',',
'      ''SM'',''SM'',',
'      ''REC'',''REC'',',
'      ''UTC'',''UTC'',',
'      ''CFC'',''CFC'',',
'      ''DRC'',''DRC'',',
'      ''CPC'',''CPC'',',
'      ''MMC'',''MMC'',',
'      ''RER'',''RER'',',
'      ''UTR'',''UTR'',',
'      ''CFR'',''CFR'',',
'      ''DRR'',''DRR'',',
'      ''CPR'',''CPR'',',
'      ''MMR'',''MMR'',',
'      ''SSA'',''SSA'',',
'      ''PPC'',''PPC'',',
'      ''PDC'',''PDC'',',
'      ''MLC'',''MLC'',',
'      ''PPR'',''PPR'',',
'      ''PDR'',''PDR'',',
'      ''CPM'',''CPM'',',
'      ''FUE'',''FUL'',',
'      ''APM'',''APM'',',
'      ''EGRN'',''EGG(GRN)'',',
'      ''ESIV'',''EGG(SI)'', ',
'      ''ESIVR'',''EGG(SIR)'',',
'      ''SFVR'',''Spare(FVR)'',',
'      ''BSI'',''BSI'',',
'      ''ESR'',''ESR'',',
'      ''BRI'',''BRI'',',
'      ''ERR'',''ERR'',',
'      ''BWI'',''BWI'',',
'      ''EWR'',''EWR'',',
'      ''CSR'',''CSR'',',
'      ''CDR'',''CDR'',',
'      ''EDR'',''EDR'',',
'      ''NT'',''NT'',',
'      ''NO'',''NO'',',
'      ''IR'',''IR'',',
'      ''RDC'',''RDC'',',
'      ''DMC'',''DMC'',',
'      ''DMCC'',''DMCC'',',
'      ''DMT'',''DMT'',',
'      ''DMR'',''DMR'',',
'      ''DCC'',''DCC'',',
'      ''DCT'',''DCT'',',
'      ''DCR'',''DCR'',',
'      ''DSA'',''DSA'',',
'      ''DCMC'',''DCMC'',',
'      ''DCMR'',''DCMR'',',
'      ''SIG'',''SALES(GENERAL)'',',
'      ''SIT'',''STOCK TRANSFER'',',
'      ''SISCR'',''SALES(SCRAP)'',',
'      ''SIFA'',''SALES(FIXED ASSETS)'',',
'      ''SIDE'',''SALES(DEMO / EXHN.)'',',
'      ''SIFS'',''SALES(FREE SAMPLE)'',',
'      ''SIFR'',''SALES(FREE REPLACEMENT)'',',
'      ''JWIG'',''JWI (GENERAL)'',',
'      ''JWIR'',''JWI (REWORK)'',',
'      ''JWRG'',''JWR (GENERAL)'',',
'      ''SRTN'',''SALES RETURN'',',
'      ''PRTN'',''PURCHASE RETURN'',',
'      ''SCRTN'',''SCO RETURN''',
'      )STTR_SOURCE_DOC,',
'      STTR_VOU_NO,',
'      STTR_VOU_LINE_NO,',
'      STTR_TRANS_DATE,',
'      STTR_STORE_ID,',
'      STTR_PROD_ID,',
'      STTR_PROD_REV,',
'      prod_desc11 STTR_PROD_DESC,',
'      STTR_PROD_UOM,',
'      STTR_TRANS_QTY,',
'      STTR_BC_UNIT_COST,',
'      STTR_BATCH_NO,',
'      STTR_TRANS_SEQ_NO,',
'      DECODE(STTR_COST_METHOD,''FIFO'',''FIFO'',''LIFO'',''LIFO'',''MAC'',''MAC'')STTR_COST_METHOD,',
'      DECODE(STTR_BUCKET_TYPE,''QOH'',''QOH'',''SIT'',''SIT'')STTR_BUCKET_TYPE,',
'      STTR_STORE_PLNT,',
'      (SELECT store_desc1',
'         FROM stores',
'        WHERE store_bu =STTR_BU',
'          AND store_id =sttr_store_id) STTR_STORE_DESC,',
'      STTR_REF1',
'  from  stock_trans,products,classes',
'         where STTR_BU =:GLOBAL_bu',
'           and sttr_bu = prod_bu',
'           and sttr_prod_id = prod_id',
'           and sttr_prod_rev = prod_rev',
'           and prod_bu = class_bu',
'           and prod_cls = class_id',
'           and CLASS_TYPE =''FG''',
'           ',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Expiry Stock'
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
 p_id=>wwv_flow_imp.id(8245121021066864832)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2763159185523253804
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122282628864845)
,p_db_column_name=>'STTR_BATCH_NO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Batch No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122215045864844)
,p_db_column_name=>'STTR_BC_UNIT_COST'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122964673864852)
,p_db_column_name=>'STTR_BU'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Sttr Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122627100864848)
,p_db_column_name=>'STTR_BUCKET_TYPE'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Bucket Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122520140864847)
,p_db_column_name=>'STTR_COST_METHOD'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Cost Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121886919864841)
,p_db_column_name=>'STTR_PROD_DESC'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121683131864839)
,p_db_column_name=>'STTR_PROD_ID'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121832371864840)
,p_db_column_name=>'STTR_PROD_REV'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122031061864842)
,p_db_column_name=>'STTR_PROD_UOM'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122843365864851)
,p_db_column_name=>'STTR_REF1'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121228341864834)
,p_db_column_name=>'STTR_SOURCE_DOC'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Source Doc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122764488864850)
,p_db_column_name=>'STTR_STORE_DESC'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Store Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121622419864838)
,p_db_column_name=>'STTR_STORE_ID'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Store'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122651038864849)
,p_db_column_name=>'STTR_STORE_PLNT'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245123181495864854)
,p_db_column_name=>'STTR_TRANS_DATE'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122044712864843)
,p_db_column_name=>'STTR_TRANS_QTY'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Trans. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245122423251864846)
,p_db_column_name=>'STTR_TRANS_SEQ_NO'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121368883864836)
,p_db_column_name=>'STTR_VOU_LINE_NO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8245121278661864835)
,p_db_column_name=>'STTR_VOU_NO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8245179062094902579)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27632173'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'STTR_SOURCE_DOC:STTR_VOU_NO:STTR_VOU_LINE_NO:STTR_STORE_ID:STTR_PROD_ID:STTR_PROD_REV:STTR_PROD_DESC:STTR_PROD_UOM:STTR_TRANS_QTY:STTR_BC_UNIT_COST:STTR_BATCH_NO:STTR_TRANS_SEQ_NO:STTR_COST_METHOD:STTR_BUCKET_TYPE:STTR_STORE_PLNT:STTR_STORE_DESC:STTR'
||'_REF1'
);
wwv_flow_imp.component_end;
end;
/
