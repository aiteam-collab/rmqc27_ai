prompt --application/pages/page_211130022
begin
--   Manifest
--     PAGE: 211130022
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
 p_id=>211130022
,p_name=>'User Access'
,p_alias=>'USER-ACCESS1'
,p_step_title=>'User Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5619692586421165065)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5619662308504165003)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       to_char(APPLUSER_EFF_FROM,''dd-mm-rrrr'')APPLUSER_EFF_FROM,',
'       to_char(APPLUSER_EFF_TO,''dd-mm-rrrr'')APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       APPLUSER_STATUS,',
'       APPLUSER_ACTIVE_DATE,',
'       APPLUSER_DELETE_DATE,',
'       APPLUSER_LOCK_CHK,',
'       APPLUSER_USER_TYPE,',
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
'       APPLUSER_DEPT_ID,',
'       (SELECT DEPT_NAME1 ',
'          FROM Departments',
'         where DEPT_BU = :APPLUSER_BU',
'           and DEPT_ID = :APPLUSER_DEPT_ID ) dept_desc,',
'       APPLUSER_SHOP_ID,',
'       APPLUSER_COUNTER_ID,',
'       APPLUSER_PWD_EXPIRED,',
'       APPLUSER_MGMT_TYPE,',
'       APPLUSER_APEX_LANG',
'  from APPL_USERS',
'  where APPLUSER_BU = :global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'User Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5619662374287165003)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:2111300221:&APP_SESSION.::&DEBUG.:RP:P2111300221_APPLUSER_ID:\#APPLUSER_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>137700538743553975
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619665558433165023)
,p_db_column_name=>'APPLUSER_ACTIVE_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Appluser Active Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619690419492165059)
,p_db_column_name=>'APPLUSER_APEX_LANG'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Appluser Apex Lang'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619680361414165046)
,p_db_column_name=>'APPLUSER_APPR_USER'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Appluser Appr User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619662805436165017)
,p_db_column_name=>'APPLUSER_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Appluser Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619673150132165034)
,p_db_column_name=>'APPLUSER_CONFG_COLOR'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Appluser Confg Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619689185183165057)
,p_db_column_name=>'APPLUSER_COUNTER_ID'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Appluser Counter ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619676024852165040)
,p_db_column_name=>'APPLUSER_CRE_BY'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Appluser Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619677144709165042)
,p_db_column_name=>'APPLUSER_CRE_DATE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Appluser Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619679587853165045)
,p_db_column_name=>'APPLUSER_CRE_EMP_ID'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Appluser Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619676432637165042)
,p_db_column_name=>'APPLUSER_CRE_IP_ADDR'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Appluser Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619676806308165042)
,p_db_column_name=>'APPLUSER_CRE_OS_USER'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Appluser Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619680774849165046)
,p_db_column_name=>'APPLUSER_CSD_USER'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Appluser Csd User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619675566183165040)
,p_db_column_name=>'APPLUSER_CURR_LOG_IN_DATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Appluser Curr Log In Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619667170098165024)
,p_db_column_name=>'APPLUSER_CUST_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Appluser Cust ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619681156674165046)
,p_db_column_name=>'APPLUSER_CUST_PORT_USER'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Appluser Cust Port User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619681535758165048)
,p_db_column_name=>'APPLUSER_DASHBOARD_USER'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Appluser Dashboard User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619665961248165023)
,p_db_column_name=>'APPLUSER_DELETE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Appluser Delete Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619688375878165056)
,p_db_column_name=>'APPLUSER_DEPT_ID'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Appluser Dept ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619685950267165053)
,p_db_column_name=>'APPLUSER_DEVICE_UUID'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Appluser Device Uuid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619500611255044238)
,p_db_column_name=>'APPLUSER_EFF_FROM'
,p_display_order=>100
,p_column_identifier=>'BU'
,p_column_label=>'Appluser Eff From'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619500644155044239)
,p_db_column_name=>'APPLUSER_EFF_TO'
,p_display_order=>110
,p_column_identifier=>'BV'
,p_column_label=>'Appluser Eff To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619686384164165054)
,p_db_column_name=>'APPLUSER_EMAIL_ID'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Appluser Email ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619664740801165021)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619673631149165034)
,p_db_column_name=>'APPLUSER_ENTRY_COLOR'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Appluser Entry Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619682012675165048)
,p_db_column_name=>'APPLUSER_ERP_ADMIN_USER'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Appluser Erp Admin User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619682363052165048)
,p_db_column_name=>'APPLUSER_ERP_USER'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Appluser Erp User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619682778773165049)
,p_db_column_name=>'APPLUSER_ESS_USER'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Appluser Ess User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619667980091165026)
,p_db_column_name=>'APPLUSER_EXCEL_OPOFF_FLAG'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Appluser Excel Opoff Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619683173791165049)
,p_db_column_name=>'APPLUSER_HRMS_USER'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Appluser Hrms User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619663174435165018)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619670739925165029)
,p_db_column_name=>'APPLUSER_LABEL_CTRL'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Appluser Label Ctrl'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619671200583165031)
,p_db_column_name=>'APPLUSER_LABEL_LANG'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Appluser Label Lang'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619666364132165024)
,p_db_column_name=>'APPLUSER_LOCK_CHK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Appluser Lock Chk'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619689956124165059)
,p_db_column_name=>'APPLUSER_MGMT_TYPE'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Appluser Mgmt Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619672787630165032)
,p_db_column_name=>'APPLUSER_MIS_DEPT_TYPE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Appluser Mis Dept Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619683555415165049)
,p_db_column_name=>'APPLUSER_MKTG_USER'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Appluser Mktg User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619686833910165054)
,p_db_column_name=>'APPLUSER_MOBILE_NO'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Appluser Mobile No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619679170074165045)
,p_db_column_name=>'APPLUSER_MOBILE_USER'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Appluser Mobile User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619671591415165031)
,p_db_column_name=>'APPLUSER_MOB_USER'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Appluser Mob User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619674764469165038)
,p_db_column_name=>'APPLUSER_OTHERS_COLOR'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Appluser Others Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619671979357165031)
,p_db_column_name=>'APPLUSER_OTP'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Appluser Otp'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619672382420165032)
,p_db_column_name=>'APPLUSER_OTP_EXPIRE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Appluser Otp Expire'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619687576598165056)
,p_db_column_name=>'APPLUSER_PARTY_ID'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Appluser Party ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619687208951165054)
,p_db_column_name=>'APPLUSER_PARTY_TYPE'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Appluser Party Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619663550132165020)
,p_db_column_name=>'APPLUSER_PASSWORD'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Appluser Password'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619687937614165056)
,p_db_column_name=>'APPLUSER_POS_ID'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Appluser Pos ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619675150636165038)
,p_db_column_name=>'APPLUSER_PREV_LOG_IN_DATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Appluser Prev Log In Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619684028553165051)
,p_db_column_name=>'APPLUSER_PROD_USER'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Appluser Prod User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619689616809165057)
,p_db_column_name=>'APPLUSER_PWD_EXPIRED'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Appluser Pwd Expired'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619669196100165028)
,p_db_column_name=>'APPLUSER_PWD_EXP_DUE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Appluser Pwd Exp Due'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619669969220165029)
,p_db_column_name=>'APPLUSER_PW_EXP_DAYS'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Appluser Pw Exp Days'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619669625410165028)
,p_db_column_name=>'APPLUSER_PW_EXP_RQRD'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Appluser Pw Exp Rqrd'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619668375617165026)
,p_db_column_name=>'APPLUSER_PW_LUD'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Appluser Pw Lud'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619674025204165035)
,p_db_column_name=>'APPLUSER_QUERY_COLOR'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Appluser Query Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619674383425165037)
,p_db_column_name=>'APPLUSER_REPORT_COLOR'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Appluser Report Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619670405641165029)
,p_db_column_name=>'APPLUSER_SEARCH_LOV'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Appluser Search Lov'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619688752737165056)
,p_db_column_name=>'APPLUSER_SHOP_ID'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Appluser Shop ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619684340428165051)
,p_db_column_name=>'APPLUSER_SMW_USER'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Appluser Smw User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619665156260165021)
,p_db_column_name=>'APPLUSER_STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Appluser Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619684783246165051)
,p_db_column_name=>'APPLUSER_SUBCONTR_PORT_USER'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Appluser Subcontr Port User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619667621490165026)
,p_db_column_name=>'APPLUSER_SUPLR_ID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Appluser Suplr ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619685199263165053)
,p_db_column_name=>'APPLUSER_SUPLR_PORT_USER'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Appluser Suplr Port User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619668783458165028)
,p_db_column_name=>'APPLUSER_SYS_ADMIN'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Appluser Sys Admin'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619685621407165053)
,p_db_column_name=>'APPLUSER_SYS_ADMIN_USER'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Appluser Sys Admin User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619677558410165042)
,p_db_column_name=>'APPLUSER_UPD_BY'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Appluser Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619678799368165045)
,p_db_column_name=>'APPLUSER_UPD_DATE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Appluser Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619679976321165045)
,p_db_column_name=>'APPLUSER_UPD_EMP_ID'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Appluser Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619677936750165043)
,p_db_column_name=>'APPLUSER_UPD_IP_ADDR'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Appluser Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619678370918165043)
,p_db_column_name=>'APPLUSER_UPD_OS_USER'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Appluser Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619666784870165024)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Appluser User Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619500219627044234)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>90
,p_column_identifier=>'BT'
,p_column_label=>'Dept Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5619500062452044233)
,p_db_column_name=>'ROWID'
,p_display_order=>80
,p_column_identifier=>'BS'
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
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5619693681568166560)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1377319'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APPLUSER_ID:APPLUSER_BU:APPLUSER_PASSWORD:APPLUSER_EMP_ID:APPLUSER_STATUS:APPLUSER_ACTIVE_DATE:APPLUSER_DELETE_DATE:APPLUSER_LOCK_CHK:APPLUSER_USER_TYPE:APPLUSER_CUST_ID:APPLUSER_SUPLR_ID:APPLUSER_EXCEL_OPOFF_FLAG:APPLUSER_PW_LUD:APPLUSER_SYS_ADMIN:A'
||'PPLUSER_PWD_EXP_DUE:APPLUSER_PW_EXP_RQRD:APPLUSER_PW_EXP_DAYS:APPLUSER_SEARCH_LOV:APPLUSER_LABEL_CTRL:APPLUSER_LABEL_LANG:APPLUSER_MOB_USER:APPLUSER_OTP:APPLUSER_OTP_EXPIRE:APPLUSER_MIS_DEPT_TYPE:APPLUSER_CONFG_COLOR:APPLUSER_ENTRY_COLOR:APPLUSER_QUE'
||'RY_COLOR:APPLUSER_REPORT_COLOR:APPLUSER_OTHERS_COLOR:APPLUSER_PREV_LOG_IN_DATE:APPLUSER_CURR_LOG_IN_DATE:APPLUSER_CRE_BY:APPLUSER_CRE_IP_ADDR:APPLUSER_CRE_OS_USER:APPLUSER_CRE_DATE:APPLUSER_UPD_BY:APPLUSER_UPD_IP_ADDR:APPLUSER_UPD_OS_USER:APPLUSER_UP'
||'D_DATE:APPLUSER_MOBILE_USER:APPLUSER_CRE_EMP_ID:APPLUSER_UPD_EMP_ID:APPLUSER_APPR_USER:APPLUSER_CSD_USER:APPLUSER_CUST_PORT_USER:APPLUSER_DASHBOARD_USER:APPLUSER_ERP_ADMIN_USER:APPLUSER_ERP_USER:APPLUSER_ESS_USER:APPLUSER_HRMS_USER:APPLUSER_MKTG_USER'
||':APPLUSER_PROD_USER:APPLUSER_SMW_USER:APPLUSER_SUBCONTR_PORT_USER:APPLUSER_SUPLR_PORT_USER:APPLUSER_SYS_ADMIN_USER:APPLUSER_DEVICE_UUID:APPLUSER_EMAIL_ID:APPLUSER_MOBILE_NO:APPLUSER_PARTY_TYPE:APPLUSER_PARTY_ID:APPLUSER_POS_ID:APPLUSER_DEPT_ID:APPLUS'
||'ER_SHOP_ID:APPLUSER_COUNTER_ID:APPLUSER_PWD_EXPIRED:APPLUSER_MGMT_TYPE:APPLUSER_APEX_LANG'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5619690901757165059)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5619662308504165003)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2111300221:&APP_SESSION.::&DEBUG.:2111300221::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5619691210283165060)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5619662308504165003)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5619691644711165060)
,p_event_id=>wwv_flow_imp.id(5619691210283165060)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5619662308504165003)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
