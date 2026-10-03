prompt --application/pages/page_12100
begin
--   Manifest
--     PAGE: 12100
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
 p_id=>12100
,p_name=>'Item - Entity Level'
,p_alias=>'ITEM-ENTITY-LEVEL1'
,p_step_title=>'Item - Entity Level'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'//apex.jQuery(''#RIE_ir'').interactiveReport("reset");'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }',
'       ',
'     /*   .a-IRR-table tr td:first-child, .a-IRR-table tr th:first-child {',
'           box-shadow: none;',
'           width: 10px; ',
'} */',
'',
'',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 25px;',
'   padding-bottom: 8px;',
'}',
'',
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
'',
' '))
,p_step_template=>wwv_flow_imp.id(8236142022695189174)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21215568218142426027)
,p_plug_name=>'<b>Result(s)</b>'
,p_static_id=>'b-result-s-b'
,p_region_name=>'RIE'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
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
'       PROD_SPN_RM_TYPE,',
'       ''<span aria-hidden="true" class="fa fa-print" style="color: #004153;font-size : 12px ;font-weight: bold"></span>'' print',
'  from PRODUCTS',
' where PROD_BU = :GLOBAL_bu ',
' and :P12100_FILTER_TYPE = ''Y''',
'                  AND ((prod_status LIKE ''%''||:P12100_STATUS ||''%'') OR :P12100_STATUS IS NULL)',
'                 AND ((PROD_ID LIKE''%''|| :P12100_ITEM_DUMMY||''%'' ) OR :P12100_ITEM_DUMMY IS NULL) ',
'                 AND ((PROD_ID LIKE''%''|| :P12100_ITEM_1||''%'' ) OR :P12100_ITEM_1 IS NULL) ',
'                 AND ((PROD_DESC11 LIKE''%''|| :P12100_ITEM_DESC||''%'')  OR :P12100_ITEM_DESC IS NULL)',
'                 And (PROD_REV = :P12100_REV or :P12100_REV is null)',
'                 AND ((PROD_PUR_UOM LIKE ''%''|| :P12100_PUR_UOM ||''%'' ) or :P12100_PUR_UOM is null) ',
'                 AND ((PROD_SALE_UOM LIKE ''%''|| :P12100_SALES_UOM ||''%'' ) or :P12100_SALES_UOM is null) ',
'                 AND ((PROD_EXT_DESC1 LIKE ''%''|| :P12100_EXT_DESC ||''%'') or :P12100_EXT_DESC is null)',
'                 AND ((PROD_UOM LIKE ''%''|| :P12100_UOM ||''%'') or :P12100_UOM is null)',
'                 AND (((SELECT subcls_desc1',
'                          from sub_classes',
'                         WHERE  subcls_bu  = :Global_bu ',
'	                   and subcls_id  = prod_sub_cls) LIKE ''%''|| :P12100_SUB_CLASS ||''%'') or :P12100_SUB_CLASS is null)',
'                 AND (((SELECT class_desc1',
'                          from classes',
'                         WHERE  class_bu  = :Global_bu ',
'	                   and class_id  = prod_cls) LIKE ''%''|| :P12100_CLASS ||''%'') or :P12100_CLASS is null) ',
'                 AND (((SELECT PSGRP_SUBGROUP_DESC1',
'                          from prod_sub_group',
'                         WHERE  PSGRP_bu = :Global_bu ',
'	                        and PSGRP_SUBGROUP_ID = PROD_SUBGROUP_ID) LIKE ''%''|| :P12100_SUB_GROUP ||''%'') or :P12100_SUB_GROUP is null)',
'                  AND (((SELECT PGRP_GROUP_DESC1',
'                          from prod_group',
'                         WHERE  pgrp_bu = :Global_bu ',
'	                        and PGRP_GROUP_ID = prod_group_id) LIKE ''%''|| :P12100_GROUP ||''%'') or :P12100_GROUP is null)',
'           ORDER BY prod_upd_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P12100_FILTER_TYPE,P12100_ITEM_1,P12100_REV,P12100_ITEM_DESC,P12100_EXT_DESC,P12100_PUR_UOM,P12100_SALES_UOM,P12100_UOM,P12100_CLASS,P12100_SUB_CLASS,P12100_GROUP,P12100_SUB_GROUP,P12100_STATUS'
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
 p_id=>wwv_flow_imp.id(21215567824615426027)
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
,p_internal_uid=>15733605989071814999
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704925125690838110)
,p_db_column_name=>'Class'
,p_display_order=>221
,p_column_identifier=>'GV'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704924258193838107)
,p_db_column_name=>'Group'
,p_display_order=>241
,p_column_identifier=>'GY'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704923488916838103)
,p_db_column_name=>'Major class'
,p_display_order=>261
,p_column_identifier=>'HA'
,p_column_label=>'Major Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398239961259977685)
,p_db_column_name=>'PRINT'
,p_display_order=>311
,p_column_identifier=>'HF'
,p_column_label=>'Print'
,p_column_link=>'javascript:$s(''P3670200_FIND_BU'',''#PROD_BU#''),$s(''P3670200_FIND_ITEM'',''#PROD_ID#''),$s(''P3670200_FIND_REV'',''#PROD_REV#'');apex.submit(''ITEM'');'
,p_column_linktext=>'#PRINT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704976427584838382)
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
 p_id=>wwv_flow_imp.id(8704932752766838155)
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
 p_id=>wwv_flow_imp.id(8704947384005838230)
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
 p_id=>wwv_flow_imp.id(8704947029482838228)
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
 p_id=>wwv_flow_imp.id(8704985198465838450)
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
 p_id=>wwv_flow_imp.id(8704933138874838157)
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
 p_id=>wwv_flow_imp.id(8704949790704838257)
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
 p_id=>wwv_flow_imp.id(8705026315974838614)
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
 p_id=>wwv_flow_imp.id(8704972851368838366)
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
 p_id=>wwv_flow_imp.id(8704970914229838358)
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
 p_id=>wwv_flow_imp.id(6757858361774793785)
