prompt --application/pages/page_1615131100
begin
--   Manifest
--     PAGE: 1615131100
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
 p_id=>1615131100
,p_name=>'Pending PO/SS/ST/GE'
,p_alias=>'PENDING-PO-SS-ST-GE'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending GRN'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'    .t-fht-thead {',
'    overflow: auto !important;',
'',
'}',
'',
'#CLR element.style {',
'    font-weight: bold;',
'    color: #328399;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19411361840352498630)
,p_plug_name=>'PENDING'
,p_static_id=>'pending'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'POSV_PLNT_LOC_ID,',
'POSV_PLNT,',
'POSV_ORD_PFX,',
'POSV_ORD_NO,',
'POSV_ORD_SEQ_NO,',
'POSV_SUPLR,',
'POSV_SUPLR_NAME,',
'POSV_PROD_ID,',
'POSV_PROD_REV,',
'POSV_PROD_DESC1,',
'POSV_UOM,',
'POSV_UNIT_COST,',
'POSV_BAL_QTY,',
'CURR_PROCESS_QTY,',
'POSV_RCPT_PFX,',
'POSV_ORD_QTY,',
'POSV_EXCESS_QTY,',
'ORDER_DATE,',
'POSV_REQUIRED_DATE,',
'POSV_PROMISE_DATE,',
'POSV_TYPE',
'FROM ',
'(',
'SELECT ',
'POSV_PLNT_LOC_ID,',
'POSV_PLNT,',
'POSV_ORD_PFX,',
'POSV_ORD_NO,',
'POSV_ORD_SEQ_NO,',
'POSV_SUPLR,',
'POSV_SUPLR_NAME,',
'POSV_PROD_ID,',
'POSV_PROD_REV,',
'POSV_PROD_DESC1,',
'POSV_UOM,',
'POSV_UNIT_COST,',
'(POSV_ORD_QTY - (POSV_RECEIPT_QTY+POSV_PROCESS_QTY+POSV_CS_QTY)) POSV_BAL_QTY,',
'NVL((posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)),0) CURR_PROCESS_QTY,',
'POSV_RCPT_PFX,',
'POSV_ORD_QTY,',
'POSV_EXCESS_QTY,',
'to_char(POSV_ORDER_DATE,''DD.MM.YYYY'') ORDER_DATE,',
'POSV_REQUIRED_DATE,',
'POSV_PROMISE_DATE,',
'POSV_TYPE',
'FROM  PUR_ORDER_SO_VIEW',
'  Where posv_bu = :GLOBAL_bu',
'AND EXISTS (SELECT 1',
'                          FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_USER',
'                           AND trunc(sysdate) between  auba_from and  auba_to',
'                           AND auba_plant = posv_plnt',
'                           AND auba_plnt_loc_id = posv_plnt_loc_id)',
'',
'AND posv_matl_type <> ''T''',
'and POSV_MODE =''PO'' ',
'AND POSV_TYPE <> ''POT''',
'AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N'')',
'UNION ALL',
' SELECT ',
'sshd_plnt_loc_id POSV_PLNT_LOC_ID,',
'SSHD_PLNT POSV_PLNT,',
'SSHD_DOC_PFX POSV_ORD_PFX,',
'SSHD_DOC_NO POSV_ORD_NO,',
'SSLN_SEQ_NO POSV_ORD_SEQ_NO,',
'sshd_suplr_id POSV_SUPLR,',
'SSHD_SUPLR_DESC POSV_SUPLR_NAME,',
'SSLN_PROD_ID POSV_PROD_ID,',
'SSLN_PROD_REV POSV_PROD_REV,',
'SSLN_PROD_DESC1 POSV_PROD_DESC1,',
'SSLN_PROD_UOM POSV_UOM,',
'0 POSV_UNIT_COST,',
'0 POSV_BAL_QTY,',
'0 CURR_PROCESS_QTY,',
'SSLN_RQST_PFX POSV_RCPT_PFX,',
'0 POSV_ORD_QTY,',
'0 POSV_EXCESS_QTY,',
'to_char(SSHD_DOC_DATE,''DD.MM.YYYY'') ORDER_DATE,',
'SSLD_SCHLD_DATE POSV_REQUIRED_DATE,',
'SSLD_PROMISE_DATE POSV_PROMISE_DATE,',
'NULL POSV_TYPE',
' FROM SUPLR_SCHLD_VIEW',
'WHERE SSHD_BU = :GLOBAL_BU',
'  and EXISTS (Select 1',
'             From pom_control',
'            Where pomctrl_bu = :Global_bu',
'              And pomctrl_plnt = sshd_plnt',
'              AND pomctrl_gate_ent_flag = ''N'')',
'  AND EXISTS (',
'          select 1',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between  AUBA_FROM and  AUBA_TO',
'        AND AUBA_PLANT = sshd_PLNT)',
')'))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(19411361766932498630)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_sort=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>13929399931388887602
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6041148448567460129)
,p_db_column_name=>'CURR_PROCESS_QTY'
,p_display_order=>1520
,p_column_identifier=>'IV'
,p_column_label=>'Curr. Rcp. Qty '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7243889158458610873)
,p_db_column_name=>'ORDER_DATE'
,p_display_order=>1450
,p_column_identifier=>'IL'
,p_column_label=>'Order Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7092643869528378883)
,p_db_column_name=>'POSV_BAL_QTY'
,p_display_order=>70
,p_column_identifier=>'IQ'
,p_column_label=>'Bal. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738418594991698109)
,p_db_column_name=>'POSV_EXCESS_QTY'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Excess Qty.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738423247278698154)
,p_db_column_name=>'POSV_ORD_NO'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'PO No.'
,p_allow_sorting=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'DISTINCT POSV_ORD_NO',
'FROM ',
'(',
'SELECT ',
'POSV_ORD_NO',
'FROM  PUR_ORDER_SO_VIEW',
'  Where posv_bu = :GLOBAL_bu',
'AND EXISTS (SELECT 1',
'                          FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_USER',
'                           AND trunc(sysdate) between  auba_from and  auba_to',
'                           AND auba_plant = posv_plnt',
'                           AND auba_plnt_loc_id = posv_plnt_loc_id)',
'',
'AND posv_matl_type <> ''T''',
'and POSV_MODE =''PO'' ',
'AND POSV_TYPE <> ''POT''',
'AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N'')',
'UNION ALL',
' SELECT ',
'SSHD_DOC_NO POSV_ORD_NO',
' FROM SUPLR_SCHLD_VIEW',
'WHERE SSHD_BU = :GLOBAL_BU',
'  and EXISTS (Select 1',
'             From pom_control',
'            Where pomctrl_bu = :Global_bu',
'              And pomctrl_plnt = sshd_plnt',
'              AND pomctrl_gate_ent_flag = ''N'')',
'  AND EXISTS (',
'          select 1',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between  AUBA_FROM and  AUBA_TO',
'        AND AUBA_PLANT = sshd_PLNT)',
')'))
,p_rpt_show_filter_lov=>'C'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6151532466500227404)
,p_db_column_name=>'POSV_ORD_PFX'
,p_display_order=>1510
,p_column_identifier=>'IU'
,p_column_label=>'PO Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738413386668698059)
,p_db_column_name=>'POSV_ORD_QTY'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Order Qty.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738422915864698149)
,p_db_column_name=>'POSV_ORD_SEQ_NO'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738420830512698131)
,p_db_column_name=>'POSV_PLNT'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738434266764698224)
,p_db_column_name=>'POSV_PLNT_LOC_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738433019818698218)
,p_db_column_name=>'POSV_PROD_DESC1'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738433830309698223)
,p_db_column_name=>'POSV_PROD_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738433457241698220)
,p_db_column_name=>'POSV_PROD_REV'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738405084536697990)
,p_db_column_name=>'POSV_PROMISE_DATE'
,p_display_order=>200
,p_column_identifier=>'BZ'
,p_column_label=>'Promise Date'
,p_column_type=>'DATE'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7547128952092664989)
,p_db_column_name=>'POSV_RCPT_PFX'
,p_display_order=>1460
,p_column_identifier=>'IP'
,p_column_label=>'GRN Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738405473864697995)
,p_db_column_name=>'POSV_REQUIRED_DATE'
,p_display_order=>190
,p_column_identifier=>'BY'
,p_column_label=>'Required Date'
,p_column_type=>'DATE'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738427699786698188)
,p_db_column_name=>'POSV_SUPLR'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Suplr. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738427300538698185)
,p_db_column_name=>'POSV_SUPLR_NAME'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Suplr. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738425255560698168)
,p_db_column_name=>'POSV_TYPE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738417740132698101)
,p_db_column_name=>'POSV_UNIT_COST'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9738432077202698213)
,p_db_column_name=>'POSV_UOM'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19411274597708497354)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'85582'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'POSV_PLNT_LOC_ID:POSV_PLNT:POSV_ORD_PFX:POSV_ORD_NO:POSV_ORD_SEQ_NO:POSV_SUPLR:POSV_SUPLR_NAME:POSV_PROD_ID:POSV_PROD_REV:POSV_PROD_DESC1:POSV_UOM:POSV_UNIT_COST:POSV_BAL_QTY:CURR_PROCESS_QTY:POSV_RCPT_PFX:POSV_ORD_QTY:POSV_EXCESS_QTY:ORDER_DATE:POSV'
||'_REQUIRED_DATE:POSV_PROMISE_DATE:POSV_TYPE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5934076711272561367)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19411361840352498630)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5970325581434952323)
,p_branch_name=>'select_process'
,p_branch_action=>'f?p=&APP_ID.:161513110002:&SESSION.::&DEBUG.::P161513110002_SCOMT_PR_QTY,P161513110002_SCOMT_ORD_NO,P161513110002_SCOMT_ORD_PFX,P161513110002_SCOMT_ORD_SEQ_NO,P161513110002_SCOMT_ORD_SUB_SEQ_NO:&P1615131100_PROCESS_QTY.,&P1615131100_POSV_ORD_NO.,&P1615131100_POSV_ORD_PFX.,&P1615131100_POSV_ORD_SEQ_NO.,&P1615131100_ORD_SUB_SEQ_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>140
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5934076763667561368)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5934076711272561367)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5934076848498561369)
,p_event_id=>wwv_flow_imp.id(5934076763667561368)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970277829644952260)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK1'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'---raise_application_error(-20999,''check''||apex_application.g_x08||''-''||apex_application.g_x07||''-''||apex_application.g_x06);',
'DECLARE',
'',
'',
'CURSOR C7 ',
'         IS',
'         SELECT * ',
'            FROM PUR_ORDER_SO_VIEW',
'          WHERE POSV_BU = :GLOBAL_BU',
'          AND POSV_ORD_NO||POSV_ORD_SEQ_NO= apex_application.g_x06 ;',
'',
'		  CR7 C7%ROWTYPE;',
'		',
'		CURSOR c1 IS',
'           SELECT uom_int_flag',
'          FROM unit_of_measures',
'          WHERE uom_bu = :GLOBAL_bu',
'          AND uom_uom = (SELECT POSV_UOM',
'                           FROM PUR_ORDER_SO_VIEW',
'                          WHERE POSV_BU = :GLOBAL_BU',
'                            AND POSV_ORD_NO||POSV_ORD_SEQ_NO= apex_application.g_x06);',
'							',
'            CR1  C1%ROWTYPE;',
'    ',
'	v_curr_proc_qty  NUMBER;',
'	var_res          VARCHAR2(1);',
'	var_res1         VARCHAR2(1);',
'   v_delay_reasn_rqrd_flag		VARCHAR2(1);   ',
'    v_seq                  NUMBER(5);',
'    v_doc_no          	   VARCHAR2(30);',
'',
'    v_rcpt_pfx    VARCHAR2(10);',
'    v_tolr_qty    NUMBER;',
'    v_error       VARCHAR2(1000);',
'',
'    v_excess_flag pom_control.pomctrl_allw_exc_qty_rcpt_flag%TYPE;',
'    v_excess_qty  NUMBER;',
'    v_dt_res    VARCHAR2(1);',
'BEGIN',
'    ',
'',
'	',
'--raise_application_error(-20999,''check''||apex_application.g_x08||''-''||apex_application.g_x07||''-''||apex_application.g_x06);',
'OPEN C7;',
'Fetch C7 into CR7;',
'',
'proc_check_rcpt_due_tolerance(:GLOBAL_bu,cr7.posv_plnt,cr7.posv_required_date,v_dt_res);',
'IF v_dt_res = ''N'' THEN',
'  v_error := ''Order date should be greater than tolerance date.'';',
'  GOTO ERR;',
'END IF;',
'',
'OPEN C1;',
'FETCH C1 INTO CR1;',
'',
'SELECT pomctrl_allw_exc_qty_rcpt_flag INTO v_excess_flag',
'  FROM pom_control',
' WHERE pomctrl_bu = :GLOBAL_bu',
'   AND pomctrl_plnt = cr7.posv_plnt;',
'',
'v_curr_proc_qty  :=  (CR7.POSV_ORD_QTY - (CR7.POSV_RECEIPT_QTY + CR7.POSV_PROCESS_QTY + cr7.posv_cs_qty));',
'IF cr7.posv_tolr_type = ''N'' THEN',
'  v_tolr_qty := 0;',
'  IF TO_NUMBER(APEX_APPLICATION.G_X07) > TO_NUMBER(v_curr_proc_qty) THEN',
'    v_excess_qty := TO_NUMBER(APEX_APPLICATION.G_X07) - TO_NUMBER(v_curr_proc_qty);',
'  ELSE',
'    v_excess_qty := 0;',
'  END IF;',
'ELSIF cr7.posv_tolr_type IN (''P'',''S'') THEN',
'  v_tolr_qty := cr7.posv_ord_qty * (cr7.posv_tolr_pct / 100);',
'  IF TO_NUMBER(APEX_APPLICATION.G_X07) > (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty)) THEN',
'    v_excess_qty := TO_NUMBER(APEX_APPLICATION.G_X07) - (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty));',
'  ELSE',
'    v_excess_qty := 0;',
'  END IF;',
'ELSIF cr7.posv_tolr_type = ''R'' THEN',
'  IF TO_NUMBER(APEX_APPLICATION.G_X07) > TO_NUMBER(v_curr_proc_qty) THEN',
'    v_tolr_qty := TO_NUMBER(APEX_APPLICATION.G_X07) - TO_NUMBER(v_curr_proc_qty);',
'  ELSE',
'    v_tolr_qty := 0;',
'  END IF;',
'  v_excess_qty := 0;',
'END IF;',
'  ',
'--v_tolr_qty := cr7.posv_ord_qty * (cr7.posv_tolr_pct / 100);',
'',
'',
'  IF cr1.uom_int_flag = ''N'' AND (TRUNC(APEX_APPLICATION.G_X07) < APEX_APPLICATION.G_X07)  THEN',
'    v_error := ''Fraction is not allowed.'';',
'    GOTO ERR;',
'  END IF;',
'',
'--raise_application_error(-20999,''check''||apex_application.g_x07||''-''||apex_application.g_x08||''-''||apex_application.g_x09);',
'  IF TO_NUMBER(APEX_APPLICATION.G_X07) is null OR (TO_NUMBER(APEX_APPLICATION.G_X07) <= 0) then   --  Validation By Madhavan',
'    v_error := ''Curr.Proc Qty Should be greater than Zero.'';',
'    GOTO ERR;',
'  ELSif (TO_NUMBER(APEX_APPLICATION.G_X07) > TO_NUMBER(v_curr_proc_qty)) AND cr7.posv_tolr_type = ''N'' AND v_excess_flag = ''N''  THEN ',
'    v_error := ''Qty Should not greater than Curr.Proc Qty.'';',
'    GOTO ERR;',
'  ELSif (TO_NUMBER(APEX_APPLICATION.G_X07) > (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty))) AND cr7.posv_tolr_type IN (''P'',''S'')  AND v_excess_flag = ''N'' THEN ',
'    v_error := ''Qty. with Tolr. Should not greater than Curr.Proc Qty.'';',
'    GOTO ERR;',
'  END IF;',
'',
'  IF func_find_prod_ser_lot_type(:GLOBAL_bu,cr7.posv_prod_id,cr7.posv_prod_rev) IN (''S'',''O'') AND ',
'     (TRUNC(APEX_APPLICATION.G_X07) <> APEX_APPLICATION.G_X07) THEN ',
'    v_error := ''Fraction not allowed for Serial/Lot serial Item.'';',
'    GOTO ERR;',
'  END IF;',
'',
'  BEGIN',
'  --raise_application_error(-20999,''check''||apex_application.g_x08||''-''||apex_application.g_x07||''-''||apex_application.g_x06);',
'  	',
'	',
'	 --v_doc_no := SUBSTR(apex_application.g_x06,1,INSTR(apex_application.g_x06,''~'')-1);',
'    --v_seq := SUBSTR(apex_application.g_x06,-1,INSTR(apex_application.g_x06,''~'')+1);',
'	',
' --raise_application_error(-20999,''check''||apex_application.g_x08||''-''||apex_application.g_x07||''-''||apex_application.g_x06);     	',
'   IF apex_application.g_x08 = ''Y''  THEN ',
'',
'      IF (cr7.posv_rcpt_plnt IS NULL OR cr7.posv_rcpt_plnt_loc_id IS NULL OR cr7.posv_rcpt_plnt_loc_name IS NULL) THEN',
'        UPDATE pur_order_ln',
'           SET pol_rcpt_plnt = cr7.posv_plnt,',
'               pol_rcpt_plnt_loc_id = cr7.posv_plnt_loc_id,',
'               pol_rcpt_plnt_loc_name = cr7.posv_plnt_loc_name',
'         WHERE pol_bu = :GLOBAL_bu',
'           AND pol_order_no = cr7.posv_ord_no',
'           AND pol_seq_no = cr7.posv_ord_seq_no;',
'      END IF;',
'',
'		--IF cr7.posv_rcpt_pfx IS NULL  AND :P1615131100_BUT_TYPE = ''PO'' THEN ',
'    	BEGIN',
'',
'        SELECT apsta_pfx INTO v_rcpt_pfx',
'               FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'              WHERE apsta_bu = adpl_bu',
'                AND apsta_plnt = adpl_plnt',
'                AND apsta_pfx = adpl_pfx',
'                AND apsta_bu = :GLOBAL_bu',
'                AND apsta_vou_type = ''GRNP''   ',
'                AND apsta_plnt = cr7.posv_plnt',
'                AND adpl_loc_id = cr7.posv_plnt_loc_id',
'                AND apsta_sub_type = CASE WHEN cr7.posv_type = ''POG'' THEN ''GRNPG''',
'                                          WHEN cr7.posv_type = ''POM'' THEN ''GRNPM''',
'                                          WHEN cr7.posv_type = ''POS'' THEN ''GRNPS'' ',
'                                          WHEN cr7.posv_type = ''POT'' THEN ''GRNPT'' ',
'    	                               ELSE NULL  END',
'                AND adpl_dflt_loc = ''Y'';',
'',
'  ',
'      UPDATE pur_order_ln',
'         SET pol_rcpt_pfx = v_rcpt_pfx',
'       WHERE pol_bu = :GLOBAL_bu',
'         AND pol_order_no = cr7.posv_ord_no',
'         AND pol_seq_no = cr7.posv_ord_seq_no;',
'         ',
'     EXCEPTION ',
'     WHEN NO_DATA_FOUND THEN ',
'        v_error := ''GRN Pfx. not found.'';',
'        GOTO ERR;',
'     WHEN TOO_MANY_ROWS THEN ',
'        v_error := ''Multiple Default GRN Pfx. defined in this Location ''||cr7.posv_plnt_loc_id;',
'        GOTO ERR;',
'    END;',
'    --END IF;',
'',
'   	proc_upd_po_sel_flag(:GLOBAL_bu,',
'		                     cr7.posv_ord_pfx,',
'		                     cr7.posv_ord_no,',
'		                     cr7.posv_ord_seq_no,',
'		                     ''Y'',',
'		                     (apex_application.g_x07 - v_excess_qty),',
'		                     :GLOBAL_user,',
'		                     v_excess_qty,',
'		                     v_tolr_qty',
'		                    );',
'  ',
'                    ',
'ELSIF apex_application.g_x08 = ''N'' THEN',
'  ',
'proc_upd_po_sel_flag(:GLOBAL_bu,',
'		                     cr7.posv_ord_pfx,',
'		                     cr7.posv_ord_no,',
'		                     cr7.posv_ord_seq_no,',
'		                     ''N'',',
'		                     0,',
'		                     :GLOBAL_user',
'		                    );',
'',
'END IF;	',
'END;',
'',
'<<ERR>>',
'IF v_error IS NOT NULL THEN',
'  Rollback;',
'  htp.p(v_error); ',
'ELSE',
'  htp.p(''success''); ',
'  COMMIT; ',
'END IF;',
'',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488315994101341232
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970274629923952256)
,p_process_sequence=>290
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK_STS'
,p_static_id=>'checkanduncheck-sts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c1 IS',
'SELECT *',
'  FROM sales_invoices_hd',
' WHERE sihd_bu = :GLOBAL_BU',
'   AND sihd_inv_pfx||sihd_inv_no = apex_application.g_x01;',
'',
'v_err_msg    VARCHAR2(1000);',
'',
'BEGIN',
'  ',
'  FOR cr1 IN c1',
'  LOOP',
' ',
'    IF apex_application.g_x02 = ''Y'' THEN',
'',
'      UPDATE sales_invoices_hd',
'         SET sihd_stk_trfr_sel_flag = ''Y'',',
'             sihd_stk_trfr_sel_user = :GLOBAL_user',
'       WHERE sihd_bu = :GLOBAL_bu',
'         AND sihd_inv_pfx = cr1.sihd_inv_pfx',
'         AND sihd_inv_no = cr1.sihd_inv_no;',
'',
'    ELSE',
'',
'      UPDATE sales_invoices_hd',
'         SET sihd_stk_trfr_sel_flag = ''N'',',
'             sihd_stk_trfr_sel_user = NULL',
'       WHERE sihd_bu = :GLOBAL_bu',
'         AND sihd_inv_pfx = cr1.sihd_inv_pfx',
'         AND sihd_inv_no = cr1.sihd_inv_no;',
'',
'    END IF;',
'',
'  END LOOP;',
'',
'  IF v_err_msg IS NULL THEN',
'    htp.p(''success'');',
'    Commit;    ',
'  ELSE',
'    Rollback;',
'    htp.p(v_err_msg);',
'  END IF;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488312794380341228
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970278191403952262)
,p_process_sequence=>120
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECKGE'
,p_static_id=>'checkanduncheckge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- RAISE_APPLICATION_ERROR (-20999,''select''||''??-??''||apex_application.g_x01||''??-??''||apex_application.g_x02);',
'',
'DECLARE',
'   chk_alert   NUMBER (5);',
'',
'   CURSOR c2',
'   IS',
'      SELECT *',
'        FROM gate_entry_so_view',
'      where GESV_BU=:GLOBAL_BU',
'      AND GESV_PLNT||GESV_DOC_NO||GESV_SEQ_NO||GESV_SUB_SEQ_NO = apex_application.g_x02;',
'',
'   cr2         c2%ROWTYPE;',
'',
'  v_err_msg    VARCHAR2(1000);',
'BEGIN',
'',
'',
' ',
'For CR2 in C2',
'   LOOP',
'   --htp.p(''M''||apex_application.g_x02);',
' ',
'   IF apex_application.g_x01= ''Y'' --AND cr2.gesv_qc_req = ''N''',
'   THEN',
'    --Raise_Application_Error(-20999,apex_application.g_x01||''/''||:P1615131100_MODE_GE);',
'    DECLARE',
'				 v_rcpt_pfx VARCHAR2(5);',
'    	BEGIN',
'       IF cr2.gesv_mode = ''SC'' THEN ',
'        SELECT apsta_pfx INTO v_rcpt_pfx',
'               FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'              WHERE apsta_bu = adpl_bu',
'                AND apsta_plnt = adpl_plnt',
'                AND apsta_pfx = adpl_pfx',
'                AND apsta_bu = :GLOBAL_bu',
'                AND apsta_vou_type = ''GRNS''   ',
'                AND apsta_plnt = cr2.gesv_plnt',
'                AND adpl_loc_id = cr2.gesv_plnt_loc_id',
'                AND apsta_sub_type = CASE WHEN cr2.gesv_po_type = ''SCOP'' THEN ''GRNSP'' ',
'                             WHEN cr2.gesv_po_type = ''SCOR'' THEN ''GRNSR'' ',
'                             WHEN cr2.gesv_po_type = ''SCORV'' THEN ''GRNSRV'' ',
'                             WHEN cr2.gesv_po_type = ''SCOV'' THEN ''GRNSV'' ELSE NULL END',
'    	                       AND ROWNUM =1;',
'',
'			   UPDATE gate_entry_details',
'      SET gedl_rcpt_pfx = v_rcpt_pfx,gedl_sel_rec= ''Y'',gedl_user = :GLOBAL_user',
'      WHERE gedl_bu = :GLOBAL_bu',
'          AND gedl_plnt  = cr2.gesv_plnt',
'          AND gedl_doc_no = cr2.gesv_doc_no',
'          AND gedl_seq_no = cr2.gesv_seq_no',
'          AND gedl_sub_seq_no = cr2.gesv_sub_seq_no;',
'   ',
'   ',
'    ELSIF cr2.gesv_mode = ''PR'' THEN',
'',
'	        SELECT apsta_pfx INTO v_rcpt_pfx',
'               FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'              WHERE apsta_bu = adpl_bu',
'                AND apsta_plnt = adpl_plnt',
'                AND apsta_pfx = adpl_pfx',
'                AND apsta_bu = :GLOBAL_bu',
'                AND apsta_vou_type = ''GRNP''   ',
'                AND adpl_dflt_loc = ''Y''',
'                AND apsta_plnt = cr2.gesv_plnt',
'                AND adpl_loc_id = cr2.gesv_plnt_loc_id',
'                AND apsta_sub_type = CASE WHEN cr2.gesv_mode IN(''DR'',''PR'') AND cr2.gesv_st_inv_no IS NULL THEN ''GRNPG''',
'                                          WHEN cr2.gesv_mode IN(''DR'',''PR'') AND cr2.gesv_st_inv_no IS NOT NULL THEN ''GRNPT''',
'    	                               ELSE NULL  END',
'    	                               AND ROWNUM =1;',
'',
'    ',
'	UPDATE gate_entry_details',
'      SET gedl_sel_rec = ''Y'',',
'          gedl_rcpt_pfx = v_rcpt_pfx,',
'          gedl_user = :GLOBAL_user',
'      WHERE gedl_bu = :GLOBAL_bu',
'          AND gedl_plnt  = cr2.GESV_PLNT',
'          AND gedl_doc_no = cr2.GESV_DOC_NO',
'          AND gedl_seq_no = cr2.GESV_SEQ_NO',
'          AND gedl_sub_seq_no = cr2.GESV_SUB_SEQ_NO;',
'    END IF;                        ',
'		EXCEPTION WHEN NO_DATA_FOUND THEN ',
'         v_err_msg := ''GRN Pfx. not found.'';      ',
'		END;',
'',
'         ELSE',
'  	 UPDATE gate_entry_details',
'      SET gedl_sel_rec = ''N'',gedl_user = NULL,gedl_rcpt_pfx = NULL',
'      WHERE gedl_bu = :GLOBAL_bu',
'          AND gedl_plnt  = cr2.gesv_plnt',
'          AND gedl_doc_no = cr2.gesv_doc_no',
'          AND gedl_seq_no = cr2.gesv_seq_no',
'          AND gedl_sub_seq_no = cr2.gesv_sub_seq_no;',
'   END IF;',
'',
'',
'  END LOOP;',
'',
'  IF v_err_msg IS NULL THEN',
'    htp.p(''success'');',
'    Commit;    ',
'  ELSE',
'    Rollback;',
'    htp.p(v_err_msg);',
'  END IF;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488316355860341234
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970271795126952251)
,p_process_sequence=>110
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECKQC'
,p_static_id=>'checkanduncheckqc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  UPDATE pur_order_ln',
'     SET pol_qc_required = apex_application.g_x10',
'   WHERE pol_bu = :GLOBAL_bu',
'     AND pol_order_no||pol_seq_no = apex_application.g_x09;',
' COMMIT;',
'htp.p(''success''); ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488309959583341223
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970272135753952253)
,p_process_sequence=>190
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECKSS'
,p_static_id=>'checkanduncheckss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'chk_alert   NUMBER (5);',
'',
'CURSOR c2 IS',
'SELECT *',
'  FROM suplr_schld_view',
' WHERE ssld_bu = :GLOBAL_BU',
'   AND ssld_doc_no||ssld_seq_no||ssld_sub_seq_no = apex_application.g_x01;',
'',
'cr2         c2%ROWTYPE;',
'',
'v_err_msg    VARCHAR2(1000);',
'',
'v_curr_proc_qty NUMBER(12,3);',
'v_tolr_qty      NUMBER(12,3);',
'v_excess_flag   pom_control.pomctrl_allw_exc_qty_rcpt_flag%TYPE;',
'v_excess_qty    NUMBER(12,3);',
'',
'BEGIN',
'  ',
'  FOR cr2 IN c2',
'  LOOP',
'   ',
'    IF apex_application.g_x03 = ''Y'' THEN',
'',
'      IF TO_NUMBER(APEX_APPLICATION.g_x02) is null OR (TO_NUMBER(APEX_APPLICATION.g_x02) <= 0) THEN',
'        v_err_msg := ''Curr. Process Qty. Should be greater than Zero.'';',
'        GOTO err;',
'      END IF;',
'',
'      SELECT pomctrl_allw_exc_qty_rcpt_flag INTO v_excess_flag',
'        FROM pom_control',
'       WHERE pomctrl_bu = :GLOBAL_bu',
'         AND pomctrl_plnt = cr2.sshd_plnt;',
'      ',
'      v_curr_proc_qty  :=  cr2.SSLD_SCHLD_QTY - (cr2.SSLD_INPROC_QTY + cr2.SSLD_RECVD_QTY + cr2.SSLD_CLS_QTY + CR2.ssld_cls_inproc_qty);',
'  ',
'      IF cr2.ssln_tolr_type = ''N'' THEN',
'        v_tolr_qty := 0;',
'        IF TO_NUMBER(APEX_APPLICATION.g_x02) > TO_NUMBER(v_curr_proc_qty) THEN',
'          v_excess_qty := TO_NUMBER(APEX_APPLICATION.g_x02) - TO_NUMBER(v_curr_proc_qty);',
'        ELSE',
'          v_excess_qty := 0;',
'        END IF;',
'      ELSIF cr2.ssln_tolr_type IN (''P'',''S'') THEN  ',
'        v_tolr_qty := cr2.SSLD_SCHLD_QTY * (cr2.ssln_tolr_pct / 100);',
'        IF TO_NUMBER(APEX_APPLICATION.g_x02) > (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty)) THEN',
'          v_excess_qty := TO_NUMBER(APEX_APPLICATION.g_x02) - (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty));',
'        ELSE',
'          v_excess_qty := 0;',
'        END IF;',
'--Raise_Application_Error(-20999,apex_application.g_x02||''/''||v_curr_proc_qty||''/''||cr2.ssln_tolr_type||''/''||v_tolr_qty||''/''||v_excess_qty);',
'      ',
'      ELSIF cr2.ssln_tolr_type = ''R'' THEN',
'        IF TO_NUMBER(APEX_APPLICATION.g_x02) > TO_NUMBER(v_curr_proc_qty) THEN',
'          v_tolr_qty := TO_NUMBER(APEX_APPLICATION.g_x02) - TO_NUMBER(v_curr_proc_qty);',
'        ELSE',
'          v_tolr_qty := 0;',
'        END IF;',
'        v_excess_qty := 0;',
'      END IF;',
'',
'      IF (TO_NUMBER(APEX_APPLICATION.g_x02) > TO_NUMBER(v_curr_proc_qty)) AND cr2.ssln_tolr_type = ''N'' AND v_excess_flag = ''N'' THEN ',
'        v_err_msg := ''Curr. Process Qty. Should not greater than Balance Qty.'';',
'        GOTO err;',
'      ELSIF (TO_NUMBER(APEX_APPLICATION.g_x02) > (TO_NUMBER(v_curr_proc_qty) + TO_NUMBER(v_tolr_qty))) AND cr2.ssln_tolr_type IN (''P'',''S'') AND v_excess_flag = ''N'' THEN ',
'        v_err_msg := ''Qty. with Tolr. Should not greater than Curr.Proc Qty.'';',
'        GOTO err;',
'      END IF;',
'',
'      UPDATE suplr_schld_ln_dtls',
'         SET ssld_proc_qty = apex_application.g_x02 - v_excess_qty,',
'             ssld_tolr_qty = v_tolr_qty,',
'             ssld_excs_qty = v_excess_qty,',
'             ssld_sel_flag = ''Y'',',
'             ssld_user = :GLOBAL_user',
'       WHERE ssld_bu = :GLOBAL_bu',
'         AND ssld_doc_no  = cr2.ssld_doc_no',
'         AND ssld_seq_no = cr2.ssld_seq_no',
'         AND ssld_sub_seq_no = cr2.ssld_sub_seq_no;',
'    ELSE',
'      UPDATE suplr_schld_ln_dtls',
'         SET ssld_proc_qty = 0,ssld_tolr_qty = 0,ssld_excs_qty = 0,',
'             ssld_sel_flag = ''N'',',
'             ssld_user = NULL',
'       WHERE ssld_bu = :GLOBAL_bu',
'         AND ssld_doc_no  = cr2.ssld_doc_no',
'         AND ssld_seq_no = cr2.ssld_seq_no',
'         AND ssld_sub_seq_no = cr2.ssld_sub_seq_no;',
'    END IF;',
'  END LOOP;',
'  ',
'  <<err>>',
'  IF v_err_msg IS NULL THEN',
'    htp.p(''success'');',
'    Commit;    ',
'  ELSE',
'    Rollback;',
'    htp.p(v_err_msg);',
'  END IF;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488310300210341225
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970283016646952274)
,p_process_sequence=>170
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRE_GRN_FR_GE'
,p_static_id=>'cre-grn-fr-ge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_rec_cnt  NUMBER;',
'BEGIN',
'SELECT COUNT(*) INTO v_rec_cnt',
'  FROM gate_entry_so_view',
' WHERE gesv_bu = :GLOBAL_bu',
'   AND gesv_mode = ''PR''',
'   AND gesv_sel_flag = ''Y''',
'   AND gesv_user = :GLOBAL_user;',
'',
'  HTP.P(NVL(v_rec_cnt,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488321181103341246
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970271429520952251)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRE_GRN_FR_PO'
,p_static_id=>'cre-grn-fr-po'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_rec_cnt  NUMBER;',
'BEGIN',
'SELECT COUNT(*) INTO v_rec_cnt',
'  FROM pur_order_so_view',
' WHERE posv_bu = :GLOBAL_bu',
'   AND posv_mode = ''PO''',
'   AND posv_sel_flag = ''Y''',
'   AND posv_sel_user = :GLOBAL_user;',
'',
'  HTP.P(NVL(v_rec_cnt,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488309593977341223
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970272557833952253)
,p_process_sequence=>210
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRE_GRN_FR_SS'
,p_static_id=>'cre-grn-fr-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_rec_cnt  NUMBER;',
'BEGIN',
'SELECT COUNT(*) INTO v_rec_cnt',
'  FROM suplr_schld_view',
' WHERE ssld_bu = :GLOBAL_bu',
'   AND ssld_sel_flag = ''Y''',
'   AND ssld_user = :GLOBAL_user',
'   AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = sshd_bu AND pomctrl_plnt = sshd_plnt AND pomctrl_gate_ent_flag = ''N'');',
'',
'  HTP.P(NVL(v_rec_cnt,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488310722290341225
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970274955559952257)
,p_process_sequence=>300
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRE_GRN_FR_STS'
,p_static_id=>'cre-grn-fr-sts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_rec_cnt  NUMBER;',
'BEGIN',
'SELECT COUNT(*) INTO v_rec_cnt',
'  FROM sales_invoices_hd',
' WHERE sihd_bu = :GLOBAL_bu',
'   AND sihd_status = ''I''',
'   AND sihd_stk_trfr_sel_flag = ''Y''',
'   AND sihd_stk_trfr_sel_user = :GLOBAL_user',
'   AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = sihd_bu AND pomctrl_plnt = sihd_trans_plnt AND pomctrl_gate_ent_flag = ''N'');',
'',
'  HTP.P(NVL(v_rec_cnt,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488313120016341229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970284600261952276)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gate Sel all'
,p_static_id=>'gate-sel-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1615131100_MODE := NULL;',
'',
'DECLARE',
'   c        NUMBER := 1;',
'   chk_all  CHAR;',
'   num      NUMBER;',
'   VAR_SES	VARCHAR2(50);',
'',
'   Cursor c2',
'   is',
'   select * ',
'   from GATE_ENTRY_SO_VIEW',
'  where GESV_BU=:GLOBAL_BU;',
'',
'  CR2       C2%Rowtype;',
'  ',
'	',
'BEGIN',
' chk_all := :P1615131100_GATE_SEL_FLAG;',
'',
'   For Cr2 in C2',
'   LOOP',
'   ',
'   ',
'      FOR i IN 1 .. c',
'      LOOP',
'         ',
'         --CR2.GATE_SEL_FLAG := ''Y'';',
'	proc_upd_ge_flag(:GLOBAL_bu,',
'	                 CR2.GESV_PLNT,',
'	                 CR2.GESV_DOC_NO,',
'	                 CR2.GESV_SEQ_NO,',
'	                 CR2.GESV_SUB_SEQ_NO,',
'	                 ''Y'',',
'	                 :GLOBAL_user',
'	                );',
'  CR2.GESV_USER := :GLOBAL_user;  ',
'      END LOOP;',
'      END LOOP C2;',
'   --END IF;',
'   ',
'   ',
'END;',
'DECLARE',
'  CURSOR c1 IS',
'      SELECT SUM((gesv_qty * gesv_unit_cost) - (((gesv_disc_pct/100) * gesv_unit_cost) * gesv_qty)) gesv_tot_cost',
'        FROM gate_entry_so_view',
'       WHERE gesv_bu = :global_bu',
'         AND gesv_sel_flag = ''Y'';',
'         ',
'  cr1 c1%ROWTYPE;',
'BEGIN',
'  OPEN c1;',
'  FETCH c1 INTO cr1;',
'     IF c1%FOUND THEN',
'       :P1615131100_GESV_TOT_COST := cr1.gesv_tot_cost;',
'     END IF;',
'  CLOSE c1;',
'END;     '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488322764718341248
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970283776129952274)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gate UnSel all'
,p_static_id=>'gate-unsel-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1615131100_MODE := NULL;',
'',
'DECLARE',
'   c        NUMBER := 1;',
'   chk_all  CHAR;',
'   num      NUMBER;',
'   VAR_SES	VARCHAR2(50);',
'',
'   Cursor c2',
'   is',
'   select * ',
'   from GATE_ENTRY_SO_VIEW',
'  where GESV_BU=:GLOBAL_BU;',
'',
'  CR2       C2%Rowtype;',
'  ',
'	',
'BEGIN',
' chk_all := :P1615131100_GATE_SEL_FLAG;',
'',
'   For Cr2 in C2',
'   LOOP',
'   ',
'   ',
'      FOR i IN 1 .. c',
'      LOOP',
'         ',
'         --CR2.GATE_SEL_FLAG := ''Y'';',
'	proc_upd_ge_flag(:GLOBAL_bu,',
'	                 CR2.GESV_PLNT,',
'	                 CR2.GESV_DOC_NO,',
'	                 CR2.GESV_SEQ_NO,',
'	                 CR2.GESV_SUB_SEQ_NO,',
'	                 ''N'',',
'	                 :GLOBAL_user',
'	                );',
'  CR2.GESV_USER := :GLOBAL_user;  ',
'      END LOOP;',
'      END LOOP C2;',
'   --END IF;',
'   ',
'   ',
'END;',
'DECLARE',
'  CURSOR c1 IS',
'      SELECT SUM((gesv_qty * gesv_unit_cost) - (((gesv_disc_pct/100) * gesv_unit_cost) * gesv_qty)) gesv_tot_cost',
'        FROM gate_entry_so_view',
'       WHERE gesv_bu = :global_bu',
'         AND gesv_sel_flag = ''Y'';',
'         ',
'  cr1 c1%ROWTYPE;',
'BEGIN',
'  OPEN c1;',
'  FETCH c1 INTO cr1;',
'     IF c1%FOUND THEN',
'       :P1615131100_GESV_TOT_COST := cr1.gesv_tot_cost;',
'     END IF;',
'  CLOSE c1;',
'END;     '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488321940586341246
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970278606128952263)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK1'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag      VARCHAR2(5);',
'    v_count      VARCHAR2(10);',
'BEGIN',
'    /*SELECT',
'    CASE',
'        WHEN POSV_SEL_FLAG  = ''N'' THEN',
'            ''N''',
'        WHEN POSV_SEL_FLAG  = ''Y'' THEN',
'            ''Y''',
'        ELSE',
'            ''NY''',
'    END flag INTO v_flag',
'FROM',
'    ( SELECT',
'            LISTAGG(DISTINCT POSV_SEL_FLAG , '','') WITHIN GROUP(',
'            ORDER BY',
'                POSV_SEL_FLAG ',
'            ) POSV_SEL_FLAG ',
'        FROM PUR_ORDER_SO_VIEW',
'         WHERE POSV_BU = :GLOBAL_BU ',
'           AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'           AND POSV_MODE = ''PO''',
'           AND posv_matl_type <> ''T''',
'                        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N''));',
'',
'    SELECT NVL(COUNT(POSV_SEL_FLAG),0 ) INTO v_count',
'       ',
'         FROM PUR_ORDER_SO_VIEW',
'         WHERE POSV_BU = :GLOBAL_BU',
'		   AND POSV_SEL_FLAG = ''Y''',
'AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'        AND POSV_MODE = ''PO''',
'        AND posv_matl_type <> ''T''',
'                        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N'');',
'    HTP.P(v_flag||''-''||v_count||'' ''||''Row Selected'');*/',
'',
'  SELECT COUNT(*) INTO v_count',
'    FROM pur_order_so_view',
'   WHERE posv_bu = :GLOBAL_BU',
'     AND posv_sel_flag = ''Y''',
'     AND posv_mode = ''PO''',
'     AND posv_sel_user = :GLOBAL_user;',
'',
'  IF v_count > 0 THEN',
'    v_flag := ''Y'';',
'  ELSE',
'    v_flag := ''N'';',
'  END IF;',
'',
'',
'  SELECT NVL(COUNT(posv_sel_flag),0 ) INTO v_count',
'    FROM pur_order_so_view',
'   WHERE posv_bu = :GLOBAL_BU',
'     AND posv_sel_flag = ''Y''',
'     AND posv_mode = ''PO''',
'     AND posv_sel_user = :GLOBAL_user',
'     ;',
'     ',
'    HTP.P(v_flag||''-''||v_count||'' ''||''Row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488316770585341235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970273797495952256)
,p_process_sequence=>270
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK_SS'
,p_static_id=>'overallcheck-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag      VARCHAR2(5);',
'    v_count      NUMBER;',
'    v_count1   NUMBER;',
'BEGIN',
'',
'  SELECT COUNT(*) INTO v_count1',
'    FROM suplr_schld_view',
'   WHERE ssld_bu = :GLOBAL_BU',
'     AND ssld_sel_flag = ''Y''',
'     AND ssld_user = :GLOBAL_user;',
'',
'  IF v_count1 > 0 THEN',
'    v_flag := ''Y'';',
'  ELSE',
'    v_flag := ''N'';',
'  END IF;',
'',
'  SELECT NVL(COUNT(ssld_sel_flag),0 ) INTO v_count',
'    FROM suplr_schld_view',
'   WHERE ssld_bu = :GLOBAL_BU',
'     AND ssld_sel_flag = ''Y''',
'     --AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = gesv_bu AND pomctrl_plnt = gesv_plnt AND pomctrl_gate_ent_flag = ''Y'')',
'     ;',
'     ',
'    HTP.P(v_flag||''-''||v_count||'' ''||''Row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488311961952341228
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970276153537952257)
,p_process_sequence=>330
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK_STS'
,p_static_id=>'overallcheck-sts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag      VARCHAR2(5);',
'    v_count      NUMBER;',
'    v_count1   NUMBER;',
'BEGIN',
'',
'  SELECT COUNT(*) INTO v_count1',
'    FROM sales_invoices_hd',
'   WHERE sihd_bu = :GLOBAL_BU',
'     AND sihd_stk_trfr_sel_flag = ''Y''',
'     AND sihd_stk_trfr_sel_user = :GLOBAL_user;',
'',
'  IF v_count1 > 0 THEN',
'    v_flag := ''Y'';',
'  ELSE',
'    v_flag := ''N'';',
'  END IF;',
'',
'  SELECT NVL(COUNT(sihd_stk_trfr_sel_flag),0 ) INTO v_count',
'    FROM sales_invoices_hd',
'   WHERE sihd_bu = :GLOBAL_BU',
'     AND sihd_stk_trfr_sel_flag = ''Y''',
'     AND sihd_stk_trfr_sel_user = :GLOBAL_user',
'     --AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = gesv_bu AND pomctrl_plnt = gesv_plnt AND pomctrl_gate_ent_flag = ''Y'')',
'     ;',
'     ',
'    HTP.P(v_flag||''-''||v_count||'' ''||''Row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488314317994341229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970278953132952263)
,p_process_sequence=>150
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECKGE'
,p_static_id=>'overallcheckge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag      VARCHAR2(5);',
'    v_count      NUMBER;',
'    v_count1   NUMBER;',
'BEGIN',
'  /*SELECT CASE WHEN gesv_sel_flag  = ''N'' THEN ''N''',
'              WHEN gesv_sel_flag  = ''Y'' THEN ''Y''',
'              ELSE ''NY''',
'         END flag INTO v_flag',
'   FROM (SELECT LISTAGG(DISTINCT gesv_sel_flag , '','') WITHIN GROUP(ORDER BY gesv_sel_flag) gesv_sel_flag ',
'           FROM gate_entry_so_view',
'          WHERE gesv_bu = :GLOBAL_BU ',
'            AND gesv_mode = ''PR''',
'            AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = gesv_bu AND pomctrl_plnt = gesv_plnt AND pomctrl_gate_ent_flag = ''Y''));*/',
'',
'  SELECT COUNT(*) INTO v_count1',
'    FROM gate_entry_so_view',
'   WHERE gesv_bu = :GLOBAL_BU',
'     AND gesv_sel_flag = ''Y''',
'     AND gesv_mode = ''PR''',
'     AND gesv_user = :GLOBAL_user;',
'',
'  IF v_count1 > 0 THEN',
'    v_flag := ''Y'';',
'  ELSE',
'    v_flag := ''N'';',
'  END IF;',
'',
'  SELECT NVL(COUNT(gesv_sel_flag),0 ) INTO v_count',
'    FROM gate_entry_so_view',
'   WHERE gesv_bu = :GLOBAL_BU',
'     AND gesv_sel_flag = ''Y''',
'     AND gesv_mode = ''PR''',
'     --AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = gesv_bu AND pomctrl_plnt = gesv_plnt AND pomctrl_gate_ent_flag = ''Y'')',
'     ;',
'     ',
'    HTP.P(v_flag||''-''||v_count||'' ''||''Row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488317117589341235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970270943837952249)
,p_process_sequence=>220
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Add Line from GE'
,p_static_id=>'process-for-add-line-from-ge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'v_cnt NUMBER;',
'BEGIN',
'',
'  SELECT COUNT(*) INTO v_cnt',
'    FROM Gate_entry_so_view',
'   WHERE gesv_bu = :GLOBAL_bu',
'     AND gesv_sel_flag = ''Y''',
'     AND gesv_user = :GLOBAL_user;',
'',
'  IF v_cnt = 0 Then',
'    raise_application_error(-20999,''Select One Document to process'');',
'  END IF;',
'',
'  proc_add_pur_rcpt_frm_ge(:GLOBAL_bu,:P1615131100_RCPT_PFX,:P1615131100_RCPT_NO,:GLOBAL_USER);',
'  ',
'  Commit;',
'',
'EXCEPTION WHEN OTHERS THEN',
'  proc_apex_err_msg_log(:GLOBAL_PAGE_ID,''ADD_LINE PROCESS'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Line added in GRN -&P1615131100_RCPT_NO.'
,p_internal_uid=>488309108294341221
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970279735839952267)
,p_process_sequence=>210
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Add Line from PO'
,p_static_id=>'process-for-add-line-from-po'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'v_cnt NUMBER;',
'BEGIN',
'  ',
'  SELECT count(*) INTO v_cnt ',
'    FROM pur_order_so_view',
'   WHERE posv_bu = :global_bu',
'     AND posv_sel_flag = ''Y''',
'     AND posv_sel_user = :GLOBAL_user;',
'',
'  IF v_cnt = 0 Then',
'    raise_application_error(-20999,''Select One Document to process'');',
'  END IF;',
'',
'  FOR cr1 IN (SELECT posv_plnt,',
'                       TRUNC(posv_order_date) posv_order_date,',
'                                         posv_ord_pfx||''/''||posv_ord_no||''/''||posv_ord_seq_no/* ||''-''||posv_ord_sub_seq_no */ ord_no,',
'                                         posv_ord_no||''/''||posv_ord_seq_no ord_no1,',
'                                         posv_prod_id||''-''||posv_prod_rev item_id,',
'                                         posv_prod_id,',
'                                         posv_prod_rev,pomctrl_backlog_entry_flag',
'                                    FROM pur_order_so_view,pom_control',
'												WHERE pomctrl_bu = posv_bu',
'                                      AND pomctrl_plnt = posv_plnt',
'                                      AND posv_bu = :global_bu',
'												  AND posv_sel_flag = ''Y''',
'												  AND posv_sel_user = :GLOBAL_user',
'									order by posv_ord_no,posv_ord_seq_no)--,posv_ord_sub_seq_no)',
'',
'  LOOP',
'    ',
'         IF cr1.pomctrl_backlog_entry_flag = ''N'' AND :P1615131100_RCPT_DATE <> TRUNC(SYSDATE) THEN',
'           Raise_Application_Error(-20999,''Transaction Date should be equal to System Date.'');',
'         END IF;',
'',
'    IF cr1.posv_order_date > :P1615131100_RCPT_DATE THEN',
'      raise_application_error(-20999,''Trans. date Should be greater than or equal to the order date for Order : ''||cr1.ord_no1);',
'    END IF;',
'',
'        IF func_find_procure_hold_flag(:global_bu,cr1.posv_plnt,cr1.posv_prod_id,cr1.posv_prod_rev) = ''Y'' THEN',
'            raise_application_error(-20999,''Procurement is hold for this item''||'' ''||'':''||cr1.posv_prod_id);',
'        END IF;',
'',
'  END LOOP;',
'',
'   proc_add_pur_rcpt_frm_po(:GLOBAL_bu,:P1615131100_RCPT_PFX,:P1615131100_RCPT_NO,:GLOBAL_USER);',
'   ',
'   Commit;',
'   ',
'EXCEPTION WHEN OTHERS THEN',
'  proc_apex_err_msg_log(:GLOBAL_PAGE_ID,''ADD_LINE PROCESS'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Line added in GRN -&P1615131100_RCPT_NO.'
,p_internal_uid=>488317900296341239
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970276566474952259)
,p_process_sequence=>230
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Add Line from SS'
,p_static_id=>'process-for-add-line-from-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'v_cnt NUMBER;',
'BEGIN',
'',
'  SELECT COUNT(*) INTO v_cnt',
'    FROM suplr_schld_view',
'   WHERE ssld_bu = :GLOBAL_bu',
'     AND ssld_sel_flag = ''Y''',
'     AND ssld_user = :GLOBAL_user;',
'',
'  IF v_cnt = 0 Then',
'    raise_application_error(-20999,''Select One Document to process.'');',
'  END IF;',
'',
'FOR cr1 IN ( SELECT ssld_schld_date, sshd_doc_pfx, sshd_doc_no,ssln_prod_id,ssln_prod_rev,sshd_plnt,pomctrl_backlog_entry_flag',
'                 FROM suplr_schld_view,pom_control',
'                WHERE pomctrl_bu = sshd_bu',
'                    AND pomctrl_plnt = sshd_plnt',
'                    AND sshd_bu = :global_bu ',
'                  AND ssld_sel_flag = ''Y''',
'                  AND ssld_user = :global_user)',
'LOOP 	',
'IF cr1.pomctrl_backlog_entry_flag = ''N'' AND :P1615131100_RCPT_DATE < TRUNC(SYSDATE) THEN',
'           Raise_Application_Error(-20999,''Backlog Transaction not allowed.'');',
'         END IF;',
'',
'  	IF TRUNC(cr1.ssld_schld_date) > :P1615131100_RCPT_DATE THEN',
'  		RAISE_APPLICATION_ERROR(-20999,''Trans. Date should be greater than or equal to schld. date for the order no.''||cr1.sshd_doc_no);',
'  	END IF;  	',
'	IF func_find_procure_hold_flag(:GLOBAL_bu,cr1.sshd_plnt,cr1.ssln_prod_id,cr1.ssln_prod_rev) = ''Y'' THEN',
'            RAISE_APPLICATION_ERROR(-20999,''Procurement is hold for this item''||'' ''||'':''||'' ''||cr1.ssln_prod_id);',
'  	END IF;',
'END LOOP;',
'',
'  proc_add_pur_rcpt_frm_ss(:GLOBAL_bu,:P1615131100_RCPT_PFX,:P1615131100_RCPT_NO,:GLOBAL_USER);',
'',
'EXCEPTION WHEN OTHERS THEN',
'  proc_apex_err_msg_log(:GLOBAL_PAGE_ID,''ADD_LINE PROCESS'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Line added in GRN -&P1615131100_RCPT_NO.'
,p_internal_uid=>488314730931341231
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970280216853952267)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Create GRN from GE'
,p_static_id=>'process-for-create-grn-from-ge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1615131100_DATE_1 IS NULL THEN',
'	Raise_application_error(-20999,''Date must be entered.'');',
'END IF;',
'',
'IF :P1615131100_DATE_1 > TRUNC(SYSDATE) THEN',
'  Raise_application_error(-20999,''Future Date not allowed.'');',
'END IF;',
'',
'DECLARE',
'	var_cnt	   	NUMBER;',
'	var_alert  	NUMBER;',
'	var_rcpt_no	VARCHAR2(2000);',
'	var_land_no VARCHAR2(2000);',
'     ',
'BEGIN',
'	',
'	 SELECT COUNT(*)',
'	  INTO var_cnt',
'	  FROM Gate_entry_so_view',
'	 WHERE gesv_bu = :GLOBAL_bu',
'	   AND gesv_sel_flag = ''Y''',
'	   AND gesv_user = :GLOBAL_user;',
'	   ',
'	IF var_cnt = 0 THEN',
'		Raise_application_error(-20999,''Select atleast  one Document to Process.'');',
'	END IF;',
'	 ',
'	',
'	--IF var_alert = ALERT_BUTTON1 THEN',
'		',
'	  FOR cr1 in (SELECT *',
'	                FROM Gate_entry_so_view,pom_control',
'	               WHERE pomctrl_bu = gesv_bu',
'                    AND pomctrl_plnt = gesv_plnt',
'                    AND gesv_bu = :GLOBAL_bu',
'			   AND gesv_sel_flag = ''Y''',
'			   AND gesv_user = :GLOBAL_user)',
'  	LOOP',
'  		',
'         IF cr1.pomctrl_backlog_entry_flag = ''N'' AND :P1615131100_DATE_1 < TRUNC(SYSDATE) THEN',
'           Raise_Application_Error(-20999,''Backlog Transaction not allowed.'');',
'         END IF;',
'',
'   	IF TRUNC(cr1.gesv_date) > :P1615131100_DATE_1 THEN',
'  		Raise_application_error(-20999,''Trans. Date should be greater than or equal to gate entry date.'');',
'   	END IF;',
'   	',
'	   /* IF func_find_procure_hold_flag(:GLOBAL_bu,cr1.gesv_plnt,cr1.gesv_prod_id,cr1.gesv_prod_rev) = ''Y'' THEN',
'	      Raise_application_error(-20999,''Procurement is hold for this item''||'' ''||'':''||'' ''||cr1.gesv_prod_id);',
'	    END IF;*/',
'	  END LOOP;',
'		proc_cre_pur_rcpt_frm_ge(:GLOBAL_bu,',
'					 :P1615131100_DATE_1,',
'					 :GLOBAL_user,',
'		                         1,',
'		                         var_rcpt_no);',
'           ',
'		IF var_rcpt_no IS NOT NULL THEN    ',
'			',
'			--Raise_application_error(-20999,''GRN Created for No :''||var_rcpt_no);',
'         :P1615131100_VAR_RCPT_NO := REGEXP_SUBSTR(var_rcpt_no,''[^to"]+'',1,1);',
'                apex_application.g_print_success_message := ''GRN Created for No. : ''||var_rcpt_no; ',
'                commit;',
'	  END IF;	',
'		',
'EXCEPTION WHEN OTHERS THEN',
'  proc_apex_err_msg_log(:GLOBAL_PAGE_ID,''CREATE GRN'');',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488318381310341239
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970279346546952263)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Create GRN from PO'
,p_static_id=>'process-for-create-grn-from-po'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1615131100_DATE IS NULL THEN',
'    raise_application_error(-20999,''Date must be entered.'');',
'ELSIF :P1615131100_DATE > TRUNC(SYSDATE) THEN',
'    raise_application_error(-20999,''GRN date should be less than or equal to sysdate.'');',
'ELSIF :P1615131100_SUPLR_BILL_DATE > :P1615131100_DATE THEN',
'    raise_application_error(-20999,''Suplr. Bill date should be less than or equal to GRN date.''); ',
'ELSIF :P1615131100_DC_DATE > :P1615131100_DATE THEN',
'    raise_application_error(-20999,''DC date should be less than or equal to GRN date.'');   ',
'ELSIF :P1615131100_SUPLR_BILL_NO IS NULL THEN ',
'   raise_application_error(-20999,''Suplr. Bill No. must be entered.''); ',
'ELSIF :P1615131100_DC_NO IS NULL THEN ',
'  raise_application_error(-20999,''DC no. must be entered.''); ',
'ELSE',
'    FOR cr1 IN (SELECT posv_plnt,',
'                       TRUNC(posv_order_date) posv_order_date,',
'                                         posv_ord_pfx||''/''||posv_ord_no||''/''||posv_ord_seq_no/* ||''-''||posv_ord_sub_seq_no */ ord_no,',
'                                         posv_prod_id||''-''||posv_prod_rev item_id,',
'                                         posv_prod_id,',
'                                         posv_prod_rev,pomctrl_backlog_entry_flag',
'                                    FROM pur_order_so_view,pom_control',
'												WHERE pomctrl_bu = posv_bu',
'                                      AND pomctrl_plnt = posv_plnt',
'                                      AND posv_bu = :global_bu',
'												  AND posv_sel_flag = ''Y''',
'												 -- AND posv_session_id = :global_user',
'									order by posv_ord_no,posv_ord_seq_no)--,posv_ord_sub_seq_no)',
'',
'	    LOOP',
'',
'         IF cr1.pomctrl_backlog_entry_flag = ''N'' AND :P1615131100_DATE < TRUNC(SYSDATE) THEN',
'           Raise_Application_Error(-20999,''Backlog Transaction not allowed.'');',
'         END IF;',
'',
'        IF cr1.posv_order_date > :P1615131100_DATE THEN',
'       raise_application_error(-20999,''Trans. date Should be greater than or equal to order date for the order no''||'':''||cr1.ord_no);',
'        END IF;',
'        proc_date_chk(:global_bu,:P1615131100_DATE,''POM'',NULL);',
'',
'        IF func_find_procure_hold_flag(:global_bu,cr1.posv_plnt,cr1.posv_prod_id,cr1.posv_prod_rev) = ''Y'' THEN',
'            raise_application_error(-20999,''Procurement is hold for this item''||'' ''||'':''||cr1.posv_prod_id);',
'        END IF;',
'',
'  END LOOP;',
'        END IF;',
'',
'/* IF (func_find_pom_ge_flag(:global_bu,:P1615131100_POSV_PLANT) = ''N'' ',
'         OR (:posv_stocked = ''N'' AND func_find_pom_ge_flag(:global_bu,:P1615131100_POSV_PLANT) = ''Y'')) THEN */',
'',
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM pur_order_so_view',
'       WHERE     posv_bu = :global_bu',
'             AND posv_sel_flAG= ''Y'';',
'           --  AND posv_session_id = :global_user;',
'',
'   CURSOR c2 (c_plnt VARCHAR2)',
'   IS',
'      SELECT *',
'        FROM pom_control',
'       WHERE pomctrl_bu = :global_bu AND pomctrl_plnt = c_plnt;',
'',
'   CURSOR c_pfx (',
'      c_plnt    VARCHAR2,',
'      c_pfx     VARCHAR2)',
'   IS',
'      SELECT pppa_grn_pfx',
'        FROM pr_po_pfx_asso',
'       WHERE     pppa_bu = :global_bu',
'             AND pppa_plnt = c_plnt',
'             AND pppa_po_pfx = c_pfx',
'             AND pppa_user = :global_user; ',
'',
'',
'   chk_alert                 NUMBER;',
'   var_res                   VARCHAR2 (4000);',
'   v_cnt                     NUMBER;',
'   var_res1                  VARCHAR (1);',
'   cr2                       c2%ROWTYPE;',
'   cr_pfx                    c_pfx%ROWTYPE;',
'   var_cnt2                  NUMBER;',
'   v_delay_reasn_rqrd_flag   VARCHAR2 (1);',
'BEGIN',
'',
'    for cr1 in c1',
'    loop',
'         select COUNT(*) ',
'       into v_cnt',
'       from po_rcpt_first_stage_insp_hd,',
'            po_rcpt_first_stage_insp_ln',
'      where prfsih_bu = prfsil_bu',
'        and prfsih_plnt = prfsil_plnt',
'        and prfsih_doc_no = prfsil_doc_no',
'        and prfsih_bu = :global_bu',
'        and prfsih_plnt = cr1.posv_plnt',
'        and prfsih_po_pfx = cr1.posv_ord_pfx',
'        and prfsih_po_no = cr1.posv_ord_no',
'        and prfsih_suplr_id = cr1.posv_suplr',
'        and prfsil_prod_id = cr1.posv_prod_id',
'        and prfsil_prod_rev = cr1.posv_prod_rev',
'        and (prfsih_status <> ''A'' OR prfsil_status <> ''A'');',
'        ',
'     if v_cnt > 0 then',
'         Raise_application_error(-20999,'' Items pending in first stage inspection.''||cr1.posv_prod_id||''-''||cr1.posv_prod_rev);',
'     end if;',
'             ',
'     end loop;',
'     ',
'     ',
'                proc_cre_pur_rcpt_frm_po(p_bu =>:GLOBAL_bu,',
'                                         p_user => :GLOBAL_user,',
'                                         p_user_emp_id => :GLOBAL_emp_id,',
'                                         p_date => :P1615131100_DATE,',
'                                         p_res  => var_res,',
'                                         p_suplr_bill_date => :P1615131100_SUPLR_BILL_DATE,',
'                                         p_suplr_bill_no   => :P1615131100_SUPLR_BILL_NO,',
'                                         p_dc_date         => :P1615131100_DC_DATE,',
'                                         p_dc_no           => :P1615131100_DC_NO);',
'',
'               if var_res is not null then',
'                  :P1615131100_GRN_NO := TRIM(REGEXP_SUBSTR(var_res,''[^to"]+'',1,1));',
'                  apex_application.g_print_success_message := ''GRN Created for No. : ''||var_res;                  ',
'               end if;',
'                ',
'    commit;',
'      :P1615131100_DATE:=NULL;      ',
'     EXCEPTION WHEN OTHERS THEN',
'         proc_apex_err_msg_log(:GLOBAL_PAGE_ID,SQLERRM); ',
'',
'end;',
'',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488317511003341235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970274153019952256)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Create GRN from SS'
,p_static_id=>'process-for-create-grn-from-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1615131100_SS_DATE1 > TRUNC(SYSDATE) THEN',
'  Raise_application_error(-20999,''Future Date not allowed.'');',
'END IF;',
'',
'BEGIN',
'FOR cr1 IN ( SELECT ssld_schld_date, sshd_doc_pfx, sshd_doc_no,ssln_prod_id,ssln_prod_rev,sshd_plnt,pomctrl_backlog_entry_flag',
'                 FROM suplr_schld_view,pom_control',
'                WHERE pomctrl_bu = sshd_bu',
'                    AND pomctrl_plnt = sshd_plnt',
'                    AND sshd_bu = :global_bu ',
'                  AND ssld_sel_flag = ''Y''',
'                  AND ssld_user = :global_user)',
'LOOP 	',
'IF cr1.pomctrl_backlog_entry_flag = ''N'' AND :P1615131100_SS_DATE1 < TRUNC(SYSDATE) THEN',
'           Raise_Application_Error(-20999,''Backlog Transaction not allowed.'');',
'         END IF;',
'',
'  	IF TRUNC(cr1.ssld_schld_date) > :P1615131100_SS_DATE1 THEN',
'  		RAISE_APPLICATION_ERROR(-20999,''Trans. Date should be greater than or equal to schld. date for the order no.''||cr1.sshd_doc_no);',
'  	END IF;  	',
'	IF func_find_procure_hold_flag(:GLOBAL_bu,cr1.sshd_plnt,cr1.ssln_prod_id,cr1.ssln_prod_rev) = ''Y'' THEN',
'            RAISE_APPLICATION_ERROR(-20999,''Procurement is hold for this item''||'' ''||'':''||'' ''||cr1.ssln_prod_id);',
'  	END IF;',
'END LOOP;',
'',
'DECLARE',
'	v_doc_no	VARCHAR2(200);',
'BEGIN',
'  proc_ins_ge_grn_frm_suplr_schd(:GLOBAL_bu,:GLOBAL_user,1,:P1615131100_SS_DATE1,v_doc_no,',
'                                 p_suplr_bill_no => :P1615131100_SS_SUPLR_BILL_NO,',
'                                 p_suplr_bill_date => :P1615131100_SS_SUPLR_BILL_DATE,',
'                                 p_dc_no => :P1615131100_SS_DC_NO,',
'                                 p_dc_date => :P1615131100_SS_DC_DATE);',
'            ',
'  IF v_doc_no IS NOT NULL THEN',
'    :P1615131100_GRN_NO :=TRIM(REGEXP_SUBSTR(v_doc_no, ''[^to]+'', 1, 1) );',
'    apex_application.g_print_success_message := ''GRN Created for No. : ''||v_doc_no;',
'  END IF;',
'END;',
'',
'EXCEPTION WHEN OTHERS THEN',
'  proc_apex_err_msg_log(1615131109,''Pending Supplier Schedule'');  ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488312317476341228
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970280580869952268)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Create GRN from ST'
,p_static_id=>'process-for-create-grn-from-st'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	var_sel_flag NUMBER;',
'	var_trfr_plnt	VARCHAR(10); ',
'BEGIN',
'	SELECT COUNT(*)',
'	  INTO var_sel_flag',
'	  FROM sales_invoices_hd',
'	 WHERE sihd_bu = :global_bu',
'	   AND sihd_stk_trfr_sel_flag = ''Y''',
'	   AND sihd_stk_trfr_sel_user = :GLOBAL_USER;',
'	   ',
'	 IF var_sel_flag = 0 THEN ',
'	 raise_application_error(-20999,''Select Any one document.'');',
'	 END IF;	   ',
'END;',
'',
'/* IF func_find_stk_trfr_backlog_flg(:global_bu) = ''Y'' THEN',
'',
'  Show_Window(''WND_DATE'');',
'  Show_View(''CAN_DATE1'');',
'  Go_Item(''BLK_DATE1.P_DATE'');	',
'  ',
'ELSE */',
'	',
'DECLARE',
'	v_alert				NUMBER;',
'	var_res				VARCHAR2(1000);',
'	var_res1				VARCHAR2(1000);',
'	var_result		VARCHAR2(1);',
'BEGIN',
'  ',
'  FOR cr1 IN (SELECT val',
'					      FROM (                ',
'					    SELECT 1 val',
'					      FROM sales_invoices_hd',
'					     WHERE sihd_bu = :global_bu',
'					       AND sihd_stk_trfr_sel_flag = ''Y''',
'					       AND sihd_stk_trfr_sel_user = :global_user    ',
'					       AND sihd_type IN (''SIT'',''IR'')   ',
'					     UNION ALL',
'					    SELECT 2 val',
'					      FROM sales_invoices_hd',
'					     WHERE sihd_bu = :global_bu',
'					       AND sihd_stk_trfr_sel_flag = ''Y''',
'					       AND sihd_stk_trfr_sel_user = :global_user    ',
'					       AND sihd_type IN (''LI'',''LE'',''RP'',''RB'')        ',
'					       )',
'					       GROUP BY val)',
'  LOOP',
'  	',
'  	IF cr1.val = 1 THEN ',
'			proc_cre_stk_trf_grn_frm_si(:global_bu,',
'													  :global_user,',
'													  TRUNC(SYSDATE),',
'													  1,',
'													  var_res,',
'													  var_res1);',
'  	  --proc_commit;',
'',
'		  IF var_res IS NOT NULL THEN ',
'		  	--alert_msg(''Gate Entry Document Created.''||''-''||var_res,''N'');',
'         apex_application.g_print_success_message := ''Gate Entry Document Created. ''||var_res;   ',
'		  END IF;',
'		',
'		  IF var_res1 IS NOT NULL THEN ',
'',
'  IF var_res1 IS NOT NULL THEN',
'    :P1615131100_RCPT_NO := TRIM(REGEXP_SUBSTR(var_res1, ''[^to]+'', 1, 1) );',
'    apex_application.g_print_success_message := ''GRN Created for No : ''||var_res1;',
'  END IF;',
'',
'        --:P1615131100_RCPT_NO := var_res1;',
'        -- apex_application.g_print_success_message := ''GRN Created for No. : ''||var_res1; ',
'		 -- 	alert_msg(''GRN Created.''||''-''||var_res1,''N'');',
'		  END IF;',
'		ELSIF cr1.val = 2 THEN ',
'		',
'		  FOR cr2 IN (SELECT *',
'					          FROM sales_invoices_hd',
'					         WHERE sihd_bu = :global_bu',
'					           AND sihd_stk_trfr_sel_flag = ''Y''',
'					           AND sihd_stk_trfr_sel_user = :global_user    ',
'					           AND sihd_type IN (''LI'',''LE'',''RP'',''RB'',''SIT'')  )',
'		  LOOP',
'		  ',
'		    proc_cre_grn_frm_si(:global_bu,',
'                            cr2.sihd_plant,',
'                            cr2.sihd_doc_no,',
'                            1,',
'                            :global_user,',
'                            var_result',
'                           );',
'        ',
'        IF var_result = ''N'' THEN',
'         -- Alert_Msg(''Document not created'',''S'');',
'           apex_application.g_print_success_message := ''Document not created''; ',
'        END IF;  ',
'        ',
'		  END LOOP;',
'		  ',
'      UPDATE sales_invoices_hd',
'         SET sihd_stk_trfr_sel_flag = ''N'',',
'             sihd_stk_trfr_sel_user = NULL',
'       WHERE sihd_bu = :global_bu',
'         AND sihd_stk_trfr_sel_flag = ''Y''',
'         AND sihd_stk_trfr_sel_user = :global_user;',
'     		  ',
'		  IF var_result = ''Y'' THEN ',
'		  	--Proc_Commit;',
'           :P1615131100_RCPT_NO := var_result;',
'		              apex_application.g_print_success_message := ''GRN Created for No.. : ''||var_result; ',
'		  END IF;',
'		  ',
'		END IF;',
'  END LOOP;',
'  ',
'',
'END;',
'--END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488318745326341240
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970285752712952279)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sel_all_po_sco'
,p_static_id=>'sel-all-po-sco'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1615131100_MODE  :=NULL;',
'',
'DECLARE',
'   c        NUMBER := 1;',
'   chk_all  CHAR;',
'   num      NUMBER;',
'   VAR_SES	VARCHAR2(50);',
'  ',
'   CURSOR C7 ',
'         IS',
'         SELECT * ',
'            FROM PUR_ORDER_SO_VIEW',
'          WHERE POSV_BU = :GLOBAL_BU;',
'          --AND POSV_ORD_NO = :P1615131100_POSV_ORD_NO;',
'          ',
'          CR7    C7%ROWTYPE;',
'	',
'BEGIN',
'     FOR CR7 IN C7',
'     LOOP',
'	-- chk_all := cr7.posv_SEL_FLAG;',
'	--raise_application_error(-20999,cr7.posv_SEL_FLAG);',
'   ',
'   --IF chk_all = ''N''',
'  --THEN ',
'    --  FOR i IN 1 .. APEX_APPLICATION.g_f01.COUNT',
'    --  LOOP',
'        --if apex_application.g_f01(i) > 0 --AND cr7.posv_sel_flag = ''N'' ',
'        --THEN',
'         --cr7.posv_SEL_FLAG := ''Y'';',
'       ',
'        proc_upd_po_sel_flag(:GLOBAL_bu,',
'		                     cr7.POSV_ORD_PFX,',
'		                     cr7.POSV_ORD_NO,',
'		                     cr7.POSV_ORD_SEQ_NO,',
'		                     cr7.posv_ORD_SUB_SEQ_NO,',
'		                     ''Y'',',
'		                     cr7.POSV_ORD_QTY - (cr7.POSV_RECEIPT_QTY + cr7.POSV_PROCESS_QTY + cr7.POSV_CS_QTY),',
'                             --cr7. posv_inprocess_qty,-- apex_application.g_f01(i),--  cr7.posv_inprocess_qty,--',
'		                     cr7.POSV_EXCESS_QTY,',
'		                     cr7.POSV_TOLR_PCT,',
'		                     cr7.POSV_TOLR_QTY,',
'		                     :GLOBAL_user,',
'		                     1);',
'        proc_commit;',
'        ',
'		:P1615131100_POSV_PLNT := cr7.POSV_PLNT;',
'		 Commit;',
'		',
'        ',
'       -- END IF;',
'      ',
'      END LOOP;',
'  -- END IF;',
'  -- END LOOP;',
'   END;',
'',
'',
'   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488323917169341251
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970286178796952279)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sel_all_supp'
,p_static_id=>'sel-all-supp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**IF ((CR1.CURR_PROC_QTY IS NULL OR CR1.CURR_PROC_QTY = 0) AND CR1.SEL_FLAG =''Y'') THEN',
'        CR1.SEL_FLAG := ''N'';',
'        proc_COMMIT;',
'    Raise_application_error(-20999,''Current Process Qty. should be greater than Zero.'');',
'END IF;*/',
'',
':p1615131100_MODE := NULL;',
'',
'DECLARE',
'   c         NUMBER := 1;',
'   chk_all   CHAR;',
'   num       NUMBER;',
'   var_ses   VARCHAR2 (50);',
'',
'   cursor c1',
'   is',
'     select * ',
'        from SUPLR_SCHLD_VIEW',
'      WHERE SSHD_BU = :GLOBAL_BU;',
'',
'      CR1          C1%Rowtype;',
'BEGIN',
'   --chk_all := CR1.sel_flag;',
'    ',
'    For CR1 in C1',
'    LOOP',
' ',
'      --FOR i IN 1 .. c',
'      --LOOP',
'       --raise_application_error(-20999,''test''||CR1.sel_flag);',
'         --IF APEX_APPLICATION.g_f08 (i) > 0',
'         --THEN',
'            --raise_application_error(-20999,''test''||CR1.sel_flag);',
'            --CR1.sel_flag := ''N'';',
'',
'            UPDATE suplr_schld_ln_dtls',
'               SET ssld_proc_qty = nvl(SSLD_SCHLD_QTY - (SSLD_PROC_QTY + SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY),0),--APEX_APPLICATION.g_f08 (i),',
'                   ssld_sel_flag = ''Y'',',
'                   ssld_user = :global_user,',
'                   ssld_upd_by = :global_user,',
'                   ssld_upd_date = SYSDATE',
'             WHERE     ssld_bu = :global_bu',
'                   AND ssld_plnt = CR1.sshd_plnt',
'                   AND ssld_doc_pfx = CR1.sshd_doc_pfx',
'                   AND ssld_doc_no = CR1.sshd_doc_no',
'                   AND ssld_seq_no = CR1.ssln_seq_no',
'                   AND ssld_sub_seq_no = CR1.ssld_sub_seq_no;',
'',
'            CR1.ssld_user := :global_user;',
'',
'            IF CR1.ssld_tolr_qty > 0',
'            THEN',
'               UPDATE suplr_schld_ln_dtls',
'                  SET ssld_tolr_qty = CR1.ssld_tolr_qty',
'                WHERE     ssld_bu = :global_bu',
'                      AND ssld_plnt = CR1.sshd_plnt',
'                      AND ssld_doc_pfx = CR1.sshd_doc_pfx',
'                      AND ssld_doc_no = CR1.sshd_doc_no',
'                      AND ssld_seq_no = CR1.ssln_seq_no',
'                      AND ssld_sub_seq_no = CR1.ssld_sub_seq_no;',
'            END IF;',
'',
'            proc_commit;',
'',
'            ',
'           -- end if;',
'        -- END loop;',
'       end loop c1;',
'   end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488324343253341251
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970284950159952278)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sel_gate'
,p_static_id=>'sel-gate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20999,''test6'');',
'DECLARE',
'   chk_alert   NUMBER (5);',
'',
'   CURSOR c2',
'   IS',
'      SELECT *',
'        FROM gate_entry_so_view',
'      where GESV_BU=:GLOBAL_BU',
'      AND gesv_doc_no = :P1615131100_GESV_DOC_NO',
'      and gesv_seq_no = :P1615131100_GESV_SEQ_NO',
'      and gesv_sub_seq_no = :P1615131100_GESV_SUB_SEQ_NO',
'      and gesv_plnt = :P1615131100_GESV_PLNT;',
'',
'   cr2         c2%ROWTYPE;',
'BEGIN',
'   ',
'   For CR2 in C2',
'   LOOP',
'   ',
' --raise_application_error(-20999,cr2.gesv_sel_flag||''/''||:P1615131100_GATE_SEL_FLAG||''/''||cr2.gesv_qc_req||''/''||cr2.gesv_plnt||''/''||cr2.gesv_doc_no||''/''||cr2.gesv_seq_no||''/''||cr2.gesv_sub_seq_no);',
'   IF :P1615131100_GATE_SEL_FLAG = ''N'' AND cr2.gesv_qc_req = ''N''',
'   THEN',
'     --raise_application_error(-20999,cr2.gesv_sel_flag);',
'      --IF cr2.gesv_sel_flag = ''N''',
'      --THEN',
'         proc_upd_ge_flag (:global_bu,',
'                           cr2.gesv_plnt,',
'                           cr2.gesv_doc_no,',
'                           cr2.gesv_seq_no,',
'                           cr2.gesv_sub_seq_no,',
'                           ''Y'',',
'                           :global_user);',
'',
'         proc_commit;',
'         cr2.gesv_user := :global_user;',
'      ELSE',
'         proc_upd_ge_flag (:global_bu,',
'                           cr2.gesv_plnt,',
'                           cr2.gesv_doc_no,',
'                           cr2.gesv_seq_no,',
'                           cr2.gesv_sub_seq_no,',
'                           ''N'',',
'                           :global_user);',
'         ',
'   END IF;',
'',
'   --CLOSE c2;',
'',
'   END LOOP;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>488323114616341250
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970286576298952281)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sel_supp'
,p_static_id=>'sel-supp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    --raise_application_error(-20999,:P1615131100_SEL_FLAG);',
'    ',
'',
'        declare',
'           var_res   varchar2 (1);',
'           var_res1   varchar2 (1);',
'',
'           cursor c3',
'           is',
'           select * ',
'             from SUPLR_SCHLD_VIEW',
'              WHERE SSHD_BU = :GLOBAL_BU;',
'',
'              CR3      C3%Rowtype;',
'        begin',
'',
'           proc_check_rcpt_due_tolerance (:global_bu,',
'                                          :p1615131100_posv_plnt,',
'                                          :posv_order_date,',
'                                          var_res);',
'       ',
'       ',
'       for i in 1.. APEX_APPLICATION.g_f08.COUNT',
'       loop',
'           ',
'           --IF APEX_APPLICATION.g_f07 (i) = cr3.SSHD_DOC_NO|| ''|''||cr3.SSLN_PRINT_SEQ_NO|| ''|''||cr3.SSLN_RQST_SEQ_NO|| ''|''||cr3.SSLN_RQST_PFX|| ''|''||cr3.SSLN_RQST_NO',
'     -- THEN',
'           IF :p1615131100_sel_flag =''N'' THEN',
'          --raise_application_error(-20999,:P1615131100_SEL_FLAG||''/''||APEX_APPLICATION.g_f08.COUNT);',
'           if var_res = ''N''',
'           then',
'              :p1615131100_sel_flag := ''N'';',
'              raise_application_error(-20999,''Order date should be greater than tolerance date.'');',
'           end if;',
'          ',
'           proc_chk_prev_order(:global_bu,:p1615131100_sshd_plnt,''SS'',:p1615131100_sshd_suplr_id,:p1615131100_ssln_cre_date,:p1615131100_ssln_prod_id,:p1615131100_ssln_prod_rev,var_res1);',
'        ',
'           if var_res1 = ''N''',
'           then',
'              :p1615131100_sel_flag := ''N'';',
'              raise_application_error(-20999,''Previous order pending for this supplier.'');',
'           end if;',
'        if (apex_application.g_f08(i) is null',
'               or apex_application.g_f08(i) <= 0)',
'           then',
'              :p1615131100_sel_flag := ''N'';',
'              raise_application_error(-20999,''Current Process Qty. should be greater than Zero.'');',
'           else',
'              --raise_application_error(-20999,apex_application.g_f08(i)||''/''||:p1615131100_sshd_plnt);',
'              update suplr_schld_ln_dtls',
'                 set ssld_proc_qty = apex_application.g_f08(i),',
'                     ssld_sel_flag = ''Y'',--:P1615131100_SEL_FLAG,',
'                     ssld_user = :global_user,',
'                     ssld_upd_by = :global_user,',
'                     ssld_upd_date = sysdate',
'               where     ssld_bu = :global_bu',
'                     and ssld_plnt = :p1615131100_sshd_plnt',
'                     and ssld_doc_pfx = :p1615131100_sshd_doc_pfx',
'                     and ssld_doc_no = :p1615131100_sshd_doc_no',
'                     and ssld_seq_no = :p1615131100_ssln_seq_no',
'                     and ssld_sub_seq_no = :p1615131100_ssld_sub_seq_no;',
'                    ',
'               :p1615131100_ssld_user := :global_user;',
'             end if;',
'             ',
'             ',
'             if :p1615131100_curr_tolr_qty > 0',
'              then',
'                 update suplr_schld_ln_dtls',
'                    set ssld_tolr_qty = :p1615131100_curr_tolr_qty',
'                  where     ssld_bu = :global_bu',
'                        and ssld_plnt = :p1615131100_sshd_plnt',
'                        and ssld_doc_pfx = :p1615131100_sshd_doc_pfx',
'                        and ssld_doc_no = :p1615131100_sshd_doc_no',
'                        and ssld_seq_no = :p1615131100_ssln_seq_no',
'                        and ssld_sub_seq_no = :p1615131100_ssld_sub_seq_no;',
'              end if;',
'        ',
'              proc_commit;',
'        ',
'              --IF :suplr_schld_view.sshd_ps_type = ''SC''  THEN',
'                 declare',
'                    cursor c1',
'                    is',
'                       select *',
'                         from sub_contr_ord_mat_type',
'                        where     scomt_bu = :global_bu',
'                              and scomt_ord_pfx = :p1615131100_sshd_doc_pfx',
'                              and scomt_ord_no = :p1615131100_sshd_doc_no',
'                              and scomt_ord_seq_no = :p1615131100_ssln_seq_no',
'                              and scomt_ord_sub_seq_no =:p1615131100_ssld_sub_seq_no;',
'        ',
'                    cr1   c1%rowtype;',
'                 begin',
'                    open c1;',
'        ',
'                    fetch c1 into cr1;',
'        ',
'                    if c1%notfound',
'                    then',
'                       insert into sub_contr_ord_mat_type (scomt_bu,',
'                                                           scomt_ord_pfx,',
'                                                           scomt_ord_no,',
'                                                           scomt_ord_seq_no,',
'                                                           scomt_ord_sub_seq_no,',
'                                                           scomt_ord_qty,',
'                                                           scomt_pr_qty,',
'                                                           scomt_cre_by,',
'                                                           scomt_cre_date)',
'                            values (:global_bu,',
'                                    :p1615131100_sshd_doc_pfx,',
'                                    :p1615131100_sshd_doc_no,',
'                                    :p1615131100_ssln_seq_no,',
'                                    :p1615131100_ssld_sub_seq_no,',
'                                     apex_application.g_f08(i),',
'                                     apex_application.g_f08(i),',
'                                    :global_user,',
'                                    sysdate);',
'                                    ',
'                    elsif c1%found',
'                    then',
'                       update sub_contr_ord_mat_type',
'                          set scomt_ord_qty = apex_application.g_f08(i),',
'                              scomt_pr_qty = apex_application.g_f08(i),',
'                              scomt_up_qty = 0,',
'                              scomt_sds_qty = 0,',
'                              scomt_cs_qty = 0,',
'                              scomt_upd_by = :global_user,',
'                              scomt_upd_date = sysdate',
'                        where     scomt_bu = :global_bu',
'                              and scomt_ord_pfx = :p1615131100_sshd_doc_pfx',
'                              and scomt_ord_no = :p1615131100_sshd_doc_no',
'                              and scomt_ord_seq_no = :p1615131100_ssln_seq_no',
'                              and scomt_ord_sub_seq_no =:p1615131100_ssld_sub_seq_no;',
'                                           ',
'                    end if;',
'        ',
'                    close c1;',
'                 end;',
'        ',
'        ',
'                 proc_commit;',
'              ',
'           --END IF;',
'           -- END;',
'            ',
'         elsif :p1615131100_sel_flag = ''Y'' then',
'           --raise_application_error(-20999,:p1615131100_sel_flag);',
'        update suplr_schld_ln_dtls',
'           set ssld_proc_qty = SSLD_SCHLD_QTY - (SSLD_PROC_QTY + SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY),',
'               ssld_tolr_qty = 0,',
'               ssld_sel_flag = ''N'',',
'               ssld_user = null,',
'               ssld_upd_by = :global_user,',
'               ssld_upd_date = sysdate',
'         where     ssld_bu = :global_bu',
'               and ssld_plnt = :p1615131100_sshd_plnt',
'               and ssld_doc_pfx = :p1615131100_sshd_doc_pfx',
'               and ssld_doc_no = :p1615131100_sshd_doc_no',
'               and ssld_seq_no = :p1615131100_ssln_seq_no',
'               and ssld_sub_seq_no = :p1615131100_ssld_sub_seq_no;',
'        ',
'        :p1615131100_ssld_user := null;',
'                 proc_commit;',
'        ',
'                        :p1615131100_curr_proc_qty := apex_application.g_f08(i);',
'                        :p1615131100_curr_tolr_qty := 0;',
'        ',
'        --IF :suplr_schld_view.sshd_ps_type = ''SC'' THEN',
'            ',
'         delete from sub_contr_ord_mat_type',
'             where scomt_bu = :global_bu',
'               and scomt_ord_pfx = :p1615131100_sshd_doc_pfx',
'               and scomt_ord_no = :p1615131100_sshd_doc_no',
'               and scomt_ord_seq_no = :p1615131100_ssln_seq_no',
'               and scomt_ord_sub_seq_no = :p1615131100_ssld_sub_seq_no;',
'        END IF;',
'        --proc_commit;',
'    -- end if;   ',
'        ',
'     end loop;',
'       end;',
'    --END IF;',
'',
'',
'--end if;',
'',
'',
'',
'DECLARE',
'   v_sel_ctn   NUMBER;',
'BEGIN',
'   SELECT COUNT (*)',
'     INTO v_sel_ctn',
'     FROM suplr_schld_view',
'    WHERE     sshd_bu = :global_bu',
'          AND ssld_sel_flag = ''Y''',
'          AND ssld_user = :global_user;',
'',
'   IF v_sel_ctn > 0',
'   THEN',
'      :p1615131100_sel_flag := ''Y'';',
'   ELSE',
'      :p1615131100_sel_flag := ''N'';',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_SUPP'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>488324740755341253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970283428400952274)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'select flag for stock trans'
,p_static_id=>'select-flag-for-stock-trans'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_Application_Error(-20999,:P1615131100_STK_SEL_FLAG);',
'IF :P1615131100_STK_SEL_FLAG = ''N'' THEN',
'',
'    UPDATE sales_invoices_hd',
'       SET sihd_stk_trfr_sel_flag = ''Y'',',
'           sihd_stk_trfr_sel_user = :GLOBAL_USER',
'     WHERE sihd_bu = :GLOBAL_bu',
'			 AND sihd_plant = :P1615131100_STK_PLNT',
'			 AND sihd_doc_no = :P1615131100_STK_DOC_NO;',
'       ',
'    Commit;  ',
'ELSIF :P1615131100_STK_SEL_FLAG = ''Y'' THEN',
'',
'    UPDATE sales_invoices_hd',
'       SET sihd_stk_trfr_sel_flag = ''N'',',
'           sihd_stk_trfr_sel_user = :GLOBAL_USER',
'     WHERE sihd_bu = :GLOBAL_bu',
'			 AND sihd_plant = :P1615131100_STK_PLNT',
'			 AND sihd_doc_no = :P1615131100_STK_DOC_NO;',
'                 ',
'  Commit;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_STK'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>488321592857341246
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970286954421952282)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select flag-SI Standard'
,p_static_id=>'select-flag-si-standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1615131100_SEL_FLAG_SI = ''N''',
' THEN',
'   update SALES_INVOICES_HD',
'   set sihd_stk_trfr_sel_flag = ''Y'',',
'	    sihd_stk_trfr_sel_USER = :Global_user',
'       where SIHD_BU =:global_bu',
'			AND SIHD_PLANT =:P1615131100_PLANT',
'			and SIHD_DOC_NO =:P1615131100_DOC_NO;',
'  ',
'  elsif :P1615131100_SEL_FLAG_SI = ''Y'' ',
'  THEN',
'  update SALES_INVOICES_HD',
'  set sihd_stk_trfr_sel_flag = ''N'',',
'      sihd_stk_trfr_sel_USER = NULL',
'		where SIHD_BU =:global_bu',
'			AND SIHD_PLANT =:P1615131100_PLANT',
'         and SIHD_DOC_NO =:P1615131100_DOC_NO;',
' ',
'  end if;',
' commit;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>488325118878341254
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970280953397952270)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_plnt      VARCHAR2(10);',
'v_plnt_loc_id  VARCHAR2(10);',
'v_plnt_loc_name   VARCHAR2(100);',
'v_ord_type  pur_order_hd.poh_type%TYPE;',
'v_doc_no    VARCHAR2(30);',
'v_seq_no    NUMBER(5);',
'v_error     VARCHAR2 (1000);',
'v_rcpt_pfx  VARCHAR2 (30);',
'',
'TYPE PENDPAY IS REF CURSOR;',
'PAY_CURSOR PENDPAY;',
'v_qry     CLOB;',
'',
'BEGIN',
'BEGIN',
'  UPDATE pur_order_ln',
'     SET pol_inproc_qty = (pol_ordered_qty - (pol_received_qty + pol_proc_qty + pol_cls_qty))',
'   WHERE pol_bu = :GLOBAL_bu ',
'     AND pol_sel_flag = ''N''',
'     AND pol_inproc_qty <> (pol_ordered_qty - (pol_received_qty + pol_proc_qty + pol_cls_qty))',
'     AND pol_ordered_qty > (pol_received_qty + pol_proc_qty + pol_cls_qty)',
'     AND pol_status = ''A''',
'     AND pol_matl_type <> ''T''',
'     AND EXISTS(SELECT 1',
'                  FROM pur_order_so_view',
'                 WHERE posv_bu = pol_bu',
'                   AND posv_ord_no = pol_order_no',
'                   AND posv_mode = ''PO''',
'                   AND posv_bu = :GLOBAL_bu',
'                   AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N'')',
'               );',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    v_error := ''Error''; GOTO ERR1;',
'END;',
'',
'  FOR i in 1..APEX_APPLICATION.G_F02.COUNT',
'  LOOP  ',
'    UPDATE pur_order_ln',
'       SET pol_inproc_qty = APEX_APPLICATION.G_F01(i)',
'     WHERE pol_bu = :GLOBAL_bu',
'       AND pol_order_no||pol_seq_no = APEX_APPLICATION.G_F02(i);',
'  END LOOP;',
'',
'v_qry := ''SELECT posv_plnt,posv_plnt_loc_id,posv_plnt_loc_name,posv_type,posv_ord_no,posv_ord_seq_no',
'                       FROM pur_order_so_view',
'                      WHERE posv_bu  = ''''''||:GLOBAL_BU||''''''',
'                        AND EXISTS (SELECT 1 FROM appl_user_plant_access WHERE auba_bu = ''''''||:GLOBAL_bu||'''''' AND auba_user_id =  ''''''||:GLOBAL_USER||''''''',
'                           AND trunc(sysdate) between  auba_from and  auba_to AND auba_plant = posv_plnt AND auba_plnt_loc_id = posv_plnt_loc_id)',
'                        AND posv_mode = ''''PO''''',
'                        AND posv_matl_type <> ''''T''''',
'                        AND posv_type <> ''''POT''''',
'                        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''''N'''')',
'                        AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty))  > ''||0||''',
'AND (POSV_PLNT LIKE ''''%'' || :P1615131100_PLNT || ''%'''' OR ''''''||:P1615131100_PLNT||'''''' IS NULL)',
'AND (POSV_PLNT_LOC_ID LIKE ''''%'' || :P1615131100_PLNT_LOC || ''%'''' OR ''''''||:P1615131100_PLNT_LOC||'''''' IS NULL)',
'AND (POSV_SUPLR LIKE ''''%'' || :P1615131100_SUPPLIER_ID || ''%'''' OR ''''''||:P1615131100_SUPPLIER_ID||'''''' IS NULL)',
'AND (POSV_SUPLR_NAME LIKE ''''%'' || :P1615131100_SUPPLIER_DESC || ''%'''' OR ''''''||:P1615131100_SUPPLIER_DESC||'''''' IS NULL)',
'AND (POSV_ORD_PFX LIKE ''''%'' ||  :P1615131100_PO_PFX || ''%'''' OR ''''''||:P1615131100_PO_PFX||'''''' IS NULL)',
'AND (POSV_ORD_NO LIKE ''''%'' || :P1615131100_PO_NO || ''%''''  OR ''''''||:P1615131100_PO_NO||'''''' IS NULL)',
'AND (POSV_PROD_ID LIKE ''''%'' || :P1615131100_PROD_ID || ''%'''' OR ''''''||:P1615131100_PROD_ID||'''''' IS NULL)',
'AND (UPPER(POSV_PROD_DESC1) LIKE  ''''%''||UPPER(:P1615131100_PROD_DESC) ||''%'''' OR ''''''||:P1615131100_PROD_DESC||'''''' IS NULL)',
'AND (POSV_BUYER LIKE ''''%'' || :P1615131100_BUYER_ID || ''%'''' OR ''''''||:P1615131100_BUYER_ID||'''''' IS NULL)',
'AND (POSV_ORDER_DATE LIKE ''''%'' || :P1615131100_PO_DATE || ''%'''' OR ''''''||:P1615131100_PO_DATE||'''''' IS NULL)',
'AND (POSV_TYPE = DECODE(''''''||:P1615131100_RCPT_TYPE||'''''',''''GRNPG'''',''''POG'''',''''GRNPM'''',''''POM'''',''''GRNPS'''',''''POS'''') OR ''''''||:P1615131100_RCPT_TYPE||'''''' IS NULL)',
'AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 9009, 1615131100,''PENDING'', :APP_SESSION);',
'',
'OPEN PAY_CURSOR FOR v_qry;',
'LOOP',
'  FETCH PAY_CURSOR INTO v_plnt,v_plnt_loc_id,v_plnt_loc_name,v_ord_type,v_doc_no,v_seq_no;',
'  EXIT WHEN PAY_CURSOR%notfound; ',
'  ',
'  IF :P1615131100_BUT_TYPE <> ''AL'' THEN',
'  BEGIN',
'    SELECT apsta_pfx INTO v_rcpt_pfx',
'      FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'     WHERE apsta_bu = adpl_bu',
'       AND apsta_plnt = adpl_plnt',
'       AND apsta_pfx = adpl_pfx',
'       AND apsta_bu = :GLOBAL_bu',
'       AND apsta_vou_type = ''GRNP''   ',
'       AND apsta_plnt = v_plnt',
'       AND adpl_loc_id = v_plnt_loc_id',
'       AND apsta_sub_type = CASE WHEN v_ord_type = ''POG'' THEN ''GRNPG''',
'                                 WHEN v_ord_type = ''POM'' THEN ''GRNPM''',
'                                 WHEN v_ord_type = ''POS'' THEN ''GRNPS'' ',
'                                 WHEN v_ord_type = ''POT'' THEN ''GRNPT'' ',
'    	                      ELSE NULL  END',
'       AND ROWNUM = 1;',
'  EXCEPTION',
'    WHEN OTHERS THEN ',
'      v_error := ''GRN Pfx. not found.''; GOTO ERR1;',
'  END;',
'  END IF;',
'',
'  UPDATE pur_order_ln',
'     SET /*pol_inproc_qty = (pol_ordered_qty - (pol_received_qty + pol_proc_qty + pol_cls_qty)),',
'         */pol_sel_flag = ''Y'',',
'         pol_sel_user = :GLOBAL_USER,',
'         pol_rcpt_plnt = v_plnt,',
'         pol_rcpt_plnt_loc_id = v_plnt_loc_id,',
'         pol_rcpt_plnt_loc_name = v_plnt_loc_name,',
'         pol_rcpt_pfx = v_rcpt_pfx',
'   WHERE pol_bu = :GLOBAL_bu ',
'     AND pol_order_no = v_doc_no',
'     AND pol_seq_no = v_seq_no',
'     AND pol_sel_flag = ''N'';',
'',
'END LOOP;  ',
'CLOSE PAY_CURSOR;',
'',
'<<ERR1>>',
'IF v_error IS NULL THEN',
'  htp.p(''success'');',
'  COMMIT;',
'ELSE',
'  Rollback;',
'  htp.p(v_error);',
'END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488319117854341242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970272970176952254)
,p_process_sequence=>230
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL_SS'
,p_static_id=>'selectall-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_plnt      VARCHAR2(10);',
'v_plnt_loc_id  VARCHAR2(10);',
'v_plnt_loc_name   VARCHAR2(100);',
'v_ord_type  pur_order_hd.poh_type%TYPE;',
'v_doc_no    VARCHAR2(30);',
'v_seq_no    NUMBER(5);',
'v_sub_seq_no    NUMBER(5);',
'v_error     VARCHAR2 (1000);',
'v_rcpt_pfx  VARCHAR2 (30);',
'',
'v_qry     CLOB;',
'',
'TYPE PENDPAY IS REF CURSOR;',
'PAY_CURSOR PENDPAY;',
'',
'BEGIN',
'',
'--Raise_Application_Error(-20999,APEX_APPLICATION.G_F02.COUNT);',
'',
'  UPDATE suplr_schld_ln_dtls',
'     SET ssld_proc_qty = (SSLD_SCHLD_QTY - (SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY))',
'   WHERE ssld_bu = :GLOBAL_bu',
'     AND ssld_sel_flag = ''N''',
'     AND (SSLD_SCHLD_QTY - (SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY)) > 0;',
'',
'  FOR i in 1..APEX_APPLICATION.G_F02.COUNT',
'  LOOP  ',
'    UPDATE suplr_schld_ln_dtls',
'       SET ssld_proc_qty = APEX_APPLICATION.G_F01(i)',
'     WHERE ssld_bu = :GLOBAL_bu',
'       AND ssld_doc_no||ssld_seq_no||ssld_sub_seq_no = APEX_APPLICATION.G_F02(i);',
'  END LOOP;',
'',
'v_qry := ''SELECT ssld_doc_no,ssld_seq_no,ssld_sub_seq_no',
'                       FROM suplr_schld_view',
'                      WHERE ssld_bu  = ''''''||:GLOBAL_BU||''''''',
'                        AND (sshd_suplr_id LIKE ''''%''|| :P1615131100_SUPPLIER_ID ||''%'''' OR ''''''||:P1615131100_SUPPLIER_ID||'''''' IS NULL)',
'                        AND ((SELECT suplr_name1 FROM suppliers WHERE suplr_bu = sshd_bu AND suplr_suplr_id = sshd_suplr_id) LIKE ''''%''|| :P1615131100_SUPPLIER_DESC ||''%'''' OR ''''''||:P1615131100_SUPPLIER_DESC||'''''' IS NULL)',
'                        AND (sshd_doc_no LIKE ''''%''|| :P1615131100_SS_NO ||''%''''  OR ''''''||:P1615131100_SS_NO||'''''' IS NULL)',
'                        AND (ssln_prod_id LIKE ''''%''|| :P1615131100_PROD_ID ||''%'''' OR ''''''||:P1615131100_PROD_ID||'''''' IS NULL)',
'                        AND (UPPER((SELECT prod_desc11 FROM products WHERE prod_bu = ssln_bu AND prod_id = ssln_prod_id AND prod_rev = ssln_prod_rev)) LIKE  ''''%''||UPPER(:P1615131100_PROD_DESC) ||''%'''' OR ''''''||:P1615131100_PROD_DESC||'''''' IS NULL)',
'                        AND (SSHD_DOC_DATE LIKE ''''%''|| :P1615131100_SS_DATE ||''%'''' OR ''''''||:P1615131100_SS_DATE||'''''' IS NULL)',
'                        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = sshd_bu AND pomctrl_plnt = sshd_plnt AND pomctrl_gate_ent_flag = ''''N'''')',
'                        AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 9009, 1615131100,''Supplier Schedule'', :APP_SESSION);',
'--INSERT INTO t1 VALUES(v_qry);',
'OPEN PAY_CURSOR FOR v_qry;',
'LOOP',
'  FETCH PAY_CURSOR INTO v_doc_no,v_seq_no,v_sub_seq_no;',
'  EXIT WHEN PAY_CURSOR%notfound; ',
'',
'  UPDATE suplr_schld_ln_dtls',
'     SET ssld_sel_flag = ''Y'',',
'         ssld_user = :GLOBAL_USER',
'   WHERE ssld_bu = :GLOBAL_bu ',
'     AND ssld_doc_no = v_doc_no',
'     AND ssld_seq_no = v_seq_no',
'     AND ssld_sub_seq_no = v_sub_seq_no',
'     AND ssld_sel_flag = ''N'';',
'',
'END LOOP;  ',
'CLOSE PAY_CURSOR;',
'COMMIT;',
'',
'htp.p(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488311134633341226
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970275393093952257)
,p_process_sequence=>310
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL_STS'
,p_static_id=>'selectall-sts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_inv_pfx      VARCHAR2(10);',
'v_inv_no  VARCHAR2(30);',
'v_error     VARCHAR2 (1000);',
'v_rcpt_pfx  VARCHAR2 (30);',
'',
'TYPE PENDPAY IS REF CURSOR;',
'PAY_CURSOR PENDPAY;',
'',
'BEGIN',
'',
'OPEN PAY_CURSOR FOR ''SELECT sihd_inv_pfx,sihd_inv_no',
'                       FROM sales_invoices_hd',
'                      WHERE sihd_bu  = ''''''||:GLOBAL_BU||''''''',
'                        AND sihd_status = ''''I''''',
'                        AND ((sihd_type IN (''''SIT'''',''''IR'''') AND sihd_stk_trfr_grn_pfx IS NULL AND sihd_stk_trfr_grn_no IS NULL AND SIHD_STK_TRFR_GE_DOC_NO IS NULL) OR ',
'                             (sihd_type IN (''''LI'''',''''LE'''',''''RP'''',''''RB'''') AND sihd_lo_grn_pfx IS NULL AND sihd_lo_grn_no IS NULL AND SIHD_Lo_GE_DOC_NO IS NULL))',
'                        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = sihd_bu AND pomctrl_plnt = sihd_trans_plnt AND pomctrl_gate_ent_flag = ''''N'''')',
'                        AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 9009, 1615131100,''PENDSTS'', :APP_SESSION);',
'LOOP',
'  FETCH PAY_CURSOR INTO v_inv_pfx,v_inv_no;',
'  EXIT WHEN PAY_CURSOR%notfound; ',
'',
'  UPDATE sales_invoices_hd',
'     SET sihd_stk_trfr_sel_flag = ''Y'',',
'         sihd_stk_trfr_sel_user = :GLOBAL_USER',
'   WHERE sihd_bu = :GLOBAL_bu ',
'     AND sihd_inv_pfx = v_inv_pfx',
'     AND sihd_inv_no = v_inv_no',
'     AND sihd_stk_trfr_sel_flag = ''N'';',
'',
'END LOOP;  ',
'CLOSE PAY_CURSOR;',
'COMMIT;',
'',
'htp.p(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488313557550341229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970282172524952273)
,p_process_sequence=>130
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALLGE'
,p_static_id=>'selectallge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_plnt      VARCHAR2(10);',
'v_plnt_loc_id  VARCHAR2(10);',
'v_plnt_loc_name   VARCHAR2(100);',
'v_ord_type  pur_order_hd.poh_type%TYPE;',
'v_ge_doc_no    VARCHAR2(30);',
'v_ge_seq_no    NUMBER(5);',
'v_ge_sub_seq_no   NUMBER(5);',
'v_error     VARCHAR2 (1000);',
'v_rcpt_pfx  VARCHAR2 (30);',
'',
'TYPE PENDPAY IS REF CURSOR;',
'PAY_CURSOR PENDPAY;',
'',
'v_count  NUMBER := 0;',
'',
'v_qry     CLOB;',
'BEGIN',
'',
'v_qry := ''SELECT gesv_plnt,gesv_plnt_loc_id,gesv_doc_no,gesv_seq_no,gesv_sub_seq_no,gesv_po_type',
'                       FROM gate_entry_so_view',
'                      WHERE gesv_bu  = ''''''||:GLOBAL_BU||''''''',
'                        AND gesv_mode = ''''PR''''',
'                         AND (gesv_doc_no LIKE ''''%''||:P1615131100_GE_NO||''%'''' OR ''''''||:P1615131100_GE_NO||'''''' IS NULL)  ',
'                         AND (UPPER(gesv_suplr_id) LIKE ''''%''||UPPER(:P1615131100_SUPPLIER_ID)||''%'''' OR ''''''||:P1615131100_SUPPLIER_ID||'''''' IS NULL)  ',
'                         AND (UPPER(gesv_suplr_name) LIKE ''''%''||UPPER(:P1615131100_SUPPLIER_DESC)||''%'''' OR ''''''||:P1615131100_SUPPLIER_DESC||'''''' IS NULL)  ',
'                         AND (UPPER(gesv_po_pfx) LIKE ''''%''||UPPER(:P1615131100_PO_PFX)||''%'''' OR ''''''||:P1615131100_PO_PFX||'''''' IS NULL)',
'                         AND (UPPER(gesv_po_no) LIKE ''''%''||UPPER(:P1615131100_PO_NO)||''%'''' OR ''''''||:P1615131100_PO_NO||'''''' IS NULL)',
'                         AND (UPPER(gesv_prod_id) LIKE ''''%''||UPPER(:P1615131100_PROD_ID)||''%'''' OR ''''''||:P1615131100_PROD_ID||'''''' IS NULL)',
'                         AND (UPPER(gesv_prod_desc1) LIKE ''''%''||UPPER(:P1615131100_PROD_DESC)||''%'''' OR ''''''||:P1615131100_PROD_DESC||'''''' IS NULL)',
'                         --AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = gesv_bu AND pomctrl_plnt = gesv_plnt AND pomctrl_gate_ent_flag = ''''Y'''')',
'                       AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION(9009, 1615131100,''GATEENTRY'', :APP_SESSION);',
'proc_ins_qry_trace(:GLOBAL_bu,1615131100,v_qry,:GLOBAL_user);',
'OPEN PAY_CURSOR FOR v_qry;',
'LOOP',
'  FETCH PAY_CURSOR INTO v_plnt,v_plnt_loc_id,v_ge_doc_no,v_ge_seq_no,v_ge_sub_seq_no,v_ord_type;',
'  EXIT WHEN PAY_CURSOR%NOTFOUND; ',
'',
'  BEGIN',
'    SELECT apsta_pfx INTO v_rcpt_pfx',
'      FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'     WHERE apsta_bu = adpl_bu',
'       AND apsta_plnt = adpl_plnt',
'       AND apsta_pfx = adpl_pfx',
'       AND apsta_bu = :GLOBAL_bu',
'       AND apsta_vou_type = ''GRNP''   ',
'       AND apsta_plnt = v_plnt',
'       AND adpl_loc_id = v_plnt_loc_id',
'       AND apsta_sub_type = CASE WHEN v_ord_type = ''POG'' THEN ''GRNPG''',
'                                 WHEN v_ord_type = ''POM'' THEN ''GRNPM''',
'                                 WHEN v_ord_type = ''POS'' THEN ''GRNPS'' ',
'                                 WHEN v_ord_type = ''POT'' THEN ''GRNPT''',
'                                 ELSE ''GRNPG'' ',
'    	                      END',
'       AND ROWNUM = 1;',
'  EXCEPTION',
'    WHEN OTHERS THEN ',
'      htp.p(''GRN Pfx. not found. ''||:GLOBAL_bu||''/''||v_plnt||''/''||v_plnt_loc_id||''/''||v_ord_type);',
'  END;',
'',
'  UPDATE gate_entry_details',
'     SET gedl_sel_rec = ''Y'',',
'         gedl_user = :GLOBAL_USER,',
'         gedl_rcpt_pfx = v_rcpt_pfx',
'   WHERE gedl_bu = :GLOBAL_bu ',
'     AND gedl_plnt = v_plnt',
'     AND gedl_doc_no = v_ge_doc_no',
'     AND gedl_seq_no = v_ge_seq_no',
'     AND gedl_sub_seq_no = v_ge_sub_seq_no',
'     AND gedl_sel_rec = ''N'';',
'  ',
'  v_count := v_count + 1;',
'',
'END LOOP;  ',
'CLOSE PAY_CURSOR;',
'COMMIT;',
'',
'IF v_count = 0 THEN',
'  htp.p(v_count);',
'ELSE',
'  htp.p(''success'');',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488320336981341245
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970277351002952259)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOT_SEL_COST'
,p_static_id=>'tot-sel-cost'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_cost  NUMBER;',
'BEGIN',
'SELECT SUM((posv_inprocess_qty * posv_unit_cost)-((posv_disc_amt / posv_ord_qty) * posv_inprocess_qty)) INTO v_cost',
'  FROM pur_order_so_view',
' WHERE posv_bu = :GLOBAL_bu',
'   AND posv_mode = ''PO''',
'   AND posv_sel_flag = ''Y''',
'   AND posv_sel_user = :GLOBAL_user ;',
'',
'  HTP.P(NVL(v_cost,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488315515459341231
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970277035068952259)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOT_SEL_QTY'
,p_static_id=>'tot-sel-qty'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_qty  NUMBER;',
'BEGIN',
'SELECT SUM(posv_inprocess_qty) total_Qty INTO v_qty',
'  FROM pur_order_so_view',
' WHERE posv_bu = :GLOBAL_bu',
'   AND posv_mode = ''PO''',
'   AND posv_sel_flag = ''Y''',
'   AND posv_sel_user = :GLOBAL_user ;',
'',
'  HTP.P(NVL(v_qty,0));',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488315199525341231
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970284153467952276)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UN_sel_all_po_sco'
,p_static_id=>'un-sel-all-po-sco'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1615131100_MODE  :=NULL;',
'',
'DECLARE',
'   c        NUMBER := 1;',
'   chk_all  CHAR;',
'   num      NUMBER;',
'   VAR_SES	VARCHAR2(50);',
'  ',
'   CURSOR C7 ',
'         IS',
'         SELECT * ',
'            FROM PUR_ORDER_SO_VIEW',
'          WHERE POSV_BU = :GLOBAL_BU;',
'          --AND POSV_ORD_NO = :P1615131100_POSV_ORD_NO;',
'          ',
'          CR7    C7%ROWTYPE;',
'	',
'BEGIN',
'     FOR CR7 IN C7',
'     LOOP',
'	 chk_all := cr7.posv_SEL_FLAG;',
'	--raise_application_error(-20999,cr7.posv_SEL_FLAG);',
'   ',
'   --IF chk_all = ''N''',
'  --THEN ',
'      FOR i IN 1 .. APEX_APPLICATION.g_f01.COUNT',
'      LOOP',
'       --if apex_application.g_f01(i) > 0 --AND cr7.posv_sel_flag = ''N'' ',
'       -- THEN',
'         --cr7.posv_SEL_FLAG := ''Y'';',
'       ',
'        proc_upd_po_sel_flag(:GLOBAL_bu,',
'		                     cr7.POSV_ORD_PFX,',
'		                     cr7.POSV_ORD_NO,',
'		                     cr7.POSV_ORD_SEQ_NO,',
'		                     cr7.posv_ORD_SUB_SEQ_NO,',
'		                     ''N'',',
'		                      apex_application.g_f01(i),',
'		                     cr7.POSV_EXCESS_QTY,',
'		                     cr7.POSV_TOLR_PCT,',
'		                     cr7.POSV_TOLR_QTY,',
'		                     :GLOBAL_user,',
'		                     1);',
'        proc_commit;',
'        ',
'		--:porp_plnt := cr7.POSV_PLNT;',
'		 Commit;',
'		',
'        ',
'       -- END IF;',
'      ',
'      END LOOP;',
'   --END IF;',
'   END LOOP;',
'   END;',
'',
'   BEGIN',
'SELECT SUM((posv_inprocess_qty * posv_unit_cost)-posv_disc_amt) total_cost,SUM(posv_inprocess_qty) total_Qty',
'  INTO :P1615131100_TOT_COST,:P1615131100_TOT_QTY',
'  FROM pur_order_so_view',
' WHERE posv_bu = :GLOBAL_bu',
'   AND posv_sel_flag = ''Y'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>488322317924341248
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970285431465952278)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'un_sel_all_supp'
,p_static_id=>'un-sel-all-supp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**IF ((CR1.CURR_PROC_QTY IS NULL OR CR1.CURR_PROC_QTY = 0) AND CR1.SEL_FLAG =''Y'') THEN',
'        CR1.SEL_FLAG := ''N'';',
'        proc_COMMIT;',
'    Raise_application_error(-20999,''Current Process Qty. should be greater than Zero.'');',
'END IF;*/',
'',
':p1615131100_MODE := NULL;',
'',
'DECLARE',
'   c         NUMBER := 1;',
'   chk_all   CHAR;',
'   num       NUMBER;',
'   var_ses   VARCHAR2 (50);',
'',
'   cursor c1',
'   is',
'     select * ',
'        from SUPLR_SCHLD_VIEW',
'      WHERE SSHD_BU = :GLOBAL_BU;',
'',
'      CR1          C1%Rowtype;',
'BEGIN',
'   --chk_all := CR1.sel_flag;',
'    ',
'    For CR1 in C1',
'    LOOP',
' ',
'      --FOR i IN 1 .. c',
'     -- LOOP',
'       --raise_application_error(-20999,''test''||CR1.sel_flag);',
'         --IF APEX_APPLICATION.g_f08 (i) > 0',
'         --THEN',
'            --raise_application_error(-20999,''test''||CR1.sel_flag);',
'            --CR1.sel_flag := ''N'';',
'',
'             UPDATE suplr_schld_ln_dtls',
'               SET ssld_proc_qty = nvl(SSLD_SCHLD_QTY - (SSLD_PROC_QTY + SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY),0),--APEX_APPLICATION.g_f08 (i),',
'                   ssld_sel_flag = ''N'',',
'                   ssld_user = :global_user,',
'                   ssld_upd_by = :global_user,',
'                   ssld_upd_date = SYSDATE',
'             WHERE     ssld_bu = :global_bu',
'                   AND ssld_plnt = CR1.sshd_plnt',
'                   AND ssld_doc_pfx = CR1.sshd_doc_pfx',
'                   AND ssld_doc_no = CR1.sshd_doc_no',
'                   AND ssld_seq_no = CR1.ssln_seq_no',
'                   AND ssld_sub_seq_no = CR1.ssld_sub_seq_no;',
'',
'            CR1.ssld_user := :global_user;',
'',
'            IF CR1.ssld_tolr_qty > 0',
'            THEN',
'               UPDATE suplr_schld_ln_dtls',
'                  SET ssld_tolr_qty = CR1.ssld_tolr_qty',
'                WHERE     ssld_bu = :global_bu',
'                      AND ssld_plnt = CR1.sshd_plnt',
'                      AND ssld_doc_pfx = CR1.sshd_doc_pfx',
'                      AND ssld_doc_no = CR1.sshd_doc_no',
'                      AND ssld_seq_no = CR1.ssln_seq_no',
'                      AND ssld_sub_seq_no = CR1.ssld_sub_seq_no;',
'            END IF;',
'',
'            proc_commit;',
'',
'            ',
'            --end if;',
'         --END loop;',
'       end loop c1;',
'   end;',
'',
'',
'  -- nvl(SSLD_SCHLD_QTY - (SSLD_PROC_QTY + SSLD_INPROC_QTY + SSLD_RECVD_QTY + SSLD_CLS_QTY),0)'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'USER_IS_NOT_PUBLIC_USER'
,p_internal_uid=>488323595922341250
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970281791143952271)
,p_process_sequence=>160
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNITCOST'
,p_static_id=>'unitcost'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_tot_cost number(15,3);',
'BEGIN',
'  SELECT SUM((gesv_qty * gesv_unit_cost) - (((gesv_disc_pct/100) * gesv_unit_cost) * gesv_qty)) gesv_tot_cost INTO v_tot_cost',
'    FROM gate_entry_so_view',
'   WHERE gesv_bu = :global_bu',
'     AND gesv_sel_flag = ''Y''',
'     AND gesv_user = :GLOBAL_user',
'     AND gesv_mode = ''PR''',
'     AND ((:P1615131100_BUT_TYPE = ''AL'' AND gesv_suplr_id = :P1615131100_SUPPLIER_ID) OR :P1615131100_BUT_TYPE <> ''AL'')',
'     ;',
'',
' htp.p(nvl(v_tot_cost,0));',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488319955600341243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970281391072952271)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*BEGIN',
'',
'UPDATE PUR_ORDER_SO_VIEW',
'       SET POSV_INPROCESS_QTY = (POSV_ORD_QTY - (POSV_RECEIPT_QTY + POSV_PROCESS_QTY + POSV_CS_QTY)),',
'           POSV_SEL_FLAG = ''N'',',
'           POSV_SEL_USER = :GLOBAL_USER',
'     Where posv_bu = :GLOBAL_bu      ',
'AND (posv_ord_qty - (posv_receipt_qty + posv_process_qty + posv_cs_qty)) > 0',
'        AND POSV_MODE = ''PO''',
'        AND posv_matl_type <> ''T''',
'        AND EXISTS(SELECT 1 FROM pom_control WHERE pomctrl_bu = posv_bu AND pomctrl_plnt = posv_plnt AND pomctrl_gate_ent_flag = ''N'')',
'        AND POSV_SEL_FLAG = ''Y'';',
'',
'       COMMIT;',
'htp.p(''success'');',
'',
'',
'END;*/',
'',
'BEGIN',
'  UPDATE pur_order_ln',
'     SET pol_sel_flag = ''N'',',
'         pol_sel_user = NULL',
'   WHERE pol_bu = :GLOBAL_bu',
'     AND pol_sel_flag = ''Y''',
'     AND pol_sel_user = :GLOBAL_user;',
'  htp.p(''success'');',
'  COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488319555529341243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970273407379952254)
,p_process_sequence=>250
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL_SS'
,p_static_id=>'unselectall-ss'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  UPDATE suplr_schld_ln_dtls',
'     SET ssld_sel_flag = ''N'',',
'         ssld_user = NULL',
'   WHERE ssld_bu = :GLOBAL_bu',
'     AND ssld_sel_flag = ''Y''',
'     AND ssld_user = :GLOBAL_user;',
'  htp.p(''success'');',
'  COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488311571836341226
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970275792582952257)
,p_process_sequence=>320
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL_STS'
,p_static_id=>'unselectall-sts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'  UPDATE sales_invoices_hd',
'     SET sihd_stk_trfr_sel_flag = ''N'',',
'         sihd_stk_trfr_sel_user = NULL',
'   WHERE sihd_bu = :GLOBAL_bu ',
'     AND sihd_stk_trfr_sel_flag = ''Y''',
'     AND sihd_stk_trfr_sel_user = :GLOBAL_USER;',
'',
'  htp.p(''success'');',
'  COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488313957039341229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970282560258952274)
,p_process_sequence=>140
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALLGE'
,p_static_id=>'unselectallge'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  UPDATE gate_entry_details',
'     SET gedl_sel_rec = ''N'',',
'         gedl_user = :GLOBAL_user',
'   WHERE gedl_bu = :GLOBAL_bu',
'     AND gedl_sel_rec = ''Y''',
'     AND gedl_user = :GLOBAL_user',
'     /*AND EXISTS(SELECT 1 ',
'                  FROM gate_entry_hd ',
'                 WHERE gehd_bu = gedl_bu ',
'                   AND gehd_doc_no = gedl_doc_no ',
'                   AND gehd_mode = ''PR'')*/',
'                   ;',
'  htp.p(''success'');',
'  COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>488320724715341246
);
wwv_flow_imp.component_end;
end;
/
