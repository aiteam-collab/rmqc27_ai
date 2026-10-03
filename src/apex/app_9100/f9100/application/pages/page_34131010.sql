prompt --application/pages/page_34131010
begin
--   Manifest
--     PAGE: 34131010
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
 p_id=>34131010
,p_name=>'Pending Payment & Receipts'
,p_alias=>'PENDING-PAYMENT-RECEIPTS'
,p_step_title=>'Pending Payment & Receipts'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function reset_rep(){',
'   const tabMapping = {',
'  ''PP''  : ''PP'',',
'  ''PSW'' : ''PSW'',',
'  ''PS'' : ''PS'',',
'  ''PR'' : ''PR'',',
'  ''PE'' : ''PE'',',
'  ''PA'' : ''PA'',',
'  ''PRAA'' : ''PRAA'',',
'  ''PRA'' : ''PRA''',
'',
'};',
'',
'   const selectedTab = $v("P34131010_REPORT_TYPE");',
'',
'   // Hide all containers',
'   for (const container in tabMapping) {',
'   apex.item(tabMapping[container]).hide();',
'   }',
'',
'   // Show the selected container',
'   apex.item(tabMapping[selectedTab]).show();',
'   //apex.item("FD").hide();',
'',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PP''){      ',
'       apex.jQuery(''#PP_ir'').interactiveReport("reset");',
'   }',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PSW''){      ',
'       apex.jQuery(''#PSW_ir'').interactiveReport("reset");',
'   }',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PS''){      ',
'       apex.jQuery(''#PS_ir'').interactiveReport("reset");',
'   }',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PR''){      ',
'       apex.jQuery(''#PR_ir'').interactiveReport("reset");',
'   }',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PE''){      ',
'       apex.jQuery(''#PE_ir'').interactiveReport("reset");',
'   }',
'   if (document.getElementById("P34131010_REPORT_TYPE").value ==''PA''){      ',
'       apex.jQuery(''#PA_ir'').interactiveReport("reset");',
'   }',
'     if (document.getElementById("P34131010_REPORT_TYPE").value ==''PRAA''){      ',
'       apex.jQuery(''#PRAA_ir'').interactiveReport("reset");',
'   }',
'     if (document.getElementById("P34131010_REPORT_TYPE").value ==''PRA''){      ',
'       apex.jQuery(''#PRA_ir'').interactiveReport("reset");',
'   }',
'   ',
'   ',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'',
'.CTS {',
'    margin-top: 4px;',
'    padding-left: 4px;',
'    border: 0px solid #a8c4d0;',
'    box-shadow: 0.5px 0.5px 3.5px rgba(70, 47, 47, 0.66);',
'    box-shadow: -6px -2px 8px rgba(58, 23, 23, 0.37);',
'    border-radius: 6px;',
'    border-spacing: 0;',
'    background: white;',
'    width: auto;',
'    clear: both;',
'    background-repeat: no-repeat;',
'    background-size: 100% 26px;',
'    /* background-image: linear-gradient(to bottom,#f1f3f3 0,#e7ebed 50%,#e3e7e9 100%); */',
'    /* border: 1px solid #c4ced3; */',
'    /* box-shadow: 0 1px 0 0 rgba(255,255,255,.9) inset; */',
'    box-shadow: 0px 0px 0px rgba(58, 23, 23, 0.19);',
'    /* text-shadow: 0 1px 0 rgba(255,255,255,.9); */',
'}',
'/***********************controlsContainer**************************/',
'.a-IG-controlsContainer, .a-IRR-controlsContainer {',
'    padding-top: var(--a-report-controls-padding-y,-8px);',
'    padding-bottom: var(--a-report-controls-padding-y,-8px);',
'}',
'',
' .a-MediaBlock, .a-RegionMedia {',
'    display: -ms-flexbox;',
'    display: none;',
'}',
'',
'.a-IG-reportSummary-label, .a-IRR-reportSummary-label {',
'    display: -ms-flexbox;',
'    display: none;',
'    -ms-flex-align: center;',
'    align-items: center;',
'    text-decoration: none;',
'}',
' .a-MediaBlock-graphic {',
'    float: left;',
'    display: none;',
'    margin-right: 8px;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6359117707325532537)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(9081413658833943261)
,p_region_css_classes=>'CTS'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9135068161219933376)
,p_plug_name=>'Pending Payable'
,p_static_id=>'pending-payable'
,p_region_name=>'PSW'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 8/3/2022 3:40:30 PM (QP5 v5.163.1008.3004) */',
'  SELECT seq_no,',
'         par_suplr_name,',
'         par_suplr_id,',
'         par_doc_date,',
'         date1,',
'         op_bal,',
'         par_cr,',
'         cl_bal,',
'         pdd_due_date,',
'         pdd_due_days',
'    FROM (SELECT 1 seq_no,',
'                 par_suplr_name,',
'                 par_suplr_id,',
'                 TO_CHAR (par_doc_date, :Global_rpt_date_mask) par_doc_date,',
'                 par_doc_date date1,',
'                 par_sc_tot_amt op_bal,',
'                 ''Cr'' par_cr,',
'                 (pdd_bal_amt * par_exchange_rate) cl_bal,',
'                 TO_CHAR (pdd_due_date, :Global_rpt_date_mask) pdd_due_date,',
'                 par_aged_days pdd_due_days',
'            FROM pending_payables_vw_hist',
'           WHERE     par_bu = :GLOBAL_BU',
'                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'                 AND par_dr_cr = ''CR''',
'                 AND (par_suplr_id = :P34131010_PARTY)',
'                 AND (pdd_bal_amt - pdd_in_progress) > 0',
'                 AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'                 AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''',
'                        OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)',
'                      AND :P34131010_DUMMY = 0',
'                      OR :P34131010_DUMMY = 1)',
'          UNION ALL',
'          SELECT 2 seq_no,',
'                 par_suplr_name,',
'                 par_suplr_id,',
'                 ''Sub Total'',',
'                 NULL,',
'                 SUM (par_sc_tot_amt) op_bal,',
'                 NULL par_cl_cr,',
'                 SUM (pdd_bal_amt * par_exchange_rate) cl_bal,',
'                 NULL,',
'                 NULL',
'            FROM pending_payables_vw_hist',
'           WHERE     par_bu = :GLOBAL_BU',
'                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'                 AND par_dr_cr = ''CR''',
'                 AND (par_suplr_id = :P34131010_PARTY)',
'                 AND (pdd_bal_amt - pdd_in_progress) > 0',
'                 AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'                 AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''',
'                        OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)',
'                      AND :P34131010_DUMMY = 0',
'                      OR :P34131010_DUMMY = 1)',
'				  GROUP BY par_suplr_name,',
'                 par_suplr_id)			 ',
'          UNION ALL',
'          SELECT seq_no,',
'                 par_suplr_name,',
'                 par_suplr_id,',
'                 par_doc_date,',
'                 date1,',
'                 op_bal,',
'                 par_cr,',
'                 cl_bal,',
'                 pdd_due_date,',
'                 pdd_due_days',
'            FROM (SELECT 3 seq_no,',
'                         par_suplr_name,',
'                         par_suplr_id,',
'                         TO_CHAR (par_doc_date, :Global_rpt_date_mask)',
'                            par_doc_date,',
'                         par_doc_date date1,',
'                         par_sc_tot_amt op_bal,',
'                         ''Dr'' par_cr,',
'                         (pdd_bal_amt * par_exchange_rate) cl_bal,',
'                         TO_CHAR (pdd_due_date, :Global_rpt_date_mask)',
'                            pdd_due_date,',
'                         par_aged_days pdd_due_days',
'                    FROM pending_payables_vw_hist',
'                   WHERE     par_bu = :GLOBAL_BU',
'                         AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'                         AND par_dr_cr = ''DR''',
'                         AND (par_suplr_id = :P34131010_PARTY)',
'                         AND (pdd_bal_amt - pdd_in_progress) > 0',
'                         AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') >',
'                                0',
'                         AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''',
'                                OR INSTR (:P34131010_UNIT || '':'',',
'                                          par_plant || '':'') > 0)',
'                              AND :P34131010_DUMMY = 0',
'                              OR :P34131010_DUMMY = 1)',
'          UNION ALL',
'          SELECT 4 seq_no,',
'                 par_suplr_name,',
'                 par_suplr_id,',
'                 ''Sub Total'',',
'                 NULL,',
'                 SUM (par_sc_tot_amt) op_bal,',
'                 NULL par_cl_cr,',
'                 SUM (pdd_bal_amt * par_exchange_rate) cl_bal,',
'                 NULL,',
'                 NULL',
'            FROM pending_payables_vw_hist',
'           WHERE     par_bu = :GLOBAL_BU',
'                 AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'                 AND par_dr_cr = ''DR''',
'                 AND (par_suplr_id = :P34131010_PARTY)',
'                 AND (pdd_bal_amt - pdd_in_progress) > 0',
'                 AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'                 AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''',
'                        OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)',
'                      AND :P34131010_DUMMY = 0',
'                      OR :P34131010_DUMMY = 1)',
'							GROUP BY par_suplr_name,',
'                 par_suplr_id )',
'UNION ALL',
'  SELECT 5 seq_no,',
'         par_suplr_name,',
'         par_suplr_id,',
'         ''Net Total'',',
'         NULL,',
'         SUM (op_bal) op_bal,',
'         NULL,',
'         SUM (cl_bal) cl_bal,',
'         NULL,',
'         NULL',
'    FROM (  SELECT par_suplr_name,',
'                   par_suplr_id,',
'                   CASE',
'                      WHEN par_dr_cr = ''CR'' THEN -SUM (par_sc_tot_amt)',
'                      ELSE SUM (par_sc_tot_amt)',
'                   END',
'                      op_bal,',
'                   CASE',
'                      WHEN par_dr_cr = ''CR''',
'                      THEN',
'                         -SUM (pdd_bal_amt * par_exchange_rate)',
'                      ELSE',
'                         SUM (pdd_bal_amt * par_exchange_rate)',
'                   END',
'                      cl_bal',
'              FROM pending_payables_vw_hist',
'             WHERE     par_bu = :GLOBAL_BU',
'                   AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'                   AND (par_suplr_id = :P34131010_PARTY)',
'                   AND (pdd_bal_amt - pdd_in_progress) > 0',
'                   AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'                   AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''',
'                          OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)',
'                        AND :P34131010_DUMMY = 0',
'                        OR :P34131010_DUMMY = 1)',
'          GROUP BY par_suplr_name, par_suplr_id, par_dr_cr)',
'GROUP BY par_suplr_name, par_suplr_id					  ',
'ORDER BY seq_no ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_PARTY'
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
 p_id=>wwv_flow_imp.id(9142163515699074950)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_supplemental_text=>'&P34131010_ALL_PARTY.'
,p_internal_uid=>3660201680155463922
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164393734074958)
,p_db_column_name=>'CL_BAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Closing Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164070525074955)
,p_db_column_name=>'DATE1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Date1'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164126109074956)
,p_db_column_name=>'OP_BAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Opening Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164266390074957)
,p_db_column_name=>'PAR_CR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dr./Cr.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142163979414074954)
,p_db_column_name=>'PAR_DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142163880823074953)
,p_db_column_name=>'PAR_SUPLR_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Party Id'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142163714889074952)
,p_db_column_name=>'PAR_SUPLR_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164410970074959)
,p_db_column_name=>'PDD_DUE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142164529596074960)
,p_db_column_name=>'PDD_DUE_DAYS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9142163635766074951)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9142204731855238276)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5559899'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_DOC_DATE:OP_BAL:PAR_CR:CL_BAL:PDD_DUE_DATE:PDD_DUE_DAYS'
,p_sort_column_1=>'SEQ_NO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DATE1'
,p_sort_direction_2=>'ASC'
,p_break_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
,p_break_enabled_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(6018624188226937235)
,p_report_id=>wwv_flow_imp.id(9142204731855238276)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'PAR_DOC_DATE'
,p_operator=>'like'
,p_expr=>'%Net Total%'
,p_condition_sql=>' (case when ("PAR_DOC_DATE" like #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''%Net Total%''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#366a30ed'
,p_row_font_color=>'#eeeded'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(6018624585010937235)
,p_report_id=>wwv_flow_imp.id(9142204731855238276)
,p_static_id=>'ir-condition-2'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'PAR_DOC_DATE'
,p_operator=>'like'
,p_expr=>'Sub Total'
,p_condition_sql=>' (case when ("PAR_DOC_DATE" like #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Sub Total''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#cce5ff'
,p_row_font_color=>'#000000'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9083270011453165665)
,p_plug_name=>'Pending Payable - Advance'
,p_static_id=>'pending-payable-advance'
,p_region_name=>'PA'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 6/15/2022 1:07:16 PM (QP5 v5.163.1008.3004) */',
'SELECT aprh_bu,',
'       aprh_plnt,',
'       aprh_plnt_loc_id,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = :Global_bu AND bup_plant_id = aprh_plnt)',
'          unit_desc,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = aprh_bu AND bupld_loc_id = aprh_plnt_loc_id)plnt_loc_desc,   ',
'       DECODE (aprh_rqst_type,',
'               ''PO'', ''Purchase Order'',',
'               ''PI'', ''Proforma Invoice'',',
'               ''N'', ''N/A'')',
'          aprh_rqst_type,',
'       CASE',
'          WHEN aprh_po_pfx IS NOT NULL THEN aprh_po_pfx || ''/'' || aprh_po_no',
'          ELSE aprh_po_no',
'       END',
'          po_no,',
'       aprh_pi_no,',
'       DECODE (aprh_benf_type,',
'               ''S'', ''Supplier'',',
'               ''I'', ''Imprest'',',
'               ''T'', ''Transport'',',
'               ''E'', ''Employee'')',
'          aprh_benf_type,',
'       aprh_suplr_id,',
'       CASE',
'          WHEN aprh_suplr_id IS NOT NULL AND aprh_benf_type NOT IN (''E'')',
'          THEN',
'             (SELECT suplr_name1',
'                FROM suppliers',
'               WHERE     suplr_bu = :Global_bu',
'                     AND aprh_benf_type NOT IN (''E'')',
'                     AND suplr_suplr_id = aprh_suplr_id)',
'          WHEN aprh_suplr_id IS NOT NULL AND aprh_benf_type IN (''E'')',
'          THEN',
'             (SELECT emp_first_name1 emp_name',
'                FROM employees',
'               WHERE emp_bu = :Global_bu AND emp_emp_id = aprh_suplr_id)',
'       END',
'          party_name,',
'       aprh_curr,',
'       aprh_adv_pct,',
'       aprh_rqst_adv_amt,',
'       aprh_inprg_amt,',
'       (aprh_rqst_adv_amt - (aprh_inprg_amt + aprh_pymnt_amt)) bal_amt,',
'       aprh_rqst_by,',
'       (SELECT func_find_employee_desc (:global_bu, appluser_emp_id, 1) name1',
'          FROM appl_users',
'         WHERE     appluser_bu = :global_bu',
'               AND Appluser_emp_id IS NOT NULL',
'               AND appluser_status = ''A''',
'               AND aprh_benf_type NOT IN (''E'')',
'               AND appluser_emp_id = aprh_rqst_by',
'        UNION ALL',
'        SELECT func_find_employee_desc (:global_bu, emp_emp_id, 1) name1',
'          FROM employees, emp_active_infos',
'         WHERE     emp_bu = empai_bu',
'               AND emp_emp_id = empai_emp_id',
'               AND emp_bu = :global_bu',
'               AND emp_status = ''A''',
'               AND aprh_benf_type IN (''E'')',
'               AND emp_emp_id = aprh_rqst_by)',
'          rqst_by_desc,',
'       TO_CHAR(aprh_doc_date,:GLOBAL_RPT_DATE_MASK)aprh_doc_date,',
'       aprh_doc_no,',
'       aprh_po_amt,',
'       aprh_ref_doc_no,',
'       (SELECT glp_prj_name prj_name1',
'          FROM gl_lvl_prj',
'         WHERE glp_bu = :global_bu AND glp_prj_id = aprh_proj_id)',
'          project_lvl,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE     dept_bu = :GLOBAL_bu',
'               AND dept_plnt = aprh_plnt',
'               AND dept_id = aprh_rqst_dept)',
'          dept_rqst,',
'       aprh_narr,   ',
'       aprh_pymnt_amt,',
'       aprh_ex_rate,',
'       aprh_po_pfx,',
'       aprh_po_no,',
'       aprh_pay_by_date,',
'       aprh_rqst_dept,',
'       aprh_status,',
'       aprh_vou_type,',
'       aprh_vou_pfx,',
'       aprh_vou_no,',
'       aprh_sel_flg,',
'       aprh_cancel_reason,',
'       aprh_cancel_date,',
'       aprh_bal_amt,',
'       aprh_disallow_adv_flag,',
'       aprh_vou_status,',
'       aprh_vou_seq_no,',
'       aprh_vou_sub_seq_no,',
'       aprh_pay_adv_flag,',
'       aprh_lc_grn_pfx,',
'       aprh_lc_grn_no,',
'       aprh_due_seq_no,',
'       aprh_pay_amt,',
'       aprh_loc_id,',
'       aprh_due_date,',
'       aprh_acct_code,',
'       aprh_sys_flag,',
'       aprh_po_inprg_amt,',
'       aprh_close_amt,',
'       aprh_proj_id',
'  FROM adv_pay_rqst_hd',
' WHERE aprh_bu = :Global_bu  ',
'  AND (   (    (SELECT glmctrl_cv_usage_flag',
'                       FROM glm_control',
'                      WHERE glmctrl_bu = aprh_bu) IN (''Y'')',
'                AND aprh_benf_type <> ''I''',
'                AND (aprh_rqst_adv_amt',
'                     - (aprh_pymnt_amt + NVL (aprh_inprg_amt, 0))) <> 0)',
'            OR ( (SELECT glmctrl_cv_usage_flag',
'                    FROM glm_control',
'                   WHERE glmctrl_bu = aprh_bu) IN (''N'')',
'                AND (aprh_rqst_adv_amt',
'                     - (aprh_pymnt_amt + NVL (aprh_inprg_amt, 0))) <> 0)',
'            OR (    (SELECT glmctrl_cv_usage_flag',
'                       FROM glm_control',
'                      WHERE glmctrl_bu = aprh_bu) = ''Y''',
'                AND aprh_benf_type = ''I''',
'                AND aprh_vou_pfx IS NULL',
'                AND aprh_vou_no IS NULL))',
'       AND aprh_status = ''A''',
'       AND INSTR (:P34131010_UNIT || '':'', aprh_plnt || '':'') > 0',
'       AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', aprh_plnt || '':'') > 0)AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_REPORT_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Payable - Advance'
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
 p_id=>wwv_flow_imp.id(9083270103051165666)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3601308267507554638
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336942159359567)
,p_db_column_name=>'APRH_ACCT_CODE'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Aprh Acct Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271323350165678)
,p_db_column_name=>'APRH_ADV_PCT'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Pct.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335760971359555)
,p_db_column_name=>'APRH_BAL_AMT'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Aprh Bal Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270985521165674)
,p_db_column_name=>'APRH_BENF_TYPE'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270275443165667)
,p_db_column_name=>'APRH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Aprh Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335679442359554)
,p_db_column_name=>'APRH_CANCEL_DATE'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Aprh Cancel Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335591400359553)
,p_db_column_name=>'APRH_CANCEL_REASON'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Aprh Cancel Reason'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337263347359570)
,p_db_column_name=>'APRH_CLOSE_AMT'
,p_display_order=>550
,p_column_identifier=>'BB'
,p_column_label=>'Aprh Close Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271244136165677)
,p_db_column_name=>'APRH_CURR'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Curr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335817397359556)
,p_db_column_name=>'APRH_DISALLOW_ADV_FLAG'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Aprh Disallow Adv Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337434799359572)
,p_db_column_name=>'APRH_DOC_DATE'
,p_display_order=>200
,p_column_identifier=>'BD'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083272030786165685)
,p_db_column_name=>'APRH_DOC_NO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336803988359566)
,p_db_column_name=>'APRH_DUE_DATE'
,p_display_order=>510
,p_column_identifier=>'AX'
,p_column_label=>'Aprh Due Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336509967359563)
,p_db_column_name=>'APRH_DUE_SEQ_NO'
,p_display_order=>480
,p_column_identifier=>'AU'
,p_column_label=>'Aprh Due Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334548511359543)
,p_db_column_name=>'APRH_EX_RATE'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_EXCH_RT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271549811165680)
,p_db_column_name=>'APRH_INPRG_AMT'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Inprog. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336429513359562)
,p_db_column_name=>'APRH_LC_GRN_NO'
,p_display_order=>470
,p_column_identifier=>'AT'
,p_column_label=>'Aprh Lc Grn No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336330436359561)
,p_db_column_name=>'APRH_LC_GRN_PFX'
,p_display_order=>460
,p_column_identifier=>'AS'
,p_column_label=>'Aprh Lc Grn Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336728776359565)
,p_db_column_name=>'APRH_LOC_ID'
,p_display_order=>500
,p_column_identifier=>'AW'
,p_column_label=>'Aprh Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334304633359541)
,p_db_column_name=>'APRH_NARR'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336222143359560)
,p_db_column_name=>'APRH_PAY_ADV_FLAG'
,p_display_order=>450
,p_column_identifier=>'AR'
,p_column_label=>'Aprh Pay Adv Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336615837359564)
,p_db_column_name=>'APRH_PAY_AMT'
,p_display_order=>490
,p_column_identifier=>'AV'
,p_column_label=>'Aprh Pay Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334856764359546)
,p_db_column_name=>'APRH_PAY_BY_DATE'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Aprh Pay By Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270884659165673)
,p_db_column_name=>'APRH_PI_NO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'PI No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270350567165668)
,p_db_column_name=>'APRH_PLNT'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT_DESC#">#APRH_PLNT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270434927165669)
,p_db_column_name=>'APRH_PLNT_LOC_ID'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Aprh Plnt Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083272146609165686)
,p_db_column_name=>'APRH_PO_AMT'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'PO Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337161653359569)
,p_db_column_name=>'APRH_PO_INPRG_AMT'
,p_display_order=>540
,p_column_identifier=>'BA'
,p_column_label=>'Aprh Po Inprg Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334711141359545)
,p_db_column_name=>'APRH_PO_NO'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Aprh Po No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334609256359544)
,p_db_column_name=>'APRH_PO_PFX'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Aprh Po Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337376015359571)
,p_db_column_name=>'APRH_PROJ_ID'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'Aprh Proj Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334459261359542)
,p_db_column_name=>'APRH_PYMNT_AMT'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Paid Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334029150359538)
,p_db_column_name=>'APRH_REF_DOC_NO'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Ref. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271494330165679)
,p_db_column_name=>'APRH_RQST_ADV_AMT'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Adv. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271792387165682)
,p_db_column_name=>'APRH_RQST_BY'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Requested By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334960392359547)
,p_db_column_name=>'APRH_RQST_DEPT'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Aprh Rqst Dept'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270695739165671)
,p_db_column_name=>'APRH_RQST_TYPE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Adv. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335438508359552)
,p_db_column_name=>'APRH_SEL_FLG'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Aprh Sel Flg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335016749359548)
,p_db_column_name=>'APRH_STATUS'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Aprh Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271003066165675)
,p_db_column_name=>'APRH_SUPLR_ID'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Party Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337043208359568)
,p_db_column_name=>'APRH_SYS_FLAG'
,p_display_order=>530
,p_column_identifier=>'AZ'
,p_column_label=>'Aprh Sys Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335360410359551)
,p_db_column_name=>'APRH_VOU_NO'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Aprh Vou No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335283072359550)
,p_db_column_name=>'APRH_VOU_PFX'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Aprh Vou Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336031720359558)
,p_db_column_name=>'APRH_VOU_SEQ_NO'
,p_display_order=>430
,p_column_identifier=>'AP'
,p_column_label=>'Aprh Vou Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335955774359557)
,p_db_column_name=>'APRH_VOU_STATUS'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Aprh Vou Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083336122598359559)
,p_db_column_name=>'APRH_VOU_SUB_SEQ_NO'
,p_display_order=>440
,p_column_identifier=>'AQ'
,p_column_label=>'Aprh Vou Sub Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083335165734359549)
,p_db_column_name=>'APRH_VOU_TYPE'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Aprh Vou Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271627592165681)
,p_db_column_name=>'BAL_AMT'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334271400359540)
,p_db_column_name=>'DEPT_RQST'
,p_display_order=>250
,p_column_identifier=>'X'
,p_column_label=>'Requested Dept.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271187735165676)
,p_db_column_name=>'PARTY_NAME'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083337512353359573)
,p_db_column_name=>'PLNT_LOC_DESC'
,p_display_order=>20
,p_column_identifier=>'BE'
,p_column_label=>'Unit Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270739818165672)
,p_db_column_name=>'PO_NO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'PO No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083334127793359539)
,p_db_column_name=>'PROJECT_LVL'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Project Lvl.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083271814937165683)
,p_db_column_name=>'RQST_BY_DESC'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Requested Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9083270591988165670)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Unit Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9083369653478758796)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4971548'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PLNT_LOC_DESC:APRH_PLNT:APRH_RQST_TYPE:PO_NO:APRH_PI_NO:APRH_BENF_TYPE:APRH_SUPLR_ID:PARTY_NAME:APRH_CURR:APRH_ADV_PCT:APRH_RQST_ADV_AMT:APRH_INPRG_AMT:BAL_AMT:APRH_RQST_BY:RQST_BY_DESC:APRH_DOC_NO:APRH_DOC_DATE:APRH_PO_AMT:APRH_REF_DOC_NO:PROJECT_LV'
||'L:DEPT_RQST:APRH_NARR:APRH_PYMNT_AMT:APRH_EX_RATE'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9089754555835919162)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Party Wise'
,p_report_seq=>10
,p_report_alias=>'5035397'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PLNT_LOC_DESC:APRH_PLNT:APRH_RQST_TYPE:PO_NO:APRH_PI_NO:APRH_BENF_TYPE:APRH_SUPLR_ID:PARTY_NAME:APRH_CURR:APRH_ADV_PCT:APRH_RQST_ADV_AMT:APRH_INPRG_AMT:BAL_AMT:APRH_RQST_BY:RQST_BY_DESC:APRH_DOC_NO:APRH_DOC_DATE:APRH_PO_AMT:APRH_REF_DOC_NO:PROJECT_LV'
||'L:DEPT_RQST:APRH_NARR:APRH_PYMNT_AMT:APRH_EX_RATE'
,p_break_on=>'APRH_SUPLR_ID:PARTY_NAME'
,p_break_enabled_on=>'APRH_SUPLR_ID:PARTY_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9081822359610658765)
,p_plug_name=>'Pending Payable - Employees'
,p_static_id=>'pending-payable-employees'
,p_region_name=>'PE'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 6/14/2022 7:42:21 PM (QP5 v5.163.1008.3004) */',
'SELECT ect_bu,',
'       ect_trans_no,',
'       TO_CHAR(ect_trans_date,:Global_rpt_date_mask)ect_trans_date,',
'       ect_year,',
'       ect_period,',
'       ect_emp_id,',
'       (SELECT (DECODE (',
'           (SELECT applctrl_desc_level',
'              FROM appl_control',
'             WHERE applctrl_bu = ect_bu),',
'           1,    LTRIM (RTRIM (emp_first_name1))',
'              || '' ''',
'              || LTRIM (RTRIM (emp_middle_name1))',
'              || '' ''',
'              || LTRIM (RTRIM (emp_last_name1)),',
'           NVL (',
'                 LTRIM (RTRIM (emp_first_name2))',
'              || LTRIM (RTRIM (emp_middle_name2))',
'              || LTRIM (RTRIM (emp_last_name2)),',
'                 LTRIM (RTRIM (emp_first_name1))',
'              || '' ''',
'              || LTRIM (RTRIM (emp_middle_name1))',
'              || '' ''',
'              || LTRIM (RTRIM (emp_last_name1)))))',
'            emp_name',
'          FROM employees',
'         WHERE emp_bu = ect_bu AND emp_emp_id = ect_emp_id)emp_name,',
'       ect_elmnt_id,',
'       (SELECT DECODE ( (SELECT applctrl_desc_level',
'                   FROM appl_control',
'                  WHERE applctrl_bu = ect_bu),',
'               1, pehd_desc1,',
'               NVL (pehd_desc2, pehd_desc1))',
'          AS Description',
'        FROM payroll_elements_hd',
'       WHERE pehd_bu = ect_bu AND pehd_elmnt_id = ect_elmnt_id)element_desc,',
'       ect_mode,',
'       ect_ref1,',
'       ect_ref2,',
'       ect_pay_doc_no,',
'       ect_pyrl_doc_no,',
'       ect_doc_amt,',
'       ect_bal_amt,',
'       (ect_bal_amt - ect_pay_in_prog)bal_amt,',
'       ect_source,',
'       ect_status,',
'       ect_check_flag,',
'       ect_proc_amt,',
'       ect_inprog_amt,',
'       ect_user,',
'       ect_type,',
'       ect_bank_id,',
'       ect_process_batch_no,',
'       DECODE(ect_pay_mode,''I'',''Paid'',''P'',''Payable'')ect_pay_mode,',
'       ect_trans_no_temp,',
'       ect_jrnl_flag,',
'       ect_sou_vou_type,',
'       ect_sou_vou_pfx,',
'       ect_sou_vou_no,',
'       CASE WHEN ect_sou_vou_pfx IS NOT NULL THEN',
'       ect_sou_vou_pfx || ''/'' ||ect_sou_vou_no',
'       ELSE',
'       ect_sou_vou_no',
'       END source_no,',
'       ect_pay_in_prog,',
'       ect_pay_proc,',
'       ect_sou_doc_no',
'  FROM emp_ca_trans',
' WHERE ect_bu=:Global_bu ',
'   AND ect_doc_amt - NVL(ect_proc_amt,0)>0',
'   AND ect_mode IN (''L'') and ect_bal_amt >0',
'   AND ect_status = ''P'' ',
'   --AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'   --AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)',
'ORDER BY ect_trans_date,to_number(ect_trans_no)asc   '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_REPORT_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Payable - Employees'
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
 p_id=>wwv_flow_imp.id(9081822422911658766)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3599860587368047738
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082476352846062263)
,p_db_column_name=>'BAL_AMT'
,p_display_order=>360
,p_column_identifier=>'AT'
,p_column_label=>'Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823824341658780)
,p_db_column_name=>'ECT_BAL_AMT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Ect Bal Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082473870781062238)
,p_db_column_name=>'ECT_BANK_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Ect Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081822537089658767)
,p_db_column_name=>'ECT_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ect Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081824115457658783)
,p_db_column_name=>'ECT_CHECK_FLAG'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Ect Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823733338658779)
,p_db_column_name=>'ECT_DOC_AMT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Doc. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823191905658773)
,p_db_column_name=>'ECT_ELMNT_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Element'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823032319658772)
,p_db_column_name=>'ECT_EMP_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081824322044658785)
,p_db_column_name=>'ECT_INPROG_AMT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Pay'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474242244062242)
,p_db_column_name=>'ECT_JRNL_FLAG'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Ect Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823204182658774)
,p_db_column_name=>'ECT_MODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ect Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823530407658777)
,p_db_column_name=>'ECT_PAY_DOC_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Ect Pay Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474665703062246)
,p_db_column_name=>'ECT_PAY_IN_PROG'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Ect Pay In Prog'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474099593062240)
,p_db_column_name=>'ECT_PAY_MODE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Pay Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474739207062247)
,p_db_column_name=>'ECT_PAY_PROC'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Ect Pay Proc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081822918538658771)
,p_db_column_name=>'ECT_PERIOD'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ect Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082473990986062239)
,p_db_column_name=>'ECT_PROCESS_BATCH_NO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Ect Process Batch No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081824203791658784)
,p_db_column_name=>'ECT_PROC_AMT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Ect Proc Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823692571658778)
,p_db_column_name=>'ECT_PYRL_DOC_NO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Ect Pyrl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823384319658775)
,p_db_column_name=>'ECT_REF1'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Naration 1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823479491658776)
,p_db_column_name=>'ECT_REF2'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Naration 2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081823980369658781)
,p_db_column_name=>'ECT_SOURCE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Ect Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474868760062248)
,p_db_column_name=>'ECT_SOU_DOC_NO'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Ect Sou Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474574741062245)
,p_db_column_name=>'ECT_SOU_VOU_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Ect Sou Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474444959062244)
,p_db_column_name=>'ECT_SOU_VOU_PFX'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Ect Sou Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474353322062243)
,p_db_column_name=>'ECT_SOU_VOU_TYPE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081824084145658782)
,p_db_column_name=>'ECT_STATUS'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Ect Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082476063451062260)
,p_db_column_name=>'ECT_TRANS_DATE'
,p_display_order=>330
,p_column_identifier=>'AQ'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081822684204658768)
,p_db_column_name=>'ECT_TRANS_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Trans No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082474134568062241)
,p_db_column_name=>'ECT_TRANS_NO_TEMP'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Ect Trans No Temp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082473773508062237)
,p_db_column_name=>'ECT_TYPE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Ect Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081824458062658786)
,p_db_column_name=>'ECT_USER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Ect User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081822843363658770)
,p_db_column_name=>'ECT_YEAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Ect Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082476214532062262)
,p_db_column_name=>'ELEMENT_DESC'
,p_display_order=>350
,p_column_identifier=>'AS'
,p_column_label=>'Element Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082476169784062261)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>340
,p_column_identifier=>'AR'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9082476419608062264)
,p_db_column_name=>'SOURCE_NO'
,p_display_order=>370
,p_column_identifier=>'AU'
,p_column_label=>'Source No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9082501294986081095)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4962864'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ECT_TRANS_NO:ECT_TRANS_DATE:ECT_EMP_ID:EMP_NAME:ECT_ELMNT_ID:ELEMENT_DESC:ECT_DOC_AMT:BAL_AMT:ECT_INPROG_AMT:ECT_PAY_MODE:ECT_SOU_VOU_TYPE:SOURCE_NO:ECT_REF1:ECT_REF2'
,p_break_on=>'ECT_EMP_ID:EMP_NAME'
,p_break_enabled_on=>'ECT_EMP_ID:EMP_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9081413658833943261)
,p_plug_name=>'Pending Payable - Payroll'
,p_static_id=>'pending-payable-payroll'
,p_region_name=>'PR'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 6/14/2022 6:43:32 PM (QP5 v5.163.1008.3004) */',
'SELECT phhd_bu,',
'       phhd_plnt,',
'		 (SELECT bupld_loc_name',
'            FROM bus_unit_plants_loc_dtls',
'           WHERE bupld_bu = :Global_bu',
'            AND  bupld_loc_id = phhd_plnt) plnt_loc_desc,',
'       plnt_desc,',
'       phhd_pyrl_no,',
'       DECODE(phhd_pyrl_type,''N'',''Normal'',''V'',''Vacation'',''T'',''Full and Final Settlement'',''A'',''Other Allowance'',''B'',''Bonus'',''O'',''Overtime'',''E'',''Leave Encashment'',''R'',''Arrear'')phhd_pyrl_type,',
'       phhd_clndr_id,',
'       phhd_year,',
'       phhd_period,',
'       phhd_emp_id,',
'       phhd_dept_id,',
'       dept_desc,',
'       phhd_job_id,',
'       job_desc,',
'       phhd_pos_id,',
'       pos_desc,',
'       phhd_grade_id,',
'       grade_desc,',
'       phhd_loc_id,',
'       loc_desc,',
'       phhd_posted,',
'       phhd_emp_name,',
'       phhd_status,',
'       phhd_voucher_no,',
'       phhd_paid_date,',
'       phhd_net_payable,',
'       phhd_pay_in_progress,',
'       phhd_paid_amt,',
'       phhd_inprog_amt,',
'       NVL(phhd_net_payable,0) - NVL(phhd_paid_amt,0) - NVL(phhd_pay_in_progress,0) bal_amt,',
'       phhd_check_flag,',
'       phhd_user,',
'       phhd_type,',
'       phhd_bank_id,',
'       phhd_hold_flag,',
'       phhd_hold_by,',
'       phhd_hold_date,',
'       phhd_hold_reas,',
'       phhd_unhold_by,',
'       phhd_unhold_reas,',
'       phhd_unhold_date,',
'       phhd_cre_by,',
'       phhd_cre_date,',
'       phhd_upd_by,',
'       phhd_upd_date,',
'       phhd_process_batch_no,',
'       phhd_emp_group,',
'       phhd_acct_cat_id,',
'       phhd_actual_net,',
'       phhd_net_afr_round,',
'       phhd_net_bfr_round,',
'       phhd_emp_plnt,',
'       phhd_mon_days,',
'       phhd_workin_days,',
'       phhd_holidays,',
'       phhd_off,',
'       phhd_workoff_holiday,',
'       phhd_tot_paid_days,',
'       phhd_process_date,',
'       phhd_late_hrs,',
'       phhd_bustrip_days,',
'       phhd_paid_leave_days,',
'       phhd_unpaid_leave_days,',
'       emp_bu,',
'       emp_emp_id,',
'       emp_first_name1,',
'       emp_middle_name1,',
'       emp_last_name1,',
'       emp_first_name2,',
'       emp_middle_name2,',
'       emp_last_name2,',
'       emp_start_date,',
'       emp_gender,',
'       emp_marital_status,',
'       emp_dob,',
'       emp_last_proc_year,',
'       emp_last_proc_period,',
'       emp_religion,',
'       emp_nlity,',
'       emp_current_acct,',
'       emp_recruit_appl_no,',
'       emp_pay_mode,',
'       emp_bank_name,',
'       emp_bank_acct_no,',
'       emp_date_from,',
'       emp_date_to,',
'       emp_type,',
'       emp_subcntr_id,',
'       emp_prob_flag,',
'       emp_prob_end_date,',
'       emp_include_payroll,',
'       emp_notice_period,',
'       emp_status,',
'       emp_prob_start_date,',
'       emp_next_increment_due,',
'       emp_sales_area,',
'       emp_sales_area_terr,',
'       emp_prev_exp_years,',
'       emp_prev_exp_months,',
'       emp_dom,',
'       emp_bank_id,',
'       txt_bank_desc,',
'       emp_sal_wage,',
'       emp_next_appraisal_due,',
'       emp_appraisal_type,',
'       emp_appraisal_method,',
'       emp_email_id,',
'       emp_phone_id,',
'       emp_cat_id,',
'       emp_group_id,',
'       emp_pay_basis,',
'       emp_section_no,',
'       emp_bulding_no,',
'       emp_room_no,',
'       emp_mobile_no,',
'       emp_fax_no,',
'       emp_extension_no,',
'       emp_iqama_no,',
'       emp_bcn_no,',
'       emp_proj_no,',
'       emp_contr_no,',
'       emp_iqama_prof_id,',
'       emp_prob_freq_id,',
'       emp_cont_status,',
'       emp_merit_incr_status,',
'       emp_prob_period_status,',
'       emp_prob_dure,',
'       emp_retirement_age,',
'       emp_bank_branch,',
'       emp_last_serv_year_period,',
'       emp_last_serv_year_year,',
'       emp_indem_elmnt,',
'       emp_cre_by,',
'       emp_cre_date,',
'       emp_upd_by,',
'       emp_upd_date,',
'       emp_plant,',
'       emp_id_card_no,',
'       emp_pf_start_date,',
'       emp_pf_no,',
'       emp_pf_dol,',
'       emp_insur_no,',
'       emp_esi_disp_id,',
'       emp_esi_zone_id,',
'       emp_esi_start_date,',
'       emp_grd_no,',
'       emp_grd_date,',
'       emp_sup_inv_no,',
'       emp_sup_inv_date,',
'       emp_encash_elmnt_id,',
'       emp_incre_cal_date,',
'       emp_appr_tri_start_date,',
'       emp_appr_tri_end_date,',
'       emp_appr_tri_con_date,',
'       emp_incre_fin_date,',
'       emp_appr_freq_id,',
'       emp_appr_tri_dur,',
'       emp_blood_group,',
'       emp_mother_name,',
'       emp_spouse_name,',
'       emp_pf_leav_res,',
'       emp_esi_dol,',
'       emp_esi_leav_res,',
'       emp_caste_id,',
'       emp_community,',
'       emp_pay_from_bank_acct,',
'       emp_pay_from_bank_acct_desc,',
'       emp_father_name,',
'       emp_pf_nominee,',
'       emp_esi_elgbl_flag,',
'       emp_pf_elgbl_flag,',
'       emp_it_elgbl_flag,',
'       emp_esi_nominee,',
'       emp_it_pan_no,',
'       emp_end_date,',
'       emp_pf_mem_rel,',
'       emp_acct_cat_id,',
'       emp_med_elig_flag,',
'       emp_gratuity_elig_flag,',
'       emp_div_id,',
'       emp_off_mobile_no,',
'       emp_off_email_id,',
'       emp_iqama_issued_at,',
'       emp_lic_id_no,',
'       emp_iqama_issue_date,',
'       emp_uan_no,',
'       emp_iqama_exp_date,',
'       emp_chk_flag,',
'       emp_wfm_emp_type,',
'       emp_wfm_prj_job_title,',
'       emp_wfm_prof_type,',
'       emp_aadhar_no,',
'       emp_edli_no,',
'       emp_ggi_no,',
'       emp_pay_to_bank_acct,',
'       emp_pay_to_bank_acct_desc',
'  FROM payroll_hist_view',
' WHERE phhd_bu = :global_bu and',
'   (phhd_net_payable',
'       - NVL (phhd_paid_amt, 0)',
'       - NVL (phhd_pay_in_progress, 0)) > 0',
'  AND INSTR (:P34131010_UNIT || '':'', phhd_plnt || '':'') > 0',
'  AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', phhd_plnt || '':'') > 0)AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)     '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_REPORT_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Payable - Payroll'
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
 p_id=>wwv_flow_imp.id(9081413756005943262)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3599451920462332234
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821944181658761)
,p_db_column_name=>'BAL_AMT'
,p_display_order=>1990
,p_column_identifier=>'GQ'
,p_column_label=>'Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414896207943273)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821449540658756)
,p_db_column_name=>'EMP_AADHAR_NO'
,p_display_order=>1940
,p_column_identifier=>'GL'
,p_column_label=>'Emp Aadhar No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819536933658737)
,p_db_column_name=>'EMP_ACCT_CAT_ID'
,p_display_order=>1750
,p_column_identifier=>'FS'
,p_column_label=>'Emp Acct Cat Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812471665658666)
,p_db_column_name=>'EMP_APPRAISAL_METHOD'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Emp Appraisal Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812339127658665)
,p_db_column_name=>'EMP_APPRAISAL_TYPE'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'Emp Appraisal Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817415566658766)
,p_db_column_name=>'EMP_APPR_FREQ_ID'
,p_display_order=>1540
,p_column_identifier=>'EX'
,p_column_label=>'Emp Appr Freq Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817230081658764)
,p_db_column_name=>'EMP_APPR_TRI_CON_DATE'
,p_display_order=>1520
,p_column_identifier=>'EV'
,p_column_label=>'Emp Appr Tri Con Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817515760658767)
,p_db_column_name=>'EMP_APPR_TRI_DUR'
,p_display_order=>1550
,p_column_identifier=>'EY'
,p_column_label=>'Emp Appr Tri Dur'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817195470658763)
,p_db_column_name=>'EMP_APPR_TRI_END_DATE'
,p_display_order=>1510
,p_column_identifier=>'EU'
,p_column_label=>'Emp Appr Tri End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817089994658762)
,p_db_column_name=>'EMP_APPR_TRI_START_DATE'
,p_display_order=>1500
,p_column_identifier=>'ET'
,p_column_label=>'Emp Appr Tri Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810205631658644)
,p_db_column_name=>'EMP_BANK_ACCT_NO'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Emp Bank Acct No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814791090658739)
,p_db_column_name=>'EMP_BANK_BRANCH'
,p_display_order=>1270
,p_column_identifier=>'DW'
,p_column_label=>'Emp Bank Branch'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811997004658661)
,p_db_column_name=>'EMP_BANK_ID'
,p_display_order=>990
,p_column_identifier=>'CU'
,p_column_label=>'Emp Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810124734658643)
,p_db_column_name=>'EMP_BANK_NAME'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Emp Bank Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813725969658679)
,p_db_column_name=>'EMP_BCN_NO'
,p_display_order=>1170
,p_column_identifier=>'DM'
,p_column_label=>'Emp Bcn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817643564658768)
,p_db_column_name=>'EMP_BLOOD_GROUP'
,p_display_order=>1560
,p_column_identifier=>'EZ'
,p_column_label=>'Emp Blood Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808281130658674)
,p_db_column_name=>'EMP_BU'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813167667658673)
,p_db_column_name=>'EMP_BULDING_NO'
,p_display_order=>1110
,p_column_identifier=>'DG'
,p_column_label=>'Emp Bulding No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818222415658774)
,p_db_column_name=>'EMP_CASTE_ID'
,p_display_order=>1620
,p_column_identifier=>'FF'
,p_column_label=>'Emp Caste Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812777398658669)
,p_db_column_name=>'EMP_CAT_ID'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Emp Cat Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821102809658752)
,p_db_column_name=>'EMP_CHK_FLAG'
,p_display_order=>1900
,p_column_identifier=>'GH'
,p_column_label=>'Emp Chk Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818304951658775)
,p_db_column_name=>'EMP_COMMUNITY'
,p_display_order=>1630
,p_column_identifier=>'FG'
,p_column_label=>'Emp Community'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813922194658681)
,p_db_column_name=>'EMP_CONTR_NO'
,p_display_order=>1190
,p_column_identifier=>'DO'
,p_column_label=>'Current Contract'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814207300658684)
,p_db_column_name=>'EMP_CONT_STATUS'
,p_display_order=>1220
,p_column_identifier=>'DR'
,p_column_label=>'Emp Cont Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815177444658743)
,p_db_column_name=>'EMP_CRE_BY'
,p_display_order=>1310
,p_column_identifier=>'EA'
,p_column_label=>'Emp Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815229961658744)
,p_db_column_name=>'EMP_CRE_DATE'
,p_display_order=>1320
,p_column_identifier=>'EB'
,p_column_label=>'Emp Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809825765658640)
,p_db_column_name=>'EMP_CURRENT_ACCT'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Emp Current Acct'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810395405658645)
,p_db_column_name=>'EMP_DATE_FROM'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Emp Date From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810434243658646)
,p_db_column_name=>'EMP_DATE_TO'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Emp Date To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819816496658740)
,p_db_column_name=>'EMP_DIV_ID'
,p_display_order=>1780
,p_column_identifier=>'FV'
,p_column_label=>'Emp Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809336699658685)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Emp Dob'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811846038658660)
,p_db_column_name=>'EMP_DOM'
,p_display_order=>980
,p_column_identifier=>'CT'
,p_column_label=>'Emp Dom'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821530332658757)
,p_db_column_name=>'EMP_EDLI_NO'
,p_display_order=>1950
,p_column_identifier=>'GM'
,p_column_label=>'Emp Edli No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812578990658667)
,p_db_column_name=>'EMP_EMAIL_ID'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Emp Email Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808328088658675)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Emp Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816823417658760)
,p_db_column_name=>'EMP_ENCASH_ELMNT_ID'
,p_display_order=>1480
,p_column_identifier=>'ER'
,p_column_label=>'Emp Encash Elmnt Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819356164658785)
,p_db_column_name=>'EMP_END_DATE'
,p_display_order=>1730
,p_column_identifier=>'FQ'
,p_column_label=>'Emp End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816107860658753)
,p_db_column_name=>'EMP_ESI_DISP_ID'
,p_display_order=>1410
,p_column_identifier=>'EK'
,p_column_label=>'Emp Esi Disp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818042559658772)
,p_db_column_name=>'EMP_ESI_DOL'
,p_display_order=>1600
,p_column_identifier=>'FD'
,p_column_label=>'Emp Esi Dol'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818866385658780)
,p_db_column_name=>'EMP_ESI_ELGBL_FLAG'
,p_display_order=>1680
,p_column_identifier=>'FL'
,p_column_label=>'Emp Esi Elgbl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818112588658773)
,p_db_column_name=>'EMP_ESI_LEAV_RES'
,p_display_order=>1610
,p_column_identifier=>'FE'
,p_column_label=>'Emp Esi Leav Res'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819150571658783)
,p_db_column_name=>'EMP_ESI_NOMINEE'
,p_display_order=>1710
,p_column_identifier=>'FO'
,p_column_label=>'Emp Esi Nominee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816384812658755)
,p_db_column_name=>'EMP_ESI_START_DATE'
,p_display_order=>1430
,p_column_identifier=>'EM'
,p_column_label=>'Emp Esi Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816242175658754)
,p_db_column_name=>'EMP_ESI_ZONE_ID'
,p_display_order=>1420
,p_column_identifier=>'EL'
,p_column_label=>'Emp Esi Zone Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813524751658677)
,p_db_column_name=>'EMP_EXTENSION_NO'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Emp Extension No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818647653658778)
,p_db_column_name=>'EMP_FATHER_NAME'
,p_display_order=>1660
,p_column_identifier=>'FJ'
,p_column_label=>'Emp Father Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813417869658676)
,p_db_column_name=>'EMP_FAX_NO'
,p_display_order=>1140
,p_column_identifier=>'DJ'
,p_column_label=>'Emp Fax No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808447354658676)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Emp First Name1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808788809658679)
,p_db_column_name=>'EMP_FIRST_NAME2'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Emp First Name2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809193415658683)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Emp Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821662909658758)
,p_db_column_name=>'EMP_GGI_NO'
,p_display_order=>1960
,p_column_identifier=>'GN'
,p_column_label=>'Emp Ggi No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819733713658739)
,p_db_column_name=>'EMP_GRATUITY_ELIG_FLAG'
,p_display_order=>1770
,p_column_identifier=>'FU'
,p_column_label=>'Emp Gratuity Elig Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816571544658757)
,p_db_column_name=>'EMP_GRD_DATE'
,p_display_order=>1450
,p_column_identifier=>'EO'
,p_column_label=>'Emp Grd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816459155658756)
,p_db_column_name=>'EMP_GRD_NO'
,p_display_order=>1440
,p_column_identifier=>'EN'
,p_column_label=>'Emp Grd No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812868298658670)
,p_db_column_name=>'EMP_GROUP_ID'
,p_display_order=>1080
,p_column_identifier=>'DD'
,p_column_label=>'Emp Group Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815688650658748)
,p_db_column_name=>'EMP_ID_CARD_NO'
,p_display_order=>1360
,p_column_identifier=>'EF'
,p_column_label=>'Emp Id Card No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810952086658651)
,p_db_column_name=>'EMP_INCLUDE_PAYROLL'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Emp Include Payroll'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816985004658761)
,p_db_column_name=>'EMP_INCRE_CAL_DATE'
,p_display_order=>1490
,p_column_identifier=>'ES'
,p_column_label=>'Emp Incre Cal Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817360118658765)
,p_db_column_name=>'EMP_INCRE_FIN_DATE'
,p_display_order=>1530
,p_column_identifier=>'EW'
,p_column_label=>'Emp Incre Fin Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815021761658742)
,p_db_column_name=>'EMP_INDEM_ELMNT'
,p_display_order=>1300
,p_column_identifier=>'DZ'
,p_column_label=>'Emp Indem Elmnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816021500658752)
,p_db_column_name=>'EMP_INSUR_NO'
,p_display_order=>1400
,p_column_identifier=>'EJ'
,p_column_label=>'Emp Insur No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820941458658751)
,p_db_column_name=>'EMP_IQAMA_EXP_DATE'
,p_display_order=>1890
,p_column_identifier=>'GG'
,p_column_label=>'Emp Iqama Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820114899658743)
,p_db_column_name=>'EMP_IQAMA_ISSUED_AT'
,p_display_order=>1810
,p_column_identifier=>'FY'
,p_column_label=>'Emp Iqama Issued At'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820783289658749)
,p_db_column_name=>'EMP_IQAMA_ISSUE_DATE'
,p_display_order=>1870
,p_column_identifier=>'GE'
,p_column_label=>'Emp Iqama Issue Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813674864658678)
,p_db_column_name=>'EMP_IQAMA_NO'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Emp Iqama No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814084069658682)
,p_db_column_name=>'EMP_IQAMA_PROF_ID'
,p_display_order=>1200
,p_column_identifier=>'DP'
,p_column_label=>'Emp Iqama Prof Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819092335658782)
,p_db_column_name=>'EMP_IT_ELGBL_FLAG'
,p_display_order=>1700
,p_column_identifier=>'FN'
,p_column_label=>'Emp It Elgbl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819203860658784)
,p_db_column_name=>'EMP_IT_PAN_NO'
,p_display_order=>1720
,p_column_identifier=>'FP'
,p_column_label=>'Emp It Pan No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808607165658678)
,p_db_column_name=>'EMP_LAST_NAME1'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Emp Last Name1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808915074658681)
,p_db_column_name=>'EMP_LAST_NAME2'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Emp Last Name2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809533361658637)
,p_db_column_name=>'EMP_LAST_PROC_PERIOD'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Emp Last Proc Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809428116658686)
,p_db_column_name=>'EMP_LAST_PROC_YEAR'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Emp Last Proc Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814895072658740)
,p_db_column_name=>'EMP_LAST_SERV_YEAR_PERIOD'
,p_display_order=>1280
,p_column_identifier=>'DX'
,p_column_label=>'Emp Last Serv Year Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814948319658741)
,p_db_column_name=>'EMP_LAST_SERV_YEAR_YEAR'
,p_display_order=>1290
,p_column_identifier=>'DY'
,p_column_label=>'Emp Last Serv Year Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820487573658746)
,p_db_column_name=>'EMP_LIC_ID_NO'
,p_display_order=>1840
,p_column_identifier=>'GB'
,p_column_label=>'Emp Lic Id No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809235052658684)
,p_db_column_name=>'EMP_MARITAL_STATUS'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Emp Marital Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819639355658738)
,p_db_column_name=>'EMP_MED_ELIG_FLAG'
,p_display_order=>1760
,p_column_identifier=>'FT'
,p_column_label=>'Emp Med Elig Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814320970658685)
,p_db_column_name=>'EMP_MERIT_INCR_STATUS'
,p_display_order=>1230
,p_column_identifier=>'DS'
,p_column_label=>'Emp Merit Incr Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808503494658677)
,p_db_column_name=>'EMP_MIDDLE_NAME1'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Emp Middle Name1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808851827658680)
,p_db_column_name=>'EMP_MIDDLE_NAME2'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Emp Middle Name2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813319344658675)
,p_db_column_name=>'EMP_MOBILE_NO'
,p_display_order=>1130
,p_column_identifier=>'DI'
,p_column_label=>'Emp Mobile No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817788525658769)
,p_db_column_name=>'EMP_MOTHER_NAME'
,p_display_order=>1570
,p_column_identifier=>'FA'
,p_column_label=>'Emp Mother Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812203462658664)
,p_db_column_name=>'EMP_NEXT_APPRAISAL_DUE'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Emp Next Appraisal Due'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811371692658655)
,p_db_column_name=>'EMP_NEXT_INCREMENT_DUE'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Emp Next Increment Due'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809715203658639)
,p_db_column_name=>'EMP_NLITY'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Emp Nlity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811021495658652)
,p_db_column_name=>'EMP_NOTICE_PERIOD'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Emp Notice Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820020563658742)
,p_db_column_name=>'EMP_OFF_EMAIL_ID'
,p_display_order=>1800
,p_column_identifier=>'FX'
,p_column_label=>'Emp Off Email Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819990318658741)
,p_db_column_name=>'EMP_OFF_MOBILE_NO'
,p_display_order=>1790
,p_column_identifier=>'FW'
,p_column_label=>'Emp Off Mobile No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812978114658671)
,p_db_column_name=>'EMP_PAY_BASIS'
,p_display_order=>1090
,p_column_identifier=>'DE'
,p_column_label=>'Emp Pay Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818493728658776)
,p_db_column_name=>'EMP_PAY_FROM_BANK_ACCT'
,p_display_order=>1640
,p_column_identifier=>'FH'
,p_column_label=>'Emp Pay From Bank Acct'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818563423658777)
,p_db_column_name=>'EMP_PAY_FROM_BANK_ACCT_DESC'
,p_display_order=>1650
,p_column_identifier=>'FI'
,p_column_label=>'Pay From Bank Acct.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810081364658642)
,p_db_column_name=>'EMP_PAY_MODE'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Emp Pay Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821790407658759)
,p_db_column_name=>'EMP_PAY_TO_BANK_ACCT'
,p_display_order=>1970
,p_column_identifier=>'GO'
,p_column_label=>'Emp Pay To Bank Acct'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821866554658760)
,p_db_column_name=>'EMP_PAY_TO_BANK_ACCT_DESC'
,p_display_order=>1980
,p_column_identifier=>'GP'
,p_column_label=>'Pay To Bank Acct.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815967482658751)
,p_db_column_name=>'EMP_PF_DOL'
,p_display_order=>1390
,p_column_identifier=>'EI'
,p_column_label=>'Emp Pf Dol'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818915866658781)
,p_db_column_name=>'EMP_PF_ELGBL_FLAG'
,p_display_order=>1690
,p_column_identifier=>'FM'
,p_column_label=>'Emp Pf Elgbl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817944406658771)
,p_db_column_name=>'EMP_PF_LEAV_RES'
,p_display_order=>1590
,p_column_identifier=>'FC'
,p_column_label=>'Emp Pf Leav Res'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081819483434658786)
,p_db_column_name=>'EMP_PF_MEM_REL'
,p_display_order=>1740
,p_column_identifier=>'FR'
,p_column_label=>'Emp Pf Mem Rel'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815879283658750)
,p_db_column_name=>'EMP_PF_NO'
,p_display_order=>1380
,p_column_identifier=>'EH'
,p_column_label=>'Emp Pf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081818729780658779)
,p_db_column_name=>'EMP_PF_NOMINEE'
,p_display_order=>1670
,p_column_identifier=>'FK'
,p_column_label=>'Emp Pf Nominee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815705185658749)
,p_db_column_name=>'EMP_PF_START_DATE'
,p_display_order=>1370
,p_column_identifier=>'EG'
,p_column_label=>'Emp Pf Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812651200658668)
,p_db_column_name=>'EMP_PHONE_ID'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Emp Phone Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815598508658747)
,p_db_column_name=>'EMP_PLANT'
,p_display_order=>1350
,p_column_identifier=>'EE'
,p_column_label=>'Emp Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811716863658659)
,p_db_column_name=>'EMP_PREV_EXP_MONTHS'
,p_display_order=>970
,p_column_identifier=>'CS'
,p_column_label=>'Emp Prev Exp Months'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811642426658658)
,p_db_column_name=>'EMP_PREV_EXP_YEARS'
,p_display_order=>960
,p_column_identifier=>'CR'
,p_column_label=>'Emp Prev Exp Years'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814577065658737)
,p_db_column_name=>'EMP_PROB_DURE'
,p_display_order=>1250
,p_column_identifier=>'DU'
,p_column_label=>'Emp Prob Dure'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810848430658650)
,p_db_column_name=>'EMP_PROB_END_DATE'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Emp Prob End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810722584658649)
,p_db_column_name=>'EMP_PROB_FLAG'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Emp Prob Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814119366658683)
,p_db_column_name=>'EMP_PROB_FREQ_ID'
,p_display_order=>1210
,p_column_identifier=>'DQ'
,p_column_label=>'Emp Prob Freq Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814465450658686)
,p_db_column_name=>'EMP_PROB_PERIOD_STATUS'
,p_display_order=>1240
,p_column_identifier=>'DT'
,p_column_label=>'Emp Prob Period Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811219409658654)
,p_db_column_name=>'EMP_PROB_START_DATE'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Emp Prob Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813885485658680)
,p_db_column_name=>'EMP_PROJ_NO'
,p_display_order=>1180
,p_column_identifier=>'DN'
,p_column_label=>'Current Project'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809966362658641)
,p_db_column_name=>'EMP_RECRUIT_APPL_NO'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Emp Recruit Appl No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809674079658638)
,p_db_column_name=>'EMP_RELIGION'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Emp Religion'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081814690760658738)
,p_db_column_name=>'EMP_RETIREMENT_AGE'
,p_display_order=>1260
,p_column_identifier=>'DV'
,p_column_label=>'Emp Retirement Age'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813258801658674)
,p_db_column_name=>'EMP_ROOM_NO'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'Emp Room No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811500131658656)
,p_db_column_name=>'EMP_SALES_AREA'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Emp Sales Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811598836658657)
,p_db_column_name=>'EMP_SALES_AREA_TERR'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Emp Sales Area Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812200008658663)
,p_db_column_name=>'EMP_SAL_WAGE'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Emp Sal Wage'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081813079990658672)
,p_db_column_name=>'EMP_SECTION_NO'
,p_display_order=>1100
,p_column_identifier=>'DF'
,p_column_label=>'Emp Section No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081817895267658770)
,p_db_column_name=>'EMP_SPOUSE_NAME'
,p_display_order=>1580
,p_column_identifier=>'FB'
,p_column_label=>'Emp Spouse Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081809031323658682)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Emp Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081811195639658653)
,p_db_column_name=>'EMP_STATUS'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Emp Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810606145658648)
,p_db_column_name=>'EMP_SUBCNTR_ID'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Emp Subcntr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816801659658759)
,p_db_column_name=>'EMP_SUP_INV_DATE'
,p_display_order=>1470
,p_column_identifier=>'EQ'
,p_column_label=>'Emp Sup Inv Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081816603038658758)
,p_db_column_name=>'EMP_SUP_INV_NO'
,p_display_order=>1460
,p_column_identifier=>'EP'
,p_column_label=>'Emp Sup Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081810512798658647)
,p_db_column_name=>'EMP_TYPE'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Emp Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081820806332658750)
,p_db_column_name=>'EMP_UAN_NO'
,p_display_order=>1880
,p_column_identifier=>'GF'
,p_column_label=>'Emp Uan No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815387855658745)
,p_db_column_name=>'EMP_UPD_BY'
,p_display_order=>1330
,p_column_identifier=>'EC'
,p_column_label=>'Emp Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081815412246658746)
,p_db_column_name=>'EMP_UPD_DATE'
,p_display_order=>1340
,p_column_identifier=>'ED'
,p_column_label=>'Emp Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821114078658753)
,p_db_column_name=>'EMP_WFM_EMP_TYPE'
,p_display_order=>1910
,p_column_identifier=>'GI'
,p_column_label=>'Emp Wfm Emp Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821272294658754)
,p_db_column_name=>'EMP_WFM_PRJ_JOB_TITLE'
,p_display_order=>1920
,p_column_identifier=>'GJ'
,p_column_label=>'Emp Wfm Prj Job Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081821366058658755)
,p_db_column_name=>'EMP_WFM_PROF_TYPE'
,p_display_order=>1930
,p_column_identifier=>'GK'
,p_column_label=>'Emp Wfm Prof Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415481102943279)
,p_db_column_name=>'GRADE_DESC'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415054479943275)
,p_db_column_name=>'JOB_DESC'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Job'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415677461943281)
,p_db_column_name=>'LOC_DESC'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806644331658658)
,p_db_column_name=>'PHHD_ACCT_CAT_ID'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Phhd Acct Cat Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806761500658659)
,p_db_column_name=>'PHHD_ACTUAL_NET'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Phhd Actual Net'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805228691658644)
,p_db_column_name=>'PHHD_BANK_ID'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Phhd Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413856797943263)
,p_db_column_name=>'PHHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Phhd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807988864658671)
,p_db_column_name=>'PHHD_BUSTRIP_DAYS'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Phhd Bustrip Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081804949573658641)
,p_db_column_name=>'PHHD_CHECK_FLAG'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Phhd Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414358279943268)
,p_db_column_name=>'PHHD_CLNDR_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Phhd Clndr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806062369658652)
,p_db_column_name=>'PHHD_CRE_BY'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Phhd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806151759658653)
,p_db_column_name=>'PHHD_CRE_DATE'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Phhd Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414733928943272)
,p_db_column_name=>'PHHD_DEPT_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Phhd Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806532019658657)
,p_db_column_name=>'PHHD_EMP_GROUP'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Phhd Emp Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414614047943271)
,p_db_column_name=>'PHHD_EMP_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415823545943283)
,p_db_column_name=>'PHHD_EMP_NAME'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807069549658662)
,p_db_column_name=>'PHHD_EMP_PLNT'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Phhd Emp Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415324133943278)
,p_db_column_name=>'PHHD_GRADE_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Phhd Grade Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805474772658646)
,p_db_column_name=>'PHHD_HOLD_BY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Phhd Hold By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805572329658647)
,p_db_column_name=>'PHHD_HOLD_DATE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Phhd Hold Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805385974658645)
,p_db_column_name=>'PHHD_HOLD_FLAG'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Phhd Hold Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805679394658648)
,p_db_column_name=>'PHHD_HOLD_REAS'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Phhd Hold Reas'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807362070658665)
,p_db_column_name=>'PHHD_HOLIDAYS'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Phhd Holidays'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081804861367658640)
,p_db_column_name=>'PHHD_INPROG_AMT'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Pay'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414933419943274)
,p_db_column_name=>'PHHD_JOB_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Phhd Job Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807803324658670)
,p_db_column_name=>'PHHD_LATE_HRS'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Phhd Late Hrs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415570906943280)
,p_db_column_name=>'PHHD_LOC_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Phhd Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807186729658663)
,p_db_column_name=>'PHHD_MON_DAYS'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Phhd Mon Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806848580658660)
,p_db_column_name=>'PHHD_NET_AFR_ROUND'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Phhd Net Afr Round'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806981979658661)
,p_db_column_name=>'PHHD_NET_BFR_ROUND'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Phhd Net Bfr Round'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081804590588658637)
,p_db_column_name=>'PHHD_NET_PAYABLE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Net Payable'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807466180658666)
,p_db_column_name=>'PHHD_OFF'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Phhd Off'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081804789401658639)
,p_db_column_name=>'PHHD_PAID_AMT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Phhd Paid Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081416150525943286)
,p_db_column_name=>'PHHD_PAID_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Phhd Paid Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808026976658672)
,p_db_column_name=>'PHHD_PAID_LEAVE_DAYS'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Phhd Paid Leave Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081804638889658638)
,p_db_column_name=>'PHHD_PAY_IN_PROGRESS'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Pay In Progress'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414589752943270)
,p_db_column_name=>'PHHD_PERIOD'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413951074943264)
,p_db_column_name=>'PHHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#PLNT_DESC#">#PHHD_PLNT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415760108943282)
,p_db_column_name=>'PHHD_POSTED'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Phhd Posted'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415133115943276)
,p_db_column_name=>'PHHD_POS_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Phhd Pos Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806437167658656)
,p_db_column_name=>'PHHD_PROCESS_BATCH_NO'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Batch No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807728076658669)
,p_db_column_name=>'PHHD_PROCESS_DATE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Phhd Process Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414109309943266)
,p_db_column_name=>'PHHD_PYRL_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Payroll No.'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414297245943267)
,p_db_column_name=>'PHHD_PYRL_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Payroll Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415996899943284)
,p_db_column_name=>'PHHD_STATUS'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Phhd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807665186658668)
,p_db_column_name=>'PHHD_TOT_PAID_DAYS'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Phhd Tot Paid Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805117941658643)
,p_db_column_name=>'PHHD_TYPE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Phhd Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805798298658649)
,p_db_column_name=>'PHHD_UNHOLD_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Phhd Unhold By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805960012658651)
,p_db_column_name=>'PHHD_UNHOLD_DATE'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Phhd Unhold Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805877782658650)
,p_db_column_name=>'PHHD_UNHOLD_REAS'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Phhd Unhold Reas'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081808201104658673)
,p_db_column_name=>'PHHD_UNPAID_LEAVE_DAYS'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Phhd Unpaid Leave Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806203302658654)
,p_db_column_name=>'PHHD_UPD_BY'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Phhd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081806367515658655)
,p_db_column_name=>'PHHD_UPD_DATE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Phhd Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081805014465658642)
,p_db_column_name=>'PHHD_USER'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Phhd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081416096930943285)
,p_db_column_name=>'PHHD_VOUCHER_NO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Phhd Voucher No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807222883658664)
,p_db_column_name=>'PHHD_WORKIN_DAYS'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Phhd Workin Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081807545852658667)
,p_db_column_name=>'PHHD_WORKOFF_HOLIDAY'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Phhd Workoff Holiday'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414464409943269)
,p_db_column_name=>'PHHD_YEAR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081414039134943265)
,p_db_column_name=>'PLNT_DESC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Plnt Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10357859748184998538)
,p_db_column_name=>'PLNT_LOC_DESC'
,p_display_order=>2000
,p_column_identifier=>'GR'
,p_column_label=>'Unit Loc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081415287053943277)
,p_db_column_name=>'POS_DESC'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081812072893658662)
,p_db_column_name=>'TXT_BANK_DESC'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Employee Bank'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9082126435485701376)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4959116'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PLNT_LOC_DESC:PHHD_PLNT:PHHD_EMP_ID:PHHD_EMP_NAME:DEPT_DESC:PHHD_YEAR:PHHD_PERIOD:PHHD_PYRL_TYPE:PHHD_PYRL_NO:PHHD_NET_PAYABLE:PHHD_PAY_IN_PROGRESS:BAL_AMT:PHHD_INPROG_AMT:TXT_BANK_DESC:EMP_PAY_FROM_BANK_ACCT_DESC:EMP_PAY_TO_BANK_ACCT_DESC:PHHD_PROCE'
||'SS_BATCH_NO:LOC_DESC:JOB_DESC:EMP_PROJ_NO:EMP_CONTR_NO:GRADE_DESC:POS_DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9089757688886926470)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Employee Wise'
,p_report_seq=>10
,p_report_alias=>'5035428'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PHHD_PLNT:PHHD_EMP_ID:PHHD_EMP_NAME:DEPT_DESC:PHHD_YEAR:PHHD_PERIOD:PHHD_PYRL_TYPE:PHHD_PYRL_NO:PHHD_NET_PAYABLE:PHHD_PAY_IN_PROGRESS:BAL_AMT:PHHD_INPROG_AMT:TXT_BANK_DESC:EMP_PAY_FROM_BANK_ACCT_DESC:EMP_PAY_TO_BANK_ACCT_DESC:PHHD_PROCESS_BATCH_NO:LO'
||'C_DESC:JOB_DESC:EMP_PROJ_NO:EMP_CONTR_NO:GRADE_DESC:POS_DESC'
,p_break_on=>'PHHD_EMP_ID:PHHD_EMP_NAME'
,p_break_enabled_on=>'PHHD_EMP_ID:PHHD_EMP_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9080541291855479355)
,p_plug_name=>'Pending Payable - Statutory'
,p_static_id=>'pending-payable-statutory'
,p_region_name=>'PS'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-none:margin-left-none'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 6/14/2022 5:25:19 PM (QP5 v5.163.1008.3004) */',
'  SELECT par_acct_type,',
'         (SELECT atc_disp_desc',
'            FROM acct_type_codes',
'           WHERE atc_bu = :Global_bu AND atc_code = par_acct_type)acct_class,',
'         par_bank_id,',
'         par_bc_exrate_amt,',
'         par_bfcry_id,',
'         par_bfcry_type,',
'         par_bu,',
'         par_check_flag,',
'         par_chq_date,',
'         par_chq_no,',
'         par_cls_id,',
'         par_cre_by,',
'         par_cre_date,',
'         par_currency,',
'         par_doc_no,',
'         par_doc_period,',
'         par_doc_type,',
'         par_doc_year,',
'         par_dr_cr,',
'         par_exchange_rate,',
'         par_term_id,',
'         par_inprog_amt,',
'         par_jrnl_flag,',
'         par_ord_plant,',
'         par_pay_type,',
'         --par_pfx,',
'         par_plant,',
'			(SELECT bupld_loc_name',
'            FROM bus_unit_plants_loc_dtls',
'           WHERE bupld_bu = :Global_bu',
'            AND  bupld_loc_id = par_plant) plnt_loc_desc,',
'         (SELECT bup_name1',
'            FROM bus_unit_plants',
'           WHERE bup_bu = :Global_bu AND bup_plant_id = par_plant)unit_desc,',
'         par_plnt_loc_id,',
'         par_proj_id,',
'         (SELECT glp_prj_name desc_lvl',
'            FROM gl_lvl_prj',
'           WHERE glp_bu = :global_bu AND glp_prj_id = par_proj_id)',
'            par_proj_desc,',
'         PAR_LOC_NAME  location_desc,',
'         par_rtn_reason,',
'         ((pdd_bal_amt /*- (NVL(pdd_in_progress,0))*/)*par_exchange_rate)bal_amt_bc,',
'         (pdd_bal_amt - (NVL(pdd_in_progress,0)))bal_amt,',
'         par_sc_bal_amt,',
'         par_sc_mat_amt,',
'         par_sc_proc_amt,',
'         par_sc_tot_amt,',
'         par_src_acct_type,',
'         par_src_doc_no,',
'         par_src_doc_pfx,',
'         CASE',
'            WHEN par_src_doc_pfx IS NOT NULL',
'            THEN',
'               par_src_doc_pfx || ''/'' || par_src_doc_no',
'            ELSE',
'               par_src_doc_no',
'         END',
'            src_doc_no,',
'         par_src_doc_type,',
'         par_src_offset_doc_no,',
'         par_status,',
'         TO_CHAR(par_suplr_doc_date,:Global_rpt_date_mask)par_suplr_doc_date,',
'         par_suplr_doc_no,',
'         par_suplr_id,',
'         par_suplr_reference,',
'         par_sys_doc,',
'         par_upd_by,',
'         par_upd_date,',
'         par_user,',
'         par_dflt_pay_thru,',
'         pdd_bu,',
'         pdd_bal_amt,',
'         pdd_check_flag,',
'         pdd_cre_by,',
'         pdd_cre_date,',
'         pdd_date_type,',
'         pdd_disc_pct,',
'         pdd_doc_no,',
'         pdd_due_amt,',
'         TO_CHAR(pdd_due_date,:Global_rpt_date_mask)pdd_due_date,',
'         pdd_due_days,',
'         pdd_due_pct,',
'         pdd_due_type,',
'         pdd_in_progress,',
'         pdd_int_pct,',
'         pdd_ms_date,',
'         pdd_ms_id,',
'         pdd_part_pay_disc_flag,',
'         pdd_pay_amt,',
'         --pdd_pfx,',
'         pdd_plant,',
'         pdd_resp_emp_id,',
'         pdd_seq_no,',
'         pdd_upd_by,',
'         pdd_upd_date,',
'         pdd_user,',
'         par_type,',
'         par_vou_type,',
'         par_hold_pay,',
'         par_aged_days,',
'         par_due_status,',
'         par_suplr_name,',
'         par_pymt_excp,',
'         par_so_ref,',
'         --par_doc_sel_mode,',
'         par_hold_party,',
'         pdd_temp_pay_amt,',
'         --par_pay_by,',
'         par_parent_id,',
'         par_ref_bu,',
'         par_ref_inv_pfx,',
'         par_ref_inv_no,',
'         par_ref_plnt,',
'         par_bill_amt,',
'         par_sales_person,',
'         par_tax_amt,',
'         par_cust_area,',
'         par_sales_terr,',
'         par_sub_terr,',
'         par_sub_div_id,',
'         par_div_id,',
'         par_area_mngr_id,',
'         par_tr_mngr_id,',
'         par_str_mngr_id,',
'         par_grn_reference,',
'         suplr_msme_type,',
'         par_dev_exists,',
'         par_dev_status,',
'         par_dev_si_doc_no,',
'         par_dev_amt,',
'         par_pur_ret_cre_flag,',
'         par_pur_ret_doc_no,',
'         par_pur_status,',
'         par_pur_ret_inv_pfx,',
'         par_pur_ret_inv_no,',
'         par_rej_val_amt,',
'         par_dairy_coc_id,',
'         par_dairy_route_id,',
'         par_dairy_can_id',
'    FROM pending_payables_stat_vw_hist',
'   WHERE par_bu = :global_bu',
'         AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'         AND (pdd_bal_amt - pdd_in_progress) > 0',
'         AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'    AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)',
'         AND par_plant IN (SELECT plant_id',
'                             FROM (SELECT auba_plant plant_id',
'                                     FROM appl_user_plant_access, apm_control',
'                                    WHERE auba_bu = par_bu',
'                                          AND auba_user_id = :global_user',
'                                          AND TRUNC (SYSDATE) BETWEEN TRUNC (',
'                                                                         auba_from)',
'                                                                  AND TRUNC (',
'                                                                         auba_to)',
'                                          AND apmc_bu = auba_bu',
'                                   UNION ALL',
'                                   SELECT bup_plant_id plant_id',
'                                     FROM bus_unit_plants, apm_control',
'                                    WHERE     bup_bu = par_bu',
'                                          AND apmc_bu = bup_bu',
'                                         -- AND apmc_shw_plnt_access_flg = ''N''',
'                                         ))',
'ORDER BY par_aged_days DESC, pdd_seq_no, par_suplr_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_REPORT_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Payable - Statutory'
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
 p_id=>wwv_flow_imp.id(9080541459229479357)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3598579623685868329
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413410326943259)
,p_db_column_name=>'ACCT_CLASS'
,p_display_order=>1390
,p_column_identifier=>'EV'
,p_column_label=>'Acct. Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081412877884943253)
,p_db_column_name=>'BAL_AMT'
,p_display_order=>1330
,p_column_identifier=>'EP'
,p_column_label=>'Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081412722889943252)
,p_db_column_name=>'BAL_AMT_BC'
,p_display_order=>1320
,p_column_identifier=>'EO'
,p_column_label=>'Bal. Amt.(BC)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081412945472943254)
,p_db_column_name=>'LOCATION_DESC'
,p_display_order=>1340
,p_column_identifier=>'EQ'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541546563479358)
,p_db_column_name=>'PAR_ACCT_TYPE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Par Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405790100943182)
,p_db_column_name=>'PAR_AGED_DAYS'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Ag. Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408178595943156)
,p_db_column_name=>'PAR_AREA_MNGR_ID'
,p_display_order=>990
,p_column_identifier=>'CU'
,p_column_label=>'Par Area Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541632816479359)
,p_db_column_name=>'PAR_BANK_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Par Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541718721479360)
,p_db_column_name=>'PAR_BC_EXRATE_AMT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Par Bc Exrate Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541808953479361)
,p_db_column_name=>'PAR_BFCRY_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Par Bfcry Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541962964479362)
,p_db_column_name=>'PAR_BFCRY_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407369405943148)
,p_db_column_name=>'PAR_BILL_AMT'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Par Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542004363479363)
,p_db_column_name=>'PAR_BU'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Entity'
,p_column_html_expression=>'<span title="#ENTITY#">#PAR_BU#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542146356479364)
,p_db_column_name=>'PAR_CHECK_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Par Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542234577479365)
,p_db_column_name=>'PAR_CHQ_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Par Chq Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542324299479366)
,p_db_column_name=>'PAR_CHQ_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Par Chq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542423892479367)
,p_db_column_name=>'PAR_CLS_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Par Cls Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542549364479368)
,p_db_column_name=>'PAR_CRE_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Par Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542664999479369)
,p_db_column_name=>'PAR_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Par Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542728626479370)
,p_db_column_name=>'PAR_CURRENCY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Curr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407632725943151)
,p_db_column_name=>'PAR_CUST_AREA'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Par Cust Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409834642943173)
,p_db_column_name=>'PAR_DAIRY_CAN_ID'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Par Dairy Can Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409640821943171)
,p_db_column_name=>'PAR_DAIRY_COC_ID'
,p_display_order=>1140
,p_column_identifier=>'DJ'
,p_column_label=>'Par Dairy Coc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409713733943172)
,p_db_column_name=>'PAR_DAIRY_ROUTE_ID'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Par Dairy Route Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408955051943164)
,p_db_column_name=>'PAR_DEV_AMT'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Deviation Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408611277943161)
,p_db_column_name=>'PAR_DEV_EXISTS'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Deviation Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408821425943163)
,p_db_column_name=>'PAR_DEV_SI_DOC_NO'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Deviation Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408733250943162)
,p_db_column_name=>'PAR_DEV_STATUS'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Deviation Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403171592943156)
,p_db_column_name=>'PAR_DFLT_PAY_THRU'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Pay Thru.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408035134943155)
,p_db_column_name=>'PAR_DIV_ID'
,p_display_order=>980
,p_column_identifier=>'CT'
,p_column_label=>'Par Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080542937043479372)
,p_db_column_name=>'PAR_DOC_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Par Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543067269479373)
,p_db_column_name=>'PAR_DOC_PERIOD'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Par Doc Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543129513479374)
,p_db_column_name=>'PAR_DOC_TYPE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543213477479375)
,p_db_column_name=>'PAR_DOC_YEAR'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Par Doc Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543313591479376)
,p_db_column_name=>'PAR_DR_CR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>' Dr/ Cr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405865228943183)
,p_db_column_name=>'PAR_DUE_STATUS'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Due Status'
,p_column_html_expression=>' <div style="color:#DUE_STATUS_COLOR#; font-weight:bold;">#PAR_DUE_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543490497479377)
,p_db_column_name=>'PAR_EXCHANGE_RATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_EXCH_RT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408464682943159)
,p_db_column_name=>'PAR_GRN_REFERENCE'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'GRN Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406345163943138)
,p_db_column_name=>'PAR_HOLD_PARTY'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Hold Partner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405621466943181)
,p_db_column_name=>'PAR_HOLD_PAY'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Hold Bill'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543622825479379)
,p_db_column_name=>'PAR_INPROG_AMT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Par Inprog Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543762474479380)
,p_db_column_name=>'PAR_JRNL_FLAG'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Par Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543846341479381)
,p_db_column_name=>'PAR_ORD_PLANT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Par Ord Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406893370943143)
,p_db_column_name=>'PAR_PARENT_ID'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Parent ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543962249479382)
,p_db_column_name=>'PAR_PAY_TYPE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Par Pay Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080544186817479384)
,p_db_column_name=>'PAR_PLANT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT_DESC#">#PAR_PLANT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080544215511479385)
,p_db_column_name=>'PAR_PLNT_LOC_ID'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Par Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413051357943255)
,p_db_column_name=>'PAR_PROJ_DESC'
,p_display_order=>1350
,p_column_identifier=>'ER'
,p_column_label=>'Proj. Lvl. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080544321673479386)
,p_db_column_name=>'PAR_PROJ_ID'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Proj. Lvl.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409020846943165)
,p_db_column_name=>'PAR_PUR_RET_CRE_FLAG'
,p_display_order=>1080
,p_column_identifier=>'DD'
,p_column_label=>'Pur. Rej. Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409137781943166)
,p_db_column_name=>'PAR_PUR_RET_DOC_NO'
,p_display_order=>1090
,p_column_identifier=>'DE'
,p_column_label=>'Pur. Rej. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409414786943169)
,p_db_column_name=>'PAR_PUR_RET_INV_NO'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'Par Pur Ret Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409338777943168)
,p_db_column_name=>'PAR_PUR_RET_INV_PFX'
,p_display_order=>1110
,p_column_identifier=>'DG'
,p_column_label=>'Par Pur Ret Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409291193943167)
,p_db_column_name=>'PAR_PUR_STATUS'
,p_display_order=>1100
,p_column_identifier=>'DF'
,p_column_label=>'Pur. Rej.  Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406035517943185)
,p_db_column_name=>'PAR_PYMT_EXCP'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Exceptions'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406976827943144)
,p_db_column_name=>'PAR_REF_BU'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Par Ref Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407114482943146)
,p_db_column_name=>'PAR_REF_INV_NO'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Par Ref Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407073673943145)
,p_db_column_name=>'PAR_REF_INV_PFX'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Par Ref Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407205134943147)
,p_db_column_name=>'PAR_REF_PLNT'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Par Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081409537015943170)
,p_db_column_name=>'PAR_REJ_VAL_AMT'
,p_display_order=>1130
,p_column_identifier=>'DI'
,p_column_label=>'Pur. Rej. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401284439943137)
,p_db_column_name=>'PAR_RTN_REASON'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Par Rtn Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407434937943149)
,p_db_column_name=>'PAR_SALES_PERSON'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Par Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407738850943152)
,p_db_column_name=>'PAR_SALES_TERR'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Par Sales Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401349837943138)
,p_db_column_name=>'PAR_SC_BAL_AMT'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Bal. Amt. '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401462721943139)
,p_db_column_name=>'PAR_SC_MAT_AMT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Par Sc Mat Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401506576943140)
,p_db_column_name=>'PAR_SC_PROC_AMT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Pay Inprog.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401612473943141)
,p_db_column_name=>'PAR_SC_TOT_AMT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Bill Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406137588943186)
,p_db_column_name=>'PAR_SO_REF'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Par So Ref'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401801310943142)
,p_db_column_name=>'PAR_SRC_ACCT_TYPE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Par Src Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081401992005943144)
,p_db_column_name=>'PAR_SRC_DOC_NO'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Par Src Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402025523943145)
,p_db_column_name=>'PAR_SRC_DOC_PFX'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Par Src Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402194141943146)
,p_db_column_name=>'PAR_SRC_DOC_TYPE'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Par Src Doc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402270032943147)
,p_db_column_name=>'PAR_SRC_OFFSET_DOC_NO'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Par Src Offset Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402363137943148)
,p_db_column_name=>'PAR_STATUS'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Par Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408315169943158)
,p_db_column_name=>'PAR_STR_MNGR_ID'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Par Str Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407924726943154)
,p_db_column_name=>'PAR_SUB_DIV_ID'
,p_display_order=>970
,p_column_identifier=>'CS'
,p_column_label=>'Par Sub Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407812445943153)
,p_db_column_name=>'PAR_SUB_TERR'
,p_display_order=>960
,p_column_identifier=>'CR'
,p_column_label=>'Par Sub Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081412646036943251)
,p_db_column_name=>'PAR_SUPLR_DOC_DATE'
,p_display_order=>1310
,p_column_identifier=>'EN'
,p_column_label=>'Bill Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402409178943149)
,p_db_column_name=>'PAR_SUPLR_DOC_NO'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Bill No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402511491943150)
,p_db_column_name=>'PAR_SUPLR_ID'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Party Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405972979943184)
,p_db_column_name=>'PAR_SUPLR_NAME'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402700805943151)
,p_db_column_name=>'PAR_SUPLR_REFERENCE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402750597943152)
,p_db_column_name=>'PAR_SYS_DOC'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Par Sys Doc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081407527759943150)
,p_db_column_name=>'PAR_TAX_AMT'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Tax Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080543518265479378)
,p_db_column_name=>'PAR_TERM_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Par Term Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408204533943157)
,p_db_column_name=>'PAR_TR_MNGR_ID'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Par Tr Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405411650943179)
,p_db_column_name=>'PAR_TYPE'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Par Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402804752943153)
,p_db_column_name=>'PAR_UPD_BY'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Par Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081402919104943154)
,p_db_column_name=>'PAR_UPD_DATE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Par Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403097614943155)
,p_db_column_name=>'PAR_USER'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Par User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405514669943180)
,p_db_column_name=>'PAR_VOU_TYPE'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Par Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403305997943158)
,p_db_column_name=>'PDD_BAL_AMT'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Due Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403257575943157)
,p_db_column_name=>'PDD_BU'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Pdd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403495971943159)
,p_db_column_name=>'PDD_CHECK_FLAG'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Pdd Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081410677355943181)
,p_db_column_name=>'PDD_CRE_BY'
,p_display_order=>1240
,p_column_identifier=>'DT'
,p_column_label=>'Pdd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081410769562943182)
,p_db_column_name=>'PDD_CRE_DATE'
,p_display_order=>1250
,p_column_identifier=>'DU'
,p_column_label=>'Pdd Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403553150943160)
,p_db_column_name=>'PDD_DATE_TYPE'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Pdd Date Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403656318943161)
,p_db_column_name=>'PDD_DISC_PCT'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Pdd Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403715130943162)
,p_db_column_name=>'PDD_DOC_NO'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Pdd Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403877398943163)
,p_db_column_name=>'PDD_DUE_AMT'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Due Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413125883943256)
,p_db_column_name=>'PDD_DUE_DATE'
,p_display_order=>1360
,p_column_identifier=>'ES'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081403962987943164)
,p_db_column_name=>'PDD_DUE_DAYS'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404058766943165)
,p_db_column_name=>'PDD_DUE_PCT'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Pdd Due Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404108355943166)
,p_db_column_name=>'PDD_DUE_TYPE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Pdd Due Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404337797943168)
,p_db_column_name=>'PDD_INT_PCT'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Pdd Int Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404240068943167)
,p_db_column_name=>'PDD_IN_PROGRESS'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Due Pay InProg.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404420107943169)
,p_db_column_name=>'PDD_MS_DATE'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Pdd Ms Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404593601943170)
,p_db_column_name=>'PDD_MS_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Pdd Ms Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404669010943171)
,p_db_column_name=>'PDD_PART_PAY_DISC_FLAG'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Pdd Part Pay Disc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404799638943172)
,p_db_column_name=>'PDD_PAY_AMT'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Pay Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081404917472943174)
,p_db_column_name=>'PDD_PLANT'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Pdd Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405027084943175)
,p_db_column_name=>'PDD_RESP_EMP_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Pdd Resp Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405192611943176)
,p_db_column_name=>'PDD_SEQ_NO'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Due No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081406446942943139)
,p_db_column_name=>'PDD_TEMP_PAY_AMT'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Pdd Temp Pay Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081410862071943183)
,p_db_column_name=>'PDD_UPD_BY'
,p_display_order=>1260
,p_column_identifier=>'DV'
,p_column_label=>'Pdd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081410947091943184)
,p_db_column_name=>'PDD_UPD_DATE'
,p_display_order=>1270
,p_column_identifier=>'DW'
,p_column_label=>'Pdd Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081405265607943177)
,p_db_column_name=>'PDD_USER'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Pdd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10357859667297998537)
,p_db_column_name=>'PLNT_LOC_DESC'
,p_display_order=>1410
,p_column_identifier=>'EX'
,p_column_label=>'Unit Loc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413296659943257)
,p_db_column_name=>'SRC_DOC_NO'
,p_display_order=>1370
,p_column_identifier=>'ET'
,p_column_label=>'Sou. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081408599917943160)
,p_db_column_name=>'SUPLR_MSME_TYPE'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'MSME Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9081413585564943260)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>1400
,p_column_identifier=>'EW'
,p_column_label=>'Unit Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9081459235692947075)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4952444'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LOCATION_DESC:UNIT_DESC:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PAR_EXCHANGE_RATE:PAR_AGED_DAYS:PAR_DR_CR:BAL_AMT_BC:BAL_AMT:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_SC_TOT_AMT:PAR_PROJ_ID:PAR_PROJ_DESC:PDD_SEQ_NO:PDD_D'
||'UE_AMT:PDD_DUE_DATE:PDD_IN_PROGRESS:PDD_BAL_AMT:SRC_DOC_NO:ACCT_CLASS:PAR_SUPLR_REFERENCE'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9089640125627905511)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Statutory Wise'
,p_report_seq=>10
,p_report_alias=>'5034253'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_PLANT:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PAR_EXCHANGE_RATE:PAR_AGED_DAYS:PAR_DR_CR:BAL_AMT_BC:BAL_AMT:LOCATION_DESC:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_SC_TOT_AMT:PAR_PROJ_ID:PAR_PROJ_DESC:PDD_SEQ_NO:PDD_D'
||'UE_AMT:PDD_DUE_DATE:PDD_IN_PROGRESS:PDD_BAL_AMT:SRC_DOC_NO:ACCT_CLASS:PAR_SUPLR_REFERENCE'
,p_break_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
,p_break_enabled_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9814944470729391928)
,p_plug_name=>'Pending Payable Supplier Wise '
,p_static_id=>'pending-payable-supplier-wise'
,p_region_name=>'PP'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-none:margin-left-none'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 6/14/2022 4:24:00 PM (QP5 v5.163.1008.3004) */',
'  SELECT par_acct_type,',
'         (SELECT atc_disp_desc',
'            FROM acct_type_codes',
'           WHERE atc_bu = :Global_bu AND atc_code = par_acct_type)',
'            acct_type_desc,',
'         par_bank_id,',
'         par_bc_exrate_amt,',
'         par_bfcry_id,',
'         DECODE (par_bfcry_type,  ''S'', ''Supplier'',  ''C'', ''Customer'')',
'            par_bfcry_type,',
'         par_bu,',
'         (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = par_bu)',
'            Entity,',
'         par_check_flag,',
'         par_chq_date,',
'         par_chq_no,',
'         par_cls_id,',
'         par_cre_by,',
'         par_cre_date,',
'         par_currency,',
'         TO_CHAR (par_doc_date, :Global_rpt_date_mask) par_doc_date,',
'         par_doc_no,',
'         par_doc_period,',
'         DECODE (par_doc_type,',
'                 ''CM'', ''Credit Note'',',
'                 ''DM'', ''Debit Note'',',
'                 ''I'', ''Invoice'',',
'                 ''P'', ''Payment'',',
'                 ''SB'',''Purchase Bills'',',
'                 ''R'',''Receipt'',',
'                 ''JV'',''Journal Voucher'')',
'            par_doc_type,',
'         par_doc_year,',
'         DECODE (par_dr_cr,  ''DR'', ''Dr'',  ''CR'', ''Cr'') par_dr_cr,',
'         par_exchange_rate,',
'         par_term_id,',
'			(Select TERM_DESC1 FROM TERMS_HD  WHERE TERM_BU =:GLOBAL_BU AND TERM_TERM_ID =par_term_id) TERM_DESC,',
'         par_inprog_amt,',
'         par_jrnl_flag,',
'         par_ord_plant,',
'         par_pay_type,',
'         par_plant,',
'         (SELECT bup_name1',
'            FROM bus_unit_plants',
'           WHERE bup_bu = :Global_bu AND bup_plant_id = par_plant)unit_desc,',
'         par_plnt_loc_id,',
'         (SELECT bupld_loc_name',
'            FROM bus_unit_plants_loc_dtls',
'           WHERE bupld_bu = :Global_bu AND bupld_loc_id = par_plnt_loc_id)',
'            plant_location_dec,',
'         par_proj_id,',
'         (SELECT glp_prj_name desc_lvl',
'            FROM gl_lvl_prj',
'           WHERE glp_bu = :global_bu AND glp_prj_id = par_proj_id)',
'            par_proj_desc,',
'         par_rtn_reason,',
'         par_sc_bal_amt,',
'         par_sc_mat_amt,',
'         par_sc_proc_amt,',
'         par_sc_tot_amt,',
'         par_src_acct_type,',
'         par_src_doc_no,',
'         par_src_doc_pfx,',
'         CASE',
'            WHEN par_src_doc_pfx IS NOT NULL',
'            THEN',
'               par_src_doc_pfx || ''/'' || par_src_doc_no',
'            ELSE',
'               par_src_doc_no',
'         END',
'            src_doc_no,',
'         par_src_doc_type,',
'         par_src_offset_doc_no,',
'         par_status,',
'         TO_CHAR (par_suplr_doc_date, :Global_rpt_date_mask) par_suplr_doc_date,',
'         par_suplr_doc_no,',
'         par_suplr_id,',
'         par_suplr_reference,',
'         par_sys_doc,',
'         par_upd_by,',
'         par_upd_date,',
'         par_user,',
'         DECODE (par_dflt_pay_thru,  ''B'', ''Bank'',  ''C'', ''Cash'',  ''A'', ''Any'')',
'            par_dflt_pay_thru,',
'         pdd_bu,',
'         pdd_bal_amt,',
'         (pdd_bal_amt /*- (NVL (pdd_in_progress, 0)))*/ * par_exchange_rate)',
'            bal_amt_bc,',
'         (pdd_bal_amt - (NVL (pdd_in_progress, 0)) )',
'            bal_amt_tc,',
'         CASE',
'            WHEN par_check_flag <> ''Y''',
'            THEN',
'               (pdd_bal_amt - (NVL (pdd_in_progress, 0)))',
'            ELSE',
'               pdd_pay_amt',
'         END',
'            pay_amt,',
'         pdd_check_flag,',
'         pdd_cre_by,',
'         pdd_cre_date,',
'         pdd_date_type,',
'         pdd_disc_pct,',
'         pdd_doc_no,',
'         pdd_due_amt,',
'         TO_CHAR (pdd_due_date, :Global_rpt_date_mask) pdd_due_date,',
'         par_aged_days pdd_due_days,',
'         pdd_due_pct,',
'         pdd_due_type,',
'         pdd_in_progress,',
'         pdd_int_pct,',
'         pdd_ms_date,',
'         pdd_ms_id,',
'         pdd_part_pay_disc_flag,',
'         pdd_pay_amt,',
'         pdd_doc_no doc_no,',
'         pdd_plant,',
'         pdd_resp_emp_id,',
'         pdd_seq_no,',
'         pdd_upd_by,',
'         pdd_upd_date,',
'         pdd_user,',
'         pdd_claim_type,',
'         par_type,',
'         par_vou_type,',
'         DECODE (par_hold_pay,  ''N'', ''No'',  ''Y'', ''Yes'') par_hold_pay,',
'         par_aged_days,',
'         DECODE (par_due_status,  ''U'', ''Undue'',  ''D'', ''Due'') par_due_status,',
'         DECODE (par_due_status,  ''D'', ''red'',  ''U'', ''Green'') due_status_color,',
'         par_suplr_name,',
'         par_pymt_excp,',
'         par_so_ref,',
'         par_doc_sel_mode,',
'         DECODE (par_hold_party,  ''N'', ''No'',  ''Y'', ''Yes'') par_hold_party,',
'         pdd_temp_pay_amt,',
'          PAR_LOC_NAME location_desc,',
'         par_parent_id,',
'         par_ref_bu,',
'         par_ref_inv_pfx,',
'         par_ref_inv_no,',
'         par_ref_plnt,',
'         par_bill_amt,',
'         par_sales_person,',
'         par_tax_amt,',
'         par_cust_area,',
'         par_sales_terr,',
'         par_sub_terr,',
'         par_sub_div_id,',
'         par_div_id,',
'         par_area_mngr_id,',
'         par_tr_mngr_id,',
'         par_str_mngr_id,',
'         par_grn_reference,',
'         DECODE (suplr_msme_type,',
'                 ''M'', ''Medium'',',
'                 ''S'', ''Small'',',
'                 ''O'', ''Micro'',',
'                 ''L'', ''Large'',',
'                 ''NA'', ''Not Applicable'')',
'            suplr_msme_type,',
'         DECODE (par_dev_exists,  ''N'', ''No'',  ''Y'', ''Yes'') par_dev_exists,',
'         DECODE (par_dev_status,',
'                 ''SI'', ''Sales Inv. In Progress'',',
'                 ''SA'', ''Sales Invoice'',',
'                 ''AP'', ''Approval In Progress'',',
'                 ''NH'', ''Not Handled'',',
'                 ''NR'', ''Not Required'')',
'            par_dev_status,',
'         par_dev_si_doc_no,',
'         par_dev_amt,',
'         DECODE (par_pur_ret_cre_flag,  ''N'', ''No'',  ''Y'', ''Yes'')',
'            par_pur_ret_cre_flag,',
'         par_pur_ret_doc_no,',
'         DECODE (par_pur_status,',
'                 ''G'', ''Sales Inv. In Progress'',',
'                 ''S'', ''Sales Invoice'',',
'                 ''A'', ''Approval In Progress'',',
'                 ''N'', ''Not Handled'',',
'                 ''R'', ''Not Required'') par_pur_status,',
'         par_pur_ret_inv_pfx,',
'         par_pur_ret_inv_no,',
'         par_rej_val_amt,',
'         par_dairy_coc_id,',
'         par_dairy_route_id,',
'         par_dairy_can_id,',
'         --partner_type,',
'         par_cr_avl_no,',
'         TO_CHAR (par_cr_avl_date, :Global_rpt_date_mask) par_cr_avl_date,',
'         DECODE (par_cr_avl_status,  ''P'', ''Pending'',  ''A'', ''Availed'')',
'            par_cr_avl_status,',
'         par_gst_aged_days',
'    FROM pending_payables_vw_hist',
'   WHERE par_bu = :GLOBAL_BU',
'    AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'    AND (pdd_bal_amt - pdd_in_progress) > 0  ',
'ORDER BY par_aged_days DESC, pdd_seq_no, par_suplr_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_REPORT_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Payable Supplier Wise '
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
 p_id=>wwv_flow_imp.id(9814944606080391929)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4332982770536780901
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541056304479353)
,p_db_column_name=>'ACCT_TYPE_DESC'
,p_display_order=>1470
,p_column_identifier=>'GW'
,p_column_label=>'Account Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540368837479346)
,p_db_column_name=>'BAL_AMT_BC'
,p_display_order=>1400
,p_column_identifier=>'GP'
,p_column_label=>'Bal. Amt. (BC)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540461696479347)
,p_db_column_name=>'BAL_AMT_TC'
,p_display_order=>1410
,p_column_identifier=>'GQ'
,p_column_label=>'Bal. Amt.(TC)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540641603479349)
,p_db_column_name=>'DOC_NO'
,p_display_order=>1430
,p_column_identifier=>'GS'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540267205479345)
,p_db_column_name=>'DUE_STATUS_COLOR'
,p_display_order=>1390
,p_column_identifier=>'GO'
,p_column_label=>'Due Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080339057600282685)
,p_db_column_name=>'ENTITY'
,p_display_order=>1290
,p_column_identifier=>'GE'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540001877479342)
,p_db_column_name=>'LOCATION_DESC'
,p_display_order=>1360
,p_column_identifier=>'GL'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877396084987157)
,p_db_column_name=>'PAR_ACCT_TYPE'
,p_display_order=>10
,p_column_identifier=>'BG'
,p_column_label=>'Par Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334313860282638)
,p_db_column_name=>'PAR_AGED_DAYS'
,p_display_order=>820
,p_column_identifier=>'EJ'
,p_column_label=>'Par Aged Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336789954282662)
,p_db_column_name=>'PAR_AREA_MNGR_ID'
,p_display_order=>1060
,p_column_identifier=>'FH'
,p_column_label=>'Par Area Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877442854987158)
,p_db_column_name=>'PAR_BANK_ID'
,p_display_order=>20
,p_column_identifier=>'BH'
,p_column_label=>'Par Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877551509987159)
,p_db_column_name=>'PAR_BC_EXRATE_AMT'
,p_display_order=>30
,p_column_identifier=>'BI'
,p_column_label=>'Par Bc Exrate Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877631202987160)
,p_db_column_name=>'PAR_BFCRY_ID'
,p_display_order=>40
,p_column_identifier=>'BJ'
,p_column_label=>'Par Bfcry Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877749462987161)
,p_db_column_name=>'PAR_BFCRY_TYPE'
,p_display_order=>50
,p_column_identifier=>'BK'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335975124282654)
,p_db_column_name=>'PAR_BILL_AMT'
,p_display_order=>980
,p_column_identifier=>'EZ'
,p_column_label=>'Par Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877849692987162)
,p_db_column_name=>'PAR_BU'
,p_display_order=>60
,p_column_identifier=>'BL'
,p_column_label=>'Entity'
,p_column_html_expression=>'<span title="#ENTITY#">#PAR_BU#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060877929641987163)
,p_db_column_name=>'PAR_CHECK_FLAG'
,p_display_order=>70
,p_column_identifier=>'BM'
,p_column_label=>'Par Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878094988987164)
,p_db_column_name=>'PAR_CHQ_DATE'
,p_display_order=>80
,p_column_identifier=>'BN'
,p_column_label=>'Par Chq Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878158253987165)
,p_db_column_name=>'PAR_CHQ_NO'
,p_display_order=>90
,p_column_identifier=>'BO'
,p_column_label=>'Par Chq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878218395987166)
,p_db_column_name=>'PAR_CLS_ID'
,p_display_order=>100
,p_column_identifier=>'BP'
,p_column_label=>'Par Cls Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878308973987167)
,p_db_column_name=>'PAR_CRE_BY'
,p_display_order=>110
,p_column_identifier=>'BQ'
,p_column_label=>'Par Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878417092987168)
,p_db_column_name=>'PAR_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'BR'
,p_column_label=>'Par Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540756823479350)
,p_db_column_name=>'PAR_CR_AVL_DATE'
,p_display_order=>1440
,p_column_identifier=>'GT'
,p_column_label=>'AIC Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338607241282681)
,p_db_column_name=>'PAR_CR_AVL_NO'
,p_display_order=>1250
,p_column_identifier=>'GA'
,p_column_label=>'AIC No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338857100282683)
,p_db_column_name=>'PAR_CR_AVL_STATUS'
,p_display_order=>1270
,p_column_identifier=>'GC'
,p_column_label=>'AIC Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878503176987169)
,p_db_column_name=>'PAR_CURRENCY'
,p_display_order=>130
,p_column_identifier=>'BS'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336229342282657)
,p_db_column_name=>'PAR_CUST_AREA'
,p_display_order=>1010
,p_column_identifier=>'FC'
,p_column_label=>'Par Cust Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338457480282679)
,p_db_column_name=>'PAR_DAIRY_CAN_ID'
,p_display_order=>1230
,p_column_identifier=>'FY'
,p_column_label=>'Par Dairy Can Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338234201282677)
,p_db_column_name=>'PAR_DAIRY_COC_ID'
,p_display_order=>1210
,p_column_identifier=>'FW'
,p_column_label=>'Par Dairy Coc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338322474282678)
,p_db_column_name=>'PAR_DAIRY_ROUTE_ID'
,p_display_order=>1220
,p_column_identifier=>'FX'
,p_column_label=>'Par Dairy Route Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337593259282670)
,p_db_column_name=>'PAR_DEV_AMT'
,p_display_order=>1140
,p_column_identifier=>'FP'
,p_column_label=>'Deviation Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337258248282667)
,p_db_column_name=>'PAR_DEV_EXISTS'
,p_display_order=>1110
,p_column_identifier=>'FM'
,p_column_label=>'Deviation Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337404089282669)
,p_db_column_name=>'PAR_DEV_SI_DOC_NO'
,p_display_order=>1130
,p_column_identifier=>'FO'
,p_column_label=>'Deviation Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337353468282668)
,p_db_column_name=>'PAR_DEV_STATUS'
,p_display_order=>1120
,p_column_identifier=>'FN'
,p_column_label=>'Deviation Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331280336282657)
,p_db_column_name=>'PAR_DFLT_PAY_THRU'
,p_display_order=>510
,p_column_identifier=>'DE'
,p_column_label=>'Pay Thru.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336641268282661)
,p_db_column_name=>'PAR_DIV_ID'
,p_display_order=>1050
,p_column_identifier=>'FG'
,p_column_label=>'Par Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540983384479352)
,p_db_column_name=>'PAR_DOC_DATE'
,p_display_order=>1460
,p_column_identifier=>'GV'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878826756987172)
,p_db_column_name=>'PAR_DOC_NO'
,p_display_order=>160
,p_column_identifier=>'BV'
,p_column_label=>'Par Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060878914549987173)
,p_db_column_name=>'PAR_DOC_PERIOD'
,p_display_order=>170
,p_column_identifier=>'BW'
,p_column_label=>'Par Doc Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334867512282643)
,p_db_column_name=>'PAR_DOC_SEL_MODE'
,p_display_order=>870
,p_column_identifier=>'EO'
,p_column_label=>'Par Doc Sel Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879068822987174)
,p_db_column_name=>'PAR_DOC_TYPE'
,p_display_order=>180
,p_column_identifier=>'BX'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879194794987175)
,p_db_column_name=>'PAR_DOC_YEAR'
,p_display_order=>190
,p_column_identifier=>'BY'
,p_column_label=>'Par Doc Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879258984987176)
,p_db_column_name=>'PAR_DR_CR'
,p_display_order=>200
,p_column_identifier=>'BZ'
,p_column_label=>' Dr/ Cr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334479877282639)
,p_db_column_name=>'PAR_DUE_STATUS'
,p_display_order=>830
,p_column_identifier=>'EK'
,p_column_label=>'Due Status'
,p_column_html_expression=>' <div style="color:#DUE_STATUS_COLOR#; font-weight:bold;">#PAR_DUE_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879368615987177)
,p_db_column_name=>'PAR_EXCHANGE_RATE'
,p_display_order=>210
,p_column_identifier=>'CA'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_EXCH_RT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337010892282665)
,p_db_column_name=>'PAR_GRN_REFERENCE'
,p_display_order=>1090
,p_column_identifier=>'FK'
,p_column_label=>'GRN Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338921160282684)
,p_db_column_name=>'PAR_GST_AGED_DAYS'
,p_display_order=>1280
,p_column_identifier=>'GD'
,p_column_label=>'GST Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334918239282644)
,p_db_column_name=>'PAR_HOLD_PARTY'
,p_display_order=>880
,p_column_identifier=>'EP'
,p_column_label=>'Hold Partner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334267162282637)
,p_db_column_name=>'PAR_HOLD_PAY'
,p_display_order=>810
,p_column_identifier=>'EI'
,p_column_label=>'Hold Bill'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879596124987179)
,p_db_column_name=>'PAR_INPROG_AMT'
,p_display_order=>230
,p_column_identifier=>'CC'
,p_column_label=>'Par Inprog Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879691200987180)
,p_db_column_name=>'PAR_JRNL_FLAG'
,p_display_order=>240
,p_column_identifier=>'CD'
,p_column_label=>'Par Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879786069987181)
,p_db_column_name=>'PAR_ORD_PLANT'
,p_display_order=>250
,p_column_identifier=>'CE'
,p_column_label=>'Par Ord Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335472950282649)
,p_db_column_name=>'PAR_PARENT_ID'
,p_display_order=>930
,p_column_identifier=>'EU'
,p_column_label=>'Parent ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879815481987182)
,p_db_column_name=>'PAR_PAY_TYPE'
,p_display_order=>260
,p_column_identifier=>'CF'
,p_column_label=>'Par Pay Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060880090249987184)
,p_db_column_name=>'PAR_PLANT'
,p_display_order=>280
,p_column_identifier=>'CH'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT_DESC#">#PAR_PLANT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060880179609987185)
,p_db_column_name=>'PAR_PLNT_LOC_ID'
,p_display_order=>290
,p_column_identifier=>'CI'
,p_column_label=>'Par Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080539494418479337)
,p_db_column_name=>'PAR_PROJ_DESC'
,p_display_order=>1310
,p_column_identifier=>'GG'
,p_column_label=>'Proj. Lvl Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060880231822987186)
,p_db_column_name=>'PAR_PROJ_ID'
,p_display_order=>300
,p_column_identifier=>'CJ'
,p_column_label=>'Proj. Lvl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337679086282671)
,p_db_column_name=>'PAR_PUR_RET_CRE_FLAG'
,p_display_order=>1150
,p_column_identifier=>'FQ'
,p_column_label=>'Pur. Rej. Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337801893282672)
,p_db_column_name=>'PAR_PUR_RET_DOC_NO'
,p_display_order=>1160
,p_column_identifier=>'FR'
,p_column_label=>'Pur. Rej. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338090632282675)
,p_db_column_name=>'PAR_PUR_RET_INV_NO'
,p_display_order=>1190
,p_column_identifier=>'FU'
,p_column_label=>'Par Pur Ret Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337999330282674)
,p_db_column_name=>'PAR_PUR_RET_INV_PFX'
,p_display_order=>1180
,p_column_identifier=>'FT'
,p_column_label=>'Par Pur Ret Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337899603282673)
,p_db_column_name=>'PAR_PUR_STATUS'
,p_display_order=>1170
,p_column_identifier=>'FS'
,p_column_label=>'Pur. Rej.  Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334695423282641)
,p_db_column_name=>'PAR_PYMT_EXCP'
,p_display_order=>850
,p_column_identifier=>'EM'
,p_column_label=>'Exceptions'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335504095282650)
,p_db_column_name=>'PAR_REF_BU'
,p_display_order=>940
,p_column_identifier=>'EV'
,p_column_label=>'Par Ref Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335754831282652)
,p_db_column_name=>'PAR_REF_INV_NO'
,p_display_order=>960
,p_column_identifier=>'EX'
,p_column_label=>'Par Ref Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335697253282651)
,p_db_column_name=>'PAR_REF_INV_PFX'
,p_display_order=>950
,p_column_identifier=>'EW'
,p_column_label=>'Par Ref Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335868712282653)
,p_db_column_name=>'PAR_REF_PLNT'
,p_display_order=>970
,p_column_identifier=>'EY'
,p_column_label=>'Par Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080338164293282676)
,p_db_column_name=>'PAR_REJ_VAL_AMT'
,p_display_order=>1200
,p_column_identifier=>'FV'
,p_column_label=>'Pur. Rej. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329294288282637)
,p_db_column_name=>'PAR_RTN_REASON'
,p_display_order=>310
,p_column_identifier=>'CK'
,p_column_label=>'Par Rtn Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336004400282655)
,p_db_column_name=>'PAR_SALES_PERSON'
,p_display_order=>990
,p_column_identifier=>'FA'
,p_column_label=>'Par Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336338611282658)
,p_db_column_name=>'PAR_SALES_TERR'
,p_display_order=>1020
,p_column_identifier=>'FD'
,p_column_label=>'Par Sales Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329372748282638)
,p_db_column_name=>'PAR_SC_BAL_AMT'
,p_display_order=>320
,p_column_identifier=>'CL'
,p_column_label=>'Doc. Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329439806282639)
,p_db_column_name=>'PAR_SC_MAT_AMT'
,p_display_order=>330
,p_column_identifier=>'CM'
,p_column_label=>'Par Sc Mat Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329527401282640)
,p_db_column_name=>'PAR_SC_PROC_AMT'
,p_display_order=>340
,p_column_identifier=>'CN'
,p_column_label=>'Pay Inprog.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329642852282641)
,p_db_column_name=>'PAR_SC_TOT_AMT'
,p_display_order=>350
,p_column_identifier=>'CO'
,p_column_label=>'Bill Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334727824282642)
,p_db_column_name=>'PAR_SO_REF'
,p_display_order=>860
,p_column_identifier=>'EN'
,p_column_label=>'Par So Ref'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329746638282642)
,p_db_column_name=>'PAR_SRC_ACCT_TYPE'
,p_display_order=>360
,p_column_identifier=>'CP'
,p_column_label=>'Par Src Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080329956142282644)
,p_db_column_name=>'PAR_SRC_DOC_NO'
,p_display_order=>380
,p_column_identifier=>'CR'
,p_column_label=>'Par Src Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330056823282645)
,p_db_column_name=>'PAR_SRC_DOC_PFX'
,p_display_order=>390
,p_column_identifier=>'CS'
,p_column_label=>'Par Src Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330104832282646)
,p_db_column_name=>'PAR_SRC_DOC_TYPE'
,p_display_order=>400
,p_column_identifier=>'CT'
,p_column_label=>'Par Src Doc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330254417282647)
,p_db_column_name=>'PAR_SRC_OFFSET_DOC_NO'
,p_display_order=>410
,p_column_identifier=>'CU'
,p_column_label=>'Par Src Offset Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330390557282648)
,p_db_column_name=>'PAR_STATUS'
,p_display_order=>420
,p_column_identifier=>'CV'
,p_column_label=>'Par Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337000128282664)
,p_db_column_name=>'PAR_STR_MNGR_ID'
,p_display_order=>1080
,p_column_identifier=>'FJ'
,p_column_label=>'Par Str Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336519677282660)
,p_db_column_name=>'PAR_SUB_DIV_ID'
,p_display_order=>1040
,p_column_identifier=>'FF'
,p_column_label=>'Par Sub Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336437208282659)
,p_db_column_name=>'PAR_SUB_TERR'
,p_display_order=>1030
,p_column_identifier=>'FE'
,p_column_label=>'Par Sub Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540069299479343)
,p_db_column_name=>'PAR_SUPLR_DOC_DATE'
,p_display_order=>1370
,p_column_identifier=>'GM'
,p_column_label=>'Bill Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330544706282650)
,p_db_column_name=>'PAR_SUPLR_DOC_NO'
,p_display_order=>440
,p_column_identifier=>'CX'
,p_column_label=>'Bill No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330679620282651)
,p_db_column_name=>'PAR_SUPLR_ID'
,p_display_order=>450
,p_column_identifier=>'CY'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334524725282640)
,p_db_column_name=>'PAR_SUPLR_NAME'
,p_display_order=>840
,p_column_identifier=>'EL'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330731832282652)
,p_db_column_name=>'PAR_SUPLR_REFERENCE'
,p_display_order=>460
,p_column_identifier=>'CZ'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330840554282653)
,p_db_column_name=>'PAR_SYS_DOC'
,p_display_order=>470
,p_column_identifier=>'DA'
,p_column_label=>'Par Sys Doc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336146119282656)
,p_db_column_name=>'PAR_TAX_AMT'
,p_display_order=>1000
,p_column_identifier=>'FB'
,p_column_label=>'Tax Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9060879443177987178)
,p_db_column_name=>'PAR_TERM_ID'
,p_display_order=>220
,p_column_identifier=>'CB'
,p_column_label=>'Par Term Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080336816533282663)
,p_db_column_name=>'PAR_TR_MNGR_ID'
,p_display_order=>1070
,p_column_identifier=>'FI'
,p_column_label=>'Par Tr Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334080786282685)
,p_db_column_name=>'PAR_TYPE'
,p_display_order=>790
,p_column_identifier=>'EG'
,p_column_label=>'Par Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080330989167282654)
,p_db_column_name=>'PAR_UPD_BY'
,p_display_order=>480
,p_column_identifier=>'DB'
,p_column_label=>'Par Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331061536282655)
,p_db_column_name=>'PAR_UPD_DATE'
,p_display_order=>490
,p_column_identifier=>'DC'
,p_column_label=>'Par Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331150429282656)
,p_db_column_name=>'PAR_USER'
,p_display_order=>500
,p_column_identifier=>'DD'
,p_column_label=>'Par User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080334202075282686)
,p_db_column_name=>'PAR_VOU_TYPE'
,p_display_order=>800
,p_column_identifier=>'EH'
,p_column_label=>'Par Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540579566479348)
,p_db_column_name=>'PAY_AMT'
,p_display_order=>1420
,p_column_identifier=>'GR'
,p_column_label=>'Pay Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331413106282659)
,p_db_column_name=>'PDD_BAL_AMT'
,p_display_order=>530
,p_column_identifier=>'DG'
,p_column_label=>'Due Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331312936282658)
,p_db_column_name=>'PDD_BU'
,p_display_order=>520
,p_column_identifier=>'DF'
,p_column_label=>'Pdd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331601926282660)
,p_db_column_name=>'PDD_CHECK_FLAG'
,p_display_order=>540
,p_column_identifier=>'DH'
,p_column_label=>'Pdd Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333912256282684)
,p_db_column_name=>'PDD_CLAIM_TYPE'
,p_display_order=>780
,p_column_identifier=>'EF'
,p_column_label=>'Pdd Claim Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080539559095479338)
,p_db_column_name=>'PDD_CRE_BY'
,p_display_order=>1320
,p_column_identifier=>'GH'
,p_column_label=>'Pdd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080539687597479339)
,p_db_column_name=>'PDD_CRE_DATE'
,p_display_order=>1330
,p_column_identifier=>'GI'
,p_column_label=>'Pdd Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331835418282663)
,p_db_column_name=>'PDD_DATE_TYPE'
,p_display_order=>570
,p_column_identifier=>'DK'
,p_column_label=>'Pdd Date Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080331994910282664)
,p_db_column_name=>'PDD_DISC_PCT'
,p_display_order=>580
,p_column_identifier=>'DL'
,p_column_label=>'Pdd Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332077773282665)
,p_db_column_name=>'PDD_DOC_NO'
,p_display_order=>590
,p_column_identifier=>'DM'
,p_column_label=>'Pdd Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332153162282666)
,p_db_column_name=>'PDD_DUE_AMT'
,p_display_order=>600
,p_column_identifier=>'DN'
,p_column_label=>'Due Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540121910479344)
,p_db_column_name=>'PDD_DUE_DATE'
,p_display_order=>1380
,p_column_identifier=>'GN'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332401809282668)
,p_db_column_name=>'PDD_DUE_DAYS'
,p_display_order=>620
,p_column_identifier=>'DP'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332447256282669)
,p_db_column_name=>'PDD_DUE_PCT'
,p_display_order=>630
,p_column_identifier=>'DQ'
,p_column_label=>'Pdd Due Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332593945282670)
,p_db_column_name=>'PDD_DUE_TYPE'
,p_display_order=>640
,p_column_identifier=>'DR'
,p_column_label=>'Pdd Due Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332753323282672)
,p_db_column_name=>'PDD_INT_PCT'
,p_display_order=>660
,p_column_identifier=>'DT'
,p_column_label=>'Pdd Int Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332697011282671)
,p_db_column_name=>'PDD_IN_PROGRESS'
,p_display_order=>650
,p_column_identifier=>'DS'
,p_column_label=>'Pay InProg.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332825283282673)
,p_db_column_name=>'PDD_MS_DATE'
,p_display_order=>670
,p_column_identifier=>'DU'
,p_column_label=>'Pdd Ms Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080332914420282674)
,p_db_column_name=>'PDD_MS_ID'
,p_display_order=>680
,p_column_identifier=>'DV'
,p_column_label=>'Pdd Ms Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333009844282675)
,p_db_column_name=>'PDD_PART_PAY_DISC_FLAG'
,p_display_order=>690
,p_column_identifier=>'DW'
,p_column_label=>'Pdd Part Pay Disc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333194530282676)
,p_db_column_name=>'PDD_PAY_AMT'
,p_display_order=>700
,p_column_identifier=>'DX'
,p_column_label=>'Pdd Pay Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333345666282678)
,p_db_column_name=>'PDD_PLANT'
,p_display_order=>720
,p_column_identifier=>'DZ'
,p_column_label=>'Pdd Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333439226282679)
,p_db_column_name=>'PDD_RESP_EMP_ID'
,p_display_order=>730
,p_column_identifier=>'EA'
,p_column_label=>'Pdd Resp Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333557523282680)
,p_db_column_name=>'PDD_SEQ_NO'
,p_display_order=>740
,p_column_identifier=>'EB'
,p_column_label=>'Due No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080335035526282645)
,p_db_column_name=>'PDD_TEMP_PAY_AMT'
,p_display_order=>890
,p_column_identifier=>'EQ'
,p_column_label=>'Pdd Temp Pay Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080539795814479340)
,p_db_column_name=>'PDD_UPD_BY'
,p_display_order=>1340
,p_column_identifier=>'GJ'
,p_column_label=>'Pdd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080539885677479341)
,p_db_column_name=>'PDD_UPD_DATE'
,p_display_order=>1350
,p_column_identifier=>'GK'
,p_column_label=>'Pdd Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080333825843282683)
,p_db_column_name=>'PDD_USER'
,p_display_order=>770
,p_column_identifier=>'EE'
,p_column_label=>'Pdd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080339124745282686)
,p_db_column_name=>'PLANT_LOCATION_DEC'
,p_display_order=>1300
,p_column_identifier=>'GF'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080540848157479351)
,p_db_column_name=>'SRC_DOC_NO'
,p_display_order=>1450
,p_column_identifier=>'GU'
,p_column_label=>'Sou. Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080337171697282666)
,p_db_column_name=>'SUPLR_MSME_TYPE'
,p_display_order=>1100
,p_column_identifier=>'FL'
,p_column_label=>'MSME Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9824823360135791060)
,p_db_column_name=>'TERM_DESC'
,p_display_order=>1490
,p_column_identifier=>'GY'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9080541191326479354)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>1480
,p_column_identifier=>'GX'
,p_column_label=>'Unit Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9820672742141049808)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3361226'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_PLANT:PAR_BU:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PDD_DUE_DATE:PDD_DUE_DAYS:PAR_GST_AGED_DAYS:PAR_DUE_STATUS:PAR_DR_CR:PAR_SC_TOT_AMT:PAR_TAX_AMT:BAL_AMT_BC:BAL_AMT_TC:PAR_BFCRY_TYPE:DOC_NO:PAR_DOC_TYPE:LOC'
||'ATION_DESC:PAR_PYMT_EXCP:PAR_SUPLR_REFERENCE:PAR_PARENT_ID:SUPLR_MSME_TYPE:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_DFLT_PAY_THRU:PAR_EXCHANGE_RATE:PAR_PROJ_ID:PAR_PROJ_DESC:PAR_CR_AVL_STATUS:PAR_CR_AVL_NO:PAR_CR_AVL_DATE:PAR_HOLD_PARTY:PAR_HOLD_PAY:SRC_DO'
||'C_NO:PAR_DOC_DATE:ACCT_TYPE_DESC:PAR_GRN_REFERENCE:PAR_DEV_EXISTS:PAR_DEV_SI_DOC_NO:PAR_DEV_AMT:PAR_DEV_STATUS:PAR_PUR_RET_CRE_FLAG:PAR_PUR_RET_DOC_NO:PAR_REJ_VAL_AMT:PAR_PUR_STATUS:PDD_SEQ_NO:PDD_DUE_AMT:PDD_BAL_AMT:PDD_IN_PROGRESS:TERM_DESC'
,p_sort_column_1=>'AJ_JRNL_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'AJ_VOU_NO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'SEQ_NO'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'AJHV_BC_DB_AMT:AJHV_BC_CR_AMT:DB_AMT:CR_AMT'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9088193070943608198)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Supplier Wise'
,p_report_seq=>10
,p_report_alias=>'5019782'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_BU:PLANT_LOCATION_DEC:PAR_PLANT:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PDD_DUE_DATE:PDD_DUE_DAYS:PAR_GST_AGED_DAYS:PAR_DUE_STATUS:PAR_DR_CR:PAR_SC_TOT_AMT:PAR_TAX_AMT:BAL_AMT_BC:BAL_AMT_TC:PAR_BFCRY_TYPE:DOC_'
||'NO:PAR_DOC_TYPE:LOCATION_DESC:PAR_PYMT_EXCP:PAR_SUPLR_REFERENCE:PAR_PARENT_ID:SUPLR_MSME_TYPE:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_DFLT_PAY_THRU:PAR_EXCHANGE_RATE:PAR_PROJ_ID:PAR_PROJ_DESC:PAR_CR_AVL_STATUS:PAR_CR_AVL_NO:PAR_CR_AVL_DATE:PAR_HOLD_PARTY:'
||'PAR_HOLD_PAY:SRC_DOC_NO:PAR_DOC_DATE:ACCT_TYPE_DESC:PAR_GRN_REFERENCE:PAR_DEV_EXISTS:PAR_DEV_SI_DOC_NO:PAR_DEV_AMT:PAR_DEV_STATUS:PAR_PUR_RET_CRE_FLAG:PAR_PUR_RET_DOC_NO:PAR_REJ_VAL_AMT:PAR_PUR_STATUS:PDD_SEQ_NO:PDD_DUE_AMT:PDD_BAL_AMT:PDD_IN_PROGRES'
||'S'
,p_sort_column_1=>'AJ_JRNL_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'AJ_VOU_NO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'SEQ_NO'
,p_sort_direction_3=>'ASC'
,p_break_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
,p_break_enabled_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
,p_sum_columns_on_break=>'AJHV_BC_DB_AMT:AJHV_BC_CR_AMT:DB_AMT:CR_AMT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11106629064013904490)
,p_plug_name=>'Pending Receivable'
,p_static_id=>'pending-receivable'
,p_region_name=>'PRAA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       SELECT par_bu,',
'         (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = par_bu)',
'            par_bu_desc,',
'         (SELECT bupld_loc_name',
'            FROM bus_unit_plants_loc_dtls',
'           WHERE bupld_bu = par_bu AND bupld_loc_id = PAR_PLNT_LOC_ID)',
'            par_plnt_loc_desc,',
'         pdd_user,',
'         par_suplr_name,',
'         par_suplr_doc_no,',
'         to_char(par_suplr_doc_date,''&GLOBAL_RPT_DATE_MASK.'')par_suplr_doc_date,',
'         par_plant,',
'         (SELECT NVL (bup_name2, bup_name1) unit',
'            FROM bus_unit_plants',
'           WHERE bup_bu = par_bu AND bup_plant_id = par_plant)',
'            Unit_desc,',
'         CASE',
'            WHEN PAR_LOC_NAME IS NOT NULL AND par_bfcry_type = ''S''',
'            THEN',
'               (SELECT ssl_loc_name1',
'                  FROM suplr_ship_loc',
'                 WHERE     ssl_bu = :Global_bu',
'                       AND SSL_LOC_NAME1 = PAR_LOC_NAME',
'                       AND ssl_suplr_id = par_suplr_id)',
'            WHEN PAR_LOC_NAME IS NOT NULL AND par_bfcry_type = ''C''',
'            THEN',
'                (SELECT ssl_loc_name1',
'                  FROM suplr_ship_loc',
'                 WHERE     ssl_bu = :Global_bu',
'                       AND SSL_LOC_NAME1 = PAR_LOC_NAME',
'                       AND ssl_suplr_id = par_suplr_id)',
'         END',
'            location_desc,',
'         par_currency,',
'         to_char(par_doc_date,''&GLOBAL_RPT_DATE_MASK.'')par_doc_date,',
'         DECODE (par_dr_cr,  ''DR'', ''Dr'',  ''CR'', ''Cr'') par_dr_cr,',
'         DECODE (par_bfcry_type,  ''S'', ''Supplier'',  ''C'', ''Customer'')par_bfcry_type,',
'          DECODE (par_doc_type,',
'                 ''CM'', ''Credit Note'',',
'                 ''DM'', ''Debit Note'',',
'                 ''I'', ''Invoice'',',
'                 ''P'', ''Payment'',',
'                 ''LG'',''Letter Of Guarantee'',',
'                 ''LC'',''Letter Of Credit'',',
'                 ''O'',''Others'')',
'            par_doc_type,',
'         (SELECT atc_disp_desc',
'            FROM acct_type_codes',
'           WHERE atc_bu = par_bu AND atc_code = PAR_ACCT_TYPE)',
'            PAR_ACCT_TYPE_DESC,',
'         par_aged_days,',
'         to_char(pdd_due_date,''&GLOBAL_RPT_DATE_MASK.'')pdd_due_date,',
'         par_sc_tot_amt,',
'         pdd_pay_amt,',
'         pdd_bal_amt - (NVL (pdd_in_progress, 0)) bal_amt,',
'         (pdd_bal_amt - (NVL (pdd_in_progress, 0)) * par_exchange_rate)',
'            bal_amt_bc,',
'         CASE',
'            WHEN pdd_check_flag <> ''Y''',
'            THEN',
'               pdd_bal_amt - (NVL (pdd_in_progress, 0))',
'            ELSE',
'               pdd_pay_amt',
'         END',
'            pay_amt,',
'         CASE',
'            WHEN par_src_doc_pfx IS NOT NULL',
'            THEN',
'               par_src_doc_pfx || ''/'' || par_src_doc_no',
'            ELSE',
'               par_src_doc_no',
'         END',
'            src_doc_no,',
'         CASE',
'            WHEN par_pfx IS NOT NULL THEN par_pfx || ''/'' || par_doc_no',
'            ELSE par_doc_no',
'         END',
'            par_pfx_doc_no,',
'         par_suplr_id,',
'         par_src_doc_pfx,',
'         par_src_doc_no,',
'         par_pymt_excp,',
'         par_suplr_reference,',
'         par_pfx,',
'         par_sc_bal_amt,',
'         par_sc_proc_amt,',
'         par_exchange_rate,',
'         par_parent_id,',
'         par_so_ref,',
'         pdd_seq_no,',
'         pdd_in_progress,',
'         pdd_due_amt,',
'         pdd_bal_amt,',
'         par_proj_id,',
'         (SELECT glp_prj_name desc_lvl',
'            FROM gl_lvl_prj',
'           WHERE glp_bu = par_bu AND glp_prj_id = PAR_PROJ_ID)',
'            par_proj_id_desc,',
'         (SELECT sa_area_desc1',
'            FROM sales_areas',
'           WHERE sa_bu = par_bu AND sa_area = PAR_CUST_AREA)',
'            par_cust_area_desc,',
'         (SELECT sat_terr_desc1',
'            FROM sales_area_terr',
'           WHERE sat_bu = par_bu AND sat_terr_id = PAR_SALES_TERR)',
'            par_sales_terr_desc,',
'         (SELECT sst_desc1',
'            FROM sales_sub_terr',
'           WHERE sst_bu = par_bu AND sst_sub_terr_id = PAR_SUB_TERR)',
'            par_sub_terr_desc,',
'         (SELECT NVL (sp_person_name2, sp_person_name1)',
'            FROM sales_persons',
'           WHERE sp_bu = par_bu AND sp_person = par_sales_person)',
'            sales_person_name,',
'         (SELECT cpsd_sub_div_name',
'            FROM crm_prod_sub_div',
'           WHERE cpsd_bu = par_bu AND cpsd_sub_div_id = PAR_SUB_DIV_ID)',
'            par_sub_div_id_desc,',
'         (SELECT (DECODE (',
'                     (SELECT applctrl_desc_level',
'                        FROM appl_control',
'                       WHERE applctrl_bu = par_bu),',
'                     1,    LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)),',
'                     NVL (',
'                           LTRIM (RTRIM (emp_first_name2))',
'                        || LTRIM (RTRIM (emp_middle_name2))',
'                        || LTRIM (RTRIM (emp_last_name2)),',
'                           LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)))))',
'                    emp_name',
'            FROM employees',
'           WHERE emp_bu = par_bu AND emp_emp_id = PAR_AREA_MNGR_ID)',
'            par_area_mngr_id_desc,',
'         (SELECT (DECODE (',
'                     (SELECT applctrl_desc_level',
'                        FROM appl_control',
'                       WHERE applctrl_bu = par_bu),',
'                     1,    LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)),',
'                     NVL (',
'                           LTRIM (RTRIM (emp_first_name2))',
'                        || LTRIM (RTRIM (emp_middle_name2))',
'                        || LTRIM (RTRIM (emp_last_name2)),',
'                           LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)))))',
'                    emp_name',
'            FROM employees',
'           WHERE emp_bu = par_bu AND emp_emp_id = PAR_TR_MNGR_ID)',
'            par_tr_mngr_id_desc,',
'         (SELECT (DECODE (',
'                     (SELECT applctrl_desc_level',
'                        FROM appl_control',
'                       WHERE applctrl_bu = par_bu),',
'                     1,    LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)),',
'                     NVL (',
'                           LTRIM (RTRIM (emp_first_name2))',
'                        || LTRIM (RTRIM (emp_middle_name2))',
'                        || LTRIM (RTRIM (emp_last_name2)),',
'                           LTRIM (RTRIM (emp_first_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_middle_name1))',
'                        || '' ''',
'                        || LTRIM (RTRIM (emp_last_name1)))))',
'                    emp_name',
'            FROM employees',
'           WHERE emp_bu = par_bu AND emp_emp_id = PAR_STR_MNGR_ID)',
'            par_str_mngr_id_desc',
'    FROM PENDING_RECEIVABLES_VW_HIST',
'   WHERE     par_bu = :global_bu',
'         AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'         AND (pdd_bal_amt - pdd_in_progress) > 0',
'         AND PAR_PLANT IN (SELECT plant_id',
'                             FROM (SELECT AUBA_PLANT plant_id',
'                                     FROM APPL_USER_PLANT_ACCESS, arm_control',
'                                    WHERE AUBA_BU = par_bu',
'                                          AND AUBA_USER_ID = :global_user',
'                                          AND TRUNC (SYSDATE) BETWEEN TRUNC (',
'                                                                         AUBA_FROM)',
'                                                                  AND TRUNC (',
'                                                                         AUBA_TO)',
'                                          AND ARMC_BU = AUBA_BU',
'                                         -- AND ARMC_SHW_PLNT_ACCESS_FLG = ''Y''',
'                                   UNION ALL',
'                                   SELECT BUP_PLANT_ID plant_id',
'                                     FROM bus_unit_plants, arm_control',
'                                    WHERE     BUP_BU = par_bu',
'                                          AND ARMC_BU = BUP_BU',
'                                          --AND ARMC_SHW_PLNT_ACCESS_FLG = ''N''',
'                                          ))',
'         AND INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0',
'    AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', par_plant || '':'') > 0)AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)',
'ORDER BY par_aged_days DESC, pdd_seq_no, par_suplr_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_DUMMY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Receivable'
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
 p_id=>wwv_flow_imp.id(11106629243233904491)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5624667407690293463
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586510767935972)
,p_db_column_name=>'BAL_AMT'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586632446935973)
,p_db_column_name=>'BAL_AMT_BC'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Bal. Amt. (BC)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586907161935976)
,p_db_column_name=>'LOCATION_DESC'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587181735935979)
,p_db_column_name=>'PAR_ACCT_TYPE_DESC'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Acct. Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117544490230862770)
,p_db_column_name=>'PAR_AGED_DAYS'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801647473341949)
,p_db_column_name=>'PAR_AREA_MNGR_ID_DESC'
,p_display_order=>1110
,p_column_identifier=>'DG'
,p_column_label=>'Area Mgr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117802250261341955)
,p_db_column_name=>'PAR_BFCRY_TYPE'
,p_display_order=>1170
,p_column_identifier=>'DM'
,p_column_label=>'Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587346413935980)
,p_db_column_name=>'PAR_BU'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Entity'
,p_column_html_expression=>'<span title="#PAR_BU_DESC#">#PAR_BU#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587378727935981)
,p_db_column_name=>'PAR_BU_DESC'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Entity Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117537960692862754)
,p_db_column_name=>'PAR_CURRENCY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Curr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588739525935994)
,p_db_column_name=>'PAR_CUST_AREA_DESC'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801993815341953)
,p_db_column_name=>'PAR_DOC_DATE'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117802276266341956)
,p_db_column_name=>'PAR_DOC_TYPE'
,p_display_order=>1180
,p_column_identifier=>'DN'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117538570742862761)
,p_db_column_name=>'PAR_DR_CR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Dr/ Cr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587853824935985)
,p_db_column_name=>'PAR_EXCHANGE_RATE'
,p_display_order=>970
,p_column_identifier=>'CS'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_EXCH_RT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587888635935986)
,p_db_column_name=>'PAR_PARENT_ID'
,p_display_order=>980
,p_column_identifier=>'CT'
,p_column_label=>'Parent'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117539356366862768)
,p_db_column_name=>'PAR_PFX'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Par Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586976670935977)
,p_db_column_name=>'PAR_PFX_DOC_NO'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Par. Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117894211145704663)
,p_db_column_name=>'PAR_PLANT'
,p_display_order=>1200
,p_column_identifier=>'DP'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT_DESC#">#PAR_PLANT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586459334935971)
,p_db_column_name=>'PAR_PLNT_LOC_DESC'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Unit Loc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588539040935992)
,p_db_column_name=>'PAR_PROJ_ID'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Project Lvl.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588613122935993)
,p_db_column_name=>'PAR_PROJ_ID_DESC'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Project Lvl. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117544724387862772)
,p_db_column_name=>'PAR_PYMT_EXCP'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Exceptions'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588819583935995)
,p_db_column_name=>'PAR_SALES_TERR_DESC'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Terr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587571281935983)
,p_db_column_name=>'PAR_SC_BAL_AMT'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587696552935984)
,p_db_column_name=>'PAR_SC_PROC_AMT'
,p_display_order=>960
,p_column_identifier=>'CR'
,p_column_label=>'Pay Inprog.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117539994970862775)
,p_db_column_name=>'PAR_SC_TOT_AMT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Inv. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587983900935987)
,p_db_column_name=>'PAR_SO_REF'
,p_display_order=>990
,p_column_identifier=>'CU'
,p_column_label=>'SO Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117540321648862778)
,p_db_column_name=>'PAR_SRC_DOC_NO'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Par Src Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117540364024862779)
,p_db_column_name=>'PAR_SRC_DOC_PFX'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Par Src Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801848834341951)
,p_db_column_name=>'PAR_STR_MNGR_ID_DESC'
,p_display_order=>1130
,p_column_identifier=>'DI'
,p_column_label=>'Sub Terr. Mgr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801556448341948)
,p_db_column_name=>'PAR_SUB_DIV_ID_DESC'
,p_display_order=>1100
,p_column_identifier=>'DF'
,p_column_label=>'Sub Div.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588905532935996)
,p_db_column_name=>'PAR_SUB_TERR_DESC'
,p_display_order=>1080
,p_column_identifier=>'DD'
,p_column_label=>'Sub Terr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801896833341952)
,p_db_column_name=>'PAR_SUPLR_DOC_DATE'
,p_display_order=>1140
,p_column_identifier=>'DJ'
,p_column_label=>'Inv. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117540955750862784)
,p_db_column_name=>'PAR_SUPLR_DOC_NO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Inv. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117541001842862785)
,p_db_column_name=>'PAR_SUPLR_ID'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117544608376862771)
,p_db_column_name=>'PAR_SUPLR_NAME'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Party  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117541148290862786)
,p_db_column_name=>'PAR_SUPLR_REFERENCE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801744816341950)
,p_db_column_name=>'PAR_TR_MNGR_ID_DESC'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'Terr. Mgr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586710554935974)
,p_db_column_name=>'PAY_AMT'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Rcpt. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588405984935991)
,p_db_column_name=>'PDD_BAL_AMT'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'Due. Bal. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588359691935990)
,p_db_column_name=>'PDD_DUE_AMT'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Due Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117802153969341954)
,p_db_column_name=>'PDD_DUE_DATE'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588236039935989)
,p_db_column_name=>'PDD_IN_PROGRESS'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Due Pay Inprog.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117543399037862759)
,p_db_column_name=>'PDD_PAY_AMT'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Pdd Pay Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117588141629935988)
,p_db_column_name=>'PDD_SEQ_NO'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Due No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117587470855935982)
,p_db_column_name=>'PDD_USER'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117801458434341947)
,p_db_column_name=>'SALES_PERSON_NAME'
,p_display_order=>1090
,p_column_identifier=>'DE'
,p_column_label=>'Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586783395935975)
,p_db_column_name=>'SRC_DOC_NO'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117586291320935970)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11117576913810864039)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4960994'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_PLANT:PAR_BU:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PAR_DR_CR:PAR_AGED_DAYS:PDD_DUE_DATE:PAR_SC_TOT_AMT:BAL_AMT_BC:BAL_AMT:PAY_AMT:PAR_BFCRY_TYPE:SRC_DOC_NO:PAR_DOC_TYPE:PAR_PYMT_EXCP:PAR_SUPLR_REFERENCE:PAR_'
||'PFX_DOC_NO:PAR_DOC_DATE:PAR_ACCT_TYPE_DESC:LOCATION_DESC:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_EXCHANGE_RATE:PAR_PARENT_ID:PAR_SO_REF:PDD_SEQ_NO:PDD_IN_PROGRESS:PDD_DUE_AMT:PDD_BAL_AMT:PAR_PROJ_ID:PAR_PROJ_ID_DESC:PDD_USER:PAR_CUST_AREA_DESC:PAR_SALES_T'
||'ERR_DESC:PAR_SUB_TERR_DESC:SALES_PERSON_NAME:PAR_SUB_DIV_ID_DESC:PAR_AREA_MNGR_ID_DESC:PAR_TR_MNGR_ID_DESC:PAR_STR_MNGR_ID_DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11123494926641888550)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Customer Wise'
,p_report_seq=>10
,p_report_alias=>'5020174'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PAR_BU:PAR_PLANT:PAR_PLNT_LOC_DESC:PAR_SUPLR_ID:PAR_SUPLR_NAME:PAR_SUPLR_DOC_NO:PAR_SUPLR_DOC_DATE:PAR_CURRENCY:PAR_DR_CR:PAR_AGED_DAYS:PDD_DUE_DATE:PAR_SC_TOT_AMT:BAL_AMT_BC:BAL_AMT:PAY_AMT:PAR_BFCRY_TYPE:SRC_DOC_NO:PAR_DOC_TYPE:PAR_PYMT_EXCP:PAR_SU'
||'PLR_REFERENCE:PAR_PFX_DOC_NO:PAR_DOC_DATE:PAR_ACCT_TYPE_DESC:LOCATION_DESC:PAR_SC_BAL_AMT:PAR_SC_PROC_AMT:PAR_EXCHANGE_RATE:PAR_PARENT_ID:PAR_SO_REF:PDD_SEQ_NO:PDD_IN_PROGRESS:PDD_DUE_AMT:PDD_BAL_AMT:PAR_PROJ_ID:PAR_PROJ_ID_DESC:PDD_USER:PAR_CUST_ARE'
||'A_DESC:PAR_SALES_TERR_DESC:PAR_SUB_TERR_DESC:SALES_PERSON_NAME:PAR_SUB_DIV_ID_DESC:PAR_AREA_MNGR_ID_DESC:PAR_TR_MNGR_ID_DESC:PAR_STR_MNGR_ID_DESC'
,p_break_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
,p_break_enabled_on=>'PAR_SUPLR_ID:PAR_SUPLR_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11117834716866348290)
,p_plug_name=>'Pending Receivable -  Advance'
,p_static_id=>'pending-receivable-advance'
,p_region_name=>'PRA'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PARD_BU,',
'       PARD_PLNT,',
'       (SELECT bup_name1 ',
'            FROM bus_unit_plants',
'            WHERE bup_bu = PARD_BU',
'            AND bup_plant_id= PARD_PLNT)Unit_Desc,',
'       PARD_DOC_NO,',
'       to_char(PARD_DOC_DATE,:GLOBAL_RPT_DATE_MASK)PARD_DOC_DATE,',
'       PARD_PARTY_TYPE,',
'       PARD_PARTY_ID,',
'       (SELECT SUPLR_NAME1',
'         FROM SUPPLIERS',
'          WHERE SUPLR_BU =PARD_BU',
'            AND SUPLR_SUPLR_ID =PARD_PARTY_ID',
'            AND SUPLR_PARTY_TYPE =''C'') Party_name,',
'        DECODE(PARD_ORD_TYPE,''SO'',''Sales Order'',''PI'',''Proforma Invoice'',''WO'',''Work Order'',''M'',''Misc.'')PARD_ORD_TYPE,',
'       PARD_ORD_PFX,',
'       PARD_ORD_NO,',
'       PARD_CURCY_ID,',
'       PARD_ORD_AMT,',
'       PARD_RCT_AMT,',
'       PARD_RCT_INPROG_AMT,',
'       PARD_PROP_ADV_PCT,',
'       PARD_PROP_ADV_AMT,',
'       PARD_EXCHANGE_RATE,',
'       PARD_LOC_ID,',
'       (SELECT bupld_loc_name',
'    FROM bus_unit_plants_loc_dtls',
'   WHERE bupld_bu  = PARD_BU',
'	   AND bupld_plnt = PARD_PLNT',
'	   AND bupld_loc_id = PARD_LOC_ID)Loc_desc,',
'       PARD_PI_PFX,',
'       PARD_PI_NO,',
'       CASE',
'            WHEN PARD_PI_PFX IS NOT NULL',
'            THEN',
'               PARD_PI_PFX || ''/'' || PARD_PI_NO',
'            ELSE',
'               PARD_PI_NO',
'         END',
'            PARD_PI_PFX_NO,',
'       PARD_CLOSE_AMT,',
'       PARD_NARR,',
'       PARD_PROJ_ID,',
'       (SELECT glp_prj_name prj_name1',
'		  FROM gl_lvl_prj',
'		 WHERE     glp_bu = pard_bu',
'             AND glp_prj_id = PARD_PROJ_ID)proj_id_desc,',
'       PARD_PRJ_TSK_ID,',
'       PARD_PLNT_LOC_ID',
'  from PEND_ADV_RCT_DOC',
'  where PARD_BU = :GLOBAL_BU ',
'  AND (pard_prop_adv_amt - (pard_rct_amt + pard_rct_inprog_amt)) > 0 ',
'  AND PARD_STATUS =''P''',
'  AND INSTR (:P34131010_UNIT || '':'', pard_plnt || '':'') > 0',
'    AND ( (NVL (:P34131010_UNIT, ''0'') = ''0''OR INSTR (:P34131010_UNIT || '':'', pard_plnt || '':'') > 0)',
'    AND :P34131010_DUMMY = 0 OR :P34131010_DUMMY = 1)',
'  order by TO_NUMBER(PARD_DOC_NO) ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34131010_UNIT,P34131010_DUMMY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Receivable -  Advance'
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
 p_id=>wwv_flow_imp.id(11117834856411348291)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5635873020867737263
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117926157057710992)
,p_db_column_name=>'LOC_DESC'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117834957089348292)
,p_db_column_name=>'PARD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pard Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925103882710982)
,p_db_column_name=>'PARD_CLOSE_AMT'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Pard Close Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835810688348301)
,p_db_column_name=>'PARD_CURCY_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Curr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117926377398710994)
,p_db_column_name=>'PARD_DOC_DATE'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835175380348294)
,p_db_column_name=>'PARD_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117837059048348313)
,p_db_column_name=>'PARD_EXCHANGE_RATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_EXCH_RT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117838546334348328)
,p_db_column_name=>'PARD_LOC_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Pard Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925246384710983)
,p_db_column_name=>'PARD_NARR'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835919818348302)
,p_db_column_name=>'PARD_ORD_AMT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Ord. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835776282348300)
,p_db_column_name=>'PARD_ORD_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835655767348299)
,p_db_column_name=>'PARD_ORD_PFX'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ord. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835524801348298)
,p_db_column_name=>'PARD_ORD_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ord. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835491959348297)
,p_db_column_name=>'PARD_PARTY_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117835386446348296)
,p_db_column_name=>'PARD_PARTY_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pard Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117924925614710980)
,p_db_column_name=>'PARD_PI_NO'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Pard Pi No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117924852155710979)
,p_db_column_name=>'PARD_PI_PFX'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Pard Pi Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925828958710989)
,p_db_column_name=>'PARD_PI_PFX_NO'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'PI Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117834994762348293)
,p_db_column_name=>'PARD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT_DESC#">#PARD_PLNT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925540296710986)
,p_db_column_name=>'PARD_PLNT_LOC_ID'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Pard Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925452876710985)
,p_db_column_name=>'PARD_PRJ_TSK_ID'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Pard Prj Tsk Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925345190710984)
,p_db_column_name=>'PARD_PROJ_ID'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Pard Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117836147495348304)
,p_db_column_name=>'PARD_PROP_ADV_AMT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Adv. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117836045116348303)
,p_db_column_name=>'PARD_PROP_ADV_PCT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pct.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925622535710987)
,p_db_column_name=>'PARD_RCT_AMT'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Received Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925747306710988)
,p_db_column_name=>'PARD_RCT_INPROG_AMT'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Inprog. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8051139583700951955)
,p_db_column_name=>'PARTY_NAME'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117926229663710993)
,p_db_column_name=>'PROJ_ID_DESC'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Project Lvl.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11117925894348710990)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11117944347706724487)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4964346'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PARD_PLNT:PARD_ORD_PFX:PARD_ORD_NO:PARD_PARTY_ID:PARTY_NAME:PARD_CURCY_ID:PARD_PROP_ADV_PCT:PARD_PROP_ADV_AMT:PARD_RCT_AMT:PARD_RCT_INPROG_AMT:PARD_ORD_TYPE:PARD_PI_PFX_NO:LOC_DESC:PARD_ORD_AMT:PARD_EXCHANGE_RATE:PARD_NARR:PARD_DOC_NO:PARD_DOC_DATE:P'
||'ROJ_ID_DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11123531428274912265)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Customer Wise'
,p_report_seq=>10
,p_report_alias=>'5020217'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARD_PLNT:PARD_ORD_PFX:PARD_ORD_NO:PARD_PARTY_ID:PARD_CURCY_ID:PARD_PROP_ADV_PCT:PARD_PROP_ADV_AMT:PARD_RCT_AMT:PARD_RCT_INPROG_AMT:PARD_ORD_TYPE:PARD_PI_PFX_NO:LOC_DESC:PARD_ORD_AMT:PARD_EXCHANGE_RATE:PARD_NARR:PARD_DOC_NO:PARD_DOC_DATE:PROJ_ID_DESC'
,p_break_on=>'PARD_PARTY_ID:PARTY_NAME'
,p_break_enabled_on=>'PARD_PARTY_ID:PARTY_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8044479611959682751)
,p_plug_name=>'Report: Pending Payment & Receipts'
,p_static_id=>'report-pending-payment-receipts'
,p_region_name=>'FD'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-md'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9821045168388494345)
,p_plug_name=>'Unit'
,p_static_id=>'unit'
,p_region_name=>'collexprep'
,p_parent_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_region_css_classes=>'CTS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:i-h240:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9821044863742494342)
,p_plug_name=>'Unit Group'
,p_static_id=>'unit-group'
,p_region_name=>'collexprep'
,p_parent_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_region_css_classes=>'CTS'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:i-h240:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6018489456138936917)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6018489035618936917)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6018489901903936918)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_button_name=>'FAVORITIES'
,p_static_id=>'favorities'
,p_button_static_id=>'F'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorities'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'.t-icon'
,p_button_cattributes=>'onclick="global_fav()";'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6018488708096936917)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_button_name=>'SEARCH'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9142167518117074972)
,p_name=>'P34131010_ALL_PARTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT par_suplr_name',
'  FROM pending_payables_vw_hist',
' WHERE par_bu = :Global_bu AND (par_suplr_id = :P34131010_PARTY)'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9080420899480236506)
,p_name=>'P34131010_DUMMY'
,p_item_sequence=>10
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6359219960642532766)
,p_name=>'P34131010_GRAND_TOTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6359117707325532537)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(NVL(phhd_net_payable,0) - NVL(phhd_paid_amt,0) - NVL(phhd_pay_in_progress,0))',
'    FROM payroll_hist_view',
' WHERE phhd_bu = :global_bu'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9142166920688074966)
,p_name=>'P34131010_PARTY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct par_suplr_name, par_suplr_id',
'  FROM pending_payables_vw_hist',
' WHERE par_bu = :Global_bu'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Party'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9080217809897235950)
,p_name=>'P34131010_REPORT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8044479611959682751)
,p_item_default=>'PP'
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Pending Payable;PP,Pending Payable  - Suppliers;PSW,Pending Payable - Statutory;PS,Pending Payable -  Payroll;PR,Pending Payable - Employees;PE,Pending Payable - Advance;PA,Pending Receivable;PRAA,Pending Receivable - Advance;PRA'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9080223054031235961)
,p_name=>'P34131010_UNIT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9821045168388494345)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P34131010_DUMMY = 0 THEN ',
'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id)INTO :P34131010_UNIT',
'FROM(SELECT  bup_bu || '' - '' || (SUBSTR(bup_name1,1,50)) bup_name1,bup_plant_id',
'FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE bup_bu = bu_id',
'   AND bup_bu = auba_bu',
'   AND bup_plant_id = auba_plant',
'   AND auba_user_id = :global_user         ',
'   AND (NVL (:P34131010_UNIT_GROUP, ''0'') = ''0''',
'    OR INSTR (:P34131010_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
'   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'   AND bup_bu = :global_bu',
'ORDER BY bup_rpt_print_seq);',
'',
'RETURN :P34131010_UNIT;               ',
'END IF;  '))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Unit</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bu_name,bup_plant_id ',
' FROM (SELECT  DISTINCT  bup_name1 bu_name, bup_plant_id,bup_rpt_print_seq',
'  FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE bup_bu = bu_id',
'   AND bup_bu = auba_bu',
'   AND bup_plant_id = auba_plant',
'   AND auba_user_id = :global_user         ',
'   AND (NVL (:P34131010_UNIT_GROUP, ''0'') = ''0''',
'    OR INSTR (:P34131010_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
'   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'   AND bup_bu = :global_bu)',
'ORDER BY bup_rpt_print_seq'))
,p_lov_cascade_parent_items=>'P34131010_UNIT_GROUP'
,p_ajax_items_to_submit=>'P34131010_UNIT'
,p_ajax_optimize_refresh=>'Y'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9080220171050235956)
,p_name=>'P34131010_UNIT_GROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9821044863742494342)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P34131010_DUMMY = 0  THEN',
'SELECT LISTAGG(upgrp_group_id,'':'') WITHIN GROUP (ORDER BY upgrp_group_id)INTO :P34131010_UNIT_GROUP',
'FROM(',
'    SELECT upgrp_bu ||'' - '' || upgrp_desc1,upgrp_group_id ',
'     FROM UNIT_PLANT_GROUPS, bus_unit_plants, appl_user_plant_access',
' WHERE     UPGRP_BU = :global_bu',
'       AND UPGRP_BU = bup_bu',
'       AND upgrp_group_id = bup_group_id',
'       AND bup_bu = auba_bu',
'       AND bup_plant_id = auba_plant',
'       AND auba_user_id = :global_user',
'ORDER  BY upgrp_group_id);',
'RETURN :P34131010_UNIT_GROUP;        ',
'END IF;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Unit Group</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', '1',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6018698157236937481)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6018489035618936917)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018698708091937481)
,p_event_id=>wwv_flow_imp.id(6018698157236937481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34131010_PARTY,P34131010_REPORT_TYPE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6018693900032937476)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8937894614631712875)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018694390174937478)
,p_event_id=>wwv_flow_imp.id(6018693900032937476)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9814944470729391928)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018694883945937478)
,p_event_id=>wwv_flow_imp.id(6018693900032937476)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9081413658833943261)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018695417654937478)
,p_event_id=>wwv_flow_imp.id(6018693900032937476)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-3'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9080541291855479355)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018695924854937479)
,p_event_id=>wwv_flow_imp.id(6018693900032937476)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-4'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9081822359610658765)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018696354429937479)
,p_event_id=>wwv_flow_imp.id(6018693900032937476)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-5'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9083270011453165665)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6018699090993937482)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6018488708096936917)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018699586076937482)
,p_event_id=>wwv_flow_imp.id(6018699090993937482)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'reset_rep();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6018699946125937482)
,p_name=>'Type'
,p_static_id=>'type'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34131010_REPORT_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018700485796937484)
,p_event_id=>wwv_flow_imp.id(6018699946125937482)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34131010_PARTY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018701026122937484)
,p_event_id=>wwv_flow_imp.id(6018699946125937482)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34131010_PARTY'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P34131010_REPORT_TYPE'
,p_client_condition_expression=>'PSW'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6018696752563937479)
,p_name=>'Unit Fetch'
,p_static_id=>'unit-fetch'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34131010_UNIT_GROUP'
,p_condition_element=>'P34131010_UNIT_GROUP'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018697258490937481)
,p_event_id=>wwv_flow_imp.id(6018696752563937479)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P34131010_UNIT',
  'items_to_submit', 'P34131010_UNIT_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P34131010_UNIT_GROUP  IS NOT NULL THEN',
    '  ',
    '  SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P34131010_UNIT',
    '    FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
    '           FROM business_units, bus_unit_plants, appl_user_plant_access',
    ' WHERE bup_bu = bu_id',
    '   AND bup_bu = auba_bu',
    '   AND bup_plant_id = auba_plant',
    '   AND auba_user_id = :global_user         ',
    '   AND (NVL (:P34131010_UNIT_GROUP, ''0'') = ''0''',
    '    OR INSTR (:P34131010_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
    '   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '   AND bup_bu = :global_bu',
    'ORDER BY bup_rpt_print_seq);',
    '     :P34131010_DUMMY := 0;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6018697746353937481)