,p_db_column_name=>'PROD_CB_LEVEL'
,p_display_order=>301
,p_column_identifier=>'HE'
,p_column_label=>'Cost Batch Level'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704988401403838464)
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
 p_id=>wwv_flow_imp.id(8704934168108838166)
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
 p_id=>wwv_flow_imp.id(8704937825464838188)
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
 p_id=>wwv_flow_imp.id(8704929539377838130)
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
 p_id=>wwv_flow_imp.id(8704984363289838449)
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
 p_id=>wwv_flow_imp.id(8704984794841838450)
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
 p_id=>wwv_flow_imp.id(8704967290716838344)
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
 p_id=>wwv_flow_imp.id(8704965661927838335)
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
 p_id=>wwv_flow_imp.id(8704965355816838333)
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
 p_id=>wwv_flow_imp.id(8704929919088838132)
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
 p_id=>wwv_flow_imp.id(8704982831493838438)
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
 p_id=>wwv_flow_imp.id(8705012932780838577)
,p_db_column_name=>'PROD_COST_METHOD'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cost Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704982443036838432)
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
 p_id=>wwv_flow_imp.id(8704985628843838453)
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
 p_id=>wwv_flow_imp.id(8704940253566838197)
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
 p_id=>wwv_flow_imp.id(8704940984727838202)
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
 p_id=>wwv_flow_imp.id(8704942959035838211)
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
 p_id=>wwv_flow_imp.id(8704942593547838210)
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
 p_id=>wwv_flow_imp.id(8704938964561838191)
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
 p_id=>wwv_flow_imp.id(8704949033781838242)
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
 p_id=>wwv_flow_imp.id(8704989465810838467)
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
 p_id=>wwv_flow_imp.id(8705023030887838610)
,p_db_column_name=>'PROD_DESC11'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8705022003493838605)
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
 p_id=>wwv_flow_imp.id(8704933827410838166)
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
 p_id=>wwv_flow_imp.id(8704989903316838471)
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
 p_id=>wwv_flow_imp.id(8704941363114838205)
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
 p_id=>wwv_flow_imp.id(8704957693552838303)
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
 p_id=>wwv_flow_imp.id(8704969684392838355)
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
 p_id=>wwv_flow_imp.id(8704968529810838349)
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
 p_id=>wwv_flow_imp.id(8704996352944838522)
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
 p_id=>wwv_flow_imp.id(8704995889827838521)
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
 p_id=>wwv_flow_imp.id(8704995516317838519)
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
 p_id=>wwv_flow_imp.id(8704952514777838267)
