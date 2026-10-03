prompt --application/pages/page_1615131058011
begin
--   Manifest
--     PAGE: 1615131058011
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
 p_id=>1615131058011
,p_name=>'Open RFQ'
,p_alias=>'OPEN-RFQ'
,p_page_mode=>'MODAL'
,p_step_title=>'Open RFQ'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6773738416038123551)
,p_plug_name=>'Open RFQ'
,p_static_id=>'open-rfq'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>510
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       RFQHD_BU,',
'       RFQHD_RFQ_PFX,',
'       RFQHD_RFQ_NO,',
'       RFQHD_RFQ_DATE,',
'       RFQHD_DUE_DATE,',
'       RFQHD_CLOSE_DATE,',
'       RFQHD_YEAR,',
'       RFQHD_PERIOD,',
'       RFQHD_BUYER_ID,',
'       (SELECT func_find_buyer_desc(:GLOBAL_bu,buyer_id,1) ',
'         FROM buyers ',
'         WHERE buyer_bu= :GLOBAL_bu',
'         AND buyer_id= RFQHD_BUYER_ID)Buyer,',
'       DECODE(RFQHD_STATUS,''N'',''Draft'')status,',
'       RFQHD_NARRATION,',
'       RFQHD_TYPE,',
'       RFQHD_APPVR_ID,',
'       RFQHD_TRACE_ACTION,',
'       RFQHD_TRACE_MSG,',
'       RFQHD_CONTROL_PERSON,',
'       RFQHD_PLNT,',
'       RFQHD_CONTRACT_NO,',
'       RFQHD_REF_PLNT,',
'       RFQHD_DEST,',
'       RFQHD_DELIVERY,',
'       RFQHD_PACK_FORWD,',
'       RFQHD_FORWARDING,',
'       RFQHD_FRIEGHT,',
'       RFQHD_INSURANCE,',
'       RFQHD_ED,',
'       RFQHD_VAT_CST,',
'       RFQHD_PAYMENT_DETAIL,',
'       RFQHD_SP_INST,',
'       RFQHD_SERV_CHARGE,',
'       RFQHD_WARRANTY,',
'       RFQHD_REMARKS,',
'       RFQHD_PRICE_TERM,',
'       RFQHD_CERT_TYPE,',
'       RFQHD_LD_CLASS,',
'       RFQHD_TRANSPTR,',
'       RFQHD_CONTRACT_DATE,',
'       RFQHD_TAX_FLAG,',
'       RFQHD_CRE_BY,',
'       RFQHD_CRE_IP_ADDR,',
'       RFQHD_CRE_OS_USER,',
'       RFQHD_CRE_DATE,',
'       RFQHD_UPD_BY,',
'       RFQHD_UPD_IP_ADDR,',
'       RFQHD_UPD_OS_USER,',
'       RFQHD_UPD_DATE,',
'       RFQHD_CRE_EMP_ID,',
'       RFQHD_UPD_EMP_ID,',
'       RFQHD_PLNT_LOC_ID,',
'       RFQHD_PLNT_LOC_NAME,',
'       RFQHD_APPR_BY,',
'       RFQHD_APPR_EMP_ID,',
'       RFQHD_APPR_IP_ADDR,',
'       RFQHD_APPR_OS_USER,',
'       RFQHD_APPR_DATE,',
'       DECODE(RFQHD_STATUS,''N'',''Blue'')COLOUR',
'  from RFQ_HD',
'  WHERE RFQHD_BU =:GLOBAL_bu',
'    AND RFQHD_STATUS =''N''  '))
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
 p_id=>wwv_flow_imp.id(6773738472991123552)
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
,p_internal_uid=>3136629791186886868
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745626186125760)
,p_db_column_name=>'BUYER'
,p_display_order=>590
,p_column_identifier=>'BF'
,p_column_label=>'Buyer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745533373125759)
,p_db_column_name=>'COLOUR'
,p_display_order=>580
,p_column_identifier=>'BE'
,p_column_label=>'Colour'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773744873136125753)
,p_db_column_name=>'RFQHD_APPR_BY'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Rfqhd Appr By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745294484125757)
,p_db_column_name=>'RFQHD_APPR_DATE'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'Rfqhd Appr Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773744939415125754)
,p_db_column_name=>'RFQHD_APPR_EMP_ID'
,p_display_order=>530
,p_column_identifier=>'AZ'
,p_column_label=>'Rfqhd Appr Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745127023125755)
,p_db_column_name=>'RFQHD_APPR_IP_ADDR'
,p_display_order=>540
,p_column_identifier=>'BA'
,p_column_label=>'Rfqhd Appr Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745208972125756)
,p_db_column_name=>'RFQHD_APPR_OS_USER'
,p_display_order=>550
,p_column_identifier=>'BB'
,p_column_label=>'Rfqhd Appr Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739768410123565)
,p_db_column_name=>'RFQHD_APPVR_ID'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Rfqhd Appvr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773738540168123553)
,p_db_column_name=>'RFQHD_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Rfqhd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739340338123561)
,p_db_column_name=>'RFQHD_BUYER_ID'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Buyer ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741875626123586)
,p_db_column_name=>'RFQHD_CERT_TYPE'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Rfqhd Cert Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739102245123558)
,p_db_column_name=>'RFQHD_CLOSE_DATE'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Close Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742166376123589)
,p_db_column_name=>'RFQHD_CONTRACT_DATE'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Rfqhd Contract Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740251897123570)
,p_db_column_name=>'RFQHD_CONTRACT_NO'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Rfqhd Contract No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740106092123568)
,p_db_column_name=>'RFQHD_CONTROL_PERSON'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Rfqhd Control Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742373170123591)
,p_db_column_name=>'RFQHD_CRE_BY'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Rfqhd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742650151123594)
,p_db_column_name=>'RFQHD_CRE_DATE'
,p_display_order=>430
,p_column_identifier=>'AP'
,p_column_label=>'Rfqhd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773743185153123599)
,p_db_column_name=>'RFQHD_CRE_EMP_ID'
,p_display_order=>480
,p_column_identifier=>'AU'
,p_column_label=>'Rfqhd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742498034123592)
,p_db_column_name=>'RFQHD_CRE_IP_ADDR'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Rfqhd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742619748123593)
,p_db_column_name=>'RFQHD_CRE_OS_USER'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Rfqhd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740598914123573)
,p_db_column_name=>'RFQHD_DELIVERY'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Rfqhd Delivery'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740514491123572)
,p_db_column_name=>'RFQHD_DEST'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Rfqhd Dest'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773738998792123557)
,p_db_column_name=>'RFQHD_DUE_DATE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741110637123578)
,p_db_column_name=>'RFQHD_ED'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Rfqhd Ed'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740810427123575)
,p_db_column_name=>'RFQHD_FORWARDING'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Rfqhd Forwarding'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740871892123576)
,p_db_column_name=>'RFQHD_FRIEGHT'
,p_display_order=>250
,p_column_identifier=>'X'
,p_column_label=>'Rfqhd Frieght'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740991363123577)
,p_db_column_name=>'RFQHD_INSURANCE'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>'Rfqhd Insurance'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741962888123587)
,p_db_column_name=>'RFQHD_LD_CLASS'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Rfqhd Ld Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739595815123563)
,p_db_column_name=>'RFQHD_NARRATION'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740730051123574)
,p_db_column_name=>'RFQHD_PACK_FORWD'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Rfqhd Pack Forwd'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741249774123580)
,p_db_column_name=>'RFQHD_PAYMENT_DETAIL'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Rfqhd Payment Detail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739294743123560)
,p_db_column_name=>'RFQHD_PERIOD'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Rfqhd Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740197191123569)
,p_db_column_name=>'RFQHD_PLNT'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773744651465125751)
,p_db_column_name=>'RFQHD_PLNT_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'AW'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773744802561125752)
,p_db_column_name=>'RFQHD_PLNT_LOC_NAME'
,p_display_order=>510
,p_column_identifier=>'AX'
,p_column_label=>'Rfqhd Plnt Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741836018123585)
,p_db_column_name=>'RFQHD_PRICE_TERM'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Rfqhd Price Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740420456123571)
,p_db_column_name=>'RFQHD_REF_PLNT'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Rfqhd Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741678721123584)
,p_db_column_name=>'RFQHD_REMARKS'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Rfqhd Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773738933122123556)
,p_db_column_name=>'RFQHD_RFQ_DATE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'RFQ Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773738760342123555)
,p_db_column_name=>'RFQHD_RFQ_NO'
,p_display_order=>40
,p_is_primary_key=>'Y'
,p_column_identifier=>'C'
,p_column_label=>'RFQ No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773738673158123554)
,p_db_column_name=>'RFQHD_RFQ_PFX'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'RFQ Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741437774123582)
,p_db_column_name=>'RFQHD_SERV_CHARGE'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Rfqhd Serv Charge'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741350431123581)
,p_db_column_name=>'RFQHD_SP_INST'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Rfqhd Sp Inst'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742276889123590)
,p_db_column_name=>'RFQHD_TAX_FLAG'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Rfqhd Tax Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739932906123566)
,p_db_column_name=>'RFQHD_TRACE_ACTION'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Rfqhd Trace Action'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773740029491123567)
,p_db_column_name=>'RFQHD_TRACE_MSG'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Rfqhd Trace Msg'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742048880123588)
,p_db_column_name=>'RFQHD_TRANSPTR'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Rfqhd Transptr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739638403123564)
,p_db_column_name=>'RFQHD_TYPE'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Rfqhd Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742817790123595)
,p_db_column_name=>'RFQHD_UPD_BY'
,p_display_order=>440
,p_column_identifier=>'AQ'
,p_column_label=>'Rfqhd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773743040635123598)
,p_db_column_name=>'RFQHD_UPD_DATE'
,p_display_order=>470
,p_column_identifier=>'AT'
,p_column_label=>'Rfqhd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773743301095123600)
,p_db_column_name=>'RFQHD_UPD_EMP_ID'
,p_display_order=>490
,p_column_identifier=>'AV'
,p_column_label=>'Rfqhd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742916149123596)
,p_db_column_name=>'RFQHD_UPD_IP_ADDR'
,p_display_order=>450
,p_column_identifier=>'AR'
,p_column_label=>'Rfqhd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773742977017123597)
,p_db_column_name=>'RFQHD_UPD_OS_USER'
,p_display_order=>460
,p_column_identifier=>'AS'
,p_column_label=>'Rfqhd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741214511123579)
,p_db_column_name=>'RFQHD_VAT_CST'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Rfqhd Vat Cst'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773741587163123583)
,p_db_column_name=>'RFQHD_WARRANTY'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Rfqhd Warranty'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773739205301123559)
,p_db_column_name=>'RFQHD_YEAR'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Rfqhd Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745360774125758)
,p_db_column_name=>'ROWID'
,p_display_order=>570
,p_column_identifier=>'BD'
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
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6773745833592125762)
,p_db_column_name=>'STATUS'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="COLOR:#COLOUR#;font-weight:bold;font-weight: bold; border-radius:12px;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6774036150185179471)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'470592'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RFQHD_PLNT_LOC_ID:RFQHD_PLNT:RFQHD_RFQ_PFX:RFQHD_RFQ_NO:RFQHD_RFQ_DATE:RFQHD_DUE_DATE:RFQHD_CLOSE_DATE:RFQHD_NARRATION:BUYER:STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6723985664441415563)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6773738416038123551)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6723986242644415565)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6723985664441415563)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6723986684146415565)
,p_event_id=>wwv_flow_imp.id(6723986242644415565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
