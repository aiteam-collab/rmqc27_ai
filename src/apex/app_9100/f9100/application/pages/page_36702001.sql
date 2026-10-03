prompt --application/pages/page_36702001
begin
--   Manifest
--     PAGE: 36702001
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
 p_id=>36702001
,p_name=>'Items'
,p_alias=>'OPEN-ITEMS'
,p_page_mode=>'MODAL'
,p_step_title=>'Open Items'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table tr td {',
'    font-size: 1.1rem;',
'    font-weight: 600;',
'    font-family: system-ui;',
'    white-space: nowrap;',
'}',
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'    white-space: nowrap;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21262636582490397647)
,p_plug_name=>'Items'
,p_static_id=>'items'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PROD_BU,',
'       PROD_ID,',
'       PROD_DESC11,',
'       PROD_DESC21,',
'       PROD_SALE_DESC1,',
'       PROD_SALE_DESC2,',
'       PROD_REV,',
'       PROD_STOCKED,',
'       PROD_STATUS,',
'       DECODE(PROD_COST_METHOD,''FIFO'',''FIFO'',''LIFO'',''LIFO'',''MAC'',''Moving Average Cost'') PROD_COST_METHOD,',
'       PROD_UOM,',
'       (SELECT uom_desc1',
'        FROM unit_of_measures',
'       WHERE uom_bu = :GLOBAL_bu AND uom_uom = PROD_UOM)"UOM",',
'       PROD_SIZE_UOM,',
'       PROD_WIDTH,',
'       PROD_LENGTH,',
'       PROD_HEIGHT,',
'       PROD_WEIGHT_UOM,',
'       PROD_GROSS_WEIGHT,',
'       PROD_NET_WEIGHT,',
'       PROD_SHRINK_PCT,',
'       PROD_FLAMMABLE,',
'       PROD_FREEZABLE,',
'       PROD_HAZARDOUS,',
'       PROD_EXPR_FLAG,',
'       PROD_EXPR_FREQ,',
'       PROD_EXPR_PER,',
'       DECODE(PROD_SER_LOT_OPT,''N'',''N/A'',''L'',''Lot'',''S'',''Serial'') PROD_SER_LOT_OPT,',
'       PROD_LOT_NEXT_NO,',
'       PROD_SER_NEXT_NO,',
'       PROD_RFQ,',
'       PROD_SALEABLE,',
'       PROD_PO_LR_TOLR,',
'       PROD_LOW_PRICE,',
'       PROD_HIGH_PRICE,',
'       PROD_LAST_PO_PRICE,',
'       PROD_LAST_GRN_PRICE,',
'       PROD_LAST_GRN_QTY,',
'       PROD_SERV_SCHLD_FLAG,',
'       PROD_PARTS_COVER_FLAG,',
'       PROD_DRAWING_NO,',
'       PROD_DEFLT_SC_SUPLR_ID,',
'       PROD_MFG_LEAD_TIME,',
'       PROD_RLT_TIME,',
'       PROD_CFG_FLAG,',
'       PROD_VAR_FLAG,',
'       PROD_WARR_TYPE,',
'       PROD_WARR_PER,',
'       PROD_LOT_SIZE_TYPE,',
'       PROD_LOT_SIZE,',
'       PROD_SCHLD_FLAG,',
'       PROD_CO_FLAG,',
'       PROD_ATP_FLAG,',
'       PROD_CONS_MTHD,',
'       DECODE(PROD_CB_LEVEL,''N'',''NA'',''B'',''Batch'',''L'',''Lot'') PROD_CB_LEVEL,',
'       PROD_CONS_DAYS,',
'       PROD_FLOAT_BFR_DAYS,',
'       PROD_FLOAT_AFT_DAYS,',
'       PROD_STRATEGY,',
'       PROD_COST_CAT,',
'       PROD_COST_WEIGHT,',
'       PROD_PR_PO_FLAG,',
'       PROD_REV_DATE,',
'       PROD_QUOTE_FREQUENCY,',
'       PROD_QUOTE_FREQ_VALUE,',
'       PROD_QUOTE_NEXT_CALL_DATE,',
'       PROD_LAST_PUR_PRICE,',
'       PROD_LAST_LBR_COST,',
'       PROD_MFG_BATCH_TYPE,',
'       PROD_MFG_ORD_FLAG,',
'       PROD_TOLR_TYPE,',
'       PROD_PR_PO_TOLR,',
'       PROD_SHELF_LIFE_FREQ,',
'       PROD_SHELF_FREQ_PERIOD,',
'       DECODE(PROD_SER_NO_OPT,''N'',''N/A'',''M'',''Manual Entry'',''G'',''Group'',''P'',''Item'',''U'',''Rule Based'',''T'',''Child Lot'')PROD_SER_NO_OPT,',
'       PROD_ABC_CLS,',
'       PROD_SCRAP_PROD_ID,',
'       PROD_SCRAP_PROD_REV,',
'       PROD_ORD_QTY,',
'       PROD_ORD_INFLU,',
'       PROD_LEAD_TIME_SOURCE,',
'       PROD_FV_CLS,',
'       PROD_MFG_BATCH_QTY,',
'       PROD_FWD_CONS_DAYS,',
'       PROD_BWD_CONS_DAYS,',
'       PROD_STD_COST,',
'       PROD_MIN_ISSUE_QTY,',
'       PROD_MFG_METHOD,',
'       PROD_ORDERING_COST,',
'       PROD_CARRYING_COST,',
'       PROD_PTF,',
'       PROD_RTF,',
'       PROD_DTF,',
'       PROD_PTF_DAY,',
'       PROD_RTF_DAY,',
'       PROD_DTF_DAY,',
'       PROD_SER_PFX,',
'       PROD_LOT_PFX,',
'       PROD_CONS_TYPE,',
'       PROD_VAR_GROUP,',
'       PROD_WARR_FLAG,',
'       PROD_RULE_ID,',
'       PROD_CONTAINERS_FLAG,',
'       PROD_CONTAINERS_TYPE,',
'       PROD_MARKET_COST,',
'       PROD_GAR_CATEGORY,',
'       PROD_GAR_STYLE,',
'       PROD_GAR_COLOR,',
'       PROD_GAR_SIZE,',
'       PROD_GAR_TYPE,',
'       PROD_INDICATOR,',
'       PROD_PRTN_TFER,',
'       PROD_GAR_DIA,',
'       PROD_GAR_GSM,',
'       PROD_GAR_STRCT_ID,',
'       PROD_GAR_CNTNT_ID,',
'       PROD_GAR_COUNT,',
'       PROD_HS_CODE,',
'       PROD_VAR_OPT,',
'       PROD_SER_LOT_CRE_OPT,',
'       PROD_SOB,',
'       PROD_MAT_SPEC,',
'       PROD_DRG_REV,',
'       PROD_MPS_MRP,',
'       DECODE(PROD_STATUS,''E'',''blue'',''N'',''#a529a5'',''O'',''Orange'',''A'',''green'',''I'',''red'') "color",',
'       Decode(PROD_STATUS,''E'',''Draft'',''A'',''Active'',''O'',''Obsolete'',''I'',''Inactive'',''N'',''Entry Completed'')"Status" ,',
'       PROD_MAJOR_CLS,',
'       (SELECT mc_mjr_cls_desc',
'          FROM mjr_classes',
'         WHERE mc_bu 	     = :Global_bu',
'           AND mc_mjr_cls_id = PROD_MAJOR_CLS)"Major class",',
'       PROD_SUBGROUP_ID,',
'       (SELECT DECODE(func_find_appl_cntrl(:GLOBAL_bu),1,psgrp_subgroup_desc1,',
'													 NVL(psgrp_subgroup_desc2,psgrp_subgroup_desc1)) sub_grp_desc',
'  FROM prod_sub_group',
' WHERE psgrp_bu = :GLOBAL_bu ',
'   AND psgrp_subgroup_id = PROD_SUBGROUP_ID)"Sub Group",',
'       PROD_GROUP_ID,',
'       ( SELECT pgrp_group_desc1',
'        FROM prod_group',
'       WHERE pgrp_bu = :Global_bu AND pgrp_group_id = PROD_GROUP_ID)"Group",',
'       PROD_LOT_SIZE_DAY,',
'       PROD_LIFO_NEXT_NO,',
'       PROD_FIFO_NEXT_NO,',
'       PROD_GRADE_ID,',
'       PROD_VOLUME_UOM,',
'       PROD_VOLUME_UNIT,',
'       PROD_INT_VOLUME,',
'       PROD_MAX_LOAD_WEIGHT,',
'       PROD_MIN_FILL_PCT,',
'       PROD_EXT_DESC1,',
'       PROD_EXT_DESC2,',
'       PROD_RELS_TYPE,',
'       PROD_PUR_WITH_MAT,',
'       PROD_RET_FLAG,',
'       PROD_SPN_ITEM_TYPE,',
'       PROD_SPN_THICKNESS,',
'       PROD_BLEND_TYPE,',
'       PROD_SPN_DENIER,',
'       PROD_CUT_LENGTH,',
'       PROD_FAB_ITEM_TYPE,',
'       PROD_INNER_DIA,',
'       PROD_OUTER_DIA,',
'       PROD_ANGLE_SIDE1,',
'       PROD_ANGLE_SIDE2,',
'       PROD_MRKT_STD_FLAG,',
'       PROD_SCHEDULE,',
'       PROD_KANBAN_TYPE,',
'       PROD_FOR_PROC_DESC,',
'       PROD_MATERIAL,',
'       PROD_HUB_THICK,',
'       PROD_MAKE_ID,',
'       PROD_MODEL,',
'       PROD_ID_PLNG_PCT,',
'       PROD_CUST_DRG_NO,',
'       PROD_CUST_DRG_REV,',
'       PROD_OEM_DRG_NO,',
'       PROD_OEM_DRG_REV,',
'       PROD_DRG_DATE,',
'       PROD_CUST_DRG_DATE,',
'       PROD_OEM_DRG_DATE,',
'       PROD_CRIT_FLAG,',
'       PROD_PERFM_TGT_PRICE,',
'       PROD_IBR_CODE,',
'       PROD_CUST_SPEC_MAT_FLAG,',
'       PROD_TC_REQ_FLAG,',
'       PROD_OS_CONS_TYPE,',
'       PROD_CLS,',
'       PROD_SUB_CLS,',
'       (SELECT class_desc1',
'          FROM classes',
'         WHERE class_bu = :Global_bu',
'         AND class_id = PROD_CLS)"Class",',
'       (SELECT subcls_desc1',
'        FROM sub_classes',
'       WHERE subcls_bu = :Global_bu AND subcls_id = PROD_SUB_CLS)"Sub Class",',
'       PROD_SER_LOT_RULE,',
'       PROD_GLASS_ID,',
'       PROD_GLAZING_ID,',
'       PROD_SER_GRP_ID,',
'       PROD_INST_REQ_FLAG,',
'       PROD_PACK_CONT_RQRD_FLAG,',
'       PROD_PACK_SIZE,',
'       PROD_CHILD_YIELD_PCT,',
'       PROD_DIM_STK_REQ_FLAG,',
'       PROD_ROUTE_CARD_REQ_FLAG,',
'       PROD_BATCH_CODE,',
'       PROD_ADD_WATER_LVL_QTY,',
'       PROD_INC_PACK_MAT_FLAG,',
'       PROD_SAP_PROD_ID,',
'       PROD_PACK_MTRL_WGHT,',
'       PROD_SALES_RET_DUR,',
'       PROD_SALES_RET_FREQ,',
'       PROD_PUR_PRICE_BASIS,',
'       PROD_CONT_PACK_MTL_WGT,',
'       PROD_CONE_WGT_RQRD_FLAG,',
'       PROD_STD_GRN_WT,',
'       PROD_STD_DRY_WT,',
'       PROD_SPN_CUT_LEN,',
'       PROD_SPN_YARN_CNT,',
'       PROD_SPN_WNDG_TYPE,',
'       PROD_SPN_CAT,',
'       PROD_SPN_WAX_FLAG,',
'       PROD_TINT_ID,',
'       PROD_SPN_RM_TYPE',
'  from PRODUCTS',
' where PROD_BU = :GLOBAL_bu ',
'   and prod_status =''A''',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Result(s)</b>'
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
 p_id=>wwv_flow_imp.id(21262636188963397647)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>15780674353419786619
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751993490038809730)
,p_db_column_name=>'Class'
,p_display_order=>221
,p_column_identifier=>'GV'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751992622541809727)
,p_db_column_name=>'Group'
,p_display_order=>241
,p_column_identifier=>'GY'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751991853264809723)
,p_db_column_name=>'Major class'
,p_display_order=>261
,p_column_identifier=>'HA'
,p_column_label=>'Major Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752044791932810002)
,p_db_column_name=>'PROD_ABC_CLS'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Prod Abc Cls'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752001117114809775)
,p_db_column_name=>'PROD_ADD_WATER_LVL_QTY'
,p_display_order=>184
,p_column_identifier=>'GB'
,p_column_label=>'Prod Add Water Lvl Qty'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752015748353809850)
,p_db_column_name=>'PROD_ANGLE_SIDE1'
,p_display_order=>147
,p_column_identifier=>'EQ'
,p_column_label=>'Prod Angle Side1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752015393830809848)
,p_db_column_name=>'PROD_ANGLE_SIDE2'
,p_display_order=>148
,p_column_identifier=>'ER'
,p_column_label=>'Prod Angle Side2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752053562813810070)
,p_db_column_name=>'PROD_ATP_FLAG'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Prod Atp Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752001503222809777)
,p_db_column_name=>'PROD_BATCH_CODE'
,p_display_order=>183
,p_column_identifier=>'GA'
,p_column_label=>'Prod Batch Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752018155052809877)
,p_db_column_name=>'PROD_BLEND_TYPE'
,p_display_order=>141
,p_column_identifier=>'EK'
,p_column_label=>'Prod Blend Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752094680322810234)
,p_db_column_name=>'PROD_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Prod Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752041215716809986)
,p_db_column_name=>'PROD_BWD_CONS_DAYS'
,p_display_order=>83
,p_column_identifier=>'CE'
,p_column_label=>'Prod Bwd Cons Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752039278577809978)
,p_db_column_name=>'PROD_CARRYING_COST'
,p_display_order=>88
,p_column_identifier=>'CJ'
,p_column_label=>'Prod Carrying Cost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6804926726122765405)
,p_db_column_name=>'PROD_CB_LEVEL'
,p_display_order=>301
,p_column_identifier=>'HE'
,p_column_label=>'Cost Batch Level'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752056765751810084)
,p_db_column_name=>'PROD_CFG_FLAG'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Prod Cfg Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752002532456809786)
,p_db_column_name=>'PROD_CHILD_YIELD_PCT'
,p_display_order=>180
,p_column_identifier=>'FX'
,p_column_label=>'Prod Child Yield Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752006189812809808)
,p_db_column_name=>'PROD_CLS'
,p_display_order=>171
,p_column_identifier=>'FO'
,p_column_label=>'Prod Cls'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751997903725809750)
,p_db_column_name=>'PROD_CONE_WGT_RQRD_FLAG'
,p_display_order=>192
,p_column_identifier=>'GJ'
,p_column_label=>'Prod Cone Wgt Rqrd Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752052727637810069)
,p_db_column_name=>'PROD_CONS_DAYS'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Prod Cons Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752053159189810070)
,p_db_column_name=>'PROD_CONS_MTHD'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Prod Cons Mthd'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752035655064809964)
,p_db_column_name=>'PROD_CONS_TYPE'
,p_display_order=>97
,p_column_identifier=>'CS'
,p_column_label=>'Prod Cons Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752034026275809955)
,p_db_column_name=>'PROD_CONTAINERS_FLAG'
,p_display_order=>101
,p_column_identifier=>'CW'
,p_column_label=>'Prod Containers Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752033720164809953)
,p_db_column_name=>'PROD_CONTAINERS_TYPE'
,p_display_order=>102
,p_column_identifier=>'CX'
,p_column_label=>'Prod Containers Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751998283436809752)
,p_db_column_name=>'PROD_CONT_PACK_MTL_WGT'
,p_display_order=>191
,p_column_identifier=>'GI'
,p_column_label=>'Prod Cont Pack Mtl Wgt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752051195841810058)
,p_db_column_name=>'PROD_COST_CAT'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Prod Cost Cat'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752081297128810197)
,p_db_column_name=>'PROD_COST_METHOD'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cost Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752050807384810052)
,p_db_column_name=>'PROD_COST_WEIGHT'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Prod Cost Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752053993191810073)
,p_db_column_name=>'PROD_CO_FLAG'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Prod Co Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752008617914809817)
,p_db_column_name=>'PROD_CRIT_FLAG'
,p_display_order=>165
,p_column_identifier=>'FI'
,p_column_label=>'Prod Crit Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752009349075809822)
,p_db_column_name=>'PROD_CUST_DRG_DATE'
,p_display_order=>163
,p_column_identifier=>'FG'
,p_column_label=>'Prod Cust Drg Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752011323383809831)
,p_db_column_name=>'PROD_CUST_DRG_NO'
,p_display_order=>158
,p_column_identifier=>'FB'
,p_column_label=>'Prod Cust Drg No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752010957895809830)
,p_db_column_name=>'PROD_CUST_DRG_REV'
,p_display_order=>159
,p_column_identifier=>'FC'
,p_column_label=>'Prod Cust Drg Rev'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752007328909809811)
,p_db_column_name=>'PROD_CUST_SPEC_MAT_FLAG'
,p_display_order=>168
,p_column_identifier=>'FL'
,p_column_label=>'Prod Cust Spec Mat Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752017398129809862)
,p_db_column_name=>'PROD_CUT_LENGTH'
,p_display_order=>143
,p_column_identifier=>'EM'
,p_column_label=>'Prod Cut Length'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752057830158810087)
,p_db_column_name=>'PROD_DEFLT_SC_SUPLR_ID'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Prod Deflt Sc Suplr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752091395235810230)
,p_db_column_name=>'PROD_DESC11'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752090367841810225)
,p_db_column_name=>'PROD_DESC21'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Prod Desc21'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752002191758809786)
,p_db_column_name=>'PROD_DIM_STK_REQ_FLAG'
,p_display_order=>181
,p_column_identifier=>'FY'
,p_column_label=>'Prod Dim Stk Req Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752058267664810091)
,p_db_column_name=>'PROD_DRAWING_NO'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Prod Drawing No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752009727462809825)
,p_db_column_name=>'PROD_DRG_DATE'
,p_display_order=>162
,p_column_identifier=>'FF'
,p_column_label=>'Prod Drg Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752026057900809923)
,p_db_column_name=>'PROD_DRG_REV'
,p_display_order=>121
,p_column_identifier=>'DQ'
,p_column_label=>'Prod Drg Rev'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752038048740809975)
,p_db_column_name=>'PROD_DTF'
,p_display_order=>91
,p_column_identifier=>'CM'
,p_column_label=>'Prod Dtf'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752036894158809969)
,p_db_column_name=>'PROD_DTF_DAY'
,p_display_order=>94
,p_column_identifier=>'CP'
,p_column_label=>'Prod Dtf Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752064717292810142)
,p_db_column_name=>'PROD_EXPR_FLAG'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Prod Expr Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752064254175810141)
,p_db_column_name=>'PROD_EXPR_FREQ'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Prod Expr Freq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752063880665810139)
,p_db_column_name=>'PROD_EXPR_PER'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Prod Expr Per'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752020879125809887)
,p_db_column_name=>'PROD_EXT_DESC1'
,p_display_order=>134
,p_column_identifier=>'ED'
,p_column_label=>'Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752020500140809886)
,p_db_column_name=>'PROD_EXT_DESC2'
,p_display_order=>135
,p_column_identifier=>'EE'
,p_column_label=>'Prod Ext Desc2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752016999072809861)
,p_db_column_name=>'PROD_FAB_ITEM_TYPE'
,p_display_order=>144
,p_column_identifier=>'EN'
,p_column_label=>'Prod Fab Item Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752023644734809905)
,p_db_column_name=>'PROD_FIFO_NEXT_NO'
,p_display_order=>127
,p_column_identifier=>'DW'
,p_column_label=>'Prod Fifo Next No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752065914875810147)
,p_db_column_name=>'PROD_FLAMMABLE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Prod Flammable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752051938749810064)
,p_db_column_name=>'PROD_FLOAT_AFT_DAYS'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Prod Float Aft Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752052386723810066)
,p_db_column_name=>'PROD_FLOAT_BFR_DAYS'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Prod Float Bfr Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752013812972809844)
,p_db_column_name=>'PROD_FOR_PROC_DESC'
,p_display_order=>152
,p_column_identifier=>'EV'
,p_column_label=>'Prod For Proc Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752065462236810145)
,p_db_column_name=>'PROD_FREEZABLE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Prod Freezable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752042409048809989)
,p_db_column_name=>'PROD_FV_CLS'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Prod Fv Cls'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752041558692809987)
,p_db_column_name=>'PROD_FWD_CONS_DAYS'
,p_display_order=>82
,p_column_identifier=>'CD'
,p_column_label=>'Prod Fwd Cons Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752032889663809950)
,p_db_column_name=>'PROD_GAR_CATEGORY'
,p_display_order=>104
,p_column_identifier=>'CZ'
,p_column_label=>'Prod Gar Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752028903993809936)
,p_db_column_name=>'PROD_GAR_CNTNT_ID'
,p_display_order=>114
,p_column_identifier=>'DJ'
,p_column_label=>'Prod Gar Cntnt Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752032081461809948)
,p_db_column_name=>'PROD_GAR_COLOR'
,p_display_order=>106
,p_column_identifier=>'DB'
,p_column_label=>'Prod Gar Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752028455020809934)
,p_db_column_name=>'PROD_GAR_COUNT'
,p_display_order=>115
,p_column_identifier=>'DK'
,p_column_label=>'Prod Gar Count'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752030107892809941)
,p_db_column_name=>'PROD_GAR_DIA'
,p_display_order=>111
,p_column_identifier=>'DG'
,p_column_label=>'Prod Gar Dia'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752029692493809939)
,p_db_column_name=>'PROD_GAR_GSM'
,p_display_order=>112
,p_column_identifier=>'DH'
,p_column_label=>'Prod Gar Gsm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752031636877809947)
,p_db_column_name=>'PROD_GAR_SIZE'
,p_display_order=>107
,p_column_identifier=>'DC'
,p_column_label=>'Prod Gar Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752029229045809937)
,p_db_column_name=>'PROD_GAR_STRCT_ID'
,p_display_order=>113
,p_column_identifier=>'DI'
,p_column_label=>'Prod Gar Strct Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752032485934809948)
,p_db_column_name=>'PROD_GAR_STYLE'
,p_display_order=>105
,p_column_identifier=>'DA'
,p_column_label=>'Prod Gar Style'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752031238178809945)
,p_db_column_name=>'PROD_GAR_TYPE'
,p_display_order=>108
,p_column_identifier=>'DD'
,p_column_label=>'Prod Gar Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752004935667809803)
,p_db_column_name=>'PROD_GLASS_ID'
,p_display_order=>174
,p_column_identifier=>'FR'
,p_column_label=>'Prod Glass Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752004536886809802)
,p_db_column_name=>'PROD_GLAZING_ID'
,p_display_order=>175
,p_column_identifier=>'FS'
,p_column_label=>'Prod Glazing Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752023284364809903)
,p_db_column_name=>'PROD_GRADE_ID'
,p_display_order=>128
,p_column_identifier=>'DX'
,p_column_label=>'Prod Grade Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752067112636810166)
,p_db_column_name=>'PROD_GROSS_WEIGHT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Prod Gross Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752024837772809914)
,p_db_column_name=>'PROD_GROUP_ID'
,p_display_order=>124
,p_column_identifier=>'DT'
,p_column_label=>'Prod Group Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752065045116810144)
,p_db_column_name=>'PROD_HAZARDOUS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Prod Hazardous'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752070228083810181)
,p_db_column_name=>'PROD_HEIGHT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Prod Height'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752060625298810117)
,p_db_column_name=>'PROD_HIGH_PRICE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Prod High Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752028029581809931)
,p_db_column_name=>'PROD_HS_CODE'
,p_display_order=>116
,p_column_identifier=>'DL'
,p_column_label=>'Prod Hs Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752012922296809841)
,p_db_column_name=>'PROD_HUB_THICK'
,p_display_order=>154
,p_column_identifier=>'EX'
,p_column_label=>'Prod Hub Thick'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752007724158809812)
,p_db_column_name=>'PROD_IBR_CODE'
,p_display_order=>167
,p_column_identifier=>'FK'
,p_column_label=>'Prod Ibr Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752093546798810233)
,p_db_column_name=>'PROD_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752011807637809834)
,p_db_column_name=>'PROD_ID_PLNG_PCT'
,p_display_order=>157
,p_column_identifier=>'FA'
,p_column_label=>'Prod Id Plng Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752000701842809772)
,p_db_column_name=>'PROD_INC_PACK_MAT_FLAG'
,p_display_order=>185
,p_column_identifier=>'GC'
,p_column_label=>'Prod Inc Pack Mat Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752030901406809944)
,p_db_column_name=>'PROD_INDICATOR'
,p_display_order=>109
,p_column_identifier=>'DE'
,p_column_label=>'Prod Indicator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752016569679809858)
,p_db_column_name=>'PROD_INNER_DIA'
,p_display_order=>145
,p_column_identifier=>'EO'
,p_column_label=>'Prod Inner Dia'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752003790762809795)
,p_db_column_name=>'PROD_INST_REQ_FLAG'
,p_display_order=>177
,p_column_identifier=>'FU'
,p_column_label=>'Prod Inst Req Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752022046837809895)
,p_db_column_name=>'PROD_INT_VOLUME'
,p_display_order=>131
,p_column_identifier=>'EA'
,p_column_label=>'Prod Int Volume'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752014144419809845)
,p_db_column_name=>'PROD_KANBAN_TYPE'
,p_display_order=>151
,p_column_identifier=>'EU'
,p_column_label=>'Prod Kanban Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752059841625810097)
,p_db_column_name=>'PROD_LAST_GRN_PRICE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Prod Last Grn Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752059472121810094)
,p_db_column_name=>'PROD_LAST_GRN_QTY'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Prod Last Grn Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752047983577810025)
,p_db_column_name=>'PROD_LAST_LBR_COST'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Prod Last Lbr Cost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752060282113810114)
,p_db_column_name=>'PROD_LAST_PO_PRICE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Prod Last Po Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752048389720810027)
,p_db_column_name=>'PROD_LAST_PUR_PRICE'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Prod Last Pur Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752042746511809991)
,p_db_column_name=>'PROD_LEAD_TIME_SOURCE'
,p_display_order=>79
,p_column_identifier=>'CA'
,p_column_label=>'Prod Lead Time Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752071507056810183)
,p_db_column_name=>'PROD_LENGTH'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Prod Length'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752024082933809906)
,p_db_column_name=>'PROD_LIFO_NEXT_NO'
,p_display_order=>126
,p_column_identifier=>'DV'
,p_column_label=>'Prod Lifo Next No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752063088701810131)
,p_db_column_name=>'PROD_LOT_NEXT_NO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Prod Lot Next No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752036092778809967)
,p_db_column_name=>'PROD_LOT_PFX'
,p_display_order=>96
,p_column_identifier=>'CR'
,p_column_label=>'Prod Lot Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752054815628810077)
,p_db_column_name=>'PROD_LOT_SIZE'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Prod Lot Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752024507438809912)
,p_db_column_name=>'PROD_LOT_SIZE_DAY'
,p_display_order=>125
,p_column_identifier=>'DU'
,p_column_label=>'Prod Lot Size Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752055138732810078)
,p_db_column_name=>'PROD_LOT_SIZE_TYPE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Prod Lot Size Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752061106365810122)
,p_db_column_name=>'PROD_LOW_PRICE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Prod Low Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751992277869809723)
,p_db_column_name=>'PROD_MAJOR_CLS'
,p_display_order=>251
,p_column_identifier=>'GZ'
,p_column_label=>'Prod Major Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752012559697809839)
,p_db_column_name=>'PROD_MAKE_ID'
,p_display_order=>155
,p_column_identifier=>'EY'
,p_column_label=>'Prod Make Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752033268842809952)
,p_db_column_name=>'PROD_MARKET_COST'
,p_display_order=>103
,p_column_identifier=>'CY'
,p_column_label=>'Prod Market Cost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752013411251809842)
,p_db_column_name=>'PROD_MATERIAL'
,p_display_order=>153
,p_column_identifier=>'EW'
,p_column_label=>'Prod Material'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752026518697809927)
,p_db_column_name=>'PROD_MAT_SPEC'
,p_display_order=>120
,p_column_identifier=>'DP'
,p_column_label=>'Prod Mat Spec'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752021643141809892)
,p_db_column_name=>'PROD_MAX_LOAD_WEIGHT'
,p_display_order=>132
,p_column_identifier=>'EB'
,p_column_label=>'Prod Max Load Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752041981498809989)
,p_db_column_name=>'PROD_MFG_BATCH_QTY'
,p_display_order=>81
,p_column_identifier=>'CC'
,p_column_label=>'Prod Mfg Batch Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752047574930810025)
,p_db_column_name=>'PROD_MFG_BATCH_TYPE'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Prod Mfg Batch Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752057427592810087)
,p_db_column_name=>'PROD_MFG_LEAD_TIME'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Prod Mfg Lead Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752040097437809981)
,p_db_column_name=>'PROD_MFG_METHOD'
,p_display_order=>86
,p_column_identifier=>'CH'
,p_column_label=>'Prod Mfg Method'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752047167277810023)
,p_db_column_name=>'PROD_MFG_ORD_FLAG'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Prod Mfg Ord Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752021292508809891)
,p_db_column_name=>'PROD_MIN_FILL_PCT'
,p_display_order=>133
,p_column_identifier=>'EC'
,p_column_label=>'Prod Min Fill Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752040508994809983)
,p_db_column_name=>'PROD_MIN_ISSUE_QTY'
,p_display_order=>85
,p_column_identifier=>'CG'
,p_column_label=>'Prod Min Issue Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752012185187809836)
,p_db_column_name=>'PROD_MODEL'
,p_display_order=>156
,p_column_identifier=>'EZ'
,p_column_label=>'Prod Model'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752025644942809922)
,p_db_column_name=>'PROD_MPS_MRP'
,p_display_order=>122
,p_column_identifier=>'DR'
,p_column_label=>'Prod Mps Mrp'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752015014639809848)
,p_db_column_name=>'PROD_MRKT_STD_FLAG'
,p_display_order=>149
,p_column_identifier=>'ES'
,p_column_label=>'Prod Mrkt Std Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752066706594810150)
,p_db_column_name=>'PROD_NET_WEIGHT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Prod Net Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752008991844809820)
,p_db_column_name=>'PROD_OEM_DRG_DATE'
,p_display_order=>164
,p_column_identifier=>'FH'
,p_column_label=>'Prod Oem Drg Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752010548166809830)
,p_db_column_name=>'PROD_OEM_DRG_NO'
,p_display_order=>160
,p_column_identifier=>'FD'
,p_column_label=>'Prod Oem Drg No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752010139633809827)
,p_db_column_name=>'PROD_OEM_DRG_REV'
,p_display_order=>161
,p_column_identifier=>'FE'
,p_column_label=>'Prod Oem Drg Rev'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752039668648809980)
,p_db_column_name=>'PROD_ORDERING_COST'
,p_display_order=>87
,p_column_identifier=>'CI'
,p_column_label=>'Prod Ordering Cost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752043182203809994)
,p_db_column_name=>'PROD_ORD_INFLU'
,p_display_order=>78
,p_column_identifier=>'BZ'
,p_column_label=>'Prod Ord Influ'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752043552021809995)
,p_db_column_name=>'PROD_ORD_QTY'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Prod Ord Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752006544691809809)
,p_db_column_name=>'PROD_OS_CONS_TYPE'
,p_display_order=>170
,p_column_identifier=>'FN'
,p_column_label=>'Prod Os Cons Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752016156393809853)
,p_db_column_name=>'PROD_OUTER_DIA'
,p_display_order=>146
,p_column_identifier=>'EP'
,p_column_label=>'Prod Outer Dia'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752003329005809794)
,p_db_column_name=>'PROD_PACK_CONT_RQRD_FLAG'
,p_display_order=>178
,p_column_identifier=>'FV'
,p_column_label=>'Prod Pack Cont Rqrd Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751999904344809766)
,p_db_column_name=>'PROD_PACK_MTRL_WGHT'
,p_display_order=>187
,p_column_identifier=>'GE'
,p_column_label=>'Prod Pack Mtrl Wght'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752002927706809789)
,p_db_column_name=>'PROD_PACK_SIZE'
,p_display_order=>179
,p_column_identifier=>'FW'
,p_column_label=>'Prod Pack Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752058638545810091)
,p_db_column_name=>'PROD_PARTS_COVER_FLAG'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Prod Parts Cover Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752008206090809816)
,p_db_column_name=>'PROD_PERFM_TGT_PRICE'
,p_display_order=>166
,p_column_identifier=>'FJ'
,p_column_label=>'Prod Perfm Tgt Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752061453234810125)
,p_db_column_name=>'PROD_PO_LR_TOLR'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Prod Po Lr Tolr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752030448395809944)
,p_db_column_name=>'PROD_PRTN_TFER'
,p_display_order=>110
,p_column_identifier=>'DF'
,p_column_label=>'Prod Prtn Tfer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752050392037810047)
,p_db_column_name=>'PROD_PR_PO_FLAG'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Prod Pr Po Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752046351014810016)
,p_db_column_name=>'PROD_PR_PO_TOLR'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Prod Pr Po Tolr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752038829818809977)
,p_db_column_name=>'PROD_PTF'
,p_display_order=>89
,p_column_identifier=>'CK'
,p_column_label=>'Prod Ptf'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752037707638809973)
,p_db_column_name=>'PROD_PTF_DAY'
,p_display_order=>92
,p_column_identifier=>'CN'
,p_column_label=>'Prod Ptf Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751998642961809753)
,p_db_column_name=>'PROD_PUR_PRICE_BASIS'
,p_display_order=>190
,p_column_identifier=>'GH'
,p_column_label=>'Prod Pur Price Basis'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752019753551809883)
,p_db_column_name=>'PROD_PUR_WITH_MAT'
,p_display_order=>137
,p_column_identifier=>'EG'
,p_column_label=>'Prod Pur With Mat'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752049590649810039)
,p_db_column_name=>'PROD_QUOTE_FREQUENCY'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Prod Quote Frequency'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752049191001810034)
,p_db_column_name=>'PROD_QUOTE_FREQ_VALUE'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Prod Quote Freq Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752048750326810031)
,p_db_column_name=>'PROD_QUOTE_NEXT_CALL_DATE'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Prod Quote Next Call Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752020155831809884)
,p_db_column_name=>'PROD_RELS_TYPE'
,p_display_order=>136
,p_column_identifier=>'EF'
,p_column_label=>'Prod Rels Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752019402992809881)
,p_db_column_name=>'PROD_RET_FLAG'
,p_display_order=>138
,p_column_identifier=>'EH'
,p_column_label=>'Prod Ret Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752084473167810202)
,p_db_column_name=>'PROD_REV'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752049954195810045)
,p_db_column_name=>'PROD_REV_DATE'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Prod Rev Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752062315815810128)
,p_db_column_name=>'PROD_RFQ'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Prod Rfq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752057104819810086)
,p_db_column_name=>'PROD_RLT_TIME'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Prod Rlt Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752001906697809784)
,p_db_column_name=>'PROD_ROUTE_CARD_REQ_FLAG'
,p_display_order=>182
,p_column_identifier=>'FZ'
,p_column_label=>'Prod Route Card Req Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752038428668809975)
,p_db_column_name=>'PROD_RTF'
,p_display_order=>90
,p_column_identifier=>'CL'
,p_column_label=>'Prod Rtf'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752037292842809972)
,p_db_column_name=>'PROD_RTF_DAY'
,p_display_order=>93
,p_column_identifier=>'CO'
,p_column_label=>'Prod Rtf Day'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752034443033809959)
,p_db_column_name=>'PROD_RULE_ID'
,p_display_order=>100
,p_column_identifier=>'CV'
,p_column_label=>'Prod Rule Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752061913338810125)
,p_db_column_name=>'PROD_SALEABLE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Prod Saleable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751999493482809759)
,p_db_column_name=>'PROD_SALES_RET_DUR'
,p_display_order=>188
,p_column_identifier=>'GF'
,p_column_label=>'Prod Sales Ret Dur'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751999077610809755)
,p_db_column_name=>'PROD_SALES_RET_FREQ'
,p_display_order=>189
,p_column_identifier=>'GG'
,p_column_label=>'Prod Sales Ret Freq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752090003807810222)
,p_db_column_name=>'PROD_SALE_DESC1'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Prod Sale Desc1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752087554018810206)
,p_db_column_name=>'PROD_SALE_DESC2'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Prod Sale Desc2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752000268701809767)
,p_db_column_name=>'PROD_SAP_PROD_ID'
,p_display_order=>186
,p_column_identifier=>'GD'
,p_column_label=>'Prod Sap Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752014592478809847)
,p_db_column_name=>'PROD_SCHEDULE'
,p_display_order=>150
,p_column_identifier=>'ET'
,p_column_label=>'Prod Schedule'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752054328496810075)
,p_db_column_name=>'PROD_SCHLD_FLAG'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Prod Schld Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752044378975809998)
,p_db_column_name=>'PROD_SCRAP_PROD_ID'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Prod Scrap Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752043978524809998)
,p_db_column_name=>'PROD_SCRAP_PROD_REV'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Prod Scrap Prod Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752059082766810092)
,p_db_column_name=>'PROD_SERV_SCHLD_FLAG'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Prod Serv Schld Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752004188714809797)
,p_db_column_name=>'PROD_SER_GRP_ID'
,p_display_order=>176
,p_column_identifier=>'FT'
,p_column_label=>'Prod Ser Grp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752027287565809930)
,p_db_column_name=>'PROD_SER_LOT_CRE_OPT'
,p_display_order=>118
,p_column_identifier=>'DN'
,p_column_label=>'Prod Ser Lot Cre Opt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752063430900810133)
,p_db_column_name=>'PROD_SER_LOT_OPT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Lot Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752005377680809805)
,p_db_column_name=>'PROD_SER_LOT_RULE'
,p_display_order=>173
,p_column_identifier=>'FQ'
,p_column_label=>'Prod Ser Lot Rule'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752062680127810130)
,p_db_column_name=>'PROD_SER_NEXT_NO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Prod Ser Next No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752045192515810003)
,p_db_column_name=>'PROD_SER_NO_OPT'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752036498093809967)
,p_db_column_name=>'PROD_SER_PFX'
,p_display_order=>95
,p_column_identifier=>'CQ'
,p_column_label=>'Prod Ser Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752045602518810006)
,p_db_column_name=>'PROD_SHELF_FREQ_PERIOD'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Prod Shelf Freq Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752046008151810011)
,p_db_column_name=>'PROD_SHELF_LIFE_FREQ'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Prod Shelf Life Freq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752066309217810148)
,p_db_column_name=>'PROD_SHRINK_PCT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Prod Shrink Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752077005434810189)
,p_db_column_name=>'PROD_SIZE_UOM'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Prod Size Uom'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752026902507809928)
,p_db_column_name=>'PROD_SOB'
,p_display_order=>119
,p_column_identifier=>'DO'
,p_column_label=>'Prod Sob'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751995474557809739)
,p_db_column_name=>'PROD_SPN_CAT'
,p_display_order=>198
,p_column_identifier=>'GP'
,p_column_label=>'Prod Spn Cat'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751996711985809744)
,p_db_column_name=>'PROD_SPN_CUT_LEN'
,p_display_order=>195
,p_column_identifier=>'GM'
,p_column_label=>'Prod Spn Cut Len'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752017741773809866)
,p_db_column_name=>'PROD_SPN_DENIER'
,p_display_order=>142
,p_column_identifier=>'EL'
,p_column_label=>'Prod Spn Denier'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752018923249809878)
,p_db_column_name=>'PROD_SPN_ITEM_TYPE'
,p_display_order=>139
,p_column_identifier=>'EI'
,p_column_label=>'Prod Spn Item Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751994265013809733)
,p_db_column_name=>'PROD_SPN_RM_TYPE'
,p_display_order=>201
,p_column_identifier=>'GS'
,p_column_label=>'Prod Spn Rm Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752018593605809878)
,p_db_column_name=>'PROD_SPN_THICKNESS'
,p_display_order=>140
,p_column_identifier=>'EJ'
,p_column_label=>'Prod Spn Thickness'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751995095897809736)
,p_db_column_name=>'PROD_SPN_WAX_FLAG'
,p_display_order=>199
,p_column_identifier=>'GQ'
,p_column_label=>'Prod Spn Wax Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751995877814809741)
,p_db_column_name=>'PROD_SPN_WNDG_TYPE'
,p_display_order=>197
,p_column_identifier=>'GO'
,p_column_label=>'Prod Spn Wndg Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751996244834809742)
,p_db_column_name=>'PROD_SPN_YARN_CNT'
,p_display_order=>196
,p_column_identifier=>'GN'
,p_column_label=>'Prod Spn Yarn Cnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752081710758810198)
,p_db_column_name=>'PROD_STATUS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Prod Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752040840630809984)
,p_db_column_name=>'PROD_STD_COST'
,p_display_order=>84
,p_column_identifier=>'CF'
,p_column_label=>'Prod Std Cost'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751997023565809747)
,p_db_column_name=>'PROD_STD_DRY_WT'
,p_display_order=>194
,p_column_identifier=>'GL'
,p_column_label=>'Prod Std Dry Wt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751997507225809748)
,p_db_column_name=>'PROD_STD_GRN_WT'
,p_display_order=>193
,p_column_identifier=>'GK'
,p_column_label=>'Prod Std Grn Wt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752082984830810200)
,p_db_column_name=>'PROD_STOCKED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Prod Stocked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752051593701810059)
,p_db_column_name=>'PROD_STRATEGY'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Prod Strategy'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752025249050809920)
,p_db_column_name=>'PROD_SUBGROUP_ID'
,p_display_order=>123
,p_column_identifier=>'DS'
,p_column_label=>'Prod Subgroup Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752005803338809806)
,p_db_column_name=>'PROD_SUB_CLS'
,p_display_order=>172
,p_column_identifier=>'FP'
,p_column_label=>'Prod Sub Cls'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752006956942809811)
,p_db_column_name=>'PROD_TC_REQ_FLAG'
,p_display_order=>169
,p_column_identifier=>'FM'
,p_column_label=>'Prod Tc Req Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751994680789809736)
,p_db_column_name=>'PROD_TINT_ID'
,p_display_order=>200
,p_column_identifier=>'GR'
,p_column_label=>'Prod Tint Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752046757005810020)
,p_db_column_name=>'PROD_TOLR_TYPE'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Prod Tolr Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752080628580810195)
,p_db_column_name=>'PROD_UOM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752056339211810083)
,p_db_column_name=>'PROD_VAR_FLAG'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Prod Var Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752035257770809962)
,p_db_column_name=>'PROD_VAR_GROUP'
,p_display_order=>98
,p_column_identifier=>'CT'
,p_column_label=>'Prod Var Group'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752027707164809931)
,p_db_column_name=>'PROD_VAR_OPT'
,p_display_order=>117
,p_column_identifier=>'DM'
,p_column_label=>'Prod Var Opt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752022450614809900)
,p_db_column_name=>'PROD_VOLUME_UNIT'
,p_display_order=>130
,p_column_identifier=>'DZ'
,p_column_label=>'Prod Volume Unit'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752022886700809902)
,p_db_column_name=>'PROD_VOLUME_UOM'
,p_display_order=>129
,p_column_identifier=>'DY'
,p_column_label=>'Prod Volume Uom'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752034914432809961)
,p_db_column_name=>'PROD_WARR_FLAG'
,p_display_order=>99
,p_column_identifier=>'CU'
,p_column_label=>'Prod Warr Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752055560302810080)
,p_db_column_name=>'PROD_WARR_PER'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Prod Warr Per'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752055998682810081)
,p_db_column_name=>'PROD_WARR_TYPE'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Prod Warr Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752068633447810178)
,p_db_column_name=>'PROD_WEIGHT_UOM'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Prod Weight Uom'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752072524892810183)
,p_db_column_name=>'PROD_WIDTH'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Prod Width'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752095101094810239)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752099749897810245)
,p_db_column_name=>'Status'
,p_display_order=>291
,p_column_identifier=>'HD'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Status#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751993901584809731)
,p_db_column_name=>'Sub Class'
,p_display_order=>211
,p_column_identifier=>'GU'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751993064264809728)
,p_db_column_name=>'Sub Group'
,p_display_order=>231
,p_column_identifier=>'GX'
,p_column_label=>'Sub Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8751991453521809716)
,p_db_column_name=>'UOM'
,p_display_order=>271
,p_column_identifier=>'HB'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8752104077782810252)
,p_db_column_name=>'color'
,p_display_order=>281
,p_column_identifier=>'HC'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(21262458445310378571)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15924612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PROD_ID:PROD_REV:PROD_DESC11:PROD_UOM:Sub Class:Class:Sub Group:Group:PROD_SER_LOT_OPT:PROD_SER_NO_OPT:PROD_COST_METHOD:Status:PROD_CB_LEVEL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5529095935989583348)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(21262636582490397647)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:36702001:&SESSION.::&DEBUG.:RR,3670200::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5529094769578583343)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(21262636582490397647)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5883179007267861831)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(21262636582490397647)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5529095564625583346)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(21262636582490397647)
,p_button_name=>'Search'
,p_static_id=>'search'
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
 p_id=>wwv_flow_imp.id(5529095229029583346)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(21262636582490397647)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:367020007:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5883179092572861832)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5883179007267861831)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5883179178300861833)
,p_event_id=>wwv_flow_imp.id(5883179092572861832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
