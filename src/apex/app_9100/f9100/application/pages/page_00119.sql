prompt --application/pages/page_00119
begin
--   Manifest
--     PAGE: 00119
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
 p_id=>119
,p_name=>'Item - Entity Level '
,p_alias=>'ITEM-ENTITY-LEVEL'
,p_step_title=>'Item - Entity Level '
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
 p_id=>wwv_flow_imp.id(21215464101654418322)
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
' and :P119_FILTER_TYPE = ''Y''',
'                  AND ((prod_status LIKE ''%''||:P119_STATUS ||''%'') OR :P119_STATUS IS NULL)',
'                 AND ((PROD_ID LIKE''%''|| :P119_ITEM_DUMMY||''%'' ) OR :P119_ITEM_DUMMY IS NULL) ',
'                 AND ((PROD_ID LIKE''%''|| :P119_ITEM_1||''%'' ) OR :P119_ITEM_1 IS NULL) ',
'                 AND ((PROD_DESC11 LIKE''%''|| :P119_ITEM_DESC||''%'')  OR :P119_ITEM_DESC IS NULL)',
'                 And (PROD_REV = :P119_REV or :P119_REV is null)',
'                 AND ((PROD_PUR_UOM LIKE ''%''|| :P119_PUR_UOM ||''%'' ) or :P119_PUR_UOM is null) ',
'                 AND ((PROD_SALE_UOM LIKE ''%''|| :P119_SALES_UOM ||''%'' ) or :P119_SALES_UOM is null) ',
'                 AND ((PROD_EXT_DESC1 LIKE ''%''|| :P119_EXT_DESC ||''%'') or :P119_EXT_DESC is null)',
'                 AND ((PROD_UOM LIKE ''%''|| :P119_UOM ||''%'') or :P119_UOM is null)',
'                 AND (((SELECT subcls_desc1',
'                          from sub_classes',
'                         WHERE  subcls_bu  = :Global_bu ',
'	                   and subcls_id  = prod_sub_cls) LIKE ''%''|| :P119_SUB_CLASS ||''%'') or :P119_SUB_CLASS is null)',
'                 AND (((SELECT class_desc1',
'                          from classes',
'                         WHERE  class_bu  = :Global_bu ',
'	                   and class_id  = prod_cls) LIKE ''%''|| :P119_CLASS ||''%'') or :P119_CLASS is null) ',
'                 AND (((SELECT PSGRP_SUBGROUP_DESC1',
'                          from prod_sub_group',
'                         WHERE  PSGRP_bu = :Global_bu ',
'	                        and PSGRP_SUBGROUP_ID = PROD_SUBGROUP_ID) LIKE ''%''|| :P119_SUB_GROUP ||''%'') or :P119_SUB_GROUP is null)',
'                  AND (((SELECT PGRP_GROUP_DESC1',
'                          from prod_group',
'                         WHERE  pgrp_bu = :Global_bu ',
'	                        and PGRP_GROUP_ID = prod_group_id) LIKE ''%''|| :P119_GROUP ||''%'') or :P119_GROUP is null)',
'           ORDER BY prod_upd_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P119_FILTER_TYPE,P119_ITEM_1,P119_REV,P119_ITEM_DESC,P119_EXT_DESC,P119_PUR_UOM,P119_SALES_UOM,P119_UOM,P119_CLASS,P119_SUB_CLASS,P119_GROUP,P119_SUB_GROUP,P119_STATUS'
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
 p_id=>wwv_flow_imp.id(21215463708127418322)
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
,p_internal_uid=>15733501872583807294
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704821009202830405)
,p_db_column_name=>'Class'
,p_display_order=>221
,p_column_identifier=>'GV'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704820141705830402)
,p_db_column_name=>'Group'
,p_display_order=>241
,p_column_identifier=>'GY'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704819372428830398)
,p_db_column_name=>'Major class'
,p_display_order=>261
,p_column_identifier=>'HA'
,p_column_label=>'Major Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398135844771969980)
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
 p_id=>wwv_flow_imp.id(8704872311096830677)
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
 p_id=>wwv_flow_imp.id(8704828636278830450)
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
 p_id=>wwv_flow_imp.id(8704843267517830525)
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
 p_id=>wwv_flow_imp.id(8704842912994830523)
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
 p_id=>wwv_flow_imp.id(8704881081977830745)
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
 p_id=>wwv_flow_imp.id(8704829022386830452)
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
 p_id=>wwv_flow_imp.id(8704845674216830552)
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
 p_id=>wwv_flow_imp.id(8704922199486830909)
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
 p_id=>wwv_flow_imp.id(8704868734880830661)
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
 p_id=>wwv_flow_imp.id(8704866797741830653)
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
 p_id=>wwv_flow_imp.id(6757754245286786080)
