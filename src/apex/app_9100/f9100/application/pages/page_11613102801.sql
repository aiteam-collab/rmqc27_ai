prompt --application/pages/page_11613102801
begin
--   Manifest
--     PAGE: 11613102801
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
 p_id=>11613102801
,p_name=>'Finance Notification Details'
,p_alias=>'NOTIFICATION-DETAILS'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#fontstylesheet.css'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function title(){',
'   var type; ',
'      type = apex.item( "P11613102801_MODE" ).getValue();',
'	  type1 = apex.item( "P11613102801_STATUS" ).getValue();',
'	  type2 = apex.item( "P11613102801_TYPE" ).getValue();',
'	 ',
'     if ((type == ''PRW'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Purchase GRN");',
'      }',
'',
'      if ((type == ''SCOW'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Subcontract GRN");',
'      } ',
'	  if ((type == ''STW'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Stock Transfer");',
'      } ',
'	  if ((type == ''LCW'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Landed Cost");',
'      } ',
'	  if ((type1 == ''O'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Unapproved Purchase Bills");',
'      } ',
'	  if ((type == ''BPV'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Unapproved Bank/Cash Payments");',
'      } ',
'	  if ((type == ''BRV'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Unapproved Bank/Cash Receipts");',
'      } ',
'	  if ((type == ''JV'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Unapproved Journal Vouchers");',
'      }',
'      if ((type == ''CV'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Unapproved Contra Vouchers");',
'      }	',
'      if ((type == ''Y'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "MSME Invoices");',
'      }	',
'      if ((type2 == ''S'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "MSME Expiry");',
'      }	  ',
'}   ',
''))
,p_javascript_code_onload=>'title();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead{',
'      overflow: auto !important;',
'}',
' .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8189566472354583145)
,p_plug_name=>'Bank Trans. Details'
,p_static_id=>'bank-trans-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT btrans_bu,',
'       btrans_ord_pfx,',
'       btrans_ord_no,',
'       btrans_plant,',
'        btrans_plnt_loc_id,     ',
'       btrans_pv_date,',
'       TO_CHAR(btrans_pv_date,:P11613102801_DATE_FMT)Vou_date,',
'       btrans_type,',
'       btrans_bank_id,',
'       CASE WHEN btrans_type IN (''BT'') THEN',
'         (SELECT bank_name1',
'            FROM banks',
'           WHERE bank_bu = btrans_bu ',
'             AND bank_id = btrans_bank_id) ',
'       WHEN btrans_type IN (''CT'',''CV'') THEN',
'         (SELECT bank_name1',
'            FROM banks',
'           WHERE bank_bu = btrans_bu ',
'             AND bank_id = btrans_bank_id',
'             AND btrans_type IN (''CV'')',
'          UNION ALL          ',
'          SELECT suplr_name1',
'            FROM suppliers',
'           WHERE suplr_bu       = btrans_bu ',
'             AND suplr_suplr_id = btrans_bank_id ',
'             AND suplr_status   = ''A'')          ',
'       END Bank_Ac,',
'       Decode(btrans_pay_mode,''Q'',''Cheque'',''T'',''RTGS'',''E'',''NEFT'',''F'',''TT/Transfer'',''C'',''Cash'',btrans_pay_mode)Pay_Mode,',
'       Decode(btrans_chq_type,''S'',''Single'',''M'',''Multi'')Chq_Type,',
'       btrans_acct_payee,',
'       btrans_chq_date,',
'       TO_CHAR(btrans_chq_date,:P11613102801_DATE_FMT)Ref_Date,',
'       btrans_trans_ref_no,',
'       btrans_in_favor_of,',
'       btrans_trans_curcy Trans_curr,',
'       btrans_bank_curcy  Bank_curr,',
'       btrans_trans_amt  Pay_Amt, ',
'       CASE WHEN btrans_trans_amt = 0 THEN',
'        (SELECT SUM (btdln_dist_amt)',
'                        FROM bank_trans_dist_ln_hist_vw',
'                       WHERE     btdln_bu = btrans_bu',
'                             AND btdln_ord_no = btrans_ord_no',
'                             AND btdln_dr_cr = ''DR'')',
'       ELSE btrans_trans_amt  ',
'       END Pay_Amt_jv,',
'       btrans_trans_amt  Pay_Amt_cv,',
'       btrans_bank_rgl_amt Realized_Amt,',
'       btrans_bank_chg_amt Chrg_interest,',
'       btrans_bank_chg_amt Chrg_interest_cv,',
'       btrans_bank_net_amt Net_Amt,',
'       btrans_trans_chg_amt Chrg_tc,',
'       btrans_reference,',
'       btrans_advice_pfx||''-''||btrans_advice_no Advice_No,',
'       CASE WHEN btrans_type = ''BT'' THEN',
'           DECODE(btrans_trans_mode,''P'',''Bank Payment'',''R'',''Bank Receipt'')',
'            WHEN btrans_type = ''CT'' THEN',
'           DECODE(btrans_trans_mode,''P'',''Cash Payment'',''R'',''Cash Receipt'')',
'            WHEN btrans_type = ''CV'' THEN',
'           DECODE(btrans_trans_mode,''I'',''Contra Voucher'',''O'',''Contra Voucher'')',
'            WHEN btrans_type = ''JT'' THEN',
'           DECODE(btrans_trans_mode,''P'',''Journal Voucher'')',
'       END Vou_type, ',
'       btrans_bank_name,',
'       DECODE(btrans_pdc_flag,''Y'',''Yes'',''N'',''No'') btrans_pdc_flag,',
'       Decode(btrans_status,''N'',''Draft'',''D'',''Deleted'',''C'',''Cleared'',''O'',''Entry Completed'',''I'',''Issued'',''V'',''Void'',''R'',''Received'',''X'',''Cancelled'',''P'',''Posted'',''S'',''Posted'')"Status",',
'       DECODE(btrans_status,''N'',''blue'',''V'',''Brown'',''P'',''green'',''O'',''deepskyblue'',''D'',''red'',''X'',''red'',''C'',''green'',''R'',''brown'',''I'',''green'',''S'',''green'') "color"',
'  FROM bank_trans_hist_vw',
' WHERE btrans_bu   = :Global_bu  ',
'   AND btrans_status = :P11613102801_STATUS',
'   AND ((btrans_type IN(''BT'',''CT'') AND :P11613102801_MODE = ''BPV'' AND btrans_trans_mode =''P'') OR',
'        (btrans_type IN(''BT'',''CT'') AND :P11613102801_MODE = ''BRV'' AND btrans_trans_mode =''R'') OR',
'        (btrans_type IN(''JT'') AND :P11613102801_MODE = ''JV'' AND btrans_trans_mode =''P'') OR',
'        (btrans_type IN(''CV'') AND :P11613102801_MODE = ''CV'' AND btrans_trans_mode =''O''))    ',
'ORDER BY btrans_pv_date desc,btrans_ord_no desc        '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'BP'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bank Trans. Details'
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
 p_id=>wwv_flow_imp.id(8189566542232583146)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2707604706688972118
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569239326583173)
,p_db_column_name=>'ADVICE_NO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Advice No.'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567622721583156)
,p_db_column_name=>'BANK_AC'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Bank A/C'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568559410583166)
,p_db_column_name=>'BANK_CURR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Bank Curcy.'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568015025583160)
,p_db_column_name=>'BTRANS_ACCT_PAYEE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Btrans Acct Payee'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567501390583155)
,p_db_column_name=>'BTRANS_BANK_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Btrans Bank Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569520867583175)
,p_db_column_name=>'BTRANS_BANK_NAME'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Bank Name'
,p_column_type=>'STRING'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189566677987583147)
,p_db_column_name=>'BTRANS_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Btrans Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568115296583161)
,p_db_column_name=>'BTRANS_CHQ_DATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Btrans Chq Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568435312583164)
,p_db_column_name=>'BTRANS_IN_FAVOR_OF'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Favor Of'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189566859501583149)
,p_db_column_name=>'BTRANS_ORD_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189566792789583148)
,p_db_column_name=>'BTRANS_ORD_PFX'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569588364583176)
,p_db_column_name=>'BTRANS_PDC_FLAG'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'PDC'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189566977021583150)
,p_db_column_name=>'BTRANS_PLANT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567118853583151)
,p_db_column_name=>'BTRANS_PLNT_LOC_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'CV1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567229741583152)
,p_db_column_name=>'BTRANS_PV_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Btrans Pv Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569217449583172)
,p_db_column_name=>'BTRANS_REFERENCE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568275998583163)
,p_db_column_name=>'BTRANS_TRANS_REF_NO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Ref. No.'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567370617583154)
,p_db_column_name=>'BTRANS_TYPE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Btrans Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567892895583159)
,p_db_column_name=>'CHQ_TYPE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Chq Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568924730583169)
,p_db_column_name=>'CHRG_INTEREST'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Charges/Interest'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012723794347583238)
,p_db_column_name=>'CHRG_INTEREST_CV'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Charges'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'CV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569042207583171)
,p_db_column_name=>'CHRG_TC'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Chrg. TC'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569008400583170)
,p_db_column_name=>'NET_AMT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Net. Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568692773583167)
,p_db_column_name=>'PAY_AMT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Pay Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012723732805583237)
,p_db_column_name=>'PAY_AMT_CV'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Transfer Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'CV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012723619497583236)
,p_db_column_name=>'PAY_AMT_JV'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Amt. in TC'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567740381583158)
,p_db_column_name=>'PAY_MODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pay Mode'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568750983583168)
,p_db_column_name=>'REALIZED_AMT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Realized Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P11613102801_MODE NOT IN(''JV'',''CV'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568221418583162)
,p_db_column_name=>'REF_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Ref. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'JV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569689380583177)
,p_db_column_name=>'Status'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189568516703583165)
,p_db_column_name=>'TRANS_CURR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Trans. Curcy.'
,p_column_type=>'STRING'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_display_condition=>'P11613102801_MODE'
,p_display_condition2=>'CV'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189567236938583153)
,p_db_column_name=>'VOU_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569361460583174)
,p_db_column_name=>'VOU_TYPE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189569780234583178)
,p_db_column_name=>'color'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8190467765089257346)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27085060'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'BTRANS_PLNT_LOC_ID:BTRANS_PLANT:VOU_TYPE:BTRANS_ORD_PFX:BTRANS_ORD_NO:VOU_DATE:BANK_AC:BTRANS_TRANS_REF_NO:REF_DATE:PAY_MODE:TRANS_CURR:BANK_CURR:PAY_AMT_JV:PAY_AMT_CV:CHRG_INTEREST_CV:PAY_AMT:CHRG_TC:REALIZED_AMT:CHRG_INTEREST:NET_AMT:ADVICE_NO:BTRA'
||'NS_BANK_NAME:BTRANS_IN_FAVOR_OF:BTRANS_REFERENCE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6047065282573421454)
,p_plug_name=>'Budget Exceed'
,p_static_id=>'budget-exceed'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT fbn_bu,',
'       fbn_vou_pfx,',
'  	   fbn_vou_no,',
'       TO_CHAR(fbn_vou_date,:global_rpt_date_mask)fbn_vou_date,',
'       fbn_ap_gl_acct,',
'       (SELECT glac_acct_desc1',
'          FROM gl_accts',
'         WHERE glac_bu = fbn_bu',
'           AND glac_acct = fbn_ap_gl_acct)fbn_ap_gl_acct_desc,',
'       fbn_ap_cc_code,',
'       (SELECT pcc_desc',
'          FROM profit_cost_centers ',
'         WHERE pcc_bu = fbn_bu',
'           AND pcc_cc_code = fbn_ap_cc_code)fbn_ap_cc_code_desc,',
'       fbn_bud_amt,    ',
'       fbn_bill_amt,',
'       fbn_ref',
'  FROM fin_bud_notification',
' WHERE fbn_bu = :global_bu      ',
' ORDER BY fbn_vou_date desc,fbn_vou_no desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'BE'
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
 p_id=>wwv_flow_imp.id(6047065432252421455)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>565103596708810427
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066099584421462)
,p_db_column_name=>'FBN_AP_CC_CODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'CPC Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066177044421463)
,p_db_column_name=>'FBN_AP_CC_CODE_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'CPC Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047065840100421460)
,p_db_column_name=>'FBN_AP_GL_ACCT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'GL Acct. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066031868421461)
,p_db_column_name=>'FBN_AP_GL_ACCT_DESC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'GL Acct. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066288038421464)
,p_db_column_name=>'FBN_BILL_AMT'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Bill Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047065507081421456)
,p_db_column_name=>'FBN_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Fbn Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066500775421466)
,p_db_column_name=>'FBN_BUD_AMT'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Budget Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047066366352421465)
,p_db_column_name=>'FBN_REF'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047065786974421459)
,p_db_column_name=>'FBN_VOU_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047065673743421458)
,p_db_column_name=>'FBN_VOU_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6047065610244421457)
,p_db_column_name=>'FBN_VOU_PFX'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6055663010977909578)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5737012'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FBN_VOU_PFX:FBN_VOU_NO:FBN_VOU_DATE:FBN_AP_GL_ACCT:FBN_AP_GL_ACCT_DESC:FBN_AP_CC_CODE:FBN_AP_CC_CODE_DESC:FBN_BUD_AMT:FBN_BILL_AMT:FBN_REF'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9870862914370728552)
,p_plug_name=>'GRN(Purchase)'
,p_static_id=>'grn-purchase'
,p_title=>'pending_grn_bill_notify'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT porhh_suplr_id,',
'         porhh_suplr_name suplr_name,',
'         porhh_receipt_pfx,',
'         porhh_receipt_no,',
'         TO_CHAR (porhh_grn_date, :Global_rpt_date_mask) porhh_grn_date,',
'         porhh_grn_date porhh_grn_date1,',
'         TRUNC (SYSDATE) - TRUNC (porhh_grn_date) due_days,',
'         porhh_suplr_doc_no,',
'         TO_CHAR (porhh_suplr_doc_date, :Global_rpt_date_mask)',
'            porhh_suplr_doc_date,',
'         porhh_dc_no,',
'         TO_CHAR (porhh_dc_date, :Global_rpt_date_mask) porhh_dc_date,',
'         porhh_currency,',
'         porhh_tot_rcpt_amt,',
'         porhh_plnt,',
'         porhh_plnt_loc_id,',
'         porhh_plnt_loc_name plnt_loc_desc,',
'         porhh_billfr_loc_name',
'            "Bill From Location",',
'         (SELECT glp_prj_name',
'            FROM gl_lvl_prj',
'           WHERE glp_bu = porhh_bu AND glp_prj_id = porhh_proj_id)',
'            prj_name,',
'         DECODE (porhh_dflt_pay_thru,  ''B'', ''Bank'',  ''C'', ''Cash'',  ''A'', ''Any'')',
'            porhh_dflt_pay_thru,',
'         porhh_doc_trans_ref_no,',
'         porlh_prod_id,',
'         porlh_prod_rev,',
'         porlh_prod_desc porlh_prod_desc1,',
'         porlh_suplr_bill_qty porlh_temp_inv_qty,',
'         porlh_inv_qty,',
'         porlh_temp_in_progress,',
'         porlh_inv_proc_qty,',
'         porlh_receipt_qty,',
'         porlh_rejected_qty,',
'         porlh_excess_qty,',
'         porlh_suplr_uom porlh_prod_uom,',
'         porlh_so_no "So. No.",',
'         porlh_line_amt "Line Amt.",',
'         porlh_temp_in_progress * porlh_sc_unit_cost "Inv Proc Amt.",',
'         (porlh_suplr_bill_qty - porlh_temp_in_progress - porlh_inv_qty) * porlh_sc_unit_cost "Bal_amt",',
'         porlh_sc_unit_cost,',
'         porlh_po_no "Po. No.",',
'         porlh_ss_doc_no "Sup.Schl. No.",',
'         porhh_exchange_rate',
'    FROM pur_rcpt_std_stktrns_vw',
'   WHERE porhh_bu = :global_bu       ',
'     AND porhh_receipt_date <= TO_DATE(SYSDATE)       ',
'     AND porhh_type <> ''GRNPT''',
'     AND (porlh_suplr_bill_qty - (porlh_temp_in_progress + (NVL (porlh_inv_qty, 0)))) > 0',
'     --AND :P11613102801_TYPE = ''ST'' OR porhh_type <> ''GRNPT'' AND :P11613102801_TYPE = ''PR'')',
'ORDER BY porhh_grn_date, porhh_receipt_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11613102801_UNIT,P11613102801_AS_ON_DATE,P11613102801_TYPE,P11613102801_PARTY,P11613102801_UNIT_LOC'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'PG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GRN(Purchase)'
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
 p_id=>wwv_flow_imp.id(9870862959127728553)
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
,p_internal_uid=>4388901123584117525
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11242097030939273194)
,p_db_column_name=>'Bal_amt'
,p_display_order=>560
,p_column_identifier=>'BH'
,p_column_label=>'Balance line Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_static_id=>'amt'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864577078728569)
,p_db_column_name=>'Bill From Location'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Bill From Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870863573035728559)
,p_db_column_name=>'DUE_DAYS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Aged Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11229036921545909295)
,p_db_column_name=>'Inv Proc Amt.'
,p_display_order=>550
,p_column_identifier=>'BF'
,p_column_label=>'Inv. Proc. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_static_id=>'amt'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11225101456157386339)
,p_db_column_name=>'Line Amt.'
,p_display_order=>520
,p_column_identifier=>'BC'
,p_column_label=>'Line Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_static_id=>'amt'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10814360538815524337)
,p_db_column_name=>'PLNT_LOC_DESC'
,p_display_order=>510
,p_column_identifier=>'AZ'
,p_column_label=>'Unit Loc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864048595728564)
,p_db_column_name=>'PORHH_CURRENCY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9618970056780656694)
,p_db_column_name=>'PORHH_DC_DATE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'DC Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870863885317728562)
,p_db_column_name=>'PORHH_DC_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'DC No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864782597728571)
,p_db_column_name=>'PORHH_DFLT_PAY_THRU'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Pay Thru.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864987628728573)
,p_db_column_name=>'PORHH_DOC_TRANS_REF_NO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Reference No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11229036822210909294)
,p_db_column_name=>'PORHH_EXCHANGE_RATE'
,p_display_order=>540
,p_column_identifier=>'BE'
,p_column_label=>'Exchange Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9618225862977552742)
,p_db_column_name=>'PORHH_GRN_DATE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'GRN Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8561934670471955575)
,p_db_column_name=>'PORHH_GRN_DATE1'
,p_display_order=>600
,p_column_identifier=>'BL'
,p_column_label=>'Porhh Grn Date1'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864408379728567)
,p_db_column_name=>'PORHH_PLNT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8561934638183955574)
,p_db_column_name=>'PORHH_PLNT_LOC_ID'
,p_display_order=>590
,p_column_identifier=>'BK'
,p_column_label=>'Unit Loc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8558049963504985090)
,p_db_column_name=>'PORHH_RECEIPT_NO'
,p_display_order=>580
,p_column_identifier=>'BJ'
,p_column_label=>'GRN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8558049866549985089)
,p_db_column_name=>'PORHH_RECEIPT_PFX'
,p_display_order=>570
,p_column_identifier=>'BI'
,p_column_label=>'GRN Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9618969958275656693)
,p_db_column_name=>'PORHH_SUPLR_DOC_DATE'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Bill Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870863665280728560)
,p_db_column_name=>'PORHH_SUPLR_DOC_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Bill No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870863122488728554)
,p_db_column_name=>'PORHH_SUPLR_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864132032728565)
,p_db_column_name=>'PORHH_TOT_RCPT_AMT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'GRN Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_FMT_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870866082201728584)
,p_db_column_name=>'PORLH_EXCESS_QTY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Excess'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865667849728580)
,p_db_column_name=>'PORLH_INV_PROC_QTY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'To be Inv.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865522051728578)
,p_db_column_name=>'PORLH_INV_QTY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Invoiced'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865306245728576)
,p_db_column_name=>'PORLH_PROD_DESC1'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Item Desc. '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865104395728574)
,p_db_column_name=>'PORLH_PROD_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865223673728575)
,p_db_column_name=>'PORLH_PROD_REV'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870866294125728586)
,p_db_column_name=>'PORLH_PROD_UOM'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865784718728581)
,p_db_column_name=>'PORLH_RECEIPT_QTY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Receipt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870866011682728583)
,p_db_column_name=>'PORLH_REJECTED_QTY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Rejected'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870866645773728590)
,p_db_column_name=>'PORLH_SC_UNIT_COST'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Unit Cost  '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_static_id=>'price'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865397913728577)
,p_db_column_name=>'PORLH_TEMP_INV_QTY'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Total GRN '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870865534326728579)
,p_db_column_name=>'PORLH_TEMP_IN_PROGRESS'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'In Progress'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'qty'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870864675609728570)
,p_db_column_name=>'PRJ_NAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Project Level'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9510960967484678622)
,p_db_column_name=>'Po. No.'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'PO No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9870863165056728555)
,p_db_column_name=>'SUPLR_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9510960867413678621)
,p_db_column_name=>'So. No.'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'SO  No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9510961057550678623)
,p_db_column_name=>'Sup.Schl. No.'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Sup.schl. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8559633396900927356)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'GRN No. Wise'
,p_report_seq=>10
,p_report_alias=>'20376038'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PORHH_RECEIPT_PFX:PORHH_RECEIPT_NO:PORHH_GRN_DATE:PORHH_PLNT_LOC_ID:PORHH_PLNT:PORHH_SUPLR_ID:SUPLR_NAME:DUE_DAYS:PORHH_SUPLR_DOC_NO:PORHH_SUPLR_DOC_DATE:PORHH_DC_NO:PORHH_DC_DATE:PORHH_CURRENCY:PORHH_EXCHANGE_RATE:PORHH_TOT_RCPT_AMT:Bill From Locati'
||'on:PRJ_NAME:PORHH_DFLT_PAY_THRU:PORHH_DOC_TRANS_REF_NO:PORLH_PROD_ID:PORLH_PROD_REV:PORLH_PROD_DESC1:PORLH_TEMP_INV_QTY:PORLH_INV_QTY:PORLH_TEMP_IN_PROGRESS:PORLH_INV_PROC_QTY:PORLH_RECEIPT_QTY:PORLH_REJECTED_QTY:PORLH_EXCESS_QTY:PORLH_PROD_UOM:So. N'
||'o.:PORLH_SC_UNIT_COST:Line Amt.:Inv Proc Amt.:Bal_amt:Po. No.:Sup.Schl. No.:PLNT_LOC_DESC'
,p_break_on=>'PORHH_RECEIPT_PFX:PORHH_RECEIPT_NO:PORHH_GRN_DATE'
,p_break_enabled_on=>'PORHH_RECEIPT_PFX:PORHH_RECEIPT_NO:PORHH_GRN_DATE'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8559634500637931198)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Party Wise'
,p_report_seq=>10
,p_report_alias=>'20376049'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PORHH_SUPLR_ID:SUPLR_NAME:PORHH_PLNT_LOC_ID:PORHH_PLNT:PORHH_RECEIPT_PFX:PORHH_RECEIPT_NO:PORHH_GRN_DATE:DUE_DAYS:PORHH_SUPLR_DOC_NO:PORHH_SUPLR_DOC_DATE:PORHH_DC_NO:PORHH_DC_DATE:PORHH_CURRENCY:PORHH_EXCHANGE_RATE:PORHH_TOT_RCPT_AMT:Bill From Locati'
||'on:PRJ_NAME:PORHH_DFLT_PAY_THRU:PORHH_DOC_TRANS_REF_NO:PORLH_PROD_ID:PORLH_PROD_REV:PORLH_PROD_DESC1:PORLH_TEMP_INV_QTY:PORLH_INV_QTY:PORLH_TEMP_IN_PROGRESS:PORLH_INV_PROC_QTY:PORLH_RECEIPT_QTY:PORLH_REJECTED_QTY:PORLH_EXCESS_QTY:PORLH_PROD_UOM:So. N'
||'o.:PORLH_SC_UNIT_COST:Line Amt.:Inv Proc Amt.:Bal_amt:Po. No.:Sup.Schl. No.:PLNT_LOC_DESC'
,p_break_on=>'PORHH_SUPLR_ID:SUPLR_NAME'
,p_break_enabled_on=>'PORHH_SUPLR_ID:SUPLR_NAME'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9870929875661002472)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3768218'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PORHH_PLNT_LOC_ID:PORHH_PLNT:PORHH_SUPLR_ID:SUPLR_NAME:PORHH_RECEIPT_PFX:PORHH_RECEIPT_NO:PORHH_GRN_DATE:DUE_DAYS:PORHH_SUPLR_DOC_NO:PORHH_SUPLR_DOC_DATE:PORHH_DC_NO:PORHH_DC_DATE:PORHH_CURRENCY:PORHH_EXCHANGE_RATE:PORHH_TOT_RCPT_AMT:Bill From Locati'
||'on:PRJ_NAME:PORHH_DFLT_PAY_THRU:PORHH_DOC_TRANS_REF_NO:PORLH_PROD_ID:PORLH_PROD_REV:PORLH_PROD_DESC1:PORLH_TEMP_INV_QTY:PORLH_INV_QTY:PORLH_TEMP_IN_PROGRESS:PORLH_INV_PROC_QTY:PORLH_RECEIPT_QTY:PORLH_REJECTED_QTY:PORLH_EXCESS_QTY:PORLH_PROD_UOM:So. N'
||'o.:PORLH_SC_UNIT_COST:Line Amt.:Inv Proc Amt.:Bal_amt:Po. No.:Sup.Schl. No.:PLNT_LOC_DESC'
,p_sort_column_1=>'PORHH_GRN_DATE1'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PORHH_RECEIPT_NO'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8170202952009254069)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10351715347429755546)
,p_plug_name=>'Pending Payable Supplier Wise '
,p_static_id=>'pending-payable-supplier-wise'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-none:margin-left-none'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
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
'    FROM pending_payables_vw_hist_rev',
'   WHERE par_bu = :GLOBAL_BU',
'    AND (par_sc_bal_amt - par_sc_proc_amt) > 0',
'    AND (pdd_bal_amt - pdd_in_progress) > 0  ',
'ORDER BY par_aged_days DESC, pdd_seq_no, par_suplr_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11613102801_UNIT,P11613102801_REPORT_TYPE'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'PP'
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
 p_id=>wwv_flow_imp.id(10351715482780755547)
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
,p_internal_uid=>4869753647237144519
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311933004842971)
,p_db_column_name=>'ACCT_TYPE_DESC'
,p_display_order=>1470
,p_column_identifier=>'GW'
,p_column_label=>'Account Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311245537842964)
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
 p_id=>wwv_flow_imp.id(9617311338396842965)
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
 p_id=>wwv_flow_imp.id(9617311518303842967)
