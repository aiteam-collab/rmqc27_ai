prompt --application/pages/page_00195
begin
--   Manifest
--     PAGE: 00195
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
 p_id=>195
,p_name=>'Doc. Approval Users'
,p_alias=>'DOC-APPROVAL-USERS1'
,p_step_title=>'Doc. Approval Users'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_FILES#interactive_grid.js',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*if (typeof $.apex.interactiveReport === "function") {',
'    // only extend when the IR code is present',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};}*/'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
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
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'    white-space: nowrap;',
'}',
'.a-IRR-table td {',
'',
'    white-space: nowrap;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10940022724014241537)
,p_plug_name=>'<b>Doc. Approval Users</b>'
,p_static_id=>'b-doc-approval-users-b'
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
 p_id=>wwv_flow_imp.id(13313122514402534324)
,p_plug_name=>'Work Flow History'
,p_static_id=>'work-flow-history'
,p_region_name=>'USERS'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
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
'       wfdcl_spplr_id,wfdcl_cust_id,wfdcl_lvl1,wfdcl_lvl2,wfdcl_lvl3,wfdcl_lvl4,wfdcl_accts,',
'       wfdcl_ctrl_person,wfdcl_seqno,wfdcl_prj_id,wfdcl_rnd_prj_id,wfdcl_jrnl_type,wfdcl_value,',
'       wfdcl_frwd_rtn,wfdcl_message,wfdcl_appr_no,wfdcl_qc_rev,wfdcl_action_date,wfdcl_prod_id,',
'       wfdcl_prod_rev,wfdcl_priority,DECODE (wfdcl_priority,  ''1'', ''High'',  ''2'', ''Medium'',  ''3'', ''Low'') "Priority",',
'       wfdcl_po_mode,wfdcl_qc_ins_mode,wfdcl_wf_no,wfdcl_plnt,wfdcl_prev_ctrl_person,wfdcl_doc_sfx,',
'       wfdcl_src_bu,wfdcl_src_plnt,wfdcl_src_user,wfdcl_lvl_prj,wfdcl_auth_type,wfdcl_emp_id,',
'       CASE WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL THEN wfdcl_emp_id',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person THEN wfdcl_ctrl_person',
'            ELSE NULL',
'       END "DOC_WITH_EMP",',
'       CASE',
'          WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT DECODE ( (SELECT applctrl_desc_level',
'                                 FROM appl_control',
'                                WHERE applctrl_bu = wfdcl_bu),',
'                             1, hrpos_pos_name1,',
'                             NVL (hrpos_pos_name2, hrpos_pos_name1))',
'                        AS Name',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                     AND hrpos_pos_id = wfdcl_ctrl_person)',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL AND wfdcl_ctrl_person <> wfdcl_prev_ctrl_person',
'          THEN',
'             (SELECT (DECODE (',
'                         (SELECT applctrl_desc_level',
'                            FROM appl_control',
'                           WHERE applctrl_bu = wfdcl_bu),',
'                         1,    LTRIM (RTRIM (emp_first_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_middle_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_last_name1)),',
'                         NVL (',
'                               LTRIM (RTRIM (emp_first_name2))',
'                            || LTRIM (RTRIM (emp_middle_name2))',
'                            || LTRIM (RTRIM (emp_last_name2)),',
'                               LTRIM (RTRIM (emp_first_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_middle_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_last_name1)))))',
'                        emp_name',
'                FROM employees',
'               WHERE emp_bu = wfdcl_bu AND emp_emp_id = wfdcl_ctrl_person)',
'       ELSE NULL ',
'       END',
'          "WITH_EMP",',
'       wfdc_from_emp "DOC_FROM_EMP",',
'      wfdc_from_emp_name "FROM_EMP",',
'       wfdcl_prev_emp_id,',
'       wfdcl_prev_bu,',
'       wfdcl_cre_by,',
'       wfdcl_cre_ip_addr,',
'       wfdcl_cre_os_user,',
'       wfdcl_cre_date,',
'       wfdcl_upd_by,',
'       wfdcl_upd_ip_addr,',
'       wfdcl_upd_os_user,',
'       wfdcl_upd_date,',
'       wfdcl_cre_emp_id,',
'       wfdcl_upd_emp_id,',
'       wfdcl_coll_centr_id,',
'       (func_find_apex_dtls_wfh (wfdcl_auth_type,',
'                                 wfdcl_frwd_rtn,',
'                                 wfdcl_bu,',
'                                 wfdcl_ctrl_person,',
'                                 wfdcl_emp_id,',
'                                 wfdcl_appr_no,',
'                                 wfdcl_type,',
'                                 wfdcl_status,',
'                                 wfdcl_prev_bu,',
'                                 wfdcl_prev_ctrl_person,',
'                                 wfdcl_bu))',
'          "Details",',
'          func_find_vou_type_desc(wfdcl_bu,wfdc_vou_type) wfdc_vou_desc,',
'    func_find_sub_vou_type_desc(wfdcl_bu,wfdc_sub_vou_type) wfdcl_sub_vou_desc,',
'	wfdc_doc_brief,',
'   (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_emp_id) wfdc_emp_name,',
'    TO_CHAR(wfdc_fwd_on,:GLOBAL_RPT_DATE_MASK) wfdc_fwd_on,',
'	wfdc_value,',
'    wfdc_TYPE_DESC,',
'    NVL(wfdc_benf_name,  (select emp_first_name1 from employees where emp_bu = :global_bu',
'    and emp_emp_id = wfdc_benf_id)) wfdc_benf_name,',
'    wfdc_benf_id,',
'    TO_CHAR(wfdc_doc_date,:GLOBAL_RPT_DATE_MASK) wfdc_doc_date,',
'    wfdc_PLNT',
'FROM WORKFLOW_USERWISE_VW',
' WHERE wfdcl_bu   = :Global_bu',
'  AND (UPPER(WFDCL_DOC_NO) LIKE ''%'' || UPPER(:P195_DOC_NO) || ''%'' OR :P195_DOC_NO IS NULL)',
'  AND (UPPER(wfdc_sub_vou_type) LIKE ''%'' || UPPER(:P195_SUB_VOU_TYPE) || ''%'' OR :P195_SUB_VOU_TYPE IS NULL)',
'  AND (UPPER(wfdc_TYPE) LIKE ''%'' || UPPER(:P195_TYPE) || ''%'' ',
'        OR (UPPER(wfdc_TYPE_DESC) LIKE ''%'' || UPPER(:P195_TYPE) || ''%'')',
'        OR :P195_TYPE IS NULL)',
' AND (wfdcl_priority LIKE ''%'' || UPPER(:P195_PRIORITY) || ''%'' OR :P195_PRIORITY IS NULL)',
'  AND (UPPER(wfdc_benf_id) LIKE ''%'' || UPPER(:P195_PARTY) || ''%'' OR :P195_PARTY IS NULL)',
'  AND (UPPER(wfdc_benf_name) LIKE ''%'' || UPPER(:P195_PARTY_NAME) || ''%'' OR :P195_PARTY_NAME IS NULL)',
'   AND (TRUNC(wfdcl_action_date) = TO_DATE(:P195_ACT_DATE,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P195_ACT_DATE,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'   AND (TRUNC(wfdc_doc_date) <= TO_DATE(:P195_FRM_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P195_FRM_DATE_DOC,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'   AND (TRUNC(wfdc_doc_date) <= TO_DATE(:P195_TO_DATE_DOC,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P195_TO_DATE_DOC,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'   AND (UPPER(wfdc_from_emp) LIKE ''%'' || UPPER(:P195_DOC_FROM_EMP) || ''%'' ',
'   OR (UPPER(wfdc_from_emp_name) LIKE ''%'' || UPPER(:P195_DOC_FROM_EMP) || ''%'')',
'   OR UPPER(:P195_DOC_FROM_EMP) IS NULL)',
'  ORDER by wfdcl_doc_no,wfdcl_seqno '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P195_TYPE,P195_SUB_VOU_TYPE,P195_VOU_TYPE,P195_FRM_DATE_DOC,P195_TO_DATE_DOC,P195_DOC_NO,P195_ACT_DATE,P195_PARTY,P195_PARTY_NAME,P195_PRIORITY,P195_TYPE1,P195_PRNT_EMP_ID,P195_DOC_FROM_EMP'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Work Flow History'
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
 p_id=>wwv_flow_imp.id(13313122596733534325)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7833601612948614123
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(13395455908036761388)
,p_name=>'Action By User'
,p_static_id=>'action-by-user'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(13395455804629761387)
,p_name=>'Forwarded To User'
,p_static_id=>'forwarded-to-user'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569673571397283208)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>550
,p_group_id=>wwv_flow_imp.id(13395455908036761388)
,p_column_identifier=>'BB'
,p_column_label=>' Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569673109004283204)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>540
,p_group_id=>wwv_flow_imp.id(13395455804629761387)
,p_column_identifier=>'BA'
,p_column_label=>' Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'DOC_WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569675862025283240)
,p_db_column_name=>'Details'
,p_display_order=>590
,p_column_identifier=>'BI'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569674397774283219)
,p_db_column_name=>'FROM_EMP'
,p_display_order=>570
,p_group_id=>wwv_flow_imp.id(13395455908036761388)
,p_column_identifier=>'BD'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569672782906283202)
,p_db_column_name=>'Priority'
,p_display_order=>530
,p_column_identifier=>'AZ'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569673982072283218)
,p_db_column_name=>'Status'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'Action'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Status#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569656806000283063)
,p_db_column_name=>'WFDCL_ACCTS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdcl Accts'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569661216354283097)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Action Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569660446475283090)
,p_db_column_name=>'WFDCL_APPR_NO'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Wfdcl Appr No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569666722739283155)
,p_db_column_name=>'WFDCL_AUTH_TYPE'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Wfdcl Auth Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569652595644283032)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569672327354283199)
,p_db_column_name=>'WFDCL_COLL_CENTR_ID'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Wfdcl Coll Centr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569668389526283171)
,p_db_column_name=>'WFDCL_CRE_BY'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Wfdcl Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569669542070283180)
,p_db_column_name=>'WFDCL_CRE_DATE'
,p_display_order=>450
,p_column_identifier=>'AR'
,p_column_label=>'Wfdcl Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569671558973283194)
,p_db_column_name=>'WFDCL_CRE_EMP_ID'
,p_display_order=>500
,p_column_identifier=>'AW'
,p_column_label=>'Wfdcl Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569668757302283175)
,p_db_column_name=>'WFDCL_CRE_IP_ADDR'
,p_display_order=>430
,p_column_identifier=>'AP'
,p_column_label=>'Wfdcl Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569669157143283179)
,p_db_column_name=>'WFDCL_CRE_OS_USER'
,p_display_order=>440
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdcl Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569657210164283066)
,p_db_column_name=>'WFDCL_CTRL_PERSON'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Wfdcl Ctrl Person'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569654811964283046)
,p_db_column_name=>'WFDCL_CUST_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wfdcl Cust Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569653723252283038)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569653347454283035)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569664844041283138)
,p_db_column_name=>'WFDCL_DOC_SFX'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Wfdcl Doc Sfx'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569667117127283160)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569659674890283083)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569658878996283075)
,p_db_column_name=>'WFDCL_JRNL_TYPE'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Wfdcl Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569655216573283049)
,p_db_column_name=>'WFDCL_LVL1'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdcl Lvl1'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569655688770283054)
,p_db_column_name=>'WFDCL_LVL2'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdcl Lvl2'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569656078922283058)
,p_db_column_name=>'WFDCL_LVL3'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdcl Lvl3'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569656411450283061)
,p_db_column_name=>'WFDCL_LVL4'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdcl Lvl4'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569666368610283152)
,p_db_column_name=>'WFDCL_LVL_PRJ'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdcl Lvl Prj'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569660088814283086)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569664010124283130)
,p_db_column_name=>'WFDCL_PLNT'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Wfdcl Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569662894432283113)
,p_db_column_name=>'WFDCL_PO_MODE'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Wfdcl Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569667982528283168)
,p_db_column_name=>'WFDCL_PREV_BU'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Wfdcl Prev Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569664463460283133)
,p_db_column_name=>'WFDCL_PREV_CTRL_PERSON'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Wfdcl Prev Ctrl Person'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569667592840283163)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569662479772283110)
,p_db_column_name=>'WFDCL_PRIORITY'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Wfdcl Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569658088414283069)
,p_db_column_name=>'WFDCL_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Wfdcl Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569661700694283100)
,p_db_column_name=>'WFDCL_PROD_ID'
,p_display_order=>250
,p_column_identifier=>'X'
,p_column_label=>'Wfdcl Prod Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569662037664283105)
,p_db_column_name=>'WFDCL_PROD_REV'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>'Wfdcl Prod Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569663296547283118)
,p_db_column_name=>'WFDCL_QC_INS_MODE'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Wfdcl Qc Ins Mode'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569660826345283094)
,p_db_column_name=>'WFDCL_QC_REV'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Wfdcl Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569658411441283072)
,p_db_column_name=>'WFDCL_RND_PRJ_ID'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Wfdcl Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569657658427283068)
,p_db_column_name=>'WFDCL_SEQNO'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569654445489283043)
,p_db_column_name=>'WFDCL_SPPLR_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdcl Spplr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569665193771283141)
,p_db_column_name=>'WFDCL_SRC_BU'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Wfdcl Src Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569665567069283144)
,p_db_column_name=>'WFDCL_SRC_PLNT'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Wfdcl Src Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569665949200283147)
,p_db_column_name=>'WFDCL_SRC_USER'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Wfdcl Src User'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569654059900283041)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8205593540677238746)
,p_db_column_name=>'WFDCL_SUB_VOU_DESC'
,p_display_order=>620
,p_column_identifier=>'BL'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569652939709283033)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'WF Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569669950675283183)
,p_db_column_name=>'WFDCL_UPD_BY'
,p_display_order=>460
,p_column_identifier=>'AS'
,p_column_label=>'Wfdcl Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569671193039283191)
,p_db_column_name=>'WFDCL_UPD_DATE'
,p_display_order=>490
,p_column_identifier=>'AV'
,p_column_label=>'Wfdcl Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569671968203283197)
,p_db_column_name=>'WFDCL_UPD_EMP_ID'
,p_display_order=>510
,p_column_identifier=>'AX'
,p_column_label=>'Wfdcl Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569670360125283186)
,p_db_column_name=>'WFDCL_UPD_IP_ADDR'
,p_display_order=>470
,p_column_identifier=>'AT'
,p_column_label=>'Wfdcl Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569670750006283190)
,p_db_column_name=>'WFDCL_UPD_OS_USER'
,p_display_order=>480
,p_column_identifier=>'AU'
,p_column_label=>'Wfdcl Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569659285304283079)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Wfdcl Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569663681910283124)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'WF No.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409401357600359)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>700
,p_column_identifier=>'CA'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409332426600358)
,p_db_column_name=>'WFDC_BENF_NAME'
,p_display_order=>690
,p_column_identifier=>'BZ'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204408860167600353)
,p_db_column_name=>'WFDC_DOC_BRIEF'
,p_display_order=>640
,p_column_identifier=>'BU'
,p_column_label=>'Doc. Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409542116600360)
,p_db_column_name=>'WFDC_DOC_DATE'
,p_display_order=>710
,p_column_identifier=>'CB'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204408943626600354)
,p_db_column_name=>'WFDC_EMP_NAME'
,p_display_order=>650
,p_column_identifier=>'BV'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409007359600355)
,p_db_column_name=>'WFDC_FWD_ON'
,p_display_order=>660
,p_column_identifier=>'BW'
,p_column_label=>'Forwarded On'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8220463537385710248)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>720
,p_column_identifier=>'CC'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409214469600357)
,p_db_column_name=>'WFDC_TYPE_DESC'
,p_display_order=>680
,p_column_identifier=>'BY'
,p_column_label=>'WF Type Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204409160819600356)
,p_db_column_name=>'WFDC_VALUE'
,p_display_order=>670
,p_column_identifier=>'BX'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8204408690783600352)
,p_db_column_name=>'WFDC_VOU_DESC'
,p_display_order=>630
,p_column_identifier=>'BT'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569674742016283224)
,p_db_column_name=>'WITH_EMP'
,p_display_order=>580
,p_group_id=>wwv_flow_imp.id(13395455804629761387)
,p_column_identifier=>'BE'
,p_column_label=>' Employee Name'
,p_column_type=>'STRING'
,p_static_id=>'WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12569676233379283244)
,p_db_column_name=>'color'
,p_display_order=>600
,p_column_identifier=>'BJ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13313618856387154885)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'840505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WFDCL_WF_NO:WFDCL_TYPE:WFDC_TYPE_DESC:WFDCL_SUB_VOU_DESC:WFDC_VOU_DESC:WFDC_DOC_DATE:WFDCL_DOC_PFX:WFDCL_DOC_NO:WFDC_BENF_ID:WFDC_BENF_NAME:Status:WFDCL_ACTION_DATE:DOC_FROM_EMP:FROM_EMP:DOC_WITH_EMP:WITH_EMP:WFDC_FWD_ON:Details:WFDCL_MESSAGE:Priorit'
||'y:WFDC_DOC_BRIEF'
,p_sort_column_1=>'WFDCL_WF_NO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'WFDCL_SEQNO'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6856262318168508436)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(6856261927608508434)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(6856263150868508436)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(6856262745713508436)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8204433240471600442)
,p_name=>'P195_ACT_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'Action Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
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
 p_id=>wwv_flow_imp.id(8222267806255235742)
