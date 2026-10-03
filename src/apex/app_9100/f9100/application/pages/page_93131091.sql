prompt --application/pages/page_93131091
begin
--   Manifest
--     PAGE: 93131091
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
 p_id=>93131091
,p_name=>'Open Stock Adjustment'
,p_alias=>'OPEN_STOCK_ADJUSTMENT_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Open Stock Adjustment'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'.ui-dialog-titlebar-close .ui-icon {',
'    --jui-icon-background-image: none;',
'    --jui-icon-size: var(--jui-dialog-title-close-icon-size, 0px);',
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
,p_dialog_width=>'1200'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9660329773907737599)
,p_plug_name=>'Result '
,p_static_id=>'result'
,p_region_name=>'SA_RPT'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT-- a.rowid,',
'         sathd_bu,',
'            sathd_plnt,',
'         (SELECT bup_name1',
'                  FROM bus_unit_plants',
'                 WHERE bup_bu = sathd_bu AND bup_plant_id = sathd_plnt)',
'                  Unit_Name,',
'         sathd_ord_no,',
'         TO_CHAR(sathd_ord_date,:GLOBAL_RPT_DATE_MASK) sathd_ord_date1,',
'         sathd_ord_date,',
'         sathd_store_id,',
'         (SELECT store_desc1',
'      FROM stores',
'     WHERE store_bu = sathd_bu',
'       AND store_id = sathd_store_id)"Store",',
'         satln_seq_no,',
'         satln_ord_no,',
'         satln_adj_prefix,',
'         satln_prod_id,',
'         (select prod_desc11 from products',
'         where sathd_bu = prod_bu',
'         and satln_prod_id = prod_id ',
'         and satln_prod_rev = prod_rev )"Item Desc.",',
'         satln_prod_rev,',
'         satln_uom,',
'         satln_oprn_ln_seq_no,',
'         satln_process_id,',
'         (SELECT DISTINCT mfgo_desc1',
'            FROM mfg_oprns, mfg_oprns_plnt',
'           WHERE mfgo_bu = mfgop_bu',
'             AND mfgo_oprn_id = mfgop_oprn_id',
'             AND mfgop_bu = satln_bu',
'             AND mfgop_plnt = sathd_plnt',
'             AND mfgop_oprn_id = satln_process_id)"Process",',
'         satln_prod_uom,',
'         satln_conv_factor,',
'         satln_class_id,',
'         satln_trans_qty,',
'         satln_unit_cost,',
'         satln_reference,',
'         satln_status,',
'         sathd_ord_year,',
'         sathd_ord_period,',
'         sathd_reference,',
'         sathd_status,',
'         decode(sathd_status,''E'',''Draft'',''C'',''Cancelled'',''N'',''Entry Completed'',''A'',''Approved'') status,',
'         decode(satln_status,''E'',''Draft'',''C'',''Cancelled'',''N'',''Entry Completed'',''A'',''Approved'') ln_status,',
'           decode(sathd_status,''E'',''Blue'',''C'',''Brown'',''N'',''Orange'',''A'',''Green'')color,',
'           decode(satln_status,''E'',''Blue'',''C'',''Brown'',''N'',''Orange'',''A'',''Green'')color1,',
'         sathd_source_type,',
'         sathd_jrnl_flag,',
'         sathd_file_name,',
'         sathd_plnt_loc_id,',
'         sathd_plnt_loc_name,',
'         satln_bu,',
'         satln_adj_prod_id,',
'         satln_adj_prod_rev,',
'         satln_proj_task_id,',
'         satln_po_ord_no,',
'         satln_os_ord_no,',
'         satln_os_ord_pfx,',
'         satln_work_center,',
'         satln_ord_type,',
'         satln_sf_code,',
'         satln_prodn_ord_flag,',
'         satln_os_ord_seq_no,',
'         satln_os_ord_sub_seq_no,',
'         satln_mat_type,',
'         satln_dc_cre_flag,',
'         satln_upd_prodn_queue,',
'         satln_thickness,',
'         satln_length,',
'         satln_width,',
'         satln_qty_in_nos,',
'         satln_sc_rqrd_flag,',
'         satln_tar_sf_code,',
'         satln_adj_prod_uom,',
'         satln_adj_conv_factor,',
'         satln_so_type,',
'         satln_so_pfx,',
'         satln_so_no,',
'         satln_so_seq_no,',
'         satln_so_sub_seq_no,',
'         satln_proj_id,',
'         satln_task_id,',
'         satln_so_schld_desc,',
'         satln_outer_dia,',
'         satln_bom_no,',
'         satln_bom_name,',
'         satln_sht_qty,',
'         satln_pkt_qty,',
'         satln_bdl_qty,',
'         satln_plt_qty,',
'         satln_fg_prod_id,',
'         satln_fg_prod_rev,',
'         satln_fg_qty,',
'         satln_sc_proc_id,',
'         satln_sc_proc_cost,',
'         satln_dry_fat_pct,',
'         satln_dry_snf_pct,',
'         satln_dry_fat_kgs,',
'         satln_dry_snf_kgs,',
'         satln_dry_lr_pct,',
'         satln_dry_qty_kgs,',
'         satln_eng_bom_flag,',
'         satln_ins_plan_no,',
'         satln_ins_plan_rev,',
'         sathd_cre_date,',
'         ''<span aria-hidden="true" class="fa fa-print" style="color: #004153;font-size : 12px ;font-weight: bold"></span>'' print',
'    FROM stock_adj_trans_hd a, stock_adj_trans_ln   ',
'	  WHERE sathd_bu = :global_bu',
'         AND sathd_bu  = satln_bu',
'         AND sathd_ord_no = satln_ord_no',
'         AND sathd_status =''E''',
'          AND sathd_plnt IN',
'                (SELECT auba_plant',
'                   FROM appl_user_plant_access',
'                  WHERE     auba_bu = :global_bu',
'                        AND auba_user_id = :global_user',
'                        AND TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131091_PLNT,P93131091_PREFIX,P93131091_ORDER_NO,P93131091_STATUS_1,P93131091_DATE_FROM,P93131091_DATE_TO,P93131091_RCVR_WH,P93131091_PROD_ID,P93131091_PROD_DESC,P93131091_SO_PRJ_REF,P93131091_OPRN_NO,P93131091_PROCESS,P93131091_STATUS,P93131091_LO'
||'CATION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Stock Adjustment</b> '
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
 p_id=>wwv_flow_imp.id(9660329839229737600)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_download_filename=>'Stock Adjustment'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4178368003686126572
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6928809356208379827)
,p_db_column_name=>'COLOR'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5931071746252484093)
,p_db_column_name=>'COLOR1'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Color1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331059444737612)
,p_db_column_name=>'Item Desc.'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5931071619180484092)
,p_db_column_name=>'LN_STATUS'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Line Status'
,p_column_html_expression=>'<div style ="color:#COLOR1#; font-weight:bold;">#LN_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7726794097153107198)
,p_db_column_name=>'PRINT'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Print'
,p_column_link=>'javascript:$s(''P93131090_SATHD_PLNT_P'',''#SATHD_PLNT#''),$s(''P93131090_SATHD_ORD_NO_P'',''#SATHD_ORD_NO#'');apex.submit(''SAPRINT'');'
,p_column_linktext=>'#PRINT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and instr(nvl(:REQUEST,''~''),''PDF'') = 0 and instr(nvl(:REQUEST,''~''),''HTMLD'') = 0'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331543315737617)
,p_db_column_name=>'Process'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330012979737601)
,p_db_column_name=>'SATHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sathd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7488571245688134602)
,p_db_column_name=>'SATHD_CRE_DATE'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Sathd Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332977184737631)
,p_db_column_name=>'SATHD_FILE_NAME'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Sathd File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332872133737630)
,p_db_column_name=>'SATHD_JRNL_FLAG'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Sathd Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7611400666358235231)
,p_db_column_name=>'SATHD_ORD_DATE'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5924171974031609027)
,p_db_column_name=>'SATHD_ORD_DATE1'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330256126737604)
,p_db_column_name=>'SATHD_ORD_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332450873737626)
,p_db_column_name=>'SATHD_ORD_PERIOD'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Sathd Ord Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332340644737625)
,p_db_column_name=>'SATHD_ORD_YEAR'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Sathd Ord Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330111616737602)
,p_db_column_name=>'SATHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660333126563737632)
,p_db_column_name=>'SATHD_PLNT_LOC_ID'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660333164385737633)
,p_db_column_name=>'SATHD_PLNT_LOC_NAME'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332581804737627)
,p_db_column_name=>'SATHD_REFERENCE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332815696737629)
,p_db_column_name=>'SATHD_SOURCE_TYPE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Sathd Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332725876737628)
,p_db_column_name=>'SATHD_STATUS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Sathd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330431942737606)
,p_db_column_name=>'SATHD_STORE_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Sathd Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084590591196207)
,p_db_column_name=>'SATLN_ADJ_CONV_FACTOR'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Satln Adj Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330901128737610)
,p_db_column_name=>'SATLN_ADJ_PREFIX'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660333418931737635)
,p_db_column_name=>'SATLN_ADJ_PROD_ID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Satln Adj Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663082455736196186)
,p_db_column_name=>'SATLN_ADJ_PROD_REV'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Satln Adj Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084477947196206)
,p_db_column_name=>'SATLN_ADJ_PROD_UOM'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Satln Adj Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086009195196221)
,p_db_column_name=>'SATLN_BDL_QTY'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Satln Bdl Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085719468196218)
,p_db_column_name=>'SATLN_BOM_NAME'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Satln Bom Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085545364196217)
,p_db_column_name=>'SATLN_BOM_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Satln Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660333302449737634)
,p_db_column_name=>'SATLN_BU'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Satln Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331881829737620)
,p_db_column_name=>'SATLN_CLASS_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Satln Class Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331804014737619)
,p_db_column_name=>'SATLN_CONV_FACTOR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Satln Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083670515196198)
,p_db_column_name=>'SATLN_DC_CRE_FLAG'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Satln Dc Cre Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086901088196230)
,p_db_column_name=>'SATLN_DRY_FAT_KGS'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Satln Dry Fat Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086654351196228)
,p_db_column_name=>'SATLN_DRY_FAT_PCT'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Satln Dry Fat Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087072711196232)
,p_db_column_name=>'SATLN_DRY_LR_PCT'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Satln Dry Lr Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087161167196233)
,p_db_column_name=>'SATLN_DRY_QTY_KGS'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Satln Dry Qty Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087016124196231)
,p_db_column_name=>'SATLN_DRY_SNF_KGS'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Satln Dry Snf Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086745138196229)
,p_db_column_name=>'SATLN_DRY_SNF_PCT'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Satln Dry Snf Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087288541196234)
,p_db_column_name=>'SATLN_ENG_BOM_FLAG'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Satln Eng Bom Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086202163196223)
,p_db_column_name=>'SATLN_FG_PROD_ID'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Satln Fg Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086302725196224)
,p_db_column_name=>'SATLN_FG_PROD_REV'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Satln Fg Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086347021196225)
,p_db_column_name=>'SATLN_FG_QTY'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Satln Fg Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087374942196235)
,p_db_column_name=>'SATLN_INS_PLAN_NO'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Satln Ins Plan No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663087505385196186)
,p_db_column_name=>'SATLN_INS_PLAN_REV'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Satln Ins Plan Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083946657196201)
,p_db_column_name=>'SATLN_LENGTH'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Satln Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083617080196197)
,p_db_column_name=>'SATLN_MAT_TYPE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Satln Mat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331336724737615)
,p_db_column_name=>'SATLN_OPRN_LN_SEQ_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Oprn. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330744974737609)
,p_db_column_name=>'SATLN_ORD_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Satln Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083072795196192)
,p_db_column_name=>'SATLN_ORD_TYPE'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Satln Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663082821971196189)
,p_db_column_name=>'SATLN_OS_ORD_NO'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Satln Os Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663082909650196190)
,p_db_column_name=>'SATLN_OS_ORD_PFX'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Satln Os Ord Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083406200196195)
,p_db_column_name=>'SATLN_OS_ORD_SEQ_NO'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Satln Os Ord Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083469843196196)
,p_db_column_name=>'SATLN_OS_ORD_SUB_SEQ_NO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Satln Os Ord Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085483125196216)
,p_db_column_name=>'SATLN_OUTER_DIA'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Satln Outer Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085894700196220)
,p_db_column_name=>'SATLN_PKT_QTY'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Satln Pkt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086092485196222)
,p_db_column_name=>'SATLN_PLT_QTY'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Satln Plt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663082707627196188)
,p_db_column_name=>'SATLN_PO_ORD_NO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Satln Po Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331446655737616)
,p_db_column_name=>'SATLN_PROCESS_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Satln Process Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083231796196194)
,p_db_column_name=>'SATLN_PRODN_ORD_FLAG'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Satln Prodn Ord Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330944252737611)
,p_db_column_name=>'SATLN_PROD_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Item '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331218642737613)
,p_db_column_name=>'SATLN_PROD_REV'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331704792737618)
,p_db_column_name=>'SATLN_PROD_UOM'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Satln Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085178690196213)
,p_db_column_name=>'SATLN_PROJ_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Satln Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663082534020196187)
,p_db_column_name=>'SATLN_PROJ_TASK_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Satln Proj Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084147114196203)
,p_db_column_name=>'SATLN_QTY_IN_NOS'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Satln Qty In Nos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332225905737623)
,p_db_column_name=>'SATLN_REFERENCE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Satln Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086621126196227)
,p_db_column_name=>'SATLN_SC_PROC_COST'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Satln Sc Proc Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663086460951196226)
,p_db_column_name=>'SATLN_SC_PROC_ID'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Satln Sc Proc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084294288196204)
,p_db_column_name=>'SATLN_SC_RQRD_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Satln Sc Rqrd Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330716132737608)
,p_db_column_name=>'SATLN_SEQ_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083140951196193)
,p_db_column_name=>'SATLN_SF_CODE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Satln Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085818821196219)
,p_db_column_name=>'SATLN_SHT_QTY'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Satln Sht Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084846603196210)
,p_db_column_name=>'SATLN_SO_NO'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Satln So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084806193196209)
,p_db_column_name=>'SATLN_SO_PFX'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Satln So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085374920196215)
,p_db_column_name=>'SATLN_SO_SCHLD_DESC'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'SO / Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084975583196211)
,p_db_column_name=>'SATLN_SO_SEQ_NO'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Satln So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085074694196212)
,p_db_column_name=>'SATLN_SO_SUB_SEQ_NO'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Satln So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084663755196208)
,p_db_column_name=>'SATLN_SO_TYPE'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Satln So Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332244147737624)
,p_db_column_name=>'SATLN_STATUS'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Line Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084363366196205)
,p_db_column_name=>'SATLN_TAR_SF_CODE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Satln Tar Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663085260646196214)
,p_db_column_name=>'SATLN_TASK_ID'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Satln Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083854574196200)
,p_db_column_name=>'SATLN_THICKNESS'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Satln Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332027577737621)
,p_db_column_name=>'SATLN_TRANS_QTY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660332119026737622)
,p_db_column_name=>'SATLN_UNIT_COST'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660331316114737614)
,p_db_column_name=>'SATLN_UOM'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083733724196199)
,p_db_column_name=>'SATLN_UPD_PRODN_QUEUE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Satln Upd Prodn Queue'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663084042693196202)
,p_db_column_name=>'SATLN_WIDTH'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Satln Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9663083022046196191)
,p_db_column_name=>'SATLN_WORK_CENTER'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Satln Work Center'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6928809267533379826)
,p_db_column_name=>'STATUS'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style ="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330613998737607)
,p_db_column_name=>'Store'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'WH'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9660330138250737603)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9663184906409243208)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14197421'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SATHD_PLNT_LOC_ID:SATHD_PLNT:SATHD_ORD_NO:SATHD_ORD_DATE1:Store:SATLN_SEQ_NO:SATLN_ADJ_PREFIX:SATLN_PROD_ID:Item Desc.:SATLN_PROD_REV:SATLN_UOM:SATLN_OPRN_LN_SEQ_NO:Process:SATLN_TRANS_QTY:SATLN_UNIT_COST:SATLN_SO_SCHLD_DESC:SATHD_REFERENCE'
,p_sort_column_1=>'SATHD_ORD_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5995965247667053036)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9660329773907737599)
,p_button_name=>'Close_Btn'
,p_static_id=>'close-btn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5995965365315053037)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5995965247667053036)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5995965440034053038)
,p_event_id=>wwv_flow_imp.id(5995965365315053037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
