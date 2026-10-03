prompt --application/pages/page_931321300
begin
--   Manifest
--     PAGE: 931321300
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
 p_id=>931321300
,p_name=>'SO Stock/Project Rej.(Pentagon)'
,p_alias=>'SO-STOCK-PROJECT-REJ-PENTAGON'
,p_step_title=>'SO Stock/Project Rej.(Pentagon)'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (typeof $.apex.interactiveReport === "function") {',
'    // only extend when the IR code is present',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-header {',
'    background-color: #00b1e7  !important;',
'    vertical-align: inherit;',
'    padding: 1px;',
'    color: white;',
'    font-family: arial;',
'    font-weight: 700;',
'    border-top: 1px solid #e6e6e6;',
'   -- box-shadow: inset 0px 0 0 0 #e6e6e6;',
'}',
'.a-IRR-header:hover {',
'    background-color: steelblue !important;',
'}',
'#PR {',
'    background-color:#FF8040 !important;',
'}',
'',
'#Pur_Order {',
'    background:rgb(98, 141, 181) !important;',
'}',
'',
'#Suplr_Sch_Rqst {',
'    background:rgb(130, 101, 186) !important;',
'}',
'',
'#Suplr_Sch {',
'    background:rgb(191, 152, 133) !important;',
'}',
'',
'#Gate_Entry {',
'    background:rgb(219, 98, 37) !important;',
'}',
'',
'#GRN_Entry {',
'    background:#FF8040 !important;',
'}',
'',
'#Mov_Fin_QC_not_Comp {',
'    background:#056bbf !important;',
'}',
'',
'#SAFETY {',
'    background:#056bbf !important;',
'}',
'',
'#QC_Comp_Fin_NP {',
'    background:#056bbf !important;',
'}',
'',
'#GRN_R_Recv {',
'    background:#056bbf !important;',
'}',
'',
'#Prod_Order {',
'    background:#056bbf !important;',
'}',
'',
'#In_Transit {',
'    background:#056bbf !important;',
'}',
'',
'#Total_Supply {',
'    background:#056bbf !important;',
'}',
'',
'',
'',
'',
'#Total_Req {',
'    background:#309662 !important;',
'}',
'',
'#SO_Picked {',
'    background:#309662 !important;',
'}',
'',
'#Mat_Alloc {',
'    background:#309662 !important;',
'}',
'',
'#MR_Pend {',
'    background:#309662 !important;',
'}',
'',
'',
'#Sales_Order {',
'    background:#4083b9 !important;',
'}',
'',
'#Total_Demand {',
'    background:#4083b9 !important;',
'}',
'',
'#Cust_Sch {',
'    background:#4083b9 !important;',
'}',
'',
'#Mat_Req {',
'    background:#4083b9 !important;',
'}',
'',
'.a-IRR-table tr td {',
'    background-color: #ffffff;',
'    color: #262626;',
'    white-space: nowrap;',
'}',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: transparent !important;',
'    font-family: Arial !important;',
'    color: white !important;',
'}',
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
'#reset .a-IG-controlsContainer, .a-IRR-controlsContainer {',
'    padding-top: var(--a-report-controls-padding-y,-8px);',
'    padding-bottom: var(--a-report-controls-padding-y,-8px);',
'}',
'',
'#reset .a-MediaBlock, .a-RegionMedia {',
'    display: -ms-flexbox;',
'    display: none;',
'}',
'',
'#reset .a-IG-reportSummary-label, .a-IRR-reportSummary-label {',
'    display: -ms-flexbox;',
'    display: none;',
'    -ms-flex-align: center;',
'    align-items: center;',
'    text-decoration: none;',
'}',
'#reset .a-MediaBlock-graphic {',
'    float: left;',
'    display: none;',
'    margin-right: 8px;',
'}',
'  .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650464521724505296)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12390733720334378892)
,p_plug_name=>'CS Supply And Demand - SO/Prj Ref.'
,p_static_id=>'cs-supply-and-demand-so-prj-ref'
,p_region_name=>'reset'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ssv_bu,',
'       ssv_mat_type,',
'       DECODE (ssv_mat_type,  ''S'', ''STD'',  ''F'', ''SFG'') "Type",',
'       DECODE (ssv_mat_type,  ''S'', ''Green'',  ''F'', ''blue'') "color",',
'       ssv_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = ssv_bu AND bup_plant_id = ssv_plnt)',
'          "Unit",',
'       ssv_store_id,',
'       ssv_store_desc,',
'       ssv_prod_id,',
'       ssv_prod_rev,',
'       ssv_prod_desc1,',
'       ssv_prod_ext_desc,',
'       ssv_prod_uom,',
'       ssv_sf_code,',
'       ssv_so_pfx,',
'       ssv_so_no,',
'       ssv_so_pfx || ''-'' || ssv_so_no "SO Pfx./No.",',
'       ssv_so_seq_no,',
'       ssv_so_sub_seq_no,',
'       ssv_proj_id,',
'       ssv_task_id,',
'       ssv_stk_qty,',
'       ssv_alloc_qty,',
'       ssv_pr_pend_qty,',
'       ssv_po_pend_qty,',
'       ssv_ssr_pend_qty,',
'       ssv_sso_pend_qty,',
'       ssv_ge_pend_qty,',
'       ssv_rcpt_pend_qty,',
'       ssv_rcpt_fin_qc_pend_qty,',
'       ssv_rcpt_qc_comp_fin_pend_qty,',
'       ssv_rcpt_rdy_recv_pend_qty,',
'       ssv_prod_ord_pend_qty,',
'       ssv_stk_transit_in_qty,',
'       ssv_tot_supply_qty,',
'       ssv_so_pend_qty,',
'       ssv_cs_pend_qty,',
'       ssv_tot_demand_qty,',
'       ssv_mr_pend_qty,',
'       ssv_mat_alloc_qty,',
'       ssv_so_pick_qty,',
'       ssv_tot_req_qty,',
'       ssv_mat_req_qty,',
'       ssv_so_schld_desc,',
'       ssv_prod_cls,',
'       (SELECT class_desc1',
'          FROM classes',
'         WHERE class_bu = ssv_bu AND class_id = ssv_prod_cls)',
'          "Class",',
'       ssv_prod_sub_cls,',
'       (SELECT subcls_desc1',
'          FROM sub_classes',
'         WHERE subcls_bu = ssv_bu AND subcls_id = ssv_prod_sub_cls)',
'          "Sub Class",',
'       ssv_prod_color,',
'       ssv_prod_grade,',
'       ssv_prod_length,',
'       ssv_prod_thickness,',
'       ssv_prod_width,',
'       ssv_prod_height,',
'       ssv_prod_mat_spec,',
'       ssv_prod_prefix,',
'       ssv_prod_make,',
'       ssv_prod_finish,',
'       ssv_prod_sec_no,',
'       ssv_gar_style,',
'       ssv_glz_type,',
'       ssv_prod_fab_item_type',
'  FROM stock_so_view',
' WHERE ssv_bu = :global_bu',
'       AND (NVL (:p931321300_unit, ''0'') = ''0''',
'            OR INSTR (:p931321300_unit || '':'', ssv_plnt || '':'') > 0)',
'       AND (INSTR (:p931321300_unit || '':'', ssv_plnt || '':'') > 0)',
'       AND :p931321300_filter = ''SSP''',
'       AND ssv_proj_id IN',
'              (SELECT prj_proj_id',
'                 FROM projects',
'                WHERE prj_bu = :global_bu',
'                      AND (prj_cont_mgr =',
'                              func_find_emp_id (:global_bu, :global_user)',
'                           OR prj_direct_id =',
'                                 func_find_emp_id (:global_bu, :global_user)',
'                           OR 0 <>',
'                                 (SELECT COUNT (*)',
'                                    FROM prj_access_ctrl',
'                                   WHERE pac_type = ''A''',
'                                         AND pac_emp_id =',
'                                                func_find_emp_id (',
'                                                   :global_bu,',
'                                                   :global_user))',
'                           OR 0 <>',
'                                 (SELECT COUNT (*)',
'                                    FROM proj_team',
'                                   WHERE prjt_bu = prj_bu',
'                                         AND prjt_proj_id = prj_proj_id',
'                                         AND prjt_emp_name =',
'                                                func_find_emp_id (',
'                                                   :global_bu,',
'                                                   :global_user))))',
'       OR EXISTS',
'             (SELECT 1',
'                FROM appl_users',
'               WHERE     appluser_bu = :global_bu',
'                     AND appluser_id = :global_user',
'                     AND appluser_user_type = ''R'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'CS Supply And Demand - SO/Prj Ref.'
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
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="fa fa-square" style="color:#FF8040;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> PR - Purchase Request</b>&nbsp; &nbsp; ',
'<span class="fa fa-square" style="color:#628db5;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> PO - Purchase Order</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#8265ba;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> SSC - Suplr. Sch. Rqst</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#bf9885;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> SS - Suplr. Sch.</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#db6225;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> GE - Gate Entry</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> SO - Sales Order</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> CS - Cust. Sch.</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:11px;font-family: arial;"> MR - Mat. Req.</b>'))
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12390733643687378891)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>500
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>','
,p_internal_uid=>6908771808143767863
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969015504957168517)
,p_db_column_name=>'Class'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969016548352168529)
,p_db_column_name=>'SO Pfx./No.'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'SO Pfx./No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969031965855168818)
,p_db_column_name=>'SSV_ALLOC_QTY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Ssv Alloc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969038971371168923)
,p_db_column_name=>'SSV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ssv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969026418690168723)
,p_db_column_name=>'SSV_CS_PEND_QTY'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'CS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969018221443168560)
,p_db_column_name=>'SSV_GAR_STYLE'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Ssv Gar Style'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969030016508168792)
,p_db_column_name=>'SSV_GE_PEND_QTY'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'GE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Gate_Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969017784817168553)
,p_db_column_name=>'SSV_GLZ_TYPE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Ssv Glz Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969025297975168687)
,p_db_column_name=>'SSV_MAT_ALLOC_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Mat.  Alloc.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969024056577168663)
,p_db_column_name=>'SSV_MAT_REQ_QTY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'MR'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969038646013168915)
,p_db_column_name=>'SSV_MAT_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Ssv Mat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969025642687168696)
,p_db_column_name=>'SSV_MR_PEND_QTY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'MR  Pend.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969038254403168912)
,p_db_column_name=>'SSV_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#Unit#">#SSV_PLNT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969031198813168807)
,p_db_column_name=>'SSV_PO_PEND_QTY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'PO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Pur_Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969023303237168653)
,p_db_column_name=>'SSV_PROD_CLS'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Ssv Prod Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969022448868168642)
,p_db_column_name=>'SSV_PROD_COLOR'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Ssv Prod Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969036312249168882)
,p_db_column_name=>'SSV_PROD_DESC1'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969035933454168879)
,p_db_column_name=>'SSV_PROD_EXT_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Ssv Prod Ext Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969017396761168538)
,p_db_column_name=>'SSV_PROD_FAB_ITEM_TYPE'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Ssv Prod Fab Item Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969019023650168578)
,p_db_column_name=>'SSV_PROD_FINISH'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Ssv Prod Finish'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969022131930168637)
,p_db_column_name=>'SSV_PROD_GRADE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Ssv Prod Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969020588155168612)
,p_db_column_name=>'SSV_PROD_HEIGHT'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Ssv Prod Height'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969037069187168893)
,p_db_column_name=>'SSV_PROD_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969021641022168632)
,p_db_column_name=>'SSV_PROD_LENGTH'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Ssv Prod Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969019404241168584)
,p_db_column_name=>'SSV_PROD_MAKE'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Ssv Prod Make'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969020169908168604)
,p_db_column_name=>'SSV_PROD_MAT_SPEC'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Ssv Prod Mat Spec'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969027968922168753)
,p_db_column_name=>'SSV_PROD_ORD_PEND_QTY'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Prod. Ord .'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969019754613168599)
,p_db_column_name=>'SSV_PROD_PREFIX'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Ssv Prod Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969036703443168890)
,p_db_column_name=>'SSV_PROD_REV'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969018598508168570)
,p_db_column_name=>'SSV_PROD_SEC_NO'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Ssv Prod Sec No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969022894716168645)
,p_db_column_name=>'SSV_PROD_SUB_CLS'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Ssv Prod Sub Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969021259405168628)
,p_db_column_name=>'SSV_PROD_THICKNESS'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Ssv Prod Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969035500591168873)
,p_db_column_name=>'SSV_PROD_UOM'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969021025112168618)
,p_db_column_name=>'SSV_PROD_WIDTH'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Ssv Prod Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969033126736168838)
,p_db_column_name=>'SSV_PROJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Ssv Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969031610755168813)
,p_db_column_name=>'SSV_PR_PEND_QTY'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'PR'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969029152732168782)
,p_db_column_name=>'SSV_RCPT_FIN_QC_PEND_QTY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Mov. Fin. (QC not Comp.)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969029614638168788)
,p_db_column_name=>'SSV_RCPT_PEND_QTY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'GRN  Entry'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'GRN_Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969028771819168774)
,p_db_column_name=>'SSV_RCPT_QC_COMP_FIN_PEND_QTY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'QC Comp. (Fin. NP)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969028343514168757)
,p_db_column_name=>'SSV_RCPT_RDY_RECV_PEND_QTY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'GRN (R. Recv.)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969035056745168865)
,p_db_column_name=>'SSV_SF_CODE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>' SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969034292250168854)
,p_db_column_name=>'SSV_SO_NO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Ssv So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969026820623168731)
,p_db_column_name=>'SSV_SO_PEND_QTY'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'SO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969034728016168860)
,p_db_column_name=>'SSV_SO_PFX'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Ssv So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969024855711168679)
,p_db_column_name=>'SSV_SO_PICK_QTY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'SO  Picked'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969023642601168656)
,p_db_column_name=>'SSV_SO_SCHLD_DESC'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'SO Prj.Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969033836011168849)
,p_db_column_name=>'SSV_SO_SEQ_NO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Ssv So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969033490686168843)
,p_db_column_name=>'SSV_SO_SUB_SEQ_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Ssv So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969030400949168795)
,p_db_column_name=>'SSV_SSO_PEND_QTY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'SSO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr_Sch'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969030812182168799)
,p_db_column_name=>'SSV_SSR_PEND_QTY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'SSR'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr_Sch_Rqst'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969032335128168829)
,p_db_column_name=>'SSV_STK_QTY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969027587762168746)
,p_db_column_name=>'SSV_STK_TRANSIT_IN_QTY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'In Transit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969037530759168901)
,p_db_column_name=>'SSV_STORE_DESC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'W/H Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969037842311168907)
,p_db_column_name=>'SSV_STORE_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'W/H'
,p_column_html_expression=>'<span title="#SSV_STORE_DESC#">#SSV_STORE_ID#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969032642095168835)
,p_db_column_name=>'SSV_TASK_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Ssv Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969026116129168709)
,p_db_column_name=>'SSV_TOT_DEMAND_QTY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Total Demand '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969024456476168668)
,p_db_column_name=>'SSV_TOT_REQ_QTY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Total  Req.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969027204103168734)
,p_db_column_name=>'SSV_TOT_SUPPLY_QTY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Total Supply'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969015049371168503)
,p_db_column_name=>'Sub Class'
,p_display_order=>620
,p_column_identifier=>'BP'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969017023483168532)
,p_db_column_name=>'Type'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Type'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Type#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969015745809168521)
,p_db_column_name=>'Unit'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969016192072168526)
,p_db_column_name=>'color'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12390340207093804617)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'196279'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SSV_PLNT:SSV_STORE_ID:Type:SSV_PROD_ID:SSV_PROD_REV:SSV_PROD_DESC1:SSV_PROD_UOM:SO Pfx./No.:SSV_SO_SCHLD_DESC:SSV_SF_CODE:SSV_STK_QTY:SSV_PR_PEND_QTY:SSV_PO_PEND_QTY:SSV_SSR_PEND_QTY:SSV_SSO_PEND_QTY:SSV_GE_PEND_QTY:SSV_RCPT_PEND_QTY:SSV_RCPT_FIN_QC_'
||'PEND_QTY:SSV_RCPT_QC_COMP_FIN_PEND_QTY:SSV_RCPT_RDY_RECV_PEND_QTY:SSV_PROD_ORD_PEND_QTY:SSV_STK_TRANSIT_IN_QTY:SSV_TOT_SUPPLY_QTY:SSV_SO_PEND_QTY:SSV_CS_PEND_QTY:SSV_MAT_REQ_QTY:SSV_TOT_DEMAND_QTY:SSV_MR_PEND_QTY:SSV_MAT_ALLOC_QTY:SSV_SO_PICK_QTY:SSV'
||'_TOT_REQ_QTY:SSV_STORE_DESC:Class:Sub Class'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6764260568395935563)
,p_plug_name=>'Include Zero'
,p_static_id=>'include-zero'
,p_region_name=>'collexprep'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7082242028920529120)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12147790117269419792)
,p_plug_name=>'SFG - Stock Cost'
,p_static_id=>'sfg-stock-cost'
,p_region_name=>'STSFS_COST'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12147788856891419779)
,p_plug_name=>'Stock Cost'
,p_static_id=>'stock-cost'
,p_region_name=>'STCOST'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12147788495314419775)
,p_name=>'Stock Costs  - Inline'
,p_static_id=>'stock-costs-inline'
,p_parent_plug_id=>wwv_flow_imp.id(12147788856891419779)
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
'  WHERE stcost_bu       = :GLOBAL_BU',
'   AND stcost_prod_id   = :P931321300_ITEM_1',
'   AND stcost_prod_rev  = :P931321300_ITEM_REV_1',
'   AND stcost_store_id  = :P931321300_STORE_ID_1'))
,p_ajax_enabled=>'Y'
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
 p_id=>wwv_flow_imp.id(5968989780541168078)
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
 p_id=>wwv_flow_imp.id(5968990191197168082)