,p_db_column_name=>'DOC_NO'
,p_display_order=>1430
,p_column_identifier=>'GS'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311143905842963)
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
 p_id=>wwv_flow_imp.id(9617109934300646303)
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
 p_id=>wwv_flow_imp.id(9617310878577842960)
,p_db_column_name=>'LOCATION_DESC'
,p_display_order=>1360
,p_column_identifier=>'GL'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597648272785350775)
,p_db_column_name=>'PAR_ACCT_TYPE'
,p_display_order=>10
,p_column_identifier=>'BG'
,p_column_label=>'Par Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105190560646256)
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
 p_id=>wwv_flow_imp.id(9617107666654646280)
,p_db_column_name=>'PAR_AREA_MNGR_ID'
,p_display_order=>1060
,p_column_identifier=>'FH'
,p_column_label=>'Par Area Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597648319555350776)
,p_db_column_name=>'PAR_BANK_ID'
,p_display_order=>20
,p_column_identifier=>'BH'
,p_column_label=>'Par Bank Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597648428210350777)
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
 p_id=>wwv_flow_imp.id(9597648507903350778)
,p_db_column_name=>'PAR_BFCRY_ID'
,p_display_order=>40
,p_column_identifier=>'BJ'
,p_column_label=>'Par Bfcry Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597648626163350779)
,p_db_column_name=>'PAR_BFCRY_TYPE'
,p_display_order=>50
,p_column_identifier=>'BK'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106851824646272)
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
 p_id=>wwv_flow_imp.id(9597648726393350780)
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
 p_id=>wwv_flow_imp.id(9597648806342350781)
