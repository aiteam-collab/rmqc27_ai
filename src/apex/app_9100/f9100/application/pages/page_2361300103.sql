prompt --application/pages/page_2361300103
begin
--   Manifest
--     PAGE: 2361300103
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
 p_id=>2361300103
,p_name=>'Work Flow Approval Access'
,p_alias=>'WORK-FLOW-APPROVAL-ACCESS'
,p_step_title=>'Work Flow Approval Access'
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
'#Clear1{',
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
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9144172456564476277)
,p_plug_name=>'Create Work Flow Document'
,p_static_id=>'create-work-flow-document'
,p_region_css_classes=>'js-dialog-size775x230'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9121033218788007344)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_title=>'Find Work Flow Approval Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9121033424044007346)
,p_plug_name=>'Work Flow Approval Access'
,p_static_id=>'work-flow-approval-access'
,p_title=>'Find Workflow Approvals'
,p_parent_plug_id=>wwv_flow_imp.id(9121033218788007344)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9121035061424007362)
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
'SELECT *',
'  FROM(',
'SELECT (SELECT rowid',
'          FROM work_flow ',
'         WHERE wf_bu = :Global_bu',
'           AND wf_bus_proc_id = a.wf_bus_proc_id) wf_rowid,',
'       wf_bus_proc_id,',
'       wf_bus_proc_desc,',
'       wf_auth_type wf_auth_type1,',
'       Decode(wf_auth_type,''E'',''Employee'',''P'',''Position'')wf_auth_type,',
'       Decode(wf_basis,''E'',''Entity'',''U'',''Unit'')wf_basis,',
'       wf_basis wf_basis1,',
'       wf_module,',
'       wf_self_appr_flag wf_self_appr_flag1,',
'       Decode(wf_self_appr_flag,''Y'',''Yes'',''N'',''No'')wf_self_appr_flag,',
'       (SELECT wfaa_status',
'          FROM work_flow_appr_actvt',
'         WHERE wfaa_bu = wf_bu',
'           AND wfaa_wf_id = wf_bus_proc_id',
'           AND wfaa_seq_no = wfda_seq_no) wf_code_id,',
'       (SELECT wfaa_status_desc',
'          FROM work_flow_appr_actvt',
'         WHERE wfaa_bu = wf_bu',
'           AND wfaa_wf_id = wf_bus_proc_id',
'           AND wfaa_seq_no = wfda_seq_no) wf_code_desc,            ',
'       wfda_position,',
'       CASE WHEN wf_auth_type = ''E'' THEN (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'                                            FROM employees',
'                                           WHERE emp_bu = wf_bu',
'                                             AND emp_emp_id = wfda_position)',
'            WHEN wf_auth_type = ''P'' THEN (SELECT hrpos_pos_name1',
'                                            FROM hr_positions',
'                                           WHERE hrpos_bu = wf_bu',
'                                             AND hrpos_pos_id = wfda_position)',
'       END wfda_pos_name  ,      ',
'       wfda_date_from wf_eff_from,',
'       wfda_date_to  wf_eff_to,',
'       CASE wf_status WHEN ''E'' THEN ''Draft''',
'                      WHEN ''N'' THEN ''Entry Completed''',
'                      WHEN ''A'' THEN ''Approved''',
'                      WHEN ''C'' THEN ''Cancelled''',
'        END status,',
'       CASE wf_status WHEN ''E'' THEN ''Blue''',
'                      WHEN ''N'' THEN ''Brown''',
'                      WHEN ''A'' THEN ''Green''',
'                      WHEN ''C'' THEN ''Red''',
'        END color,',
'       wf_status, wf_doc_date,wf_doc_no, wf_doc_rev,',
'              wf_seq_no,',
'         wf_cre_by,',
'         TO_CHAR(wf_cre_date,''DD-MM-YYYY HH:MI:SS AM'') CRE_DATE,',
'       TO_CHAR((SELECT wfdcl_action_date                  ',
'          FROM wf_doc_control_log',
'         WHERE wfdcl_bu   = :global_bu',
'           AND wfdcl_doc_no = wf_doc_no',
'           AND WFDCL_TYPE = ''WF_WORK_FLOW''',
'           and wfdcl_status = ''A''',
'           AND ROWNUM = 1),''DD-MM-YYYY HH:MI:SS AM'')wfdcl_action_date,',
'       (SELECT (SELECT EMP_FIRST_NAME1',
'                 FROM EMPLOYEES',
'                WHERE EMP_BU     = wfdcl_bu',
'                  AND EMP_EMP_ID = wfdcl_ctrl_person) appr_by                   ',
'          FROM wf_doc_control_log',
'         WHERE wfdcl_bu   = :global_bu',
'           AND wfdcl_doc_no = wf_doc_no',
'           and wfdcl_status = ''A''',
'           AND WFDCL_TYPE = ''WF_WORK_FLOW''',
'           AND ROWNUM = 1) appr_by,',
'           TO_CHAR(wf_doc_date,:GLOBAL_RPT_DATE_MASK) DOC_DATE',
' FROM  work_flow a,',
'       wf_direct_authorization',
'WHERE  wf_bu  = wfda_bu(+)',
'  AND  wf_bus_proc_id = wfda_type(+)  ',
'  AND  wf_bu = :GLOBAL_BU ',
'  )',
'WHERE :P2361300103_SHOW_DATA = ''Y''',
'  AND ((INSTR(UPPER(wf_bus_proc_id),UPPER(TRIM(:P2361300103_WORK_FLOW_NAME))) > 0 ) ',
'         OR (INSTR(UPPER((wf_bus_proc_desc)),UPPER(TRIM(:P2361300103_WORK_FLOW_NAME))) > 0)  ',
'         OR :P2361300103_WORK_FLOW_NAME IS NULL)   ',
'  AND ((INSTR(UPPER(wfda_position),UPPER(TRIM(:P2361300103_EMPLOYEE_NAME))) > 0 ) ',
'         OR (INSTR(UPPER((wfda_pos_name)),UPPER(TRIM(:P2361300103_EMPLOYEE_NAME))) > 0)  ',
'         OR :P2361300103_EMPLOYEE_NAME IS NULL) ',
'  AND ((INSTR(UPPER(wf_module),UPPER(TRIM(:P2361300103_MODULE))) > 0 ) ',
'         OR :P2361300103_MODULE IS NULL)   ',
'  AND ((INSTR(UPPER(wf_code_id),UPPER(TRIM(:P2361300103_CODE))) > 0 ) ',
'         OR (INSTR(UPPER((wf_code_id)),UPPER(TRIM(:P2361300103_CODE))) > 0)  ',
'         OR :P2361300103_CODE IS NULL)     ',
'  AND ((INSTR(UPPER(wf_code_desc),UPPER(TRIM(:P2361300103_CODE_DESC))) > 0 ) ',
'         OR (INSTR(UPPER((wf_code_desc)),UPPER(TRIM(:P2361300103_CODE_DESC))) > 0)  ',
'         OR :P2361300103_CODE_DESC IS NULL)    ',
'  AND (wf_self_appr_flag1 = :P2361300103_SELF_APPROVAL OR :P2361300103_SELF_APPROVAL IS NULL)                              ',
'  AND (wf_basis1 = :P2361300103_AUTH_BASSIS OR :P2361300103_AUTH_BASSIS IS NULL)                                ',
'  AND (wf_status = :P2361300103_STATUS OR :P2361300103_STATUS = ''ALL'')',
'  AND (wf_auth_type1 = :P2361300103_AUTH_TYPE OR :P2361300103_AUTH_TYPE IS NULL) ',
'  AND ((((TO_DATE(:P2361300103_DATE_FROM,:GLOBAL_DATE_FORMAT) BETWEEN TRUNC(wf_eff_from)  AND TRUNC(wf_eff_to)) ',
'         OR (TO_DATE(:P2361300103_DATE_TO,:GLOBAL_DATE_FORMAT) BETWEEN TRUNC(wf_eff_from)  AND TRUNC(wf_eff_to)))',
'         AND :P2361300103_DATE_TO IS NOT NULL AND :P2361300103_DATE_FROM IS NOT NULL)',
'      OR (TRUNC(wf_eff_from)    >= TO_DATE(:P2361300103_DATE_FROM,:GLOBAL_DATE_FORMAT) AND :P2361300103_DATE_FROM IS NOT NULL AND :P2361300103_DATE_TO IS NULL)',
'      OR (TRUNC(wf_eff_to)      <= TO_DATE(:P2361300103_DATE_TO,:GLOBAL_DATE_FORMAT) AND :P2361300103_DATE_FROM IS NULL AND :P2361300103_DATE_TO IS NOT NULL)',
'      OR (:P2361300103_DATE_FROM IS NULL AND :P2361300103_DATE_TO IS NULL))  ',
'ORDER BY wf_doc_date DESC--,wf_module,wf_seq_no  '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2361300103_WORK_FLOW_NAME,P2361300103_EMPLOYEE_NAME,P2361300103_MODULE,P2361300103_AUTH_BASSIS,P2361300103_AUTH_TYPE,P2361300103_SELF_APPROVAL,P2361300103_CODE,P2361300103_CODE_DESC,P2361300103_DATE_FROM,P2361300103_DATE_TO,P2361300103_SHOW_DATA,P23'
||'61300103_STATUS'
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
 p_id=>wwv_flow_imp.id(9121035112914007363)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3639073277370396335
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7886341853208403263)
,p_db_column_name=>'APPR_BY'
,p_display_order=>310
,p_column_identifier=>'BL'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7859555165306375652)
,p_db_column_name=>'COLOR'
,p_display_order=>270
,p_column_identifier=>'BH'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7886341656408403261)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>290
,p_column_identifier=>'BJ'
,p_column_label=>'Cre. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7886342152283403266)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>330
,p_column_identifier=>'BN'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7859555078270375651)
,p_db_column_name=>'STATUS'
,p_display_order=>260
,p_column_identifier=>'BG'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198022774312067)
,p_db_column_name=>'WFDA_POSITION'
,p_display_order=>140
,p_column_identifier=>'AT'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198091003312068)
,p_db_column_name=>'WFDA_POS_NAME'
,p_display_order=>150
,p_column_identifier=>'AU'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7886341883165403264)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>320
,p_column_identifier=>'BM'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121036244784007374)
,p_db_column_name=>'WF_AUTH_TYPE'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198565879312072)
,p_db_column_name=>'WF_AUTH_TYPE1'
,p_display_order=>190
,p_column_identifier=>'AY'
,p_column_label=>'Wf Auth Type1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121036359539007375)
,p_db_column_name=>'WF_BASIS'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Auth Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198676195312073)
,p_db_column_name=>'WF_BASIS1'
,p_display_order=>200
,p_column_identifier=>'AZ'
,p_column_label=>'Wf Basis1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121035546103007367)
,p_db_column_name=>'WF_BUS_PROC_DESC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Work Flow Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121035406257007366)
,p_db_column_name=>'WF_BUS_PROC_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Work Flow ID'
,p_column_link=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID,P2361300102_TEST:#WF_ROWID#,&P2361300103_WORK_FLOW_NAME.#ROWID#'
,p_column_linktext=>'#WF_BUS_PROC_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198471686312071)
,p_db_column_name=>'WF_CODE_DESC'
,p_display_order=>180
,p_column_identifier=>'AX'
,p_column_label=>'Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198310542312070)
,p_db_column_name=>'WF_CODE_ID'
,p_display_order=>170
,p_column_identifier=>'AW'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7886341497579403260)
,p_db_column_name=>'WF_CRE_BY'
,p_display_order=>280
,p_column_identifier=>'BI'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9315719774190981675)
,p_db_column_name=>'WF_DOC_DATE'
,p_display_order=>220
,p_column_identifier=>'BC'
,p_column_label=>'Wf Doc Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9315719938517981677)
,p_db_column_name=>'WF_DOC_NO'
,p_display_order=>240
,p_column_identifier=>'BE'
,p_column_label=>'Wf Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9315720070329981678)
,p_db_column_name=>'WF_DOC_REV'
,p_display_order=>250
,p_column_identifier=>'BF'
,p_column_label=>'Wf Doc Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121258364133450655)
,p_db_column_name=>'WF_EFF_FROM'
,p_display_order=>100
,p_column_identifier=>'AP'
,p_column_label=>'Eff. From Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121258417833450656)
,p_db_column_name=>'WF_EFF_TO'
,p_display_order=>110
,p_column_identifier=>'AQ'
,p_column_label=>'Eff. To Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121036661434007378)
,p_db_column_name=>'WF_MODULE'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198224383312069)
,p_db_column_name=>'WF_ROWID'
,p_display_order=>160
,p_column_identifier=>'AV'
,p_column_label=>'Wf Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121256996790450642)
,p_db_column_name=>'WF_SELF_APPR_FLAG'
,p_display_order=>90
,p_column_identifier=>'AC'
,p_column_label=>'Self Approval '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9141198740050312074)
,p_db_column_name=>'WF_SELF_APPR_FLAG1'
,p_display_order=>210
,p_column_identifier=>'BA'
,p_column_label=>'Wf Self Appr Flag1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9315719832442981676)
,p_db_column_name=>'WF_SEQ_NO'
,p_display_order=>230
,p_column_identifier=>'BD'
,p_column_label=>'Wf Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9121258572671450657)
,p_db_column_name=>'WF_STATUS'
,p_display_order=>120
,p_column_identifier=>'AR'
,p_column_label=>'Wf Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9121365138020531911)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15265580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WF_BUS_PROC_ID:WF_BUS_PROC_DESC:DOC_DATE:WF_MODULE:WF_CODE_ID:WF_CODE_DESC:WF_AUTH_TYPE:WF_BASIS:WFDA_POSITION:WFDA_POS_NAME:WF_SELF_APPR_FLAG:STATUS:WF_EFF_FROM:WF_EFF_TO:WF_CRE_BY:CRE_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5945078347409612528)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(5945079203353612529)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
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
 p_id=>wwv_flow_imp.id(5945095986427612567)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_button_name=>'Clear_1'
