prompt --application/pages/page_1615132041
begin
--   Manifest
--     PAGE: 1615132041
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
 p_id=>1615132041
,p_name=>'Request For Quotation'
,p_alias=>'REQUEST-FOR-QUOTATION1'
,p_step_title=>'Request For Quotation'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-header {',
'    --a-gv-header-cell-border-color: #e6e6e6;',
'    background-color: #fafafa;',
'    border-top: 1px solid #e6e6e6;',
'    color: rgba(0, 0, 0, 0.95);',
'    white-space: nowrap;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7175368978022423957)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       RFQHD_BU,',
'       RFQHD_RFQ_PFX||''-''||RFQHD_RFQ_NO Rfq,',
'       RFQHD_RFQ_DATE,',
'       RFQHD_DUE_DATE,',
'       RFQHD_CLOSE_DATE,',
'       RFQHD_YEAR,',
'       RFQHD_PERIOD,',
'       RFQHD_BUYER_ID,',
'       DECODE(RFQHD_STATUS,''N'',''New'',''Q'',''Quotation'',''R'',''Rate Finalized'',''I'',''Entry Completed'',''A'',''Approved'',''O'',''Ordered'',''C'',''Cancelled'') Status, ',
'		 RFQHD_NARRATION,',
'       DECODE(RFQHD_TYPE,''PR'',''Purchase Request'',''Q'',''Direct RFQ'',''DR'',''Direct RFQ(Enquiry)'') TYPE,',
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
'       RFQHD_PLNT_LOC_NAME',
'  from RFQ_HD',
'  WHERE RFQHD_BU =:GLOBAL_bu;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7175369421985423959)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1693407586441812931
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6874981746951703570)
,p_db_column_name=>'RFQ'
,p_display_order=>81
,p_column_identifier=>'BB'
,p_column_label=>'RFQ No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175374684424423971)
,p_db_column_name=>'RFQHD_APPVR_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Rfqhd Appvr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175369927989423963)
,p_db_column_name=>'RFQHD_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Rfqhd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175373132126423970)
,p_db_column_name=>'RFQHD_BUYER_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Buyer '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175383129120423982)
,p_db_column_name=>'RFQHD_CERT_TYPE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Rfqhd Cert Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175371916010423968)
,p_db_column_name=>'RFQHD_CLOSE_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Close Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175384270722423982)
,p_db_column_name=>'RFQHD_CONTRACT_DATE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Rfqhd Contract Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175376667363423974)
,p_db_column_name=>'RFQHD_CONTRACT_NO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Rfqhd Contract No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175375870848423973)
,p_db_column_name=>'RFQHD_CONTROL_PERSON'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Rfqhd Control Person'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175385115731423984)
,p_db_column_name=>'RFQHD_CRE_BY'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Rfqhd Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175386257197423985)
,p_db_column_name=>'RFQHD_CRE_DATE'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Rfqhd Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175388247594423988)
,p_db_column_name=>'RFQHD_CRE_EMP_ID'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Rfqhd Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175385455005423984)
,p_db_column_name=>'RFQHD_CRE_IP_ADDR'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Rfqhd Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175385848843423985)
,p_db_column_name=>'RFQHD_CRE_OS_USER'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Rfqhd Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175377867553423976)
,p_db_column_name=>'RFQHD_DELIVERY'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Rfqhd Delivery'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175377469355423974)
,p_db_column_name=>'RFQHD_DEST'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Rfqhd Dest'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175371528920423968)
,p_db_column_name=>'RFQHD_DUE_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175379885512423978)
,p_db_column_name=>'RFQHD_ED'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Rfqhd Ed'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175378714787423976)
,p_db_column_name=>'RFQHD_FORWARDING'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Rfqhd Forwarding'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175379044579423976)
,p_db_column_name=>'RFQHD_FRIEGHT'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Rfqhd Frieght'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175379483681423978)
,p_db_column_name=>'RFQHD_INSURANCE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Rfqhd Insurance'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175383504243423982)
,p_db_column_name=>'RFQHD_LD_CLASS'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Rfqhd Ld Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175373914860423970)
,p_db_column_name=>'RFQHD_NARRATION'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175378240250423976)
,p_db_column_name=>'RFQHD_PACK_FORWD'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Rfqhd Pack Forwd'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175380669232423979)
,p_db_column_name=>'RFQHD_PAYMENT_DETAIL'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Rfqhd Payment Detail'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175372716937423970)
,p_db_column_name=>'RFQHD_PERIOD'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Rfqhd Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175376290894423974)
,p_db_column_name=>'RFQHD_PLNT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175389065711423990)
,p_db_column_name=>'RFQHD_PLNT_LOC_ID'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Rfqhd Plnt Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175389516144423990)
,p_db_column_name=>'RFQHD_PLNT_LOC_NAME'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Loc. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175382705738423981)
,p_db_column_name=>'RFQHD_PRICE_TERM'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Rfqhd Price Term'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175377071034423974)
,p_db_column_name=>'RFQHD_REF_PLNT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Rfqhd Ref Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175382326204423981)
,p_db_column_name=>'RFQHD_REMARKS'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Rfqhd Remarks'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175371040284423968)
,p_db_column_name=>'RFQHD_RFQ_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-RR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175381466764423979)
,p_db_column_name=>'RFQHD_SERV_CHARGE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Rfqhd Serv Charge'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175381132726423979)
,p_db_column_name=>'RFQHD_SP_INST'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Rfqhd Sp Inst'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175384648321423984)
,p_db_column_name=>'RFQHD_TAX_FLAG'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Tax Flag'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175375112228423971)
,p_db_column_name=>'RFQHD_TRACE_ACTION'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Rfqhd Trace Action'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175375461762423973)
,p_db_column_name=>'RFQHD_TRACE_MSG'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Rfqhd Trace Msg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175383915446423982)
,p_db_column_name=>'RFQHD_TRANSPTR'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Rfqhd Transptr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175386668388423985)
,p_db_column_name=>'RFQHD_UPD_BY'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Rfqhd Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175387894642423987)
,p_db_column_name=>'RFQHD_UPD_DATE'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Rfqhd Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175388701489423988)
,p_db_column_name=>'RFQHD_UPD_EMP_ID'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Rfqhd Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175387119883423987)
,p_db_column_name=>'RFQHD_UPD_IP_ADDR'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Rfqhd Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175387503268423987)
,p_db_column_name=>'RFQHD_UPD_OS_USER'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Rfqhd Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175380270510423978)
,p_db_column_name=>'RFQHD_VAT_CST'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Rfqhd Vat Cst'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175381893017423981)
,p_db_column_name=>'RFQHD_WARRANTY'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Rfqhd Warranty'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175372299907423968)
,p_db_column_name=>'RFQHD_YEAR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Rfqhd Year'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7175369461597423962)
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
 p_id=>wwv_flow_imp.id(6874981594090703568)
,p_db_column_name=>'STATUS'
,p_display_order=>61
,p_column_identifier=>'AZ'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6874981704221703569)
,p_db_column_name=>'TYPE'
,p_display_order=>71
,p_column_identifier=>'BA'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7179083993846504843)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16971222'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RFQHD_PLNT_LOC_NAMEHD_PLNT:TYPEHD_RFQ_PFXHD_RFQ_NOHD_RFQ_DATEHD_BUYER_IDHD_DUE_DATEHD_CLOSE_DATE:STATUS:RFQ'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7175389957006423990)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7175368978022423957)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1615132042:&SESSION.::&DEBUG.:1615132042'
);
wwv_flow_imp.component_end;
end;
/
