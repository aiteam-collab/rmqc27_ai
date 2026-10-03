prompt --application/pages/page_93131090
begin
--   Manifest
--     PAGE: 93131090
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
 p_id=>93131090
,p_name=>'Stock Adjustment'
,p_alias=>'STOCK-ADJUSTMENT'
,p_step_title=>'Stock Adjustment'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(''#SA_RPT_ir'').interactiveReport("reset");',
'apex.jQuery(''#SA_RPT_HD_ir'').interactiveReport("reset");'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   padding-top: -4px;',
'}',
'',
'#Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   padding-top: -4px;',
'}',
'',
'',
'',
'.t-Region-title {',
'    font-size: small;',
'    font-weight: bold;',
'    color: #003968;',
'}',
'.t-Button--simple.t-Button--hot, .t-Button--simple.t-Button--hot .t-Icon {',
'    color: white;',
'}',
'.t-Button--simple.t-Button--hot {',
'    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.15) inset;',
'    background-color: rgba(0, 0, 0, 0.15);',
'    border-radius: 4px;',
'}',
'',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    /* --a-button-active-background-color: #307323; */',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'',
'.ui-button--danger, .t-Button--danger {',
'    --a-button-background-color: #e0e0e0;',
'    --a-button-text-color: #ef0808;',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #d50601;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'.t-Button--padRight, .u-RTL .t-Button--padLeft {',
'    margin-right: 8px!important;',
'}',
'',
'.t-Button--gapRight, .u-RTL .t-Button--gapLeft {',
'    margin-right: 16px!important;',
'}',
'',
'.t-Form-itemWrapper .a-Switch, .t-Form-itemWrapper .apex-item-group, .t-Form-itemWrapper .apex-item-icon, .t-Form-itemWrapper .apex-item-markdown-editor, .t-Form-itemWrapper .apex-item-single-checkbox, .t-Form-itemWrapper .ck-editor, .t-Form-itemWrap'
||'per fieldset {',
'    order: 2;',
'    border: #5e6087 !important;',
'}',
'',
'.t-Button--padLeft {',
'    margin-left: 8px!important;',
'}',
'.apex-icons-fontapex .fa {',
'    font-family: inherit!important;',
'    position: relative;',
'    font-weight: bold;',
'}',
'',
'  .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'  .t-fht-thead {',
'    overflow: auto !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9475000236048074643)
,p_plug_name=>'<b>Result (s)</b> '
,p_static_id=>'b-result-s-b'
,p_region_name=>'SA_RPT'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
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
'         AND sathd_bu  = satln_bu(+)',
'         AND sathd_ord_no = satln_ord_no(+)',
'          AND sathd_plnt IN',
'                (SELECT auba_plant',
'                   FROM appl_user_plant_access',
'                  WHERE     auba_bu = :global_bu',
'                        AND auba_user_id = :global_user',
'                        AND TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)',
'	AND ((SATHD_ORD_NO LIKE ''%''||:P93131090_ORDER_NO||''%'') OR :P93131090_ORDER_NO IS NULL)',
'   AND ((sathd_plnt_loc_id LIKE ''%''||:P93131090_LOCATION||''%'') OR :P93131090_LOCATION IS NULL)',
'   AND ((SATHD_STATUS = :P93131090_STATUS_1 ) OR :P93131090_STATUS_1 IS NULL)',
'  -- AND ((SATHD_STATUS LIKE ''%''||:P93131090_STATUS_1||''%'') OR :P93131090_STATUS_1 IS NULL)',
'   AND (SATHD_ORD_DATE >= :P93131090_DATE_FROM OR :P93131090_DATE_FROM IS NULL)',
'   AND (SATHD_ORD_DATE <= :P93131090_DATE_TO OR :P93131090_DATE_TO IS NULL)',
'   AND ((SATHD_STORE_ID  LIKE ''%''||:P93131090_RCVR_WH||''%'') OR :P93131090_RCVR_WH IS NULL)',
'   AND (:P93131090_PLNT IS NULL OR  EXISTS (SELECT 1',
'                      FROM bus_unit_plants',
'                     WHERE bup_bu = :GLOBAL_BU',
'                       AND bup_plant_id = SATHD_PLNT',
'                       AND bup_plant_id = :P93131090_PLNT ))   ',
'   AND (:P93131090_PROD_ID IS NULL OR  EXISTS (SELECT 1',
'                        FROM products ',
'                       WHERE prod_bu = :GLOBAL_BU',
'                         AND prod_id = satln_prod_id',
'                         AND prod_rev = satln_prod_rev',
'                         AND prod_id LIKE ''%''||:P93131090_PROD_ID||''%''))',
'    AND (:P93131090_PROD_DESC IS NULL OR  EXISTS (SELECT 1',
'                          FROM products ',
'                         WHERE prod_bu = :GLOBAL_BU',
'                           AND prod_id = satln_prod_id',
'                           AND prod_rev = satln_prod_rev',
'                           AND (prod_desc11 LIKE ''%''||:P93131090_PROD_DESC||''%''))) ',
'   AND ((satln_adj_prefix   LIKE ''%''||:P93131090_PREFIX||''%'') OR :P93131090_PREFIX IS NULL)',
'   AND ((satln_so_schld_desc  LIKE ''%''||:P93131090_SO_PRJ_REF||''%'') OR :P93131090_SO_PRJ_REF IS NULL)',
'   AND ((satln_oprn_ln_seq_no  LIKE ''%''||:P93131090_OPRN_NO||''%'') OR :P93131090_OPRN_NO IS NULL)',
'   --AND ((satln_process_id   LIKE ''%''||:P93131090_PROCESS||''%'') OR :P93131090_PROCESS IS NULL)',
'   AND (:P93131090_PROCESS IS NULL OR EXISTS  (SELECT  1',
'                                                 FROM mfg_oprns, mfg_oprns_plnt',
'                                                WHERE mfgo_bu = mfgop_bu',
'                                                  AND mfgo_oprn_id = mfgop_oprn_id',
'                                                  AND mfgop_bu = satln_bu',
'                                                  AND mfgop_plnt = sathd_plnt',
'                                                  AND mfgo_oprn_id = satln_process_id',
'                                                  AND (mfgo_desc1 LIKE ''%''||:P93131090_PROCESS||''%'')))',
'   ORDER BY TO_DATE(SATHD_ORD_DATE) desc ,SATHD_ORD_NO desc,satln_seq_no asc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131090_PLNT,P93131090_PREFIX,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_PROD_ID,P93131090_PROD_DESC,P93131090_SO_PRJ_REF,P93131090_OPRN_NO,P93131090_PROCESS,P93131090_STATUS,P93131090_LO'
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
 p_id=>wwv_flow_imp.id(9475000301370074644)
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
,p_internal_uid=>3993038465826463616
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6743479818348716871)
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
 p_id=>wwv_flow_imp.id(5745742208392821137)
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
 p_id=>wwv_flow_imp.id(9475001521585074656)
,p_db_column_name=>'Item Desc.'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5745742081320821136)
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
 p_id=>wwv_flow_imp.id(7541464559293444242)
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
 p_id=>wwv_flow_imp.id(9475002005456074661)