,p_db_column_name=>'PROD_EXT_DESC1'
,p_display_order=>134
,p_column_identifier=>'ED'
,p_column_label=>'Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704952135792838266)
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
 p_id=>wwv_flow_imp.id(8704948634724838241)
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
 p_id=>wwv_flow_imp.id(8704955280386838285)
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
 p_id=>wwv_flow_imp.id(8704997550527838527)
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
 p_id=>wwv_flow_imp.id(8704983574401838444)
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
 p_id=>wwv_flow_imp.id(8704984022375838446)
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
 p_id=>wwv_flow_imp.id(8704945448624838224)
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
 p_id=>wwv_flow_imp.id(8704997097888838525)
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
 p_id=>wwv_flow_imp.id(8704974044700838369)
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
 p_id=>wwv_flow_imp.id(8704973194344838367)
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
 p_id=>wwv_flow_imp.id(8704964525315838330)
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
 p_id=>wwv_flow_imp.id(8704960539645838316)
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
 p_id=>wwv_flow_imp.id(8704963717113838328)
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
 p_id=>wwv_flow_imp.id(8704960090672838314)
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
 p_id=>wwv_flow_imp.id(8704961743544838321)
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
 p_id=>wwv_flow_imp.id(8704961328145838319)
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
 p_id=>wwv_flow_imp.id(8704963272529838327)
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
 p_id=>wwv_flow_imp.id(8704960864697838317)
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
 p_id=>wwv_flow_imp.id(8704964121586838328)
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
 p_id=>wwv_flow_imp.id(8704962873830838325)
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
 p_id=>wwv_flow_imp.id(8704936571319838183)
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
 p_id=>wwv_flow_imp.id(8704936172538838182)
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
 p_id=>wwv_flow_imp.id(8704954920016838283)
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
 p_id=>wwv_flow_imp.id(8704998748288838546)
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
 p_id=>wwv_flow_imp.id(8704956473424838294)
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
 p_id=>wwv_flow_imp.id(8704996680768838524)
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
 p_id=>wwv_flow_imp.id(8705001863735838561)
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
 p_id=>wwv_flow_imp.id(8704992260950838497)
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
 p_id=>wwv_flow_imp.id(8704959665233838311)
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
 p_id=>wwv_flow_imp.id(8704944557948838221)
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
 p_id=>wwv_flow_imp.id(8704939359810838192)
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
 p_id=>wwv_flow_imp.id(8705025182450838613)
,p_db_column_name=>'PROD_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Item'
,p_column_link=>'f?p=&APP_ID.:367020001:&SESSION.::&DEBUG.:367020001:P367020001_ROWID,P367020001_REP_TYPE:#ROWID#,ALL'
,p_column_linktext=>'#PROD_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704943443289838214)
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
 p_id=>wwv_flow_imp.id(8704932337494838152)
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
 p_id=>wwv_flow_imp.id(8704962537058838324)
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
 p_id=>wwv_flow_imp.id(8704948205331838238)
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
 p_id=>wwv_flow_imp.id(8704935426414838175)
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
 p_id=>wwv_flow_imp.id(8704953682489838275)
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
 p_id=>wwv_flow_imp.id(8704945780071838225)
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
 p_id=>wwv_flow_imp.id(8704991477277838477)
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
 p_id=>wwv_flow_imp.id(8704991107773838474)
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
 p_id=>wwv_flow_imp.id(8704979619229838405)
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
 p_id=>wwv_flow_imp.id(8704991917765838494)
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
 p_id=>wwv_flow_imp.id(8704980025372838407)
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
 p_id=>wwv_flow_imp.id(8704974382163838371)
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
 p_id=>wwv_flow_imp.id(8705003142708838563)
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
 p_id=>wwv_flow_imp.id(8704955718585838286)
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
 p_id=>wwv_flow_imp.id(8704994724353838511)
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
 p_id=>wwv_flow_imp.id(8704967728430838347)
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
 p_id=>wwv_flow_imp.id(8704986451280838457)
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
 p_id=>wwv_flow_imp.id(8704956143090838292)
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
 p_id=>wwv_flow_imp.id(8704986774384838458)
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
 p_id=>wwv_flow_imp.id(8704992742017838502)
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
 p_id=>wwv_flow_imp.id(8704923913521838103)