,p_db_column_name=>'PAR_CHECK_FLAG'
,p_display_order=>70
,p_column_identifier=>'BM'
,p_column_label=>'Par Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597648971689350782)
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
 p_id=>wwv_flow_imp.id(9597649034954350783)
,p_db_column_name=>'PAR_CHQ_NO'
,p_display_order=>90
,p_column_identifier=>'BO'
,p_column_label=>'Par Chq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649095096350784)
,p_db_column_name=>'PAR_CLS_ID'
,p_display_order=>100
,p_column_identifier=>'BP'
,p_column_label=>'Par Cls Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649185674350785)
,p_db_column_name=>'PAR_CRE_BY'
,p_display_order=>110
,p_column_identifier=>'BQ'
,p_column_label=>'Par Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649293793350786)
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
 p_id=>wwv_flow_imp.id(9617311633523842968)
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
 p_id=>wwv_flow_imp.id(9617109483941646299)
,p_db_column_name=>'PAR_CR_AVL_NO'
,p_display_order=>1250
,p_column_identifier=>'GA'
,p_column_label=>'AIC No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617109733800646301)
,p_db_column_name=>'PAR_CR_AVL_STATUS'
,p_display_order=>1270
,p_column_identifier=>'GC'
,p_column_label=>'AIC Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649379877350787)
,p_db_column_name=>'PAR_CURRENCY'
,p_display_order=>130
,p_column_identifier=>'BS'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107106042646275)
,p_db_column_name=>'PAR_CUST_AREA'
,p_display_order=>1010
,p_column_identifier=>'FC'
,p_column_label=>'Par Cust Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617109334180646297)
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
 p_id=>wwv_flow_imp.id(9617109110901646295)
