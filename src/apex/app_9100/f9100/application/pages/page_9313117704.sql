prompt --application/pages/page_9313117704
begin
--   Manifest
--     PAGE: 9313117704
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
 p_id=>9313117704
,p_name=>'Create MRV'
,p_alias=>'CREATE_MRV_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending MRV Lines'
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
 p_id=>wwv_flow_imp.id(7386049538693554152)
,p_plug_name=>'PENDING'
,p_static_id=>'pending'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ISTHDH_BU,',
'       ISTHDH_DOC_NO Doc_No,',
'       ISTHDH_DOC_OPER,',
'       ISTHDH_ISSUEFM_STORE_ID,',
'       DECODE(ISTHDH_ISSUETO_TYPE,''S'',''Intra Transfer'',''I'',''Inter Transfer'',''W'',''WIP'') Receiver,',
'       ISTHDH_ISSUETO_ID,',
'       case when isthdh_issueto_id is not null then  func_find_store_qry_desc(isthdh_bu,isthdh_issueto_id,1) end  Receiver_WH,',
'       ISTHDH_TRANS_DATE,',
'       TO_DATE(ISTHDH_TRANS_DATE,:GLOBAL_RPT_DATE_MASK) Trans_Date ,',
'       ISTHDH_ISSUER_ID,',
'       ISTHDH_ISSUER_NAME,',
'              (select distinct IIC_DESC ',
'          from inv_iss_code ',
'         where IIC_BU = :Global_bu',
'           AND  IIC_CODE = ISTHDH_ISS_CODE)IssCode,',
'       ISTHDH_PLNT,',
'       ISTHDH_RCPT_PFX,',
'       ISTHDH_RCPT_NO,',
'       ISTHDH_RECVD_BY Received_By,',
'       ISTHDH_ISSUED_BY Issued_By,',
'       ISTHDH_PLNT_LOC_ID,',
'       ISTHDH_PLNT_LOC_NAME Location,',
'       ISTHDH_RECVD_BY_NAME,',
'       ISTHDH_VOU_TYPE,',
'       ISTLNH_VOU_TYPE Vou_Type,',
'       ISTLNH_VOU_NO Vou_No,',
'       ISTLNH_VOU_SEQ_NO Vou_Seq_No,',
'       ISTLNH_SEQ_NO Seq_No,',
'       ISTLNH_PROD_ID Item ,',
'       ISTLNH_PROD_REV Rev,',
'       (select prod_desc11 from products where prod_bu = istlnh_bu and prod_id = ISTLNH_PROD_ID and prod_rev = ISTLNH_PROD_REV) Item_Desc,',
'       (select prod_ext_desc1 from products where prod_bu = istlnh_bu and prod_id = ISTLNH_PROD_ID and prod_rev = ISTLNH_PROD_REV) Item_Desc1,',
'       ISTLNH_UOM UOM,',
'       ISTLNH_PROD_UOM,',
'       ISTLNH_CONV_FACTOR,',
'       ISTLNH_PROD_CLS,',
'       ISTLNH_RQST_QTY Rqst_Qty,',
'       ISTLNH_TRANS_QTY Trans_Qty,',
'       ISTLNH_REJECTED_QTY,',
'       ISTLNH_DEFECT_QTY,',
'       ISTLNH_ACCEPTED_QTY,',
'       ISTLNH_UNIT_COST Unit_Cost,',
'       ISTLNH_PROC_QTY,',
'       ISTLNH_INPROC_QTY,',
'       ISTHDH_REFERENCE,',
'       DECODE(isthdh_issuefm_store_type,''Y'',''W W/H'',''N'',''WO W/H'')isthdh_issuefm_store_type,',
'       istlnh_po_ord_no,',
'       istlnh_rqst_no,',
'       istlnh_rqst_seq_no,',
'       ISTHDH_ISS_CODE,',
'       ISTLNH_PROCESS_ID,',
'       istlnh_sou_proc_id,',
'       func_find_proc_qry_desc(:GLOBAL_bu,istlnh_sou_proc_id,1) Process_Desc,',
'       func_find_proc_qry_desc(:GLOBAL_bu,ISTLNH_PROCESS_ID,1) TAR_Process_Desc,',
'       ISTLNH_OPRN_LN_SEQ_NO,',
'       --func_find_mfg_oper_desc(:global_bu,ISTHDH_PLNT,ISTLNH_PROCESS_ID,1) process_desc,',
'       ISTLNH_SF_CODE,',
'       ISTLNH_SOU_OPRN_SEQ,',
'       ISTLNH_SO_SCHLD_DESC,',
'       ISTLNH_SEL_FLAG,',
'    ISTHDH_DC_NO,',
'    ISTHDH_LOT_NO',
' from INV_STOCK_TRANS_VW',
'  where ISTHDH_BU = :Global_bu ',
'  AND  (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P9313117704_PROD_ID,P9313117704_STORE,P9313117704_VOU_NO,P9313117704_DOC_NO,P9313117704_DATE,P9313117704_RECEIVER_TYPE,P9313117704_PROD_DESC,P9313117704_STORE_DESC,P9313117704_VOU_TYPE,P9313117704_SHOW_REC,P9313117704_PROD_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PENDING'
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
 p_id=>wwv_flow_imp.id(7386049660580554153)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1904087825036943125
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398794541913874128)
,p_db_column_name=>'DOC_NO'
,p_display_order=>3250
,p_column_identifier=>'LO'
,p_column_label=>'MIV No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7906778192426245528)
,p_db_column_name=>'ISSCODE'
,p_display_order=>3530
,p_column_identifier=>'MU'
,p_column_label=>'Iss. Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795050388874133)
,p_db_column_name=>'ISSUED_BY'
,p_display_order=>3300
,p_column_identifier=>'LT'
,p_column_label=>'Issued By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386049804390554154)
,p_db_column_name=>'ISTHDH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Isthdh Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5821359414880645433)
,p_db_column_name=>'ISTHDH_DC_NO'
,p_display_order=>3600
,p_column_identifier=>'ND'
,p_column_label=>'DC No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386049940864554156)
,p_db_column_name=>'ISTHDH_DOC_OPER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Isthdh Doc Oper'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7619006230868981033)
,p_db_column_name=>'ISTHDH_ISSUEFM_STORE_ID'
,p_display_order=>3450
,p_column_identifier=>'MI'
,p_column_label=>'Isthdh Issuefm Store Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398768583493873969)
,p_db_column_name=>'ISTHDH_ISSUEFM_STORE_TYPE'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Warehouse Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386050854427554165)
,p_db_column_name=>'ISTHDH_ISSUER_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Issuer ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386050959457554166)
,p_db_column_name=>'ISTHDH_ISSUER_NAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Issuer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386050294729554159)
,p_db_column_name=>'ISTHDH_ISSUETO_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Receiver'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7826718591194437828)
,p_db_column_name=>'ISTHDH_ISS_CODE'
,p_display_order=>3480
,p_column_identifier=>'MN'
,p_column_label=>'Iss. Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5771065723092421660)
,p_db_column_name=>'ISTHDH_LOT_NO'
,p_display_order=>3610
,p_column_identifier=>'NE'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398763929439873922)
,p_db_column_name=>'ISTHDH_PLNT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398768841332873921)
,p_db_column_name=>'ISTHDH_PLNT_LOC_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>' Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398764446794873928)
,p_db_column_name=>'ISTHDH_RCPT_NO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Rcpt. No.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398764339022873927)
,p_db_column_name=>'ISTHDH_RCPT_PFX'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Rcpt. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398771286956873945)
,p_db_column_name=>'ISTHDH_RECVD_BY_NAME'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Recvd. By Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386050744227554164)
,p_db_column_name=>'ISTHDH_REFERENCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7386050429318554160)
,p_db_column_name=>'ISTHDH_TRANS_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Trans. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398771389814873946)
,p_db_column_name=>'ISTHDH_VOU_TYPE'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Vou. Type HD'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772761691873960)
,p_db_column_name=>'ISTLNH_ACCEPTED_QTY'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Accepted Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772186078873954)
,p_db_column_name=>'ISTLNH_CONV_FACTOR'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Conv. Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772664862873959)
,p_db_column_name=>'ISTLNH_DEFECT_QTY'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Defect Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398794227494874124)
,p_db_column_name=>'ISTLNH_INPROC_QTY'
,p_display_order=>3210
,p_column_identifier=>'LK'
,p_column_label=>'Inproc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5835139491661378253)
,p_db_column_name=>'ISTLNH_OPRN_LN_SEQ_NO'
,p_display_order=>3570
,p_column_identifier=>'MY'
,p_column_label=>'Target Oprn.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398775726983874039)
,p_db_column_name=>'ISTLNH_PO_ORD_NO'
,p_display_order=>1360
,p_column_identifier=>'EF'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7826718671260437829)
,p_db_column_name=>'ISTLNH_PROCESS_ID'
,p_display_order=>3490
,p_column_identifier=>'MO'
,p_column_label=>'Target Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398794091274874123)
,p_db_column_name=>'ISTLNH_PROC_QTY'
,p_display_order=>3200
,p_column_identifier=>'LJ'
,p_column_label=>'Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772278100873955)
,p_db_column_name=>'ISTLNH_PROD_CLS'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Prod. Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772046461873953)
,p_db_column_name=>'ISTLNH_PROD_UOM'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398772601372873958)
,p_db_column_name=>'ISTLNH_REJECTED_QTY'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Rejected Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398773330719873965)
,p_db_column_name=>'ISTLNH_RQST_NO'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'MR No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7826718449715437827)
,p_db_column_name=>'ISTLNH_RQST_SEQ_NO'
,p_display_order=>3470
,p_column_identifier=>'MM'
,p_column_label=>'MR Line No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398798071972874163)
,p_db_column_name=>'ISTLNH_SEL_FLAG'
,p_display_order=>3440
,p_column_identifier=>'MH'
,p_column_label=>'Istlnh Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7826718771253437830)
,p_db_column_name=>'ISTLNH_SF_CODE'
,p_display_order=>3500
,p_column_identifier=>'MP'
,p_column_label=>'SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7826718858370437831)
,p_db_column_name=>'ISTLNH_SOU_OPRN_SEQ'
,p_display_order=>3510
,p_column_identifier=>'MQ'
,p_column_label=>'Source Oprn.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7920660136976969043)
,p_db_column_name=>'ISTLNH_SOU_PROC_ID'
,p_display_order=>3540
,p_column_identifier=>'MV'
,p_column_label=>'Istlnh Sou Proc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7889408599391844820)
,p_db_column_name=>'ISTLNH_SO_SCHLD_DESC'
,p_display_order=>3520
,p_column_identifier=>'MR'
,p_column_label=>'SO Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795611938874138)
,p_db_column_name=>'ITEM'
,p_display_order=>3360
,p_column_identifier=>'LY'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398797980094874162)
,p_db_column_name=>'ITEM_DESC'
,p_display_order=>3430
,p_column_identifier=>'MG'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6085651353358447335)
,p_db_column_name=>'ITEM_DESC1'
,p_display_order=>3590
,p_column_identifier=>'NC'
,p_column_label=>'Item Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795197666874134)
,p_db_column_name=>'LOCATION'
,p_display_order=>3310
,p_column_identifier=>'LU'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7920660250101969044)
,p_db_column_name=>'PROCESS_DESC'
,p_display_order=>3550
,p_column_identifier=>'MW'
,p_column_label=>'Sou. Process '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795011177874132)
,p_db_column_name=>'RECEIVED_BY'
,p_display_order=>3290
,p_column_identifier=>'LS'
,p_column_label=>'Received By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5835140116434378259)
,p_db_column_name=>'RECEIVER'
,p_display_order=>3580
,p_column_identifier=>'NA'
,p_column_label=>'Receiver'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398794682675874129)
,p_db_column_name=>'RECEIVER_WH'
,p_display_order=>3260
,p_column_identifier=>'LP'
,p_column_label=>'Receiver Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795715921874139)
,p_db_column_name=>'REV'
,p_display_order=>3370
,p_column_identifier=>'LZ'
,p_column_label=>'Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398794520736874127)
,p_db_column_name=>'ROWID'
,p_display_order=>3240
,p_column_identifier=>'LN'
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
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795865454874141)
,p_db_column_name=>'RQST_QTY'
,p_display_order=>3390
,p_column_identifier=>'MB'
,p_column_label=>'Rqst. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795460377874137)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>3350
,p_column_identifier=>'LX'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5835139285727378251)
,p_db_column_name=>'TAR_PROCESS_DESC'
,p_display_order=>3560
,p_column_identifier=>'MX'
,p_column_label=>'Target Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7806869598419352256)
,p_db_column_name=>'TRANS_DATE'
,p_display_order=>3460
,p_column_identifier=>'ML'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795941993874142)
,p_db_column_name=>'TRANS_QTY'
,p_display_order=>3400
,p_column_identifier=>'MC'
,p_column_label=>'Trans. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398796081259874143)
,p_db_column_name=>'UNIT_COST'
,p_display_order=>3410
,p_column_identifier=>'MD'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795804560874140)
,p_db_column_name=>'UOM'
,p_display_order=>3380
,p_column_identifier=>'MA'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795246416874135)
,p_db_column_name=>'VOU_NO'
,p_display_order=>3330
,p_column_identifier=>'LV'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7398795360236874136)
,p_db_column_name=>'VOU_SEQ_NO'
,p_display_order=>3340
,p_column_identifier=>'LW'
,p_column_label=>'Vou. Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5924613508708973352)
,p_db_column_name=>'VOU_TYPE'
,p_display_order=>3320
,p_column_identifier=>'NB'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7399035210471103120)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16490551'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOC_NO:TRANS_DATE:VOU_TYPE:VOU_NO:VOU_SEQ_NO:ITEM:REV:ITEM_DESC:ITEM_DESC1:UOM:TRANS_QTY:RQST_QTY:UNIT_COST:ISTHDH_ISSUETO_ID:RECEIVER_WH:ISTHDH_DC_NO:ISTLNH_RQST_NO:ISTLNH_RQST_SEQ_NO:ISTLNH_PO_ORD_NO:PROCESS_DESC:TAR_PROCESS_DESC:ISTLNH_SF_CODE:IST'
||'LNH_SOU_OPRN_SEQ:ISTLNH_OPRN_LN_SEQ_NO:ISTHDH_LOT_NO:ISTLNH_SO_SCHLD_DESC:ISTHDH_REFERENCE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5977428615503098278)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7386049538693554152)
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
 p_id=>wwv_flow_imp.id(5995964633617053029)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5977428615503098278)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5995964644124053030)
,p_event_id=>wwv_flow_imp.id(5995964633617053029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
