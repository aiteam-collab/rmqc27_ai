prompt --application/pages/page_2361300104
begin
--   Manifest
--     PAGE: 2361300104
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
 p_id=>2361300104
,p_name=>'Work Flow User'
,p_alias=>'WORK-FLOW-USER'
,p_step_title=>'Work Flow Users'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'ref_fav();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'',
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(255, 255, 255, 0.15)',
'};',
'',
'',
'#cancelbtn{',
'        color: rgb(214, 19, 29);',
'        background-color:  #ffffff;',
'}',
'',
'#cancelbtn1{',
'         color: rgb(214, 19, 29);',
'         background-color: #ffffff;',
'}',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   /* background-color: rgba(0, 0, 0, 0.15); */',
'   background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   --top: -4px;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10468051560417483097)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_title=>'Find Work Flow Approval Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow:margin-bottom-none'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10468053403053483115)
,p_plug_name=>'Work Flow Report'
,p_static_id=>'work-flow-report'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       WFDCH_BU,',
'       WFDCH_TYPE,',
'       WFDCH_DOC_PFX,',
'       WFDCH_DOC_NO,',
'       WFDCH_STATUS,',
'       WFDCH_CTRL_PERSON,',
'       WFDCH_SPPLR_ID,',
'       WFDCH_CUST_ID,',
'       WFDCH_LVL1,',
'       WFDCH_LVL2,',
'       WFDCH_LVL3,',
'       WFDCH_LVL4,',
'       WFDCH_ACCTS,',
'       WFDCH_PRJ_ID,',
'       WFDCH_RND_PRJ_ID,',
'       WFDCH_JRNL_TYPE,',
'       WFDCH_SEQ_NO,',
'       WFDCH_QC_INS_MODE,',
'       WFDCH_FRWD_RTN,',
'       WFDCH_PO_MODE,',
'       WFDCH_MESSAGE,',
'       WFDCH_ACTION_DATE,',
'       WFDCH_QC_REV,',
'       WFDCH_PROD_ID,',
'       WFDCH_PROD_REV,',
'       WFDCH_PRIORITY,',
'       WFDCH_WF_NO,',
'       WFDCH_DOC_SFX,',
'       WFDCH_WRK_CNTR,',
'       WFDCH_PLNT,',
'       WFDCH_SELECT_FLAG,',
'       WFDCH_MAIL_FLAG,',
'       WFDCH_INT_MSG_FLAG,',
'       WFDCH_SMS_FLAG,',
'       WFDCH_FWD_PERSON,',
'       WFDCH_FWD_TO,',
'       WFDCH_NXT_STATUS,',
'       WFDCH_ACT,',
'       WFDCH_NXT_FWD_PERSON,',
'       WFDCH_NXT_MESSAGE,',
'       WFDCH_LVL_PRJ,',
'       WFDCH_AUTH_TYPE,',
'       WFDCH_DISC_PCT,',
'       WFDCH_BENF_TYPE,',
'       WFDCH_BENF_ID,',
'       WFDCH_BILL_DATE,',
'       WFDCH_BILL_NO,',
'       WFDCH_GROSS_AMT,',
'       WFDCH_TAX_AMT,',
'       WFDCH_BILL_AMT,',
'       WFDCH_INV_PFX,',
'       WFDCH_INV_NO,',
'       WFDCH_EMP_ID,',
'       WFDCH_CRE_BY,',
'       WFDCH_CRE_IP_ADDR,',
'       WFDCH_CRE_OS_USER,',
'       WFDCH_CRE_DATE,',
'       WFDCH_UPD_BY,',
'       WFDCH_UPD_IP_ADDR,',
'       WFDCH_UPD_DATE,',
'       WFDCH_COLL_CENTR_ID,',
'       WFDCH_CRE_EMP_ID,',
'       WFDCH_UPD_EMP_ID,',
'       WFDCH_INST_ID,',
'       WFDCH_INST_SER_NO,',
'       WFDCH_LVL5,',
'       WFDCH_LVL6,',
'       WFDCH_PLNT_LOC_ID,',
'       WFDCH_POS_BRANCH_ID,',
'       WFDCH_VOU_TYPE,',
'       WFDCH_SUB_VOU_TYPE,',
'       WFDCL_BU,',
'       WFDCL_TYPE,',
'       WFDCL_DOC_PFX,',
'       WFDCL_DOC_NO,',
'       WFDCL_STATUS,',
'       WFDCL_SPPLR_ID,',
'       WFDCL_CUST_ID,',
'       WFDCL_LVL1,',
'       WFDCL_LVL2,',
'       WFDCL_LVL3,',
'       WFDCL_LVL4,',
'       WFDCL_ACCTS,',
'       WFDCL_CTRL_PERSON,',
'       WFDCL_SEQNO,',
'       WFDCL_PRJ_ID,',
'       WFDCL_RND_PRJ_ID,',
'       WFDCL_JRNL_TYPE,',
'       WFDCL_VALUE,',
'       WFDCL_FRWD_RTN,',
'       WFDCL_MESSAGE,',
'       WFDCL_APPR_NO,',
'       WFDCL_QC_REV,',
'       WFDCL_ACTION_DATE,',
'       WFDCL_PROD_ID,',
'       WFDCL_PROD_REV,',
'       WFDCL_PRIORITY,',
'       WFDCL_PO_MODE,',
'       WFDCL_QC_INS_MODE,',
'       WFDCL_WF_NO,',
'       WFDCL_PLNT,',
'       WFDCL_PREV_CTRL_PERSON,',
'       WFDCL_DOC_SFX,',
'       WFDCL_SRC_BU,',
'       WFDCL_SRC_PLNT,',
'       WFDCL_SRC_USER,',
'       WFDCL_LVL_PRJ,',
'       WFDCL_AUTH_TYPE,',
'       WFDCL_EMP_ID,',
'       WFDCL_PREV_EMP_ID,',
'       WFDCL_PREV_BU,',
'       WFDCL_CRE_BY,',
'       WFDCL_CRE_IP_ADDR,',
'       WFDCL_CRE_OS_USER,',
'       WFDCL_CRE_DATE,',
'       WFDCL_UPD_BY,',
'       WFDCL_UPD_IP_ADDR,',
'       WFDCL_UPD_OS_USER,',
'       WFDCL_UPD_DATE,',
'       WFDCL_CRE_EMP_ID,',
'       WFDCL_UPD_EMP_ID,',
'       WFDCL_COLL_CENTR_ID,',
'       WFDCL_LVL5,',
'       WFDCL_LVL6,',
'       WFDCL_PLNT_LOC_ID,',
'       WFDCL_INST_ID,',
'       WFDCL_INST_SER_NO,',
'          (SELECT DISTINCT apt_pfx_type_desc',
'               FROM appl_pfx_types',
'               WHERE apt_bu = wfdch_bu ',
'               AND apt_pfx_type = wfdch_vou_type) VOU_TYPE_DESC,',
'    func_find_sub_vou_type_desc(wfdch_bu,wfdch_sub_vou_type)SUB_VOU_DESC,',
'	wfdch_doc_brief,',
'   (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id =  (SELECT appluser_emp_id',
'               FROM appl_users',
'              WHERE appluser_bu = wfdch_bu ',
'              AND  appluser_id = wfdch_cre_by ',
'              AND APPLUSER_EMP_ID = wfdch_emp_id) ) wfdch_emp_name,',
'         wfdch_fwd_on,',
'		 wfdch_value',
'  from WORKFLOW_USERWISE_VW',
'  WHERE WFDCH_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2361300104_WORK_FLOW_NAME,P2361300104_EMPLOYEE_NAME,P2361300104_MODULE,P2361300104_AUTH_BASSIS,P2361300104_AUTH_TYPE,P2361300104_SELF_APPROVAL,P2361300104_CODE,P2361300104_CODE_DESC,P2361300104_DATE_FROM,P2361300104_DATE_TO,P2361300104_SHOW_DATA,P23'
||'61300104_STATUS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Work Flow Report'
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
 p_id=>wwv_flow_imp.id(10468053454543483116)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4988532470758562914
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826600087503404434)
,p_db_column_name=>'SUB_VOU_DESC'
,p_display_order=>1320
,p_column_identifier=>'GP'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599996994404433)
,p_db_column_name=>'VOU_TYPE_DESC'
,p_display_order=>1310
,p_column_identifier=>'GO'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588277153404315)
,p_db_column_name=>'WFDCH_ACCTS'
,p_display_order=>130
,p_column_identifier=>'CA'
,p_column_label=>'Wfdch Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590795892404341)
,p_db_column_name=>'WFDCH_ACT'
,p_display_order=>390
,p_column_identifier=>'DA'
,p_column_label=>'Wfdch Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589150225404324)
,p_db_column_name=>'WFDCH_ACTION_DATE'
,p_display_order=>220
,p_column_identifier=>'CJ'
,p_column_label=>'Wfdch Action Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591412758404347)
,p_db_column_name=>'WFDCH_AUTH_TYPE'
,p_display_order=>450
,p_column_identifier=>'DG'
,p_column_label=>'Wfdch Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591779277404350)
,p_db_column_name=>'WFDCH_BENF_ID'
,p_display_order=>480
,p_column_identifier=>'DJ'
,p_column_label=>'Wfdch Benf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591667386404349)
,p_db_column_name=>'WFDCH_BENF_TYPE'
,p_display_order=>470
,p_column_identifier=>'DI'
,p_column_label=>'Wfdch Benf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592221929404305)
,p_db_column_name=>'WFDCH_BILL_AMT'
,p_display_order=>530
,p_column_identifier=>'DO'
,p_column_label=>'Wfdch Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591791590404351)
,p_db_column_name=>'WFDCH_BILL_DATE'
,p_display_order=>490
,p_column_identifier=>'DK'
,p_column_label=>'Wfdch Bill Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591940994404352)
,p_db_column_name=>'WFDCH_BILL_NO'
,p_display_order=>500
,p_column_identifier=>'DL'
,p_column_label=>'Wfdch Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587033954404303)
,p_db_column_name=>'WFDCH_BU'
,p_display_order=>10
,p_column_identifier=>'BO'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593284037404316)
,p_db_column_name=>'WFDCH_COLL_CENTR_ID'
,p_display_order=>640
,p_column_identifier=>'DZ'
,p_column_label=>'Wfdch Coll Centr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592659838404309)
,p_db_column_name=>'WFDCH_CRE_BY'
,p_display_order=>570
,p_column_identifier=>'DS'
,p_column_label=>'Wfdch Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592913002404312)
,p_db_column_name=>'WFDCH_CRE_DATE'
,p_display_order=>600
,p_column_identifier=>'DV'
,p_column_label=>'Wfdch Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593437837404317)
,p_db_column_name=>'WFDCH_CRE_EMP_ID'
,p_display_order=>650
,p_column_identifier=>'EA'
,p_column_label=>'Wfdch Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592695837404310)
,p_db_column_name=>'WFDCH_CRE_IP_ADDR'
,p_display_order=>580
,p_column_identifier=>'DT'
,p_column_label=>'Wfdch Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592862490404311)
,p_db_column_name=>'WFDCH_CRE_OS_USER'
,p_display_order=>590
,p_column_identifier=>'DU'
,p_column_label=>'Wfdch Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587489380404308)
,p_db_column_name=>'WFDCH_CTRL_PERSON'
,p_display_order=>60
,p_column_identifier=>'BT'
,p_column_label=>'Wfdch Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587705936404310)
,p_db_column_name=>'WFDCH_CUST_ID'
,p_display_order=>80
,p_column_identifier=>'BV'
,p_column_label=>'Wfdch Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591503301404348)
,p_db_column_name=>'WFDCH_DISC_PCT'
,p_display_order=>460
,p_column_identifier=>'DH'
,p_column_label=>'Wfdch Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590509134404338)
,p_db_column_name=>'WFDCH_DOC_BRIEF'
,p_display_order=>360
,p_column_identifier=>'CX'
,p_column_label=>'Wfdch Doc Brief'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587370645404306)
,p_db_column_name=>'WFDCH_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'BR'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587279304404305)
,p_db_column_name=>'WFDCH_DOC_PFX'
,p_display_order=>30
,p_column_identifier=>'BQ'
,p_column_label=>'Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589720418404330)
,p_db_column_name=>'WFDCH_DOC_SFX'
,p_display_order=>280
,p_column_identifier=>'CP'
,p_column_label=>'Wfdch Doc Sfx'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592583291404308)
,p_db_column_name=>'WFDCH_EMP_ID'
,p_display_order=>560
,p_column_identifier=>'DR'
,p_column_label=>'Wfdch Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826600249341404435)
,p_db_column_name=>'WFDCH_EMP_NAME'
,p_display_order=>1330
,p_column_identifier=>'GQ'
,p_column_label=>'Wfdch Emp Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588787074404321)
,p_db_column_name=>'WFDCH_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'CG'
,p_column_label=>'Wfdch Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591126599404344)
,p_db_column_name=>'WFDCH_FWD_ON'
,p_display_order=>420
,p_column_identifier=>'DD'
,p_column_label=>'Wfdch Fwd On'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590473098404337)
,p_db_column_name=>'WFDCH_FWD_PERSON'
,p_display_order=>350
,p_column_identifier=>'CW'
,p_column_label=>'Wfdch Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590638662404339)
,p_db_column_name=>'WFDCH_FWD_TO'
,p_display_order=>370
,p_column_identifier=>'CY'
,p_column_label=>'Wfdch Fwd To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592034186404303)
,p_db_column_name=>'WFDCH_GROSS_AMT'
,p_display_order=>510
,p_column_identifier=>'DM'
,p_column_label=>'Wfdch Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593681279404319)
,p_db_column_name=>'WFDCH_INST_ID'
,p_display_order=>670
,p_column_identifier=>'EC'
,p_column_label=>'Wfdch Inst Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593758695404320)
,p_db_column_name=>'WFDCH_INST_SER_NO'
,p_display_order=>680
,p_column_identifier=>'ED'
,p_column_label=>'Wfdch Inst Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590262137404335)
,p_db_column_name=>'WFDCH_INT_MSG_FLAG'
,p_display_order=>330
,p_column_identifier=>'CU'
,p_column_label=>'Wfdch Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592438752404307)
,p_db_column_name=>'WFDCH_INV_NO'
,p_display_order=>550
,p_column_identifier=>'DQ'
,p_column_label=>'Wfdch Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592320722404306)
,p_db_column_name=>'WFDCH_INV_PFX'
,p_display_order=>540
,p_column_identifier=>'DP'
,p_column_label=>'Wfdch Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588542431404318)
,p_db_column_name=>'WFDCH_JRNL_TYPE'
,p_display_order=>160
,p_column_identifier=>'CD'
,p_column_label=>'Wfdch Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587823340404311)
,p_db_column_name=>'WFDCH_LVL1'
,p_display_order=>90
,p_column_identifier=>'BW'
,p_column_label=>'Wfdch Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587893936404312)
,p_db_column_name=>'WFDCH_LVL2'
,p_display_order=>100
,p_column_identifier=>'BX'
,p_column_label=>'Wfdch Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587992204404313)
,p_db_column_name=>'WFDCH_LVL3'
,p_display_order=>110
,p_column_identifier=>'BY'
,p_column_label=>'Wfdch Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588117550404314)
,p_db_column_name=>'WFDCH_LVL4'
,p_display_order=>120
,p_column_identifier=>'BZ'
,p_column_label=>'Wfdch Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593810799404321)
,p_db_column_name=>'WFDCH_LVL5'
,p_display_order=>690
,p_column_identifier=>'EE'
,p_column_label=>'Wfdch Lvl5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593906762404322)
,p_db_column_name=>'WFDCH_LVL6'
,p_display_order=>700
,p_column_identifier=>'EF'
,p_column_label=>'Wfdch Lvl6'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591376632404346)
,p_db_column_name=>'WFDCH_LVL_PRJ'
,p_display_order=>440
,p_column_identifier=>'DF'
,p_column_label=>'Wfdch Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590168352404334)
,p_db_column_name=>'WFDCH_MAIL_FLAG'
,p_display_order=>320
,p_column_identifier=>'CT'
,p_column_label=>'Wfdch Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589075320404323)
,p_db_column_name=>'WFDCH_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'CI'
,p_column_label=>'Wfdch Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590886167404342)
,p_db_column_name=>'WFDCH_NXT_FWD_PERSON'
,p_display_order=>400
,p_column_identifier=>'DB'
,p_column_label=>'Wfdch Nxt Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591044897404343)
,p_db_column_name=>'WFDCH_NXT_MESSAGE'
,p_display_order=>410
,p_column_identifier=>'DC'
,p_column_label=>'Wfdch Nxt Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590770555404340)
,p_db_column_name=>'WFDCH_NXT_STATUS'
,p_display_order=>380
,p_column_identifier=>'CZ'
,p_column_label=>'Wfdch Nxt Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589951897404332)
,p_db_column_name=>'WFDCH_PLNT'
,p_display_order=>300
,p_column_identifier=>'CR'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594068050404323)
,p_db_column_name=>'WFDCH_PLNT_LOC_ID'
,p_display_order=>710
,p_column_identifier=>'EG'
,p_column_label=>'Wfdch Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594132757404324)
,p_db_column_name=>'WFDCH_POS_BRANCH_ID'
,p_display_order=>720
,p_column_identifier=>'EH'
,p_column_label=>'Wfdch Pos Branch Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588964858404322)
,p_db_column_name=>'WFDCH_PO_MODE'
,p_display_order=>200
,p_column_identifier=>'CH'
,p_column_label=>'Wfdch Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589520571404328)
,p_db_column_name=>'WFDCH_PRIORITY'
,p_display_order=>260
,p_column_identifier=>'CN'
,p_column_label=>'Wfdch Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588311660404316)
,p_db_column_name=>'WFDCH_PRJ_ID'
,p_display_order=>140
,p_column_identifier=>'CB'
,p_column_label=>'Wfdch Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589334981404326)
,p_db_column_name=>'WFDCH_PROD_ID'
,p_display_order=>240
,p_column_identifier=>'CL'
,p_column_label=>'Wfdch Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589419938404327)
,p_db_column_name=>'WFDCH_PROD_REV'
,p_display_order=>250
,p_column_identifier=>'CM'
,p_column_label=>'Wfdch Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588742792404320)
,p_db_column_name=>'WFDCH_QC_INS_MODE'
,p_display_order=>180
,p_column_identifier=>'CF'
,p_column_label=>'Wfdch Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589198763404325)
,p_db_column_name=>'WFDCH_QC_REV'
,p_display_order=>230
,p_column_identifier=>'CK'
,p_column_label=>'Wfdch Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588401772404317)
,p_db_column_name=>'WFDCH_RND_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'CC'
,p_column_label=>'Wfdch Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590007402404333)
,p_db_column_name=>'WFDCH_SELECT_FLAG'
,p_display_order=>310
,p_column_identifier=>'CS'
,p_column_label=>'Wfdch Select Flag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826588647895404319)
,p_db_column_name=>'WFDCH_SEQ_NO'
,p_display_order=>170
,p_column_identifier=>'CE'
,p_column_label=>'Wfdch Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826590318248404336)
,p_db_column_name=>'WFDCH_SMS_FLAG'
,p_display_order=>340
,p_column_identifier=>'CV'
,p_column_label=>'Wfdch Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587616279404309)
,p_db_column_name=>'WFDCH_SPPLR_ID'
,p_display_order=>70
,p_column_identifier=>'BU'
,p_column_label=>'Wfdch Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587466235404307)
,p_db_column_name=>'WFDCH_STATUS'
,p_display_order=>50
,p_column_identifier=>'BS'
,p_column_label=>'Wfdch Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594318988404326)
,p_db_column_name=>'WFDCH_SUB_VOU_TYPE'
,p_display_order=>740
,p_column_identifier=>'EJ'
,p_column_label=>'Wfdch Sub Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826592088370404304)
,p_db_column_name=>'WFDCH_TAX_AMT'
,p_display_order=>520
,p_column_identifier=>'DN'
,p_column_label=>'Wfdch Tax Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826587106092404304)
,p_db_column_name=>'WFDCH_TYPE'
,p_display_order=>20
,p_column_identifier=>'BP'
,p_column_label=>'Wfdch Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593079778404313)
,p_db_column_name=>'WFDCH_UPD_BY'
,p_display_order=>610
,p_column_identifier=>'DW'
,p_column_label=>'Wfdch Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593235094404315)
,p_db_column_name=>'WFDCH_UPD_DATE'
,p_display_order=>630
,p_column_identifier=>'DY'
,p_column_label=>'Wfdch Upd Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593523700404318)
,p_db_column_name=>'WFDCH_UPD_EMP_ID'
,p_display_order=>660
,p_column_identifier=>'EB'
,p_column_label=>'Wfdch Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826593116403404314)
,p_db_column_name=>'WFDCH_UPD_IP_ADDR'
,p_display_order=>620
,p_column_identifier=>'DX'
,p_column_label=>'Wfdch Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826591234434404345)
,p_db_column_name=>'WFDCH_VALUE'
,p_display_order=>430
,p_column_identifier=>'DE'
,p_column_label=>'Wfdch Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594187897404325)
,p_db_column_name=>'WFDCH_VOU_TYPE'
,p_display_order=>730
,p_column_identifier=>'EI'
,p_column_label=>'Wfdch Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589620036404329)
,p_db_column_name=>'WFDCH_WF_NO'
,p_display_order=>270
,p_column_identifier=>'CO'
,p_column_label=>'Wfdch Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826589839122404331)
,p_db_column_name=>'WFDCH_WRK_CNTR'
,p_display_order=>290
,p_column_identifier=>'CQ'
,p_column_label=>'Wfdch Wrk Cntr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595523697404338)
,p_db_column_name=>'WFDCL_ACCTS'
,p_display_order=>860
,p_column_identifier=>'EV'
,p_column_label=>'Wfdcl Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596674659404349)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>970
,p_column_identifier=>'FG'
,p_column_label=>'Wfdcl Action Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596469690404347)
,p_db_column_name=>'WFDCL_APPR_NO'
,p_display_order=>950
,p_column_identifier=>'FE'
,p_column_label=>'Wfdcl Appr No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598082830404413)
,p_db_column_name=>'WFDCL_AUTH_TYPE'
,p_display_order=>1110
,p_column_identifier=>'FU'
,p_column_label=>'Wfdcl Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594469165404327)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>750
,p_column_identifier=>'EK'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599405381404427)
,p_db_column_name=>'WFDCL_COLL_CENTR_ID'
,p_display_order=>1250
,p_column_identifier=>'GI'
,p_column_label=>'Wfdcl Coll Centr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598462732404417)
,p_db_column_name=>'WFDCL_CRE_BY'
,p_display_order=>1150
,p_column_identifier=>'FY'
,p_column_label=>'Wfdcl Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598750671404420)
,p_db_column_name=>'WFDCL_CRE_DATE'
,p_display_order=>1180
,p_column_identifier=>'GB'
,p_column_label=>'Wfdcl Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599282001404425)
,p_db_column_name=>'WFDCL_CRE_EMP_ID'
,p_display_order=>1230
,p_column_identifier=>'GG'
,p_column_label=>'Wfdcl Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598495118404418)
,p_db_column_name=>'WFDCL_CRE_IP_ADDR'
,p_display_order=>1160
,p_column_identifier=>'FZ'
,p_column_label=>'Wfdcl Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598619918404419)
,p_db_column_name=>'WFDCL_CRE_OS_USER'
,p_display_order=>1170
,p_column_identifier=>'GA'
,p_column_label=>'Wfdcl Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595656415404339)
,p_db_column_name=>'WFDCL_CTRL_PERSON'
,p_display_order=>870
,p_column_identifier=>'EW'
,p_column_label=>'Wfdcl Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594991291404333)
,p_db_column_name=>'WFDCL_CUST_ID'
,p_display_order=>810
,p_column_identifier=>'EQ'
,p_column_label=>'Wfdcl Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594759306404330)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>780
,p_column_identifier=>'EN'
,p_column_label=>'Wfdcl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594623565404329)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>770
,p_column_identifier=>'EM'
,p_column_label=>'Wfdcl Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597578681404408)
,p_db_column_name=>'WFDCL_DOC_SFX'
,p_display_order=>1060
,p_column_identifier=>'FP'
,p_column_label=>'Wfdcl Doc Sfx'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598097620404414)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>1120
,p_column_identifier=>'FV'
,p_column_label=>'Wfdcl Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596277444404345)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>930
,p_column_identifier=>'FC'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599828608404431)
,p_db_column_name=>'WFDCL_INST_ID'
,p_display_order=>1290
,p_column_identifier=>'GM'
,p_column_label=>'Wfdcl Inst Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599911915404432)
,p_db_column_name=>'WFDCL_INST_SER_NO'
,p_display_order=>1300
,p_column_identifier=>'GN'
,p_column_label=>'Wfdcl Inst Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596033983404343)
,p_db_column_name=>'WFDCL_JRNL_TYPE'
,p_display_order=>910
,p_column_identifier=>'FA'
,p_column_label=>'Wfdcl Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595125439404334)
,p_db_column_name=>'WFDCL_LVL1'
,p_display_order=>820
,p_column_identifier=>'ER'
,p_column_label=>'Wfdcl Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595216218404335)
,p_db_column_name=>'WFDCL_LVL2'
,p_display_order=>830
,p_column_identifier=>'ES'
,p_column_label=>'Wfdcl Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595359748404336)
,p_db_column_name=>'WFDCL_LVL3'
,p_display_order=>840
,p_column_identifier=>'ET'
,p_column_label=>'Wfdcl Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595417983404337)
,p_db_column_name=>'WFDCL_LVL4'
,p_display_order=>850
,p_column_identifier=>'EU'
,p_column_label=>'Wfdcl Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599513655404428)
,p_db_column_name=>'WFDCL_LVL5'
,p_display_order=>1260
,p_column_identifier=>'GJ'
,p_column_label=>'Wfdcl Lvl5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599599776404429)
,p_db_column_name=>'WFDCL_LVL6'
,p_display_order=>1270
,p_column_identifier=>'GK'
,p_column_label=>'Wfdcl Lvl6'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597922968404412)
,p_db_column_name=>'WFDCL_LVL_PRJ'
,p_display_order=>1100
,p_column_identifier=>'FT'
,p_column_label=>'Wfdcl Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596350164404346)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>940
,p_column_identifier=>'FD'
,p_column_label=>'Wfdcl Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597341113404406)
,p_db_column_name=>'WFDCL_PLNT'
,p_display_order=>1040
,p_column_identifier=>'FN'
,p_column_label=>'Wfdcl Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599709721404430)
,p_db_column_name=>'WFDCL_PLNT_LOC_ID'
,p_display_order=>1280
,p_column_identifier=>'GL'
,p_column_label=>'Wfdcl Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597011268404403)
,p_db_column_name=>'WFDCL_PO_MODE'
,p_display_order=>1010
,p_column_identifier=>'FK'
,p_column_label=>'Wfdcl Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598382600404416)
,p_db_column_name=>'WFDCL_PREV_BU'
,p_display_order=>1140
,p_column_identifier=>'FX'
,p_column_label=>'Wfdcl Prev Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597440142404407)
,p_db_column_name=>'WFDCL_PREV_CTRL_PERSON'
,p_display_order=>1050
,p_column_identifier=>'FO'
,p_column_label=>'Wfdcl Prev Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598268529404415)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>1130
,p_column_identifier=>'FW'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596919984404352)
,p_db_column_name=>'WFDCL_PRIORITY'
,p_display_order=>1000
,p_column_identifier=>'FJ'
,p_column_label=>'Wfdcl Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595826124404341)
,p_db_column_name=>'WFDCL_PRJ_ID'
,p_display_order=>890
,p_column_identifier=>'EY'
,p_column_label=>'Wfdcl Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596726765404350)
,p_db_column_name=>'WFDCL_PROD_ID'
,p_display_order=>980
,p_column_identifier=>'FH'
,p_column_label=>'Wfdcl Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596827931404351)
,p_db_column_name=>'WFDCL_PROD_REV'
,p_display_order=>990
,p_column_identifier=>'FI'
,p_column_label=>'Wfdcl Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597136091404404)
,p_db_column_name=>'WFDCL_QC_INS_MODE'
,p_display_order=>1020
,p_column_identifier=>'FL'
,p_column_label=>'Wfdcl Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596575012404348)
,p_db_column_name=>'WFDCL_QC_REV'
,p_display_order=>960
,p_column_identifier=>'FF'
,p_column_label=>'Wfdcl Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595980643404342)
,p_db_column_name=>'WFDCL_RND_PRJ_ID'
,p_display_order=>900
,p_column_identifier=>'EZ'
,p_column_label=>'Wfdcl Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826595709980404340)
,p_db_column_name=>'WFDCL_SEQNO'
,p_display_order=>880
,p_column_identifier=>'EX'
,p_column_label=>'Wfdcl Seqno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594888788404332)
,p_db_column_name=>'WFDCL_SPPLR_ID'
,p_display_order=>800
,p_column_identifier=>'EP'
,p_column_label=>'Wfdcl Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597676889404409)
,p_db_column_name=>'WFDCL_SRC_BU'
,p_display_order=>1070
,p_column_identifier=>'FQ'
,p_column_label=>'Wfdcl Src Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597733231404410)
,p_db_column_name=>'WFDCL_SRC_PLNT'
,p_display_order=>1080
,p_column_identifier=>'FR'
,p_column_label=>'Wfdcl Src Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597828986404411)
,p_db_column_name=>'WFDCL_SRC_USER'
,p_display_order=>1090
,p_column_identifier=>'FS'
,p_column_label=>'Wfdcl Src User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594829091404331)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>790
,p_column_identifier=>'EO'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826594551991404328)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>760
,p_column_identifier=>'EL'
,p_column_label=>'Wfdcl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598817164404421)
,p_db_column_name=>'WFDCL_UPD_BY'
,p_display_order=>1190
,p_column_identifier=>'GC'
,p_column_label=>'Wfdcl Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599116932404424)
,p_db_column_name=>'WFDCL_UPD_DATE'
,p_display_order=>1220
,p_column_identifier=>'GF'
,p_column_label=>'Wfdcl Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599334691404426)
,p_db_column_name=>'WFDCL_UPD_EMP_ID'
,p_display_order=>1240
,p_column_identifier=>'GH'
,p_column_label=>'Wfdcl Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826598886848404422)
,p_db_column_name=>'WFDCL_UPD_IP_ADDR'
,p_display_order=>1200
,p_column_identifier=>'GD'
,p_column_label=>'Wfdcl Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826599020210404423)
,p_db_column_name=>'WFDCL_UPD_OS_USER'
,p_display_order=>1210
,p_column_identifier=>'GE'
,p_column_label=>'Wfdcl Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826596089925404344)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>920
,p_column_identifier=>'FB'
,p_column_label=>'Wfdcl Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6826597230500404405)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>1030
,p_column_identifier=>'FM'
,p_column_label=>'Wfdcl Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10468383479650007664)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15265580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10468051765673483099)
,p_plug_name=>'Work Flow Users'
,p_static_id=>'work-flow-users'
,p_title=>'Find Workflow Approvals'
,p_parent_plug_id=>wwv_flow_imp.id(10468051560417483097)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826542314418396031)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Add'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826540685357396030)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'Clear'
,p_icon_css_classes=>'Clear'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826541123344396030)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826541497621396030)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Favorite'
,p_static_id=>'favorite'
,p_button_static_id=>'F'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favorite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:global_fav();'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'.t-Icon'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826541952118396030)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite N'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826542714702396031)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite N'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826540315679396027)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_button_name=>'Find_Report'
,p_static_id=>'find-report'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Search'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826561119222396069)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10468053403053483115)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6826578721659396114)
,p_branch_name=>'Go To Page 2361300102'
,p_branch_action=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID,P2361300102_WF_BUS_PROC_ID:&P2361300104_ROWID.,&P2361300104_WF_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063552078483194)
,p_name=>'P2361300104_AUTH_BASSIS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Entity;E,Unit;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063710895483195)
,p_name=>'P2361300104_AUTH_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Employee;E,Position;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063832082483197)
,p_name=>'P2361300104_CODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfaa_status',
'  FROM work_flow_appr_actvt',
' WHERE wfaa_bu = :GLOBAL_BU',
'GROUP BY wfaa_status'))
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Code')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063961634483198)
,p_name=>'P2361300104_CODE_DESC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Code Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfaa_status_desc',
'  FROM work_flow_appr_actvt',
' WHERE wfaa_bu = :global_bu',
'GROUP BY wfaa_status_desc'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Code Desc.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468064113357483199)
,p_name=>'P2361300104_DATE_FROM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468064197039483200)
,p_name=>'P2361300104_DATE_TO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063326400483192)
,p_name=>'P2361300104_EMPLOYEE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WF_EMP1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Employee',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10488228995639787923)
,p_name=>'P2361300104_ERROR_FLAG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9100089202551459432)
,p_name=>'P2361300104_FAVOURITE_FLAG'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(wubfa_user_fav,''Y'')',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE wubfa_user_id    = :GLOBAL_USER',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_page_no      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063489081483193)
,p_name=>'P2361300104_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_module a,',
'       wf_module',
'  FROM work_flow',
' WHERE wf_bu = :Global_bu',
'GROUP BY wf_module',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Module',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063788552483196)
,p_name=>'P2361300104_SELF_APPROVAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Self Approval'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10488228828587787922)
,p_name=>'P2361300104_SHOW_DATA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9233371760515879109)
,p_name=>'P2361300104_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_item_default=>'ALL'
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All;ALL,Draft;E,Entry Complete;N,Approved;A,Cancelled;C'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10468063252169483191)
,p_name=>'P2361300104_WORK_FLOW_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10468051765673483099)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work Flow'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WF_ID1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Work flow',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826575298615396111)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826542314418396031)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826566011353396106)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826540685357396030)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826567076951396106)
,p_event_id=>wwv_flow_imp.id(6826566011353396106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300104_WORK_FLOW_NAME,P2361300104_EMPLOYEE_NAME,P2361300104_MODULE,P2361300104_AUTH_BASSIS,P2361300104_AUTH_TYPE,P2361300104_SELF_APPROVAL,P2361300104_CODE,P2361300104_CODE_DESC,P2361300104_DATE_FROM,P2361300104_DATE_TO,P2361300104_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826566558384396106)
,p_event_id=>wwv_flow_imp.id(6826566011353396106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826564585237396106)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826565163981396106)
,p_event_id=>wwv_flow_imp.id(6826564585237396106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300104_WORK_FLOW_NAME,P2361300104_EMPLOYEE_NAME,P2361300104_MODULE,P2361300104_AUTH_BASSIS,P2361300104_AUTH_TYPE,P2361300104_SELF_APPROVAL,P2361300104_CODE,P2361300104_CODE_DESC,P2361300104_DATE_FROM,P2361300104_DATE_TO,P2361300104_SHOW_DATA,P23'
||'61300104_ERROR_FLAG'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826565612367396106)
,p_event_id=>wwv_flow_imp.id(6826564585237396106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P2361300104_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826569802763396108)
,p_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826541952118396030)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826570819645396109)
,p_event_id=>wwv_flow_imp.id(6826569802763396108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300104_FAVOURITE_FLAG',
  'items_to_submit', 'P2361300104_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P2361300104_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826570355536396109)
,p_event_id=>wwv_flow_imp.id(6826569802763396108)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300104_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826571241189396109)
,p_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826542714702396031)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826571763866396109)
,p_event_id=>wwv_flow_imp.id(6826571241189396109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300104_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P2361300104_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826572268389396109)
,p_event_id=>wwv_flow_imp.id(6826571241189396109)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300104_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826576252818396112)
,p_name=>'Find_Report'
,p_static_id=>'find-report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826540315679396027)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826576698215396112)
,p_event_id=>wwv_flow_imp.id(6826576252818396112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300104_ERROR_FLAG',
  'items_to_submit', 'P2361300104_DATE_FROM,P2361300104_DATE_TO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P2361300104_ERROR_FLAG := 0;',
    '',
    'IF :P2361300104_DATE_FROM IS NOT NULL  OR :P2361300104_DATE_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P2361300104_DATE_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P2361300104_ERROR_FLAG := ''P2361300104_DATE_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P2361300104_DATE_FROM,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P2361300104_ERROR_FLAG := ''P2361300104_DATE_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826578202938396114)
,p_event_id=>wwv_flow_imp.id(6826576252818396112)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// apex.item("detail").show();',
    '// apex.item("find").hide();',
    'apex.item(''detail'').show();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2361300104_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826577767514396112)
,p_event_id=>wwv_flow_imp.id(6826576252818396112)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10468053403053483115)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2361300104_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826577195134396112)
,p_event_id=>wwv_flow_imp.id(6826576252818396112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300104_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826567429460396106)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300104_FAVOURITE_FLAG'
,p_condition_element=>'P2361300104_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826568944452396108)
,p_event_id=>wwv_flow_imp.id(6826567429460396106)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6826542714702396031)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826569465598396108)
,p_event_id=>wwv_flow_imp.id(6826567429460396106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6826541952118396030)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826567905896396108)
,p_event_id=>wwv_flow_imp.id(6826567429460396106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6826542714702396031)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826568404024396108)
,p_event_id=>wwv_flow_imp.id(6826567429460396106)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6826541952118396030)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826563704715396102)
,p_name=>'P2361300104_ERROR_FLAG'
,p_static_id=>'p2361300104-error-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300104_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826564196882396105)
,p_event_id=>wwv_flow_imp.id(6826563704715396102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.message.clearErrors();',
    '',
    'var errorFlag= $v(''P2361300104_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P2361300104_DATE_FROM'') {',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P2361300104_DATE_FROM",',
    '        message:    "Date From must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '',
    'if(errorFlag == ''P2361300104_DATE_TO'') {',
    '',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P2361300104_DATE_TO",',
    '        message:    "Date To must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826574397824396111)
,p_name=>'P2361300104_WF_ID'
,p_static_id=>'p2361300104-wf-id'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300104_WF_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826574946553396111)
,p_event_id=>wwv_flow_imp.id(6826574397824396111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300104_WF_MOULE,P2361300104_WF_CALL_FORM,P2361300104_WF_MOD_SEQ_NO,P2361300104_WF_NAME,P2361300104_WF_SEQ_NO,P2361300104_WF_BASIS',
  'items_to_submit', 'P2361300104_WF_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361300104_WF_ID IS NOT NULL THEN',
    '',
    '   DECLARE',
    '   	CURSOR c1',
    '   	    IS',
    '      SELECT wfm_bus_proc_desc wf_bus_proc_desc,wfm_bus_proc_id wf_bus_proc_id,',
    '             wfm_module,',
    '             wfm_mod_seq_no seq_no,',
    '             wfm_bus_proc_desc2 desc2,',
    '             wfm_call_form,',
    '             wfm_mod_seq_no,',
    '             wfm_basis,',
    '             DECODE(wfm_basis,''E'',''Entity'',''U'',''Unit'') wfm_basis_desc',
    '        FROM work_flow_master',
    '       WHERE wfm_bu 					= :GLOBAL_bu ',
    '         AND wfm_bus_proc_id	   = :P2361300104_WF_ID;',
    '       ',
    '       cr1  c1%ROWTYPE;',
    '     ',
    '   BEGIN',
    '   	',
    '   	OPEN c1;',
    '   	FETCH c1 INTO cr1;',
    '   	   ',
    '   	   IF c1%FOUND THEN',
    '   	   	  :P2361300104_WF_MOULE  				:= cr1.wfm_module ;',
    '   	   	  :P2361300104_WF_CALL_FORM   		:= cr1.wfm_call_form;',
    '   	   	  :P2361300104_WF_MOD_SEQ_NO			:= cr1.seq_no;',
    '   	   	  :P2361300104_WF_NAME		         := cr1.wf_bus_proc_desc;',
    '   	   	  :P2361300104_WF_SEQ_NO				:= cr1.seq_no;',
    '   	   	  :P2361300104_WF_BASIS             := cr1.wfm_basis;',
    '   	   END IF;',
    '   	   ',
    '   	CLOSE c1;',
    '   	',
    '   END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826573495051396111)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826561119222396069)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826574006224396111)
,p_event_id=>wwv_flow_imp.id(6826573495051396111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