,p_db_column_name=>'PAR_DAIRY_COC_ID'
,p_display_order=>1210
,p_column_identifier=>'FW'
,p_column_label=>'Par Dairy Coc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617109199174646296)
,p_db_column_name=>'PAR_DAIRY_ROUTE_ID'
,p_display_order=>1220
,p_column_identifier=>'FX'
,p_column_label=>'Par Dairy Route Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108469959646288)
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
 p_id=>wwv_flow_imp.id(9617108134948646285)
,p_db_column_name=>'PAR_DEV_EXISTS'
,p_display_order=>1110
,p_column_identifier=>'FM'
,p_column_label=>'Deviation Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108280789646287)
,p_db_column_name=>'PAR_DEV_SI_DOC_NO'
,p_display_order=>1130
,p_column_identifier=>'FO'
,p_column_label=>'Deviation Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108230168646286)
,p_db_column_name=>'PAR_DEV_STATUS'
,p_display_order=>1120
,p_column_identifier=>'FN'
,p_column_label=>'Deviation Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617102157036646275)
,p_db_column_name=>'PAR_DFLT_PAY_THRU'
,p_display_order=>510
,p_column_identifier=>'DE'
,p_column_label=>'Pay Thru.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107517968646279)
,p_db_column_name=>'PAR_DIV_ID'
,p_display_order=>1050
,p_column_identifier=>'FG'
,p_column_label=>'Par Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311860084842970)
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
 p_id=>wwv_flow_imp.id(9597649703457350790)