,p_static_id=>'clear-2'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5945079577931612529)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(5945080007702612529)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(5945080386503612529)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(5945080833614612531)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(5945078806646612528)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_button_name=>'Find_Report'
,p_static_id=>'find-report'
,p_button_static_id=>'SEARCH'
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
 p_id=>wwv_flow_imp.id(5945095603063612567)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5945094747051612565)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9121035061424007362)
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
 p_id=>wwv_flow_imp.id(5945116862806612590)
,p_branch_name=>'Go To Page 2361300102'
,p_branch_action=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID,P2361300102_WF_BUS_PROC_ID:&P2361300103_ROWID.,&P2361300103_WF_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5945095603063612567)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121041386163007365)
,p_name=>'P2361300103_AUTH_BASSIS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Entity;E,Unit;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121041544980007366)
,p_name=>'P2361300103_AUTH_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(9121041666167007368)
,p_name=>'P2361300103_CODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(9121041795719007369)
,p_name=>'P2361300103_CODE_DESC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(9121041947442007370)
,p_name=>'P2361300103_DATE_FROM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(9121042031124007371)
,p_name=>'P2361300103_DATE_TO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date To'
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
 p_id=>wwv_flow_imp.id(9144210850308476384)
,p_name=>'P2361300103_DOC_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144211045258476385)
,p_name=>'P2361300103_EFF_FROM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144211099117476386)
,p_name=>'P2361300103_EFF_TO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121041160485007363)
,p_name=>'P2361300103_EMPLOYEE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WF_EMP1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
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
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Employee',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9141206829724312094)
,p_name=>'P2361300103_ERROR_FLAG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7753067036635983603)
,p_name=>'P2361300103_FAVOURITE_FLAG'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(9121041323166007364)
,p_name=>'P2361300103_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
,p_colspan=>2
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
  'title', 'Select the Module',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9157720216942620252)