,p_query_column_id=>3
,p_column_alias=>'Source'
,p_column_display_sequence=>3
,p_column_heading=>'Source'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5968989433585168063)
,p_query_column_id=>1
,p_column_alias=>'WareHouse'
,p_column_display_sequence=>1
,p_column_heading=>'Warehouse'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17142418894837853545)
,p_plug_name=>'Stocks'
,p_static_id=>'stocks'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(sv_mat_type,''S'',''STCOST'',''F'',''STSFS_COST'') sv_mat_type2,',
'            sv_mat_type sv_mat_type1,',
'            DECODE(sv_mat_type,''S'',''STD'',''F'',''SFG'') "Type",',
'            sv_sf_code "SF Code",',
'            CASE WHEN  sv_mat_type = ''F'' AND sv_sf_code IS NOT NULL THEN',
'         func_find_process_from_sfgcode(:global_bu,sv_plnt,sv_prod_id,sv_prod_rev,sv_sf_code,1,NULL )',
'  ELSE',
'  NULL',
'END "SF Code Desc.",',
'            sv_store_id "WareHouse",',
'            sv_prod_id "Item",',
'            sv_prod_rev "Rev.",',
'            sv_prod_desc1 "Item Desc.",',
'            sv_prod_uom "UOM",',
'            sv_stk_qty "Stock",',
'            sv_pr_pend_qty "PR",',
'            sv_po_pend_qty "Pur_Order",',
'            sv_ssr_pend_qty "Suplr_Sch_Rqst",',
'            sv_sso_pend_qty "Suplr_Sch",',
'            sv_ge_pend_qty "Gate_Entry",',
'            sv_rcpt_pend_qty "GRN_Entry",',
'            sv_rcpt_fin_qc_pend_qty "Mov_Fin_QC_not_Comp",',
'            sv_rcpt_qc_comp_fin_pend_qty "QC_Comp_Fin_NP",',
'            sv_rcpt_rdy_recv_pend_qty "GRN_R_Recv",',
'            sv_prod_ord_pend_qty "Prod_Order",',
'            sv_stk_transit_in_qty "In_Transit",',
'            sv_tot_supply_qty "Total_Supply",',
'            0 safety,',
'            sv_so_pend_qty "Sales_Order",',
'            sv_cs_pend_qty "Cust_Sch",',
'            sv_mat_req_qty "Mat_Req",',
'            sv_tot_demand_qty "Total_Demand",',
'            sv_mr_pend_qty "MR_Pend",',
'            sv_mat_alloc_qty "Mat_Alloc",',
'            sv_so_pick_qty "SO_Picked",',
'            sv_tot_req_qty "Total_Req",',
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
'    AND (NVL (:P931321300_UNIT, ''0'') = ''0''',
'                        OR INSTR (:P931321300_UNIT || '':'',',
'                                  sv_plnt || '':'') > 0)',
'                   AND (INSTR (:P931321300_UNIT || '':'', sv_plnt || '':'') > 0)',
'   AND :P931321300_FILTER =''SA'' ',
'',
'     /*  AND (sv_prod_subcls_id IN',
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
'                      AND TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P931321300_FILTER =''SA''  and 1=2'
,p_plug_display_when_cond2=>'PLSQL'
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
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="fa fa-square" style="color:#FF8040;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> PR - Purchase Request</b>&nbsp; &nbsp; ',
'<span class="fa fa-square" style="color:#628db5;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> PO - Purchase Order</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#8265ba;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> SSC - Suplr. Sch. Rqst</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#bf9885;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> SS - Suplr. Sch.</b>&nbsp; &nbsp;',
'<span class="fa fa-square" style="color:#db6225;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> GE - Gate Entry</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> SO - Sales Order</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> CS - Cust. Sch.</b>',
'<span class="fa fa-square" style="color:#4083b9;padding-top: 2px;"; aria-hidden="true"></span><b style="font-size:12px"> MR - Mat. Req.</b>'))
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(17142418925819853546)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No data to display.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_csv_output_separator=>'|'
,p_internal_uid=>11660457090276242518
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(12142659710133529713)
,p_name=>'Demand Quantity'
,p_static_id=>'demand-quantity'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(12142659768370529714)
,p_name=>'Required Quantity'
,p_static_id=>'required-quantity'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(12142659167650529708)
,p_name=>'Supply Quantity'
,p_static_id=>'supply-quantity'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968996540673168201)
,p_db_column_name=>'ABC Type'
,p_display_order=>360
,p_column_identifier=>'AT'
,p_column_label=>'ABC Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968996145097168195)
,p_db_column_name=>'Category'
,p_display_order=>370
,p_column_identifier=>'AU'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968997345703168215)
,p_db_column_name=>'Class'
,p_display_order=>340
,p_column_identifier=>'AR'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969004404064168328)
,p_db_column_name=>'Cust_Sch'
,p_display_order=>210
,p_group_id=>wwv_flow_imp.id(12142659710133529713)
,p_column_identifier=>'BT'
,p_column_label=>'CS'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:CS,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Cust_Sch#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Cust_Sch'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969008759004168387)
,p_db_column_name=>'GRN_Entry'
,p_display_order=>130
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'BD'
,p_column_label=>'GRN Entry'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GRN,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#GRN_Entry#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'GRN_Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969002868033168295)
,p_db_column_name=>'GRN_R_Recv'
,p_display_order=>160
,p_column_identifier=>'BX'
,p_column_label=>'GRN (R. Recv.)'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GRTR,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#GRN_R_Recv#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'GRN_R_Recv'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969009164219168395)
,p_db_column_name=>'Gate_Entry'
,p_display_order=>120
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'BC'
,p_column_label=>'GE'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:GE,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Gate_Entry#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Gate_Entry'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969007992640168374)
,p_db_column_name=>'In_Transit'
,p_display_order=>180
,p_column_identifier=>'BI'
,p_column_label=>'In Transit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'In_Transit'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969001685241168274)
,p_db_column_name=>'Item'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Item'
,p_column_html_expression=>'<b><span style=" color:#056bbf;">#Item#</span></b>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969000885081168267)
,p_db_column_name=>'Item Desc.'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Item Desc.'
,p_column_html_expression=>'<b><span style="color:#056bbf; width:300px;">#Item Desc.#</span></b>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968999248518168246)
,p_db_column_name=>'LOT_SERIAL'
,p_display_order=>290
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
 p_id=>wwv_flow_imp.id(5969006391407168346)