,p_db_column_name=>'Process'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475000475120074645)
,p_db_column_name=>'SATHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sathd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7303241707828471646)
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
 p_id=>wwv_flow_imp.id(9475003439325074675)
,p_db_column_name=>'SATHD_FILE_NAME'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Sathd File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003334274074674)
,p_db_column_name=>'SATHD_JRNL_FLAG'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Sathd Jrnl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7426071128498572275)
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
 p_id=>wwv_flow_imp.id(5738842436171946071)
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
 p_id=>wwv_flow_imp.id(9475000718267074648)
,p_db_column_name=>'SATHD_ORD_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:9313109001:&SESSION.::&DEBUG.:RR,9313109001:P9313109001_SATHD_ORD_NO,P9313109001_SATHD_STATUS,P9313109001_SATHD_PLNT,P9313109001_SEARCH_TYPE:#SATHD_ORD_NO#,#SATHD_STATUS#,#SATHD_PLNT#,L'
,p_column_linktext=>'#SATHD_ORD_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475002913014074670)
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
 p_id=>wwv_flow_imp.id(9475002802785074669)
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
 p_id=>wwv_flow_imp.id(9475000573757074646)
,p_db_column_name=>'SATHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003588704074676)
,p_db_column_name=>'SATHD_PLNT_LOC_ID'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003626526074677)
,p_db_column_name=>'SATHD_PLNT_LOC_NAME'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003043945074671)
,p_db_column_name=>'SATHD_REFERENCE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003277837074673)
,p_db_column_name=>'SATHD_SOURCE_TYPE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Sathd Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003188017074672)
,p_db_column_name=>'SATHD_STATUS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Sathd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475000894083074650)
,p_db_column_name=>'SATHD_STORE_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Sathd Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755052731533251)
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
 p_id=>wwv_flow_imp.id(9475001363269074654)
,p_db_column_name=>'SATLN_ADJ_PREFIX'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003881072074679)
,p_db_column_name=>'SATLN_ADJ_PROD_ID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Satln Adj Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477752917876533230)
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
 p_id=>wwv_flow_imp.id(9477754940087533250)
,p_db_column_name=>'SATLN_ADJ_PROD_UOM'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Satln Adj Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477756471335533265)
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
 p_id=>wwv_flow_imp.id(9477756181608533262)
,p_db_column_name=>'SATLN_BOM_NAME'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Satln Bom Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477756007504533261)
,p_db_column_name=>'SATLN_BOM_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Satln Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475003764590074678)
,p_db_column_name=>'SATLN_BU'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Satln Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475002343970074664)
,p_db_column_name=>'SATLN_CLASS_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Satln Class Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475002266155074663)
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
 p_id=>wwv_flow_imp.id(9477754132655533242)
,p_db_column_name=>'SATLN_DC_CRE_FLAG'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Satln Dc Cre Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477757363228533274)
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
 p_id=>wwv_flow_imp.id(9477757116491533272)
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
 p_id=>wwv_flow_imp.id(9477757534851533276)
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
 p_id=>wwv_flow_imp.id(9477757623307533277)
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
 p_id=>wwv_flow_imp.id(9477757478264533275)
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
 p_id=>wwv_flow_imp.id(9477757207278533273)
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
 p_id=>wwv_flow_imp.id(9477757750681533278)
,p_db_column_name=>'SATLN_ENG_BOM_FLAG'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Satln Eng Bom Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477756664303533267)
,p_db_column_name=>'SATLN_FG_PROD_ID'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Satln Fg Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477756764865533268)
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
 p_id=>wwv_flow_imp.id(9477756809161533269)
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
 p_id=>wwv_flow_imp.id(9477757837082533279)
,p_db_column_name=>'SATLN_INS_PLAN_NO'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Satln Ins Plan No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477757967525533230)
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
 p_id=>wwv_flow_imp.id(9477754408797533245)
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
 p_id=>wwv_flow_imp.id(9477754079220533241)
,p_db_column_name=>'SATLN_MAT_TYPE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Satln Mat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001798865074659)
,p_db_column_name=>'SATLN_OPRN_LN_SEQ_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Oprn. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001207115074653)
,p_db_column_name=>'SATLN_ORD_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Satln Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477753534935533236)
,p_db_column_name=>'SATLN_ORD_TYPE'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Satln Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477753284111533233)
,p_db_column_name=>'SATLN_OS_ORD_NO'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Satln Os Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477753371790533234)
,p_db_column_name=>'SATLN_OS_ORD_PFX'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Satln Os Ord Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477753868340533239)
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
 p_id=>wwv_flow_imp.id(9477753931983533240)
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
 p_id=>wwv_flow_imp.id(9477755945265533260)
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
 p_id=>wwv_flow_imp.id(9477756356840533264)
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
 p_id=>wwv_flow_imp.id(9477756554625533266)
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
 p_id=>wwv_flow_imp.id(9477753169767533232)
,p_db_column_name=>'SATLN_PO_ORD_NO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Satln Po Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001908796074660)
,p_db_column_name=>'SATLN_PROCESS_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Satln Process Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477753693936533238)
,p_db_column_name=>'SATLN_PRODN_ORD_FLAG'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Satln Prodn Ord Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001406393074655)
,p_db_column_name=>'SATLN_PROD_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Item '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001680783074657)
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
 p_id=>wwv_flow_imp.id(9475002166933074662)
,p_db_column_name=>'SATLN_PROD_UOM'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Satln Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755640830533257)
,p_db_column_name=>'SATLN_PROJ_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Satln Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477752996160533231)
,p_db_column_name=>'SATLN_PROJ_TASK_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Satln Proj Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754609254533247)
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
 p_id=>wwv_flow_imp.id(9475002688046074667)
