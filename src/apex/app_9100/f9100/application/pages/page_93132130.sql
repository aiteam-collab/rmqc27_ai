prompt --application/pages/page_93132130
begin
--   Manifest
--     PAGE: 93132130
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
 p_id=>93132130
,p_name=>'Stocks'
,p_alias=>'ICM2130'
,p_step_title=>'Stocks'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(11124860992494317917)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #dcc793;',
'}',
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'    padding: 12px;',
'    background: #dcc793;',
'    display: block;',
'    color: black;',
'    text-align: inherit;',
'}',
'.a-IRR-header {',
'    background-color: #8BC34A;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'    color: rgba(0, 0, 0, 0.95);',
'}',
'.t-HeroRegion-title {',
'    font-size: 1.3rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'}',
'',
'.t-HeroRegion {',
'    position: relative;',
'    overflow: hidden;',
'    /* display: block; */',
'    border: 1px solid rgba(0,0,0,.1);',
'    /* box-shadow: 0 2px 4px -2px rgba(0,0,0,.075); */',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    border-color: transparent;',
'    background-color: transparent;',
'    text-align: end;',
'    padding-left: 30px;',
'}',
'',
'.apex-item-textarea:focus, .apex-item-text:focus, .apex-item-select:focus, .apex-item-multi:focus, select.listmanager:focus {',
'    background: transparent;',
'    border-color: #0076df !important;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    border-color: transparent;',
'    background-color: transparent;',
'    text-align: end;',
'    padding-left: 30px;',
'    color: var(--oj-color-required);',
'}',
'',
'.a-IRR-header {',
'    background-color: #dcc793;',
'    vertical-align: inherit;',
'    padding: 1px;',
'    color: #404040;',
'    font-weight: 700;',
'    border-bottom: 1px solid #e0e0e0;',
'}',
'',
'.a-IRR-header:hover {',
'    background-color: #dcc793;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11155924830977973179)
,p_plug_name=>'SFG - Stock Cost'
,p_static_id=>'sfg-stock-cost'
,p_region_name=>'STSFS_COST'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11155923570599973166)
,p_plug_name=>'Stock Cost'
,p_static_id=>'stock-cost'
,p_region_name=>'STCOST'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11155923209022973162)
,p_name=>'Stock Costs  - Inline'
,p_static_id=>'stock-costs-inline'
,p_parent_plug_id=>wwv_flow_imp.id(11155923570599973166)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT func_find_store_desc (stcost_bu, stcost_store_id, 1) "WareHouse",',
'       stcost_cost "Cost",',
'       DECODE (stcost_upd_source,',
'               ''GI'', ''Goods Inward'',',
'               ''IC'', ''Inventory Count'',',
'               ''M'', ''Manual'',',
'               ''MI'', ''Material Issue'',',
'               ''MR'', ''Material Receipt'',',
'               ''SFR'', ''Scrap/Standard Receipt'',',
'               ''ME'', ''Material Return'',',
'               ''MT'', ''Material Transfer'',',
'               ''GRN'', ''Purchase Receipt'',',
'               ''SR'', ''Sales Return'',',
'               ''SA'', ''Stock Adjustment'',',
'               ''SRN'', ''Sub Contract Receipt'',',
'               ''MW'', ''WIP'',',
'               ''RR'', ''Rework Receipt'',',
'               ''QC'', ''Quality'',',
'               ''FRM'', ''Shop Floor Receipt(Multi)'',',
'               ''CMR'', ''CMR'',',
'               ''SEG'', ''Segregation'',',
'               ''DMMC'', ''Dismantle Mat. Cons.'',',
'               ''STMC'', ''Smelting Mat. Cons.'',',
'               ''RRMC'', ''Refining Removal Mat. Cons.'',',
'               ''RAMC'', ''Refining Add. Mat. Cons.'',',
'               ''CFR'', ''Centre Fuge Receipt'',',
'               ''RER'', ''Reactor Receipt'',',
'               ''UTR'', ''Uturf Receipt'',',
'               ''DRR'', ''Dryer Receipt'',',
'               ''CPR'', ''Chemical Packing Receipt'',',
'               ''MMR'', ''Magic Mud Receipt'',',
'               ''DE'', ''Demo/Exhn.'',',
'               ''EGRN'', ''Egg Purchase Receipt'',',
'               ''ESIVR'', ''Egg Sales Return'',',
'               ''ESR'', ''Employee Spare Replacement'',',
'               ''DMC'', ''DMC'',',
'               ''DMCC'', ''DMCC'',',
'               ''DMT'', ''DMT'',',
'               ''DMR'', ''DMR'',',
'               ''DCC'', ''DCC'',',
'               ''DCT'', ''DCT'',',
'               ''DCR'', ''DCR'',',
'               ''DSA'', ''DSA'',',
'               ''DCMC'', ''DCMC'',',
'               ''DCMR'', ''DCMR'',',
'               ''SO'', ''Bundle/Pallet'')',
'          "Source"',
'  FROM stock_costs',
'  WHERE stcost_bu=:GLOBAL_BU',
'   AND stcost_prod_id=:P93132130_ITEM',
'   AND stcost_prod_rev=:P93132130_ITEM_REV',
'   AND stcost_store_id=:P93132130_STORE_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P93132130_ITEM_REV,P93132130_ITEM,P93132130_STORE_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total '
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155923352839973164)
,p_query_column_id=>2
,p_column_alias=>'Cost'
,p_column_display_sequence=>2
,p_column_heading=>'Cost'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155923465787973165)
,p_query_column_id=>3
,p_column_alias=>'Source'
,p_column_display_sequence=>3
,p_column_heading=>'Source'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155923268296973163)
,p_query_column_id=>1
,p_column_alias=>'WareHouse'
,p_column_display_sequence=>1
,p_column_heading=>'Warehouse'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16150553608546406932)
,p_plug_name=>'Stocks'
,p_static_id=>'stocks'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(sv_mat_type,''S'',''STCOST'',''F'',''STSFS_COST'') sv_mat_type2,',
'            sv_mat_type sv_mat_type1,',
'            DECODE(sv_mat_type,''S'',''STD'',''F'',''SFG'') "Type",',
'            sv_store_id "WareHouse",',
'            sv_prod_id "Item",',
'            sv_prod_rev "Rev.",',
'            sv_prod_desc1 "Item Desc.",',
'            sv_prod_uom "UOM",',
'            sv_stk_qty "Stock",',
'            sv_pr_pend_qty "Pur. Request",',
'            sv_po_pend_qty "Pur. Order",',
'            sv_ssr_pend_qty "Suplr. Sch. Rqst",',
'            sv_sso_pend_qty "Suplr. Sch.",',
'            sv_ge_pend_qty "Gate Entry",',
'            sv_rcpt_pend_qty "GRN Entry",',
'            sv_rcpt_fin_qc_pend_qty "Mov. Fin. (QC not Comp.)",',
'            sv_rcpt_qc_comp_fin_pend_qty "QC Comp. (Fin. NP)",',
'            sv_rcpt_rdy_recv_pend_qty "GRN (R. Recv.)",',
'            sv_prod_ord_pend_qty "Prod. Order",',
'            sv_stk_transit_in_qty "In Transit",',
'            sv_tot_supply_qty "Total Supply",',
'            0 safety,',
'            sv_so_pend_qty "Sales Order",',
'            sv_cs_pend_qty "Cust. Sch.",',
'            sv_mat_req_qty "Mat. Req.",',
'            sv_tot_demand_qty "Total Demand",',
'            sv_mr_pend_qty "MR Pend.",',
'            sv_mat_alloc_qty "Mat. Alloc.",',
'            sv_so_pick_qty "SO Picked",',
'            sv_tot_req_qty "Total Req.",',
'            ''Other Details'' LOT_SERIAL,',
'            ''Stock Cost'' Stock_Cost,',
'             (SELECT bup_name1 ',
'               FROM bus_unit_plants',
'              WHERE bup_bu=sv_bu',
'                AND bup_plant_id=sv_plnt) "Unit",',
'             sv_store_desc "W/H",',
'             sv_prod_cls_desc "Class",',
'             sv_prod_subcls_desc "Sub Class",',
'             DECODE(sv_prod_abc_cls,''A'',''A Class'',''B'',''B Class'',''C'',''C Class'',''D'',''D Class'',''N'',''Unclassified'') "ABC Type",',
'             DECODE(sv_prod_cat_cls,''F'',''Fixed'',''V'',''Variable'') "Category",',
'             sv_sf_code,',
'             sv_plnt',
'  FROM stock_view',
' WHERE sv_bu = :global_bu',
'       AND (sv_prod_subcls_id IN',
'               (SELECT sva_sub_cls',
'                  FROM stock_view_access',
'                 WHERE sva_bu = :global_bu AND sva_user = :global_user',
'                       AND TRUNC (SYSDATE) BETWEEN TRUNC (sva_eff_from)',
'                                               AND TRUNC (sva_eff_to))',
'            OR EXISTS',
'                  (SELECT 1',
'                     FROM appl_users',
'                    WHERE     appluser_bu = :global_bu',
'                          AND appluser_id = :global_user',
'                          AND appluser_status = ''A''',
'                          AND TRUNC (SYSDATE) BETWEEN TRUNC (',
'                                                         appluser_eff_from)',
'                                                  AND TRUNC (appluser_eff_to)',
'                          AND appluser_sys_admin = ''N''',
'                          AND appluser_user_type = ''R''))',
'       AND sv_plnt IN',
'              (SELECT auba_plant',
'                 FROM appl_user_plant_access',
'                WHERE     auba_bu = :global_bu',
'                      AND auba_user_id = :global_user',
'                      AND TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Ledger'
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
 p_id=>wwv_flow_imp.id(16150553639528406933)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No data to display.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>10006711610121885672
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(11150794423842083100)
,p_name=>'<font color=#000000;>Demand Quantity</font>'
,p_static_id=>'font-color-000000-demand-quantity-font'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(11150794482079083101)
,p_name=>'<font color=#000000;>Required Quantity</font>'
,p_static_id=>'font-color-000000-required-quantity-font'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(11150793881359083095)
,p_name=>'<font color=#000000;>Supply Quantity</font>'
,p_static_id=>'font-color-000000-supply-quantity-font'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155926325129973193)
,p_db_column_name=>'ABC Type'
,p_display_order=>370
,p_column_identifier=>'AT'
,p_column_label=>'ABC Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155926347733973194)
,p_db_column_name=>'Category'
,p_display_order=>380
,p_column_identifier=>'AU'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155926125095973191)
,p_db_column_name=>'Class'
,p_display_order=>350
,p_column_identifier=>'AR'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793151184083088)
,p_db_column_name=>'Cust. Sch.'
,p_display_order=>220
,p_group_id=>wwv_flow_imp.id(11150794423842083100)
,p_column_identifier=>'AE'
,p_column_label=>'Cust. Sch.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:CS,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Cust. Sch.#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Cust. Sch.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792536123083082)
,p_db_column_name=>'GRN (R. Recv.)'
,p_display_order=>160
,p_column_identifier=>'Y'
,p_column_label=>'GRN (R. Recv.)'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GRTR,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#GRN (R. Recv.)#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792267725083079)
,p_db_column_name=>'GRN Entry'
,p_display_order=>130
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'V'
,p_column_label=>'GRN Entry'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GRN,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#GRN Entry#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'GRN Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792225741083078)
,p_db_column_name=>'Gate Entry'
,p_display_order=>120
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'U'
,p_column_label=>'Gate Entry'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GE,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Gate Entry#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Gate Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792741853083084)
,p_db_column_name=>'In Transit'
,p_display_order=>180
,p_column_identifier=>'AA'
,p_column_label=>'In Transit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791276447083069)
,p_db_column_name=>'Item'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791468854083071)
,p_db_column_name=>'Item Desc.'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150794703694083103)
,p_db_column_name=>'LOT_SERIAL'
,p_display_order=>300
,p_column_identifier=>'AM'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'<span>#LOT_SERIAL#</span>'
,p_column_link_attr=>'class="t-Button t-Button--hot t-Button--small t-Button--primary lto5006952729427561843_0"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793439026083091)
,p_db_column_name=>'MR Pend.'
,p_display_order=>250
,p_group_id=>wwv_flow_imp.id(11150794482079083101)
,p_column_identifier=>'AH'
,p_column_label=>'MR Pend.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MRP,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#MR Pend.#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'MR Pend.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793553945083092)
,p_db_column_name=>'Mat. Alloc.'
,p_display_order=>260
,p_group_id=>wwv_flow_imp.id(11150794482079083101)
,p_column_identifier=>'AI'
,p_column_label=>'Mat. Alloc.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MA,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Mat. Alloc.#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Mat. Alloc.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793324958083089)
,p_db_column_name=>'Mat. Req.'
,p_display_order=>230
,p_group_id=>wwv_flow_imp.id(11150794423842083100)
,p_column_identifier=>'AF'
,p_column_label=>'Mat. Req.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MR,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Mat. Req.#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Mat. Req.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792341689083080)
,p_db_column_name=>'Mov. Fin. (QC not Comp.)'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Mov.Fin.(QCNot Comp.)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792630252083083)
,p_db_column_name=>'Prod. Order'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'Prod. Order'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:PROD_ORDER,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Prod. Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791874051083075)
,p_db_column_name=>'Pur. Order'
,p_display_order=>90
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'R'
,p_column_label=>'Pur. Order'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_SV_SF_CODE,P9313213001_PLNT:#Item#,#Rev.#,#WareHouse#,PO,#SV_MAT_TYPE1#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Pur. Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Pur. Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791732978083074)
,p_db_column_name=>'Pur. Request'
,p_display_order=>80
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'Q'
,p_column_label=>'Pur. Request'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:PR,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Pur. Request#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Pur. Request'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792460346083081)
,p_db_column_name=>'QC Comp. (Fin. NP)'
,p_display_order=>150
,p_column_identifier=>'X'
,p_column_label=>'QC Comp.(Fin. NP)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791332809083070)
,p_db_column_name=>'Rev.'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150794548607083102)
,p_db_column_name=>'SAFETY'
,p_display_order=>290
,p_column_identifier=>'AL'
,p_column_label=>'Safety'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793638018083093)
,p_db_column_name=>'SO Picked'
,p_display_order=>270
,p_group_id=>wwv_flow_imp.id(11150794482079083101)
,p_column_identifier=>'AJ'
,p_column_label=>'SO Picked'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:SOP,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#SO Picked#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'SO Picked'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150794929329083105)
,p_db_column_name=>'STOCK_COST'
,p_display_order=>310
,p_column_identifier=>'AN'
,p_column_label=>'&nbsp;'
,p_column_link=>'javascript: $s(''P93132130_ITEM'',''#Item#''); $s(''P93132130_ITEM_REV'',''#Rev.#''); $s(''P93132130_STORE_ID'',''#WareHouse#''); $s(''P93132130_REQ'',''LOAD''); openModal(''#SV_MAT_TYPE2#'');'
,p_column_linktext=>'<span>#STOCK_COST#</span>'
,p_column_link_attr=>'class="t-Button t-Button--hot t-Button--small t-Button--warning lto5006952729427561843_0"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155924368445973174)
,p_db_column_name=>'SV_MAT_TYPE1'
,p_display_order=>320
,p_column_identifier=>'AO'
,p_column_label=>'Sv Mat Type1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11156016888590288211)
,p_db_column_name=>'SV_MAT_TYPE2'
,p_display_order=>390
,p_column_identifier=>'AV'
,p_column_label=>'Sv Mat Type2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11156244798982597898)
,p_db_column_name=>'SV_PLNT'
,p_display_order=>410
,p_column_identifier=>'AX'
,p_column_label=>'Sv Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11156172964793004262)
,p_db_column_name=>'SV_SF_CODE'
,p_display_order=>400
,p_column_identifier=>'AW'
,p_column_label=>'Sv Sf Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793038340083087)
,p_db_column_name=>'Sales Order'
,p_display_order=>210
,p_group_id=>wwv_flow_imp.id(11150794423842083100)
,p_column_identifier=>'AD'
,p_column_label=>'Sales Order'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:SO,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Sales Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Sales Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791645713083073)
,p_db_column_name=>'Stock'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155926220359973192)
,p_db_column_name=>'Sub Class'
,p_display_order=>360
,p_column_identifier=>'AS'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792033217083077)
,p_db_column_name=>'Suplr. Sch.'
,p_display_order=>110
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'T'
,p_column_label=>'Suplr. Sch.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM_REV,P9313213001_ITEM,P9313213001_STORE_ID,P9313213001_PLNT:SS,#SV_MAT_TYPE1#,#Rev.#,#Item#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Suplr. Sch.#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr. Sch.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791985231083076)
,p_db_column_name=>'Suplr. Sch. Rqst'
,p_display_order=>100
,p_group_id=>wwv_flow_imp.id(11150793881359083095)
,p_column_identifier=>'S'
,p_column_label=>'Suplr. Sch. Rqst'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM_REV,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_STORE_ID,P9313213001_PLNT:SSR,#Rev.#,#SV_MAT_TYPE1#,#Item#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Suplr. Sch. Rqst#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr. Sch. Rqst'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793380971083090)
,p_db_column_name=>'Total Demand'
,p_display_order=>240
,p_group_id=>wwv_flow_imp.id(11150794423842083100)
,p_column_identifier=>'AG'
,p_column_label=>'Total Demand'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Total Demand'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150793758443083094)
,p_db_column_name=>'Total Req.'
,p_display_order=>280
,p_group_id=>wwv_flow_imp.id(11150794482079083101)
,p_column_identifier=>'AK'
,p_column_label=>'Total Req.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Total Req.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150792900488083085)
,p_db_column_name=>'Total Supply'
,p_display_order=>190
,p_column_identifier=>'AB'
,p_column_label=>'Total Supply'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791119338083067)
,p_db_column_name=>'Type'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791616954083072)
,p_db_column_name=>'UOM'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155925900399973189)
,p_db_column_name=>'Unit'
,p_display_order=>330
,p_column_identifier=>'AP'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11155926003407973190)
,p_db_column_name=>'W/H'
,p_display_order=>340
,p_column_identifier=>'AQ'
,p_column_label=>'WareHouse'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11150791142315083068)
,p_db_column_name=>'WareHouse'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Warehouse'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16158764614077789120)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50080578'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'STOCK_COST:Type:WareHouse:Item:Rev.:Item Desc.:UOM:Stock:Pur. Request:Pur. Order:Suplr. Sch. Rqst:Suplr. Sch.:Gate Entry:GRN Entry:Mov. Fin. (QC not Comp.):QC Comp. (Fin. NP):GRN (R. Recv.):Prod. Order:In Transit:Total Supply:SAFETY:Sales Order:Cust.'
||' Sch.:Mat. Req.:Total Demand:MR Pend.:Mat. Alloc.:SO Picked:Total Req.:Unit:W/H:Class:Sub Class:ABC Type:Category:SV_MAT_TYPE2:SV_SF_CODE:SV_PLNT'
,p_sum_columns_on_break=>'Trans. Qty.:Trans. Value'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11155923633036973167)
,p_name=>'Store SF Stocks - Inline'
,p_static_id=>'store-sf-stocks-inline'
,p_parent_plug_id=>wwv_flow_imp.id(11155924830977973179)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT func_find_store_desc (stsfs_bu, stsfs_store_id, 1) "WareHouse",',
'       stsfs_ord_no "Prod. Ord. No.",',
'       stsfs_lot_no "Lot. No.",',
'       stsfs_serial_no "Serial No.",',
'       stsfs_unit_cost "Cost"    ',
'  FROM STORE_SF_STOCKS',
'  WHERE stsfs_bu=:GLOBAL_BU',
'   AND stsfs_prod_id=:P93132130_ITEM',
'   AND stsfs_prod_rev=:P93132130_ITEM_REV',
'   AND stsfs_store_id=:P93132130_STORE_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P93132130_ITEM,P93132130_ITEM_REV,P93132130_STORE_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data to display.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total '
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155923918653973169)
,p_query_column_id=>5
,p_column_alias=>'Cost'
,p_column_display_sequence=>5
,p_column_heading=>'Cost'
,p_column_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155924209805973172)
,p_query_column_id=>3
,p_column_alias=>'Lot. No.'
,p_column_display_sequence=>3
,p_column_heading=>'Lot. No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155924041538973171)
,p_query_column_id=>2
,p_column_alias=>'Prod. Ord. No.'
,p_column_display_sequence=>2
,p_column_heading=>'Prod. Ord. No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155924237082973173)
,p_query_column_id=>4
,p_column_alias=>'Serial No.'
,p_column_display_sequence=>4
,p_column_heading=>'Serial No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11155923749042973168)
,p_query_column_id=>1
,p_column_alias=>'WareHouse'
,p_column_display_sequence=>1
,p_column_heading=>'Warehouse'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11155925011830973180)
,p_name=>'P93132130_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16150553608546406932)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11155925175372973182)
,p_name=>'P93132130_ITEM_REV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16150553608546406932)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11155925765029973188)
,p_name=>'P93132130_REQ'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16150553608546406932)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11155925088087973181)
,p_name=>'P93132130_STORE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16150553608546406932)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11150794021464083096)
,p_name=>'IR_Grouping'
,p_static_id=>'ir-grouping'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11150794054931083097)
,p_event_id=>wwv_flow_imp.id(11150794021464083096)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11150794132659083098)
,p_name=>'IR_Grouping_Refresh'
,p_static_id=>'ir-grouping-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(16150553608546406932)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11150794283069083099)
,p_event_id=>wwv_flow_imp.id(11150794132659083098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11155924620828973176)
,p_name=>'Item_Submit'
,p_static_id=>'item-submit'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93132130_MAT_TYPE'
,p_condition_element=>'P93132130_MAT_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11155924662049973177)
,p_event_id=>wwv_flow_imp.id(11155924620828973176)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11155923209022973162)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11155924765885973178)
,p_event_id=>wwv_flow_imp.id(11155924620828973176)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11155923633036973167)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11155925284607973183)
,p_name=>'Refresh_Stock_Region'
,p_static_id=>'refresh-stock-region'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93132130_REQ'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11155925469463973185)
,p_event_id=>wwv_flow_imp.id(11155925284607973183)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11155923209022973162)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11155925687745973187)
,p_event_id=>wwv_flow_imp.id(11155925284607973183)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11155923633036973167)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
