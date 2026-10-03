prompt --application/pages/page_2361310103
begin
--   Manifest
--     PAGE: 2361310103
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
 p_id=>2361310103
,p_name=>'Workflow Log'
,p_alias=>'DOC-APPROVAL-USERS'
,p_step_title=>'Workflow Log'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
' #Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(255, 255, 255);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 25px;',
'   padding-bottom: 6px;',
'   top: 0px;',
'}',
'',
'#BUT{',
'    background-color: white;',
'}',
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'',
'    white-space: nowrap;',
'}'))
,p_step_template=>wwv_flow_imp.id(5774347642628043810)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9563304829198653395)
,p_plug_name=>'<b>WF Log</b>'
,p_static_id=>'b-wf-log-b'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6868545882575665706)
,p_plug_name=>'Work Flow History'
,p_static_id=>'work-flow-history'
,p_region_name=>'USERS'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfdcl_bu,wfdcl_type,wfdcl_doc_pfx,wfdcl_doc_no,wfdcl_status,',
'       CASE WHEN wfdcl_status IN (''E'', ''N'') AND wfdcl_frwd_rtn IS NULL THEN ''Entry Completed''',
'            WHEN wfdcl_status = ''C'' THEN ''Cancelled''',
'            WHEN (wfdcl_status = ''R'' OR wfdcl_frwd_rtn = ''R'') THEN ''Returned''',
'            WHEN wfdcl_status = ''A'' THEN ''Approved''',
'            WHEN wfdcl_status NOT IN (''E'',''N'',''R'',''A'',''C'') AND wfdcl_frwd_rtn IS NULL THEN',
'             (SELECT INITCAP(wfaa_status_desc) FROM work_flow_appr_actvt WHERE wfaa_bu = wfdcl_bu AND wfaa_wf_id = wfdcl_type AND wfaa_status = wfdcl_status)',
'            WHEN wfdcl_frwd_rtn = ''F'' THEN ''Forwarded''',
'       END "Status",',
'       CASE WHEN wfdcl_status IN (''E'',''N'') AND wfdcl_frwd_rtn IS NULL THEN ''blue''',
'            WHEN wfdcl_status = ''A'' THEN ''Green''',
'            WHEN wfdcl_status = ''C'' THEN ''red''',
'            WHEN (wfdcl_status = ''R'' OR wfdcl_frwd_rtn = ''R'') THEN ''orange''',
'           WHEN wfdcl_frwd_rtn = ''F'' THEN ''brown''',
'            ELSE ''black''',
'       END "color",',
'       wfdcl_value,',
'       wfdcl_frwd_rtn,wfdcl_message,',
'       TO_CHAR(wfdcl_action_date,:GLOBAL_DATETIME_MASK) wfdcl_action_date,',
'       DECODE (wfdcl_priority,  ''1'', ''High'',  ''2'', ''Medium'',  ''3'', ''Low'') "Priority",',
'       wfdcl_wf_no,',
'       wfdcl_emp_id,',
'       CASE WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL THEN wfdcl_emp_id',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person THEN wfdcl_ctrl_person',
'            ELSE NULL',
'       END "DOC_WITH_EMP",',
'       CASE',
'          WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT hrpos_pos_name1',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                 AND hrpos_pos_id = wfdcl_ctrl_person)',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person',
'          THEN',
'             (SELECT emp_first_name1',
'                FROM employees',
'               WHERE emp_bu = wfdcl_bu AND emp_emp_id = wfdcl_ctrl_person)',
'       ELSE NULL ',
'       END',
'          "WITH_EMP",',
'       wfdc_from_emp "DOC_FROM_EMP",',
'      wfdc_from_emp_name "FROM_EMP",',
'       wfdcl_prev_emp_id,',
'        (func_find_apex_dtls_wfh (wfdcl_auth_type,',
'                                 wfdcl_frwd_rtn,',
'                                 wfdcl_bu,',
'                                 wfdcl_ctrl_person,',
'                                 wfdcl_emp_id,',
'                                 wfdcl_appr_no,',
'                                 wfdcl_type,',
'                                 wfdcl_status,',
'                                 wfdcl_prev_bu,',
'                                 wfdcl_prev_ctrl_person,',
'                                 wfdcl_bu)) ',
'          "Details",',
'          (SELECT apt_pfx_type_desc ',
'      FROM appl_pfx_types',
'     WHERE apt_bu = wfdcl_bu',
'       AND apt_pfx_type = wfdc_vou_type) wfdc_vou_desc,',
'     (SELECT apst_sub_type_desc ',
'      FROM appl_vou_sub_types',
'     WHERE apst_bu = wfdcl_bu',
'       AND apst_sub_type = wfdc_sub_vou_type) wfdcl_sub_vou_desc,',
'	wfdc_doc_brief,',
'   (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_emp_id) wfdc_emp_name,',
'    TO_CHAR(wfdc_fwd_on,:GLOBAL_DATETIME_MASK) wfdc_fwd_on,',
'	wfdc_value,',
'    wfdc_TYPE_DESC,',
'    NVL(wfdc_benf_name,  (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_benf_id)) wfdc_benf_name,',
'    wfdc_benf_id,',
'    TO_CHAR(wfdc_doc_date,:GLOBAL_RPT_DATE_MASK) wfdc_doc_date,',
'    wfdc_PLNT',
'  FROM work_flow_log_vw',
' WHERE wfdcl_bu   = :Global_bu',
'    AND (UPPER(WFDC_DOC_NO) LIKE ''%'' || :P2361310103_DOC_NO || ''%'' OR :P2361310103_DOC_NO IS NULL)',
'    AND (UPPER(wfdc_sub_vou_type) LIKE ''%'' || :P2361310103_SUB_VOU_TYPE || ''%'' OR :P2361310103_SUB_VOU_TYPE IS NULL)',
'    AND (UPPER(wfdc_TYPE)',
'            LIKE ''%'' || UPPER(:P2361310103_TYPE) || ''%'' OR ',
'        (UPPER(wfdc_TYPE_DESC)',
'            LIKE ''%'' || UPPER(:P2361310103_TYPE) || ''%'') OR',
'            :P2361310103_TYPE IS NULL)',
'    AND (UPPER(wfdcl_priority) LIKE ''%'' || :P2361310103_PRIORITY || ''%'' OR :P2361310103_PRIORITY IS NULL)',
'    AND (UPPER(wfdc_benf_id) LIKE ''%'' || :P2361310103_PARTY || ''%'' OR :P2361310103_PARTY IS NULL)',
'    AND (UPPER(wfdc_benf_name) LIKE ''%'' || :P2361310103_PARTY_NAME || ''%'' OR :P2361310103_PARTY IS NULL)',
'    AND (TRUNC(wfdcl_action_date) >= TO_DATE(:P2361310103_ACT_DATE,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_ACT_DATE IS NULL)   ',
'    AND (TRUNC(wfdcl_action_date) <=  TO_DATE(:P2361310103_ACT_DATE_TO,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_ACT_DATE_TO IS NULL)',
'    AND (TRUNC(wfdc_doc_date) >= TO_DATE(:P2361310103_FRM_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_FRM_DATE_DOC IS NULL)',
'    AND (TRUNC(wfdc_doc_date) <= TO_DATE(:P2361310103_TO_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_TO_DATE_DOC IS NULL) ',
'   -- AND wfdcl_status NOT IN (''A'',''C'')',
'ORDER by wfdcl_doc_no,wfdcl_seqno '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2361310103_TYPE,P2361310103_WF_NO,P2361310103_SUB_VOU_TYPE,P2361310103_VOU_TYPE,P2361310103_FRM_DATE_DOC,P2361310103_TO_DATE_DOC,P2361310103_DOC_NO,P2361310103_DOC_FROM_EMP,P2361310103_ACT_DATE,P2361310103_PARTY,P2361310103_PARTY_NAME,P2361310103_PR'
||'IORITY,P2361310103_ACT_DATE_TO'
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
 p_id=>wwv_flow_imp.id(6868545913100665707)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1389024929315745505
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6868745211390672628)
,p_name=>'Action By'
,p_static_id=>'action-by'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6868745286287672629)
,p_name=>'Forwarded To'
,p_static_id=>'forwarded-to'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868550376607665751)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>440
,p_group_id=>wwv_flow_imp.id(6868745211390672628)
,p_column_identifier=>'AR'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868550115825665749)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>420
,p_group_id=>wwv_flow_imp.id(6868745286287672629)
,p_column_identifier=>'AP'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744016493672616)
,p_db_column_name=>'Details'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868550451099665752)
,p_db_column_name=>'FROM_EMP'
,p_display_order=>450
,p_group_id=>wwv_flow_imp.id(6868745211390672628)
,p_column_identifier=>'AS'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868548851685665736)
,p_db_column_name=>'Priority'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546575721665713)
,p_db_column_name=>'Status'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Action'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Status#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868745479669672630)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Action Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546043993665708)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546298193665711)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546257122665710)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868550045963665748)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Wfdcl Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868548081689665728)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868548141946665729)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868742727793672603)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546414328665712)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744280790672618)
,p_db_column_name=>'WFDCL_SUB_VOU_DESC'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546090807665709)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'WF Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868547974467665727)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868549128115665739)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'WF No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744891983672625)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744807093672624)
,p_db_column_name=>'WFDC_BENF_NAME'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744317236672619)
,p_db_column_name=>'WFDC_DOC_BRIEF'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Doc. Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868745047429672626)
,p_db_column_name=>'WFDC_DOC_DATE'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744430534672620)
,p_db_column_name=>'WFDC_EMP_NAME'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744488210672621)
,p_db_column_name=>'WFDC_FWD_ON'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'On'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868745117004672627)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744754827672623)
,p_db_column_name=>'WFDC_TYPE_DESC'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'WF Type Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744674120672622)
,p_db_column_name=>'WFDC_VALUE'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Wfdc Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868744181435672617)
,p_db_column_name=>'WFDC_VOU_DESC'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868550214458665750)
,p_db_column_name=>'WITH_EMP'
,p_display_order=>430
,p_group_id=>wwv_flow_imp.id(6868745286287672629)
,p_column_identifier=>'AQ'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868546616611665714)
,p_db_column_name=>'color'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6868769736025673306)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13892488'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WFDCL_WF_NO:WFDCL_TYPE:WFDC_TYPE_DESC:WFDCL_SUB_VOU_DESC:WFDC_VOU_DESC:WFDC_DOC_DATE:WFDCL_DOC_PFX:WFDCL_DOC_NO:WFDC_BENF_ID:WFDC_BENF_NAME:Status:WFDCL_ACTION_DATE:DOC_FROM_EMP:FROM_EMP:DOC_WITH_EMP:WITH_EMP:WFDC_FWD_ON:Details:WFDCL_MESSAGE:Priorit'
||'y:WFDC_DOC_BRIEF:WFDCL_VALUE'
,p_sort_column_1=>'WFDCL_WF_NO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6868745954191672635)
,p_plug_name=>'Work Flow Pend'
,p_static_id=>'work-flow-pend'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wfdcl_bu,wfdcl_type,wfdcl_doc_pfx,wfdcl_doc_no,wfdcl_status,',
'       CASE WHEN wfdcl_status IN (''E'', ''N'') AND wfdcl_frwd_rtn IS NULL THEN ''Entry Completed''',
'            WHEN wfdcl_status = ''C'' THEN ''Cancelled''',
'            WHEN (wfdcl_status = ''R'' OR wfdcl_frwd_rtn = ''R'') THEN ''Returned''',
'            WHEN wfdcl_status = ''A'' THEN ''Approved''',
'            WHEN wfdcl_status NOT IN (''E'',''N'',''R'',''A'',''C'') AND wfdcl_frwd_rtn IS NULL THEN',
'             (SELECT INITCAP(wfaa_status_desc) FROM work_flow_appr_actvt WHERE wfaa_bu = wfdcl_bu AND wfaa_wf_id = wfdcl_type AND wfaa_status = wfdcl_status)',
'            WHEN wfdcl_frwd_rtn = ''F'' THEN ''Forwarded''',
'       END "Status",',
'       CASE WHEN wfdcl_status IN (''E'',''N'') AND wfdcl_frwd_rtn IS NULL THEN ''blue''',
'            WHEN wfdcl_status = ''A'' THEN ''Green''',
'            WHEN wfdcl_status = ''C'' THEN ''red''',
'            WHEN (wfdcl_status = ''R'' OR wfdcl_frwd_rtn = ''R'') THEN ''orange''',
'           WHEN wfdcl_frwd_rtn = ''F'' THEN ''brown''',
'            ELSE ''black''',
'       END "color",',
'       wfdcl_value,',
'       wfdcl_frwd_rtn,wfdcl_message,',
'       TO_CHAR(wfdcl_action_date,:GLOBAL_DATETIME_MASK) wfdcl_action_date,',
'       DECODE (wfdcl_priority,  ''1'', ''High'',  ''2'', ''Medium'',  ''3'', ''Low'') "Priority",',
'       wfdcl_wf_no,',
'       wfdcl_emp_id,',
'       CASE WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL THEN wfdcl_emp_id',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person THEN wfdcl_ctrl_person',
'            ELSE NULL',
'       END "DOC_WITH_EMP",',
'       CASE',
'          WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT hrpos_pos_name1',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                 AND hrpos_pos_id = wfdcl_ctrl_person)',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person',
'          THEN',
'             (SELECT emp_first_name1',
'                FROM employees',
'               WHERE emp_bu = wfdcl_bu AND emp_emp_id = wfdcl_ctrl_person)',
'       ELSE NULL ',
'       END',
'          "WITH_EMP",',
'       wfdc_from_emp "DOC_FROM_EMP",',
'      wfdc_from_emp_name "FROM_EMP",',
'       wfdcl_prev_emp_id,',
'        (func_find_apex_dtls_wfh (wfdcl_auth_type,',
'                                 wfdcl_frwd_rtn,',
'                                 wfdcl_bu,',
'                                 wfdcl_ctrl_person,',
'                                 wfdcl_emp_id,',
'                                 wfdcl_appr_no,',
'                                 wfdcl_type,',
'                                 wfdcl_status,',
'                                 wfdcl_prev_bu,',
'                                 wfdcl_prev_ctrl_person,',
'                                 wfdcl_bu)) ',
'          "Details",',
'          (SELECT apt_pfx_type_desc ',
'      FROM appl_pfx_types',
'     WHERE apt_bu = wfdcl_bu',
'       AND apt_pfx_type = wfdc_vou_type) wfdc_vou_desc,',
'     (SELECT apst_sub_type_desc ',
'      FROM appl_vou_sub_types',
'     WHERE apst_bu = wfdcl_bu',
'       AND apst_sub_type = wfdc_sub_vou_type) wfdcl_sub_vou_desc,',
'	wfdc_doc_brief,',
'   (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_emp_id) wfdc_emp_name,',
'    TO_CHAR(wfdc_fwd_on,:GLOBAL_DATETIME_MASK) wfdc_fwd_on,',
'	wfdc_value,',
'    wfdc_TYPE_DESC,',
'    NVL(wfdc_benf_name,  (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_benf_id)) wfdc_benf_name,',
'    wfdc_benf_id,',
'    TO_CHAR(wfdc_doc_date,:GLOBAL_RPT_DATE_MASK) wfdc_doc_date,',
'    wfdc_PLNT',
' FROM work_flow_log_vw',
' WHERE wfdcl_bu   = :Global_bu',
'    AND (UPPER(WFDC_DOC_NO) LIKE ''%'' || :P2361310103_DOC_NO || ''%'' OR :P2361310103_DOC_NO IS NULL)',
'    AND (UPPER(wfdc_sub_vou_type) LIKE ''%'' || :P2361310103_SUB_VOU_TYPE || ''%'' OR :P2361310103_SUB_VOU_TYPE IS NULL)',
'    AND (UPPER(wfdc_TYPE)',
'            LIKE ''%'' || UPPER(:P2361310103_TYPE) || ''%'' OR ',
'        (UPPER(wfdc_TYPE_DESC)',
'            LIKE ''%'' || UPPER(:P2361310103_TYPE) || ''%'') OR',
'            :P2361310103_TYPE IS NULL)',
'    AND (UPPER(wfdcl_priority) LIKE ''%'' || :P2361310103_PRIORITY || ''%'' OR :P2361310103_PRIORITY IS NULL)',
'    AND (UPPER(wfdc_benf_id) LIKE ''%'' || :P2361310103_PARTY || ''%'' OR :P2361310103_PARTY IS NULL)',
'    AND (UPPER(wfdc_benf_name) LIKE ''%'' || :P2361310103_PARTY_NAME || ''%'' OR :P2361310103_PARTY IS NULL)',
'    AND (TRUNC(wfdcl_action_date) >= TO_DATE(:P2361310103_ACT_DATE,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_ACT_DATE IS NULL)   ',
'    AND (TRUNC(wfdcl_action_date) <=  TO_DATE(:P2361310103_ACT_DATE_TO,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_ACT_DATE_TO IS NULL)',
'    AND (TRUNC(wfdc_doc_date) >= TO_DATE(:P2361310103_FRM_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_FRM_DATE_DOC IS NULL)',
'    AND (TRUNC(wfdc_doc_date) <= TO_DATE(:P2361310103_TO_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR :P2361310103_TO_DATE_DOC IS NULL) ',
'    AND wfdc_status NOT IN (''A'',''C'')',
'ORDER by wfdcl_doc_no,wfdcl_action_date'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2361310103_TYPE,P2361310103_WF_NO,P2361310103_SUB_VOU_TYPE,P2361310103_VOU_TYPE,P2361310103_FRM_DATE_DOC,P2361310103_TO_DATE_DOC,P2361310103_DOC_NO,P2361310103_DOC_FROM_EMP,P2361310103_ACT_DATE,P2361310103_PARTY,P2361310103_PARTY_NAME,P2361310103_PR'
||'IORITY,P2361310103_ACT_DATE_TO'
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
 p_id=>wwv_flow_imp.id(6868745988269672636)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1389225004484752434
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6868746146824672637)
,p_name=>'Action By'
,p_static_id=>'action-by'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6868746265185672638)
,p_name=>'Forwarded To'
,p_static_id=>'forwarded-to'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916813202812807)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>190
,p_group_id=>wwv_flow_imp.id(6868746146824672637)
,p_column_identifier=>'S'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916681249812805)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>170
,p_group_id=>wwv_flow_imp.id(6868746265185672638)
,p_column_identifier=>'Q'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917168453812810)
,p_db_column_name=>'Details'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916974479812808)
,p_db_column_name=>'FROM_EMP'
,p_display_order=>200
,p_group_id=>wwv_flow_imp.id(6868746146824672637)
,p_column_identifier=>'T'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868747661209672652)
,p_db_column_name=>'Priority'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746802324672644)
,p_db_column_name=>'Status'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Action'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Status#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868918299840812822)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Action Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746332544672639)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746665801672642)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746494173672641)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916491270812804)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdcl Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868747106126672647)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868747211970672648)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917004012812809)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746718463672643)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917336586812812)
,p_db_column_name=>'WFDCL_SUB_VOU_DESC'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746434469672640)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'WF Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868747031299672646)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916429125812803)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'WF No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868918066896812819)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917901766812818)
,p_db_column_name=>'WFDC_BENF_NAME'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917422167812813)
,p_db_column_name=>'WFDC_DOC_BRIEF'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Doc. Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868918147488812820)
,p_db_column_name=>'WFDC_DOC_DATE'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917515980812814)
,p_db_column_name=>'WFDC_EMP_NAME'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917663127812815)
,p_db_column_name=>'WFDC_FWD_ON'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'On'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868918205281812821)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917853664812817)
,p_db_column_name=>'WFDC_TYPE_DESC'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'WF Type Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917733558812816)
,p_db_column_name=>'WFDC_VALUE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868917214844812811)
,p_db_column_name=>'WFDC_VOU_DESC'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868916710487812806)
,p_db_column_name=>'WITH_EMP'
,p_display_order=>180
,p_group_id=>wwv_flow_imp.id(6868746265185672638)
,p_column_identifier=>'R'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6868746978196672645)
,p_db_column_name=>'color'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6868933350542814844)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13894124'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WFDCL_WF_NO:WFDCL_TYPE:WFDC_TYPE_DESC:WFDCL_SUB_VOU_DESC:WFDC_VOU_DESC:WFDC_DOC_DATE:WFDCL_DOC_PFX:WFDCL_DOC_NO:WFDC_BENF_ID:WFDC_BENF_NAME:Status:WFDCL_ACTION_DATE:DOC_FROM_EMP:FROM_EMP:DOC_WITH_EMP:WITH_EMP:WFDC_FWD_ON:Details:WFDCL_MESSAGE:Priorit'
||'y:WFDC_DOC_BRIEF:WFDCL_VALUE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826815681740504186)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826859219767510125)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826859168365510124)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_button_name=>'Favourite'
,p_static_id=>'favourite'
,p_button_static_id=>'F'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favourite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'closebtn'
,p_button_cattributes=>'onclick="global_fav()";'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6826816078899504186)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_button_name=>'Generate'
,p_static_id=>'generate'
,p_button_static_id=>'BUT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'<b>Generate</b>'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6827690647281012208)
,p_name=>'P2361310103_ACT_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Action Date From'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(6861056778280377303)
,p_name=>'P2361310103_ACT_DATE_TO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Action Date To'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(6861056876765377304)
,p_name=>'P2361310103_ALL_PEND'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_item_default=>'P'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Workflow Pending Log;P,Workflow All Log;A'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845525213064647508)
,p_name=>'P2361310103_DOC_FROM_EMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Action By User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_WF_FRM_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Vou. No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9563390893679653533)
,p_name=>'P2361310103_DOC_NO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Vou. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT  wfdc_doc_no  wfdc_doc_no',
' FROM work_flow_log_vw ',
' where wfdc_bu =:GLOBAL_bu ',
'ORDER BY wfdc_doc_no  Desc',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Vou. No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845524955777647505)
,p_name=>'P2361310103_FRM_DATE_DOC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Date From'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-sm'
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
 p_id=>wwv_flow_imp.id(9563390461022653528)