,p_db_column_name=>'PAR_DOC_NO'
,p_display_order=>160
,p_column_identifier=>'BV'
,p_column_label=>'Par Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649791250350791)
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
 p_id=>wwv_flow_imp.id(9617105744212646261)
,p_db_column_name=>'PAR_DOC_SEL_MODE'
,p_display_order=>870
,p_column_identifier=>'EO'
,p_column_label=>'Par Doc Sel Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597649945523350792)
,p_db_column_name=>'PAR_DOC_TYPE'
,p_display_order=>180
,p_column_identifier=>'BX'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597650071495350793)
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
 p_id=>wwv_flow_imp.id(9597650135685350794)
,p_db_column_name=>'PAR_DR_CR'
,p_display_order=>200
,p_column_identifier=>'BZ'
,p_column_label=>' Dr/ Cr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105356577646257)
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
 p_id=>wwv_flow_imp.id(9597650245316350795)
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
 p_id=>wwv_flow_imp.id(9617107887592646283)
,p_db_column_name=>'PAR_GRN_REFERENCE'
,p_display_order=>1090
,p_column_identifier=>'FK'
,p_column_label=>'GRN Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617109797860646302)
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
 p_id=>wwv_flow_imp.id(9617105794939646262)
,p_db_column_name=>'PAR_HOLD_PARTY'
,p_display_order=>880
,p_column_identifier=>'EP'
,p_column_label=>'Hold Partner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105143862646255)
,p_db_column_name=>'PAR_HOLD_PAY'
,p_display_order=>810
,p_column_identifier=>'EI'
,p_column_label=>'Hold Bill'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597650472825350797)
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
 p_id=>wwv_flow_imp.id(9597650567901350798)
,p_db_column_name=>'PAR_JRNL_FLAG'
,p_display_order=>240
,p_column_identifier=>'CD'
,p_column_label=>'Par Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597650662770350799)
,p_db_column_name=>'PAR_ORD_PLANT'
,p_display_order=>250
,p_column_identifier=>'CE'
,p_column_label=>'Par Ord Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106349650646267)
,p_db_column_name=>'PAR_PARENT_ID'
,p_display_order=>930
,p_column_identifier=>'EU'
,p_column_label=>'Parent ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597650692182350800)
,p_db_column_name=>'PAR_PAY_TYPE'
,p_display_order=>260
,p_column_identifier=>'CF'
,p_column_label=>'Par Pay Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597650966950350802)
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
 p_id=>wwv_flow_imp.id(9597651056310350803)
,p_db_column_name=>'PAR_PLNT_LOC_ID'
,p_display_order=>290
,p_column_identifier=>'CI'
,p_column_label=>'Par Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617310371118842955)
,p_db_column_name=>'PAR_PROJ_DESC'
,p_display_order=>1310
,p_column_identifier=>'GG'
,p_column_label=>'Proj. Lvl Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9597651108523350804)
,p_db_column_name=>'PAR_PROJ_ID'
,p_display_order=>300
,p_column_identifier=>'CJ'
,p_column_label=>'Proj. Lvl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108555786646289)
,p_db_column_name=>'PAR_PUR_RET_CRE_FLAG'
,p_display_order=>1150
,p_column_identifier=>'FQ'
,p_column_label=>'Pur. Rej. Exists'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108678593646290)
,p_db_column_name=>'PAR_PUR_RET_DOC_NO'
,p_display_order=>1160
,p_column_identifier=>'FR'
,p_column_label=>'Pur. Rej. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108967332646293)
,p_db_column_name=>'PAR_PUR_RET_INV_NO'
,p_display_order=>1190
,p_column_identifier=>'FU'
,p_column_label=>'Par Pur Ret Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108876030646292)
,p_db_column_name=>'PAR_PUR_RET_INV_PFX'
,p_display_order=>1180
,p_column_identifier=>'FT'
,p_column_label=>'Par Pur Ret Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108776303646291)
,p_db_column_name=>'PAR_PUR_STATUS'
,p_display_order=>1170
,p_column_identifier=>'FS'
,p_column_label=>'Pur. Rej.  Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105572123646259)
,p_db_column_name=>'PAR_PYMT_EXCP'
,p_display_order=>850
,p_column_identifier=>'EM'
,p_column_label=>'Exceptions'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106380795646268)
,p_db_column_name=>'PAR_REF_BU'
,p_display_order=>940
,p_column_identifier=>'EV'
,p_column_label=>'Par Ref Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106631531646270)
,p_db_column_name=>'PAR_REF_INV_NO'
,p_display_order=>960
,p_column_identifier=>'EX'
,p_column_label=>'Par Ref Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106573953646269)
,p_db_column_name=>'PAR_REF_INV_PFX'
,p_display_order=>950
,p_column_identifier=>'EW'
,p_column_label=>'Par Ref Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106745412646271)
,p_db_column_name=>'PAR_REF_PLNT'
,p_display_order=>970
,p_column_identifier=>'EY'
,p_column_label=>'Par Ref Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617109040993646294)
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
 p_id=>wwv_flow_imp.id(9617100170988646255)
,p_db_column_name=>'PAR_RTN_REASON'
,p_display_order=>310
,p_column_identifier=>'CK'
,p_column_label=>'Par Rtn Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617106881100646273)
,p_db_column_name=>'PAR_SALES_PERSON'
,p_display_order=>990
,p_column_identifier=>'FA'
,p_column_label=>'Par Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107215311646276)
,p_db_column_name=>'PAR_SALES_TERR'
,p_display_order=>1020
,p_column_identifier=>'FD'
,p_column_label=>'Par Sales Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617100249448646256)
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
 p_id=>wwv_flow_imp.id(9617100316506646257)
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
 p_id=>wwv_flow_imp.id(9617100404101646258)
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
 p_id=>wwv_flow_imp.id(9617100519552646259)
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
 p_id=>wwv_flow_imp.id(9617105604524646260)
,p_db_column_name=>'PAR_SO_REF'
,p_display_order=>860
,p_column_identifier=>'EN'
,p_column_label=>'Par So Ref'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617100623338646260)
,p_db_column_name=>'PAR_SRC_ACCT_TYPE'
,p_display_order=>360
,p_column_identifier=>'CP'
,p_column_label=>'Par Src Acct Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617100832842646262)
,p_db_column_name=>'PAR_SRC_DOC_NO'
,p_display_order=>380
,p_column_identifier=>'CR'
,p_column_label=>'Par Src Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617100933523646263)
,p_db_column_name=>'PAR_SRC_DOC_PFX'
,p_display_order=>390
,p_column_identifier=>'CS'
,p_column_label=>'Par Src Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617100981532646264)
,p_db_column_name=>'PAR_SRC_DOC_TYPE'
,p_display_order=>400
,p_column_identifier=>'CT'
,p_column_label=>'Par Src Doc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101131117646265)
,p_db_column_name=>'PAR_SRC_OFFSET_DOC_NO'
,p_display_order=>410
,p_column_identifier=>'CU'
,p_column_label=>'Par Src Offset Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101267257646266)
,p_db_column_name=>'PAR_STATUS'
,p_display_order=>420
,p_column_identifier=>'CV'
,p_column_label=>'Par Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107876828646282)
,p_db_column_name=>'PAR_STR_MNGR_ID'
,p_display_order=>1080
,p_column_identifier=>'FJ'
,p_column_label=>'Par Str Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107396377646278)
,p_db_column_name=>'PAR_SUB_DIV_ID'
,p_display_order=>1040
,p_column_identifier=>'FF'
,p_column_label=>'Par Sub Div Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107313908646277)
,p_db_column_name=>'PAR_SUB_TERR'
,p_display_order=>1030
,p_column_identifier=>'FE'
,p_column_label=>'Par Sub Terr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617310945999842961)
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
 p_id=>wwv_flow_imp.id(9617101421406646268)
