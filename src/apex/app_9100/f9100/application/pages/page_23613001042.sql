prompt --application/pages/page_23613001042
begin
--   Manifest
--     PAGE: 23613001042
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
 p_id=>23613001042
,p_name=>'Work Flow Authorization List'
,p_alias=>'WORK-FLOW-AUTHORIZATION-LIST'
,p_step_title=>'Work Flow Authorization List'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'ref_fav();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
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
'    background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   --top: -4px;',
'}',
' ',
'.t-Button--primary:not(.t-Button--simple):not(.t-Button--hot), .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot):active, .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot).is-active {',
'    background-color: #ffffff;',
'    border-radius: 6.5px;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9585697423889394515)
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
 p_id=>wwv_flow_imp.id(9585697629145394517)
,p_plug_name=>'Work Flow Approval Access'
,p_static_id=>'work-flow-approval-access'
,p_title=>'Report : Work Flow Authorization List'
,p_parent_plug_id=>wwv_flow_imp.id(9585697423889394515)
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
 p_id=>wwv_flow_imp.id(9585699266525394533)
,p_plug_name=>'Work_Flow_Report'
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
'         WHERE wf_bu = :global_bu',
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
'           TO_CHAR(wf_doc_date,''DD-MON-YYYY'') DOC_DATE',
' FROM  work_flow a,',
'       wf_direct_authorization',
'WHERE  wf_bu  = wfda_bu(+)',
'  AND  wf_bus_proc_id = wfda_type(+)  ',
'  AND  wf_bu = :global_bu ',
'  )',
'WHERE  ((INSTR(UPPER(wf_bus_proc_id),UPPER(TRIM(:P23613001042_WORK_FLOW_NAME))) > 0 ) ',
'         OR (INSTR(UPPER((wf_bus_proc_desc)),UPPER(TRIM(:P23613001042_WORK_FLOW_NAME))) > 0)  ',
'         OR :P23613001042_WORK_FLOW_NAME IS NULL)   ',
'  AND ((INSTR(UPPER(wfda_position),UPPER(TRIM(:P23613001042_EMPLOYEE_NAME))) > 0 ) ',
'         OR (INSTR(UPPER((wfda_pos_name)),UPPER(TRIM(:P23613001042_EMPLOYEE_NAME))) > 0)  ',
'         OR :P23613001042_EMPLOYEE_NAME IS NULL) ',
'  AND ((INSTR(UPPER(wf_module),UPPER(TRIM(:P23613001042_MODULE))) > 0 ) ',
'         OR :P23613001042_MODULE IS NULL)   ',
'--   AND ((INSTR(UPPER(wf_code_id),UPPER(TRIM(:P23613001042_CODE))) > 0 ) ',
'--          OR (INSTR(UPPER((wf_code_id)),UPPER(TRIM(:P23613001042_CODE))) > 0)  ',
'--          OR :P23613001042_CODE IS NULL)     ',
'--   AND ((INSTR(UPPER(wf_code_desc),UPPER(TRIM(:P23613001042_CODE_DESC))) > 0 ) ',
'--          OR (INSTR(UPPER((wf_code_desc)),UPPER(TRIM(:P23613001042_CODE_DESC))) > 0)  ',
'--          OR :P23613001042_CODE_DESC IS NULL)    ',
'  AND (wf_self_appr_flag1 = :P23613001042_SELF_APPROVAL OR :P23613001042_SELF_APPROVAL IS NULL)                              ',
'  AND (wf_basis1 = :P23613001042_AUTH_BASSIS OR :P23613001042_AUTH_BASSIS IS NULL)                                ',
'  AND (wf_status = :P23613001042_STATUS OR :P23613001042_STATUS IS NULL)',
'  AND (wf_auth_type1 = :P23613001042_AUTH_TYPE OR :P23613001042_AUTH_TYPE IS NULL) ',
'  AND ((((TO_DATE(:P23613001042_DATE_FROM,''DD-MON-YYYY'') BETWEEN TRUNC(wf_eff_from)  AND TRUNC(wf_eff_to)) ',
'         OR (TO_DATE(:P23613001042_DATE_TO,''DD-MON-YYYY'') BETWEEN TRUNC(wf_eff_from)  AND TRUNC(wf_eff_to)))',
'         AND :P23613001042_DATE_TO IS NOT NULL AND :P23613001042_DATE_FROM IS NOT NULL)',
'      OR (TRUNC(wf_eff_from)    >= TO_DATE(:P23613001042_DATE_FROM,''DD-MON-YYYY'') AND :P23613001042_DATE_FROM IS NOT NULL AND :P23613001042_DATE_TO IS NULL)',
'      OR (TRUNC(wf_eff_to)      <= TO_DATE(:P23613001042_DATE_TO,''DD-MON-YYYY'') AND :P23613001042_DATE_FROM IS NULL AND :P23613001042_DATE_TO IS NOT NULL)',
'      OR (:P23613001042_DATE_FROM IS NULL AND :P23613001042_DATE_TO IS NULL))  ',
'ORDER BY wf_doc_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23613001042_WORK_FLOW_NAME,P23613001042_EMPLOYEE_NAME,P23613001042_MODULE,P23613001042_AUTH_BASSIS,P23613001042_AUTH_TYPE,P23613001042_SELF_APPROVAL,P23613001042_DATE_FROM,P23613001042_DATE_TO,P23613001042_STATUS'
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
 p_id=>wwv_flow_imp.id(9585699318015394534)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4103737482471783506
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8351006058309790434)
,p_db_column_name=>'APPR_BY'
,p_display_order=>310
,p_column_identifier=>'BL'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8324219370407762823)
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
 p_id=>wwv_flow_imp.id(8351005861509790432)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>290