,p_db_column_name=>'PROD_MAJOR_CLS'
,p_display_order=>251
,p_column_identifier=>'GZ'
,p_column_label=>'Prod Major Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704944195349838219)
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
 p_id=>wwv_flow_imp.id(8704964904494838332)
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
 p_id=>wwv_flow_imp.id(8704945046903838222)
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
 p_id=>wwv_flow_imp.id(8704958154349838307)
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
 p_id=>wwv_flow_imp.id(8704953278793838272)
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
 p_id=>wwv_flow_imp.id(8704973617150838369)
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
 p_id=>wwv_flow_imp.id(8704979210582838405)
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
 p_id=>wwv_flow_imp.id(8704989063244838467)
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
 p_id=>wwv_flow_imp.id(8704971733089838361)
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
 p_id=>wwv_flow_imp.id(8704978802929838403)
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
 p_id=>wwv_flow_imp.id(8704952928160838271)
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
 p_id=>wwv_flow_imp.id(8704972144646838363)
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
 p_id=>wwv_flow_imp.id(8704943820839838216)
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
 p_id=>wwv_flow_imp.id(8704957280594838302)
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
 p_id=>wwv_flow_imp.id(8704946650291838228)
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
 p_id=>wwv_flow_imp.id(8704998342246838530)
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
 p_id=>wwv_flow_imp.id(8704940627496838200)
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
 p_id=>wwv_flow_imp.id(8704942183818838210)
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
 p_id=>wwv_flow_imp.id(8704941775285838207)
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
 p_id=>wwv_flow_imp.id(8704971304300838360)
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
 p_id=>wwv_flow_imp.id(8704974817855838374)
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
 p_id=>wwv_flow_imp.id(8704975187673838375)
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
 p_id=>wwv_flow_imp.id(8704938180343838189)
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
 p_id=>wwv_flow_imp.id(8704947792045838233)
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
 p_id=>wwv_flow_imp.id(8704934964657838174)
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
 p_id=>wwv_flow_imp.id(8704931539996838146)
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
 p_id=>wwv_flow_imp.id(8704934563358838169)
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
 p_id=>wwv_flow_imp.id(8704990274197838471)
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
 p_id=>wwv_flow_imp.id(8704939841742838196)
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
 p_id=>wwv_flow_imp.id(8704993088886838505)
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
 p_id=>wwv_flow_imp.id(8704962084047838324)
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
 p_id=>wwv_flow_imp.id(8704982027689838427)
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
 p_id=>wwv_flow_imp.id(8704977986666838396)
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
 p_id=>wwv_flow_imp.id(8704970465470838357)
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
 p_id=>wwv_flow_imp.id(8704969343290838353)
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
 p_id=>wwv_flow_imp.id(8704930278613838133)
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
 p_id=>wwv_flow_imp.id(8704951389203838263)
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
 p_id=>wwv_flow_imp.id(8704981226301838419)
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
 p_id=>wwv_flow_imp.id(8704980826653838414)
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
 p_id=>wwv_flow_imp.id(8704980385978838411)
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
 p_id=>wwv_flow_imp.id(8704951791483838264)
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
 p_id=>wwv_flow_imp.id(8704951038644838261)
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
 p_id=>wwv_flow_imp.id(8705016108819838582)
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
 p_id=>wwv_flow_imp.id(8704981589847838425)
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
 p_id=>wwv_flow_imp.id(8704993951467838508)
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
 p_id=>wwv_flow_imp.id(8704988740471838466)
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
 p_id=>wwv_flow_imp.id(8704933542349838164)
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
 p_id=>wwv_flow_imp.id(8704970064320838355)
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
 p_id=>wwv_flow_imp.id(8704968928494838352)
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
 p_id=>wwv_flow_imp.id(8704966078685838339)
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
 p_id=>wwv_flow_imp.id(8704993548990838505)
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
 p_id=>wwv_flow_imp.id(8704931129134838139)
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
 p_id=>wwv_flow_imp.id(8704930713262838135)
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
 p_id=>wwv_flow_imp.id(8705021639459838602)
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
 p_id=>wwv_flow_imp.id(8705019189670838586)
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
 p_id=>wwv_flow_imp.id(8704931904353838147)
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
 p_id=>wwv_flow_imp.id(8704946228130838227)
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
 p_id=>wwv_flow_imp.id(8704985964148838455)
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
 p_id=>wwv_flow_imp.id(8704976014627838378)
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
 p_id=>wwv_flow_imp.id(8704975614176838378)
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
 p_id=>wwv_flow_imp.id(8704990718418838472)
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
 p_id=>wwv_flow_imp.id(8704935824366838177)
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
 p_id=>wwv_flow_imp.id(8704958923217838310)
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
 p_id=>wwv_flow_imp.id(8704995066552838513)