,p_db_column_name=>'SATLN_REFERENCE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Satln Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477757083266533271)
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
 p_id=>wwv_flow_imp.id(9477756923091533270)
,p_db_column_name=>'SATLN_SC_PROC_ID'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Satln Sc Proc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754756428533248)
,p_db_column_name=>'SATLN_SC_RQRD_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Satln Sc Rqrd Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475001178273074652)
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
 p_id=>wwv_flow_imp.id(9477753603091533237)
,p_db_column_name=>'SATLN_SF_CODE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Satln Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477756280961533263)
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
 p_id=>wwv_flow_imp.id(9477755308743533254)
,p_db_column_name=>'SATLN_SO_NO'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Satln So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755268333533253)
,p_db_column_name=>'SATLN_SO_PFX'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Satln So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755837060533259)
,p_db_column_name=>'SATLN_SO_SCHLD_DESC'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'SO / Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755437723533255)
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
 p_id=>wwv_flow_imp.id(9477755536834533256)
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
 p_id=>wwv_flow_imp.id(9477755125895533252)
,p_db_column_name=>'SATLN_SO_TYPE'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Satln So Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475002706288074668)
,p_db_column_name=>'SATLN_STATUS'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Line Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754825506533249)
,p_db_column_name=>'SATLN_TAR_SF_CODE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Satln Tar Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477755722786533258)
,p_db_column_name=>'SATLN_TASK_ID'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Satln Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754316714533244)
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
 p_id=>wwv_flow_imp.id(9475002489718074665)
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
 p_id=>wwv_flow_imp.id(9475002581167074666)
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
 p_id=>wwv_flow_imp.id(9475001778255074658)
,p_db_column_name=>'SATLN_UOM'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754195864533243)
,p_db_column_name=>'SATLN_UPD_PRODN_QUEUE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Satln Upd Prodn Queue'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477754504833533246)
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
 p_id=>wwv_flow_imp.id(9477753484186533235)
,p_db_column_name=>'SATLN_WORK_CENTER'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Satln Work Center'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6743479729673716870)
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
 p_id=>wwv_flow_imp.id(9475001076139074651)