,p_db_column_name=>'MR_Pend'
,p_display_order=>240
,p_group_id=>wwv_flow_imp.id(12142659768370529714)
,p_column_identifier=>'BO'
,p_column_label=>'MR Pend.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MRP,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#MR_Pend#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'MR_Pend'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969005979443168345)
,p_db_column_name=>'Mat_Alloc'
,p_display_order=>250
,p_group_id=>wwv_flow_imp.id(12142659768370529714)
,p_column_identifier=>'BP'
,p_column_label=>'Mat. Alloc.'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MA,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Mat_Alloc#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Mat_Alloc'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969004079290168306)
,p_db_column_name=>'Mat_Req'
,p_display_order=>220
,p_group_id=>wwv_flow_imp.id(12142659710133529713)
,p_column_identifier=>'BU'
,p_column_label=>'MR'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:MR,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Mat_Req#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Mat_Req'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969003726985168303)
,p_db_column_name=>'Mov_Fin_QC_not_Comp'
,p_display_order=>140
,p_column_identifier=>'BV'
,p_column_label=>'Mov. Fin. (QC Not Comp.)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Mov_Fin_QC_not_Comp'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969010332212168429)
,p_db_column_name=>'PR'
,p_display_order=>80
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'AY'
,p_column_label=>'PR'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_SV_SF_CODE,P9313213001_PLNT:#Item#,#Rev.#,#WareHouse#,PR,#SV_MAT_TYPE1#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#PR#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969008337768168378)
,p_db_column_name=>'Prod_Order'
,p_display_order=>170
,p_column_identifier=>'BH'
,p_column_label=>'Prod. Order'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:PROD_ORDER,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Prod_Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Prod_Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969010008105168418)
,p_db_column_name=>'Pur_Order'
,p_display_order=>90
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'AZ'
,p_column_label=>'PO'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_SV_SF_CODE,P9313213001_PLNT:#Item#,#Rev.#,#WareHouse#,PO,#SV_MAT_TYPE1#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Pur_Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Pur_Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969003258089168299)
,p_db_column_name=>'QC_Comp_Fin_NP'
,p_display_order=>150
,p_column_identifier=>'BW'
,p_column_label=>'QC Comp. (Fin. NP)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'QC_Comp_Fin_NP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969001285091168273)
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
 p_id=>wwv_flow_imp.id(5968999642258168251)