,p_name=>'P2361300103_ROWID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121041622637007367)
,p_name=>'P2361300103_SELF_APPROVAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
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
 p_id=>wwv_flow_imp.id(9141206662672312093)
,p_name=>'P2361300103_SHOW_DATA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7886349594600403280)
,p_name=>'P2361300103_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_item_default=>'ALL'
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All;ALL,Draft;E,Entry Complete;N,Approved;A,Cancelled;C'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9157719717197620247)
,p_name=>'P2361300103_WF_BASIS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144211759532476393)
,p_name=>'P2361300103_WF_CALL_FORM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144210571210476381)
,p_name=>'P2361300103_WF_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work Flow Id'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WORK_FLOW1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Work Flow',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144211919068476394)
,p_name=>'P2361300103_WF_MOD_SEQ_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144210799885476383)
,p_name=>'P2361300103_WF_MOULE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9144210712140476382)
,p_name=>'P2361300103_WF_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work Flow Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9157719586266620246)
,p_name=>'P2361300103_WF_SEQ_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9144172456564476277)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9121041086254007362)
,p_name=>'P2361300103_WORK_FLOW_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9121033424044007346)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work Flow'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WF_ID1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5945100413213612573)
,p_validation_name=>'P2361300103_DOC_DATE'
,p_static_id=>'p2361300103-doc-date'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300103_DOC_DATE IS NULL THEN',
'   return(''Doc. Date must be entered.'');',
'END IF;',
'',
'IF TO_DATE(:P2361300103_DOC_DATE,:GLOBAL_DATE_FORMAT) < TRUNC(SYSDATE) THEN',
'   return(''Doc. Date should be greater than Current date.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5945095603063612567)
,p_associated_item=>wwv_flow_imp.id(9144210850308476384)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5945100803605612574)
,p_validation_name=>'P2361300103_EFF_FROM'
,p_static_id=>'p2361300103-eff-from'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300103_EFF_FROM IS NOT NULL AND :P2361300103_EFF_TO IS NOT NULL THEN',
'',
'   IF TO_DATE(:P2361300103_EFF_FROM,:GLOBAL_DATE_FORMAT) > TO_DATE(:P2361300103_EFF_TO,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective From date should be less than or equal to Effective To date.'');',
'   END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5945095603063612567)
,p_associated_item=>wwv_flow_imp.id(9144211045258476385)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5945101165896612574)
,p_validation_name=>'P2361300103_EFF_TO'
,p_static_id=>'p2361300103-eff-to'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300103_EFF_FROM IS NOT NULL AND :P2361300103_EFF_TO IS NOT NULL THEN',
'',
'   IF TO_DATE(:P2361300103_EFF_TO,:GLOBAL_DATE_FORMAT) < TO_DATE(:P2361300103_EFF_FROM,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective To date should be greater than Effective From date.'');',
'   END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5945095603063612567)
,p_associated_item=>wwv_flow_imp.id(9144211099117476386)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5945100000263612573)
,p_validation_name=>'P2361300103_WF_ID'
,p_static_id=>'p2361300103-wf-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300103_WF_ID IS NULL THEN',
'	 return(''Work Flow ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5945095603063612567)
,p_associated_item=>wwv_flow_imp.id(9144210571210476381)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945106622670612581)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945078347409612528)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945107068329612581)
,p_event_id=>wwv_flow_imp.id(5945106622670612581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9144172456564476277)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945105157321612579)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945079203353612529)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945106231422612579)
,p_event_id=>wwv_flow_imp.id(5945105157321612579)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_WORK_FLOW_NAME,P2361300103_EMPLOYEE_NAME,P2361300103_MODULE,P2361300103_AUTH_BASSIS,P2361300103_AUTH_TYPE,P2361300103_SELF_APPROVAL,P2361300103_CODE,P2361300103_CODE_DESC,P2361300103_DATE_FROM,P2361300103_DATE_TO,P2361300103_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945105678688612579)
,p_event_id=>wwv_flow_imp.id(5945105157321612579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945109323845612582)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945109761527612584)
,p_event_id=>wwv_flow_imp.id(5945109323845612582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_WORK_FLOW_NAME,P2361300103_EMPLOYEE_NAME,P2361300103_MODULE,P2361300103_AUTH_BASSIS,P2361300103_AUTH_TYPE,P2361300103_SELF_APPROVAL,P2361300103_CODE,P2361300103_CODE_DESC,P2361300103_DATE_FROM,P2361300103_DATE_TO,P2361300103_SHOW_DATA,P23'
||'61300103_ERROR_FLAG'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945110314396612584)
,p_event_id=>wwv_flow_imp.id(5945109323845612582)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P2361300103_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945115891114612590)
,p_name=>'Clear_1'
,p_static_id=>'clear-3'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945095986427612567)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945116411935612590)
,p_event_id=>wwv_flow_imp.id(5945115891114612590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_WF_ID,P2361300103_WF_NAME,P2361300103_DOC_DATE,P2361300103_WF_MOULE,P2361300103_EFF_FROM,P2361300103_EFF_TO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945113119125612587)
,p_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945080386503612529)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945113608732612587)
,p_event_id=>wwv_flow_imp.id(5945113119125612587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300103_FAVOURITE_FLAG',
  'items_to_submit', 'P2361300103_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P2361300103_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(5945114091346612587)
,p_event_id=>wwv_flow_imp.id(5945113119125612587)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945114507072612588)
,p_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945080833614612531)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945114963429612588)
,p_event_id=>wwv_flow_imp.id(5945114507072612588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300103_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P2361300103_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(5945115442726612588)
,p_event_id=>wwv_flow_imp.id(5945114507072612588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945102773278612576)
,p_name=>'Find_Report'
,p_static_id=>'find-report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945078806646612528)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945103261725612578)
,p_event_id=>wwv_flow_imp.id(5945102773278612576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300103_ERROR_FLAG',
  'items_to_submit', 'P2361300103_DATE_FROM,P2361300103_DATE_TO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P2361300103_ERROR_FLAG := 0;',
    '',
    'IF :P2361300103_DATE_FROM IS NOT NULL  OR :P2361300103_DATE_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P2361300103_DATE_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P2361300103_ERROR_FLAG := ''P2361300103_DATE_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P2361300103_DATE_FROM,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P2361300103_ERROR_FLAG := ''P2361300103_DATE_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945104784973612579)
,p_event_id=>wwv_flow_imp.id(5945102773278612576)
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
,p_client_condition_element=>'P2361300103_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945104285468612578)
,p_event_id=>wwv_flow_imp.id(5945102773278612576)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9121035061424007362)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P2361300103_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945103827963612578)
,p_event_id=>wwv_flow_imp.id(5945102773278612576)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361300103_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945110705690612584)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300103_FAVOURITE_FLAG'
,p_condition_element=>'P2361300103_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945112221907612585)
,p_event_id=>wwv_flow_imp.id(5945110705690612584)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5945080833614612531)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945112734259612585)
,p_event_id=>wwv_flow_imp.id(5945110705690612584)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5945080386503612529)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945111225488612585)
,p_event_id=>wwv_flow_imp.id(5945110705690612584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5945080833614612531)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945111637343612585)
,p_event_id=>wwv_flow_imp.id(5945110705690612584)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5945080386503612529)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945101838789612576)
,p_name=>'P2361300103_ERROR_FLAG'
,p_static_id=>'p2361300103-error-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300103_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945102359172612576)
,p_event_id=>wwv_flow_imp.id(5945101838789612576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.message.clearErrors();',
    '',
    'var errorFlag= $v(''P2361300103_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P2361300103_DATE_FROM'') {',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P2361300103_DATE_FROM",',
    '        message:    "Date From must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '',
    'if(errorFlag == ''P2361300103_DATE_TO'') {',
    '',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P2361300103_DATE_TO",',
    '        message:    "Date To must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5945107506076612581)
,p_name=>'P2361300103_WF_ID'
,p_static_id=>'p2361300103-wf-id'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300103_WF_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945107969071612582)
,p_event_id=>wwv_flow_imp.id(5945107506076612581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300103_WF_MOULE,P2361300103_WF_CALL_FORM,P2361300103_WF_MOD_SEQ_NO,P2361300103_WF_NAME,P2361300103_WF_SEQ_NO,P2361300103_WF_BASIS',
  'items_to_submit', 'P2361300103_WF_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361300103_WF_ID IS NOT NULL THEN',
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
    '         AND wfm_bus_proc_id	   = :P2361300103_WF_ID;',
    '       ',
    '       cr1  c1%ROWTYPE;',
    '     ',
    '   BEGIN',
    '   	',
    '   	OPEN c1;',
    '   	FETCH c1 INTO cr1;',
    '   	   ',
    '   	   IF c1%FOUND THEN',
    '   	   	  :P2361300103_WF_MOULE  				:= cr1.wfm_module ;',
    '   	   	  :P2361300103_WF_CALL_FORM   		:= cr1.wfm_call_form;',
    '   	   	  :P2361300103_WF_MOD_SEQ_NO			:= cr1.seq_no;',
    '   	   	  :P2361300103_WF_NAME		         := cr1.wf_bus_proc_desc;',
    '   	   	  :P2361300103_WF_SEQ_NO				:= cr1.seq_no;',
    '   	   	  :P2361300103_WF_BASIS             := cr1.wfm_basis;',
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
 p_id=>wwv_flow_imp.id(5945108420123612582)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5945094747051612565)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5945108916768612582)