,p_db_column_name=>'Store'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'WH'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9475000600391074647)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9477855368549580252)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'14197421'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRINT:SATHD_PLNT_LOC_ID:SATHD_PLNT:SATHD_ORD_NO:SATHD_ORD_DATE1:Store:SATLN_SEQ_NO:SATLN_ADJ_PREFIX:SATLN_PROD_ID:Item Desc.:SATLN_PROD_REV:SATLN_UOM:SATLN_OPRN_LN_SEQ_NO:Process:SATLN_TRANS_QTY:SATLN_UNIT_COST:SATLN_SO_SCHLD_DESC:STATUS:SATHD_REFERE'
||'NCE'
,p_sort_column_1=>'SATHD_ORD_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18647456063501184631)
,p_plug_name=>'<b>Result (s)</b> '
,p_static_id=>'b-result-s-b-2'
,p_region_name=>'SA_RPT_HD'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>202
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       SATHD_BU,',
'       SATHD_ORD_NO,',
'       SATHD_STORE_ID,',
'       CASE WHEN sathd_store_id IS NOT NULL THEN',
'        func_find_Store_qry_desc(SATHD_BU,sathd_store_id,1) ',
'       ELSE',
'        NULL END store_desc,',
'       TO_CHAR(sathd_ord_date,:GLOBAL_RPT_DATE_MASK) sathd_ord_date1,',
'       TO_DATE(SATHD_ORD_DATE,''DD-MM-YYYY'')SATHD_ORD_DATE,',
'       SATHD_ORD_YEAR,',
'       SATHD_ORD_PERIOD,',
'       SATHD_REFERENCE,',
'       SATHD_STATUS,',
'       DECODE(SATHD_STATUS,''E'',''Draft'',''C'',''Cancelled'',''N'',''Entry Completed'',''A'',''Approved'')"status",',
'		 DECODE(SATHD_STATUS,''E'',''blue'',''C'',''red'',''N'',''orange'',''A'',''green'','''')"color",',
'       SATHD_PLNT,',
'		 (SELECT BUP_NAME1',
'		    FROM BUS_UNIT_PLANTS',
'			WHERE BUP_BU = SATHD_BU',
'			  AND BUP_PLANT_ID = SATHD_PLNT)Unit,',
'       SATHD_SOURCE_TYPE,',
'       SATHD_JRNL_FLAG,',
'       SATHD_FILE_NAME,',
'       SATHD_CRE_BY,',
'       SATHD_CRE_IP_ADDR,',
'       SATHD_CRE_OS_USER,',
'       SATHD_CRE_DATE,',
'       SATHD_UPD_BY,',
'       SATHD_UPD_IP_ADDR,',
'       SATHD_UPD_OS_USER,',
'       SATHD_UPD_DATE,',
'       SATHD_CRE_EMP_ID,',
'       SATHD_UPD_EMP_ID,',
'		 SATHD_PLNT_LOC_ID,',
'		(SELECT bupld_loc_name',
'  FROM bus_unit_plants_loc_dtls',
' WHERE bupld_bu = :global_bu and bupld_loc_id =SATHD_PLNT_LOC_ID ) loc_name,',
' ''<span aria-hidden="true" class="fa fa-print" style="color: #004153;font-size : 16px "></span>'' Print',
'  from STOCK_ADJ_TRANS_HD',
'WHERE SATHD_BU = :GLOBAL_BU',
'   AND ((sathd_plnt_loc_id LIKE ''%''||:P93131090_LOCATION||''%'') OR :P93131090_LOCATION IS NULL)',
' 	AND ((SATHD_ORD_NO LIKE ''%''||:P93131090_ORDER_NO||''%'') OR :P93131090_ORDER_NO IS NULL)',
'   AND ((SATHD_STATUS LIKE ''%''||:P93131090_STATUS_1||''%'') OR :P93131090_STATUS_1 IS NULL)',
'   AND (SATHD_ORD_DATE >= :P93131090_DATE_FROM OR :P93131090_DATE_FROM IS NULL)',
'   AND (SATHD_ORD_DATE <= :P93131090_DATE_TO OR :P93131090_DATE_TO IS NULL)',
'   AND ((SATHD_STORE_ID  LIKE ''%''||:P93131090_RCVR_WH||''%'') OR :P93131090_RCVR_WH IS NULL)',
'   AND (:P93131090_PLNT IS NULL OR  EXISTS (SELECT 1',
'                      FROM bus_unit_plants',
'                     WHERE bup_bu = :GLOBAL_BU',
'                       AND bup_plant_id = SATHD_PLNT',
'                       AND bup_plant_id = :P93131090_PLNT ))  	  ',
' ORDER BY SATHD_ORD_DATE desc ,SATHD_ORD_NO desc                     '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131090_PLNT,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_HD_LN_TYPE,P93131090_LOCATION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Stock Adjustment (s)</b> '
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
 p_id=>wwv_flow_imp.id(18647455704970184631)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_search_button_label=>'Stock Adjustment'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:9313109001:&SESSION.::&DEBUG.:RP:P9313109001_ROWID:\#ROWID#\'
,p_detail_link_text=>'<center><span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span></center>'
,p_detail_link_condition_type=>'NEVER'
,p_internal_uid=>13165493869426573603
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9129767328956792949)
,p_db_column_name=>'LOC_NAME'
,p_display_order=>63
,p_column_identifier=>'AA'
,p_column_label=>'Location '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8159519394802800337)
,p_db_column_name=>'PRINT'
,p_display_order=>103
,p_column_identifier=>'AE'
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
 p_id=>wwv_flow_imp.id(9005218827099852296)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005218425573852294)
,p_db_column_name=>'SATHD_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Sathd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005213598549852288)
,p_db_column_name=>'SATHD_CRE_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Sathd Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005212565060852286)
,p_db_column_name=>'SATHD_CRE_DATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Sathd Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005210503882852285)
,p_db_column_name=>'SATHD_CRE_EMP_ID'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Sathd Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005213231288852288)
,p_db_column_name=>'SATHD_CRE_IP_ADDR'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Sathd Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005212821648852288)
,p_db_column_name=>'SATHD_CRE_OS_USER'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Sathd Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005214016615852289)
,p_db_column_name=>'SATHD_FILE_NAME'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Sathd File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005214433386852289)
,p_db_column_name=>'SATHD_JRNL_FLAG'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Jrnl.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005217221519852293)
,p_db_column_name=>'SATHD_ORD_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5738842589543946072)
,p_db_column_name=>'SATHD_ORD_DATE1'
,p_display_order=>113
,p_column_identifier=>'AF'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005218080666852294)
,p_db_column_name=>'SATHD_ORD_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Document No.'
,p_column_link=>'f?p=&APP_ID.:9313109001:&SESSION.::&DEBUG.:RR,9313109001:P9313109001_SATHD_ORD_NO,P9313109001_SATHD_STATUS,P9313109001_SATHD_PLNT,P9313109001_SEARCH_TYPE:#SATHD_ORD_NO#,#SATHD_STATUS#,#SATHD_PLNT#,H'
,p_column_linktext=>'#SATHD_ORD_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005216430446852293)
,p_db_column_name=>'SATHD_ORD_PERIOD'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sathd Ord Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005216834554852293)
,p_db_column_name=>'SATHD_ORD_YEAR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Sathd Ord Year'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005215209795852291)
,p_db_column_name=>'SATHD_PLNT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005209781180852282)
,p_db_column_name=>'SATHD_PLNT_LOC_ID'
,p_display_order=>53
,p_column_identifier=>'Z'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005216006787852291)
,p_db_column_name=>'SATHD_REFERENCE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005214891917852289)
,p_db_column_name=>'SATHD_SOURCE_TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005215606578852291)
,p_db_column_name=>'SATHD_STATUS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005217639481852294)
,p_db_column_name=>'SATHD_STORE_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'WH'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005212094159852286)
,p_db_column_name=>'SATHD_UPD_BY'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Sathd Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005210939372852285)
,p_db_column_name=>'SATHD_UPD_DATE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Sathd Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005210115681852283)
,p_db_column_name=>'SATHD_UPD_EMP_ID'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Sathd Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005211693097852286)
,p_db_column_name=>'SATHD_UPD_IP_ADDR'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Sathd Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005211370058852285)
,p_db_column_name=>'SATHD_UPD_OS_USER'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Sathd Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9005219599875852297)
,p_db_column_name=>'STORE_DESC'
,p_display_order=>33
,p_column_identifier=>'X'
,p_column_label=>'WH Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9317913278814379038)
,p_db_column_name=>'UNIT'
,p_display_order=>73
,p_column_identifier=>'AB'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477762566408533276)
,p_db_column_name=>'color'
,p_display_order=>93
,p_column_identifier=>'AD'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9477762415393533275)
,p_db_column_name=>'status'
,p_display_order=>83
,p_column_identifier=>'AC'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style ="color:#color#; font-weight:bold;">#status#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18647445593329172111)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'393144'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRINT:SATHD_PLNT_LOC_ID:SATHD_PLNT:SATHD_ORD_NO:SATHD_ORD_DATE1:SATHD_STORE_ID:STORE_DESC:SATHD_REFERENCE:status'
,p_sort_column_1=>'SATHD_ORD_NO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5932121269079425234)
,p_plug_name=>'Find In'
,p_static_id=>'find-in'
,p_parent_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_region_css_classes=>'BD'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>210
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9514966952785651797)
,p_plug_name=>'Find Stock Adjustment'
,p_static_id=>'find-stock-adjustment'
,p_region_name=>'SA_FND'
,p_parent_plug_id=>wwv_flow_imp.id(7851021009776480906)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7851021009776480906)
,p_plug_name=>'Static'
,p_static_id=>'static'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20716595007527089615)
,p_plug_name=>'Stock Adjustment'
,p_static_id=>'stock-adjustment'
,p_region_css_classes=>'js-dialog-size800x250'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>212
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'STOCK_ADJ_TRANS_HD'
,p_query_where=>'SATHD_BU = :global_bu'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P93131090_SATHD_STATUS in (''N'',''A'',''C'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667176236461262638)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--gapTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667177046686262640)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667228013498262782)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_button_name=>'Clear_hd'
,p_static_id=>'clear-hd'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear '
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667177520828262640)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667227610431262781)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>' fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667228368606262782)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667177837221262640)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Favourite'
,p_static_id=>'favourite'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favourite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition=>':WEB_FAVORITES = ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667215057879262742)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9475000236048074643)
,p_button_name=>'favourite'
,p_static_id=>'favourite-2'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favourite'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667175845061262638)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Fetch_MRV'
,p_static_id=>'fetch-mrv'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Receipt Voucher'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-dial-gauge-chart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667179118249262642)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Find_header'
,p_static_id=>'find-header'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find Header(s)'
,p_button_position=>'CHANGE'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667176692957262640)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Find_Line'
,p_static_id=>'find-line'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667178689893262642)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:93131090:&SESSION.::&DEBUG.:RR,93131090::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667226828557262778)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(18647456063501184631)
,p_button_name=>'Search_hd'
,p_static_id=>'search-hd'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Stock Adjustment'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>' fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667214697708262742)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9475000236048074643)
,p_button_name=>'Search_ln'
,p_static_id=>'search-ln'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667178272964262642)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_button_name=>'Unfavourite'
,p_static_id=>'unfavourite'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--noUI:t-Button--padRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Un favourite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition=>':WEB_FAVORITES =''N'' OR :WEB_FAVORITES IS NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5667215443846262742)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9475000236048074643)
,p_button_name=>'Unfavourite'
,p_static_id=>'unfavourite-2'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Un Favourite'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5667267486390262834)
,p_branch_name=>'Go To Page  Print'
,p_branch_action=>'javascript:jasper();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'SAPRINT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5667267884704262834)
,p_branch_name=>'GOTO 9313109001'
,p_branch_action=>'f?p=&APP_ID.:9313109001:&SESSION.::&DEBUG.::P9313109001_ROWID:&P93131090_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5667227610431262781)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11211227266126875396)
,p_name=>'P93131090_CNT_GEN_LOT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	SELECT COUNT(satln_adj_prefix)',
'	   	FROM stock_adj_trans_ln,stock_adjust_prefixes',
'	 WHERE satln_bu = sap_bu ',
'     AND satln_adj_prefix = sap_prefix',
'     AND satln_bu = :GLOBAL_bu',
'     AND satln_ord_no = :P93131090_SATHD_ORD_NO',
'     AND sap_oper = ''D'';'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980265899651887)
,p_name=>'P93131090_DATE_FROM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'From Date'
,p_format_mask=>'DD-MM-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980413836651888)
,p_name=>'P93131090_DATE_TO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'To Date'
,p_format_mask=>'DD-MM-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8618894539527335649)
,p_name=>'P93131090_DOC_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7851021009776480906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9709174531467456781)
,p_name=>'P93131090_HD_LN_TYPE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9765878940752754266)
,p_name=>'P93131090_LOCATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Loc. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7693130524040879687)
,p_name=>'P93131090_OPRN_NO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Oprn. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980145242651886)
,p_name=>'P93131090_ORDER_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Order No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT SATLN_ORD_NO ',
'  FROM stock_adj_trans_ln',
'  WHERE satln_bu=:GLOBAL_BU',
'    AND SATLN_ORD_NO IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Req. No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8618894398586335648)
,p_name=>'P93131090_PLANT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7851021009776480906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514979999942651884)
,p_name=>'P93131090_PLNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980081266651885)
,p_name=>'P93131090_PREFIX'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Prefix'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7693130655324879688)
,p_name=>'P93131090_PROCESS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Process'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514981177785651896)
,p_name=>'P93131090_PROD_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Item Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10584588359142338997)
,p_name=>'P93131090_PROD_DUM'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514981023968651894)
,p_name=>'P93131090_PROD_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'',
'    options.defaultGridOptions = {',
'',
'        columns: [{',
'            ',
'            PROD_DESC11: {',
'',
'                heading: "Item Desc.",',
'',
'                width: 250,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start"',
'',
'               //  canSort: true,',
'',
'               //  sortDirection: "desc",',
'',
'               // sortIndex: 2',
'                ',
'            },',
'',
'            PROD_ID: {',
'',
'                heading: "Item",',
'',
'                width: 150,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true               ',
'',
'            },',
'',
'           PROD_REV: {',
'',
'                heading: "Rev.",',
'',
'                width: 60,',
'',
'                alignment: "start",',
'',
'                headingAlignment: "start",',
'',
'                canSort: true,',
'',
'                sortDirection: "asc",',
'',
'                sortIndex: 1',
'               ',
'',
'            }',
'				',
'            }',
'',
'                ',
'             ]',
'',
'    };',
'',
'    return options;',
'',
'}           '))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514981126409651895)
,p_name=>'P93131090_PROD_REV'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9709181006175459645)
,p_name=>'P93131090_RADIO_GRP'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(5932121269079425234)
,p_item_default=>'L'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Header ;H,Line(s)      ;L'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-sm:margin-right-lg'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980675642651891)
,p_name=>'P93131090_RCVR_WH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Warehouse'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514980588638651890)
,p_name=>'P93131090_RCVR_WH_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'WH Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074387636536757679)
,p_name=>'P93131090_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074388028124757679)
,p_name=>'P93131090_SATHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074392022875757685)
,p_name=>'P93131090_SATHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074393209859757688)
,p_name=>'P93131090_SATHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074395236286757690)
,p_name=>'P93131090_SATHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':GLOBAL_EMP_ID'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074392397753757687)
,p_name=>'P93131090_SATHD_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':GLOBAL_IP_ADDR'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074392810226757688)
,p_name=>'P93131090_SATHD_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074391640591757685)
,p_name=>'P93131090_SATHD_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074391176997757684)
,p_name=>'P93131090_SATHD_JRNL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'N'
,p_source=>'SATHD_JRNL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074386370232757676)
,p_name=>'P93131090_SATHD_LOC_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ',
'       bupld_loc_name',
'   FROM bus_unit_plants_loc_dtls, ',
'        bus_unit_plants',
'  WHERE bup_bu = bupld_bu',
'    AND bup_plant_id = bupld_plnt',
'    AND bupld_bu = :GLOBAL_bu',
'    AND bupld_actv_loc_flag = ''Y''',
'    AND EXISTS (SELECT 1 FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_user',
'                           AND trunc(sysdate) between  auba_from and  auba_to',
'                           AND auba_plant = bupld_plnt',
'                           AND auba_plnt_loc_id = bupld_loc_id',
'                           AND auba_deflt_flag = ''Y'');	'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'SATHD_PLNT_LOC_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074387212609757679)
,p_name=>'P93131090_SATHD_ORD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Date'
,p_format_mask=>'&GLOBAL_DATE_MASK. '
,p_source=>'SATHD_ORD_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>8
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074388403913757680)
,p_name=>'P93131090_SATHD_ORD_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_ORD_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7541506631191444355)
,p_name=>'P93131090_SATHD_ORD_NO_P'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9475000236048074643)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074389636170757682)
,p_name=>'P93131090_SATHD_ORD_PERIOD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT fp_period FROM fin_periods',
' WHERE',
'  fp_bu = :global_bu AND',
'  To_date(:P93131090_SATHD_ORD_DATE) BETWEEN fp_from_date AND fp_end_date;'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>'SATHD_ORD_PERIOD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074389156342757680)
,p_name=>'P93131090_SATHD_ORD_YEAR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>':global_year'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'SATHD_ORD_YEAR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074386834041757677)
,p_name=>'P93131090_SATHD_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	 bupld_plnt',
'   FROM bus_unit_plants_loc_dtls, ',
'        bus_unit_plants',
'  WHERE bup_bu = bupld_bu',
'    AND bup_plant_id = bupld_plnt',
'    AND bupld_bu = :GLOBAL_bu',
'    AND bupld_actv_loc_flag = ''Y''',
'    AND EXISTS (SELECT 1 FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_user',
'                           AND trunc(sysdate) between  auba_from and  auba_to',
'                           AND auba_plant = bupld_plnt',
'                           AND auba_plnt_loc_id = bupld_loc_id',
'                           AND auba_deflt_flag = ''Y'');	'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Unit'
,p_source=>'SATHD_PLNT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074385942494757674)
,p_name=>'P93131090_SATHD_PLNT_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  bupld_loc_id',
'   FROM bus_unit_plants_loc_dtls, ',
'        bus_unit_plants',
'  WHERE bup_bu = bupld_bu',
'    AND bup_plant_id = bupld_plnt',
'    AND bupld_bu = :GLOBAL_bu',
'    AND bupld_actv_loc_flag = ''Y''',
'    AND EXISTS (SELECT 1 FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_user',
'                           AND trunc(sysdate) between  auba_from and  auba_to',
'                           AND auba_plant = bupld_plnt',
'                           AND auba_plnt_loc_id = bupld_loc_id',
'                           AND auba_deflt_flag = ''Y'');	'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Loc. ID'
,p_source=>'SATHD_PLNT_LOC_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7541506551037444354)
,p_name=>'P93131090_SATHD_PLNT_P'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9475000236048074643)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074390038543757682)
,p_name=>'P93131090_SATHD_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'Stock Adjustment'
,p_prompt=>'Narration'
,p_source=>'SATHD_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074390787592757684)
,p_name=>'P93131090_SATHD_SOURCE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'M'
,p_source=>'SATHD_SOURCE_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074390347713757682)
,p_name=>'P93131090_SATHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_default=>'E'
,p_source=>'SATHD_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074388829306757680)
,p_name=>'P93131090_SATHD_STORE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_prompt=>'Warehouse'
,p_source=>'SATHD_STORE_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_cascade_parent_items=>'P93131090_SATHD_PLNT,P93131090_SATHD_PLNT_LOC_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074393552239757688)
,p_name=>'P93131090_SATHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074394801201757690)
,p_name=>'P93131090_SATHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074395635491757691)
,p_name=>'P93131090_SATHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074394022509757690)
,p_name=>'P93131090_SATHD_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11074394370561757690)
,p_name=>'P93131090_SATHD_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_item_source_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source=>'SATHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5873007811787095575)
,p_name=>'P93131090_SEARCH_TYPE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514981563719651900)
,p_name=>'P93131090_SO_PRJ_REF'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'SO/ Prj. Ref.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT SATLN_SO_SCHLD_DESC ',
'  FROM stock_adj_trans_ln',
'  WHERE satln_bu=:GLOBAL_BU',
'    AND SATLN_SO_SCHLD_DESC IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'SO/ Prj. Ref.'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'SO/ Prj. Ref.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8618894606031335650)
,p_name=>'P93131090_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7851021009776480906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9514981773072651902)
,p_name=>'P93131090_STATUS_1'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;E,Entry Completed;N,Cancelled;C,Approved;A'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7723698381505824132)
,p_name=>'P93131090_STORE_DESC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_prompt=>'WH Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10584588476267338998)
,p_name=>'P93131090_TYPE_1'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(9514966952785651797)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12172159383130536341)
,p_name=>'P93131090_VAR_ADJUST_PFX'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(20716595007527089615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5667246095775262810)
,p_validation_name=>'New_1'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P93131090_SATHD_PLNT_LOC_ID IS NULL THEN',
'  Return ''Location must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(11074385942494757674)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5667246859290262812)
,p_validation_name=>'New_2'
,p_static_id=>'new-2'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF:P93131090_SATHD_REFERENCE IS NULL THEN',
'RETURN(''Narration must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5667227610431262781)
,p_associated_item=>wwv_flow_imp.id(11074390038543757682)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5667245685414262810)
,p_validation_name=>'Unit Validation'
,p_static_id=>'unit-validation'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P93131090_SATHD_PLNT IS  NULL THEN',
'RETURN (''Unit must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_imp.id(5667227610431262781)
,p_associated_item=>wwv_flow_imp.id(11074386834041757677)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5667246484075262810)
,p_validation_name=>'W/H'
,p_static_id=>'w-h'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P93131090_SATHD_STORE_ID IS NULL THEN',
'RETURN ''Warehouse must be entered.'';',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5667227610431262781)
,p_associated_item=>wwv_flow_imp.id(11074388829306757680)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667266478934262832)
,p_name=>'Clear_hd'
,p_static_id=>'clear-hd'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667228013498262782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667266937085262834)
,p_event_id=>wwv_flow_imp.id(5667266478934262832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_SATHD_LOC_NAME,P93131090_SATHD_PLNT,P93131090_SATHD_STORE_ID,P93131090_STORE_DESC,P93131090_SATHD_REFERENCE,P93131090_SATHD_PLNT_LOC_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667253627228262820)
,p_name=>'clr'
,p_static_id=>'clr'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667177046686262640)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667254102906262820)
,p_event_id=>wwv_flow_imp.id(5667253627228262820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_LOCATION,P93131090_PLNT,P93131090_PREFIX,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_RCVR_WH_DESC,P93131090_PROD_ID,P93131090_PROD_DESC,P93131090_SO_PRJ_REF,P93131090_OPRN_NO,P9313'
||'1090_PROCESS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667254552179262820)
,p_event_id=>wwv_flow_imp.id(5667253627228262820)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9514966952785651797)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667255032131262821)
,p_name=>'clr_1'
,p_static_id=>'clr-2'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667214697708262742)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667255497290262821)
,p_event_id=>wwv_flow_imp.id(5667255032131262821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_LOCATION,P93131090_PLNT,P93131090_PREFIX,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_RCVR_WH_DESC,P93131090_PROD_ID,P93131090_PROD_DESC,P93131090_SO_PRJ_REF,P93131090_OPRN_NO,P9313'
||'1090_PROCESS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667255911203262823)
,p_name=>'clr_2'
,p_static_id=>'clr-3'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667226828557262778)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667256426959262823)
,p_event_id=>wwv_flow_imp.id(5667255911203262823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_LOCATION,P93131090_PLNT,P93131090_PREFIX,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_RCVR_WH_DESC,P93131090_PROD_ID,P93131090_PROD_DESC,P93131090_SO_PRJ_REF,P93131090_OPRN_NO,P9313'
||'1090_PROCESS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667249250209262813)
,p_name=>'fetch_find_hd'
,p_static_id=>'fetch-find-hd'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667226828557262778)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667249830017262815)
,p_event_id=>wwv_flow_imp.id(5667249250209262813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_FND").show();',
    'apex.item("SA_RPT_HD").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667248424878262813)
,p_name=>'fetch_find_ln'
,p_static_id=>'fetch-find-ln'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667214697708262742)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667248882650262813)
,p_event_id=>wwv_flow_imp.id(5667248424878262813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_FND").show();',
    'apex.item("SA_RPT").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667250235398262815)
,p_name=>'fetch_rpt'
,p_static_id=>'fetch-rpt'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667176692957262640)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667253224067262818)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_TYPE_1',
  'items_to_submit', 'P93131090_PLNT,P93131090_ORDER_NO,P93131090_PREFIX,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_PROD_DUM,P93131090_STATUS_1,P93131090_LOCATION,P93131090_RCVR_WH_DESC,P93131090_PROD_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    ' /* delete from INV_STOCK_TRANS_VIEW',
    '   WHERE ISTHD_BU = :GLOBAL_BU;  */',
    ' ',
    'proc_ins_mi_srch_dtls3(:GLOBAL_bu,	',
    '                      :P93131090_LOCATION	,',
    '                      :P93131090_PLNT,	',
    '                      :P93131090_ISSUE_TYPE,',
    '                      :P93131090_VOU_NO,	',
    '                      :P93131090_DATE_FROM,	',
    '                      :P93131090_DATE_TO,	',
    '                      :P93131090_RCVR_WH,',
    '                      :P93131090_RCVR_WH_DESC,',
    '                      :P93131090_PROD_DUM,	',
    '                      :P93131090_PROD_DESC,	',
    '                      :P93131090_RCVR_WH,',
    '                      :P93131090_STATUS_1,',
    '                      :GLOBAL_USER,',
    '                      NULL',
    '                      );',
    ':P93131090_TYPE_1 := ''Y'';',
    '',
    'commit;',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667251150104262817)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT_HD").hide();',
    'apex.item("SA_RPT").show();',
    '//apex.jQuery(''#SA_RPT_ir'').interactiveReport("reset");',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P93131090_RADIO_GRP'