,p_db_column_name=>'PROD_CB_LEVEL'
,p_display_order=>301
,p_column_identifier=>'HE'
,p_column_label=>'Cost Batch Level'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704884284915830759)
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
 p_id=>wwv_flow_imp.id(8704830051620830461)
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
 p_id=>wwv_flow_imp.id(8704833708976830483)
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
 p_id=>wwv_flow_imp.id(8704825422889830425)
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
 p_id=>wwv_flow_imp.id(8704880246801830744)
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
 p_id=>wwv_flow_imp.id(8704880678353830745)
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
 p_id=>wwv_flow_imp.id(8704863174228830639)
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
 p_id=>wwv_flow_imp.id(8704861545439830630)
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
 p_id=>wwv_flow_imp.id(8704861239328830628)
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
 p_id=>wwv_flow_imp.id(8704825802600830427)
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
 p_id=>wwv_flow_imp.id(8704878715005830733)
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
 p_id=>wwv_flow_imp.id(8704908816292830872)
,p_db_column_name=>'PROD_COST_METHOD'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Cost Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704878326548830727)
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
 p_id=>wwv_flow_imp.id(8704881512355830748)
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
 p_id=>wwv_flow_imp.id(8704836137078830492)
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
 p_id=>wwv_flow_imp.id(8704836868239830497)
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
 p_id=>wwv_flow_imp.id(8704838842547830506)
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
 p_id=>wwv_flow_imp.id(8704838477059830505)
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
 p_id=>wwv_flow_imp.id(8704834848073830486)
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
 p_id=>wwv_flow_imp.id(8704844917293830537)
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
 p_id=>wwv_flow_imp.id(8704885349322830762)
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
 p_id=>wwv_flow_imp.id(8704918914399830905)
,p_db_column_name=>'PROD_DESC11'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704917887005830900)
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
 p_id=>wwv_flow_imp.id(8704829710922830461)
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
 p_id=>wwv_flow_imp.id(8704885786828830766)
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
 p_id=>wwv_flow_imp.id(8704837246626830500)
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
 p_id=>wwv_flow_imp.id(8704853577064830598)
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
 p_id=>wwv_flow_imp.id(8704865567904830650)
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
 p_id=>wwv_flow_imp.id(8704864413322830644)
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
 p_id=>wwv_flow_imp.id(8704892236456830817)
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
 p_id=>wwv_flow_imp.id(8704891773339830816)
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
 p_id=>wwv_flow_imp.id(8704891399829830814)
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
 p_id=>wwv_flow_imp.id(8704848398289830562)