,p_db_column_name=>'SAFETY'
,p_display_order=>280
,p_column_identifier=>'AL'
,p_column_label=>'Safety'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'SAFETY'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969011074352168446)
,p_db_column_name=>'SF Code'
,p_display_order=>410
,p_column_identifier=>'BY'
,p_column_label=>'SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969010704424168438)
,p_db_column_name=>'SF Code Desc.'
,p_display_order=>420
,p_column_identifier=>'BZ'
,p_column_label=>'SF Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969005626551168342)
,p_db_column_name=>'SO_Picked'
,p_display_order=>260
,p_group_id=>wwv_flow_imp.id(12142659768370529714)
,p_column_identifier=>'BQ'
,p_column_label=>'SO Picked'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_PLNT:SOP,#Item#,#Rev.#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#SO_Picked#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'SO_Picked'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968998847492168237)
,p_db_column_name=>'STOCK_COST'
,p_display_order=>300
,p_column_identifier=>'AN'
,p_column_label=>'Stock Cost'
,p_column_link=>'javascript: $s(''P93132130_ITEM'',''#Item#''); $s(''P93132130_ITEM_REV'',''#Rev.#''); $s(''P93132130_STORE_ID'',''#WareHouse#''); $s(''P93132130_REQ'',''LOAD''); openModal(''#SV_MAT_TYPE2#'');'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-stock-chart"></span>'
,p_column_link_attr=>'#STOCK_COST#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968998512735168228)
,p_db_column_name=>'SV_MAT_TYPE1'
,p_display_order=>310
,p_column_identifier=>'AO'
,p_column_label=>'Sv Mat Type1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968995809689168192)
,p_db_column_name=>'SV_MAT_TYPE2'
,p_display_order=>380
,p_column_identifier=>'AV'
,p_column_label=>'Sv Mat Type2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968994948020168170)
,p_db_column_name=>'SV_PLNT'
,p_display_order=>400
,p_column_identifier=>'AX'
,p_column_label=>'Unit'
,p_column_html_expression=>'<b><span title="#Unit#"; style="color:gray; ">#SV_PLNT#</span></b>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968995393301168187)
,p_db_column_name=>'SV_SF_CODE'
,p_display_order=>390
,p_column_identifier=>'AW'
,p_column_label=>'Sv Sf Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969007158365168359)
,p_db_column_name=>'Sales_Order'
,p_display_order=>200
,p_group_id=>wwv_flow_imp.id(12142659710133529713)
,p_column_identifier=>'BK'
,p_column_label=>'SO'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_ITEM_REV,P9313213001_STORE_ID,P9313213001_SV_SF_CODE,P9313213001_PLNT:SO,#SV_MAT_TYPE1#,#Item#,#Rev.#,#WareHouse#,#SV_SF_CODE#,#SV_PLNT#'
,p_column_linktext=>'#Sales_Order#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Sales_Order'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969000103535168256)
,p_db_column_name=>'Stock'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Stock'
,p_column_html_expression=>'<b><span style=" color:Black;">#Stock#</span></b>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968997017682168207)
,p_db_column_name=>'Sub Class'
,p_display_order=>350
,p_column_identifier=>'AS'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969004752155168332)
,p_db_column_name=>'Suplr_Sch'
,p_display_order=>110
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'BS'
,p_column_label=>'SS'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_MAT_TYPE,P9313213001_ITEM_REV,P9313213001_ITEM,P9313213001_STORE_ID,P9313213001_PLNT:SS,#SV_MAT_TYPE1#,#Rev.#,#Item#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Suplr_Sch#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr_Sch'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969009543408168399)
,p_db_column_name=>'Suplr_Sch_Rqst'
,p_display_order=>100
,p_group_id=>wwv_flow_imp.id(12142659167650529708)
,p_column_identifier=>'BA'
,p_column_label=>'SSR'
,p_column_link=>'f?p=&APP_ID.:9313213001:&SESSION.::&DEBUG.::P9313213001_TYPE,P9313213001_ITEM_REV,P9313213001_MAT_TYPE,P9313213001_ITEM,P9313213001_STORE_ID,P9313213001_PLNT:SSR,#Rev.#,#SV_MAT_TYPE1#,#Item#,#WareHouse#,#SV_PLNT#'
,p_column_linktext=>'#Suplr_Sch_Rqst#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Suplr_Sch_Rqst'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969006771010168354)
,p_db_column_name=>'Total_Demand'
,p_display_order=>230
,p_group_id=>wwv_flow_imp.id(12142659710133529713)
,p_column_identifier=>'BN'
,p_column_label=>'Total Demand'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Total_Demand'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969005226585168337)
,p_db_column_name=>'Total_Req'
,p_display_order=>270
,p_group_id=>wwv_flow_imp.id(12142659768370529714)
,p_column_identifier=>'BR'
,p_column_label=>'Total Req.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Total_Req'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969007592376168367)
,p_db_column_name=>'Total_Supply'
,p_display_order=>190
,p_column_identifier=>'BJ'
,p_column_label=>'Total Supply'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'Total_Supply'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969002459813168285)
,p_db_column_name=>'Type'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969000478427168260)
,p_db_column_name=>'UOM'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968998059737168221)
,p_db_column_name=>'Unit'
,p_display_order=>320
,p_column_identifier=>'AP'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5968997788303168220)
,p_db_column_name=>'W/H'
,p_display_order=>330
,p_column_identifier=>'AQ'
,p_column_label=>'W/H Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5969002050709168281)
,p_db_column_name=>'WareHouse'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'W/H'
,p_column_html_expression=>'<b><span title="#W/H#"; style="color:GREEN;">#WareHouse#</span></b>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(17150629900369235733)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55924423'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'SV_PLNT:WareHouse:Item:Rev.:Item Desc.:UOM:SF Code:SF Code Desc.:Stock:PR:Pur_Order:Suplr_Sch_Rqst:Suplr_Sch:Gate_Entry:GRN_Entry:Mov_Fin_QC_not_Comp:QC_Comp_Fin_NP:GRN_R_Recv:Prod_Order:In_Transit:Total_Supply:SAFETY:Sales_Order:Cust_Sch:Mat_Req:Tot'
||'al_Demand:MR_Pend:Mat_Alloc:SO_Picked:Total_Req:Unit:W/H:Class:Sub Class:ABC Type:Category:Type:STOCK_COST'
,p_sum_columns_on_break=>'Trans. Qty.:Trans. Value'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12147788919328419780)
,p_name=>'Store SF Stocks - Inline'
,p_static_id=>'store-sf-stocks-inline'
,p_parent_plug_id=>wwv_flow_imp.id(12147790117269419792)
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
'   AND stsfs_prod_id=:P931321300_ITEM',
'   AND stsfs_prod_rev=:P931321300_ITEM_REV',
'   AND stsfs_store_id=:P931321300_STORE_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P931321300_ITEM,P931321300_ITEM_REV,P931321300_STORE_ID'
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
 p_id=>wwv_flow_imp.id(5968992693018168124)
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
 p_id=>wwv_flow_imp.id(5968992026247168118)
