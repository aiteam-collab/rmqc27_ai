prompt --application/pages/page_93131006
begin
--   Manifest
--     PAGE: 93131006
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
 p_id=>93131006
,p_name=>'Open Inv. Pipeline Items'
,p_alias=>'OPEN-INV-PIPELINE-ITEMS'
,p_page_mode=>'MODAL'
,p_step_title=>'Open Inv. Pipeline Items'
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
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5596781660857071436)
,p_plug_name=>'Open Inv. Pipeline Items'
,p_static_id=>'open-inv-pipeline-items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       SRP_BU,',
'       SRP_STORE_ID,',
'      (SELECT store_desc1',
'         FROM stores',
'        WHERE store_bu = :GLOBAL_BU',
'          AND store_id = SRP_STORE_ID)SRP_STORE_DESC,',
'       SRP_PROD_ID,',
'       SRP_PROD_REV,',
'       (  SELECT prod_desc11',
'            FROM products',
'           WHERE prod_bu = :GLOBAL_BU',
'             AND prod_id = SRP_PROD_ID',
'             AND prod_rev = SRP_PROD_REV)SRP_PROD_DESC,',
'       SRP_REORD_QTY,',
'       SRP_ORDER_QTY,',
'       SRP_SEL_FLAG,',
'       SRP_PR_CRE_FLAG,',
'       SRP_PR_PFX,',
'       SRP_PR_NO,',
'		DECODE(SRP_RE_ORD_TYPE,''PR'',''PR'',''MR'',''MR'',''MI'',''MR(Inter Trans.)'',''PO'',''PO'',''SR'',''SSR'',',
'							          ''SS'',''SSO'',''ST'',''ST PO'')SRP_RE_ORD_TYPE,',
'       DECODE(SRP_STATUS,''N'',''Draft'')SRP_STATUS,',
'       DECODE(SRP_STATUS,''N'',''Blue'') COLOR,',
'       SRP_REFERENCE,',
'       SRP_MI_TRANS_UNIT,',
'       SRP_MI_TO_STORE_ID,',
'       SRP_CUR_PROC_QTY,',
'       SRP_PROCESSED_QTY,',
'       SRP_SEL_USER,',
'       SRP_PIPELINE_NO,',
'       SRP_INV_METHOD,',
'       SRP_LAST_PUR_PRICE,',
'       SRP_STK_QTY,',
'       SRP_PEND_PR_QTY,',
'       SRP_PEND_PO_QTY,',
'       SRP_PEND_MR_QTY,',
'       SRP_CRE_BY,',
'       SRP_CRE_IP_ADDR,',
'       SRP_CRE_OS_USER,',
'       SRP_CRE_DATE,',
'       SRP_UPD_BY,',
'       SRP_UPD_IP_ADDR,',
'       SRP_UPD_OS_USER,',
'       SRP_UPD_DATE,',
'       SRP_CRE_EMP_ID,',
'       SRP_UPD_EMP_ID,',
'       SRP_PLNT,',
'       SRP_PLNT_LOC_ID',
'  FROM  STOCK_REORDER_PIPLINE',
'  WHERE srp_bu = :GLOBAL_bu ',
'    AND srp_status = ''N'''))
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
 p_id=>wwv_flow_imp.id(5596781739502071437)
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
,p_internal_uid=>114819903958460409
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5599166887358958029)
,p_db_column_name=>'COLOR'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785610771071475)
,p_db_column_name=>'ROWID'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596781841686071438)
,p_db_column_name=>'SRP_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Srp Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784377859071463)
,p_db_column_name=>'SRP_CRE_BY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Srp Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784649895071466)
,p_db_column_name=>'SRP_CRE_DATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Srp Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785172577071471)
,p_db_column_name=>'SRP_CRE_EMP_ID'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Srp Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784460233071464)
,p_db_column_name=>'SRP_CRE_IP_ADDR'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Srp Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784604039071465)
,p_db_column_name=>'SRP_CRE_OS_USER'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Srp Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783340796071453)
,p_db_column_name=>'SRP_CUR_PROC_QTY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Srp Cur Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783780990071457)
,p_db_column_name=>'SRP_INV_METHOD'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Srp Inv Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783907554071458)
,p_db_column_name=>'SRP_LAST_PUR_PRICE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Last Pur Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783296579071452)
,p_db_column_name=>'SRP_MI_TO_STORE_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Srp Mi To Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783135696071451)
,p_db_column_name=>'SRP_MI_TRANS_UNIT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Srp Mi Trans Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782339398071443)
,p_db_column_name=>'SRP_ORDER_QTY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Srp Order Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784286217071462)
,p_db_column_name=>'SRP_PEND_MR_QTY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Srp Pend Mr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784146773071461)
,p_db_column_name=>'SRP_PEND_PO_QTY'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Srp Pend Po Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784134052071460)
,p_db_column_name=>'SRP_PEND_PR_QTY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Srp Pend Pr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783679746071456)
,p_db_column_name=>'SRP_PIPELINE_NO'
,p_display_order=>190
,p_is_primary_key=>'Y'
,p_column_identifier=>'S'
,p_column_label=>'Pipeline No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785343878071473)
,p_db_column_name=>'SRP_PLNT'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Unit ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785447159071474)
,p_db_column_name=>'SRP_PLNT_LOC_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783527193071454)
,p_db_column_name=>'SRP_PROCESSED_QTY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Srp Processed Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785800239071477)
,p_db_column_name=>'SRP_PROD_DESC'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782042918071440)
,p_db_column_name=>'SRP_PROD_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Item '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782138594071441)
,p_db_column_name=>'SRP_PROD_REV'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782603412071445)
,p_db_column_name=>'SRP_PR_CRE_FLAG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Srp Pr Cre Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782777635071447)
,p_db_column_name=>'SRP_PR_NO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Srp Pr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782714439071446)
,p_db_column_name=>'SRP_PR_PFX'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Srp Pr Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783074096071450)
,p_db_column_name=>'SRP_REFERENCE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Srp Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782331781071442)
,p_db_column_name=>'SRP_REORD_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Reorder Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782928579071448)
,p_db_column_name=>'SRP_RE_ORD_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Re Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782479737071444)
,p_db_column_name=>'SRP_SEL_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Srp Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783554503071455)
,p_db_column_name=>'SRP_SEL_USER'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Srp Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782976755071449)
,p_db_column_name=>'SRP_STATUS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style ="color:#COLOR#; font-weight:bold;">#SRP_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596783935992071459)
,p_db_column_name=>'SRP_STK_QTY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Srp Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785642564071476)
,p_db_column_name=>'SRP_STORE_DESC'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Warehouse Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596782008879071439)
,p_db_column_name=>'SRP_STORE_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Warehouse'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784768433071467)
,p_db_column_name=>'SRP_UPD_BY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Srp Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785064261071470)
,p_db_column_name=>'SRP_UPD_DATE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Srp Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785329739071472)
,p_db_column_name=>'SRP_UPD_EMP_ID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Srp Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596784901656071468)
,p_db_column_name=>'SRP_UPD_IP_ADDR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Srp Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5596785034423071469)
,p_db_column_name=>'SRP_UPD_OS_USER'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Srp Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5598640677205790498)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1166789'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SRP_PLNT_LOC_ID:SRP_PLNT:SRP_PIPELINE_NO:SRP_STORE_ID:SRP_STORE_DESC:SRP_PROD_ID:SRP_PROD_REV:SRP_PROD_DESC:SRP_REORD_QTY:SRP_RE_ORD_TYPE:SRP_LAST_PUR_PRICE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5977428280927098275)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5596781660857071436)
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
 p_id=>wwv_flow_imp.id(5977428434845098276)
,p_name=>'Cancel Region'
,p_static_id=>'cancel-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5977428280927098275)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5977428510578098277)
,p_event_id=>wwv_flow_imp.id(5977428434845098276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