,p_db_column_name=>'PROD_EXT_DESC1'
,p_display_order=>134
,p_column_identifier=>'ED'
,p_column_label=>'Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704848019304830561)
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
 p_id=>wwv_flow_imp.id(8704844518236830536)
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
 p_id=>wwv_flow_imp.id(8704851163898830580)
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
 p_id=>wwv_flow_imp.id(8704893434039830822)
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
 p_id=>wwv_flow_imp.id(8704879457913830739)
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
 p_id=>wwv_flow_imp.id(8704879905887830741)
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
 p_id=>wwv_flow_imp.id(8704841332136830519)
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
 p_id=>wwv_flow_imp.id(8704892981400830820)
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
 p_id=>wwv_flow_imp.id(8704869928212830664)
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
 p_id=>wwv_flow_imp.id(8704869077856830662)
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
 p_id=>wwv_flow_imp.id(8704860408827830625)
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
 p_id=>wwv_flow_imp.id(8704856423157830611)
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
 p_id=>wwv_flow_imp.id(8704859600625830623)
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
 p_id=>wwv_flow_imp.id(8704855974184830609)
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
 p_id=>wwv_flow_imp.id(8704857627056830616)
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
 p_id=>wwv_flow_imp.id(8704857211657830614)
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
 p_id=>wwv_flow_imp.id(8704859156041830622)
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
 p_id=>wwv_flow_imp.id(8704856748209830612)
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
 p_id=>wwv_flow_imp.id(8704860005098830623)
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
 p_id=>wwv_flow_imp.id(8704858757342830620)
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
 p_id=>wwv_flow_imp.id(8704832454831830478)
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
 p_id=>wwv_flow_imp.id(8704832056050830477)
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
 p_id=>wwv_flow_imp.id(8704850803528830578)
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
 p_id=>wwv_flow_imp.id(8704894631800830841)
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
 p_id=>wwv_flow_imp.id(8704852356936830589)
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
 p_id=>wwv_flow_imp.id(8704892564280830819)
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
 p_id=>wwv_flow_imp.id(8704897747247830856)
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
 p_id=>wwv_flow_imp.id(8704888144462830792)
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
 p_id=>wwv_flow_imp.id(8704855548745830606)
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
 p_id=>wwv_flow_imp.id(8704840441460830516)
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
 p_id=>wwv_flow_imp.id(8704835243322830487)
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
 p_id=>wwv_flow_imp.id(8704921065962830908)
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
 p_id=>wwv_flow_imp.id(8704839326801830509)
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
 p_id=>wwv_flow_imp.id(8704828221006830447)
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
 p_id=>wwv_flow_imp.id(8704858420570830619)
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
 p_id=>wwv_flow_imp.id(8704844088843830533)
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
 p_id=>wwv_flow_imp.id(8704831309926830470)
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
 p_id=>wwv_flow_imp.id(8704849566001830570)
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
 p_id=>wwv_flow_imp.id(8704841663583830520)
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
 p_id=>wwv_flow_imp.id(8704887360789830772)
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
 p_id=>wwv_flow_imp.id(8704886991285830769)
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
 p_id=>wwv_flow_imp.id(8704875502741830700)
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
 p_id=>wwv_flow_imp.id(8704887801277830789)
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
 p_id=>wwv_flow_imp.id(8704875908884830702)
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
 p_id=>wwv_flow_imp.id(8704870265675830666)
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
 p_id=>wwv_flow_imp.id(8704899026220830858)
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
 p_id=>wwv_flow_imp.id(8704851602097830581)
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
 p_id=>wwv_flow_imp.id(8704890607865830806)
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
 p_id=>wwv_flow_imp.id(8704863611942830642)
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
 p_id=>wwv_flow_imp.id(8704882334792830752)
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
 p_id=>wwv_flow_imp.id(8704852026602830587)
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
 p_id=>wwv_flow_imp.id(8704882657896830753)
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
 p_id=>wwv_flow_imp.id(8704888625529830797)
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
 p_id=>wwv_flow_imp.id(8704819797033830398)