,p_column_identifier=>'BJ'
,p_column_label=>'Cre. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8351006357384790437)
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
 p_id=>wwv_flow_imp.id(8324219283371762822)
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
 p_id=>wwv_flow_imp.id(9605862227875699238)
,p_db_column_name=>'WFDA_POSITION'
,p_display_order=>140
,p_column_identifier=>'AT'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862296104699239)
,p_db_column_name=>'WFDA_POS_NAME'
,p_display_order=>150
,p_column_identifier=>'AU'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8351006088266790435)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>320
,p_column_identifier=>'BM'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9585700449885394545)
,p_db_column_name=>'WF_AUTH_TYPE'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862770980699243)
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
 p_id=>wwv_flow_imp.id(9585700564640394546)
,p_db_column_name=>'WF_BASIS'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Auth Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862881296699244)
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
 p_id=>wwv_flow_imp.id(9585699751204394538)
,p_db_column_name=>'WF_BUS_PROC_DESC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Work Flow Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9585699611358394537)
,p_db_column_name=>'WF_BUS_PROC_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Work Flow ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862676787699242)
,p_db_column_name=>'WF_CODE_DESC'
,p_display_order=>180
,p_column_identifier=>'AX'
,p_column_label=>'Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862515643699241)
,p_db_column_name=>'WF_CODE_ID'
,p_display_order=>170
,p_column_identifier=>'AW'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8351005702680790431)
,p_db_column_name=>'WF_CRE_BY'
,p_display_order=>280
,p_column_identifier=>'BI'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9780383979292368846)
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
 p_id=>wwv_flow_imp.id(9780384143619368848)
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
 p_id=>wwv_flow_imp.id(9780384275431368849)
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
 p_id=>wwv_flow_imp.id(9585922569234837826)
,p_db_column_name=>'WF_EFF_FROM'
,p_display_order=>100
,p_column_identifier=>'AP'
,p_column_label=>'Eff. From Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9585922622934837827)
,p_db_column_name=>'WF_EFF_TO'
,p_display_order=>110
,p_column_identifier=>'AQ'
,p_column_label=>'Eff. To Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9585700866535394549)
,p_db_column_name=>'WF_MODULE'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862429484699240)
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
 p_id=>wwv_flow_imp.id(9585921201891837813)