,p_db_column_name=>'PROD_SER_LOT_OPT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Lot Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704937013332838185)
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
 p_id=>wwv_flow_imp.id(8704994315779838510)
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
 p_id=>wwv_flow_imp.id(8704976828167838383)
,p_db_column_name=>'PROD_SER_NO_OPT'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704968133745838347)
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
 p_id=>wwv_flow_imp.id(8704977238170838386)
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
 p_id=>wwv_flow_imp.id(8704977643803838391)
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
 p_id=>wwv_flow_imp.id(8704997944869838528)
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
 p_id=>wwv_flow_imp.id(8705008641086838569)
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
 p_id=>wwv_flow_imp.id(8704958538159838308)
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
 p_id=>wwv_flow_imp.id(8704927110209838119)
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
 p_id=>wwv_flow_imp.id(8704928347637838124)
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
 p_id=>wwv_flow_imp.id(8704949377425838246)
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
 p_id=>wwv_flow_imp.id(8704950558901838258)
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
 p_id=>wwv_flow_imp.id(8704925900665838113)
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
 p_id=>wwv_flow_imp.id(8704950229257838258)
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
 p_id=>wwv_flow_imp.id(8704926731549838116)
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
 p_id=>wwv_flow_imp.id(8704927513466838121)
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
 p_id=>wwv_flow_imp.id(8704927880486838122)
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
 p_id=>wwv_flow_imp.id(8705013346410838578)
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
 p_id=>wwv_flow_imp.id(8704972476282838364)
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
 p_id=>wwv_flow_imp.id(8704928659217838127)
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
 p_id=>wwv_flow_imp.id(8704929142877838128)
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
 p_id=>wwv_flow_imp.id(8705014620482838580)
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
 p_id=>wwv_flow_imp.id(8704983229353838439)
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
 p_id=>wwv_flow_imp.id(8704956884702838300)
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
 p_id=>wwv_flow_imp.id(8704937438990838186)
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
 p_id=>wwv_flow_imp.id(8704938592594838191)
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
 p_id=>wwv_flow_imp.id(8704926316441838116)
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
 p_id=>wwv_flow_imp.id(8704978392657838400)
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
 p_id=>wwv_flow_imp.id(8705012264232838575)
,p_db_column_name=>'PROD_UOM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704987974863838463)
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
 p_id=>wwv_flow_imp.id(8704966893422838342)
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
 p_id=>wwv_flow_imp.id(8704959342816838311)
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
 p_id=>wwv_flow_imp.id(8704954086266838280)
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
 p_id=>wwv_flow_imp.id(8704954522352838282)
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
 p_id=>wwv_flow_imp.id(8704966550084838341)
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
 p_id=>wwv_flow_imp.id(8704987195954838460)
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
 p_id=>wwv_flow_imp.id(8704987634334838461)
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
 p_id=>wwv_flow_imp.id(8705000269099838558)
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
 p_id=>wwv_flow_imp.id(8705004160544838563)
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
 p_id=>wwv_flow_imp.id(8705026736746838619)
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
 p_id=>wwv_flow_imp.id(8705031385549838625)
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
 p_id=>wwv_flow_imp.id(8704925537236838111)
