prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Access Details'
,p_alias=>'ACCESS-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Access Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-HeroRegion-title {',
'    font-size: 1.5rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'    color: #5C6BC0;',
'}',
'',
'.t-HeroRegion-wrap {',
'    padding: 16px;',
'    display: flex;',
'    padding-bottom: 0px;',
'    flex-direction: row;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 500;',
'}',
'',
'',
'',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'    color: rgb(25 21 25);',
'    background-color: #ffffff;',
'    border-color: #dfdfdf;',
'    border-style: none;',
'}',
'',
'.t-HeroRegion--featured.t-HeroRegion--centered .t-HeroRegion-wrap {',
'    flex-direction: column;',
'    text-align: center;',
'    background: url(#APP_IMAGES#bg5.png);',
'    background-size: contain;',
'}',
'',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only {',
'    color: #000000;',
'    background-color: #ffffff;',
'    border-color: #dfdfdf;',
'    border-style: none;',
'    font-weight: 600;',
'}',
'',
'.a-IRR-table {',
'    border-collapse: separate;',
'    white-space: nowrap;',
'}',
'',
'',
'#UNIT .a-IRR-headerLink, #UNIT .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: hsl(238, 48%, 58%);',
'    color: white;',
'    border-left: 1px solid rgb(255 253 253);',
'}',
'',
'',
'',
'#PFX .a-IRR-headerLink, #PFX .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: limegreen;',
'    color: black;',
'    border-left: 1px solid rgb(255 253 253);',
'}',
'',
' .a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: hsl(66, 26%, 54%);',
'    color: black;',
'    border-left: 1px solid rgb(255 253 253);',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11217959207484368089)
,p_plug_name=>'Prefix'
,p_static_id=>'prefix'
,p_region_name=>'PFX'
,p_parent_plug_id=>wwv_flow_imp.id(22282019639008383017)
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT upa_pfx "Prefix",',
'            (SELECT adp_desc1',
'        FROM appl_doc_prefixes',
'       WHERE adp_bu  = upa_bu',
'         AND adp_pfx = upa_pfx) "Desc.",',
'      DECODE((SELECT adp_doc_type',
'        FROM appl_doc_prefixes',
'       WHERE adp_bu  = upa_bu',
'         AND adp_pfx = upa_pfx),',
'''ABGI'',''Adv. Bank Guarantee - Issue'',',
'''ABGR'',''Adv. Bank Guarantee - Receive'',',
'''BD'',''Bills Discounting'',',
'''CMI'',''Credit Note - Issue'',',
'''CMR'',''Credit Note - Receive'',',
'''CYC'',''Stock Count Schedule'',',
'''DE'',''Demo/Exhibition'',',
'''DMI'',''Debit Note - Issue  '',',
'''DMR'',''Debit Note - Receive'',',
'''BV'',''Bank Voucher'',',
'''CVI'',''Contra Voucher (In)'',',
'''CVO'',''Contra Voucher (Out)'',',
'''PAD'',''Payment Advice'',',
'''EBGI'',''EMD. Bank Guarantee - Issue'',',
'''EBGR'',''EMD. Bank Guarantee - Receive'',',
'''FE'',''Free Replacement'',',
'''FR'',''Shop Floor Receipt'',',
'''FS'',''Free Sample'',',
'''GR'',''Goods Request'',',
'''GRMT'',''Garments'',',
'''IC'',''Inventory Count'',',
'''II'',''Invoice - Issue'',',
'''IIE'',''Invoice Issue - Export'',',
'''IIM'',''Invoice Issue - Manufacturing'',',
'''IIT'',''Invoice Issue - Trading'',',
'''INSP'',''Inspection Request'',',
'''INSPC'',''Inspection Document'',',
'''IR'',''Invoice - Receive'',',
'''LCI'',''Letter Of Credit - Issue'',',
'''LCR'',''Letter Of Credit - Receive'',',
'''LD'',''Load Order'',',
'''LGI'',''Letter Of Guarantee - Issue'',',
'''LGR'',''Letter Of Guarantee - Receive'',',
'''LO'',''Labor Order'',',
'''LR'',''Labor Return'',',
'''MI'',''Material Issue'',',
'''MR'',''Material Request'',',
'''MRV'',''Material Receipt Voucher'',',
'''PBGI'',''Perf. Bank Guarantee - Issue'',',
'''PBGR'',''Perf. Bank Guarantee - Receive'',',
'''PCOD'',''Purchase Order'',',
'''PCRPT'',''Purchase Receipt'',',
'''PCRQ'',''Purchase Request'',',
'''PFR'',''Proforma Invoice - Receive'',',
'''PI'',''Payment - Issue'',',
'''PINV'',''Proforma Invoice'',',
'''PLND'',''Landed Cost'',',
'''PMR'',''Pre - Material Request'',',
'''PMWO'',''Preventive Maintenance - WO'',',
'''POO'',''Purchase Open Order'',',
'''PQUT'',''Purchase Quotation'',',
'''PR'',''Payment - Receive'',',
'''QR'',''Quotation Request'',',
'''RE'',''Return for Repair'',',
'''REFQ'',''Request For Quotation'',',
'''RL'',''Return for Replacement'',',
'''SA'',''Stock Adjustment'',',
'''SBGI'',''SD. Bank Guarantee - Issue'',',
'''SBGR'',''SD. Bank Guarantee - Receive'',',
'''SCRQT'',''Subcontract Request'',',
'''SCO'',''Subcontract Order'',',
'''OBO'',''Subcontract Open Order'',',
'''SCR'',''Scrap Receipt'',',
'''SD'',''Shipping Document'',',
'''SE'',''SO for Repair'',',
'''SJ'',''SO for Rejection'',',
'''SL'',''SO for Replacement'',',
'''SO'',''Sales Order'',',
'''CO'',''Sales Stock Order'',',
'''SOO'',''Sales Open Order'',',
'''SORD'',''Service Order(CRM)'',',
'''SP'',''SO Spares'',',
'''SQ'',''Sales Quotation'',',
'''SR'',''Sales Return'',',
'''SS'',''Inventory Transaction'',',
'''ST'',''Stock Transfer - Purchase'',',
'''STS'',''Stock Transfer - Sale (Internal)'',',
'''STSE'',''Stock Transfer - Sale (External)'',',
'''SV'',''Service Order(SO)'',',
'''SW'',''SO Spares / Warranty'',',
'''TP'',''SO Trading Spares'',',
'''TPN'',''Traceability Plate Number'',',
'''VI'',''Vehicle Invoice No.'',',
'''VOB'',''Vehicle Order Booking'',',
'''PC'',''Packing Credit'',',
'''SSPR'',''Supplier Schedule - Purchase Request'',',
'''SSSCR'',''Supplier Schedule - Subcontract Request'',',
'''SSPO'',''Supplier Schedule - Purchase Order'',',
'''SSSCO'',''Supplier Schedule - Subcontract Order'',',
'''DEP'',''Deposits'',',
'''ARE1'',''A.R.E 1 Invoice'',',
'''ARE2'',''A.R.E 2 Invoice'',',
'''ARE3'',''A.R.E 3 Invoice'',',
'''RU'',''Stock Transfer Return'',',
'''RDE'',''Return Demo/Exhibition'',',
'''RSR'',''Sample Return'',',
'''SER'',''Service Return'',',
'''AV'',''Adjustment Voucher'',',
'''GJ'',''General Journal'',',
'''TEN'',''Training Enquiry'',',
'''TAD'',''Training Admission'',',
'''TFR'',''Training Fees Receipt'',',
'''DC'',''Delivery Challan'',',
'''JV'',''Journal Voucher'',',
'''IIC'',''Invoice Issue - Commercial'',',
'''RB'',''Running Bills'',',
'''GEN'',''Gate Entry Inward'',',
'''CPR'',''Corp. Purchase Request'',',
'''COPO'',''Corp. Open Purchase Order'',',
'''CPO'',''Corp. Purchase Order'',',
'''CSO'',''Corp. Sales Order'',',
'''RJ'',''Recurring Journal'',',
'''TEND'',''Tender'',',
'''BOM'',''Bill of Materials'',',
'''GPI'',''Proforma Invoice (Glass)'',',
'''GLPI'',''Labor Proforma Invoice (Glass)'',',
'''OBG'',''Order Booking GPI'',',
'''PRIV'',''Purchase Return Invoice'',',
'''RSER'',''Repair Service Request'',',
'''SRCM'',''Sales Return Credit Memo(Issue)'',',
'''SRDM'',''Sales Return Debit Memo(Receipt)'',',
'''SRIR'',''Sales Return Invoice(Receipt)'',',
'''CSER'',''Customer Service Request'',',
'''PJ'',''Project (Sales)'',',
'''CRFQ'',''Corp. Request for Quotation'',',
'''CSPQ'',''Pre Quotation'',',
'''CSOQ'',''Post Quotation''',
') "Document Type",',
'         DECODE(upa_dflt_flag,''Y'',''<span class="fa fa-check-square" aria-hidden="true" style="color:#6064c7"></span>'',''<span aria-hidden="true" class="fa fa-square-o"  style="color:tomato"></span>'') "Default"',
'  FROM user_prefix_access',
' WHERE upa_bu=:global_bu',
'      AND upa_user_id=:global_user'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Prefix'
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
 p_id=>wwv_flow_imp.id(11217959241561368090)
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
,p_internal_uid=>5074117212154846829
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217959771393368095)
,p_db_column_name=>'Default'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Default'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217959528445368092)
,p_db_column_name=>'Desc.'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960708607368104)
,p_db_column_name=>'Document Type'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960570063368103)
,p_db_column_name=>'Prefix'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11524473285916241923)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53806313'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Prefix:Desc.:Document Type:Default'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22282019639008383017)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11217957988655368077)
,p_plug_name=>'Unit'
,p_static_id=>'unit'
,p_region_name=>'UNIT'
,p_parent_plug_id=>wwv_flow_imp.id(22282019639008383017)
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT auba_plant "Unit",',
'            (SELECT bup_name1 ',
'                FROM bus_unit_plants',
'               WHERE bup_bu=auba_bu',
'                    AND bup_plant_id=auba_plant) "Desc.",',
'            auba_from "Eff. From",',
'            auba_to "Eff. To",',
'            DECODE(auba_deflt_flag,''Y'',''<span class="fa fa-check-square" aria-hidden="true" style="color:#6064c7"></span>'',''<span aria-hidden="true" class="fa fa-square-o"  style="color:tomato"></span>'') "Default"',
'  FROM appl_user_plant_access',
' WHERE auba_bu=:global_bu',
'      AND auba_user_id=:global_user'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Unit'
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
 p_id=>wwv_flow_imp.id(11217958622622368083)
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
,p_internal_uid=>5074116593215846822
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217959087811368088)
,p_db_column_name=>'Default'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Default'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217958793497368085)
,p_db_column_name=>'Desc.'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217958927022368086)
,p_db_column_name=>'Eff. From'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217958970283368087)
,p_db_column_name=>'Eff. To'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217958652744368084)
,p_db_column_name=>'Unit'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11524466006603190339)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53806240'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Unit:Desc.:Eff. From:Eff. To:Default'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11217959868592368096)
,p_plug_name=>'WorkFlow'
,p_static_id=>'workflow'
,p_parent_plug_id=>wwv_flow_imp.id(22282019639008383017)
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT wfuav_bus_proc_id "Work Flow",',
'       wfuav_bus_proc_desc "Desc.",',
'       wfuav_desc "Process",',
'       wfuav_date_from "Eff. From",',
'       wfuav_date_to "Eff. To",',
'       wfuav_appr_bu "Entity",',
'       wfuav_appr_bu_desc "Entity Desc.",',
'       wfuav_plnt "Unit",',
'       wfuav_plnt_desc "Unit Desc.",',
'       wfuav_value "Value",',
'       wfuav_disc_pct "Disc. (%)"',
'  FROM work_flow_user_access_vw',
' WHERE wfuav_bu = :global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'WorkFlow'
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
 p_id=>wwv_flow_imp.id(11217959978113368097)
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
,p_internal_uid=>5074117948706846836
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960186205368099)
,p_db_column_name=>'Desc.'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217961390440368111)
,p_db_column_name=>'Disc. (%)'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Disc. (%)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960236514368100)
,p_db_column_name=>'Eff. From'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960334277368101)
,p_db_column_name=>'Eff. To'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217961020236368107)
,p_db_column_name=>'Entity'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217961053232368108)
,p_db_column_name=>'Entity Desc.'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Entity Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960857520368106)
,p_db_column_name=>'Process'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960060060368098)
,p_db_column_name=>'Unit'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217961200507368109)
,p_db_column_name=>'Unit Desc.'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217961259940368110)
,p_db_column_name=>'Value'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11217960801052368105)
,p_db_column_name=>'Work Flow'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Work Flow'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11524473878243241926)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53806319'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Work Flow:Desc.:Process:Eff. From:Eff. To:Entity:Entity Desc.:Unit:Unit Desc.:Value:Disc. (%)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11524453874500100626)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11524454380990100626)
,p_event_id=>wwv_flow_imp.id(11524453874500100626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