,p_name=>'P2361310103_PARTY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Party ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_PARTY_WFM1010'
,p_lov_display_null=>'YES'
,p_lov_null_text=>' '
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-bottom-none'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Party',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6828876664051650614)
,p_name=>'P2361310103_PARTY_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-bottom-none'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845524751727647503)
,p_name=>'P2361310103_PRIORITY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Priority'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Low;3,Medium;2,High;1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6852675716636428614)
,p_name=>'P2361310103_PRNT_EMP_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9563390762970653531)
,p_name=>'P2361310103_SUB_VOU_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Sub Vou. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_SUB_VOU_LOV'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Vou. Type')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845525018889647506)
,p_name=>'P2361310103_TO_DATE_DOC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Date To'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-sm:margin-right-sm'
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
 p_id=>wwv_flow_imp.id(12936550320210547857)
,p_name=>'P2361310103_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'WF Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_WF_TYPE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the WF Type'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'WF Type',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7655963257731070269)
,p_name=>'P2361310103_TYPE1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845524848094647504)
,p_name=>'P2361310103_VOU_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'Vou. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_SUB_VOU_LOV'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Vou. Type')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6845525150600647507)
,p_name=>'P2361310103_WF_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9563304829198653395)
,p_prompt=>'WF No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_WF_NO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the WF No.'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'WF No.',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6868745546388672631)
,p_name=>'All'
,p_static_id=>'all'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826816078899504186)
,p_condition_element=>'P2361310103_ALL_PEND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'A'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6868745614472672632)
,p_event_id=>wwv_flow_imp.id(6868745546388672631)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868545882575665706)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6868745741587672633)
,p_event_id=>wwv_flow_imp.id(6868745546388672631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868545882575665706)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6868745876367672634)
,p_event_id=>wwv_flow_imp.id(6868745546388672631)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868545882575665706)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6826836264436504225)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826815681740504186)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6826837203177504227)
,p_event_id=>wwv_flow_imp.id(6826836264436504225)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361310103_TYPE,P2361310103_WF_NO,P2361310103_SUB_VOU_TYPE,P2361310103_VOU_TYPE,P2361310103_FRM_DATE_DOC,P2361310103_TO_DATE_DOC,P2361310103_DOC_NO,P2361310103_DOC_FROM_EMP,P2361310103_ACT_DATE,P2361310103_PARTY,P2361310103_PARTY_NAME,P2361310103_PR'
||'IORITY,P2361310103_ACT_DATE_TO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6893137491730070405)
,p_name=>'Group Hist'
,p_static_id=>'group-hist'
,p_event_sequence=>210
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6868545882575665706)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6893137604273070406)
,p_event_id=>wwv_flow_imp.id(6893137491730070405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6893137330253070403)
,p_name=>'Group Pend'
,p_static_id=>'group-pend'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6868745954191672635)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6893137459935070404)
,p_event_id=>wwv_flow_imp.id(6893137330253070403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6864306761722957214)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6864306835530957215)
,p_event_id=>wwv_flow_imp.id(6864306761722957214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6862137100221854632)
,p_name=>'Pending'
,p_static_id=>'pending'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6826816078899504186)
,p_condition_element=>'P2361310103_ALL_PEND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6862137710945854638)
,p_event_id=>wwv_flow_imp.id(6862137100221854632)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868745954191672635)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6862137332761854634)
,p_event_id=>wwv_flow_imp.id(6862137100221854632)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868745954191672635)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2361310103_ALL_PEND'
,p_client_condition_expression=>'P'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6862137489271854636)
,p_event_id=>wwv_flow_imp.id(6862137100221854632)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6868745954191672635)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2361310103_ALL_PEND'
,p_client_condition_expression=>'P'
);
wwv_flow_imp.component_end;
end;
/