,p_db_column_name=>'Sub Class'
,p_display_order=>211
,p_column_identifier=>'GU'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704924699916838108)
,p_db_column_name=>'Sub Group'
,p_display_order=>231
,p_column_identifier=>'GX'
,p_column_label=>'Sub Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704923089173838096)
,p_db_column_name=>'UOM'
,p_display_order=>271
,p_column_identifier=>'HB'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8705035713434838632)
,p_db_column_name=>'color'
,p_display_order=>281
,p_column_identifier=>'HC'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(21215390080962406951)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15924612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRINT:PROD_ID:PROD_REV:PROD_DESC11:PROD_UOM:Sub Class:Class:Sub Group:Group:PROD_SER_LOT_OPT:PROD_SER_NO_OPT:PROD_COST_METHOD:Status:PROD_CB_LEVEL:PROD_EXT_DESC1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7293661351488715665)
,p_plug_name=>'<b>Search</b>'
,p_static_id=>'b-search-b'
,p_region_name=>'FIE'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px rgba(0,0,0,0.36);display:none";'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13782182135357492261)
,p_plug_name=>'Item Filter'
,p_static_id=>'item-filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_translate_title=>'N'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528919853202572601)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Item'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:367020001:&SESSION.::&DEBUG.:RP,367020001::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528917836612572596)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528917487331572595)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528992469536573413)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_button_name=>'Clear'
,p_static_id=>'clear-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12100:&SESSION.::&DEBUG.:RR,3670200::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528991255172573412)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(21215568218142426027)
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
 p_id=>wwv_flow_imp.id(5528919465156572599)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Favourite'
,p_static_id=>'favourite'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--padRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favourite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition=>':WEB_FAVORITES = ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528917089276572592)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528918243557572598)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Migration'
,p_static_id=>'migration'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Migration'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:367020007:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528918643696572598)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:window.open(''&JASPER_REPORT_URL1./ICM&&JASPER_REPORT_URL2./ICM/ICM3033&p_bu=&P367020001_PROD_BU.&p_plnt=&GLOBAL_PLNT_ID.&p_prod_id=&P367020001_PROD_ID.&p_prod_rev=&P367020001_PROD_REV.&p_user=&GLOBAL_USER.&j_username=&JASPER_REPORT_USR_ID.&j_password=&JASPER_REPORT_PWD.&output=pdf'');'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528992043618573413)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(21215568218142426027)
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
 p_id=>wwv_flow_imp.id(5528919064466572599)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_button_name=>'Unfavourite'
