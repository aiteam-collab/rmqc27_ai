prompt --application/pages/page_211130015
begin
--   Manifest
--     PAGE: 211130015
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
 p_id=>211130015
,p_name=>'Create Appl. Users(Admin)'
,p_alias=>'CREATE_APPL_USERS'
,p_step_title=>'Create Appl. Users(Admin)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'}',
'a {',
'    color: #dd8220;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5671627978699646534)
,p_plug_name=>'Create Appl. Users(Admin)'
,p_static_id=>'create-appl-users-admin'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       APPLUSER_EFF_FROM,',
'       APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       (SELECT emp_first_name1 FROM EMPLOYEES',
'         WHERE EMP_BU = APPLUSER_BU',
'           AND EMP_EMP_ID = APPLUSER_EMP_ID',
'           AND EMP_STATUS = ''A'') NAME,',
'       DECODE(APPLUSER_STATUS,''N'',''New'',',
'                              ''A'',''Active'',',
'                              ''D'',''Inactive'') APPLUSER_STATUS,',
'       DECODE(APPLUSER_STATUS,''N'',''blue'',',
'                              ''A'',''green'',',
'                              ''D'',''Brown'') STATUS_COLOR,',
'       APPLUSER_ACTIVE_DATE,',
'       APPLUSER_DELETE_DATE,',
'       APPLUSER_LOCK_CHK,',
'       DECODE(APPLUSER_USER_TYPE,''R'',''ERP Admin'',',
'                                 ''E'',''ERP User'',',
'                                 ''U'',''ESS User'',',
'                                 ''P'',''POS User'',',
'                                 ''C'',''Customer'',',
'                                 ''S'',''Supplier'') APPLUSER_USER_TYPE,',
'       APPLUSER_CUST_ID,',
'       APPLUSER_SUPLR_ID,',
'       APPLUSER_EXCEL_OPOFF_FLAG,',
'       APPLUSER_PW_LUD,',
'       APPLUSER_SYS_ADMIN,',
'       APPLUSER_PWD_EXP_DUE,',
'       APPLUSER_PW_EXP_RQRD,',
'       APPLUSER_PW_EXP_DAYS,',
'       APPLUSER_SEARCH_LOV,',
'       APPLUSER_LABEL_CTRL,',
'       APPLUSER_LABEL_LANG,',
'       APPLUSER_MOB_USER,',
'       APPLUSER_OTP,',
'       APPLUSER_OTP_EXPIRE,',
'       APPLUSER_MIS_DEPT_TYPE,',
'       APPLUSER_CONFG_COLOR,',
'       APPLUSER_ENTRY_COLOR,',
'       APPLUSER_QUERY_COLOR,',
'       APPLUSER_REPORT_COLOR,',
'       APPLUSER_OTHERS_COLOR,',
'       APPLUSER_PREV_LOG_IN_DATE,',
'       APPLUSER_CURR_LOG_IN_DATE,',
'       APPLUSER_CRE_BY,',
'       APPLUSER_CRE_IP_ADDR,',
'       APPLUSER_CRE_OS_USER,',
'       APPLUSER_CRE_DATE,',
'       APPLUSER_UPD_BY,',
'       APPLUSER_UPD_IP_ADDR,',
'       APPLUSER_UPD_OS_USER,',
'       APPLUSER_UPD_DATE,',
'       APPLUSER_MOBILE_USER,',
'       APPLUSER_CRE_EMP_ID,',
'       APPLUSER_UPD_EMP_ID,',
'       APPLUSER_APPR_USER,',
'       APPLUSER_CSD_USER,',
'       APPLUSER_CUST_PORT_USER,',
'       APPLUSER_DASHBOARD_USER,',
'       APPLUSER_ERP_ADMIN_USER,',
'       APPLUSER_ERP_USER,',
'       APPLUSER_ESS_USER,',
'       APPLUSER_HRMS_USER,',
'       APPLUSER_MKTG_USER,',
'       APPLUSER_PROD_USER,',
'       APPLUSER_SMW_USER,',
'       APPLUSER_SUBCONTR_PORT_USER,',
'       APPLUSER_SUPLR_PORT_USER,',
'       APPLUSER_SYS_ADMIN_USER,',
'       APPLUSER_DEVICE_UUID,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_TYPE,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       (SELECT hrpos_pos_name1',
'	 	  FROM hr_positions',
'	 	 WHERE hrpos_bu = APPLUSER_BU',
'	 	     AND hrpos_pos_id = APPLUSER_POS_ID) POS_DESC,',
'       APPLUSER_DEPT_ID,',
'       (SELECT dept_name1',
'	 	  FROM departments',
'	 	 WHERE dept_bu = APPLUSER_BU',
'	 	   AND dept_id = APPLUSER_DEPT_ID) DEPT_DESC,',
'       APPLUSER_SHOP_ID,',
'       APPLUSER_COUNTER_ID,',
'       APPLUSER_PWD_EXPIRED,',
'       APPLUSER_MGMT_TYPE',
'  from APPL_USERS',
'  where APPLUSER_BU = :GLOBAL_BU',
'  and APPLUSER_STATUS=''N'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P211130015_SELECT_LIST'
,p_plug_display_when_cond2=>'OE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Create Appl. Users(Admin)'
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
 p_id=>wwv_flow_imp.id(5671628090459646535)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>189666254916035507
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628843065646543)
,p_db_column_name=>'APPLUSER_ACTIVE_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Appluser Active Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693796726039073630)
,p_db_column_name=>'APPLUSER_APPR_USER'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Appluser Appr User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628214155646536)
,p_db_column_name=>'APPLUSER_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Appluser Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630743250646562)
,p_db_column_name=>'APPLUSER_CONFG_COLOR'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Appluser Confg Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798858240073652)
,p_db_column_name=>'APPLUSER_COUNTER_ID'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Appluser Counter Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631469160646569)
,p_db_column_name=>'APPLUSER_CRE_BY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Appluser Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631824875646572)
,p_db_column_name=>'APPLUSER_CRE_DATE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Appluser Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671632420744646578)
,p_db_column_name=>'APPLUSER_CRE_EMP_ID'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Appluser Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631559606646570)
,p_db_column_name=>'APPLUSER_CRE_IP_ADDR'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Appluser Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631681675646571)
,p_db_column_name=>'APPLUSER_CRE_OS_USER'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Appluser Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693796826478073631)
,p_db_column_name=>'APPLUSER_CSD_USER'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Appluser Csd User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631380596646568)
,p_db_column_name=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Appluser Curr Log In Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629277457646547)
,p_db_column_name=>'APPLUSER_CUST_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Appluser Cust Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693796880166073632)
,p_db_column_name=>'APPLUSER_CUST_PORT_USER'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Appluser Cust Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693796980119073633)
,p_db_column_name=>'APPLUSER_DASHBOARD_USER'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Appluser Dashboard User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629019609646544)
,p_db_column_name=>'APPLUSER_DELETE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Appluser Delete Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798644538073650)
,p_db_column_name=>'APPLUSER_DEPT_ID'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Appluser Dept Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798086139073644)
,p_db_column_name=>'APPLUSER_DEVICE_UUID'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Appluser Device Uuid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628482621646539)
,p_db_column_name=>'APPLUSER_EFF_FROM'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628607410646540)
,p_db_column_name=>'APPLUSER_EFF_TO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798208364073645)
,p_db_column_name=>'APPLUSER_EMAIL_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628730811646541)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630905530646563)
,p_db_column_name=>'APPLUSER_ENTRY_COLOR'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Appluser Entry Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797035913073634)
,p_db_column_name=>'APPLUSER_ERP_ADMIN_USER'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Appluser Erp Admin User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797167170073635)
,p_db_column_name=>'APPLUSER_ERP_USER'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Appluser Erp User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797314898073636)
,p_db_column_name=>'APPLUSER_ESS_USER'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Appluser Ess User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629476228646549)
,p_db_column_name=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Appluser Excel Opoff Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797353391073637)
,p_db_column_name=>'APPLUSER_HRMS_USER'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Appluser Hrms User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628295253646537)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User ID'
,p_column_link=>'f?p=&APP_ID.:2111300151:&SESSION.::&DEBUG.::P2111300151_ROWID:#ROWID#'
,p_column_linktext=>'#APPLUSER_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630176463646556)
,p_db_column_name=>'APPLUSER_LABEL_CTRL'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Appluser Label Ctrl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630262099646557)
,p_db_column_name=>'APPLUSER_LABEL_LANG'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Appluser Label Lang'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629083251646545)
,p_db_column_name=>'APPLUSER_LOCK_CHK'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Appluser Lock Chk'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693799035749073654)
,p_db_column_name=>'APPLUSER_MGMT_TYPE'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Appluser Mgmt Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630735283646561)
,p_db_column_name=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Appluser Mis Dept Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797442113073638)
,p_db_column_name=>'APPLUSER_MKTG_USER'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Appluser Mktg User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798246168073646)
,p_db_column_name=>'APPLUSER_MOBILE_NO'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671632274025646577)
,p_db_column_name=>'APPLUSER_MOBILE_USER'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Appluser Mobile User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630415312646558)
,p_db_column_name=>'APPLUSER_MOB_USER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Appluser Mob User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631227036646566)
,p_db_column_name=>'APPLUSER_OTHERS_COLOR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Appluser Others Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630437918646559)
,p_db_column_name=>'APPLUSER_OTP'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Appluser Otp'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630552662646560)
,p_db_column_name=>'APPLUSER_OTP_EXPIRE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Appluser Otp Expire'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798442197073648)
,p_db_column_name=>'APPLUSER_PARTY_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Appluser Party Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798351034073647)
,p_db_column_name=>'APPLUSER_PARTY_TYPE'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Appluser Party Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628418944646538)
,p_db_column_name=>'APPLUSER_PASSWORD'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Appluser Password'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798545367073649)
,p_db_column_name=>'APPLUSER_POS_ID'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Position ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631250968646567)
,p_db_column_name=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Appluser Prev Log In Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797557547073639)
,p_db_column_name=>'APPLUSER_PROD_USER'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Appluser Prod User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798985711073653)
,p_db_column_name=>'APPLUSER_PWD_EXPIRED'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Appluser Pwd Expired'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629834345646552)
,p_db_column_name=>'APPLUSER_PWD_EXP_DUE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Appluser Pwd Exp Due'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629951251646554)
,p_db_column_name=>'APPLUSER_PW_EXP_DAYS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Appluser Pw Exp Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629897440646553)
,p_db_column_name=>'APPLUSER_PW_EXP_RQRD'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Appluser Pw Exp Rqrd'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629594338646550)
,p_db_column_name=>'APPLUSER_PW_LUD'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Appluser Pw Lud'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630975391646564)
,p_db_column_name=>'APPLUSER_QUERY_COLOR'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Appluser Query Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631118291646565)
,p_db_column_name=>'APPLUSER_REPORT_COLOR'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Appluser Report Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671630096766646555)
,p_db_column_name=>'APPLUSER_SEARCH_LOV'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Appluser Search Lov'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693798795274073651)
,p_db_column_name=>'APPLUSER_SHOP_ID'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Appluser Shop Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797677486073640)
,p_db_column_name=>'APPLUSER_SMW_USER'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Appluser Smw User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671628789166646542)
,p_db_column_name=>'APPLUSER_STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#; font-weight:bold;">#APPLUSER_STATUS#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797755343073641)
,p_db_column_name=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Appluser Subcontr Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629392153646548)
,p_db_column_name=>'APPLUSER_SUPLR_ID'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Appluser Suplr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797891512073642)
,p_db_column_name=>'APPLUSER_SUPLR_PORT_USER'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Appluser Suplr Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629690909646551)
,p_db_column_name=>'APPLUSER_SYS_ADMIN'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Appluser Sys Admin'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693797954096073643)
,p_db_column_name=>'APPLUSER_SYS_ADMIN_USER'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Appluser Sys Admin User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631918162646573)
,p_db_column_name=>'APPLUSER_UPD_BY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Appluser Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671632171241646576)
,p_db_column_name=>'APPLUSER_UPD_DATE'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Appluser Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693796610242073629)
,p_db_column_name=>'APPLUSER_UPD_EMP_ID'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Appluser Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671631956157646574)
,p_db_column_name=>'APPLUSER_UPD_IP_ADDR'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Appluser Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671632047596646575)
,p_db_column_name=>'APPLUSER_UPD_OS_USER'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Appluser Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5671629185214646546)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693799414762073657)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693799173605073655)
,p_db_column_name=>'NAME'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693799247053073656)
,p_db_column_name=>'POS_DESC'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5693799469137073658)
,p_db_column_name=>'ROWID'
,p_display_order=>730
,p_column_identifier=>'BU'
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
 p_id=>wwv_flow_imp.id(5693799595222073659)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5693824563179076104)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2118628'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APPLUSER_ID:APPLUSER_USER_TYPE:APPLUSER_EMP_ID:NAME:POS_DESC:DEPT_DESC:APPLUSER_EFF_FROM:APPLUSER_EFF_TO:APPLUSER_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7665671704913053778)