,p_name=>'P195_DOC_FROM_EMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'Action By User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_WF_FRM_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(10940133486870241767)
,p_name=>'P195_DOC_NO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'Vou. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DISTINCT  wfdc_doc_no  wfdc_doc_no',
' FROM WORKFLOW_USERWISE_VW ',
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
 p_id=>wwv_flow_imp.id(8222267548968235739)
,p_name=>'P195_FRM_DATE_DOC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'Date From'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
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
 p_id=>wwv_flow_imp.id(10940133054213241762)
,p_name=>'P195_PARTY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8205619257242238848)
,p_name=>'P195_PARTY_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8222267344918235737)
,p_name=>'P195_PRIORITY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8229418309827016848)
,p_name=>'P195_PRNT_EMP_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10940133356161241765)
,p_name=>'P195_SUB_VOU_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8222267612080235740)
,p_name=>'P195_TO_DATE_DOC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'Date To'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
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
 p_id=>wwv_flow_imp.id(14313292913401136091)
,p_name=>'P195_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(9032705850921658503)
,p_name=>'P195_TYPE1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8222267441285235738)
,p_name=>'P195_VOU_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
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
 p_id=>wwv_flow_imp.id(8222267743791235741)
,p_name=>'P195_WF_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10940022724014241537)
,p_prompt=>'WF No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM3011_WF_TYPE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the WF Type'
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
  'title', 'WF Type',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6856271134706508473)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6856262318168508436)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6856271657745508473)
,p_event_id=>wwv_flow_imp.id(6856271134706508473)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_TYPE,P195_SUB_VOU_TYPE,P195_DOC_NO,P195_PARTY,P195_PARTY_NAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6856269737436508472)
,p_name=>'generate'
,p_static_id=>'generate'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6856262745713508436)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6856270209225508472)
,p_event_id=>wwv_flow_imp.id(6856269737436508472)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13313122514402534324)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6856270695543508473)
,p_event_id=>wwv_flow_imp.id(6856269737436508472)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13313122514402534324)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6856267983497508467)
,p_name=>'IR Column Grouping'
,p_static_id=>'ir-column-grouping'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6856268457243508470)
,p_event_id=>wwv_flow_imp.id(6856267983497508467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6856268865247508472)
,p_name=>'IR Column Grouping_1'
,p_static_id=>'ir-column-grouping-2'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(13313122514402534324)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6856269377394508472)
,p_event_id=>wwv_flow_imp.id(6856268865247508472)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp.component_end;
end;
/
