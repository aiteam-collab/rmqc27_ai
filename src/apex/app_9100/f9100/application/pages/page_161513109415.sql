prompt --application/pages/page_161513109415
begin
--   Manifest
--     PAGE: 161513109415
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
 p_id=>161513109415
,p_name=>'View Journal'
,p_alias=>'VIEW-JOURNAL'
,p_page_mode=>'MODAL'
,p_step_title=>'View Journal'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }',
'',
'#jrnl.a-IRR-headerLink {',
'    text-decoration: none;',
'    color: white;',
'    background: #0c790a70;',
'   ',
'}',
'',
'#cr td.a-IRR-aggregate.u-tR {',
'    color: green;',
'}',
'',
'#dr td.a-IRR-aggregate.u-tR {',
'    color: red;',
'}',
'',
'',
'',
'',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'',
'.t-Tabs--simple .t-Tabs-link {',
'    color: #3F51B5;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1300'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10050202987457390179)
,p_plug_name=>'Details'
,p_static_id=>'details'
,p_parent_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 7/21/2022 11:01:46 AM (QP5 v5.163.1008.3004) */',
'SELECT ajhv_bu,',
'       ajhv_plnt,',
'       ajhv_jrnl_trns_no,',
'       ajhv_jrnl_trns_seq_no,',
'		 ajhv_jrnl_trns_seq_no line,',
'       ajhv_acctg_plnt,',
'       ajhv_gl_lvl1,',
'       ajhv_gl_lvl2,',
'       ajhv_gl_lvl3,',
'       ajhv_gl_lvl4,',
'       ajhv_gl_lvl5,',
'       ajhv_gl_lvl6,',
'       ajhv_gl_lvl_prj,',
'       ajhv_gl_acct,',
'       ajhv_gl_acct_desc,',
'       ajhv_cc_code,',
'       ajhv_gl_plnt_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = :Global_bu ',
'           AND bupld_loc_id = ajhv_gl_plnt_loc_id)unit_loc_desc,',
'       (SELECT pcc_desc',
'          FROM profit_cost_centers',
'         WHERE pcc_bu = ajhv_bu',
'           AND pcc_ac_plnt = ajhv_acctg_plnt',
'           AND pcc_ac_lvl1 = ajhv_gl_lvl1',
'           AND pcc_ac_lvl2 = ajhv_gl_lvl2',
'           AND pcc_ac_lvl3 = ajhv_gl_lvl3',
'           AND pcc_ac_lvl4 = ajhv_gl_lvl4',
'           AND pcc_ac_lvl5 = ajhv_gl_lvl5',
'           AND pcc_ac_lvl6 = ajhv_gl_lvl6',
'           AND pcc_ac_lvl_prj = ajhv_gl_lvl_prj)',
'          "Cost Center",',
'       CASE WHEN (Instr(NVL(:REQUEST,''~''),''CSV'')= 1 OR Instr(NVL(:REQUEST,''~''),''XLSX'')= 1) THEN',
'          ajhv_reference1 ',
'      ELSE    ',
'          SUBSTR(ajhv_reference1,1,50)',
'       END ajhv_reference1,                   ',
'       ajhv_reference1 ajhv_reference,',
'       ajhv_reference2,',
'       ajhv_fc_db_amt,',
'       ajhv_fc_cr_amt,',
'       ajhv_bc_db_amt,',
'       ajhv_bc_cr_amt,',
'       ajhv_db_ex_rate,',
'       ajhv_cr_ex_rate,',
'       ajhv_jrnl_date,',
'       ajhv_jrnl_year,',
'       ajhv_jrnl_period,',
'       ajhv_appl,',
'       ajhv_status,',
'       ajhv_jrnl_no,',
'       ajhv_cre_by,',
'       ajhv_cre_date,',
'       ajhv_upd_by,',
'       ajhv_upd_date,',
'       ajhv_vou_type,',
'       ajhv_vou_pfx,',
'       ajhv_vou_no,',
'       ajhv_vou_line_no,',
'       type,',
'       ajhv_ref_no,',
'       ajhv_ref_date,',
'       ajhv_asset_id,',
'       ajhv_asset_desc,',
'       ajhv_hsn_code,',
'       ajhv_assbl_value,',
'       ajhv_tc_pct,',
'       ajhv_gst_rev_tax_flag,',
'       ajhv_gst_suplr_name,',
'       ajhv_state_code,',
'       ajhv_gstin_no,',
'       ajhv_gst_type,',
'       ajhv_gst_class,',
'       ajhv_suplr_type,',
'       ajhv_gst_rev_tax_cat,',
'       ajhv_boe_date,',
'       ajhv_boe_no,',
'       ajhv_port_code,',
'       ajhv_lc_import_flag,',
'       ajhv_suplr_id,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = :Global_bu ',
'			  AND suplr_suplr_id = ajhv_suplr_id',
'			  AND suplr_status =''A'') ajhv_suplr_name,',
'       ajhv_cust_id,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = :Global_bu ',
'			  AND suplr_suplr_id = ajhv_cust_id',
'			  AND suplr_status =''A'') ajhv_cust_name,',
'       ajhv_bank_id,',
'		 (SELECT bank_name1',
'          FROM banks',
'         WHERE bank_bu = :Global_bu ',
'           AND bank_id = ajhv_bank_id)ajhv_bank_name,',
'       ajhv_prod_id,',
'       ajhv_prod_rev,',
'       (SELECT prod_desc11',
'          FROM products',
'         WHERE prod_bu  = :Global_bu',
'           AND prod_id  = ajhv_prod_id',
'           AND prod_rev = ajhv_prod_rev)ajhv_prod_desc1,',
'       ajhv_tc_id,',
'       ajhv_tc_desc,',
'       ajhv_vat_class,',
'       ajhv_vat_type,',
'       ajhv_pin_no,',
'       ajhv_vat_appl_flag,',
'       ajhv_vat_suplr_type,',
'       DECODE(ajhv_vat_match_type,''PR'',''Purchase'',''SCO'',''Subcontract'',''ST'',''Stock Trans.'',''EXP'',''Expense'',''LC'',''Landed Cost(LC)'',''F'',''Freight'',',
'       ''ISD'',''ISD Invoice'',''BPV'',''Bank Payment Voucher'',''BRV'',''Bank Receipt Voucher'',''BCHRG'',''Bank Charges'',''BFT'',''Fund Transfer'',''BERNG'',''Earnings'',',
'       ''CPV'',''Cash Payment Voucher'',''BRV'',''Cash Receipt Voucher'',''JV'',''Journal Voucher'',''SO'',''Sales(Std.)'',''STR'',''Sales(Stk. Trfr. - Internal)'',',
'       ''SE'',''Sales(Stk. Trfr. - External)'',''TP'',''Sales(Stk. Trfr. - 3PL)'',''SU'',''Sales(Suplmntry)'',''SSS'',''Sales(Scrap)'',''LO'',''Sales(Labor)'',''LI'',''Sales(Labor Internal - Entity)'',',
'       ''SI'',''Sales(Service)'',''DP'',''Sales(License)'',''DE'',''Sales(Demo / Exhn.)'',''FA'',''Sales(Fixed Assets)'',''FE'',''Sales(Free Rplcmnt.)'',''FS'',''Sales(Free Sample)'',',
'       ''TT'',''Sales(Trfr. Serv. Tax)'',''OH'',''Sales(Others)'',''LE'',''Sales(Labor Internal - Unit)'',''RB'',''Sales(Rework LO Internal - Entity)'',''RP'',''Sales(Rework LO Internal - Unit)'',',
'       ''PJ'',''Project'',''CR'',''Sales Correction'',''NS'',''Pur. Rtn. WO GRN/W/G'',''NN'',''Pur. Rtn. WO GRN/WO/G'',''NT'',''Stk. Trfr. Pur. Rtn. W.GRN/W/G'',''NO'',''Stk. Trfr. Pur. Rtn. WO GRN/W/G'',',
'       ''SPS'',''SCO Rej. WO/G(Primary)'',''SW'',''SCO Rej. W/G'',''SC'',''SCO Rej. WO/G(Sec.'',''SQ'',''SCO Shortage Qty.'',''IV'',''QPD Var. (DR)'',''IC'',''QPD Var. (CR)'',''RND'',''Demo / Exhn.'',',
'       ''RL'',''Rplcmnt.'',''RSS'',''Sample'',''SR'',''Sales W/G'',''SG'',''Sales WO/G'',''LR'',''Labor'',''SN'',''Service'',''RVA'',''QPD Var.'',''RY'',''Suplmntry.'',''RH'',''Others - Sales'',',
'       ''RU'',''Stock Trfr.'',''FAM'',''Fixed Asset'',''DD'',''DD/FMS/MEIS/DFIA/RODTEP'',''APR'',''AP Revalutaion'',''ARR'',''AR Revalutaion'',''BD'',''Bills Discounting'',''BDC'',''Bills Discounting Closure'',',
'       ''ST'',''Standard(PR)'',''TS'',''Stock Transfer - Inter'',''AT'',''Stock Transfer - Intra'',''SP'',''Standard(SC)'',''RS'',''Rework(SC)'',''SV'',''SC Value Addition'',''RV'',''Rework(VA)'',''MS'',''Maint. Service'',''SL'',''Standard(Tools)'',',
'       ''SS'',''Standard(Service)'',''SA'',''Sample'',''DF'',''Defect'',''RD'',''R&D'',''OTH'',''Others'',ajhv_vat_match_type)ajhv_vat_match_type,',
'       ajhv_etr_no,',
'       ajhv_exempt_no,',
'       ajhv_port_of_load,',
'       ajhv_fin_dest,',
'       ajhv_cnr_sou_inv_no,',
'       ajhv_cnr_sou_inv_date,',
'       ajhv_grn_suplr_doc_no,',
'       ajhv_grn_suplr_doc_date,',
'       ajhv_input_type,',
'       ajhv_old_inv_pfx,',
'       ajhv_old_inv_no,',
'       ajhv_old_inv_date,',
'       ajhv_tds_us_id,',
'       ajhv_tds_assbl_val,',
'       ajhv_tds_pct,',
'       ajhv_tds_amt,',
'       posted_flag,',
'       ajhv_grn_tc_type,',
'       ajhv_tds_src_acct,',
'       ajhv_cfc_code,',
'       (SELECT cfc_desc',
'          FROM cash_flow_code',
'         WHERE cfc_bu = ajhv_bu AND cfc_code = ajhv_cfc_code)ajhv_cfc_code_desc,',
'       ajhv_xpns_code,',
'       (SELECT txc_code_desc',
'          FROM trv_xpns_code',
'         WHERE txc_bu = ajhv_bu',
'           AND txc_xpns_code = ajhv_xpns_code) ajhv_xpns_code_desc,',
'        ajhv_emp_id,',
'        ajhv_emp_name,   ',
'        (SELECT dept_name1',
'           FROM departments',
'          WHERE dept_bu = ajhv_bu',
'            AND dept_id = ajhv_dept_id)ajhv_dept_desc,',
'		 ''<span aria-hidden="true" class="fa fa-exchange" style="color: deepskyblue;"></span>'' grn_details',
'  FROM appl_journals_hist_vw',
' WHERE ajhv_bu = :Global_bu',
'  AND (ajhv_vou_type = :P161513109415_VOC_TYPE',
'       OR :P161513109415_VOC_TYPE IS NULL)',
'  AND ajhv_vou_no = :P161513109415_ORD_NO',
'  AND (ajhv_vou_pfx = :P161513109415_ORD_PFX or :P161513109415_ORD_PFX is null)',
'  AND (AJHV_BC_DB_AMT > 0 OR AJHV_BC_CR_AMT > 0)',
'  AND ((:P161513109415_SEL_FLAG =''Y'') OR (ajhv_gl_acct NOT IN (SELECT DISTINCT uwa_acct FROM unitwise_accounts WHERE uwa_bu = :P161513109415_BU) AND :P161513109415_SEL_FLAG =''N'') )'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P161513109415_VOC_TYPE,P161513109415_ORD_NO,P161513109415_ORD_PFX,P161513109415_SEL_FLAG,P161513109415_BU'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Details'
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
 p_id=>wwv_flow_imp.id(10050203030657390180)
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
,p_internal_uid=>4568241195113779152
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276087452526704466)
,p_db_column_name=>'AJHV_ACCTG_PLNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276094944982704556)
,p_db_column_name=>'AJHV_APPL'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Ajhv Appl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276101708825704666)
,p_db_column_name=>'AJHV_ASSBL_VALUE'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Assbl. Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276100892101704656)
,p_db_column_name=>'AJHV_ASSET_DESC'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Ajhv Asset Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276100451968704644)
,p_db_column_name=>'AJHV_ASSET_ID'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Asset ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276108733467704742)
,p_db_column_name=>'AJHV_BANK_ID'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Bank ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276109194966704745)
,p_db_column_name=>'AJHV_BANK_NAME'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Bank Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276092548673704531)
,p_db_column_name=>'AJHV_BC_CR_AMT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Credit'
,p_column_html_expression=>'<div style="color:green;width:98px; font-weight:bold;">#AJHV_BC_CR_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276092200254704528)
,p_db_column_name=>'AJHV_BC_DB_AMT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Debit'
,p_column_html_expression=>'<div style="color:red; width:95px; font-weight:bold;">#AJHV_BC_DB_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276105616187704695)
,p_db_column_name=>'AJHV_BOE_DATE'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Boe Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276105945703704703)
,p_db_column_name=>'AJHV_BOE_NO'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Boe No.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276085864650704439)
,p_db_column_name=>'AJHV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ajhv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276083842586704392)
,p_db_column_name=>'AJHV_CC_CODE'
,p_display_order=>950
,p_column_identifier=>'CP'
,p_column_label=>'CPC Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10089773693880887768)
,p_db_column_name=>'AJHV_CFC_CODE'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'CF ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10089773708865887769)
,p_db_column_name=>'AJHV_CFC_CODE_DESC'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'CF  Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276115841799704817)
,p_db_column_name=>'AJHV_CNR_SOU_INV_DATE'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Ajhv Cnr Sou Inv Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276115513289704813)
,p_db_column_name=>'AJHV_CNR_SOU_INV_NO'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Ajhv Cnr Sou Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276096190548704570)
,p_db_column_name=>'AJHV_CRE_BY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Ajhv Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276096560434704574)
,p_db_column_name=>'AJHV_CRE_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Ajhv Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276093347185704536)
,p_db_column_name=>'AJHV_CR_EX_RATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'CR Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276107929459704738)
,p_db_column_name=>'AJHV_CUST_ID'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Customer ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005718274962078177)
,p_db_column_name=>'AJHV_CUST_NAME'
,p_display_order=>580
,p_column_identifier=>'CU'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276092998509704535)
,p_db_column_name=>'AJHV_DB_EX_RATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'DB Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5761045663947027436)
,p_db_column_name=>'AJHV_DEPT_DESC'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Dept. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5761045472128027434)
,p_db_column_name=>'AJHV_EMP_ID'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5761045592240027435)
,p_db_column_name=>'AJHV_EMP_NAME'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276113856313704791)
,p_db_column_name=>'AJHV_ETR_NO'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Ajhv Etr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276114230155704795)
,p_db_column_name=>'AJHV_EXEMPT_NO'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Ajhv Exempt No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276091800773704524)
,p_db_column_name=>'AJHV_FC_CR_AMT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Credit (FC)'
,p_column_html_expression=>'<div style="color:green; font-weight:bold;">#AJHV_FC_CR_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276091360099704517)
,p_db_column_name=>'AJHV_FC_DB_AMT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Debit (FC)'
,p_column_html_expression=>'<div style="color:red; font-weight:bold;">#AJHV_FC_DB_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276115075848704811)
,p_db_column_name=>'AJHV_FIN_DEST'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Ajhv Fin Dest'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276089815412704505)
,p_db_column_name=>'AJHV_GL_ACCT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'GL Acct. No.'
,p_column_html_expression=>'<span style="display:block; width:100px">#AJHV_GL_ACCT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276090197269704510)
,p_db_column_name=>'AJHV_GL_ACCT_DESC'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'GL Acct. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276087864564704470)
,p_db_column_name=>'AJHV_GL_LVL1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Lvl 1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276088297586704474)
,p_db_column_name=>'AJHV_GL_LVL2'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Lvl 2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276088672110704478)
,p_db_column_name=>'AJHV_GL_LVL3'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Lvl 3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276088984057704491)
,p_db_column_name=>'AJHV_GL_LVL4'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Lvl 4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276085065758704424)
,p_db_column_name=>'AJHV_GL_LVL5'
,p_display_order=>930
,p_column_identifier=>'CN'
,p_column_label=>'Lvl 5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276085486705704428)
,p_db_column_name=>'AJHV_GL_LVL6'
,p_display_order=>940
,p_column_identifier=>'CO'
,p_column_label=>'Lvl 6'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276089347858704500)
,p_db_column_name=>'AJHV_GL_LVL_PRJ'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Project'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276084289068704405)
,p_db_column_name=>'AJHV_GL_PLNT_LOC_ID'
,p_display_order=>960
,p_column_identifier=>'CQ'
,p_column_label=>'Unit Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276116692933704827)
,p_db_column_name=>'AJHV_GRN_SUPLR_DOC_DATE'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Ajhv Grn Suplr Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276116304529704820)
,p_db_column_name=>'AJHV_GRN_SUPLR_DOC_NO'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Ajhv Grn Suplr Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276120589493704883)
,p_db_column_name=>'AJHV_GRN_TC_TYPE'
,p_display_order=>900
,p_column_identifier=>'CK'
,p_column_label=>'Ajhv Grn Tc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276103577504704685)
,p_db_column_name=>'AJHV_GSTIN_NO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Ajhv Gstin No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276104413390704689)
,p_db_column_name=>'AJHV_GST_CLASS'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Ajhv Gst Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276105134794704694)
,p_db_column_name=>'AJHV_GST_REV_TAX_CAT'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Ajhv Gst Rev Tax Cat'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276102498597704674)
,p_db_column_name=>'AJHV_GST_REV_TAX_FLAG'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Ajhv Gst Rev Tax Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276102834701704678)
,p_db_column_name=>'AJHV_GST_SUPLR_NAME'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Ajhv Gst Suplr Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276103973373704686)
,p_db_column_name=>'AJHV_GST_TYPE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Ajhv Gst Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276101226171704664)
,p_db_column_name=>'AJHV_HSN_CODE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Ajhv Hsn Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276117115344704835)
,p_db_column_name=>'AJHV_INPUT_TYPE'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Ajhv Input Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276093791319704539)
,p_db_column_name=>'AJHV_JRNL_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Ajhv Jrnl Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276095769386704564)
,p_db_column_name=>'AJHV_JRNL_NO'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Ajhv Jrnl No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276094553544704550)
,p_db_column_name=>'AJHV_JRNL_PERIOD'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Ajhv Jrnl Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276086643282704455)
,p_db_column_name=>'AJHV_JRNL_TRNS_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Trans. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276087028513704460)
,p_db_column_name=>'AJHV_JRNL_TRNS_SEQ_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Seq. No.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276094184312704542)
,p_db_column_name=>'AJHV_JRNL_YEAR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Ajhv Jrnl Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276106760376704714)
,p_db_column_name=>'AJHV_LC_IMPORT_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Ajhv Lc Import Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276118238559704842)
,p_db_column_name=>'AJHV_OLD_INV_DATE'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Ajhv Old Inv Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276117868163704841)
,p_db_column_name=>'AJHV_OLD_INV_NO'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Ajhv Old Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276117438224704838)
,p_db_column_name=>'AJHV_OLD_INV_PFX'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Ajhv Old Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276112365982704781)
,p_db_column_name=>'AJHV_PIN_NO'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Ajhv Pin No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276086241756704452)
,p_db_column_name=>'AJHV_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276106388580704708)
,p_db_column_name=>'AJHV_PORT_CODE'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Ajhv Port Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276114684286704806)
,p_db_column_name=>'AJHV_PORT_OF_LOAD'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Ajhv Port Of Load'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276110399801704755)
,p_db_column_name=>'AJHV_PROD_DESC1'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276109531376704752)
,p_db_column_name=>'AJHV_PROD_ID'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276110015618704753)
,p_db_column_name=>'AJHV_PROD_REV'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005718330682078178)
,p_db_column_name=>'AJHV_REFERENCE'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Ajhv Reference'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276090610716704514)
,p_db_column_name=>'AJHV_REFERENCE1'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Narration'
,p_column_html_expression=>'<span title="#AJHV_REFERENCE#">#AJHV_REFERENCE1#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276090942168704514)
,p_db_column_name=>'AJHV_REFERENCE2'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Ajhv Reference2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276100033326704628)
,p_db_column_name=>'AJHV_REF_DATE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Ajhv Ref Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276099654627704620)
,p_db_column_name=>'AJHV_REF_NO'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Ajhv Ref No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276103256281704680)
,p_db_column_name=>'AJHV_STATE_CODE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Ajhv State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276095396269704560)
,p_db_column_name=>'AJHV_STATUS'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Ajhv Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276107210604704720)
,p_db_column_name=>'AJHV_SUPLR_ID'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Supplier ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276107588662704733)
,p_db_column_name=>'AJHV_SUPLR_NAME'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Supplier Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276104825235704689)
,p_db_column_name=>'AJHV_SUPLR_TYPE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Ajhv Suplr Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276111145268704774)
,p_db_column_name=>'AJHV_TC_DESC'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Tax Desc.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276110728111704758)
,p_db_column_name=>'AJHV_TC_ID'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Tax'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276102082047704670)
,p_db_column_name=>'AJHV_TC_PCT'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Tax Pct.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276119839869704874)
,p_db_column_name=>'AJHV_TDS_AMT'
,p_display_order=>880
,p_column_identifier=>'CI'
,p_column_label=>'TDS Src.Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276119084325704856)
,p_db_column_name=>'AJHV_TDS_ASSBL_VAL'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'TDS Assbl. Val.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276119442681704861)
,p_db_column_name=>'AJHV_TDS_PCT'
,p_display_order=>870
,p_column_identifier=>'CH'
,p_column_label=>'TDS Src.Pct.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276121022530704897)
,p_db_column_name=>'AJHV_TDS_SRC_ACCT'
,p_display_order=>910
,p_column_identifier=>'CL'
,p_column_label=>'TDS Src.Acct.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276118713985704850)
,p_db_column_name=>'AJHV_TDS_US_ID'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'TDS u/s No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276096852324704583)
,p_db_column_name=>'AJHV_UPD_BY'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Ajhv Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276097294542704589)
,p_db_column_name=>'AJHV_UPD_DATE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Ajhv Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276112651937704783)
,p_db_column_name=>'AJHV_VAT_APPL_FLAG'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Ajhv Vat Appl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276111581027704775)
,p_db_column_name=>'AJHV_VAT_CLASS'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Ajhv Vat Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276113452997704791)
,p_db_column_name=>'AJHV_VAT_MATCH_TYPE'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Matching'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276113045929704788)
,p_db_column_name=>'AJHV_VAT_SUPLR_TYPE'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Ajhv Vat Suplr Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276111973342704777)
,p_db_column_name=>'AJHV_VAT_TYPE'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Ajhv Vat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276098880666704610)
,p_db_column_name=>'AJHV_VOU_LINE_NO'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Line No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276098503990704605)
,p_db_column_name=>'AJHV_VOU_NO'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Ajhv Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276098068896704597)
,p_db_column_name=>'AJHV_VOU_PFX'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Ajhv Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276097683675704594)
,p_db_column_name=>'AJHV_VOU_TYPE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Ajhv Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10089773872625887770)
,p_db_column_name=>'AJHV_XPNS_CODE'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'Expense Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10089773909736887771)
,p_db_column_name=>'AJHV_XPNS_CODE_DESC'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Expense Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276121401182704900)
,p_db_column_name=>'Cost Center'
,p_display_order=>920
,p_column_identifier=>'CM'
,p_column_label=>'CPC Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9866218045704662731)
,p_db_column_name=>'GRN_DETAILS'
,p_display_order=>980
,p_column_identifier=>'CS'
,p_column_label=>'GST Details'
,p_column_link=>'f?p=&APP_ID.:161513109416:&SESSION.::&DEBUG.::P161513109416_ACCT,P161513109416_LINE,P161513109416_PLNT,P161513109416_VOU_NO,P161513109416_VOU_PFX:#AJHV_GL_ACCT#,#AJHV_VOU_LINE_NO#,#AJHV_PLNT#,#AJHV_VOU_NO#,#AJHV_VOU_PFX#'
,p_column_linktext=>'#GRN_DETAILS#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(Instr(NVL(:REQUEST,''~''),''CSV'')=0 AND Instr(NVL(:REQUEST,''~''),''XLSX'')= 0)',
' AND :P161513109415_VOC_TYPE NOT IN(''SA'',''MIV'',''MRV'')'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10638287240114098186)
,p_db_column_name=>'LINE'
,p_display_order=>990
,p_column_identifier=>'CT'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276120277004704881)
,p_db_column_name=>'POSTED_FLAG'
,p_display_order=>890
,p_column_identifier=>'CJ'
,p_column_label=>'Posted Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276099320846704616)
,p_db_column_name=>'TYPE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Jrnl In.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276084688570704410)
,p_db_column_name=>'UNIT_LOC_DESC'
,p_display_order=>970
,p_column_identifier=>'CR'
,p_column_label=>'Location Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10061595767857088618)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'791704'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'AJHV_PLNT:AJHV_GL_ACCT:AJHV_GL_ACCT_DESC:AJHV_CC_CODE:Cost Center:AJHV_BC_DB_AMT:AJHV_BC_CR_AMT:AJHV_JRNL_TRNS_NO:AJHV_JRNL_TRNS_SEQ_NO:AJHV_VOU_LINE_NO:TYPE:AJHV_REFERENCE1:AJHV_SUPLR_ID:AJHV_SUPLR_NAME:AJHV_CUST_ID:AJHV_CUST_NAME:AJHV_EMP_ID:AJHV_E'
||'MP_NAME:AJHV_DEPT_DESC:AJHV_CFC_CODE:AJHV_CFC_CODE_DESC:AJHV_XPNS_CODE:AJHV_XPNS_CODE_DESC:AJHV_ASSET_ID:AJHV_BANK_ID:AJHV_BANK_NAME:AJHV_PROD_ID:AJHV_PROD_REV:AJHV_PROD_DESC1:AJHV_VAT_MATCH_TYPE:AJHV_TC_PCT:AJHV_ASSBL_VALUE:AJHV_GL_PLNT_LOC_ID:UNIT_'
||'LOC_DESC:AJHV_TDS_US_ID:AJHV_TDS_SRC_ACCT:AJHV_TDS_ASSBL_VAL:AJHV_TDS_AMT:AJHV_TDS_PCT:GRN_DETAILS'
,p_sort_column_1=>'AJHV_BC_DB_AMT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'AJHV_BC_CR_AMT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'AJHV_BC_DB_AMT:AJHV_BC_CR_AMT:AJHV_FC_DB_AMT:AJHV_FC_CR_AMT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10061160090436864848)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT aj_vou_type,',
'       aj_vou_pfx,',
'       aj_vou_no,',
'       aj_plnt,',
'       aj_acctg_plnt,',
'       aj_cc_code,',
'       aj_gl_acct,',
'       (SELECT pcc_desc',
'          FROM profit_cost_centers',
'         WHERE pcc_bu = aj_bu',
'           AND pcc_ac_plnt = aj_acctg_plnt',
'           AND pcc_ac_lvl1 = aj_gl_lvl1',
'           AND pcc_ac_lvl2 = aj_gl_lvl2',
'           AND pcc_ac_lvl3 = aj_gl_lvl3',
'           AND pcc_ac_lvl4 = aj_gl_lvl4',
'           AND pcc_ac_lvl5 = aj_gl_lvl5',
'           AND pcc_ac_lvl6 = aj_gl_lvl6',
'           AND pcc_ac_lvl_prj = aj_gl_lvl_prj)',
'          "Cost Center",',
'       aj_bu,',
'       aj_gl_acct_desc,',
'       aj_gl_lvl1,',
'       aj_gl_lvl2,',
'       aj_gl_lvl3,',
'       aj_gl_lvl4,',
'       aj_gl_lvl5,',
'       aj_gl_lvl6,',
'       aj_gl_lvl_prj,',
'       db_amt,',
'       cr_amt,',
'       seq_no',
'  FROM appl_jrnl_vw',
' WHERE aj_bu = :Global_bu',
'   AND (aj_vou_type = :P161513109415_VOC_TYPE  OR :P161513109415_VOC_TYPE  IS NULL)',
'   AND aj_vou_no = :P161513109415_ORD_NO ',
'   AND (aj_vou_pfx = :P161513109415_ORD_PFX OR :P161513109415_ORD_PFX IS NULL)',
'   AND (db_amt - cr_amt) <> 0 ',
'   AND ((:P161513109415_SEL_FLAG =''Y'') OR (aj_gl_acct NOT IN (SELECT DISTINCT uwa_acct FROM unitwise_accounts WHERE uwa_bu = :P161513109415_BU) AND :P161513109415_SEL_FLAG =''N'') )',
'ORDER BY seq_no ASC	'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P161513109415_VOC_TYPE,P161513109415_ORD_NO,P161513109415_ORD_PFX,P161513109415_BU,P161513109415_SEL_FLAG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Summary'
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
 p_id=>wwv_flow_imp.id(10061160152917864848)
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
,p_internal_uid=>4579198317374253820
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276126270884704935)
,p_db_column_name=>'AJ_ACCTG_PLNT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276131873597704945)
,p_db_column_name=>'AJ_BU'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Aj Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276122399414704928)
,p_db_column_name=>'AJ_CC_CODE'
,p_display_order=>67
,p_column_identifier=>'AE'
,p_column_label=>'CPC Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276128631270704938)
,p_db_column_name=>'AJ_GL_ACCT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'GL Acct. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276132282636704945)
,p_db_column_name=>'AJ_GL_ACCT_DESC'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'GL Acct. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717240381078167)
,p_db_column_name=>'AJ_GL_LVL1'
,p_display_order=>77
,p_column_identifier=>'AF'
,p_column_label=>'Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717397395078168)
,p_db_column_name=>'AJ_GL_LVL2'
,p_display_order=>87
,p_column_identifier=>'AG'
,p_column_label=>'Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717447767078169)
,p_db_column_name=>'AJ_GL_LVL3'
,p_display_order=>97
,p_column_identifier=>'AH'
,p_column_label=>'Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717517862078170)
,p_db_column_name=>'AJ_GL_LVL4'
,p_display_order=>107
,p_column_identifier=>'AI'
,p_column_label=>'Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717695131078171)
,p_db_column_name=>'AJ_GL_LVL5'
,p_display_order=>117
,p_column_identifier=>'AJ'
,p_column_label=>'Lvl5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717785016078172)
,p_db_column_name=>'AJ_GL_LVL6'
,p_display_order=>127
,p_column_identifier=>'AK'
,p_column_label=>'Lvl6'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717809681078173)
,p_db_column_name=>'AJ_GL_LVL_PRJ'
,p_display_order=>137
,p_column_identifier=>'AL'
,p_column_label=>'Project'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10005717914840078174)
,p_db_column_name=>'AJ_PLNT'
,p_display_order=>147
,p_column_identifier=>'AM'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276125543887704935)
,p_db_column_name=>'AJ_VOU_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Aj Vou No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276125150202704935)
,p_db_column_name=>'AJ_VOU_PFX'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Aj Vou Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276124799423704933)
,p_db_column_name=>'AJ_VOU_TYPE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Aj Vou Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276133031072704949)
,p_db_column_name=>'CR_AMT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Credit '
,p_column_html_expression=>'<div style="color:green; font-weight:bold;">#CR_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_static_id=>'cr'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276124333201704931)
,p_db_column_name=>'Cost Center'
,p_display_order=>37
,p_column_identifier=>'AB'
,p_column_label=>'CPC Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276132723779704947)
,p_db_column_name=>'DB_AMT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Debit '
,p_column_html_expression=>'<div style="color:red; font-weight:bold;">#DB_AMT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_static_id=>'db'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9276133846674704950)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10061210009724915703)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'791823'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'AJ_PLNT:AJ_GL_ACCT:AJ_GL_ACCT_DESC:AJ_CC_CODE:Cost Center:DB_AMT:CR_AMT'
,p_sort_column_1=>'DB_AMT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CR_AMT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'SEQ_NO'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'DB_AMT:CR_AMT:FC_DB_AMT:FC_CR_AMT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10050202480242390174)
,p_plug_name=>'Tab'
,p_static_id=>'tab'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276082580724704587)
,p_name=>'P161513109415_AJ_GL_ACCT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276083001654704587)
,p_name=>'P161513109415_BU'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276081470502704586)
,p_name=>'P161513109415_DISP1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_prompt=>'<B>Vou. Type  </B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10005718605331078385)
,p_name=>'P161513109415_DISP2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_prompt=>'<B>Sub Vou. Type  </B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276082259708704587)
,p_name=>'P161513109415_ORD_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_prompt=>'<b>Vou. No.</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276081843450704586)
,p_name=>'P161513109415_ORD_PFX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276083383720704589)
,p_name=>'P161513109415_SEL_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT GLMCTRL_CTRL_ACCT_REQ_FLAG',
'  FROM glm_control',
'WHERE GLMCTRL_BU=:global_bu  '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'View Control Acc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10005718528499078384)
,p_name=>'P161513109415_SUB_VOC_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9276080997565704575)
,p_name=>'P161513109415_VOC_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10050202480242390174)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8103558295749953153)
,p_name=>'Colum grp'
,p_static_id=>'colum-grp'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103558791073953157)
,p_event_id=>wwv_flow_imp.id(8103558295749953153)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8103559176753953160)
,p_name=>'Colum grp_1'
,p_static_id=>'colum-grp-2'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10061160090436864848)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103559667669953162)
,p_event_id=>wwv_flow_imp.id(8103559176753953160)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8103560080335953163)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161513109415_SEL_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103560611633953163)
,p_event_id=>wwv_flow_imp.id(8103560080335953163)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P161513109415_BU',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '     SELECT DISTINCT uwa_bu ',
    '       INTO :P161513109415_BU',
    '       FROM unitwise_accounts',
    '      WHERE uwa_bu=:global_bu;',
    '  EXCEPTION WHEN NO_DATA_FOUND THEN',
    '      NULL;',
    'END;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161513109415_SEL_FLAG'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103561071536953165)