,p_event_id=>wwv_flow_imp.id(6018696752563937479)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P34131010_UNIT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P34131010_DUMMY :=1;',
    ':P34131010_UNIT := NULL;',
    ':P34131010_UNIT_GROUP := NULL;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6018693477833937474)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Adjust'
,p_static_id=>'adjust'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	CURSOR c1',
'	IS',
'	SELECT MAX (ect_trans_date) doc_date',
'    FROM emp_ca_trans',
'   WHERE (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'     AND ect_check_flag = ''Y''',
'     AND ect_status = ''P''',
'     AND ect_bu = :global_bu;',
'     ',
'  CURSOR c2',
'  IS',
'  SELECT *',
'    FROM emp_ca_trans',
'   WHERE ect_bu = :GLOBAL_bu',
'     AND ect_check_flag = ''Y''',
'     AND ect_status = ''P''',
'     AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0;',
'             ',
'	/*CURSOR c2',
'	IS',
'	SELECT COUNT(1) v_cnt',
'    FROM (SELECT DISTINCT ect_emp_id,ect_elmnt_id',
'        FROM emp_ca_trans',
'       WHERE  (ect_doc_amt - ect_proc_amt) > 0',
'             AND ect_check_flag = ''Y''',
'             AND ect_status = ''P''',
'             AND ect_bu = :global.bu);*/',
'             ',
'  /*CURSOR c3',
'  IS',
'   SELECT ect_inprog_amt,ect_bal_amt',
'     FROM emp_ca_trans',
'    WHERE ect_bu = :GLOBAL.bu',
'      AND ect_check_flag = ''Y''',
'       AND ect_status = ''P'';*/',
'       ',
'       ',
'  /*CURSOR c4',
'  IS',
'   SELECT DISTINCT ect_emp_id,ect_elmnt_id',
'     FROM emp_ca_trans',
'    WHERE ect_bu = :GLOBAL.bu',
'      AND ect_status = ''P''',
'      AND ect_check_flag = ''Y''',
'      AND ect_pay_mode = ''P''',
'      AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0;     ',
'      ',
'  CURSOR c5(c_emp_id  VARCHAR2,c_elmnt_id  VARCHAR2)',
'  IS',
'   SELECT DISTINCT ect_emp_id,ect_elmnt_id',
'     FROM emp_ca_trans',
'    WHERE ect_bu = :GLOBAL.bu',
'      AND ect_status = ''P''',
'      AND ect_check_flag = ''Y''',
'      AND ect_pay_mode = ''I''',
'      AND ect_emp_id = c_emp_id',
'      AND ect_elmnt_id = c_elmnt_id',
'      AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0;',
'      ',
'  ',
'  CURSOR c6',
'  IS',
'   SELECT DISTINCT ect_emp_id,ect_elmnt_id',
'     FROM emp_ca_trans',
'    WHERE ect_bu = :GLOBAL.bu',
'      AND ect_status = ''P''',
'      AND ect_check_flag = ''Y''',
'      AND ect_pay_mode = ''I''',
'      AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0;     ',
'      ',
'  CURSOR c7(c_emp_id  VARCHAR2,c_elmnt_id  VARCHAR2)',
'  IS',
'   SELECT DISTINCT ect_emp_id,ect_elmnt_id',
'     FROM emp_ca_trans',
'    WHERE ect_bu = :GLOBAL.bu',
'      AND ect_status = ''P''',
'      AND ect_check_flag = ''Y''',
'      AND ect_pay_mode = ''P''',
'      AND ect_emp_id = c_emp_id',
'      AND ect_elmnt_id = c_elmnt_id',
'      AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0;*/',
'   ',
'      ',
'             ',
'	 adj_alert      VARCHAR2 (10);',
'   var_adj_flag   VARCHAR2 (1) := ''N'';',
'   v_date         DATE;',
'   v_cnt          NUMBER;',
'   v_paid_cnt     NUMBER;',
'   v_pay_cnt      NUMBER;',
'   ',
'   cr1            c1%ROWTYPE;',
'   --cr2            c2%ROWTYPE;',
'   --cr5            c5%ROWTYPE;',
'   --cr7            c7%ROWTYPE;',
'   ',
'begin',
'	',
'	SELECT COUNT (1)',
'     INTO v_cnt',
'     FROM emp_ca_trans',
'    WHERE (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'      AND ect_check_flag = ''Y''',
'      AND ect_status = ''P''',
'      AND ect_bu = :global_bu;',
'',
'   IF v_cnt = 0 THEN',
'      Raise_Application_Error(-20999,''Please select the document to be adjust'');',
'   END IF;',
'   ',
'   /*FOR cr3 IN c3',
'   LOOP',
'   	  ',
'   	  IF cr3.ect_inprog_amt <> cr3.ect_bal_amt THEN',
'   	  	alert_msg(''Partial Adjustment not allowed.'',''S'');',
'   	  END IF;',
'   	',
'   END LOOP c3;*/',
'    ',
'   ',
'    SELECT COUNT (DISTINCT CASE WHEN ect_pay_mode = ''I'' THEN 1 ELSE NULL END) paid,',
'          COUNT (DISTINCT CASE WHEN ect_pay_mode = ''P'' THEN 1 ELSE NULL END) pay',
'     INTO v_paid_cnt, v_pay_cnt',
'     FROM emp_ca_trans',
'    WHERE (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'      AND ect_check_flag = ''Y''',
'      AND ect_status = ''P''',
'      AND ect_bu = :global_bu;',
'   ',
'   IF v_paid_cnt <> 1 OR v_pay_cnt <> 1 THEN',
'      IF v_paid_cnt <> 1 THEN',
'         Raise_Application_Error(-20999,''Please select atleast one Paid Document'');',
'      END IF;',
'',
'      IF v_pay_cnt <> 1 THEN',
'      Raise_Application_Error(-20999,''Please select atleast one Pay Document'');',
'      END IF;',
'   END IF;',
'   ',
'   FOR cr2 IN c2',
'   LOOP',
'   	 IF (cr2.ect_bal_amt - cr2.ect_pay_in_prog) < cr2.ect_inprog_amt THEN',
'   	 	   Raise_Application_Error(-20999,''Pay amt. should not be greater than balance amt.'');',
'   	 END IF;',
'   	',
'   END LOOP c2;',
'   ',
'  /* OPEN c2;',
'',
'   FETCH c2 INTO cr2;',
'',
'   IF cr2.v_cnt > 1',
'   THEN',
'      alert_msg (''You cannot Adjust different Employee/Element.'', ''S'');',
'   END IF;',
'',
'   CLOSE c2;*/',
'   ',
'  /* FOR cr4 IN c4',
'   LOOP ',
'   	  OPEN c5(cr4.ect_emp_id,cr4.ect_elmnt_id);',
'   	  FETCH c5 INTO cr5;   	  ',
'   	    IF c5%NOTFOUND THEN',
'   	    	alert_msg(''Paid document not found for the employee : ''||cr4.ect_emp_id,''S'');',
'   	    END IF;',
'   	  CLOSE c5;',
'   END LOOP c4;',
'   ',
'   FOR cr6 IN c6',
'   LOOP ',
'   	  OPEN c7(cr6.ect_emp_id,cr6.ect_elmnt_id);',
'   	  FETCH c7 INTO cr7;   	  ',
'   	    IF c7%NOTFOUND THEN',
'   	    	alert_msg(''Payable document not found for the employee : ''||cr6.ect_emp_id,''S'');',
'   	    END IF;',
'   	  CLOSE c7;',
'   END LOOP c6;*/',
'   ',
'	',
'--    IF :SYSTEM.form_status = ''CHANGED'' THEN',
'--       alert_msg (func_frm_msg (:global.bu, ''FORM'', ''CHANG''), ''S'');',
'   /*ELSE',
'      SET_ALERT_PROPERTY (''CAUTION_ALERT'',',
'                          alert_message_text,',
'                          ''Do you want to adjust the document?'');',
'      adj_alert := SHOW_ALERT (''CAUTION_ALERT'');',
'',
'      IF adj_alert = alert_button1',
'      THEN',
'         var_adj_flag := ''Y'';',
'      ELSIF adj_alert = alert_button2',
'      THEN',
'         :global.screen := 20;',
'         GO_ITEM (''EMP_CA_TRANS1.ECT_TRANS_NO'');',
'      END IF;*/',
'--    END IF;',
'   ',
'--IF var_adj_flag = ''Y''',
'   --THEN',
'      SELECT MAX (ect_trans_date)',
'        INTO v_date',
'        FROM emp_ca_trans',
'       WHERE (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'         AND ect_check_flag = ''Y''',
'         AND ect_status = ''P''',
'         AND ect_bu = :global_bu;',
'',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'',
'      IF c1%FOUND THEN',
'         IF v_date < cr1.doc_date THEN',
'            v_date := cr1.doc_date;',
'         END IF;',
'      END IF;',
'',
'    ',
'--END IF;',
'',
'EXCEPTION',
'   WHEN NO_DATA_FOUND',
'   THEN',
'       Raise_Application_Error(-20999,''Please Select the Document'');',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>536731642290326446
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6018693044813937473)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Payment'
,p_static_id=>'payment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT COUNT (*) v_cnt',
'        FROM emp_ca_trans',
'       WHERE     ect_bu = :global_bu',
'             AND ect_user = :global_user',
'             AND ect_check_flag = ''Y''',
'             AND (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'             AND ect_mode IN (''L'')',
'              AND ect_status = ''P'';',
'',
'   cr1   c1%ROWTYPE;',
'   v_paid_cnt  NUMBER;',
'BEGIN',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   CLOSE c1;',
'   ',
'   IF cr1.v_cnt = 0',
'   THEN',
'        Raise_Application_Error(-20999,''Please select the document'');',
'      ',
'   ELSE',
'   	',
'    SELECT COUNT (*) v_paid',
'     INTO v_paid_cnt',
'     FROM emp_ca_trans',
'    WHERE (ect_doc_amt - (ect_pay_in_prog + ect_pay_proc)) > 0',
'          AND ect_check_flag = ''Y''',
'          AND ect_bu = :global_bu',
'          AND ect_pay_mode = ''I''',
'          AND ect_status = ''P'';',
'   ',
'',
'      IF v_paid_cnt >= 1',
'      THEN',
'              Raise_Application_Error(-20999,''Please select only payable Document'');',
'      END IF;',
'      ',
'      :pyrlhd_date := SYSDATE;',
'      :ect_bank_id := NULL;',
'      :bank_desc:=NULL;',
'			:UNIT1:=NULL;',
'			:UNIT_DESC1:=NULL;',
'',
'  ',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>536731209270326445
);
wwv_flow_imp.component_end;
end;
/