,p_db_column_name=>'PAR_SUPLR_DOC_NO'
,p_display_order=>440
,p_column_identifier=>'CX'
,p_column_label=>'Bill No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101556320646269)
,p_db_column_name=>'PAR_SUPLR_ID'
,p_display_order=>450
,p_column_identifier=>'CY'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105401425646258)
,p_db_column_name=>'PAR_SUPLR_NAME'
,p_display_order=>840
,p_column_identifier=>'EL'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101608532646270)
,p_db_column_name=>'PAR_SUPLR_REFERENCE'
,p_display_order=>460
,p_column_identifier=>'CZ'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101717254646271)
,p_db_column_name=>'PAR_SYS_DOC'
,p_display_order=>470
,p_column_identifier=>'DA'
,p_column_label=>'Par Sys Doc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107022819646274)
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
 p_id=>wwv_flow_imp.id(9597650319878350796)
,p_db_column_name=>'PAR_TERM_ID'
,p_display_order=>220
,p_column_identifier=>'CB'
,p_column_label=>'Par Term Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617107693233646281)
,p_db_column_name=>'PAR_TR_MNGR_ID'
,p_display_order=>1070
,p_column_identifier=>'FI'
,p_column_label=>'Par Tr Mngr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617104957486646303)
,p_db_column_name=>'PAR_TYPE'
,p_display_order=>790
,p_column_identifier=>'EG'
,p_column_label=>'Par Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101865867646272)
,p_db_column_name=>'PAR_UPD_BY'
,p_display_order=>480
,p_column_identifier=>'DB'
,p_column_label=>'Par Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617101938236646273)
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
 p_id=>wwv_flow_imp.id(9617102027129646274)
,p_db_column_name=>'PAR_USER'
,p_display_order=>500
,p_column_identifier=>'DD'
,p_column_label=>'Par User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617105078775646304)
,p_db_column_name=>'PAR_VOU_TYPE'
,p_display_order=>800
,p_column_identifier=>'EH'
,p_column_label=>'Par Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311456266842966)
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
 p_id=>wwv_flow_imp.id(9617102289806646277)
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
 p_id=>wwv_flow_imp.id(9617102189636646276)
,p_db_column_name=>'PDD_BU'
,p_display_order=>520
,p_column_identifier=>'DF'
,p_column_label=>'Pdd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617102478626646278)
,p_db_column_name=>'PDD_CHECK_FLAG'
,p_display_order=>540
,p_column_identifier=>'DH'
,p_column_label=>'Pdd Check Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617104788956646302)
,p_db_column_name=>'PDD_CLAIM_TYPE'
,p_display_order=>780
,p_column_identifier=>'EF'
,p_column_label=>'Pdd Claim Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617310435795842956)
,p_db_column_name=>'PDD_CRE_BY'
,p_display_order=>1320
,p_column_identifier=>'GH'
,p_column_label=>'Pdd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617310564297842957)
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
 p_id=>wwv_flow_imp.id(9617102712118646281)
,p_db_column_name=>'PDD_DATE_TYPE'
,p_display_order=>570
,p_column_identifier=>'DK'
,p_column_label=>'Pdd Date Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617102871610646282)
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
 p_id=>wwv_flow_imp.id(9617102954473646283)
,p_db_column_name=>'PDD_DOC_NO'
,p_display_order=>590
,p_column_identifier=>'DM'
,p_column_label=>'Pdd Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617103029862646284)
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
 p_id=>wwv_flow_imp.id(9617310998610842962)
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
 p_id=>wwv_flow_imp.id(9617103278509646286)
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
 p_id=>wwv_flow_imp.id(9617103323956646287)
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
 p_id=>wwv_flow_imp.id(9617103470645646288)
,p_db_column_name=>'PDD_DUE_TYPE'
,p_display_order=>640
,p_column_identifier=>'DR'
,p_column_label=>'Pdd Due Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617103630023646290)
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
 p_id=>wwv_flow_imp.id(9617103573711646289)
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
 p_id=>wwv_flow_imp.id(9617103701983646291)
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
 p_id=>wwv_flow_imp.id(9617103791120646292)
,p_db_column_name=>'PDD_MS_ID'
,p_display_order=>680
,p_column_identifier=>'DV'
,p_column_label=>'Pdd Ms Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617103886544646293)
,p_db_column_name=>'PDD_PART_PAY_DISC_FLAG'
,p_display_order=>690
,p_column_identifier=>'DW'
,p_column_label=>'Pdd Part Pay Disc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617104071230646294)
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
 p_id=>wwv_flow_imp.id(9617104222366646296)
,p_db_column_name=>'PDD_PLANT'
,p_display_order=>720
,p_column_identifier=>'DZ'
,p_column_label=>'Pdd Plant'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617104315926646297)
,p_db_column_name=>'PDD_RESP_EMP_ID'
,p_display_order=>730
,p_column_identifier=>'EA'
,p_column_label=>'Pdd Resp Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617104434223646298)
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
 p_id=>wwv_flow_imp.id(9617105912226646263)
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
 p_id=>wwv_flow_imp.id(9617310672514842958)
,p_db_column_name=>'PDD_UPD_BY'
,p_display_order=>1340
,p_column_identifier=>'GJ'
,p_column_label=>'Pdd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617310762377842959)
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
 p_id=>wwv_flow_imp.id(9617104702543646301)
,p_db_column_name=>'PDD_USER'
,p_display_order=>770
,p_column_identifier=>'EE'
,p_column_label=>'Pdd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617110001445646304)
,p_db_column_name=>'PLANT_LOCATION_DEC'
,p_display_order=>1300
,p_column_identifier=>'GF'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617311724857842969)
,p_db_column_name=>'SRC_DOC_NO'
,p_display_order=>1450
,p_column_identifier=>'GU'
,p_column_label=>'Sou. Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617108048397646284)
,p_db_column_name=>'SUPLR_MSME_TYPE'
,p_display_order=>1100
,p_column_identifier=>'FL'
,p_column_label=>'MSME Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10361594236836154678)
,p_db_column_name=>'TERM_DESC'
,p_display_order=>1490
,p_column_identifier=>'GY'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9617312068026842972)
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
 p_id=>wwv_flow_imp.id(10357443618841413426)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8170203331952254072)