,p_db_column_name=>'PROD_MAJOR_CLS'
,p_display_order=>251
,p_column_identifier=>'GZ'
,p_column_label=>'Prod Major Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704840078861830514)
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
 p_id=>wwv_flow_imp.id(8704860788006830627)
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
 p_id=>wwv_flow_imp.id(8704840930415830517)
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
 p_id=>wwv_flow_imp.id(8704854037861830602)
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
 p_id=>wwv_flow_imp.id(8704849162305830567)
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
 p_id=>wwv_flow_imp.id(8704869500662830664)
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
 p_id=>wwv_flow_imp.id(8704875094094830700)
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
 p_id=>wwv_flow_imp.id(8704884946756830762)
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
 p_id=>wwv_flow_imp.id(8704867616601830656)
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
 p_id=>wwv_flow_imp.id(8704874686441830698)
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
 p_id=>wwv_flow_imp.id(8704848811672830566)
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
 p_id=>wwv_flow_imp.id(8704868028158830658)
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
 p_id=>wwv_flow_imp.id(8704839704351830511)
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
 p_id=>wwv_flow_imp.id(8704853164106830597)
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
 p_id=>wwv_flow_imp.id(8704842533803830523)
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
 p_id=>wwv_flow_imp.id(8704894225758830825)
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
 p_id=>wwv_flow_imp.id(8704836511008830495)
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
 p_id=>wwv_flow_imp.id(8704838067330830505)
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
 p_id=>wwv_flow_imp.id(8704837658797830502)
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
 p_id=>wwv_flow_imp.id(8704867187812830655)
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
 p_id=>wwv_flow_imp.id(8704870701367830669)
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
 p_id=>wwv_flow_imp.id(8704871071185830670)
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
 p_id=>wwv_flow_imp.id(8704834063855830484)
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
 p_id=>wwv_flow_imp.id(8704843675557830528)
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
 p_id=>wwv_flow_imp.id(8704830848169830469)
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
 p_id=>wwv_flow_imp.id(8704827423508830441)
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
 p_id=>wwv_flow_imp.id(8704830446870830464)
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
 p_id=>wwv_flow_imp.id(8704886157709830766)
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
 p_id=>wwv_flow_imp.id(8704835725254830491)
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
 p_id=>wwv_flow_imp.id(8704888972398830800)
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
 p_id=>wwv_flow_imp.id(8704857967559830619)
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
 p_id=>wwv_flow_imp.id(8704877911201830722)
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
 p_id=>wwv_flow_imp.id(8704873870178830691)
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
 p_id=>wwv_flow_imp.id(8704866348982830652)
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
 p_id=>wwv_flow_imp.id(8704865226802830648)
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
 p_id=>wwv_flow_imp.id(8704826162125830428)
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
 p_id=>wwv_flow_imp.id(8704847272715830558)
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
 p_id=>wwv_flow_imp.id(8704877109813830714)
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
 p_id=>wwv_flow_imp.id(8704876710165830709)
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
 p_id=>wwv_flow_imp.id(8704876269490830706)
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
 p_id=>wwv_flow_imp.id(8704847674995830559)
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
 p_id=>wwv_flow_imp.id(8704846922156830556)
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
 p_id=>wwv_flow_imp.id(8704911992331830877)
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
 p_id=>wwv_flow_imp.id(8704877473359830720)
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
 p_id=>wwv_flow_imp.id(8704889834979830803)
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
 p_id=>wwv_flow_imp.id(8704884623983830761)
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
 p_id=>wwv_flow_imp.id(8704829425861830459)
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
 p_id=>wwv_flow_imp.id(8704865947832830650)
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
 p_id=>wwv_flow_imp.id(8704864812006830647)
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
 p_id=>wwv_flow_imp.id(8704861962197830634)
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
 p_id=>wwv_flow_imp.id(8704889432502830800)
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
 p_id=>wwv_flow_imp.id(8704827012646830434)
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
 p_id=>wwv_flow_imp.id(8704826596774830430)
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
 p_id=>wwv_flow_imp.id(8704917522971830897)
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
 p_id=>wwv_flow_imp.id(8704915073182830881)
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
 p_id=>wwv_flow_imp.id(8704827787865830442)
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
 p_id=>wwv_flow_imp.id(8704842111642830522)
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
 p_id=>wwv_flow_imp.id(8704881847660830750)
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
 p_id=>wwv_flow_imp.id(8704871898139830673)
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
 p_id=>wwv_flow_imp.id(8704871497688830673)
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
 p_id=>wwv_flow_imp.id(8704886601930830767)
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
 p_id=>wwv_flow_imp.id(8704831707878830472)
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
 p_id=>wwv_flow_imp.id(8704854806729830605)
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
 p_id=>wwv_flow_imp.id(8704890950064830808)
,p_db_column_name=>'PROD_SER_LOT_OPT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Lot Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704832896844830480)
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
 p_id=>wwv_flow_imp.id(8704890199291830805)
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
 p_id=>wwv_flow_imp.id(8704872711679830678)