,p_query_column_id=>3
,p_column_alias=>'Lot. No.'
,p_column_display_sequence=>3
,p_column_heading=>'Lot. No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5968991537227168115)
,p_query_column_id=>2
,p_column_alias=>'Prod. Ord. No.'
,p_column_display_sequence=>2
,p_column_heading=>'Prod. Ord. No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5968992296809168121)
,p_query_column_id=>4
,p_column_alias=>'Serial No.'
,p_column_display_sequence=>4
,p_column_heading=>'Serial No.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5968991160815168112)
,p_query_column_id=>1
,p_column_alias=>'WareHouse'
,p_column_display_sequence=>1
,p_column_heading=>'Warehouse'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6764754585719688414)
,p_plug_name=>'Unit'
,p_static_id=>'unit'
,p_region_name=>'collexprep'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6764260501793935562)
,p_plug_name=>'Unit Group'
,p_static_id=>'unit-group'
,p_region_name=>'collexprep'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5968987241991168017)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7082242028920529120)
,p_button_name=>'coll'
,p_static_id=>'coll'
,p_button_static_id=>'exp'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Coll'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrows-v'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5968987696045168031)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7082242028920529120)
,p_button_name=>'filter'
,p_static_id=>'filter'
,p_button_static_id=>'filter'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Filter'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5969039672264168943)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12390733720334378892)
,p_button_name=>'reset_1'
,p_static_id=>'reset'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Reset 1'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5968987950673168034)
,p_name=>'P931321300_DUMMY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7082242028920529120)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5968988344479168045)
,p_name=>'P931321300_DUM_COL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7082242028920529120)
,p_item_default=>'1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5969011806347168465)
,p_name=>'P931321300_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17142418894837853545)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5969012152454168470)
,p_name=>'P931321300_ITEM_REV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17142418894837853545)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5969012964327168476)
,p_name=>'P931321300_REQ'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(17142418894837853545)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5969012608814168471)
,p_name=>'P931321300_STORE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17142418894837853545)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5968993430582168129)
,p_name=>'P931321300_UNIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6764754585719688414)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'if :P931321300_DUMMY = 0 THEN ',
'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id)INTO :P931321300_UNIT',
'FROM(SELECT  bup_bu || '' - '' || (SUBSTR(bup_name1,1,50)) bup_name1,bup_plant_id',
'FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE bup_bu = bu_id',
'   AND bup_bu = auba_bu',
'   AND bup_plant_id = auba_plant',
'   AND auba_user_id = :global_user         ',
'   AND (NVL (:P931321300_UNIT_GROUP, ''0'') = ''0''',
'    OR INSTR (:P931321300_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
'   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'   AND bup_bu = :global_bu',
'ORDER BY bup_rpt_print_seq);',
'END IF;',
'RETURN :P931321300_UNIT;               ',
'END;'))
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
'   AND (NVL (:P931321300_UNIT_GROUP, ''0'') = ''0''',
'    OR INSTR (:P931321300_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
'   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'   AND bup_bu = :global_bu)',
'ORDER BY bup_rpt_print_seq'))
,p_lov_cascade_parent_items=>'P931321300_UNIT_GROUP'
,p_ajax_items_to_submit=>'P931321300_UNIT_GROUP'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(5969013640965168484)
,p_name=>'P931321300_UNIT_GROUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6764260501793935562)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P931321300_DUMMY = 0  THEN',
'SELECT LISTAGG(upgrp_group_id,'':'') WITHIN GROUP (ORDER BY upgrp_group_id)INTO :P931321300_UNIT_GROUP',
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
'END IF;',
'RETURN :P931321300_UNIT_GROUP;        ',
'END;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Unit Group</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'UNIT_GROUP'
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
 p_id=>wwv_flow_imp.id(5969014336482168490)