,p_event_id=>wwv_flow_imp.id(5945108420123612582)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5945101459811612574)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Document Process'
,p_static_id=>'create-document-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_doc_no       VARCHAR2(15);',
'   v_rev_no       NUMBER(5);',
'BEGIN',
'   SELECT NVL(MAX(TO_NUMBER(WF_DOC_NO)),1000000000)+1,0',
'     INTO v_doc_no, ',
'          v_rev_no',
'     FROM WORK_FLOW',
'    WHERE WF_BU		= :GLOBAL_BU;',
'',
'   INSERT INTO WORK_FLOW (WF_BU,',
'                          WF_SEQ_NO,',
'                          WF_BUS_PROC_ID,',
'                          WF_BUS_PROC_DESC,',
'                          WF_BUS_PROC_DESC2,',
'                          WF_MAIL_FLAG,',
'                          WF_INT_MSG_FLAG,',
'                          WF_SMS_FLAG,',
'                          WF_AUTH_TYPE,',
'                          WF_BASIS,',
'                          WF_VAL_BASED_FLAG,',
'                          WF_MODULE,',
'                          WF_MOD_SEQ_NO,',
'                          WF_CLS_BASED,',
'                          WF_DISC_PCT_BASED_FLAG,',
'                          WF_HIER_TYPE,',
'                          WF_CRE_BY,',
'                          WF_CRE_DATE,',
'                          WF_SELF_APPR_FLAG,',
'                          WF_PROJ_BASED_FLAG,',
'                          WF_APPR_BASIS,',
'                          WF_VERT_TYPE,',
'                          WF_MAIL_SEND_OPT,',
'                          WF_SMS_SEND_OPT,',
'                          WF_DOC_NO,',
'                          WF_DOC_REV,',
'                          WF_DOC_DATE,',
'                          WF_EFF_FROM,',
'                          WF_EFF_TO,',
'                          WF_STATUS,',
'                          WF_CALL_FORM,',
'                          WF_APEX_APPL_NO,',
'                          WF_APEX_PAGE_NO)',
'        VALUES (:GLOBAL_BU,',
'                :P2361300103_WF_SEQ_NO,',
'                :P2361300103_WF_ID,',
'                :P2361300103_WF_NAME,',
'                :P2361300103_WF_NAME,',
'                ''N'',',
'                ''N'',',
'                ''N'',',
'                ''E'',',
'                :P2361300103_WF_BASIS,',
'                (SELECT CASE WHEN WFM_VAL_BASED_FLAG = ''V'' THEN ''Y'' ELSE ''N'' END',
'                   FROM WORK_FLOW_MASTER',
'                  WHERE WFM_BU =:GLOBAL_bu',
'                    AND WFM_BUS_PROC_ID =:P2361300103_WF_ID),  --''N'',',
'                :P2361300103_WF_MOULE,',
'                :P2361300103_WF_MOD_SEQ_NO,',
'                ''N'',',
'                ''N'',',
'                ''E'',',
'                :GLOBAL_USER,',
'                SYSDATE,',
'                ''Y'',',
'                ''N'',',
'                ''N'',',
'                ''STD'',',
'                ''M'',',
'                ''M'',',
'                v_doc_no,',
'                v_rev_no,',
'                TO_DATE(:P2361300103_DOC_DATE,:GLOBAL_DATE_FORMAT),',
'                TO_DATE(:P2361300103_EFF_FROM,:GLOBAL_DATE_FORMAT),',
'                TO_DATE(:P2361300103_EFF_TO,:GLOBAL_DATE_FORMAT),',
'                ''E'',',
'                :P2361300103_WF_CALL_FORM,',
'                (SELECT WFM_APEX_APPL_NO',
'                   FROM WORK_FLOW_MASTER',
'                  WHERE WFM_BU =:GLOBAL_bu',
'                    AND WFM_BUS_PROC_ID =:P2361300103_WF_ID),',
'                 (SELECT WFM_APEX_PAGE_NO',
'                   FROM WORK_FLOW_MASTER',
'                  WHERE WFM_BU =:GLOBAL_bu',
'                    AND WFM_BUS_PROC_ID =:P2361300103_WF_ID));',
'END;                ',
'COMMIT;',
'',
'SELECT ROWID',
'  INTO :P2361300103_ROWID',
'  FROM WORK_FLOW',
' WHERE WF_BU = :GLOBAL_BU',
'   AND WF_BUS_PROC_ID = :P2361300103_WF_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5945095603063612567)
,p_internal_uid=>463139624268001546
);
wwv_flow_imp.component_end;
end;
/