,p_db_column_name=>'WF_SELF_APPR_FLAG'
,p_display_order=>90
,p_column_identifier=>'AC'
,p_column_label=>'Self Approval '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9605862945151699245)
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
 p_id=>wwv_flow_imp.id(9780384037544368847)
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
 p_id=>wwv_flow_imp.id(9585922777772837828)
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
 p_id=>wwv_flow_imp.id(9586029343121919082)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15265580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WF_BUS_PROC_ID:WF_BUS_PROC_DESC:DOC_DATE:WF_MODULE:WF_CODE_ID:WF_CODE_DESC:WF_AUTH_TYPE:WF_BASIS:WFDA_POSITION:WFDA_POS_NAME:WF_SELF_APPR_FLAG:STATUS:WF_EFF_FROM:WF_EFF_TO:WF_CRE_BY:CRE_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7318337195779927410)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5946628316522998206)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6152351613916638251)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(9585699266525394533)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5946628696506998206)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_button_name=>'Favorite'
,p_static_id=>'favorite'
,p_button_static_id=>'F'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favorite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:global_fav();'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'.t-Icon'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5946627500157998204)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_button_name=>'Find_Report'
,p_static_id=>'find-report'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Generate'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check '
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6152351767263638253)
,p_branch_name=>'Download'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6152351613916638251)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9585709421465394544)
,p_name=>'P23613001042_AUTH_BASSIS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Basics'
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
 p_id=>wwv_flow_imp.id(9585709580282394545)
,p_name=>'P23613001042_AUTH_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Employee;E,Position;P'
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
 p_id=>wwv_flow_imp.id(9585709982744394549)
,p_name=>'P23613001042_DATE_FROM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date From'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(9585710066426394550)
,p_name=>'P23613001042_DATE_TO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date To'
,p_format_mask=>'DD-MON-YYYY'
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
 p_id=>wwv_flow_imp.id(9585709195787394542)
,p_name=>'P23613001042_EMPLOYEE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
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
 p_id=>wwv_flow_imp.id(9585709358468394543)
,p_name=>'P23613001042_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
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
 p_id=>wwv_flow_imp.id(9585709657939394546)
,p_name=>'P23613001042_SELF_APPROVAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Self Approval'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8351017629902790459)
,p_name=>'P23613001042_STATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;E,Entry Complete;N,Approved;A,Cancelled;C'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(9585709121556394541)
,p_name=>'P23613001042_WORK_FLOW_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9585697629145394517)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5946651657540998263)
,p_name=>'Find_Report'
,p_static_id=>'find-report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5946627500157998204)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6152351840935638254)
,p_event_id=>wwv_flow_imp.id(5946651657540998263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P23613001042_WORK_FLOW_NAME,P23613001042_EMPLOYEE_NAME,P23613001042_MODULE,P23613001042_AUTH_BASSIS,P23613001042_AUTH_TYPE,P23613001042_SELF_APPROVAL,P23613001042_DATE_TO,P23613001042_DATE_FROM,P23613001042_STATUS,P23613001042_CODE,P23613001042_CODE_'
||'DESC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',1,''P23613001042_WORK_FLOW_NAME'',''Work Flow'',:P23613001042_WORK_FLOW_NAME,:P23613001042_WORK_FLOW_NAME);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',2,''P23613001042_EMPLOYEE_NAME'',''Emp. Name'',:P23613001042_EMPLOYEE_NAME,:P23613001042_EMPLOYEE_NAME);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',3,''P23613001042_MODULE'',''Module'',:P23613001042_MODULE,:P23613001042_MODULE);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',4,''P23613001042_AUTH_BASSIS'',''Auth. Basics'',:P23613001042_AUTH_BASSIS,',
    '        CASE WHEN :P23613001042_AUTH_BASSIS = ''E'' THEN ''Entity''',
    '             WHEN :P23613001042_AUTH_BASSIS = ''U'' THEN ''Unit'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',5,''P23613001042_AUTH_TYPE'',''Auth. Type'',:P23613001042_AUTH_TYPE,',
    '        CASE WHEN :P23613001042_AUTH_TYPE = ''E'' THEN ''Emoloyee''',
    '             WHEN :P23613001042_AUTH_TYPE = ''P'' THEN ''Position'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',6,''P23613001042_SELF_APPROVAL'',''Self Approval'',:P23613001042_SELF_APPROVAL,',
    '          CASE WHEN :P23613001042_SELF_APPROVAL = ''Y'' THEN ''Yes''',
    '             WHEN :P23613001042_SELF_APPROVAL = ''N'' THEN ''No'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',7,''P23613001042_DATE_FROM'',''Date From'',:P23613001042_DATE_FROM,:P23613001042_DATE_FROM);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',8,''P23613001042_DATE_TO'',''Date To'',:P23613001042_DATE_TO,:P23613001042_DATE_TO);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',9,''P23613001042_STATUS'',''Status'',:P23613001042_STATUS,',
    '  CASE WHEN :P23613001042_STATUS = ''E'' THEN ''Draft''',
    '       WHEN :P23613001042_STATUS = ''N'' THEN ''Entry Complete''',
    '       WHEN :P23613001042_STATUS = ''A'' THEN ''Approved''',
    '       WHEN :P23613001042_STATUS = ''C'' THEN ''Cancelled'' END);',
    '--   proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',10,''P23613001042_CODE'',''Code'',:P23613001042_CODE,:P23613001042_CODE);',
    '--   proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',11,''P23613001042_CODE_DESC'',''Code Desc.'',:P23613001042_CODE_DESC,:P23613001042_CODE_DESC);',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5946653722510998267)