,p_name=>'P931321300_ZERO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6764260568395935563)
,p_item_default=>'0'
,p_prompt=>'<b> Include Zero </b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Yes;0,No;1'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969042349340168993)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5968987241991168017)
,p_condition_element=>'P931321300_DUM_COL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969043379483169001)
,p_event_id=>wwv_flow_imp.id(5969042349340168993)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P931321300_DUM_COL',
  'language', 'PLSQL',
  'plsql_code', ':P931321300_DUM_COL:= 0;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969042862231168998)
,p_event_id=>wwv_flow_imp.id(5969042349340168993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#collexprep.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
    '$(''#collexprep.a-Collapsible .a-Collapsible-content'').show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969054161077169054)
,p_name=>'Dummy_1'
,p_static_id=>'dummy'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_DUMMY_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969054704304169060)
,p_event_id=>wwv_flow_imp.id(5969054161077169054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969048802928169023)
,p_name=>'Expand'
,p_static_id=>'expand'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5965816149382656193)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969049178892169032)
,p_name=>'Expand_1'
,p_static_id=>'expand-2'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5965816149382656193)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969043769617169003)
,p_name=>'Fetch'
,p_static_id=>'fetch'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_UNIT_GROUP'
,p_condition_element=>'P931321300_UNIT_GROUP'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969044317834169006)
,p_event_id=>wwv_flow_imp.id(5969043769617169003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P931321300_DUMMY,P931321300_UNIT',
  'items_to_submit', 'P931321300_UNIT_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P931321300_UNIT_GROUP  IS NOT NULL THEN',
    '  ',
    '  SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P931321300_UNIT',
    '    FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
    '           FROM business_units, bus_unit_plants, appl_user_plant_access',
    ' WHERE bup_bu = bu_id',
    '   AND bup_bu = auba_bu',
    '   AND bup_plant_id = auba_plant',
    '   AND auba_user_id = :global_user         ',
    '   AND (NVL (:P931321300_UNIT_GROUP, ''0'') = ''0''',
    '    OR INSTR (:P931321300_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
    '   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '   AND bup_bu = :global_bu',
    'ORDER BY bup_rpt_print_seq);',
    '     :P931321300_DUMMY := 0;',
    'END IF;',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969044752088169009)