,p_plug_name=>'Create Appl. Users(Admin)'
,p_static_id=>'create-appl-users-admin-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       APPLUSER_EFF_FROM,',
'       APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       (SELECT emp_first_name1 FROM EMPLOYEES',
'         WHERE EMP_BU = APPLUSER_BU',
'           AND EMP_EMP_ID = APPLUSER_EMP_ID',
'           AND EMP_STATUS = ''A'') NAME,',
'       DECODE(APPLUSER_STATUS,''N'',''New'',',
'                              ''A'',''Active'',',
'                              ''D'',''Inactive'') APPLUSER_STATUS,',
'       DECODE(APPLUSER_STATUS,''N'',''blue'',',
'                              ''A'',''green'',',
'                              ''D'',''Brown'') STATUS_COLOR,',
'       APPLUSER_ACTIVE_DATE,',
'       APPLUSER_DELETE_DATE,',
'       APPLUSER_LOCK_CHK,',
'       DECODE(APPLUSER_USER_TYPE,''R'',''ERP Admin'',',
'                                 ''E'',''ERP User'',',
'                                 ''U'',''ESS User'',',
'                                 ''P'',''POS User'',',
'                                 ''C'',''Customer'',',
'                                 ''S'',''Supplier'') APPLUSER_USER_TYPE,',
'       APPLUSER_CUST_ID,',
'       APPLUSER_SUPLR_ID,',
'       APPLUSER_EXCEL_OPOFF_FLAG,',
'       APPLUSER_PW_LUD,',
'       APPLUSER_SYS_ADMIN,',
'       APPLUSER_PWD_EXP_DUE,',
'       APPLUSER_PW_EXP_RQRD,',
'       APPLUSER_PW_EXP_DAYS,',
'       APPLUSER_SEARCH_LOV,',
'       APPLUSER_LABEL_CTRL,',
'       APPLUSER_LABEL_LANG,',
'       APPLUSER_MOB_USER,',
'       APPLUSER_OTP,',
'       APPLUSER_OTP_EXPIRE,',
'       APPLUSER_MIS_DEPT_TYPE,',
'       APPLUSER_CONFG_COLOR,',
'       APPLUSER_ENTRY_COLOR,',
'       APPLUSER_QUERY_COLOR,',
'       APPLUSER_REPORT_COLOR,',
'       APPLUSER_OTHERS_COLOR,',
'       APPLUSER_PREV_LOG_IN_DATE,',
'       APPLUSER_CURR_LOG_IN_DATE,',
'       APPLUSER_CRE_BY,',
'       APPLUSER_CRE_IP_ADDR,',
'       APPLUSER_CRE_OS_USER,',
'       APPLUSER_CRE_DATE,',
'       APPLUSER_UPD_BY,',
'       APPLUSER_UPD_IP_ADDR,',
'       APPLUSER_UPD_OS_USER,',
'       APPLUSER_UPD_DATE,',
'       APPLUSER_MOBILE_USER,',
'       APPLUSER_CRE_EMP_ID,',
'       APPLUSER_UPD_EMP_ID,',
'       APPLUSER_APPR_USER,',
'       APPLUSER_CSD_USER,',
'       APPLUSER_CUST_PORT_USER,',
'       APPLUSER_DASHBOARD_USER,',
'       APPLUSER_ERP_ADMIN_USER,',
'       APPLUSER_ERP_USER,',
'       APPLUSER_ESS_USER,',
'       APPLUSER_HRMS_USER,',
'       APPLUSER_MKTG_USER,',
'       APPLUSER_PROD_USER,',
'       APPLUSER_SMW_USER,',
'       APPLUSER_SUBCONTR_PORT_USER,',
'       APPLUSER_SUPLR_PORT_USER,',
'       APPLUSER_SYS_ADMIN_USER,',
'       APPLUSER_DEVICE_UUID,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_TYPE,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       (SELECT hrpos_pos_name1',
'	 	  FROM hr_positions',
'	 	 WHERE hrpos_bu = APPLUSER_BU',
'	 	     AND hrpos_pos_id = APPLUSER_POS_ID) POS_DESC,',
'       APPLUSER_DEPT_ID,',
'       (SELECT dept_name1',
'	 	  FROM departments',
'	 	 WHERE dept_bu = APPLUSER_BU',
'	 	   AND dept_id = APPLUSER_DEPT_ID) DEPT_DESC,',
'       APPLUSER_SHOP_ID,',
'       APPLUSER_COUNTER_ID,',
'       APPLUSER_PWD_EXPIRED,',
'       APPLUSER_MGMT_TYPE',
'  from APPL_USERS',
'  where APPLUSER_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P211130015_SELECT_LIST'
,p_plug_display_when_cond2=>'AE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Create Appl. Users(Admin)'
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
 p_id=>wwv_flow_imp.id(7665671786211053778)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2183709950667442750
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225405181635480796)
,p_db_column_name=>'APPLUSER_ACTIVE_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Appluser Active Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225419898796480912)
,p_db_column_name=>'APPLUSER_APPR_USER'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Appluser Appr User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225402482600480782)
,p_db_column_name=>'APPLUSER_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Appluser Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225412804157480865)
,p_db_column_name=>'APPLUSER_CONFG_COLOR'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Appluser Confg Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225428594477481026)
,p_db_column_name=>'APPLUSER_COUNTER_ID'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Appluser Counter Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225415510435480888)
,p_db_column_name=>'APPLUSER_CRE_BY'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Appluser Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225416733908480893)
,p_db_column_name=>'APPLUSER_CRE_DATE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Appluser Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225419104172480907)
,p_db_column_name=>'APPLUSER_CRE_EMP_ID'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Appluser Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225415919484480890)
,p_db_column_name=>'APPLUSER_CRE_IP_ADDR'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Appluser Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225416253355480892)
,p_db_column_name=>'APPLUSER_CRE_OS_USER'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Appluser Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225420308971480913)
,p_db_column_name=>'APPLUSER_CSD_USER'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Appluser Csd User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225415222447480885)
,p_db_column_name=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Appluser Curr Log In Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225406765506480806)
,p_db_column_name=>'APPLUSER_CUST_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Appluser Cust Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225420702982480915)
,p_db_column_name=>'APPLUSER_CUST_PORT_USER'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Appluser Cust Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225421062959480918)
,p_db_column_name=>'APPLUSER_DASHBOARD_USER'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Appluser Dashboard User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225405565277480798)
,p_db_column_name=>'APPLUSER_DELETE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Appluser Delete Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225427815692481017)
,p_db_column_name=>'APPLUSER_DEPT_ID'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Appluser Dept Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225425376514480990)
,p_db_column_name=>'APPLUSER_DEVICE_UUID'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Appluser Device Uuid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225403586318480788)
,p_db_column_name=>'APPLUSER_EFF_FROM'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225404024769480792)
,p_db_column_name=>'APPLUSER_EFF_TO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225425741472480993)
,p_db_column_name=>'APPLUSER_EMAIL_ID'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225404400225480795)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225413203030480868)
,p_db_column_name=>'APPLUSER_ENTRY_COLOR'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Appluser Entry Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225421441632480934)
,p_db_column_name=>'APPLUSER_ERP_ADMIN_USER'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Appluser Erp Admin User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225421930310480937)
,p_db_column_name=>'APPLUSER_ERP_USER'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Appluser Erp User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225422282298480940)
,p_db_column_name=>'APPLUSER_ESS_USER'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Appluser Ess User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225407618234480812)
,p_db_column_name=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Appluser Excel Opoff Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225422697420480974)
,p_db_column_name=>'APPLUSER_HRMS_USER'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Appluser Hrms User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225402885498480785)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'User ID'
,p_column_link=>'f?p=&APP_ID.:2111300151:&SESSION.::&DEBUG.::P2111300151_ROWID:#ROWID#'
,p_column_linktext=>'#APPLUSER_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225410384829480824)
,p_db_column_name=>'APPLUSER_LABEL_CTRL'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Appluser Label Ctrl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225410832693480834)
,p_db_column_name=>'APPLUSER_LABEL_LANG'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Appluser Label Lang'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225405968596480801)
,p_db_column_name=>'APPLUSER_LOCK_CHK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Appluser Lock Chk'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225429426692481031)
,p_db_column_name=>'APPLUSER_MGMT_TYPE'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Appluser Mgmt Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225412402369480862)
,p_db_column_name=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Appluser Mis Dept Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225423041506480974)
,p_db_column_name=>'APPLUSER_MKTG_USER'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Appluser Mktg User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225426212722481001)
,p_db_column_name=>'APPLUSER_MOBILE_NO'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225418706692480906)
,p_db_column_name=>'APPLUSER_MOBILE_USER'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Appluser Mobile User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225411231166480842)
,p_db_column_name=>'APPLUSER_MOB_USER'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Appluser Mob User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225414387207480881)
,p_db_column_name=>'APPLUSER_OTHERS_COLOR'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Appluser Others Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225411566769480851)
,p_db_column_name=>'APPLUSER_OTP'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Appluser Otp'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225411990319480857)
,p_db_column_name=>'APPLUSER_OTP_EXPIRE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Appluser Otp Expire'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225426989779481010)
,p_db_column_name=>'APPLUSER_PARTY_ID'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Appluser Party Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225426618465481007)
,p_db_column_name=>'APPLUSER_PARTY_TYPE'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Appluser Party Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225403203919480787)
,p_db_column_name=>'APPLUSER_PASSWORD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Appluser Password'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225427337611481012)
,p_db_column_name=>'APPLUSER_POS_ID'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Position ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225414737077480884)
,p_db_column_name=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Appluser Prev Log In Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225423468600480976)
,p_db_column_name=>'APPLUSER_PROD_USER'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Appluser Prod User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225428954215481029)
,p_db_column_name=>'APPLUSER_PWD_EXPIRED'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Appluser Pwd Expired'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225408835459480817)
,p_db_column_name=>'APPLUSER_PWD_EXP_DUE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Appluser Pwd Exp Due'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225409566169480820)
,p_db_column_name=>'APPLUSER_PW_EXP_DAYS'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Appluser Pw Exp Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225409213648480818)
,p_db_column_name=>'APPLUSER_PW_EXP_RQRD'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Appluser Pw Exp Rqrd'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225407977432480812)
,p_db_column_name=>'APPLUSER_PW_LUD'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Appluser Pw Lud'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225413592650480873)
,p_db_column_name=>'APPLUSER_QUERY_COLOR'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Appluser Query Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225413967101480878)
,p_db_column_name=>'APPLUSER_REPORT_COLOR'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Appluser Report Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225409938944480821)
,p_db_column_name=>'APPLUSER_SEARCH_LOV'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Appluser Search Lov'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225428141709481023)
,p_db_column_name=>'APPLUSER_SHOP_ID'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Appluser Shop Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225423877547480979)
,p_db_column_name=>'APPLUSER_SMW_USER'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Appluser Smw User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225404769448480795)
,p_db_column_name=>'APPLUSER_STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#; font-weight:bold;">#APPLUSER_STATUS#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225424290012480981)
,p_db_column_name=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Appluser Subcontr Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225407177454480809)
,p_db_column_name=>'APPLUSER_SUPLR_ID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Appluser Suplr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225424690480480982)
,p_db_column_name=>'APPLUSER_SUPLR_PORT_USER'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Appluser Suplr Port User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225408422591480815)
,p_db_column_name=>'APPLUSER_SYS_ADMIN'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Appluser Sys Admin'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225425076997480985)
,p_db_column_name=>'APPLUSER_SYS_ADMIN_USER'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Appluser Sys Admin User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225417049825480896)
,p_db_column_name=>'APPLUSER_UPD_BY'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Appluser Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225418312236480903)
,p_db_column_name=>'APPLUSER_UPD_DATE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Appluser Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225419448470480909)
,p_db_column_name=>'APPLUSER_UPD_EMP_ID'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Appluser Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225417489282480899)
,p_db_column_name=>'APPLUSER_UPD_IP_ADDR'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Appluser Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225417910802480901)
,p_db_column_name=>'APPLUSER_UPD_OS_USER'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Appluser Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225406400844480803)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225401286239480771)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>99
,p_column_identifier=>'BT'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225400440249480768)
,p_db_column_name=>'NAME'
,p_display_order=>79
,p_column_identifier=>'BR'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225400916905480770)
,p_db_column_name=>'POS_DESC'
,p_display_order=>89
,p_column_identifier=>'BS'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6225401703113480773)
,p_db_column_name=>'ROWID'
,p_display_order=>109
,p_column_identifier=>'BU'
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
 p_id=>wwv_flow_imp.id(6225402121135480781)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>119
