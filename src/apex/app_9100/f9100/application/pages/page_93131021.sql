prompt --application/pages/page_93131021
begin
--   Manifest
--     PAGE: 93131021
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
 p_id=>93131021
,p_name=>'Pending MR Lines'
,p_alias=>'PENDING_MR_LINES_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending MR Lines'
,p_warn_on_unsaved_changes=>'N'
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
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close '
,p_dialog_chained=>'N'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14681689784106708795)
,p_plug_name=>'PENDINGMIV'
,p_static_id=>'pendingmiv'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       IMRSV_BU,',
'       IMRSV_RQST_NO,',
'       IMRSV_PLNT,',
'       IMRSV_REF_PLNT,',
'       IMRSV_RQST_DATE,',
'       IMRSV_RQST_YEAR,',
'       IMRSV_RQST_PERIOD,',
'       IMRSV_RQSTTO_STORE_ID,',
'       (SELECt store_desc1',
'         FROM stores',
'        WHERE store_bu = IMRSV_BU',
'          AND store_id = IMRSV_RQSTTO_STORE_ID)Wh_DESC,',
'       IMRSV_RQSTBY_TYPE,',
'       IMRSV_RQSTBY_ID,',
'       IMRSV_HD_STATUS,',
'       IMRSV_HD_REF,',
'       IMRSV_RQST_SEQ_NO,',
'       IMRSV_MAT_TYPE,',
'       CASE IMRSV_MAT_TYPE WHEN ''S'' THEN ''STD''',
'                           WHEN ''F'' THEN ''SFG''',
'       END IMRSV_MAT_TYPE_DESC,',
'       IMRSV_PAR_PROD_ID,',
'       IMRSV_PAR_PROD_REV,',
'       (select prod_desc11 from products where prod_bu = IMRSV_bu and prod_id = imrsv_par_prod_id and prod_rev = imrsv_par_prod_rev) par_item_Desc,',
'       IMRSV_PROD_ID,',
'       IMRSV_PROD_REV,',
'       IMRSV_PROD_DESC1,',
'       IMRSV_PROD_EXT_DESC,',
'       (select prod_ext_desc1 from products where prod_bu = IMRSV_bu and prod_id = IMRSV_PROD_ID and prod_rev = IMRSV_PROD_REV) Item_Desc1,',
'       IMRSV_PROD_CLS,',
'       IMRSV_PROD_SUBCLS,',
'       IMRSV_PROD_UOM,',
'       IMRSV_UOM,',
'       IMRSV_CONV_FACTOR,',
'       IMRSV_ORD_TYPE,',
'       IMRSV_ORD_PFX,',
'       IMRSV_ORD_NO,',
'       IMRSV_ORD_SEQ_NO,',
'       IMRSV_ORD_SUB_SEQ_NO,',
'       IMRSV_ORD_QTY,',
'       IMRSV_UNIT_COST,',
'       IMRSV_RQRD_DATE,',
'       IMRSV_PROC_ID,',
'       IMRSV_PROD_ORD_NO,',
'       IMRSV_SF_CODE,',
'       IMRSV_LN_STATUS,',
'       IMRSV_WC_ID,',
'       IMRSV_PROJ_TASK_ID,',
'       IMRSV_MNT_OPRN_ID,',
'       IMRSV_MNT_TASK_ID,',
'       IMRSV_MNT_WC_ID,',
'       IMRSV_LN_REF,',
'       IMRSV_MI_METHOD,',
'       IMRSV_SO_TYPE,',
'       IMRSV_SO_PFX,',
'       IMRSV_SO_NO,',
'       IMRSV_SO_SEQ_NO,',
'       IMRSV_SO_SUB_SEQ_NO,',
'       IMRSV_PROJ_ID,',
'       IMRSV_TASK_ID,',
'       IMRSV_SYS_LS_NO,',
'       IMRSV_LOT_NO,',
'       IMRSV_SER_NO,',
'       IMRSV_EXPIRY_DATE,',
'       IMRSV_NO_OF_BALE,',
'       IMRSV_RQST_QTY,',
'       IMRSV_ALLOC_QTY,',
'		 ( (imrsv_rqst_qty + imrsv_excs_qty) ',
'                                            - (imrsv_alloc_qty + imrsv_iss_qty + imrsv_cls_qty - imrsv_rtn_qty )) IMRSV_TOALLOC_QTY,',
'       IMRSV_ISS_QTY,',
'       IMRSV_EXCS_QTY,',
'       IMRSV_CLS_QTY,',
'       IMRSV_RTN_QTY,',
'       IMRSV_SEL_FLAG,',
'       IMRSV_SEL_USER,',
'       IMRSV_CRE_BY,',
'       IMRSV_CRE_DATE,',
'       IMRSV_UPD_BY,',
'       IMRSV_UPD_DATE,',
'       IMRSV_RES_ID,',
'       IMRSV_SHIFT_ID,',
'       IMRSV_REC_SOURCE,',
'       IMRSV_SO_SCHLD_DESC,',
'       IMRSV_TRANS_NO,',
'       IMRSV_CAP_ASSET_ID,',
'       IMRSV_JOB_ORD_NO,',
'       IMRSV_PAR_BATCH_NO,',
'       IMRSV_ISS_CODE,',
'       IMRSV_MIX_DOC_NO,',
'       IMRSV_PR_PFX,',
'       IMRSV_PR_NO,',
'       IMRSV_PR_SEQ_NO,',
'       IMRSV_FCM_BL_ID,',
'       IMRSV_FCM_PROJ_NO,',
'       IMRSV_SWO_TYPE,',
'       IMRSV_SUBSTIT_ITEM_FLAG,',
'       IMRSV_THICKNESS,',
'       IMRSV_WIDTH,',
'       IMRSV_LENGTH,',
'       IMRSV_CSR_DOC_NO,',
'       IMRSV_EMP_ID,',
'       IMRSV_BIN_ID,',
'       IMRSV_CRATE_ID,',
'       IMRSV_AEN_TYPE,',
'       IMRSV_BOQ_REF_NO,',
'       IMRSV_BOQ_SEQ_NO,',
'       IMRSV_BOQ_SUB_SEQ_NO,',
'       IMRSV_BOQ_REF_TEST_NO,',
'       IMRSV_CUST_PROD_ID,',
'       IMRSV_CUST_PROD_DESC,',
'       IMRSV_EQPMT_ID,',
'       IMRSV_OPRN_LN_SEQ_NO,',
'       IMRSV_MR_TYPE,',
'       IMRSV_RQSTBY_ENTITY,',
'		 IMRSV_DRAWING_NO,',
'IMRSV_DRAWING_REV,',
'       NVL (ROUND (func_find_curr_stk_hand (imrsv_bu,',
'                                     imrsv_rqstto_store_id,',
'                                     imrsv_prod_id,',
'                                     imrsv_prod_rev,',
'                                     imrsv_mat_type,',
'                                     imrsv_prod_ord_no,',
'                                     imrsv_sf_code,',
'                                     imrsv_sys_ls_no)',
'                                  *  imrsv_conv_factor,3),0) stk_qty,',
'       (SELECT NVL (SUM ( (sfsos_qty - sfsos_allocated_qty)), 0)',
'          FROM store_sf_stocks, store_sf_so_stock',
'         WHERE stsfs_bu = sfsos_bu',
'           AND stsfs_trans_no = sfsos_trans_no',
'           AND stsfs_bu = imrsv_bu',
'           AND stsfs_store_id = imrsv_rqstto_store_id',
'           AND stsfs_prod_id = imrsv_prod_id',
'           AND stsfs_prod_rev = imrsv_prod_rev',
'           AND (stsfs_ord_no = imrsv_prod_ord_no OR (stsfs_ord_no IS NULL AND imrsv_prod_ord_no IS NULL))',
'           AND stsfs_sf_code = imrsv_sf_code',
'           AND sfsos_so_prefix = imrsv_so_pfx',
'           AND sfsos_so_no = imrsv_so_no',
'           AND sfsos_so_seq_no = imrsv_so_seq_no',
'           AND sfsos_so_sub_seq_no = imrsv_so_sub_seq_no',
'           AND (stsfs_sys_ls_no = imrsv_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND imrsv_sys_ls_no IS NULL)))',
'       so_stk_qty',
'  FROM INV_MAT_RQST_SO_VIEW',
' WHERE imrsv_bu =:global_bu ',
'   AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty)) > 0',
'   AND imrsv_plnt IN  (SELECT auba_plant FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_user',
'                           AND trunc(sysdate) between  auba_from and  auba_to)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131021_SHOW_FIND,P93131021_LOCATION,P93131021_UNIT,P93131021_MR_NO,P93131021_ORD_NO,P93131021_WH,P93131021_SF_CODE,P93131021_ORDER_TYPE,P93131021_TYPE,P93131021_ITEM,P93131021_ITEM_DESC,P93131021_IMRSV_MAT_TYPE,P93131021_MR_FROM_DATE,P93131021_MR_'
||'FROM_TO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PENDINGMIV'
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
 p_id=>wwv_flow_imp.id(14681689843602708795)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>9199728008059097767
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963720195737518279)
,p_db_column_name=>'IMRSV_AEN_TYPE'
,p_display_order=>94
,p_column_identifier=>'CP'
,p_column_label=>'Imrsv Aen Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963683567962518074)
,p_db_column_name=>'IMRSV_ALLOC_QTY'
,p_display_order=>144
,p_column_identifier=>'DE'
,p_column_label=>'Allocated'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963719399725518273)
,p_db_column_name=>'IMRSV_BIN_ID'
,p_display_order=>92
,p_column_identifier=>'CN'
,p_column_label=>'Imrsv Bin Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963720575861518281)
,p_db_column_name=>'IMRSV_BOQ_REF_NO'
,p_display_order=>95
,p_column_identifier=>'CQ'
,p_column_label=>'Imrsv Boq Ref No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963721694906518287)
,p_db_column_name=>'IMRSV_BOQ_REF_TEST_NO'
,p_display_order=>98
,p_column_identifier=>'CT'
,p_column_label=>'Imrsv Boq Ref Test No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963720949732518284)
,p_db_column_name=>'IMRSV_BOQ_SEQ_NO'
,p_display_order=>96
,p_column_identifier=>'CR'
,p_column_label=>'Imrsv Boq Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963721360423518285)
,p_db_column_name=>'IMRSV_BOQ_SUB_SEQ_NO'
,p_display_order=>97
,p_column_identifier=>'CS'
,p_column_label=>'Imrsv Boq Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963683998893518076)
,p_db_column_name=>'IMRSV_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Imrsv Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963712522887518231)
,p_db_column_name=>'IMRSV_CAP_ASSET_ID'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Imrsv Cap Asset Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963707404368518204)
,p_db_column_name=>'IMRSV_CLS_QTY'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Cls. Qty.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963693427775518123)
,p_db_column_name=>'IMRSV_CONV_FACTOR'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Imrsv Conv Factor'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963719735619518276)
,p_db_column_name=>'IMRSV_CRATE_ID'
,p_display_order=>93
,p_column_identifier=>'CO'
,p_column_label=>'Imrsv Crate Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963709009440518214)
,p_db_column_name=>'IMRSV_CRE_BY'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Imrsv Cre By'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963709384243518215)
,p_db_column_name=>'IMRSV_CRE_DATE'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Imrsv Cre Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963718570670518270)
,p_db_column_name=>'IMRSV_CSR_DOC_NO'
,p_display_order=>90
,p_column_identifier=>'CL'
,p_column_label=>'Imrsv Csr Doc No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963722502527518289)
,p_db_column_name=>'IMRSV_CUST_PROD_DESC'
,p_display_order=>100
,p_column_identifier=>'CV'
,p_column_label=>'Imrsv Cust Prod Desc'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963722020431518287)
,p_db_column_name=>'IMRSV_CUST_PROD_ID'
,p_display_order=>99
,p_column_identifier=>'CU'
,p_column_label=>'Imrsv Cust Prod Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9589092389949356342)
,p_db_column_name=>'IMRSV_DRAWING_NO'
,p_display_order=>254
,p_column_identifier=>'DR'
,p_column_label=>'Dwg. No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9589092426433356343)
,p_db_column_name=>'IMRSV_DRAWING_REV'
,p_display_order=>264
,p_column_identifier=>'DS'
,p_column_label=>'Dwg. Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963719010020518271)
,p_db_column_name=>'IMRSV_EMP_ID'
,p_display_order=>91
,p_column_identifier=>'CM'
,p_column_label=>'Imrsv Emp Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963722875476518290)
,p_db_column_name=>'IMRSV_EQPMT_ID'
,p_display_order=>101
,p_column_identifier=>'CW'
,p_column_label=>'Imrsv Eqpmt Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963707005146518201)
,p_db_column_name=>'IMRSV_EXCS_QTY'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Imrsv Excs Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963705425733518184)
,p_db_column_name=>'IMRSV_EXPIRY_DATE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Imrsv Expiry Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963715758193518249)
,p_db_column_name=>'IMRSV_FCM_BL_ID'
,p_display_order=>83
,p_column_identifier=>'CE'
,p_column_label=>'Imrsv Fcm Bl Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963716132329518253)
,p_db_column_name=>'IMRSV_FCM_PROJ_NO'
,p_display_order=>84
,p_column_identifier=>'CF'
,p_column_label=>'Imrsv Fcm Proj No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963688229441518099)
,p_db_column_name=>'IMRSV_HD_REF'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Imrsv Hd Ref'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963687858347518098)
,p_db_column_name=>'IMRSV_HD_STATUS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Imrsv Hd Status'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963713787182518239)
,p_db_column_name=>'IMRSV_ISS_CODE'
,p_display_order=>78
,p_column_identifier=>'BZ'
,p_column_label=>'Imrsv Iss Code'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963706569125518199)
,p_db_column_name=>'IMRSV_ISS_QTY'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Issued'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963712986265518232)
,p_db_column_name=>'IMRSV_JOB_ORD_NO'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Imrsv Job Ord No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963718179494518267)
,p_db_column_name=>'IMRSV_LENGTH'
,p_display_order=>89
,p_column_identifier=>'CK'
,p_column_label=>'Imrsv Length'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963700623686518159)
,p_db_column_name=>'IMRSV_LN_REF'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Imrsv Ln Ref'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963698227804518148)
,p_db_column_name=>'IMRSV_LN_STATUS'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Imrsv Ln Status'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963704634658518178)
,p_db_column_name=>'IMRSV_LOT_NO'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Imrsv Lot No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963689067678518103)
,p_db_column_name=>'IMRSV_MAT_TYPE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Type ID'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963682313871518062)
,p_db_column_name=>'IMRSV_MAT_TYPE_DESC'
,p_display_order=>114
,p_column_identifier=>'DA'
,p_column_label=>'Mat. Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963714194557518242)
,p_db_column_name=>'IMRSV_MIX_DOC_NO'
,p_display_order=>79
,p_column_identifier=>'CA'
,p_column_label=>'Imrsv Mix Doc No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963701016615518160)
,p_db_column_name=>'IMRSV_MI_METHOD'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Imrsv Mi Method'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963699493119518153)
,p_db_column_name=>'IMRSV_MNT_OPRN_ID'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Imrsv Mnt Oprn Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963699859908518154)
,p_db_column_name=>'IMRSV_MNT_TASK_ID'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Imrsv Mnt Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963700241126518157)
,p_db_column_name=>'IMRSV_MNT_WC_ID'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Imrsv Mnt Wc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963723699899518293)
,p_db_column_name=>'IMRSV_MR_TYPE'
,p_display_order=>103
,p_column_identifier=>'CY'
,p_column_label=>'Imrsv Mr Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963705717375518193)
,p_db_column_name=>'IMRSV_NO_OF_BALE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Imrsv No Of Bale'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963723225587518292)
,p_db_column_name=>'IMRSV_OPRN_LN_SEQ_NO'
,p_display_order=>102
,p_column_identifier=>'CX'
,p_column_label=>'Imrsv Oprn Ln Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963694685145518132)
,p_db_column_name=>'IMRSV_ORD_NO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Imrsv Ord No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963694286840518131)
,p_db_column_name=>'IMRSV_ORD_PFX'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Imrsv Ord Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963695832751518137)
,p_db_column_name=>'IMRSV_ORD_QTY'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Imrsv Ord Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963695046161518134)
,p_db_column_name=>'IMRSV_ORD_SEQ_NO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Imrsv Ord Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963695467839518135)
,p_db_column_name=>'IMRSV_ORD_SUB_SEQ_NO'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Imrsv Ord Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963693871579518128)
,p_db_column_name=>'IMRSV_ORD_TYPE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Imrsv Ord Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963713321966518237)
,p_db_column_name=>'IMRSV_PAR_BATCH_NO'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Imrsv Par Batch No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963689437770518103)
,p_db_column_name=>'IMRSV_PAR_PROD_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Parent Item'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963689881015518107)
,p_db_column_name=>'IMRSV_PAR_PROD_REV'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Parent Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963684732919518084)
,p_db_column_name=>'IMRSV_PLNT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Imrsv Plnt'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963697070738518140)
,p_db_column_name=>'IMRSV_PROC_ID'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Imrsv Proc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963691886820518117)
,p_db_column_name=>'IMRSV_PROD_CLS'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Imrsv Prod Cls'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963691030447518112)
,p_db_column_name=>'IMRSV_PROD_DESC1'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Item Desc.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963691476899518115)
,p_db_column_name=>'IMRSV_PROD_EXT_DESC'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Item Ext. Description'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963690219801518109)
,p_db_column_name=>'IMRSV_PROD_ID'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Item'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963697490936518142)
,p_db_column_name=>'IMRSV_PROD_ORD_NO'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Prod .Ord .No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963690612812518110)
,p_db_column_name=>'IMRSV_PROD_REV'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963692290552518118)
,p_db_column_name=>'IMRSV_PROD_SUBCLS'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Imrsv Prod Subcls'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963692652863518120)
,p_db_column_name=>'IMRSV_PROD_UOM'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Imrsv Prod Uom'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963703431891518170)
,p_db_column_name=>'IMRSV_PROJ_ID'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Imrsv Proj Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963699084667518153)
,p_db_column_name=>'IMRSV_PROJ_TASK_ID'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Imrsv Proj Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963714986143518248)
,p_db_column_name=>'IMRSV_PR_NO'
,p_display_order=>81
,p_column_identifier=>'CC'
,p_column_label=>'PR No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963714565409518246)
,p_db_column_name=>'IMRSV_PR_PFX'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Imrsv Pr Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963715379118518248)
,p_db_column_name=>'IMRSV_PR_SEQ_NO'
,p_display_order=>82
,p_column_identifier=>'CD'
,p_column_label=>'Imrsv Pr Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963711358030518224)
,p_db_column_name=>'IMRSV_REC_SOURCE'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Imrsv Rec Source'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963685157559518085)
,p_db_column_name=>'IMRSV_REF_PLNT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Imrsv Ref Plnt'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963710559712518221)
,p_db_column_name=>'IMRSV_RES_ID'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Imrsv Res Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963696655667518139)
,p_db_column_name=>'IMRSV_RQRD_DATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Imrsv Rqrd Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963724091849518298)
,p_db_column_name=>'IMRSV_RQSTBY_ENTITY'
,p_display_order=>104
,p_column_identifier=>'CZ'
,p_column_label=>'Imrsv Rqstby Entity'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963687412121518096)
,p_db_column_name=>'IMRSV_RQSTBY_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Imrsv Rqstby Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963687104901518095)
,p_db_column_name=>'IMRSV_RQSTBY_TYPE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Imrsv Rqstby Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963686660273518093)
,p_db_column_name=>'IMRSV_RQSTTO_STORE_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Imrsv Rqstto Store Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963685447102518087)
,p_db_column_name=>'IMRSV_RQST_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'MR Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963684365245518079)
,p_db_column_name=>'IMRSV_RQST_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'MR. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963686279304518089)
,p_db_column_name=>'IMRSV_RQST_PERIOD'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Imrsv Rqst Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963706170788518196)
,p_db_column_name=>'IMRSV_RQST_QTY'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Requested'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963688703816518101)
,p_db_column_name=>'IMRSV_RQST_SEQ_NO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963685906017518087)
,p_db_column_name=>'IMRSV_RQST_YEAR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Imrsv Rqst Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963707789647518206)
,p_db_column_name=>'IMRSV_RTN_QTY'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Returned'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963708153064518209)
,p_db_column_name=>'IMRSV_SEL_FLAG'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Imrsv Sel Flag'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963708546732518212)
,p_db_column_name=>'IMRSV_SEL_USER'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Imrsv Sel User'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963705111472518181)
,p_db_column_name=>'IMRSV_SER_NO'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Imrsv Ser No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963697828727518146)
,p_db_column_name=>'IMRSV_SF_CODE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Imrsv Sf Code'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963710939237518223)
,p_db_column_name=>'IMRSV_SHIFT_ID'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Imrsv Shift Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963702230007518165)
,p_db_column_name=>'IMRSV_SO_NO'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Imrsv So No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963701835444518164)
,p_db_column_name=>'IMRSV_SO_PFX'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Imrsv So Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963711784152518228)
,p_db_column_name=>'IMRSV_SO_SCHLD_DESC'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Imrsv So Schld Desc'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963702614743518167)
,p_db_column_name=>'IMRSV_SO_SEQ_NO'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Imrsv So Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963703029415518168)
,p_db_column_name=>'IMRSV_SO_SUB_SEQ_NO'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Imrsv So Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963701486658518162)
,p_db_column_name=>'IMRSV_SO_TYPE'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Imrsv So Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963716940992518257)
,p_db_column_name=>'IMRSV_SUBSTIT_ITEM_FLAG'
,p_display_order=>86
,p_column_identifier=>'CH'
,p_column_label=>'Imrsv Substit Item Flag'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963716557702518254)
,p_db_column_name=>'IMRSV_SWO_TYPE'
,p_display_order=>85
,p_column_identifier=>'CG'
,p_column_label=>'Imrsv Swo Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963704214986518174)
,p_db_column_name=>'IMRSV_SYS_LS_NO'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Imrsv Sys Ls No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963703854389518173)
,p_db_column_name=>'IMRSV_TASK_ID'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Imrsv Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963717384885518260)
,p_db_column_name=>'IMRSV_THICKNESS'
,p_display_order=>87
,p_column_identifier=>'CI'
,p_column_label=>'Imrsv Thickness'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963681983906518059)
,p_db_column_name=>'IMRSV_TOALLOC_QTY'
,p_display_order=>234
,p_column_identifier=>'DP'
,p_column_label=>'Imrsv Toalloc Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963712177088518229)
,p_db_column_name=>'IMRSV_TRANS_NO'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Imrsv Trans No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963696221838518137)
,p_db_column_name=>'IMRSV_UNIT_COST'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Imrsv Unit Cost'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963693098805518121)
,p_db_column_name=>'IMRSV_UOM'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'UOM'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963709751167518217)
,p_db_column_name=>'IMRSV_UPD_BY'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Imrsv Upd By'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963710115014518220)
,p_db_column_name=>'IMRSV_UPD_DATE'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Imrsv Upd Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963698669694518149)
,p_db_column_name=>'IMRSV_WC_ID'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Imrsv Wc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963717769304518265)
,p_db_column_name=>'IMRSV_WIDTH'
,p_display_order=>88
,p_column_identifier=>'CJ'
,p_column_label=>'Imrsv Width'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6074397976741134758)
,p_db_column_name=>'ITEM_DESC1'
,p_display_order=>324
,p_column_identifier=>'DY'
,p_column_label=>'Item Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5759808204584109042)
,p_db_column_name=>'PAR_ITEM_DESC'
,p_display_order=>334
,p_column_identifier=>'DZ'
,p_column_label=>'Parent  Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9166094889359494476)
,p_db_column_name=>'ROWID'
,p_display_order=>244
,p_column_identifier=>'DQ'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963683129525518073)
,p_db_column_name=>'SO_STK_QTY'
,p_display_order=>134
,p_column_identifier=>'DC'
,p_column_label=>'SO Stock'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8963682811338518071)
,p_db_column_name=>'STK_QTY'
,p_display_order=>124
,p_column_identifier=>'DB'
,p_column_label=>'Stock'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7467823605547727945)
,p_db_column_name=>'WH_DESC'
,p_display_order=>284
,p_column_identifier=>'DU'
,p_column_label=>'WH'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14681731722819709201)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50671152'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IMRSV_MAT_TYPE_DESC:IMRSV_RQST_NO:IMRSV_RQST_SEQ_NO:IMRSV_RQST_DATE:IMRSV_PROD_ID:IMRSV_PROD_REV:IMRSV_PROD_DESC1:ITEM_DESC1:IMRSV_UOM:WH_DESC:IMRSV_RQST_QTY:IMRSV_ALLOC_QTY:IMRSV_ISS_QTY:IMRSV_RTN_QTY:IMRSV_CLS_QTY:IMRSV_PR_NO:IMRSV_PROD_ORD_NO:IMRS'
||'V_PAR_PROD_ID:IMRSV_PAR_PROD_REV:PAR_ITEM_DESC'
,p_sort_column_1=>'IMRSV_RQST_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'IMRSV_RQST_NO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'IMRSV_RQST_SEQ_NO'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5977427783057098270)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14681689784106708795)
,p_button_name=>'Close_Button'
,p_static_id=>'close-button'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5977427841498098271)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5977427783057098270)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5977427976146098272)
,p_event_id=>wwv_flow_imp.id(5977427841498098271)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
