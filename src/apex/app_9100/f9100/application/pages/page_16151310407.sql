prompt --application/pages/page_16151310407
begin
--   Manifest
--     PAGE: 16151310407
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
 p_id=>16151310407
,p_name=>'Pending PR'
,p_alias=>'PENDING-PR'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending PR'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
' .ui-dialog-titlebar-close .ui-icon {',
'    --jui-icon-background-image: none;',
'    --jui-icon-size: var(--jui-dialog-title-close-icon-size, 16px);',
'    text-indent: 0;',
'}  ',
'',
'',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11826382813656973999)
,p_plug_name=>'PENDING'
,p_static_id=>'pending'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PRH_BU,',
'--prl_PROCR_ID,',
'PRH_PLANT,',
'PRH_RQST_DATE,',
'( SELECT distinct bup_name1',
'    FROM business_units, bus_unit_plants, appl_user_plant_access',
'   WHERE     bup_bu = bu_id',
'         AND bup_bu = auba_bu',
'         AND bup_plant_id = auba_plant',
'         AND auba_user_id = :GLOBAL_user',
'         AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)',
'         AND bup_bu = :GLOBAL_bu',
'			and bup_plant_id = PRH_PLANT) Unit,',
'PRH_PLNT_LOC_ID,',
' (SELECT DISTINCT bupld_loc_name',
'   FROM business_units,',
'        bus_unit_plants,',
'        appl_user_plant_access,',
'        bus_unit_plants_loc_dtls',
'  WHERE     bup_bu = bu_id',
'        AND bup_bu = auba_bu',
'        AND bup_plant_id = auba_plant',
'        AND auba_user_id = :GLOBAL_user',
'        AND TRUNC (SYSDATE) BETWEEN auba_from AND auba_to',
'        AND bup_bu = bupld_bu',
'        AND bup_plant_id = bupld_plnt',
'        AND bup_bu = :GLOBAL_bu',
'        --AND bup_mfg_flag IN (''M'',''N'')',
'        AND bupld_loc_iD = PRH_PLNT_LOC_ID',
'        AND bupld_plnt = PRH_PLANT)Location_Name,',
'PRL_RQST_NO,',
'prl_SEQ_NO,',
'--prl_rqst_pfx || '' - '' || prl_rqst_no || '' - '' || prl_seq_no || '' - '' || prl_sub_seq_no rqst_no_seq,',
'PRL_BUYER_ID,',
'PRL_PROD_TEMP_ID,',
'PRL_PROD_TEMP_REV,',
'(SELECT prod_ext_desc1',
'   FROM products',
'  WHERE prod_bu = prl_bu',
'    AND prod_id = PRL_PROD_TEMP_ID',
'    AND prod_rev = PRL_PROD_TEMP_REV)item_ext_desc1,',
'PRL_PROD_TEMP_DESC1,',
'PRL_PROD_UOM,',
'PRL_UOM,',
'PRL_BC_UNIT_COST,',
'prl_sel_flag,',
'prl_PLNT,',
'PRL_PROD_ID,',
'PRL_PROD_REV,',
'PRH_REC_SOURCE,',
'PRL_CUST_DRW_NO,',
'PRL_CUST_DRW_REV,',
'prl_SO_SCHLD_DESC,',
'PRL_PRIORITY,',
'PRL_LAST_PO_PRICE,',
'	(SELECT SUM (stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))',
'   	FROM stocks, stores',
'      WHERE  stock_bu = store_bu',
'		AND stock_store_id = store_id',
'		AND stock_bu = prh_bu',
'		AND store_plnt = prh_plant',
'		AND stock_prod_id = prl_prod_id',
'		AND stock_prod_rev = prl_prod_rev',
'		AND store_physical NOT IN (''J''))	STOCK_QTY,',
'   (SELECT NVL (SUM (pppv_bal_qty), 0)',
'      FROM pr_po_pend_view',
'		WHERE pppv_bu = prh_bu',
'				AND pppv_plnt = prh_plant',
'				AND pppv_prod_id = prl_prod_id',
'				AND pppv_prod_rev = prl_prod_rev)"PEND_PO_QTY",',
'CASE',
'	WHEN prl_sel_flag = ''Y''',
'	THEN',
'		prl_PROC_QTY',
'	WHEN prl_sel_flag = ''N''',
'	THEN',
'		(prl_requested_qty -(prl_rfq_qty + prl_cls_qty +prl_ordered_qty +prl_prof_qty))',
'END "PROC_QTY",',
'prl_PROC_QTY,',
'prl_RFQ,',
'prl_REQUESTED_QTY "PR. Qty.",',
'prl_cls_qty  "Cls. Qty.",',
'((prl_requested_qty - (prl_ordered_qty + prl_cls_qty + prl_rcpt_inproc_qty + ',
'                               prl_rcpt_rcvd_qty + prl_rfq_qty + prl_prof_qty + prl_po_amd_inproc_qty)) ) "Pending PR",',
'((prl_requested_qty - (prl_ordered_qty + prl_cls_qty + prl_rcpt_inproc_qty + ',
'                               prl_rcpt_rcvd_qty + prl_rfq_qty + prl_prof_qty + prl_po_amd_inproc_qty)) ) "Bal. Qty",										 ',
'prl_RFQ_QTY,',
'prl_ORDERED_QTY,',
'PRL_DRAWING_NO,',
'PRL_DRAWING_REV,',
'prh_mrp_no,',
'prl_store_name,',
'PRL_STORE_ID,',
'PRL_REQUIRED_DATE,',
'PRH_CRE_DATE,',
'(SELECT  apsta_pfx',
'                       FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc ',
'                      WHERE apsta_bu = adpl_bu',
'                        AND apsta_plnt = adpl_plnt',
'                        AND apsta_pfx = adpl_pfx',
'                        AND apsta_bu = :GLOBAL_bu',
'                        AND apsta_vou_type = ''PO''   ',
'                        AND apsta_plnt = prh_plant',
'                        AND ROWNUM = 1',
'                        AND adpl_loc_id = prh_plnt_loc_id',
'                        AND apsta_sub_type = CASE WHEN prh_rec_source = ''PRG'' THEN ''POG''',
'                                                  WHEN prh_rec_source = ''PRM'' THEN ''POM''',
'                                                  WHEN prh_rec_source = ''PRS'' THEN ''POS''   END)prl_po_pfx',
' FROM PUR_REQ_LN_SCDLE_VIEW',
'WHERE prh_bu = :global_bu ',
'  AND prl_rfq= ''N''',
'   AND EXISTS (SELECT 1',
'FROM appl_user_plant_access',
'WHERE auba_bu= :global_bu',
'  AND auba_user_id = :global_user',
'  AND TRUNC (SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to)',
'  AND auba_plant = prh_plant',
'  AND auba_plnt_loc_id = prh_plnt_loc_id)',
'  AND (prl_requested_qty -(prl_rfq_qty + prl_cls_qty +prl_ordered_qty +prl_prof_qty + prl_po_amd_inproc_qty)) > 0',
'ORDER BY PRH_RQST_DATE  DESC,PRL_RQST_NO desc ,prl_seq_no asc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PENDING'
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
 p_id=>wwv_flow_imp.id(11826199497135064431)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>500
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>6344237661591453403
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12137072584722463105)
,p_db_column_name=>'Bal. Qty'
,p_display_order=>6020
,p_column_identifier=>'HG'
,p_column_label=>'Bal. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12137072393145463103)
,p_db_column_name=>'Cls. Qty.'
,p_display_order=>6000
,p_column_identifier=>'HE'
,p_column_label=>'Cls. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6104332899729240102)
,p_db_column_name=>'ITEM_EXT_DESC1'
,p_display_order=>6270
,p_column_identifier=>'IH'
,p_column_label=>'Item Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12022000161974724437)
,p_db_column_name=>'LOCATION_NAME'
,p_display_order=>5980
,p_column_identifier=>'HC'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829063457033717019)
,p_db_column_name=>'PEND_PO_QTY'
,p_display_order=>5880
,p_column_identifier=>'\\'
,p_column_label=>'Pend. PR/PO'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12137072361512463102)
,p_db_column_name=>'PR. Qty.'
,p_display_order=>5990
,p_column_identifier=>'HD'
,p_column_label=>'Rqst. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11897444013349096129)
,p_db_column_name=>'PRH_BU'
,p_display_order=>5940
,p_column_identifier=>'GY'
,p_column_label=>'Prh Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9634448402257173252)
,p_db_column_name=>'PRH_CRE_DATE'
,p_display_order=>6210
,p_column_identifier=>'HZ'
,p_column_label=>'Prh Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12223014207195540909)
,p_db_column_name=>'PRH_MRP_NO'
,p_display_order=>6050
,p_column_identifier=>'HJ'
,p_column_label=>'MRP No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829007248986716807)
,p_db_column_name=>'PRH_PLANT'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11937951462154476907)
,p_db_column_name=>'PRH_PLNT_LOC_ID'
,p_display_order=>5950
,p_column_identifier=>'GZ'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829006941355716804)
,p_db_column_name=>'PRH_REC_SOURCE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Prh Rec Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9370019638182920941)
,p_db_column_name=>'PRH_RQST_DATE'
,p_display_order=>6190
,p_column_identifier=>'HX'
,p_column_label=>'PR Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829011134348716846)
,p_db_column_name=>'PRL_BC_UNIT_COST'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829017016267716805)
,p_db_column_name=>'PRL_BUYER_ID'
,p_display_order=>1240
,p_column_identifier=>'DT'
,p_column_label=>'Buyer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829016121847716846)
,p_db_column_name=>'PRL_CUST_DRW_NO'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Prl Cust Drw No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829016253174716847)
,p_db_column_name=>'PRL_CUST_DRW_REV'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Prl Cust Drw Rev'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12212331486243307147)
,p_db_column_name=>'PRL_DRAWING_NO'
,p_display_order=>6030
,p_column_identifier=>'HH'
,p_column_label=>'Dwg. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12212331570552307148)
,p_db_column_name=>'PRL_DRAWING_REV'
,p_display_order=>6040
,p_column_identifier=>'HI'
,p_column_label=>'Dwg. Rev.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829019282431716828)
,p_db_column_name=>'PRL_LAST_PO_PRICE'
,p_display_order=>1470
,p_column_identifier=>'EQ'
,p_column_label=>'Prl Last Po Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882908658303847)
,p_db_column_name=>'PRL_ORDERED_QTY'
,p_display_order=>6180
,p_column_identifier=>'HW'
,p_column_label=>'Prl Ordered Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882274053303841)
,p_db_column_name=>'PRL_PLNT'
,p_display_order=>6120
,p_column_identifier=>'HQ'
,p_column_label=>'Prl Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9975128273939997863)
,p_db_column_name=>'PRL_PO_PFX'
,p_display_order=>6220
,p_column_identifier=>'IA'
,p_column_label=>'PO Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829016926983716804)
,p_db_column_name=>'PRL_PRIORITY'
,p_display_order=>1230
,p_column_identifier=>'DS'
,p_column_label=>'Prl Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882507297303843)
,p_db_column_name=>'PRL_PROC_QTY'
,p_display_order=>6140
,p_column_identifier=>'HS'
,p_column_label=>'Prl Proc Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829009862063716833)
,p_db_column_name=>'PRL_PROD_ID'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Prl Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829009879997716834)
,p_db_column_name=>'PRL_PROD_REV'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Prl Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829013739338716822)
,p_db_column_name=>'PRL_PROD_TEMP_DESC1'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829012299993716808)
,p_db_column_name=>'PRL_PROD_TEMP_ID'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Item ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829012429212716809)
,p_db_column_name=>'PRL_PROD_TEMP_REV'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829010630744716841)
,p_db_column_name=>'PRL_PROD_UOM'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Stck. UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8738055994533911443)
,p_db_column_name=>'PRL_REQUIRED_DATE'
,p_display_order=>6090
,p_column_identifier=>'HN'
,p_column_label=>'Required Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882723971303845)
,p_db_column_name=>'PRL_RFQ'
,p_display_order=>6160
,p_column_identifier=>'HU'
,p_column_label=>'Prl Rfq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882762382303846)
,p_db_column_name=>'PRL_RFQ_QTY'
,p_display_order=>6170
,p_column_identifier=>'HV'
,p_column_label=>'Prl Rfq Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829009625820716831)
,p_db_column_name=>'PRL_RQST_NO'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'PR. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9385125435204590739)
,p_db_column_name=>'PRL_SEL_FLAG'
,p_display_order=>6200
,p_column_identifier=>'HY'
,p_column_label=>'Prl Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882139420303839)
,p_db_column_name=>'PRL_SEQ_NO'
,p_display_order=>6100
,p_column_identifier=>'HO'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8967882358580303842)
,p_db_column_name=>'PRL_SO_SCHLD_DESC'
,p_display_order=>6130
,p_column_identifier=>'HR'
,p_column_label=>'Prl So Schld Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8738055803189911441)
,p_db_column_name=>'PRL_STORE_ID'
,p_display_order=>6070
,p_column_identifier=>'HL'
,p_column_label=>'Prl Store Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8738055933160911442)
,p_db_column_name=>'PRL_STORE_NAME'
,p_display_order=>6080
,p_column_identifier=>'HM'
,p_column_label=>'Prl Store Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829010557257716840)
,p_db_column_name=>'PRL_UOM'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Pur. UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829063470380717020)
,p_db_column_name=>'PROC_QTY'
,p_display_order=>5890
,p_column_identifier=>'\\'
,p_column_label=>'Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12137072530784463104)
,p_db_column_name=>'Pending PR'
,p_display_order=>6010
,p_column_identifier=>'HF'
,p_column_label=>'Pend. PR Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11829063301032717018)
,p_db_column_name=>'STOCK_QTY'
,p_display_order=>5870
,p_column_identifier=>'\\'
,p_column_label=>'Cur. Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12021999985941724436)
,p_db_column_name=>'UNIT'
,p_display_order=>5970
,p_column_identifier=>'HB'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11829386137453901613)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10674355'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRH_PLNT_LOC_ID:PRH_PLANT:PRL_RQST_NO:PRH_RQST_DATE:PRL_SEQ_NO:PRL_BUYER_ID:PRL_PROD_TEMP_ID:PRL_PROD_TEMP_REV:PRL_PROD_TEMP_DESC1:PRL_UOM:PR. Qty.:PRL_REQUIRED_DATE:PRL_PROD_UOM:Bal. Qty:PRL_BC_UNIT_COST:ITEM_EXT_DESC1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5934076417859561364)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11826382813656973999)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5934076441534561365)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5934076417859561364)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5934076622361561366)
,p_event_id=>wwv_flow_imp.id(5934076441534561365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