,p_plug_name=>'Supplier Bills'
,p_static_id=>'supplier-bills'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT suphd_plnt_loc_id,',
'       suphd_plant,',
'	    suphd_pfx,',
'	    suphd_doc_no,',
'	    suphd_doc_date,',
'	    suphd_suplr_doc_no,',
'	    suphd_suplr_doc_date,	',
'        DECODE(suphd_party_type, ''S'', ''Supplier'', ''C'', ''Customer'',',
'                       ''A'', ''Inter Unit'', ''N'', ''Intra Unit'', ''P'',',
'                       ''Cashier'', ''I'', ''Imprest'', ''T'', ''TDS'',''U'',''PF'',''E'',''ESI'',',
'                       ''L'', ''TCS'')suphd_party_type,    ',
'	    suphd_suplr_id,',
'        (SELECT suplr_name1',
'  	        FROM suppliers',
'		    WHERE suplr_bu = suphd_bu',
'            AND suplr_suplr_id = suphd_suplr_id)suplr_name,	 ',
'       suphd_currency,',
'       suphd_exchange_rate, 	   ',
'       suphd_sc_tot_amt,',
'       suphd_grn_no,',
'       suphd_grn_date,',
'	   suphd_dc_no,',
'       suphd_dc_date,',
'	   (SELECT apst_sub_type_desc',
'		   FROM appl_pfx_types,appl_vou_sub_types',
'		  WHERE apt_bu = apst_bu',
'		    AND apt_pfx_type = apst_vou_type',
'		    AND apt_bu = suphd_bu',
'		    AND apst_sub_type = suphd_grn_refer)suphd_grn_refer,',
'       DECODE(suphd_doc_type, ''SB'', ''Purchase Bill'', ''SI'', ''Sales Invoice'',''DN'', ''Debit Note'', ''CN'', ''Credit Note'', ''P'',''Payment'', ''R'', ''Receipt'', ''JV'', ''Journal Voucher'',''CV'', ''Contra Voucher'') suphd_doc_type	   ',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu',
'   AND suphd_status = :P11613102801_STATUS   ',
'   AND ((suphd_grn_refer||suphd_pur_type = :P11613102801_MODE AND :P11613102801_STATUS =''N'' AND :P11613102801_MODE <> ''Y'')',
'    OR (:P11613102801_STATUS =''O'' AND suphd_doc_type =''SB'' AND :P11613102801_MODE <> ''Y'')',
'    OR (:P11613102801_MODE = ''Y'' AND suphd_msme_flag = ''Y''  AND suphd_doc_type =''SB'' ))',
'ORDER BY suphd_doc_date desc,suphd_doc_no desc    '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11613102801_MODE,P11613102801_STATUS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'SB'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Supplier Bills'
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
 p_id=>wwv_flow_imp.id(8170203428078254073)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2688241592534643045
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565313840583133)
,p_db_column_name=>'SUPHD_CURRENCY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6724420973560680488)
,p_db_column_name=>'SUPHD_DC_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'DC Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&P11613102801_DATE_FMT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565818633583138)
,p_db_column_name=>'SUPHD_DC_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'DC No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6724420617601680485)
,p_db_column_name=>'SUPHD_DOC_DATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Vou.Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&P11613102801_DATE_FMT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8170203738886254077)
,p_db_column_name=>'SUPHD_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189566047864583141)
,p_db_column_name=>'SUPHD_DOC_TYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565398084583134)
,p_db_column_name=>'SUPHD_EXCHANGE_RATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6724420829170680487)
,p_db_column_name=>'SUPHD_GRN_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'GRN Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&P11613102801_DATE_FMT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565544177583136)
,p_db_column_name=>'SUPHD_GRN_NO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'GRN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565950536583140)
,p_db_column_name=>'SUPHD_GRN_REFER'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5869873672784804164)
,p_db_column_name=>'SUPHD_PARTY_TYPE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8170203687893254076)
,p_db_column_name=>'SUPHD_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8170203621759254075)
,p_db_column_name=>'SUPHD_PLANT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8170203454384254074)
,p_db_column_name=>'SUPHD_PLNT_LOC_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565524224583135)
,p_db_column_name=>'SUPHD_SC_TOT_AMT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6724420709599680486)
,p_db_column_name=>'SUPHD_SUPLR_DOC_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&P11613102801_DATE_FMT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189564877166583129)
,p_db_column_name=>'SUPHD_SUPLR_DOC_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bill No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565038710583131)
,p_db_column_name=>'SUPHD_SUPLR_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8189565222180583132)
,p_db_column_name=>'SUPLR_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8190308486228051634)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27083467'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SUPHD_PLNT_LOC_ID:SUPHD_PLANT:SUPHD_GRN_REFER:SUPHD_PFX:SUPHD_DOC_NO:SUPHD_DOC_DATE:SUPHD_PARTY_TYPE:SUPHD_SUPLR_ID:SUPLR_NAME:SUPHD_CURRENCY:SUPHD_EXCHANGE_RATE:SUPHD_SUPLR_DOC_NO:SUPHD_SUPLR_DOC_DATE:SUPHD_SC_TOT_AMT:SUPHD_GRN_NO:SUPHD_GRN_DATE:SUP'
||'HD_DC_NO:SUPHD_DC_DATE:SUPHD_DOC_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8190547183043342029)
,p_plug_name=>'Suppliers'
,p_static_id=>'suppliers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT suplr_bu,',
'       suplr_suplr_id,',
'       DECODE(suplr_status,''E'',''Draft'',''N'',''Entry Completed'',''A'',''Active'',''I'',''Inctive'')suplr_status,',
'       DECODE(suplr_status,''E'',''Blue'',''N'',''Deepskyblue'',''A'',''Green'',''I'',''Red'')color,',
'       suplr_name1,',
'       suplr_prnt_capn,',
'       DECODE(suplr_msme_type,''M'',''Medium'',''S'',''Small'',''O'',''Micro'',''L'',''Large'',''NA'',''Not Applicable'')suplr_msme_type,',
'       suplr_currency,',
'       suplr_addr1||suplr_addr2||suplr_addr3 suplr_addr1,',
'       suplr_po_box,',
'       (SELECT city_name1',
'          FROM cities',
'         WHERE city_bu =suplr_bu',
'          and city_id = suplr_city)City,',
'       suplr_city,',
'       (SELECT state_name1',
'          FROM states',
'         WHERE state_bu =suplr_bu',
'           and state_id = suplr_state)State,',
'       suplr_state,',
'       (SELECT Cntry_name1',
'          FROM Countries',
'         WHERE cntry_bu =suplr_bu',
'           and Cntry_id = suplr_country)Country,',
'       suplr_country,',
'       suplr_zip,',
'       suplr_tele1,',
'       suplr_fax1,',
'       suplr_email1,',
'       suplr_parent_suplr_id, ',
'     (SELECT suplr_name1',
'              FROM suppliers b',
'              WHERE b.suplr_bu=:Global_bu AND',
'              b.suplr_status =''A'' AND',
'              b.suplr_suplr_id = a.suplr_parent_suplr_id',
'              )suplr_parent,',
'         DECODE(suplr_part_flag,''N'',''Independent '',''Y'',''Parent Party'',''C'',''Child Party'')Party_Type,',
'       suplr_web_site1,',
'       (SELECT supgrp_desc1',
'          FROM supplier_groups',
'         WHERE supgrp_bu       = :Global_bu ',
'           AND supgrp_group_id = suplr_group_id)Group_desc,',
'       (SELECT supsubgroup_desc1',
'          FROM supplier_subgroup',
'         WHERE supsubgroup_bu      = :Global_bu ',
'           AND supsubgroup_type_id = suplr_subgroup)subgroup,',
'       (SELECT term_desc1',
'          FROM terms_hd',
'         WHERE term_bu      = :Global_bu ',
'           AND term_term_id = suplr_term_id ',
'           AND term_status  = ''A'')Pay_term,',
'       (SELECT st_terr_desc',
'          FROM suplr_terr',
'         WHERE st_bu      = :Global_bu ',
'           AND st_terr_id = suplr_terr_id)Territory,',
'       (SELECT fob_desc1',
'          FROM fobs',
'         WHERE fob_bu = :Global_bu ',
'           AND fob_fob_id = suplr_fob_id)Inco_term,',
'       (SELECT sv_desc1',
'          FROM ship_vias',
'         WHERE sv_bu = :Global_bu ',
'           AND sv_shipvia_id = suplr_shipvia_id)shipvia,',
'       (SELECT (SELECT distinct gacl_desc1',
'                  FROM gl_account_classes',
'                 WHERE gacl_bu = sgg_bu AND gacl_id = sgg_cl_id)',
'         FROM suplr_gl_group',
'        WHERE sgg_bu       = suplr_bu',
'         AND  sgg_suplr_id = suplr_suplr_id',
'         AND  sgg_code       = ''AP'')Gl_Group_AP,',
'       (SELECT (SELECT distinct gacl_desc1',
'                  FROM gl_account_classes',
'                 WHERE gacl_bu = sgg_bu AND gacl_id = sgg_cl_id)',
'         FROM suplr_gl_group',
'        WHERE sgg_bu       = suplr_bu',
'         AND  sgg_suplr_id = suplr_suplr_id',
'         AND  sgg_code       = ''ADV'')Gl_Group_ADV,',
'       suplr_pan_no pan_no,',
'       Suplr_msme_no,',
'       TO_CHAR(suplr_msme_date_frm,:P11613102801_DATE_FMT)suplr_msme_date_frm,',
'       TO_CHAR(suplr_msme_date_to,:P11613102801_DATE_FMT)suplr_msme_date_to',
'  FROM suppliers a',
' WHERE suplr_bu     = :Global_bu',
'   AND suplr_status = ''A''',
'   AND suplr_msme_appl_flag = ''Y''  ',
'   --AND (TRUNC(suplr_msme_date_to) - TRUNC(SYSDATE)) BETWEEN 0 AND 10',
'   AND TRUNC (SYSDATE) - TRUNC (suplr_msme_date_to) >= 10  ',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11613102801_TYPE'
,p_plug_display_when_cond2=>'S'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Suppliers'
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
 p_id=>wwv_flow_imp.id(8190547249911342030)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2708585414367731002
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549015037342047)
,p_db_column_name=>'CITY'
,p_display_order=>170
,p_column_identifier=>'K'
,p_column_label=>'City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547714326342034)
,p_db_column_name=>'COLOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549336790342051)
,p_db_column_name=>'COUNTRY'
,p_display_order=>210
,p_column_identifier=>'O'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190551063178342068)
,p_db_column_name=>'GL_GROUP_ADV'
,p_display_order=>380
,p_column_identifier=>'AF'
,p_column_label=>'GL Group (ADV)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550949458342067)
,p_db_column_name=>'GL_GROUP_AP'
,p_display_order=>370
,p_column_identifier=>'AE'
,p_column_label=>'GL Group(AP)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550395284342061)
,p_db_column_name=>'GROUP_DESC'
,p_display_order=>310
,p_column_identifier=>'Y'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550821329342065)
,p_db_column_name=>'INCO_TERM'
,p_display_order=>350
,p_column_identifier=>'AC'
,p_column_label=>'INCO Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190551185179342069)
,p_db_column_name=>'PAN_NO'
,p_display_order=>390
,p_column_identifier=>'AG'
,p_column_label=>'PAN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550177118342059)
,p_db_column_name=>'PARTY_TYPE'
,p_display_order=>290
,p_column_identifier=>'W'
,p_column_label=>'Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550622717342063)
,p_db_column_name=>'PAY_TERM'
,p_display_order=>330
,p_column_identifier=>'AA'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550925682342066)
,p_db_column_name=>'SHIPVIA'
,p_display_order=>360
,p_column_identifier=>'AD'
,p_column_label=>'Trans./Ship Via'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549216740342049)
,p_db_column_name=>'STATE'
,p_display_order=>190
,p_column_identifier=>'M'
,p_column_label=>'State'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550484148342062)
,p_db_column_name=>'SUBGROUP'
,p_display_order=>320
,p_column_identifier=>'Z'
,p_column_label=>'Sub Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190548826386342045)
,p_db_column_name=>'SUPLR_ADDR1'
,p_display_order=>150
,p_column_identifier=>'I'
,p_column_label=>'Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547398457342031)
,p_db_column_name=>'SUPLR_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Suplr Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549092689342048)
,p_db_column_name=>'SUPLR_CITY'
,p_display_order=>180
,p_column_identifier=>'L'
,p_column_label=>'Suplr City'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549458570342052)
,p_db_column_name=>'SUPLR_COUNTRY'
,p_display_order=>220
,p_column_identifier=>'P'
,p_column_label=>'Suplr Country'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190548121286342038)
,p_db_column_name=>'SUPLR_CURRENCY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549848811342056)
,p_db_column_name=>'SUPLR_EMAIL1'
,p_display_order=>260
,p_column_identifier=>'T'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549787642342055)
,p_db_column_name=>'SUPLR_FAX1'
,p_display_order=>250
,p_column_identifier=>'S'
,p_column_label=>'Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190551428923342071)
,p_db_column_name=>'SUPLR_MSME_DATE_FRM'
,p_display_order=>410
,p_column_identifier=>'AI'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190551485924342072)
,p_db_column_name=>'SUPLR_MSME_DATE_TO'
,p_display_order=>420
,p_column_identifier=>'AJ'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190551327736342070)
,p_db_column_name=>'SUPLR_MSME_NO'
,p_display_order=>400
,p_column_identifier=>'AH'
,p_column_label=>'MSME No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190548027522342037)
,p_db_column_name=>'SUPLR_MSME_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MSME Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547774573342035)
,p_db_column_name=>'SUPLR_NAME1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550053133342058)
,p_db_column_name=>'SUPLR_PARENT'
,p_display_order=>280
,p_column_identifier=>'V'
,p_column_label=>'Parent Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550017476342057)
,p_db_column_name=>'SUPLR_PARENT_SUPLR_ID'
,p_display_order=>270
,p_column_identifier=>'U'
,p_column_label=>'Parent ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190548889440342046)
,p_db_column_name=>'SUPLR_PO_BOX'
,p_display_order=>160
,p_column_identifier=>'J'
,p_column_label=>'PIN Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547881978342036)
,p_db_column_name=>'SUPLR_PRNT_CAPN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549242569342050)
,p_db_column_name=>'SUPLR_STATE'
,p_display_order=>200
,p_column_identifier=>'N'
,p_column_label=>'Suplr State'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547594527342033)
,p_db_column_name=>'SUPLR_STATUS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190547480577342032)
,p_db_column_name=>'SUPLR_SUPLR_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549680335342054)
,p_db_column_name=>'SUPLR_TELE1'
,p_display_order=>240
,p_column_identifier=>'R'
,p_column_label=>'Telephone'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550281208342060)
,p_db_column_name=>'SUPLR_WEB_SITE1'
,p_display_order=>300
,p_column_identifier=>'X'
,p_column_label=>'Website'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190549591923342053)
,p_db_column_name=>'SUPLR_ZIP'
,p_display_order=>230
,p_column_identifier=>'Q'
,p_column_label=>'PIN Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8190550687662342064)
,p_db_column_name=>'TERRITORY'
,p_display_order=>340
,p_column_identifier=>'AB'
,p_column_label=>'Territory'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8190585299750382043)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27086235'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SUPLR_SUPLR_ID:SUPLR_NAME1:PAN_NO:SUPLR_MSME_TYPE:SUPLR_MSME_NO:SUPLR_MSME_DATE_FRM:SUPLR_MSME_DATE_TO:SUPLR_CURRENCY:SUPLR_ADDR1:CITY:STATE:COUNTRY:SUPLR_ZIP:SUPLR_TELE1:SUPLR_EMAIL1:SUPLR_FAX1:SUPLR_WEB_SITE1:GROUP_DESC:SUBGROUP:PAY_TERM:TERRITORY:'
||'INCO_TERM:SHIPVIA:GL_GROUP_AP:GL_GROUP_ADV:PARTY_TYPE:SUPLR_PARENT_SUPLR_ID:SUPLR_PARENT:SUPLR_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5556284449567095136)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(8170202952009254069)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8189566371160583144)
,p_name=>'P11613102801_DATE_FMT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8170202952009254069)
,p_item_default=>'func_find_date_format(:global_bu)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8189566233231583142)
,p_name=>'P11613102801_MODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8170202952009254069)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8189566251012583143)
,p_name=>'P11613102801_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8170202952009254069)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8170203217617254071)
,p_name=>'P11613102801_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8170202952009254069)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5556284599678095137)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5556284449567095136)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5556284677605095138)
,p_event_id=>wwv_flow_imp.id(5556284599678095137)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
