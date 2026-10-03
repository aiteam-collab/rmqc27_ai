prompt --application/pages/page_367066902
begin
--   Manifest
--     PAGE: 367066902
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
 p_id=>367066902
,p_name=>'Revise'
,p_alias=>'REVISE'
,p_step_title=>'Revise'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8017769868445674970)
,p_plug_name=>'Revise'
,p_static_id=>'revise'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UCCL_BU,',
'       UCCL_DOC_NO,',
'       UCCL_DOC_DATE,',
'       UCCL_CUST_ID,',
'       (select SUPLR_NAME1 from SUPPLIERS',
'             where SUPLR_bu=:GLOBAL_BU',
'             AND UCCL_CUST_ID=SUPLR_SUPLR_ID)CUST_NAME,',
'       UCCL_CURCY_ID,',
'       UCCL_CUR_CR_LMT_BASIS,',
'       UCCL_CUR_CR_LIMIT,',
'       UCCL_CUR_DUE_DAYS,',
'       UCCL_CUR_NO_OF_INV,',
'       DECODE(UCCL_NEW_CR_LMT_BASIS,''N'',''Not Applicable'',''D'',''Due Amount'',''Y'',''Due Days'',''I'',''Due Amount and No. of Invoices'',',
'       ''A'',''Due Days(S) and Amount'',''S'',''No of Invoices'')UCCL_NEW_CR_LMT_BASIS,',
'       UCCL_NEW_CR_LIMIT,',
'       UCCL_NEW_DUE_DAYS,',
'       UCCL_NEW_NO_OF_INV,',
'       UCCL_STATUS,',
'       UCCL_CRE_BY,',
'       UCCL_CRE_DATE,',
'       UCCL_CRE_OS_USER,',
'       UCCL_CRE_IP_ADDR,',
'       UCCL_CRE_EMP_ID,',
'       UCCL_UPD_BY,',
'       UCCL_UPD_DATE,',
'       UCCL_UPD_OS_USER,',
'       UCCL_UPD_IP_ADDR,',
'       UCCL_UPD_EMP_ID,',
'       UCCL_REF,',
'       UCCL_EFF_FRM,',
'       UCCL_EFF_TO',
'  from UPD_CUST_CR_LIMIT'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Revise'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8017769971849674970)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2535808136306063942
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8009312616195682236)
,p_db_column_name=>'CUST_NAME'
,p_display_order=>37
,p_column_identifier=>'AB'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017770237672675017)
,p_db_column_name=>'UCCL_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Uccl Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017775882535675042)
,p_db_column_name=>'UCCL_CRE_BY'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Uccl Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017776286453675042)
,p_db_column_name=>'UCCL_CRE_DATE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Uccl Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017777491434675045)
,p_db_column_name=>'UCCL_CRE_EMP_ID'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Uccl Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017777108433675045)
,p_db_column_name=>'UCCL_CRE_IP_ADDR'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Uccl Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017776721800675043)
,p_db_column_name=>'UCCL_CRE_OS_USER'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Uccl Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017771899481675034)
,p_db_column_name=>'UCCL_CURCY_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Currency'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017772702803675035)
,p_db_column_name=>'UCCL_CUR_CR_LIMIT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Uccl Cur Cr Limit'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017772308474675034)
,p_db_column_name=>'UCCL_CUR_CR_LMT_BASIS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Uccl Cur Cr Lmt Basis'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017773085759675035)
,p_db_column_name=>'UCCL_CUR_DUE_DAYS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Uccl Cur Due Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017773498133675037)
,p_db_column_name=>'UCCL_CUR_NO_OF_INV'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Uccl Cur No of Inv'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017771505359675032)
,p_db_column_name=>'UCCL_CUST_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017771122939675032)
,p_db_column_name=>'UCCL_DOC_DATE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc.  Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017770687580675031)
,p_db_column_name=>'UCCL_DOC_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Doc.  No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017780275674675049)
,p_db_column_name=>'UCCL_EFF_FRM'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>' Eff.  From'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017780649146675049)
,p_db_column_name=>'UCCL_EFF_TO'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Eff.  To'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017774239571675038)
,p_db_column_name=>'UCCL_NEW_CR_LIMIT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Credit Limit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017773902444675037)
,p_db_column_name=>'UCCL_NEW_CR_LMT_BASIS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>' Credit  Limit Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017774638834675038)
,p_db_column_name=>'UCCL_NEW_DUE_DAYS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017775115566675040)
,p_db_column_name=>'UCCL_NEW_NO_OF_INV'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Uccl New No of Inv'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017779932693675049)
,p_db_column_name=>'UCCL_REF'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Uccl Ref'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017775475903675040)
,p_db_column_name=>'UCCL_STATUS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Uccl Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017777920620675045)
,p_db_column_name=>'UCCL_UPD_BY'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Uccl Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017778294955675046)
,p_db_column_name=>'UCCL_UPD_DATE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Uccl Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017779517553675048)
,p_db_column_name=>'UCCL_UPD_EMP_ID'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Uccl Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017779046540675046)
,p_db_column_name=>'UCCL_UPD_IP_ADDR'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Uccl Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8017778656767675046)
,p_db_column_name=>'UCCL_UPD_OS_USER'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Uccl Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8017784587744676787)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25358228'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'UCCL_CUST_ID:CUST_NAME:UCCL_DOC_DATE:UCCL_DOC_NO:UCCL_CURCY_ID:UCCL_EFF_FRM:UCCL_EFF_TO:UCCL_NEW_CR_LMT_BASIS:UCCL_NEW_CR_LIMIT:UCCL_NEW_DUE_DAYS'
);
wwv_flow_imp.component_end;
end;
/