,p_db_column_name=>'PROD_SER_NO_OPT'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704864017257830642)
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
 p_id=>wwv_flow_imp.id(8704873121682830681)
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
 p_id=>wwv_flow_imp.id(8704873527315830686)
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
 p_id=>wwv_flow_imp.id(8704893828381830823)
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
 p_id=>wwv_flow_imp.id(8704904524598830864)
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
 p_id=>wwv_flow_imp.id(8704854421671830603)
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
 p_id=>wwv_flow_imp.id(8704822993721830414)
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
 p_id=>wwv_flow_imp.id(8704824231149830419)
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
 p_id=>wwv_flow_imp.id(8704845260937830541)
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
 p_id=>wwv_flow_imp.id(8704846442413830553)
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
 p_id=>wwv_flow_imp.id(8704821784177830408)
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
 p_id=>wwv_flow_imp.id(8704846112769830553)
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
 p_id=>wwv_flow_imp.id(8704822615061830411)
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
 p_id=>wwv_flow_imp.id(8704823396978830416)
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
 p_id=>wwv_flow_imp.id(8704823763998830417)
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
 p_id=>wwv_flow_imp.id(8704909229922830873)
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
 p_id=>wwv_flow_imp.id(8704868359794830659)
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
 p_id=>wwv_flow_imp.id(8704824542729830422)
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
 p_id=>wwv_flow_imp.id(8704825026389830423)
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
 p_id=>wwv_flow_imp.id(8704910503994830875)
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
 p_id=>wwv_flow_imp.id(8704879112865830734)
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
 p_id=>wwv_flow_imp.id(8704852768214830595)
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
 p_id=>wwv_flow_imp.id(8704833322502830481)
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
 p_id=>wwv_flow_imp.id(8704834476106830486)
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
 p_id=>wwv_flow_imp.id(8704822199953830411)
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
 p_id=>wwv_flow_imp.id(8704874276169830695)
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
 p_id=>wwv_flow_imp.id(8704908147744830870)
,p_db_column_name=>'PROD_UOM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704883858375830758)
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
 p_id=>wwv_flow_imp.id(8704862776934830637)
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
 p_id=>wwv_flow_imp.id(8704855226328830606)
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
 p_id=>wwv_flow_imp.id(8704849969778830575)
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
 p_id=>wwv_flow_imp.id(8704850405864830577)
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
 p_id=>wwv_flow_imp.id(8704862433596830636)
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
 p_id=>wwv_flow_imp.id(8704883079466830755)
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
 p_id=>wwv_flow_imp.id(8704883517846830756)
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
 p_id=>wwv_flow_imp.id(8704896152611830853)
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
 p_id=>wwv_flow_imp.id(8704900044056830858)
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
 p_id=>wwv_flow_imp.id(8704922620258830914)
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
 p_id=>wwv_flow_imp.id(8704927269061830920)
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
 p_id=>wwv_flow_imp.id(8704821420748830406)
,p_db_column_name=>'Sub Class'
,p_display_order=>211
,p_column_identifier=>'GU'
,p_column_label=>'Sub Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704820583428830403)
,p_db_column_name=>'Sub Group'
,p_display_order=>231
,p_column_identifier=>'GX'
,p_column_label=>'Sub Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704818972685830391)
,p_db_column_name=>'UOM'
,p_display_order=>271
,p_column_identifier=>'HB'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8704931596946830927)
,p_db_column_name=>'color'
,p_display_order=>281
,p_column_identifier=>'HC'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(21215285964474399246)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15924612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRINT:PROD_ID:PROD_REV:PROD_DESC11:PROD_UOM:Sub Class:Class:Sub Group:Group:PROD_SER_LOT_OPT:PROD_SER_NO_OPT:PROD_COST_METHOD:Status:PROD_CB_LEVEL:PROD_EXT_DESC1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(13782078018869484556)
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
 p_id=>wwv_flow_imp.id(5528815598782565085)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528813580158565081)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528813138412565079)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528887861912566143)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_button_name=>'Clear'
,p_static_id=>'clear-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RR,3670200::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5528886734904566142)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(21215464101654418322)
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
 p_id=>wwv_flow_imp.id(5528815150882565085)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528812878323565068)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528813988700565081)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528814422275565082)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528887461332566143)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(21215464101654418322)
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
 p_id=>wwv_flow_imp.id(5528814831516565084)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528887078819566143)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(21215464101654418322)
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
 p_id=>wwv_flow_imp.id(5528902675917566474)