,p_client_condition_expression=>'L'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667251694198262817)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT").hide();',
    'apex.item("SA_RPT_HD").show();',
    '//apex.jQuery(''#SA_RPT_HD_ir'').interactiveReport("reset");')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P93131090_RADIO_GRP'
,p_client_condition_expression=>'H'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667252199014262817)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18647456063501184631)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667252733109262818)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9475000236048074643)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667250666582262815)
,p_event_id=>wwv_flow_imp.id(5667250235398262815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_HD_LN_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'Y',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667256816154262823)
,p_name=>'item'
,p_static_id=>'item'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131090_PROD_ID'
,p_condition_element=>'P93131090_PROD_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667257296919262823)
,p_event_id=>wwv_flow_imp.id(5667256816154262823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_PROD_REV,P93131090_PROD_DESC,P93131090_PROD_DUM',
  'items_to_submit', 'P93131090_PROD_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT DISTINCT func_find_prod_qry_desc(:GLOBAL_bu,satln_prod_id,satln_prod_rev,1)item_desc,',
    '       satln_prod_id,',
    '       satln_prod_rev into :P93131090_PROD_DESC, :P93131090_PROD_DUM,:P93131090_PROD_REV',
    '  FROM stock_adj_trans_ln',
    ' WHERE satln_bu =:GLOBAL_bu',
    ' and satln_prod_id/* ||satln_prod_rev  */= :P93131090_PROD_ID;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667258615302262824)
,p_name=>'location'
,p_static_id=>'location'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131090_SATHD_PLNT_LOC_ID'
,p_condition_element=>'P93131090_SATHD_PLNT_LOC_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667259127165262826)
,p_event_id=>wwv_flow_imp.id(5667258615302262824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_SATHD_LOC_NAME,P93131090_SATHD_PLNT',
  'items_to_submit', 'P93131090_SATHD_PLNT_LOC_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT bupld_loc_name,bupld_plnt  into :P93131090_SATHD_LOC_NAME,:P93131090_SATHD_PLNT',
    '  FROM bus_unit_plants_loc_dtls',
    ' WHERE bupld_bu = :GLOBAL_bu',
    '	AND bupld_loc_id = :P93131090_SATHD_PLNT_LOC_ID',
    '   AND bupld_actv_loc_flag = ''Y'';',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667260379883262826)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131090_SATHD_STORE_ID'
,p_condition_element=>'P93131090_SATHD_STORE_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667260914381262828)
,p_event_id=>wwv_flow_imp.id(5667260379883262826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_STORE_DESC',
  'items_to_submit', 'P93131090_SATHD_STORE_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT DISTINCT store_desc1 into :P93131090_STORE_DESC',
    '  FROM stores--, user_store_oper_access',
    '           WHERE store_bu = :GLOBAL_BU',
    '                /*  AND store_physical IN (''Y'',''D'',''V'',''W'',''C'',''S'',''N'',''E'',''K'',''G'',''A'',''R'',''H'',''J'')',
    '                 AND (store_plnt = :P93131090_SATHD_PLNT OR :P93131090_SATHD_PLNT IS NULL)',
    '                 AND NOT EXISTS',
    '                            (SELECT 1',
    '                               FROM suppliers',
    '                              WHERE suplr_bu = store_bu',
    '                                    AND suplr_suplr_id = store_inv_id',
    '                                    AND suplr_transfer_bu = :GLOBAL_BU',
    '                                    AND suplr_transfer_plnt = :P93131090_SATHD_PLNT) */',
    '               and store_id = :P93131090_SATHD_STORE_ID;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667261235633262828)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>140
,p_condition_element=>'P93131090_TYPE_1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667263335086262829)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131090_LOCATION,P93131090_PLNT,P93131090_PREFIX,P93131090_ORDER_NO,P93131090_STATUS_1,P93131090_DATE_FROM,P93131090_DATE_TO,P93131090_RCVR_WH,P93131090_RCVR_WH_DESC,P93131090_PROD_ID,P93131090_PROD_DESC,P93131090_SO_PRJ_REF,P93131090_OPRN_NO,P9313'
||'1090_PROCESS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667264249601262831)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_RADIO_GRP',
  'items_to_submit', 'P93131090_SEARCH_TYPE',
  'language', 'PLSQL',
  'plsql_code', ':P93131090_RADIO_GRP := :P93131090_SEARCH_TYPE;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667262316069262829)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (document.getElementById("P93131090_TYPE_1").value ==''Y''){',
    '//apex.item("SA_FND").hide();',
    'apex.item("SA_RPT_HD").hide();',
    'apex.item("SA_RPT").show();',
    '}',
    'else{',
    '//apex.item("SA_FND").hide();',
    'apex.item("SA_RPT").hide();',
    'apex.item("SA_RPT_HD").show();',
    '}')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667262790858262829)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT_HD").hide();',
    'apex.item("SA_RPT").show();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P93131090_SEARCH_TYPE'