,p_static_id=>'unfavourite'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--noUI:t-Button--padRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Un favourite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.submit(''FAV'');'
,p_button_condition=>':WEB_FAVORITES =''N''  OR :WEB_FAVORITES IS NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528991707584573413)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(21215568218142426027)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5529007195199573449)
,p_branch_name=>'Go to Item Master'
,p_branch_action=>'f?p=&APP_ID.:3670200:&SESSION.::&DEBUG.:RR,3670200:P12100_FIND_ITEM,P12100_FIND_REV,P12100_FIND_ITEM_DESC,P12100_FIND_EXT_DESC,P12100_FIND_UOM,P12100_FIND_UOM_DESC,P12100_FIND_SUBCLASS,P12100_FIND_SUBCLASS_DESC,P12100_FIND_CLASS,P12100_FIND_CLASS_DESC,P12100_FIND_SUBGROUP,P12100_FIND_SUBGROUP_DESC,P12100_FIND_GROUP,P12100_FIND_GROUP_DESC,P12100_FIND_STATUS,P12100_FIND_SALES_UOM,P12100_FIND_PUR_UOM,P12100_ITEM:&P12100_ITEM_1.,&P12100_REV.,&P12100_ITEM_DESC.,&P12100_EXT_DESC.,&P12100_UOM.,&P12100_UOM_DESC.,&P12100_SUB_CLASS.,&P12100_SUB_CLASS_DESC.,&P12100_CLASS.,&P12100_CLASS_DESC.,&P12100_SUB_GROUP.,&P12100_SUB_GROUP_DESC.,&P12100_GROUP.,&P12100_GROUP_DESC.,&P12100_STATUS.,&P12100_SALES_UOM.,&P12100_PUR_UOM.,A&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5529007630112573453)
,p_branch_name=>'Go to Print'
,p_branch_action=>'javascript:jasper();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ITEM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721877412735488)
,p_name=>'P12100_CLASS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Class'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Class'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721902829735489)
,p_name=>'P12100_CLASS_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721301124735483)
,p_name=>'P12100_EXT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Ext. Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6863262827739771106)
,p_name=>'P12100_FILTER_TYPE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7398316348209978517)
,p_name=>'P12100_FIND_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214351785774455)
,p_name=>'P12100_FIND_CLASS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214481433774456)
,p_name=>'P12100_FIND_CLASS_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822213934517774450)
,p_name=>'P12100_FIND_EXT_DESC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214772108774459)
,p_name=>'P12100_FIND_GROUP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214889556774460)
,p_name=>'P12100_FIND_GROUP_DESC'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822215021238774461)
,p_name=>'P12100_FIND_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822213763218774449)
,p_name=>'P12100_FIND_ITEM_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6803003080724232821)
,p_name=>'P12100_FIND_PUR_UOM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822213696454774448)
,p_name=>'P12100_FIND_REV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7340325111646221416)
,p_name=>'P12100_FIND_RPT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6803003173592232822)
,p_name=>'P12100_FIND_SALES_UOM'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5862958089972549546)
,p_name=>'P12100_FIND_STATUS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214160194774453)
,p_name=>'P12100_FIND_SUBCLASS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214255050774454)
,p_name=>'P12100_FIND_SUBCLASS_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214641974774457)
,p_name=>'P12100_FIND_SUBGROUP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214682137774458)
,p_name=>'P12100_FIND_SUBGROUP_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214031350774451)
,p_name=>'P12100_FIND_UOM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822214066244774452)
,p_name=>'P12100_FIND_UOM_DESC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106722279564735492)
,p_name=>'P12100_GROUP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Group'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106722353923735493)
,p_name=>'P12100_GROUP_DESC'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8704932581698838130)
,p_name=>'P12100_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13782182135357492261)
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721005409735480)
,p_name=>'P12100_ITEM_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721272201735482)
,p_name=>'P12100_ITEM_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Item Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106723100062735500)
,p_name=>'P12100_ITEM_DUMMY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721579344735485)
,p_name=>'P12100_PUR_UOM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Purchase UOM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(7106721151795735481)
,p_name=>'P12100_REV'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Rev.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
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
 p_id=>wwv_flow_imp.id(6802930424298232008)
,p_name=>'P12100_SALES_UOM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Sales UOM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(7147468531703510609)
,p_name=>'P12100_STATUS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;E,Entry Completed;N,Active;A,Inactive;I,Obsolete;O'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5940708094563488857)
,p_name=>'P12100_STOCKED'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(21215568218142426027)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7225218511136449920)
,p_name=>'P12100_STOCKED_1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721619222735486)
,p_name=>'P12100_SUB_CLASS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Sub Class'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Sub Class'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721757007735487)
,p_name=>'P12100_SUB_CLASS_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106722049997735490)
,p_name=>'P12100_SUB_GROUP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Sub Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106722132822735491)
,p_name=>'P12100_SUB_GROUP_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106721487039735484)
,p_name=>'P12100_UOM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7293661351488715665)
,p_prompt=>'Stock UOM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529001566869573442)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528917487331572595)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529002035828573442)
,p_event_id=>wwv_flow_imp.id(5529001566869573442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12100_ITEM_1,P12100_REV,P12100_ITEM_DESC,P12100_EXT_DESC,P12100_UOM,P12100_PUR_UOM,P12100_SALES_UOM,P12100_SUB_CLASS,P12100_CLASS,P12100_SUB_GROUP,P12100_GROUP,P12100_STATUS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529006169140573448)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528991255172573412)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529006654834573449)
,p_event_id=>wwv_flow_imp.id(5529006169140573448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529004410330573445)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(21215568218142426027)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529004901612573445)
,p_event_id=>wwv_flow_imp.id(5529004410330573445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21215568218142426027)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529005272757573445)
,p_name=>'fetch_find'
,p_static_id=>'fetch-find'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528992043618573413)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529005821538573448)
,p_event_id=>wwv_flow_imp.id(5529005272757573445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("FIE").show();',
    'apex.item("RIE").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529002442287573442)
,p_name=>'filter'
,p_static_id=>'filter'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528917089276572592)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529003449169573443)
,p_event_id=>wwv_flow_imp.id(5529002442287573442)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//apex.item("FIE").hide();',
    'apex.item("RIE").show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529002945382573443)