,p_branch_name=>'Go to Item Master'
,p_branch_action=>'f?p=&APP_ID.:3670200:&SESSION.::&DEBUG.:RR,3670200:P119_FIND_ITEM,P119_FIND_REV,P119_FIND_ITEM_DESC,P119_FIND_EXT_DESC,P119_FIND_UOM,P119_FIND_UOM_DESC,P119_FIND_SUBCLASS,P119_FIND_SUBCLASS_DESC,P119_FIND_CLASS,P119_FIND_CLASS_DESC,P119_FIND_SUBGROUP,P119_FIND_SUBGROUP_DESC,P119_FIND_GROUP,P119_FIND_GROUP_DESC,P119_FIND_STATUS,P119_FIND_SALES_UOM,P119_FIND_PUR_UOM,P119_ITEM:&P119_ITEM_1.,&P119_REV.,&P119_ITEM_DESC.,&P119_EXT_DESC.,&P119_UOM.,&P119_UOM_DESC.,&P119_SUB_CLASS.,&P119_SUB_CLASS_DESC.,&P119_CLASS.,&P119_CLASS_DESC.,&P119_SUB_GROUP.,&P119_SUB_GROUP_DESC.,&P119_GROUP.,&P119_GROUP_DESC.,&P119_STATUS.,&P119_SALES_UOM.,&P119_PUR_UOM.,A&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5528903133370566485)
,p_branch_name=>'Go to Print'
,p_branch_action=>'javascript:jasper();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'ITEM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617528464727970)
,p_name=>'P119_CLASS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106617553881727971)
,p_name=>'P119_CLASS_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106616952176727965)
,p_name=>'P119_EXT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(6863158478791763588)
,p_name=>'P119_FILTER_TYPE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7398211752639971247)
,p_name=>'P119_FIND_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109756215767185)
,p_name=>'P119_FIND_CLASS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109885863767186)
,p_name=>'P119_FIND_CLASS_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109338947767180)
,p_name=>'P119_FIND_EXT_DESC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822110176538767189)
,p_name=>'P119_FIND_GROUP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822110293986767190)
,p_name=>'P119_FIND_GROUP_DESC'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822110425668767191)
,p_name=>'P119_FIND_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109167648767179)
,p_name=>'P119_FIND_ITEM_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6802898485154225551)
,p_name=>'P119_FIND_PUR_UOM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109100884767178)
,p_name=>'P119_FIND_REV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7340220762698213898)
,p_name=>'P119_FIND_RPT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6802898578022225552)
,p_name=>'P119_FIND_SALES_UOM'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5862853494402542276)
,p_name=>'P119_FIND_STATUS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109564624767183)
,p_name=>'P119_FIND_SUBCLASS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109659480767184)
,p_name=>'P119_FIND_SUBCLASS_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822110046404767187)
,p_name=>'P119_FIND_SUBGROUP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822110086567767188)
,p_name=>'P119_FIND_SUBGROUP_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109435780767181)
,p_name=>'P119_FIND_UOM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5822109470674767182)
,p_name=>'P119_FIND_UOM_DESC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617930616727974)
,p_name=>'P119_GROUP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106618004975727975)
,p_name=>'P119_GROUP_DESC'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8704828103188830719)
,p_name=>'P119_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13782078018869484556)
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106616656461727962)
,p_name=>'P119_ITEM_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106616923253727964)
,p_name=>'P119_ITEM_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106618751114727982)
,p_name=>'P119_ITEM_DUMMY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617230396727967)
,p_name=>'P119_PUR_UOM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106616802847727963)
,p_name=>'P119_REV'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(6802826075350224490)
,p_name=>'P119_SALES_UOM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7147364182755503091)
,p_name=>'P119_STATUS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5940603498993481587)
,p_name=>'P119_STOCKED'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(21215464101654418322)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7225114162188442402)
,p_name=>'P119_STOCKED_1'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_item_default=>'Y'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617270274727968)
,p_name=>'P119_SUB_CLASS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106617408059727969)
,p_name=>'P119_SUB_CLASS_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617701049727972)
,p_name=>'P119_SUB_GROUP'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(7106617783874727973)
,p_name=>'P119_SUB_GROUP_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7106617138091727966)
,p_name=>'P119_UOM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7293557235000707960)
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
 p_id=>wwv_flow_imp.id(5528896942607566454)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528813138412565079)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528897359093566457)
,p_event_id=>wwv_flow_imp.id(5528896942607566454)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_ITEM_1,P119_REV,P119_ITEM_DESC,P119_EXT_DESC,P119_UOM,P119_PUR_UOM,P119_SALES_UOM,P119_SUB_CLASS,P119_CLASS,P119_SUB_GROUP,P119_GROUP,P119_STATUS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5528901733823566465)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528886734904566142)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528902148831566467)
,p_event_id=>wwv_flow_imp.id(5528901733823566465)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5528899734124566463)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(21215464101654418322)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528900415507566465)
,p_event_id=>wwv_flow_imp.id(5528899734124566463)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21215464101654418322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5528900774487566465)
,p_name=>'fetch_find'
,p_static_id=>'fetch-find'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528887461332566143)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528901285386566465)
,p_event_id=>wwv_flow_imp.id(5528900774487566465)
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
 p_id=>wwv_flow_imp.id(5528897779197566457)