,p_server_condition_expr2=>'L'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667263799689262831)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-javascript-code-3'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT_HD").show();',
    'apex.item("SA_RPT").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P93131090_SEARCH_TYPE'
,p_server_condition_expr2=>'H'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667261832041262828)
,p_event_id=>wwv_flow_imp.id(5667261235633262828)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'L,P93131090_RADIO_GRP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'L')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667264731701262831)
,p_name=>'New_1_1'
,p_static_id=>'new-3'
,p_event_sequence=>150
,p_condition_element=>'P93131090_TYPE_1'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667265220932262831)
,p_event_id=>wwv_flow_imp.id(5667264731701262831)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT_HD").hide();',
    'apex.item("SA_RPT").show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667265564550262832)
,p_name=>'New_1_1_1'
,p_static_id=>'new-4'
,p_event_sequence=>160
,p_condition_element=>'P93131090_TYPE_1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667266042613262832)
,p_event_id=>wwv_flow_imp.id(5667265564550262832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("SA_RPT").hide();',
    'apex.item("SA_RPT_HD").show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667259469270262826)
,p_name=>'open_form'
,p_static_id=>'open-form'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5667176236461262638)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667259970051262826)
,p_event_id=>wwv_flow_imp.id(5667259469270262826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20716595007527089615)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5667257677426262824)
,p_name=>'process'
,p_static_id=>'process'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131090_OPRN_NO'
,p_condition_element=>'P93131090_OPRN_NO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5667258205858262824)
,p_event_id=>wwv_flow_imp.id(5667257677426262824)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131090_PROCESS',
  'items_to_submit', 'P93131090_OPRN_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT DISTINCT func_find_mfg_oper_qry_desc(:GLOBAL_BU,sathd_plnt,satln_process_id,1) PROCESS_DESC into :P93131090_PROCESS',
    '  FROM stock_adj_trans_ln,stock_adj_trans_hd',
    ' WHERE satln_bu =:GLOBAL_BU',
    '   AND sathd_bu = satln_bu ',
    '   AND sathd_ord_no =satln_ord_no ',
    '   AND satln_oprn_ln_seq_no IS NOT NULL',
    '   and satln_oprn_ln_seq_no = :P93131090_OPRN_NO;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5667247615981262812)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No. Generation'