,p_column_identifier=>'BV'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7665700205423066022)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6972620'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APPLUSER_ID:APPLUSER_USER_TYPE:APPLUSER_EMP_ID:NAME:APPLUSER_EMAIL_ID:APPLUSER_MOBILE_NO:POS_DESC:DEPT_DESC:APPLUSER_EFF_FROM:APPLUSER_EFF_TO:APPLUSER_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5693799827230073661)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5693799685874073660)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5671627978699646534)
,p_button_name=>'Add_User_1'
,p_static_id=>'add-user'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2111300151:&SESSION.::&DEBUG.:RR,2111300151:P2111300151_APPLUSER_ID:'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6225430043328481040)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7665671704913053778)
,p_button_name=>'Add_User'
,p_static_id=>'add-user-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2111300151:&SESSION.::&DEBUG.:RR,2111300151::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5948080574963654431)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5671627978699646534)
,p_button_name=>'Add_User1'
,p_static_id=>'add-user-3'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001502:&SESSION.::&DEBUG.:RR,2111300151::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5693799882242073662)
,p_name=>'P211130015_SELECT_LIST'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5693799827230073661)
,p_item_default=>'OE'
,p_prompt=>'Select List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:All Users;AE,Open Users;OE'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5704495962417615130)
,p_name=>'SUBMIT_PAGE'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P211130015_SELECT_LIST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5704496096991615131)
,p_event_id=>wwv_flow_imp.id(5704495962417615130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
