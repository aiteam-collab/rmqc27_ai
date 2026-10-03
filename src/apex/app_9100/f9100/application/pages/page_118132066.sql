prompt --application/pages/page_118132066
begin
--   Manifest
--     PAGE: 118132066
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
 p_id=>118132066
,p_name=>'Customer Party Statement'
,p_alias=>'CUSTOMER-PARTY-STATEMENT'
,p_step_title=>'Customer Party Statement'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650479772302505312)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6310455445665312296)
,p_plug_name=>'Customer Party Statement'
,p_static_id=>'customer-party-statement'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'eba_demo_ir_filter2_fw.render_sidebar();'
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6315692231901425789)
,p_plug_name=>'P118132066_DETAILS'
,p_static_id=>'p118132066-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SUPLR_STAT_DATE_WISE'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'P118132066_DETAILS'
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
 p_id=>wwv_flow_imp.id(6315692396766425790)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>171850367359904529
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515520904960763)
,p_db_column_name=>'SSDW_BC_CL_BAL'
,p_display_order=>320
,p_column_identifier=>'W'
,p_column_label=>'Ssdw Bc Cl Bal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515364462960762)
,p_db_column_name=>'SSDW_BC_CR_AMT'
,p_display_order=>180
,p_column_identifier=>'V'
,p_column_label=>'Ssdw Bc Cr Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315694431354425811)
,p_db_column_name=>'SSDW_BC_DB_AMT'
,p_display_order=>170
,p_column_identifier=>'U'
,p_column_label=>'Ssdw Bc Db Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315694392485425810)
,p_db_column_name=>'SSDW_BC_OP_BAL'
,p_display_order=>310
,p_column_identifier=>'T'
,p_column_label=>'Ssdw Bc Op Bal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516251286960771)
,p_db_column_name=>'SSDW_BFCRY_TYPE'
,p_display_order=>30
,p_column_identifier=>'AE'
,p_column_label=>'Ssdw Bfcry Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693523536425801)
,p_db_column_name=>'SSDW_BILL_DATE'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Ssdw Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693378381425800)
,p_db_column_name=>'SSDW_BILL_NO'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Ssdw Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692500237425791)
,p_db_column_name=>'SSDW_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ssdw Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516736439960776)
,p_db_column_name=>'SSDW_CL_BAL'
,p_display_order=>430
,p_column_identifier=>'AJ'
,p_column_label=>'Ssdw Cl Bal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517307438960781)
,p_db_column_name=>'SSDW_CRE_BY'
,p_display_order=>460
,p_column_identifier=>'AO'
,p_column_label=>'Ssdw Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517534207960784)
,p_db_column_name=>'SSDW_CRE_DATE'
,p_display_order=>490
,p_column_identifier=>'AR'
,p_column_label=>'Ssdw Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518106740960789)
,p_db_column_name=>'SSDW_CRE_EMP_ID'
,p_display_order=>540
,p_column_identifier=>'AW'
,p_column_label=>'Ssdw Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517346315960782)
,p_db_column_name=>'SSDW_CRE_IP_ADDR'
,p_display_order=>470
,p_column_identifier=>'AP'
,p_column_label=>'Ssdw Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517458173960783)
,p_db_column_name=>'SSDW_CRE_OS_USER'
,p_display_order=>480
,p_column_identifier=>'AQ'
,p_column_label=>'Ssdw Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518480074960793)
,p_db_column_name=>'SSDW_DAIRY_CAN_ID'
,p_display_order=>580
,p_column_identifier=>'BA'
,p_column_label=>'Ssdw Dairy Can Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518271643960791)
,p_db_column_name=>'SSDW_DAIRY_COC_ID'
,p_display_order=>560
,p_column_identifier=>'AY'
,p_column_label=>'Ssdw Dairy Coc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518403917960792)
,p_db_column_name=>'SSDW_DAIRY_ROUTE_ID'
,p_display_order=>570
,p_column_identifier=>'AZ'
,p_column_label=>'Ssdw Dairy Route Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693626958425802)
,p_db_column_name=>'SSDW_DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Ssdw Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693749184425804)
,p_db_column_name=>'SSDW_DOC_NO'
,p_display_order=>280
,p_column_identifier=>'N'
,p_column_label=>'Ssdw Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517135423960780)
,p_db_column_name=>'SSDW_DOC_NO_SYS'
,p_display_order=>80
,p_column_identifier=>'AN'
,p_column_label=>'Ssdw Doc No Sys'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693719153425803)
,p_db_column_name=>'SSDW_DOC_PFX'
,p_display_order=>270
,p_column_identifier=>'M'
,p_column_label=>'Ssdw Doc Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517106588960779)
,p_db_column_name=>'SSDW_DOC_PFX_SYS'
,p_display_order=>60
,p_column_identifier=>'AM'
,p_column_label=>'Ssdw Doc Pfx Sys'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693848045425805)
,p_db_column_name=>'SSDW_DR_CR'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Ssdw Dr Cr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692589860425792)
,p_db_column_name=>'SSDW_FR_DT'
,p_display_order=>190
,p_column_identifier=>'B'
,p_column_label=>'Ssdw Fr Dt'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693185604425798)
,p_db_column_name=>'SSDW_LGR_TYPE'
,p_display_order=>250
,p_column_identifier=>'H'
,p_column_label=>'Ssdw Lgr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515769666960766)
,p_db_column_name=>'SSDW_NARRATION'
,p_display_order=>350
,p_column_identifier=>'Z'
,p_column_label=>'Ssdw Narration'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516697286960775)
,p_db_column_name=>'SSDW_OP_BAL'
,p_display_order=>420
,p_column_identifier=>'AI'
,p_column_label=>'Ssdw Op Bal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517028266960778)
,p_db_column_name=>'SSDW_OP_BAL_BC'
,p_display_order=>450
,p_column_identifier=>'AL'
,p_column_label=>'Ssdw Op Bal Bc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516860260960777)
,p_db_column_name=>'SSDW_PARTY_ID'
,p_display_order=>440
,p_column_identifier=>'AK'
,p_column_label=>'Ssdw Party Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516224209960770)
,p_db_column_name=>'SSDW_PAY_TYPE'
,p_display_order=>390
,p_column_identifier=>'AD'
,p_column_label=>'Ssdw Pay Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693257356425799)
,p_db_column_name=>'SSDW_PLANT'
,p_display_order=>260
,p_column_identifier=>'I'
,p_column_label=>'Ssdw Plant'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518568557960794)
,p_db_column_name=>'SSDW_PROJ_ID'
,p_display_order=>590
,p_column_identifier=>'BB'
,p_column_label=>'Ssdw Proj Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692738731425794)
,p_db_column_name=>'SSDW_SEQ_NO'
,p_display_order=>210
,p_column_identifier=>'D'
,p_column_label=>'Ssdw Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516434975960773)
,p_db_column_name=>'SSDW_SRC_DOC_NO'
,p_display_order=>410
,p_column_identifier=>'AG'
,p_column_label=>'Ssdw Src Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516366667960772)
,p_db_column_name=>'SSDW_SRC_DOC_PFX'
,p_display_order=>400
,p_column_identifier=>'AF'
,p_column_label=>'Ssdw Src Doc Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515977881960768)
,p_db_column_name=>'SSDW_SUPLR_BAL_AMT'
,p_display_order=>370
,p_column_identifier=>'AB'
,p_column_label=>'Ssdw Suplr Bal Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693081616425797)
,p_db_column_name=>'SSDW_SUPLR_DOC_MODE'
,p_display_order=>240
,p_column_identifier=>'G'
,p_column_label=>'Ssdw Suplr Doc Mode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692949903425796)
,p_db_column_name=>'SSDW_SUPLR_DOC_TYPE'
,p_display_order=>230
,p_column_identifier=>'F'
,p_column_label=>'Ssdw Suplr Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692830808425795)
,p_db_column_name=>'SSDW_SUPLR_ID'
,p_display_order=>220
,p_column_identifier=>'E'
,p_column_label=>'Ssdw Suplr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515905721960767)
,p_db_column_name=>'SSDW_SUPLR_INPROC_AMT'
,p_display_order=>360
,p_column_identifier=>'AA'
,p_column_label=>'Ssdw Suplr Inproc Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315694272480425809)
,p_db_column_name=>'SSDW_TC_CL_BAL'
,p_display_order=>300
,p_column_identifier=>'S'
,p_column_label=>'Ssdw Tc Cl Bal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315694193316425808)
,p_db_column_name=>'SSDW_TC_CR_AMT'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Ssdw Tc Cr Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515535122960764)
,p_db_column_name=>'SSDW_TC_CURR'
,p_display_order=>330
,p_column_identifier=>'X'
,p_column_label=>'Ssdw Tc Curr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315694119783425807)
,p_db_column_name=>'SSDW_TC_DB_AMT'
,p_display_order=>140
,p_column_identifier=>'Q'
,p_column_label=>'Ssdw Tc Db Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316515693149960765)
,p_db_column_name=>'SSDW_TC_EX_RATE'
,p_display_order=>340
,p_column_identifier=>'Y'
,p_column_label=>'Ssdw Tc Ex Rate'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315693960639425806)
,p_db_column_name=>'SSDW_TC_OP_BAL'
,p_display_order=>290
,p_column_identifier=>'P'
,p_column_label=>'Ssdw Tc Op Bal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315692673983425793)
,p_db_column_name=>'SSDW_TO_DT'
,p_display_order=>200
,p_column_identifier=>'C'
,p_column_label=>'Ssdw To Dt'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516032198960769)
,p_db_column_name=>'SSDW_TRANS_TYPE'
,p_display_order=>380
,p_column_identifier=>'AC'
,p_column_label=>'Ssdw Trans Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517679502960785)
,p_db_column_name=>'SSDW_UPD_BY'
,p_display_order=>500
,p_column_identifier=>'AS'
,p_column_label=>'Ssdw Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518019552960788)
,p_db_column_name=>'SSDW_UPD_DATE'
,p_display_order=>530
,p_column_identifier=>'AV'
,p_column_label=>'Ssdw Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316518176617960790)
,p_db_column_name=>'SSDW_UPD_EMP_ID'
,p_display_order=>550
,p_column_identifier=>'AX'
,p_column_label=>'Ssdw Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517776048960786)
,p_db_column_name=>'SSDW_UPD_IP_ADDR'
,p_display_order=>510
,p_column_identifier=>'AT'
,p_column_label=>'Ssdw Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316517905243960787)
,p_db_column_name=>'SSDW_UPD_OS_USER'
,p_display_order=>520
,p_column_identifier=>'AU'
,p_column_label=>'Ssdw Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6316516578859960774)
,p_db_column_name=>'SSDW_VOU_TYPE'
,p_display_order=>50
,p_column_identifier=>'AH'
,p_column_label=>'Ssdw Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6334127286902160954)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1902853'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SSDW_BU:SSDW_BFCRY_TYPE:SSDW_DOC_DATE:SSDW_VOU_TYPE:SSDW_DOC_PFX_SYS:SSDW_DOC_NO_SYS:SSDW_BILL_DATE:SSDW_BILL_NO:SSDW_DR_CR:SSDW_TC_DB_AMT:SSDW_TC_CR_AMT:SSDW_BC_DB_AMT:SSDW_BC_CR_AMT:SSDW_FR_DT:SSDW_TO_DT:SSDW_SEQ_NO:SSDW_SUPLR_ID:SSDW_SUPLR_DOC_TYP'
||'E:SSDW_SUPLR_DOC_MODE:SSDW_LGR_TYPE:SSDW_PLANT:SSDW_DOC_PFX:SSDW_DOC_NO:SSDW_TC_OP_BAL:SSDW_TC_CL_BAL:SSDW_BC_OP_BAL:SSDW_BC_CL_BAL:SSDW_TC_CURR:SSDW_TC_EX_RATE:SSDW_NARRATION:SSDW_SUPLR_INPROC_AMT:SSDW_SUPLR_BAL_AMT:SSDW_TRANS_TYPE:SSDW_PAY_TYPE:SSD'
||'W_SRC_DOC_PFX:SSDW_SRC_DOC_NO:SSDW_OP_BAL:SSDW_CL_BAL:SSDW_PARTY_ID:SSDW_OP_BAL_BC:SSDW_CRE_BY:SSDW_CRE_IP_ADDR:SSDW_CRE_OS_USER:SSDW_CRE_DATE:SSDW_UPD_BY:SSDW_UPD_IP_ADDR:SSDW_UPD_OS_USER:SSDW_UPD_DATE:SSDW_CRE_EMP_ID:SSDW_UPD_EMP_ID:SSDW_DAIRY_COC_'
||'ID:SSDW_DAIRY_ROUTE_ID:SSDW_DAIRY_CAN_ID:SSDW_PROJ_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6310456436491312306)
,p_plug_name=>'P118132066_UNIT'
,p_static_id=>'p118132066-unit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PPH_BU,',
'       PPH_PLANT,',
'       PPH_PARTY,',
'       PPH_CURRENCY,',
'       PPH_SEL_FLAG,',
'       PPH_DATE_FROM,',
'       PPH_DATE_TO,',
'       PPH_DOC_TYPE,',
'       PPH_PAR_TYPE,',
'       PPH_INC_SYS_DOC,',
'       PPH_CRE_BY,',
'       PPH_CRE_IP_ADDR,',
'       PPH_CRE_OS_USER,',
'       PPH_CRE_DATE,',
'       PPH_UPD_BY,',
'       PPH_UPD_IP_ADDR,',
'       PPH_UPD_OS_USER,',
'       PPH_UPD_DATE,',
'       PPH_CRE_EMP_ID,',
'       PPH_UPD_EMP_ID,',
'       PAC_ACCT_CODE,',
'       PPP_PROJ_ID',
'  from PARTY_PARAM_HD,',
'       PARTY_PROJECTS_PARAM,',
'       PARTY_ACCT_CODES;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'P118132066_UNIT'
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
 p_id=>wwv_flow_imp.id(6310456923261312310)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>166614893854791049
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691718820425783)
,p_db_column_name=>'PAC_ACCT_CODE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Pac Acct Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6310457028334312311)
,p_db_column_name=>'PPH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pph Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690522403425771)
,p_db_column_name=>'PPH_CRE_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Pph Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690812877425774)
,p_db_column_name=>'PPH_CRE_DATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Pph Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691317378425779)
,p_db_column_name=>'PPH_CRE_EMP_ID'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Pph Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690589534425772)
,p_db_column_name=>'PPH_CRE_IP_ADDR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pph Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690641231425773)
,p_db_column_name=>'PPH_CRE_OS_USER'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Pph Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315689761215425764)
,p_db_column_name=>'PPH_CURRENCY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Pph Currency'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315689934863425766)
,p_db_column_name=>'PPH_DATE_FROM'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Pph Date From'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690115822425767)
,p_db_column_name=>'PPH_DATE_TO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Pph Date To'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690171116425768)
,p_db_column_name=>'PPH_DOC_TYPE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Pph Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690339155425770)
,p_db_column_name=>'PPH_INC_SYS_DOC'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Pph Inc Sys Doc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315689693072425763)
,p_db_column_name=>'PPH_PARTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Pph Party'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690273256425769)
,p_db_column_name=>'PPH_PAR_TYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pph Par Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315689596720425762)
,p_db_column_name=>'PPH_PLANT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Pph Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315689895626425765)
,p_db_column_name=>'PPH_SEL_FLAG'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pph Sel Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690850850425775)
,p_db_column_name=>'PPH_UPD_BY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Pph Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691175314425778)
,p_db_column_name=>'PPH_UPD_DATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Pph Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691398066425780)
,p_db_column_name=>'PPH_UPD_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Pph Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315690988380425776)
,p_db_column_name=>'PPH_UPD_IP_ADDR'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Pph Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691057105425777)
,p_db_column_name=>'PPH_UPD_OS_USER'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Pph Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6315691824977425784)
,p_db_column_name=>'PPP_PROJ_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Ppp Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6315723965011575192)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1718820'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PPH_BU:PPH_PLANT:PPH_PARTY:PPH_CURRENCY:PPH_SEL_FLAG:PPH_DATE_FROM:PPH_DATE_TO:PPH_DOC_TYPE:PPH_PAR_TYPE:PPH_INC_SYS_DOC:PPH_CRE_BY:PPH_CRE_IP_ADDR:PPH_CRE_OS_USER:PPH_CRE_DATE:PPH_UPD_BY:PPH_UPD_IP_ADDR:PPH_UPD_OS_USER:PPH_UPD_DATE:PPH_CRE_EMP_ID:PP'
||'H_UPD_EMP_ID:PAC_ACCT_CODE:PPP_PROJ_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6310456365947312305)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_button_name=>'GENERATE'
,p_static_id=>'generate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_icon_css_classes=>'fa-check-square'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310456151887312303)
,p_name=>'P118132066_CURR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Curr'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CURR'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310455990021312301)
,p_name=>'P118132066_DATE_FROM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Date From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310456105804312302)
,p_name=>'P118132066_DATE_TO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Date To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6315691520748425781)
,p_name=>'P118132066_FLAG_PARENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310455708590312298)
,p_name=>'P118132066_INCLUDE_SYS_DOC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Include Sys. Doc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310455577165312297)
,p_name=>'P118132066_PARENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Parent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310455769963312299)
,p_name=>'P118132066_PARTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_PARTY'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6310455850557312300)
,p_name=>'P118132066_PARTY_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_prompt=>'Party Desc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6315691536217425782)
,p_name=>'P118132066_PART_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6315692010859425786)
,p_name=>'P118132066_SUPLR_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6310455445665312296)
,p_item_default=>'C'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