,p_static_id=>'doc-no-generation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE (:P93131090_SATHD_ORD_DATE) > TO_DATE(SYSDATE) THEN',
'Raise_Application_Error (-20999,''Transaction should not be greater than system date.'');',
'ELSIF :P93131090_SATHD_ORD_DATE IS NULL THEN',
'Raise_Application_Error (-20999,''Date must be entered.'');',
'END IF;',
'	',
'   ',
'DECLARE',
'  var_res   VARCHAR2(100);',
'BEGIN',
':P93131090_SATHD_ORD_NO := func_find_pfx_nextno(:global_bu,',
'                                                       TO_DATE(:P93131090_SATHD_ORD_DATE,:GLOBAL_RPT_DATE_MASK),',
'                                                       func_find_vou_dflt_pfx(:global_bu,',
'                                                                              :P93131090_SATHD_PLNT,',
'                                                                              :P93131090_SATHD_PLNT_LOC_ID,',
'                                                                              ''SA'',',
'                                                                              ''SA''',
'                                                                              ),',
'                                                       :global_user);',
'',
'  proc_chk_trans_date(:GLOBAL_bu,TO_DATE(:P93131090_sathd_ord_date,:GLOBAL_RPT_DATE_MASK),''ICM'',var_res,:P93131090_sathd_plnt);',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    proc_apex_err_msg_log(93131090,''Doc. No. Generation'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5667227610431262781)
,p_internal_uid=>185285780437651784
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5667244702359262809)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(20716595007527089615)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Stock Adjustment'
,p_static_id=>'initialize-form-stock-adjustment'
,p_internal_uid=>185282866815651781
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5667247163095262812)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'New'
,p_static_id=>'new'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'target', 'THIS_PAGE')).to_clob
,p_internal_uid=>185285327551651784
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5667247948537262812)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Report'
,p_static_id=>'process-for-report'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':GLOBAL_RPT_SUB_VOU:= ''SA'';',
':GLOBAL_RPT_VOU_NO := :P93131090_SATHD_ORD_NO_P;',
':GLOBAL_RPT_PLNT   := :P93131090_SATHD_PLNT_P;',
':GLOBAL_RPT_TYPE   := ''N'';',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAPRINT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>185286112993651784
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5667245038350262809)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(20716595007527089615)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Stock Adjustment'
,p_static_id=>'process-form-stock-adjustment'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5667227610431262781)
,p_process_success_message=>'&P93131090_SATHD_ORD_NO. -  Document created.'
,p_internal_uid=>185283202806651781
);
wwv_flow_imp.component_end;
end;
/