,p_event_id=>wwv_flow_imp.id(5946651657540998263)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''detail'').show();',
    'apex.region(''detail'').refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7318337323336927411)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7318337195779927410)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7318337400233927412)
,p_event_id=>wwv_flow_imp.id(7318337323336927411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613001042_WORK_FLOW_NAME,P23613001042_EMPLOYEE_NAME,P23613001042_MODULE,P23613001042_AUTH_BASSIS,P23613001042_AUTH_TYPE,P23613001042_SELF_APPROVAL,P23613001042_DATE_FROM,P23613001042_DATE_TO,P23613001042_STATUS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6152351676939638252)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Download'
,p_static_id=>'process-for-download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_qry         CLOB;',
'  v_qry_seq      NUMBER;',
'  v_fname       VARCHAR2(100);',
'BEGIN',
'',
'proc_apex_ir_report_export(:GLOBAL_bu,:app_id,:app_page_id,''Work_Flow_Report'',:app_session,:GLOBAL_user,v_qry);',
'',
'SELECT jva_exl_seq.NEXTVAL INTO v_qry_seq FROM dual;',
'',
'    INSERT INTO excel_generate_query (',
'        egq_no,',
'        egq_query,',
'        egq_bus_fun,',
'        egq_cre_by,',
'        egq_cre_date,',
'        egq_sheet_name',
'    ) VALUES (',
'        v_qry_seq,',
'        v_qry,',
'        :app_page_id,',
'        :GLOBAL_USER,',
'        SYSDATE,',
'        ''Work Flow Authorization List''',
'    );',
'    ',
'    COMMIT; ',
'    proc_apex_java_excel(v_qry_seq,',
'                               ''C_DIR'',',
'							   :GLOBAL_FILE_NAME,',
'							   :GLOBAL_user,',
'                               :global_bu,',
'                               :app_id,',
'                               :app_page_id,',
'                               :app_session,',
'                               ''"Work Flow Authorization List"'',',
'							   ''RMQC27'',',
'							   ''RMQC27'',',
'							   :global_db);',
'--Raise_Application_Error(-20999,v_qry_seq||''/''||:GLOBAL_FILE_NAME||''/''||:GLOBAL_user||''/''||:global_bu||''/''||:app_id||''/''||:app_page_id||''/''||:app_session||''/''||:global_schema||''/''||:global_schema_pass||''/''||:global_db);',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    proc_apex_err_msg_log(:APP_PAGE_ID,''TEXT'');',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6152351613916638251)
,p_internal_uid=>670389841396027224
);
wwv_flow_imp.component_end;
end;
/
