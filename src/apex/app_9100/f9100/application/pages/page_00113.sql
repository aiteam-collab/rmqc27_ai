prompt --application/pages/page_00113
begin
--   Manifest
--     PAGE: 00113
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
 p_id=>113
,p_name=>'Waiting for Approval (SO/CS)'
,p_alias=>'WAITING-FOR-APPROVAL-SO-CS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for Approval (SO/CS)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5538935788882460140)
,p_plug_name=>'Waiting for Approval(SO/CS)'
,p_static_id=>'waiting-for-approval-so-cs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT unit,',
'       unit_name,',
'       mon_ord "Month (Ord.)",',
'       mon_sch "Month (Sch.)",',
'       sou_type "Type",',
'       CASE',
'          WHEN :global_rpt_type = ''R'' THEN ord_rpt_type',
'          WHEN :global_rpt_type = ''B'' THEN ord_type',
'       END',
'          rpt_type,',
'       ord_type "Ord. Type",',
'       ord_rpt_type,',
'       orderno "Order Pfx. / No.",',
'       to_char(soh_order_date,:GLOBAL_RPT_DATE_MASK) "Ord. Date",',
'       cust_id "Cust.ID",',
'       customer "Cust. Name",',
'       soq_prod_id "Item",',
'       soq_prod_rev "Rev.",',
'       item "Item Desc.",',
'       line,',
'       uom,',
'       currency "Currency",',
'       ex_rate "Ex. Rate",',
'       soq_hsn_code "HSN Code",',
'       orderqty "Ordered Qty.",',
'       sol_qty_invoiced,',
'       (orderqty - sol_qty_invoiced) "Bal. Qty",',
'       unit_cost "Price",',
'       disc_pct "Disc Pct.",',
'       gst_reg_type,',
'       gst_classification,',
'       e_commerce_type,',
'       with_without_pay,',
'       input_type,',
'       gst_supply_type,',
'       cust_prod "Cust. Item",',
'       cust_desc "Cust. Item Desc.",',
'       soh_cust_po_no,',
'       to_char(soq_cust_po_date,:GLOBAL_RPT_DATE_MASK) soq_cust_po_date,',
'       soq_opo_po_no,',
'       to_char(soq_opo_po_date,:GLOBAL_RPT_DATE_MASK) soq_opo_po_date,',
'       area,',
'       territory,',
'       sub_territory,',
'       sales_person,',
'       grp,',
'       sub_grp,',
'       cls,',
'       sub_cls,',
'       cust_grp,',
'       cust_sub_grp,',
'       status,',
'       color,',
'       project,',
'       gross_amt,',
'cust_gross_amt,',
'disc_amt,',
'cust_disc_amt,',
'net_amt,',
'cust_net_amt,',
'tax_amt,',
'cust_tax_amt,',
'spl_disc,',
'spl_amt,',
'cash_disc,',
'cash_amt,',
'tax_pct,',
'igst_amt,',
'cgst_amt,',
'sgst_amt',
'  FROM (SELECT ''SO'' sou_type,',
'               fp_short_desc || ''-'' || TO_CHAR (soh_order_date, ''YY'') mon_ord,',
'               func_find_per_qtr_desc (',
'                  soh_bu,',
'                  func_find_period (soh_bu, soq_rqrd_date),',
'                  ''S'')',
'               || ''-''',
'               || TO_CHAR (soq_rqrd_date, ''YY'')',
'                  mon_sch,',
'               DECODE (soh_vou_type,',
'                       ''SO'', ''Standard'',',
'                       ''FS'', ''Free Sample'',',
'                       ''FE'', ''Free Replacement'',',
'                       ''DE'', ''Demo/Exhibition'',',
'                       ''ST'', ''Stock Transfer - Internal'',',
'                       ''SE'', ''Stock Transfer - External'',',
'                       ''SV'', ''Service Order'',',
'                       ''LI'', ''Labor Order (Internal - Entity)'',',
'                       ''LE'', ''Labor Order (Internal - Unit)'',',
'                       ''RB'', ''LO (Internal Rework - Entity)'',',
'                       ''RP'', ''LO (Internal Rework - Unit)'',',
'                       ''LO'', ''Labor Order (External - W / S)'',',
'                       ''LW'', ''Labor Order (External - WO / S)'',',
'                       ''ER'', ''LO (External Rework)'',',
'                       ''PJ'', ''Project'')',
'                  ord_type,',
'               DECODE (soh_vou_type,',
'                       ''SO'', ''Standard'',',
'                       ''FS'', ''Free Sample'',',
'                       ''FE'', ''Free Replacement'',',
'                       ''DE'', ''Demo/Exhibition'',',
'                       ''ST'', ''Stock Transfer - Internal'',',
'                       ''SE'', ''Stock Transfer - External'',',
'                       ''SV'', ''Service Order'',',
'                       ''LI'', ''Labor Order'',',
'                       ''LE'', ''Labor Order'',',
'                       ''RB'', ''Labor Order'',',
'                       ''RP'', ''Labor Order'',',
'                       ''LO'', ''Labor Order'',',
'                       ''LW'', ''Labor Order'',',
'                       ''PJ'', ''Project'')',
'                  ord_rpt_type,',
'               soh_plant unit,',
'               (SELECT bup_name1',
'                  FROM bus_unit_plants',
'                 WHERE bup_bu = soh_bu AND bup_plant_id = soh_plant)',
'                  unit_name,',
'               soh_order_pfx || ''/'' || soh_order_no orderno,',
'               soq_seq_no line,',
'               soh_cust_po_no,',
'               soh_order_date,',
'               fp_short_desc,',
'               soh_ord_year fp_year,',
'               soh_ord_period fp_period,',
'               soh_cust_id cust_id,',
'               (SELECT suplr_name1',
'                  FROM suppliers',
'                 WHERE suplr_bu = soh_bu AND suplr_suplr_id = soh_cust_id)',
'                  customer,',
'               soq_prod_id,',
'               soq_prod_desc1 item,',
'               soq_prod_rev,',
'               soh_currency currency,',
'               soh_exchange_rate ex_rate,',
'               (soq_qty_ordered - soq_cs_qty) orderqty,',
'               (soq_cs_qty) cs_qty,',
'               (soq_qty_invoiced) sol_qty_invoiced,',
'               ( (soq_qty_ordered',
'                  - (soq_qty_invoiced + soq_in_process_qty + soq_cs_qty)))',
'                  balance,',
'               soq_uom uom,',
'               soq_price unit_cost,',
'               NVL (soq_disc_pct, 0) disc_pct,',
'               (SELECT sa_area_desc1',
'                  FROM sales_areas',
'                 WHERE sa_bu = soh_bu AND sa_area = soh_sales_area)',
'                  area,',
'               (SELECT sat_terr_desc1',
'                  FROM sales_area_terr',
'                 WHERE sat_bu = soh_bu AND sat_terr_id = soh_terr_id)',
'                  territory,',
'               (SELECT sst_desc1',
'                  FROM sales_sub_terr',
'                 WHERE sst_bu = soh_bu AND sst_sub_terr_id = soh_sub_terr_id)',
'                  sub_territory,',
'               (SELECT sp_person_name1',
'                  FROM sales_persons',
'                 WHERE sp_bu = soh_bu AND sp_person = soh_sales_person)',
'                  sales_person,',
'               soq_cust_prod_id cust_prod,',
'               soq_cust_prod_desc cust_desc,',
'               soq_prod_grp_desc grp,',
'               soq_prod_subgrp_desc sub_grp,',
'               soq_prod_cls_desc cls,',
'               soq_prod_subcls_desc sub_cls,',
'               (SELECT DISTINCT supgrp_desc1',
'                  FROM supplier_groups, suppliers',
'                 WHERE     supgrp_bu = soh_bu',
'                       AND supgrp_group_id = suplr_group_id',
'                       AND supgrp_bu = suplr_bu',
'                       AND suplr_bu = soh_bu',
'                       AND suplr_suplr_id = soh_cust_id)',
'                  cust_grp,',
'               (SELECT DISTINCT supsubgroup_desc1',
'                  FROM supplier_subgroup, suppliers',
'                 WHERE     supsubgroup_bu = soh_bu',
'                       AND supsubgroup_type_id = suplr_subgroup',
'                       AND supsubgroup_bu = suplr_bu',
'                       AND suplr_bu = soh_bu',
'                       AND suplr_suplr_id = soh_cust_id)',
'                  cust_sub_grp,',
'               DECODE (soq_status, ''A'', ''Approved'') status,',
'               DECODE (soq_status,  ''N'', ''blue'',  ''A'', ''green'') color,',
'               soq_hsn_code,',
'               CASE',
'                  WHEN soh_gst_reg_type = ''R'' THEN ''Registered''',
'                  WHEN soh_gst_reg_type = ''U'' THEN ''Unregistered''',
'                  WHEN soh_gst_reg_type = ''C'' THEN ''Composition''',
'                  WHEN soh_gst_reg_type = ''S'' THEN ''Casual Person''',
'                  WHEN soh_gst_reg_type = ''N'' THEN ''Non - Resident''',
'                  ELSE soh_gst_reg_type',
'               END',
'                  gst_reg_type,',
'               CASE',
'                  WHEN soh_gst_cust_type = ''L'' THEN ''Local''',
'                  WHEN soh_gst_cust_type = ''I'' THEN ''Inter-State''',
'                  WHEN soh_gst_cust_type = ''U'' THEN ''Union Territory''',
'                  WHEN soh_gst_cust_type = ''M'' THEN ''Import''',
'                  WHEN soh_gst_cust_type = ''S'' THEN ''SEZ-Unit''',
'                  WHEN soh_gst_cust_type = ''D'' THEN ''SEZ-Developer''',
'                  ELSE soh_gst_cust_type',
'               END',
'                  gst_classification,',
'               CASE',
'                  WHEN soh_gst_e_oe_type = ''E'' THEN ''E-Commerce''',
'                  WHEN soh_gst_e_oe_type = ''OE'' THEN ''Other than E-Commerce''',
'               END',
'                  e_commerce_type,',
'               CASE',
'                  WHEN soh_gst_w_wo_pay_flag = ''Y'' THEN ''Yes''',
'                  WHEN soh_gst_w_wo_pay_flag = ''N'' THEN ''No''',
'               END',
'                  with_without_pay,',
'               CASE',
'                  WHEN soq_gst_input_type = ''I'' THEN ''Inputs''',
'                  WHEN soq_gst_input_type = ''C'' THEN ''Capital Goods''',
'                  WHEN soq_gst_input_type = ''S'' THEN ''Input Services''',
'                  WHEN soq_gst_input_type = ''N'' THEN ''Ineligible''',
'                  WHEN soq_gst_input_type = ''A'' THEN ''NA''',
'                  ELSE soq_gst_input_type',
'               END',
'                  input_type,',
'               CASE',
'                  WHEN soq_gst_exempt_flag = ''G'' THEN ''GST Supply''',
'                  WHEN soq_gst_exempt_flag = ''R'' THEN ''NIL Rated''',
'                  WHEN soq_gst_exempt_flag = ''Y'' THEN ''Exempted''',
'                  WHEN soq_gst_exempt_flag = ''N'' THEN ''Non-GST Supply''',
'                  WHEN soq_gst_exempt_flag = ''A'' THEN ''NA''',
'                  ELSE soq_gst_exempt_flag',
'               END',
'                  gst_supply_type,',
'               soh_cust_po_date soq_cust_po_date,',
'               soq_opo_po_no,',
'               soq_opo_po_date,',
'               NULL project,',
'               (soq_gross_amt * soh_exchange_rate) gross_amt,',
'               (soq_gross_amt) cust_gross_amt,',
'               (soq_tot_disc_amt * soh_exchange_rate) disc_amt,',
'               (soq_tot_disc_amt) cust_disc_amt,',
'               (soq_net_amt * soh_exchange_rate) net_amt,',
'               (soq_net_amt) cust_net_amt,',
'               (soq_tax_amt * soh_exchange_rate) tax_amt,',
'               (soq_tax_amt) cust_tax_amt,',
'               soq_spl_disc_pct spl_disc,',
'               soq_spl_disc_amt spl_amt,',
'               soq_cash_disc_pct cash_disc,',
'               soq_cash_disc_amt cash_amt,',
'               soq_tax_pct tax_pct,',
'               soq_igst_amt igst_amt,',
'               soq_cgst_amt cgst_amt,',
'               soq_sgst_amt sgst_amt',
'          FROM sales_order_hd,',
'               sales_order_qtys,',
'               fin_periods',
'         WHERE     soh_bu = soq_bu',
'               AND soh_order_no = soq_order_no',
'               AND soh_bu = :global_bu',
'               AND soh_vou_type IN',
'                      (SELECT acm_ord_type',
'                         FROM appl_control_mis',
'                        WHERE acm_type = ''SO'' AND acm_dflt_flag = ''Y'')',
'               AND TRUNC (soh_order_date) BETWEEN fp_from_date',
'                                              AND fp_end_date',
'               AND fp_bu = soh_bu',
'               AND fp_year = soh_ord_year',
'               AND fp_period = soh_ord_period',
'               AND TRUNC (soh_order_date) BETWEEN fp_from_date  AND fp_end_date',
'               -- AND soh_order_date between :P1915131043_DATE_FRM AND :P1915131043_DATE_TO',
'               -- AND ( (INSTR (:P1915131043_PLNT || '':'', soh_plant || '':'') > 0)) ',
'	            -- --AND (:P1915131043_dummy = 0 OR :P1915131043_dummy = 1))',
'        UNION ALL',
'        SELECT ''CS'' sou_type,',
'               fp_short_desc || ''-'' || TO_CHAR (cos_rqrd_date, ''YY'') mon_sch,',
'               func_find_per_qtr_desc (',
'                  cohd_bu,',
'                  func_find_period (cohd_bu, cos_rqrd_date),',
'                  ''S'')',
'               || ''-''',
'               || TO_CHAR (cos_rqrd_date, ''YY'')',
'                  mon_sch,',
'               DECODE (coln_type,',
'                       ''SO'', ''Standard'',',
'                       ''ST'', ''Stock Transfer'',',
'                       ''LO'', ''Labor Order'')',
'                  ord_type,',
'               DECODE (coln_type,',
'                       ''SO'', ''Standard'',',
'                       ''ST'', ''Stock Transfer'',',
'                       ''LO'', ''Labor Order'')',
'                  ord_rpt_type,',
'               cohd_plnt unit,',
'               (SELECT bup_name1',
'                  FROM bus_unit_plants',
'                 WHERE bup_bu = cohd_bu AND bup_plant_id = cohd_plnt)',
'                  unit_name,',
'               coln_doc_no || ''-'' || coln_doc_rev || ''-'' || cos_ln_seq_no',
'                  orderno,',
'               cos_ln_seq_no line,',
'               coln_cust_po_no,',
'               cos_rqrd_date,',
'               fp_short_desc,',
'               fp_year,',
'               fp_period,',
'               coln_cust_id cust_id,',
'               (SELECT suplr_name1',
'                  FROM suppliers',
'                 WHERE suplr_bu = cohd_bu AND suplr_suplr_id = coln_cust_id)',
'                  customer,',
'               coln_prod_id,',
'               (SELECT prod_desc11',
'                  FROM products',
'                 WHERE     prod_bu = coln_bu',
'                       AND prod_id = coln_prod_id',
'                       AND prod_rev = coln_prod_rev)',
'                  item,',
'               coln_prod_rev,',
'               coln_currency currency,',
'               cohd_exchange_rate ex_rate,',
'               (cos_schd_qty - cos_cs_qty) orderqty,',
'               (cos_cs_qty) cs_qty,',
'               (cos_shipped_qty) sol_qty_invoiced,',
'               0 balance,',
'               coln_sale_uom uom,',
'               coln_price unit_cost,',
'               NVL (coln_disc_pct, 0) disc_pct,',
'               (SELECT sa_area_desc1',
'                  FROM sales_areas',
'                 WHERE sa_bu = cohd_bu AND sa_area = coln_sales_area)',
'                  area,',
'               (SELECT sat_terr_desc1',
'                  FROM sales_area_terr',
'                 WHERE sat_bu = cohd_bu AND sat_terr_id = coln_sal_teri_id)',
'                  territory,',
'               (SELECT sst_desc1',
'                  FROM sales_sub_terr',
'                 WHERE sst_bu = cohd_bu',
'                       AND sst_sub_terr_id = coln_sub_terr_id)',
'                  sub_territory,',
'               (SELECT sp_person_name1',
'                  FROM sales_persons',
'                 WHERE sp_bu = cohd_bu AND sp_person = coln_sales_person)',
'                  sales_person,',
'               coln_cust_prod_id cust_prod,',
'               (SELECT DISTINCT custp_cust_prod_desc',
'                  FROM cust_prod',
'                 WHERE     custp_bu = cohd_bu',
'                       AND custp_cust_id = cohd_cust_id',
'                       AND custp_prod_id = coln_prod_id',
'                       AND custp_prod_rev = coln_prod_rev',
'                       AND custp_cust_prod_id = coln_cust_prod_id)',
'                  cust_prod_desc,',
'               coln_prod_grp_desc grp,',
'               coln_prod_subgrp_desc sub_grp,',
'               coln_prod_cls_desc cls,',
'               coln_prod_subcls_desc sub_cls,',
'               (SELECT DISTINCT supgrp_desc1',
'                  FROM supplier_groups, suppliers',
'                 WHERE     supgrp_bu = cohd_bu',
'                       AND supgrp_group_id = suplr_group_id',
'                       AND supgrp_bu = suplr_bu',
'                       AND suplr_bu = cohd_bu',
'                       AND suplr_suplr_id = cohd_cust_id)',
'                  cust_sub_grp,',
'               (SELECT DISTINCT supsubgroup_desc1',
'                  FROM supplier_subgroup, suppliers',
'                 WHERE     supsubgroup_bu = cohd_bu',
'                       AND supsubgroup_type_id = suplr_subgroup',
'                       AND supsubgroup_bu = suplr_bu',
'                       AND suplr_bu = cohd_bu',
'                       AND suplr_suplr_id = cohd_cust_id)',
'                  cust_grp,',
'               DECODE (cohd_status,  ''A'', ''Approved'',  ''L'', ''Closed'') status,',
'               DECODE (cohd_status,',
'                       ''N'', ''blue'',',
'                       ''L'', ''cornflowerblue'',',
'                       ''A'', ''green'')',
'                  color,',
'               coln_hsn_code soq_hsn_code,',
'               CASE',
'                  WHEN coln_gst_reg_type = ''R'' THEN ''Registered''',
'                  WHEN coln_gst_reg_type = ''U'' THEN ''Unregistered''',
'                  WHEN coln_gst_reg_type = ''C'' THEN ''Composition''',
'                  WHEN coln_gst_reg_type = ''S'' THEN ''Casual Person''',
'                  WHEN coln_gst_reg_type = ''N'' THEN ''Non - Resident''',
'                  ELSE coln_gst_reg_type',
'               END',
'                  gst_reg_type,',
'               CASE',
'                  WHEN coln_gst_cust_type = ''L'' THEN ''Local''',
'                  WHEN coln_gst_cust_type = ''I'' THEN ''Inter-State''',
'                  WHEN coln_gst_cust_type = ''U'' THEN ''Union Territory''',
'                  WHEN coln_gst_cust_type = ''M'' THEN ''Import''',
'                  WHEN coln_gst_cust_type = ''S'' THEN ''SEZ-Unit''',
'                  WHEN coln_gst_cust_type = ''D'' THEN ''SEZ-Developer''',
'                  ELSE coln_gst_cust_type',
'               END',
'                  gst_classification,',
'               CASE',
'                  WHEN coln_gst_e_oe_type = ''E'' THEN ''E-Commerce''',
'                  WHEN coln_gst_e_oe_type = ''OE'' THEN ''Other than E-Commerce''',
'               END',
'                  e_commerce_type,',
'               CASE',
'                  WHEN coln_gst_w_wo_pay_flag = ''Y'' THEN ''Yes''',
'                  WHEN coln_gst_w_wo_pay_flag = ''N'' THEN ''No''',
'               END',
'                  with_without_pay,',
'               CASE',
'                  WHEN coln_gst_input_type = ''I'' THEN ''Inputs''',
'                  WHEN coln_gst_input_type = ''C'' THEN ''Capital Goods''',
'                  WHEN coln_gst_input_type = ''S'' THEN ''Input Services''',
'                  WHEN coln_gst_input_type = ''N'' THEN ''Ineligible''',
'                  WHEN coln_gst_input_type = ''A'' THEN ''NA''',
'                  ELSE coln_gst_input_type',
'               END',
'                  input_type,',
'               CASE',
'                  WHEN coln_gst_exempt_flag = ''G'' THEN ''GST Supply''',
'                  WHEN coln_gst_exempt_flag = ''R'' THEN ''NIL Rated''',
'                  WHEN coln_gst_exempt_flag = ''Y'' THEN ''Exempted''',
'                  WHEN coln_gst_exempt_flag = ''N'' THEN ''Non-GST Supply''',
'                  WHEN coln_gst_exempt_flag = ''A'' THEN ''NA''',
'                  ELSE coln_gst_exempt_flag',
'               END',
'                  gst_supply_type,',
'               coln_cust_po_date soq_cust_po_date,',
'               coln_po_no soq_opo_po_no,',
'               coln_po_date soq_opo_po_date,',
'               NULL project,',
'               (cos_gross_amt * coln_exchange_rate) gross_amt,',
'               (cos_gross_amt) cust_gross_amt,',
'               0 disc_amt,',
'               0 cust_disc_amt,',
'               (cos_net_amt * coln_exchange_rate) net_amt,',
'               (cos_net_amt) cust_net_amt,',
'               (cos_tax_amt * coln_exchange_rate) tax_amt,',
'               (cos_tax_amt) cust_tax_amt,',
'               0 spl_disc,',
'               0 spl_amt,',
'               0 cash_disc,',
'               0 cash_amt,',
'               coln_tax_pct tax_pct,',
'               coln_igst_amt igst_amt,',
'               coln_cgst_amt cgst_amt,',
'               coln_sgst_amt sgst_amt',
'          FROM cust_order_hd,',
'               cust_order_ln,',
'               cust_order_schd,',
'               fin_periods',
'         WHERE     cohd_bu = coln_bu',
'               AND cohd_plnt = coln_plnt',
'               AND cohd_batch_no = coln_batch_no',
'               AND cos_bu = coln_bu',
'               AND cos_plnt = coln_plnt',
'               AND cos_doc_no = coln_doc_no',
'               AND cos_doc_rev = coln_doc_rev',
'               AND cohd_bu = :global_bu',
'               AND cohd_bu = fp_bu',
'               AND TRUNC (cos_rqrd_date) BETWEEN fp_from_date AND fp_end_date',
'               AND (cos_schd_qty - cos_cs_qty) > 0)',
'               -- AND (INSTR (:P1915131043_PLNT || '':'', cohd_plnt || '':'') > 0)',
'               -- AND (cos_rqrd_date BETWEEN :P1915131043_DATE_FRM AND :P1915131043_DATE_TO))',
'',
'           '))
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
 p_id=>wwv_flow_imp.id(5538935890883460141)
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
,p_internal_uid=>56974055339849113
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849877515287535)
,p_db_column_name=>'AREA'
,p_display_order=>440
,p_column_identifier=>'AL'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538938190133460164)
,p_db_column_name=>'Bal. Qty'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Bal. Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852360209287560)
,p_db_column_name=>'CASH_AMT'
,p_display_order=>690
,p_column_identifier=>'BJ'
,p_column_label=>'Cash Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852267122287559)
,p_db_column_name=>'CASH_DISC'
,p_display_order=>680
,p_column_identifier=>'BI'
,p_column_label=>'Cash Disc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852668449287563)
,p_db_column_name=>'CGST_AMT'
,p_display_order=>720
,p_column_identifier=>'BM'
,p_column_label=>'Cgst Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850631494287542)
,p_db_column_name=>'CLS'
,p_display_order=>510
,p_column_identifier=>'AR'
,p_column_label=>'Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851097972287547)
,p_db_column_name=>'COLOR'
,p_display_order=>560
,p_column_identifier=>'AW'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851603605287552)
,p_db_column_name=>'CUST_DISC_AMT'
,p_display_order=>610
,p_column_identifier=>'BB'
,p_column_label=>'Cust Disc Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851378708287550)
,p_db_column_name=>'CUST_GROSS_AMT'
,p_display_order=>590
,p_column_identifier=>'AZ'
,p_column_label=>'Cust Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850745717287544)
,p_db_column_name=>'CUST_GRP'
,p_display_order=>530
,p_column_identifier=>'AT'
,p_column_label=>'Cust Grp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851795319287554)
,p_db_column_name=>'CUST_NET_AMT'
,p_display_order=>630
,p_column_identifier=>'BD'
,p_column_label=>'Cust Net Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850917424287545)
,p_db_column_name=>'CUST_SUB_GRP'
,p_display_order=>540
,p_column_identifier=>'AU'
,p_column_label=>'Cust Sub Grp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851992824287556)
,p_db_column_name=>'CUST_TAX_AMT'
,p_display_order=>650
,p_column_identifier=>'BF'
,p_column_label=>'Cust Tax Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937654457460159)
,p_db_column_name=>'Currency'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Currency'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849304919287529)
,p_db_column_name=>'Cust. Item'
,p_display_order=>380
,p_column_identifier=>'AF'
,p_column_label=>'Cust. Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849393705287530)
,p_db_column_name=>'Cust. Item Desc.'
,p_display_order=>390
,p_column_identifier=>'AG'
,p_column_label=>'Cust. Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937087685460153)
,p_db_column_name=>'Cust. Name'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936935867460152)
,p_db_column_name=>'Cust.ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851516955287551)
,p_db_column_name=>'DISC_AMT'
,p_display_order=>600
,p_column_identifier=>'BA'
,p_column_label=>'Disc Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538938391919460166)
,p_db_column_name=>'Disc Pct.'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Disc Pct.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939270275460175)
,p_db_column_name=>'E_COMMERCE_TYPE'
,p_display_order=>340
,p_column_identifier=>'AB'
,p_column_label=>'E Commerce Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937749466460160)
,p_db_column_name=>'Ex. Rate'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851288900287549)
,p_db_column_name=>'GROSS_AMT'
,p_display_order=>580
,p_column_identifier=>'AY'
,p_column_label=>'Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850372200287540)
,p_db_column_name=>'GRP'
,p_display_order=>490
,p_column_identifier=>'AP'
,p_column_label=>'Grp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939210967460174)
,p_db_column_name=>'GST_CLASSIFICATION'
,p_display_order=>330
,p_column_identifier=>'AA'
,p_column_label=>'Gst Classification'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939128712460173)
,p_db_column_name=>'GST_REG_TYPE'
,p_display_order=>320
,p_column_identifier=>'Z'
,p_column_label=>'Gst Reg Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939612649460178)
,p_db_column_name=>'GST_SUPPLY_TYPE'
,p_display_order=>370
,p_column_identifier=>'AE'
,p_column_label=>'Gst Supply Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937861534460161)
,p_db_column_name=>'HSN Code'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Hsn Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852590369287562)
,p_db_column_name=>'IGST_AMT'
,p_display_order=>710
,p_column_identifier=>'BL'
,p_column_label=>'Igst Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939455165460177)
,p_db_column_name=>'INPUT_TYPE'
,p_display_order=>360
,p_column_identifier=>'AD'
,p_column_label=>'Input Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937197586460154)
,p_db_column_name=>'Item'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937338367460156)
,p_db_column_name=>'Item Desc.'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937472573460157)
,p_db_column_name=>'LINE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936143685460144)
,p_db_column_name=>'Month (Ord.)'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Month (ord.)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936289939460145)
,p_db_column_name=>'Month (Sch.)'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Month (sch.)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851662287287553)
,p_db_column_name=>'NET_AMT'
,p_display_order=>620
,p_column_identifier=>'BC'
,p_column_label=>'Net Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936659804460149)
,p_db_column_name=>'ORD_RPT_TYPE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ord Rpt Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936889332460151)
,p_db_column_name=>'Ord. Date'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ord. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936632253460148)
,p_db_column_name=>'Ord. Type'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ord. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936736128460150)
,p_db_column_name=>'Order Pfx. / No.'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Order Pfx. &#x2F; No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538938026419460162)
,p_db_column_name=>'Ordered Qty.'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Ordered Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851210948287548)
,p_db_column_name=>'PROJECT'
,p_display_order=>570
,p_column_identifier=>'AX'
,p_column_label=>'Project'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538938303005460165)
,p_db_column_name=>'Price'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936510567460147)
,p_db_column_name=>'RPT_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Rpt Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937265066460155)
,p_db_column_name=>'Rev.'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850269845287539)
,p_db_column_name=>'SALES_PERSON'
,p_display_order=>480
,p_column_identifier=>'AO'
,p_column_label=>'Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852763028287564)
,p_db_column_name=>'SGST_AMT'
,p_display_order=>730
,p_column_identifier=>'BN'
,p_column_label=>'Sgst Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849522862287531)
,p_db_column_name=>'SOH_CUST_PO_NO'
,p_display_order=>400
,p_column_identifier=>'AH'
,p_column_label=>'Soh Cust Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538938044606460163)
,p_db_column_name=>'SOL_QTY_INVOICED'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Invoiced Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849631014287532)
,p_db_column_name=>'SOQ_CUST_PO_DATE'
,p_display_order=>410
,p_column_identifier=>'AI'
,p_column_label=>'Soq Cust Po Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849786448287534)
,p_db_column_name=>'SOQ_OPO_PO_DATE'
,p_display_order=>430
,p_column_identifier=>'AK'
,p_column_label=>'Soq Opo Po Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849680420287533)
,p_db_column_name=>'SOQ_OPO_PO_NO'
,p_display_order=>420
,p_column_identifier=>'AJ'
,p_column_label=>'Soq Opo Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852208546287558)
,p_db_column_name=>'SPL_AMT'
,p_display_order=>670
,p_column_identifier=>'BH'
,p_column_label=>'Spl Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852063727287557)
,p_db_column_name=>'SPL_DISC'
,p_display_order=>660
,p_column_identifier=>'BG'
,p_column_label=>'Spl Disc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851016986287546)
,p_db_column_name=>'STATUS'
,p_display_order=>550
,p_column_identifier=>'AV'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850643485287543)
,p_db_column_name=>'SUB_CLS'
,p_display_order=>520
,p_column_identifier=>'AS'
,p_column_label=>'Sub Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850525153287541)
,p_db_column_name=>'SUB_GRP'
,p_display_order=>500
,p_column_identifier=>'AQ'
,p_column_label=>'Sub Grp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544850132160287537)
,p_db_column_name=>'SUB_TERRITORY'
,p_display_order=>460
,p_column_identifier=>'AN'
,p_column_label=>'Sub Territory'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544851909448287555)
,p_db_column_name=>'TAX_AMT'
,p_display_order=>640
,p_column_identifier=>'BE'
,p_column_label=>'Tax Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544852517847287561)
,p_db_column_name=>'TAX_PCT'
,p_display_order=>700
,p_column_identifier=>'BK'
,p_column_label=>'Tax Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5544849980373287536)
,p_db_column_name=>'TERRITORY'
,p_display_order=>450
,p_column_identifier=>'AM'
,p_column_label=>'Territory'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936403593460146)
,p_db_column_name=>'Type'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538935982531460142)
,p_db_column_name=>'UNIT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538936112528460143)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538937559584460158)
,p_db_column_name=>'UOM'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5538939343274460176)
,p_db_column_name=>'WITH_WITHOUT_PAY'
,p_display_order=>350
,p_column_identifier=>'AC'
,p_column_label=>'With Without Pay'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5544998461054401409)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'630367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'UNIT:Month (Ord.):Month (Sch.):Type:RPT_TYPE:Ord. Type:ORD_RPT_TYPE:Order Pfx. / No.:Ord. Date:Cust.ID:Cust. Name:Item:Rev.:Item Desc.:LINE:UOM:Currency:Ex. Rate:HSN Code:Ordered Qty.:SOL_QTY_INVOICED:Bal. Qty:Price:Disc Pct.:GST_REG_TYPE:GST_CLASSIF'
||'ICATION:E_COMMERCE_TYPE:WITH_WITHOUT_PAY:INPUT_TYPE:GST_SUPPLY_TYPE:Cust. Item:Cust. Item Desc.:SOH_CUST_PO_NO:SOQ_CUST_PO_DATE:SOQ_OPO_PO_NO:SOQ_OPO_PO_DATE:AREA:TERRITORY:SUB_TERRITORY:SALES_PERSON:GRP:SUB_GRP:CLS:SUB_CLS:CUST_GRP:CUST_SUB_GRP:STAT'
||'US:COLOR:PROJECT:GROSS_AMT:CUST_GROSS_AMT:DISC_AMT:CUST_DISC_AMT:NET_AMT:CUST_NET_AMT:TAX_AMT:CUST_TAX_AMT:SPL_DISC:SPL_AMT:CASH_DISC:CASH_AMT:TAX_PCT:IGST_AMT:CGST_AMT:SGST_AMT'
);
wwv_flow_imp.component_end;
end;
/