,p_event_id=>wwv_flow_imp.id(5529002442287573442)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21215568218142426027)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529003957071573443)
,p_event_id=>wwv_flow_imp.id(5529002442287573442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12100_FILTER_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5528999762832573434)
,p_name=>'find_rpt'
,p_static_id=>'find-rpt'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529000324916573435)
,p_event_id=>wwv_flow_imp.id(5528999762832573434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'serv'
,p_static_id=>'serv'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (document.getElementById("P12100_FIND_RPT").value ==''N''){',
    'apex.item("FIE").show();',
    'apex.item("RIE").hide();',
    '}',
    'else{',
    'apex.item("FIE").hide();',
    'apex.item("RIE").show();',
    '}',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5529000695284573438)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12100_ITEM_1'
,p_condition_element=>'P12100_ITEM_1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5529001221795573440)
,p_event_id=>wwv_flow_imp.id(5529000695284573438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P12100_ITEM_DESC,P12100_REV,P12100_EXT_DESC,P12100_ITEM_DUMMY',
  'items_to_submit', 'P12100_ITEM_1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P12100_ITEM_1 IS NOT NULL THEN ',
    '--:P12100_REV := func_find_max_prod_rev(:GLOBAL_bu,:P12100_ITEM_1);',
    'BEGIN',
    '  SELECT prod_rev INTO :P12100_REV',
    '    FROM (',
    '  SELECT prod_rev',
    '    FROM products',
    '   WHERE prod_bu = :GLOBAL_bu',
    '     AND prod_id = :P12100_ITEM_1',
    '   ORDER BY prod_rev DESC)',
    '  WHERE ROWNUM = 1;',
    '  EXCEPTION WHEN NO_DATA_FOUND THEN',
    '  NULL;',
    'END;',
    '',
    'begin',
    'SELECT  prod_ext_desc1,prod_desc11,prod_rev ',
    '  INTO :P12100_EXT_DESC , :P12100_ITEM_DESC, :P12100_REV',
    '  FROM products',
    '   WHERE prod_bu = :GLOBAL_bu',
    '  and prod_id = :P12100_ITEM_1;',
    'EXCEPTION WHEN NO_DATA_FOUND THEN',
    ':P12100_EXT_DESC :=NULL;',
    ' :P12100_ITEM_DESC :=NULL;',
    '  :P12100_REV   :=NULL;',
    'end;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5528998797465573431)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear Filter'
,p_static_id=>'clear-filter'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P12100_FIND_ITEM          :=NULL;',
':P12100_FIND_REV           :=NULL;',
':P12100_FIND_ITEM_DESC     :=NULL;',
':P12100_FIND_EXT_DESC      :=NULL;',
':P12100_FIND_UOM           :=NULL;',
':P12100_FIND_UOM_DESC      :=NULL;',
':P12100_FIND_SUBCLASS      :=NULL;',
':P12100_FIND_SUBCLASS_DESC :=NULL;',
':P12100_FIND_CLASS         :=NULL;',
':P12100_FIND_CLASS_DESC    :=NULL;',
':P12100_FIND_SUBGROUP      :=NULL;',
':P12100_FIND_SUBGROUP_DESC :=NULL;',
':P12100_FIND_GROUP         :=NULL;',
':P12100_FIND_GROUP_DESC    :=NULL;',
':P12100_FIND_STATUS        :=NULL;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>47036961921962403
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5528999392737573434)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Report'
,p_static_id=>'process-for-report'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':GLOBAL_RPT_SUB_VOU:= ''RPTITM'';',
':GLOBAL_RPT_VOU_NO := :P12100_FIND_ITEM;',
':GLOBAL_RPT_VOU_PFX := :P12100_FIND_REV;',
':GLOBAL_RPT_PLNT   := :GLOBAL_PLNT_ID;',
':GLOBAL_RPT_TYPE := ''N'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ITEM'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>47037557193962406
);
wwv_flow_imp.component_end;
end;
/