,p_event_id=>wwv_flow_imp.id(8103560080335953163)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P161513109415_BU',
  'language', 'PLSQL',
  'plsql_code', ':P161513109415_BU :=null;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161513109415_SEL_FLAG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103561568495953167)
,p_event_id=>wwv_flow_imp.id(8103560080335953163)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10050202987457390179)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8103562108867953168)
,p_event_id=>wwv_flow_imp.id(8103560080335953163)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Refresh'
,p_static_id=>'refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10061160090436864848)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8103558025165953148)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Voucher Type'
,p_static_id=>'process-voucher-type'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_vou        varchar2(200);',
'v_sub_vou    varchar2(200);',
'BEGIN',
'   SELECT unique apst_sub_type_desc,apt_pfx_type_desc',
'     INTO :P161513109415_DISP2,:P161513109415_DISP1',
'	  FROM appl_jrnl_vw,appl_vou_sub_types,appl_pfx_types',
'	 WHERE aj_bu = :Global_bu      ',
'      --AND (db_amt - cr_amt) <> 0  ',
'      AND apst_bu = aj_bu',
'      AND apt_bu = aj_bu',
'      AND apst_vou_type = aj_vou_type',
'      AND apt_pfx_type  = aj_vou_type',
'      AND apst_sub_type = aj_sub_vou_type',
'      AND (aj_vou_type = :P161513109415_VOC_TYPE  OR :P161513109415_VOC_TYPE  IS NULL)',
'      AND aj_vou_no = :P161513109415_ORD_NO ',
'      AND (aj_vou_pfx = :P161513109415_ORD_PFX OR :P161513109415_ORD_PFX IS NULL);',
'',
'     SELECT DISTINCT uwa_bu ',
'       INTO :P161513109415_BU',
'       FROM unitwise_accounts',
'      WHERE uwa_bu=:global_bu;',
'',
'EXCEPTION WHEN OTHERS THEN NULL;',
'END;',
'--:P161513109415_SEL_FLAG :=''Y'';',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2621596189622342120
);
wwv_flow_imp.component_end;
end;
/