,p_name=>'filter'
,p_static_id=>'filter'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5528812878323565068)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528898803935566460)
,p_event_id=>wwv_flow_imp.id(5528897779197566457)
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
 p_id=>wwv_flow_imp.id(5528898301860566459)
,p_event_id=>wwv_flow_imp.id(5528897779197566457)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21215464101654418322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528899254673566462)
,p_event_id=>wwv_flow_imp.id(5528897779197566457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P119_FILTER_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5528895199383566437)
,p_name=>'find_rpt'
,p_static_id=>'find-rpt'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528895636567566449)
,p_event_id=>wwv_flow_imp.id(5528895199383566437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'serv'
,p_static_id=>'serv'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (document.getElementById("P119_FIND_RPT").value ==''N''){',
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
 p_id=>wwv_flow_imp.id(5528896079517566451)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P119_ITEM_1'
,p_condition_element=>'P119_ITEM_1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5528896584689566453)
,p_event_id=>wwv_flow_imp.id(5528896079517566451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P119_ITEM_DESC,P119_REV,P119_EXT_DESC,P119_ITEM_DUMMY',
  'items_to_submit', 'P119_ITEM_1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P119_ITEM_1 IS NOT NULL THEN ',
    '--:P119_REV := func_find_max_prod_rev(:GLOBAL_bu,:P119_ITEM_1);',
    'BEGIN',
    '  SELECT prod_rev INTO :P119_REV',
    '    FROM (',
    '  SELECT prod_rev',
    '    FROM products',
    '   WHERE prod_bu = :GLOBAL_bu',
    '     AND prod_id = :P119_ITEM_1',
    '   ORDER BY prod_rev DESC)',
    '  WHERE ROWNUM = 1;',
    '  EXCEPTION WHEN NO_DATA_FOUND THEN',
    '  NULL;',
    'END;',
    '',
    'begin',
    'SELECT  prod_ext_desc1,prod_desc11,prod_rev ',
    '  INTO :P119_EXT_DESC , :P119_ITEM_DESC, :P119_REV',
    '  FROM products',
    '   WHERE prod_bu = :GLOBAL_bu',
    '  and prod_id = :P119_ITEM_1;',
    'EXCEPTION WHEN NO_DATA_FOUND THEN',
    ':P119_EXT_DESC :=NULL;',
    ' :P119_ITEM_DESC :=NULL;',
    '  :P119_REV   :=NULL;',
    'end;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5528894532380566417)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear Filter'
,p_static_id=>'clear-filter'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P119_FIND_ITEM          :=NULL;',
':P119_FIND_REV           :=NULL;',
':P119_FIND_ITEM_DESC     :=NULL;',
':P119_FIND_EXT_DESC      :=NULL;',
':P119_FIND_UOM           :=NULL;',
':P119_FIND_UOM_DESC      :=NULL;',
':P119_FIND_SUBCLASS      :=NULL;',
':P119_FIND_SUBCLASS_DESC :=NULL;',
':P119_FIND_CLASS         :=NULL;',
':P119_FIND_CLASS_DESC    :=NULL;',
':P119_FIND_SUBGROUP      :=NULL;',
':P119_FIND_SUBGROUP_DESC :=NULL;',
':P119_FIND_GROUP         :=NULL;',
':P119_FIND_GROUP_DESC    :=NULL;',
':P119_FIND_STATUS        :=NULL;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>46932696836955389
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5528894741254566426)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Report'
,p_static_id=>'process-for-report'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':GLOBAL_RPT_SUB_VOU:= ''RPTITM'';',
':GLOBAL_RPT_VOU_NO := :P119_FIND_ITEM;',
':GLOBAL_RPT_VOU_PFX := :P119_FIND_REV;',
':GLOBAL_RPT_PLNT   := :GLOBAL_PLNT_ID;',
':GLOBAL_RPT_TYPE := ''N'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ITEM'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>46932905710955398
);
wwv_flow_imp.component_end;
end;
/