,p_event_id=>wwv_flow_imp.id(5969043769617169003)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P931321300_DUMMY,P931321300_UNIT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P931321300_dummy := 1;',
    ':P931321300_UNIT := NULL;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969045330071169012)
,p_event_id=>wwv_flow_imp.id(5969043769617169003)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969053319956169046)
,p_name=>'Filter'
,p_static_id=>'filter'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969053748751169048)
,p_event_id=>wwv_flow_imp.id(5969053319956169046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969049594687169035)
,p_name=>'IR_Grouping'
,p_static_id=>'ir-grouping'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969050106535169037)
,p_event_id=>wwv_flow_imp.id(5969049594687169035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969040100920168953)
,p_name=>'IR_Grouping_Refresh_1'
,p_static_id=>'ir-grouping-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12390733720334378892)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969040607710168959)
,p_event_id=>wwv_flow_imp.id(5969040100920168953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969050438836169038)
,p_name=>'Item_Submit'
,p_static_id=>'item-submit'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_MAT_TYPE'
,p_condition_element=>'P931321300_MAT_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969050961565169040)
,p_event_id=>wwv_flow_imp.id(5969050438836169038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12147788495314419775)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969051467962169042)
,p_event_id=>wwv_flow_imp.id(5969050438836169038)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12147788919328419780)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969047132230169017)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5968987696045168031)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969047588493169018)
,p_event_id=>wwv_flow_imp.id(5969047132230169017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P931321300_DUMMY,P931321300_UNIT,P931321300_UNIT_GROUP',
  'items_to_submit', 'P931321300_DUMMY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ' IF :P931321300_DUMMY = 0 THEN ',
    '    :P931321300_UNIT := NULL;',
    '    :P931321300_UNIT_GROUP :=NULL;',
    '    :P931321300_DUMMY := 1;',
    'ELSE',
    '   :P931321300_DUMMY := 0;',
    'SELECT LISTAGG(upgrp_group_id,'':'') WITHIN GROUP (ORDER BY upgrp_group_id)INTO :P931321300_UNIT_GROUP',
    ' FROM(',
    '    SELECT upgrp_bu ||'' - '' || upgrp_desc1,upgrp_group_id ',
    '      FROM UNIT_PLANT_GROUPS, bus_unit_plants, appl_user_plant_access',
    ' WHERE     UPGRP_BU = :global_bu',
    '       AND UPGRP_BU = bup_bu',
    '       AND upgrp_group_id = bup_group_id',
    '       AND bup_bu = auba_bu',
    '       AND bup_plant_id = auba_plant',
    '       AND auba_user_id = :global_user',
    'ORDER  BY upgrp_group_id);',
    ' END IF;',
    'END;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969047977908169020)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_ZERO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969048335668169020)
,p_event_id=>wwv_flow_imp.id(5969047977908169020)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969041018188168973)
,p_name=>'open'
,p_static_id=>'open'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5968987241991168017)
,p_condition_element=>'P931321300_DUM_COL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969042023214168992)
,p_event_id=>wwv_flow_imp.id(5969041018188168973)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P931321300_DUM_COL',
  'language', 'PLSQL',
  'plsql_code', ':P931321300_DUM_COL:= 1;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969041449495168985)
,p_event_id=>wwv_flow_imp.id(5969041018188168973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#collexprep.a-Collapsible.is-collapsed'').removeClass(''is-collapsed'').addClass(''is-expanded'');',
    '$(''#collexprep.a-Collapsible .a-Collapsible-content'').show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969055090930169062)
,p_name=>'Open'
,p_static_id=>'open-2'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5969039672264168943)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969055542151169062)
,p_event_id=>wwv_flow_imp.id(5969055090930169062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.jQuery(''#reset_ir'').interactiveReport("reset");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969051856582169043)
,p_name=>'Refresh_Stock_Region'
,p_static_id=>'refresh-stock-region'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_REQ'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969052393015169045)
,p_event_id=>wwv_flow_imp.id(5969051856582169043)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12147788495314419775)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969052903451169045)
,p_event_id=>wwv_flow_imp.id(5969051856582169043)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12147788919328419780)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5969045703378169013)
,p_name=>'Unit'
,p_static_id=>'unit'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P931321300_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969046209396169015)
,p_event_id=>wwv_flow_imp.id(5969045703378169013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', ':P931321300_dummy := 0;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5969046665549169017)
,p_event_id=>wwv_flow_imp.id(5969045703378169013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
