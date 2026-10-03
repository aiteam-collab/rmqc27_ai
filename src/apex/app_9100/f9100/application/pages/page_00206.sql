prompt --application/pages/page_00206
begin
--   Manifest
--     PAGE: 00206
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
 p_id=>206
,p_name=>'Shop Floor Notification'
,p_alias=>'SHOP-FLOOR-NOTIFICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Shop Floor Notification'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function title(){',
'	    var type; ',
'      type = apex.item( "P136_TYPE" ).getValue();',
'',
'     if ((type == ''BOM'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Bill of Material");',
'      }',
'',
'      if ((type == ''POU'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Production Order Unreleased");',
'      } ',
'	  if ((type == ''POC'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Production Order Completion");',
'      } ',
'	  if ((type == ''PFG'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Pending FG Packing");',
'      } ',
'	  if ((type == ''ROP'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Rework Order Pending");',
'      } ',
'	  if ((type == ''ROC'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Rework Order Completion");',
'      } ',
'      if ((type == ''SWP'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Serial Wise Pending");',
'      } ',
'} '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var button = parent.$(''.ui-dialog-titlebar-close''); ',
'button.hide();',
'title();',
'/* overallcheck();',
'cambiarTitulo(); */'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'',
'    white-space: nowrap;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8252587957887799743)
,p_plug_name=>'Bill of Material'
,p_static_id=>'bill-of-material'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select BOMHD_BU,',
'       BOMHD_PLNT,',
'       BOMHD_BOM_NO,',
'       BOMHD_PROD_ID,',
'       BOMHD_PROD_REV,',
'       (SELECT prod_desc11 ',
'         FROM products',
'        WHERE prod_bu = BOMHD_BU',
'        AND prod_id = BOMHD_PROD_ID',
'        AND prod_rev = BOMHD_PROD_REV)PARENT_DESC,',
'       DECODE(BOMHD_PRIMARY,''N'',''Secondary'',''Y'',''Primary'')BOMHD_PRIMARY,',
'       BOMHD_EFF_FROM,',
'       BOMHD_EFF_TO,',
'       BOMHD_ACTIVE_DATE,',
'       BOMHD_CANCEL_DATE,',
'       DECODE (BOMHD_STATUS,''E'',''Draft'',''A'',''Active'',''N'',''Entry Completed'',''I'',''Inactive'')BOMHD_STATUS,',
'       DECODE(BOMHD_STATUS,''E'',''Blue'',''A'',''Green'',''I'',''Red'',''N'',''Brown'') COLOR ,',
'       BOMHD_DFLT_BOM,',
'       BOMHD_CUMM_LEADTIME,',
'       BOMHD_PROD_CAT,',
'       BOMHD_PROD_STYLE,',
'       BOMHD_PROD_COLOR,',
'       BOMHD_PROD_SIZE,',
'       BOMHD_GAR_BOM_NO,',
'       BOMHD_ORDER_NO,',
'       BOMHD_BUYER_ID,',
'       BOMHD_DIA,',
'       BOMHD_GSM,',
'       BOMHD_STRUCTURE,',
'       BOMHD_CONTENT,',
'       BOMHD_COUNT,',
'       BOMHD_PARTIAL,',
'       BOMHD_UOM,',
'       BOMHD_PROD_UOM,',
'       BOMHD_CONV_FACTOR,',
'       BOMHD_SO_PFX,',
'       BOMHD_SO_NO,',
'       BOMHD_SO_SEQNO,',
'       BOMHD_CUST_SPEC_MAT_FLAG,',
'       BOMHD_CUST_ID,',
'       BOMHD_PROJ_ID,',
'       BOMHD_TASK_ID,',
'       BOMHD_SO_SCHLD_DESC,',
'       BOMHD_SO_SUB_SEQ_NO,',
'       BOMHD_SF_CONS,',
'       BOMHD_DRG_NO,',
'       BOMHD_DRG_REV,',
'       BOMHD_WBS,',
'       BOMHD_ECN_NO,',
'       BOMHD_ECN_DATE,',
'       BOMHD_QTY,',
'       BOMHD_BOM_NAME,',
'       BOMHD_REVISION_NUM,',
'       BOMHD_REL_DATE,',
'       BOMHD_MODEL_ID,',
'       BOMHD_FDNG_SIZE,',
'       BOMHD_CRE_BY,',
'       BOMHD_CRE_IP_ADDR,',
'       BOMHD_CRE_OS_USER,',
'       BOMHD_CRE_DATE,',
'       BOMHD_UPD_BY,',
'       BOMHD_UPD_IP_ADDR,',
'       BOMHD_UPD_OS_USER,',
'       BOMHD_UPD_DATE,',
'       BOMHD_THICKNESS,',
'       BOMHD_WIDTH,',
'       BOMHD_LENGTH,',
'       BOMHD_CRE_EMP_ID,',
'       BOMHD_UPD_EMP_ID,',
'       BOMHD_NO_OF_UPS,',
'       BOMHD_FIRST_PROC_CONS_RQRD,',
'       BOMHD_FILE_PATH,',
'       BOMHD_FILE_EXT,',
'       BOMHD_ISSUE_BY,',
'       BOMHD_PRJ_PLANNED,',
'       BOMHD_SQFT,',
'       BOMHD_CFT',
'  from BOM_HD',
'  WHERE BOMHD_BU = :GLOBAL_BU',
'    AND BOMHD_STATUS = ''E''',
'    AND bomhd_plnt IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'BOM'
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
 p_id=>wwv_flow_imp.id(8252588005464799744)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4615479323660563060
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212884995540180)
,p_db_column_name=>'BOMHD_ACTIVE_DATE'
,p_display_order=>100
,p_column_identifier=>'LP'
,p_column_label=>'Bomhd Active Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503797801611868)
,p_db_column_name=>'BOMHD_BOM_NAME'
,p_display_order=>480
,p_column_identifier=>'NB'
,p_column_label=>'BOM Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212228831540173)
,p_db_column_name=>'BOMHD_BOM_NO'
,p_display_order=>30
,p_column_identifier=>'LI'
,p_column_label=>'BOM No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212030232540171)
,p_db_column_name=>'BOMHD_BU'
,p_display_order=>10
,p_column_identifier=>'LG'
,p_column_label=>'Bomhd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501264425611842)
,p_db_column_name=>'BOMHD_BUYER_ID'
,p_display_order=>220
,p_column_identifier=>'MB'
,p_column_label=>'Bomhd Buyer Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212995435540181)
,p_db_column_name=>'BOMHD_CANCEL_DATE'
,p_display_order=>110
,p_column_identifier=>'LQ'
,p_column_label=>'Bomhd Cancel Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262506359286611843)
,p_db_column_name=>'BOMHD_CFT'
,p_display_order=>730
,p_column_identifier=>'OA'
,p_column_label=>'Bomhd Cft'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501641560611846)
,p_db_column_name=>'BOMHD_CONTENT'
,p_display_order=>260
,p_column_identifier=>'MF'
,p_column_label=>'Bomhd Content'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502098783611851)
,p_db_column_name=>'BOMHD_CONV_FACTOR'
,p_display_order=>310
,p_column_identifier=>'MK'
,p_column_label=>'Bomhd Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501711705611847)
,p_db_column_name=>'BOMHD_COUNT'
,p_display_order=>270
,p_column_identifier=>'MG'
,p_column_label=>'Bomhd Count'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504369110611873)
,p_db_column_name=>'BOMHD_CRE_BY'
,p_display_order=>530
,p_column_identifier=>'NG'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504609022611876)
,p_db_column_name=>'BOMHD_CRE_DATE'
,p_display_order=>560
,p_column_identifier=>'NJ'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505440740611884)
,p_db_column_name=>'BOMHD_CRE_EMP_ID'
,p_display_order=>640
,p_column_identifier=>'NR'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504380192611874)
,p_db_column_name=>'BOMHD_CRE_IP_ADDR'
,p_display_order=>540
,p_column_identifier=>'NH'
,p_column_label=>'IP Addrs.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504480132611875)
,p_db_column_name=>'BOMHD_CRE_OS_USER'
,p_display_order=>550
,p_column_identifier=>'NI'
,p_column_label=>'OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213413649540185)
,p_db_column_name=>'BOMHD_CUMM_LEADTIME'
,p_display_order=>150
,p_column_identifier=>'LU'
,p_column_label=>'Bomhd Cumm Leadtime'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502661093611856)
,p_db_column_name=>'BOMHD_CUST_ID'
,p_display_order=>360
,p_column_identifier=>'MP'
,p_column_label=>'Bomhd Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502487894611855)
,p_db_column_name=>'BOMHD_CUST_SPEC_MAT_FLAG'
,p_display_order=>350
,p_column_identifier=>'MO'
,p_column_label=>'Bomhd Cust Spec Mat Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213372780540184)
,p_db_column_name=>'BOMHD_DFLT_BOM'
,p_display_order=>140
,p_column_identifier=>'LT'
,p_column_label=>'Bomhd Dflt Bom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501296351611843)
,p_db_column_name=>'BOMHD_DIA'
,p_display_order=>230
,p_column_identifier=>'MC'
,p_column_label=>'Bomhd Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503191439611862)
,p_db_column_name=>'BOMHD_DRG_NO'
,p_display_order=>420
,p_column_identifier=>'MV'
,p_column_label=>'Bomhd Drg No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503312196611863)
,p_db_column_name=>'BOMHD_DRG_REV'
,p_display_order=>430
,p_column_identifier=>'MW'
,p_column_label=>'Bomhd Drg Rev'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503620628611866)
,p_db_column_name=>'BOMHD_ECN_DATE'
,p_display_order=>460
,p_column_identifier=>'MZ'
,p_column_label=>'Bomhd Ecn Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503492005611865)
,p_db_column_name=>'BOMHD_ECN_NO'
,p_display_order=>450
,p_column_identifier=>'MY'
,p_column_label=>'Bomhd Ecn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212745029540178)
,p_db_column_name=>'BOMHD_EFF_FROM'
,p_display_order=>80
,p_column_identifier=>'LN'
,p_column_label=>'Eff. From Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212835250540179)
,p_db_column_name=>'BOMHD_EFF_TO'
,p_display_order=>90
,p_column_identifier=>'LO'
,p_column_label=>'Eff. To Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504252524611872)
,p_db_column_name=>'BOMHD_FDNG_SIZE'
,p_display_order=>520
,p_column_identifier=>'NF'
,p_column_label=>'Bomhd Fdng Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505891910611889)
,p_db_column_name=>'BOMHD_FILE_EXT'
,p_display_order=>690
,p_column_identifier=>'NW'
,p_column_label=>'Bomhd File Ext'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505839451611888)
,p_db_column_name=>'BOMHD_FILE_PATH'
,p_display_order=>680
,p_column_identifier=>'NV'
,p_column_label=>'Bomhd File Path'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505673679611887)
,p_db_column_name=>'BOMHD_FIRST_PROC_CONS_RQRD'
,p_display_order=>670
,p_column_identifier=>'NU'
,p_column_label=>'Bomhd First Proc Cons Rqrd'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213892988540190)
,p_db_column_name=>'BOMHD_GAR_BOM_NO'
,p_display_order=>200
,p_column_identifier=>'LZ'
,p_column_label=>'Bomhd Gar Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501397937611844)
,p_db_column_name=>'BOMHD_GSM'
,p_display_order=>240
,p_column_identifier=>'MD'
,p_column_label=>'Bomhd Gsm'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262506007074611890)
,p_db_column_name=>'BOMHD_ISSUE_BY'
,p_display_order=>700
,p_column_identifier=>'NX'
,p_column_label=>'Bomhd Issue By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505339467611883)
,p_db_column_name=>'BOMHD_LENGTH'
,p_display_order=>630
,p_column_identifier=>'NQ'
,p_column_label=>'Bomhd Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504095675611871)
,p_db_column_name=>'BOMHD_MODEL_ID'
,p_display_order=>510
,p_column_identifier=>'NE'
,p_column_label=>'Bomhd Model Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505660132611886)
,p_db_column_name=>'BOMHD_NO_OF_UPS'
,p_display_order=>660
,p_column_identifier=>'NT'
,p_column_label=>'Bomhd No Of Ups'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213996137540191)
,p_db_column_name=>'BOMHD_ORDER_NO'
,p_display_order=>210
,p_column_identifier=>'MA'
,p_column_label=>'Bomhd Order No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501786402611848)
,p_db_column_name=>'BOMHD_PARTIAL'
,p_display_order=>280
,p_column_identifier=>'MH'
,p_column_label=>'Bomhd Partial'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212105902540172)
,p_db_column_name=>'BOMHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'LH'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212599035540177)
,p_db_column_name=>'BOMHD_PRIMARY'
,p_display_order=>70
,p_column_identifier=>'LM'
,p_column_label=>'BOM Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262506141570611891)
,p_db_column_name=>'BOMHD_PRJ_PLANNED'
,p_display_order=>710
,p_column_identifier=>'NY'
,p_column_label=>'Bomhd Prj Planned'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213526706540186)
,p_db_column_name=>'BOMHD_PROD_CAT'
,p_display_order=>160
,p_column_identifier=>'LV'
,p_column_label=>'Bomhd Prod Cat'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213731958540188)
,p_db_column_name=>'BOMHD_PROD_COLOR'
,p_display_order=>180
,p_column_identifier=>'LX'
,p_column_label=>'Bomhd Prod Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212322513540174)
,p_db_column_name=>'BOMHD_PROD_ID'
,p_display_order=>40
,p_column_identifier=>'LJ'
,p_column_label=>'Parent Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212436505540175)
,p_db_column_name=>'BOMHD_PROD_REV'
,p_display_order=>50
,p_column_identifier=>'LK'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213811659540189)
,p_db_column_name=>'BOMHD_PROD_SIZE'
,p_display_order=>190
,p_column_identifier=>'LY'
,p_column_label=>'Bomhd Prod Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213639262540187)
,p_db_column_name=>'BOMHD_PROD_STYLE'
,p_display_order=>170
,p_column_identifier=>'LW'
,p_column_label=>'Bomhd Prod Style'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502017914611850)
,p_db_column_name=>'BOMHD_PROD_UOM'
,p_display_order=>300
,p_column_identifier=>'MJ'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502724660611857)
,p_db_column_name=>'BOMHD_PROJ_ID'
,p_display_order=>370
,p_column_identifier=>'MQ'
,p_column_label=>'Bomhd Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503727211611867)
,p_db_column_name=>'BOMHD_QTY'
,p_display_order=>470
,p_column_identifier=>'NA'
,p_column_label=>'Bomhd Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503975264611870)
,p_db_column_name=>'BOMHD_REL_DATE'
,p_display_order=>500
,p_column_identifier=>'ND'
,p_column_label=>'Bomhd Rel Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503951127611869)
,p_db_column_name=>'BOMHD_REVISION_NUM'
,p_display_order=>490
,p_column_identifier=>'NC'
,p_column_label=>'BOM Rev.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503075013611861)
,p_db_column_name=>'BOMHD_SF_CONS'
,p_display_order=>410
,p_column_identifier=>'MU'
,p_column_label=>'Bomhd Sf Cons'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502281169611853)
,p_db_column_name=>'BOMHD_SO_NO'
,p_display_order=>330
,p_column_identifier=>'MM'
,p_column_label=>'Bomhd So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502197321611852)
,p_db_column_name=>'BOMHD_SO_PFX'
,p_display_order=>320
,p_column_identifier=>'ML'
,p_column_label=>'Bomhd So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502966987611859)
,p_db_column_name=>'BOMHD_SO_SCHLD_DESC'
,p_display_order=>390
,p_column_identifier=>'MS'
,p_column_label=>'Bomhd So Schld Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502438258611854)
,p_db_column_name=>'BOMHD_SO_SEQNO'
,p_display_order=>340
,p_column_identifier=>'MN'
,p_column_label=>'Bomhd So Seqno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503005934611860)
,p_db_column_name=>'BOMHD_SO_SUB_SEQ_NO'
,p_display_order=>400
,p_column_identifier=>'MT'
,p_column_label=>'Bomhd So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262506210386611842)
,p_db_column_name=>'BOMHD_SQFT'
,p_display_order=>720
,p_column_identifier=>'NZ'
,p_column_label=>'Bomhd Sqft'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213102393540182)
,p_db_column_name=>'BOMHD_STATUS'
,p_display_order=>120
,p_column_identifier=>'LR'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#BOMHD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501502619611845)
,p_db_column_name=>'BOMHD_STRUCTURE'
,p_display_order=>250
,p_column_identifier=>'ME'
,p_column_label=>'Bomhd Structure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262502823795611858)
,p_db_column_name=>'BOMHD_TASK_ID'
,p_display_order=>380
,p_column_identifier=>'MR'
,p_column_label=>'Bomhd Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505084203611881)
,p_db_column_name=>'BOMHD_THICKNESS'
,p_display_order=>610
,p_column_identifier=>'NO'
,p_column_label=>'Bomhd Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262501962951611849)
,p_db_column_name=>'BOMHD_UOM'
,p_display_order=>290
,p_column_identifier=>'MI'
,p_column_label=>'Bomhd Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504733171611877)
,p_db_column_name=>'BOMHD_UPD_BY'
,p_display_order=>570
,p_column_identifier=>'NK'
,p_column_label=>'Bomhd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504990989611880)
,p_db_column_name=>'BOMHD_UPD_DATE'
,p_display_order=>600
,p_column_identifier=>'NN'
,p_column_label=>'Bomhd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505520290611885)
,p_db_column_name=>'BOMHD_UPD_EMP_ID'
,p_display_order=>650
,p_column_identifier=>'NS'
,p_column_label=>'Bomhd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504848308611878)
,p_db_column_name=>'BOMHD_UPD_IP_ADDR'
,p_display_order=>580
,p_column_identifier=>'NL'
,p_column_label=>'Bomhd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262504940910611879)
,p_db_column_name=>'BOMHD_UPD_OS_USER'
,p_display_order=>590
,p_column_identifier=>'NM'
,p_column_label=>'Bomhd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262503400272611864)
,p_db_column_name=>'BOMHD_WBS'
,p_display_order=>440
,p_column_identifier=>'MX'
,p_column_label=>'Bomhd Wbs'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8262505240829611882)
,p_db_column_name=>'BOMHD_WIDTH'
,p_display_order=>620
,p_column_identifier=>'NP'
,p_column_label=>'Bomhd Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261213175082540183)
,p_db_column_name=>'COLOR'
,p_display_order=>130
,p_column_identifier=>'LS'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8261212475039540176)
,p_db_column_name=>'PARENT_DESC'
,p_display_order=>60
,p_column_identifier=>'LL'
,p_column_label=>'Parent Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8252734166103940359)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4932062'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'BOMHD_PLNT:BOMHD_BOM_NO:BOMHD_BOM_NAME:BOMHD_REVISION_NUM:BOMHD_PROD_ID:BOMHD_PROD_REV:PARENT_DESC:BOMHD_PROD_UOM:BOMHD_STATUS:BOMHD_EFF_FROM:BOMHD_EFF_TO:BOMHD_PRIMARY:BOMHD_CRE_BY:BOMHD_CRE_DATE:BOMHD_CRE_EMP_ID:BOMHD_CRE_IP_ADDR:BOMHD_CRE_OS_USER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7754974436594483312)
,p_plug_name=>'PARAMETER'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8480495645377260852)
,p_plug_name=>'Pending FG Packing'
,p_static_id=>'pending-fg-packing'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select POTV_TRANS_NO,',
'       POTV_BU,',
'       POTV_PLNT,',
'       POTV_ORD_NO,',
'       POTV_SEQ_NO,',
'       POTV_OPRN_ID,',
'       POTV_OPER_DESC,',
'       POTV_OPRN_FLAG,',
'       POTV_OPRN_CODE,',
'       POTV_DEPT_ID,',
'       POTV_DEPT_DESC,',
'       POTV_PROD_ID,',
'       POTV_PROD_REV,',
'       POTV_ITEM_DESC1,',
'       POTV_MFG_UOM,',
'       POTV_ORDER_QTY,',
'       POTV_QUEUE_QTY,',
'       POTV_QUEUE_WT_QTY,',
'       POTV_RUN_QTY,',
'       POTV_RUN_WT_QTY,',
'       --POTV_OS_RUN_QTY,',
'       NVL(POTV_OS_RUN_QTY,0) Outside_1,',
'       POTV_INPROGRESS_QTY,',
'       POTV_QC_RWK_REJ_QTY,',
'       POTV_COMP_QTY,',
'       POTV_REJ_QTY,',
'       POTV_SCRAP_QTY,',
'       POTV_REWORK_QTY,',
'       POTV_OS_REWORK_QTY,',
'       POTV_QC_QTY,',
'       POTV_LOT_NO,',
'       POTV_SER_NO,',
'       POTV_ROUTE_CARD_NO,',
'       POTV_START_DATE,',
'       POTV_END_DATE,',
'       POTV_ENTER_QTY,',
'       POTV_ENTER_WT_QTY,',
'       POTV_ST_QTY,',
'       POTV_SEL_FLAG,',
'       POTV_SOB_FLAG,',
'       POTV_OPRN_SEQ_NO,',
'       POTV_MOVE_TYPE,',
'       POTV_INS_PROC,',
'       POTV_OUT_PROC,',
'       POTV_NEXT_PROC_ID,',
'       POTV_NEXT_OPRN_ID,',
'       POTV_NEXT_SEQ,',
'       POTV_EXEC_SEQ_NO,',
'       POTV_OPRN_NO,',
'       POTV_USER,',
'       POTV_DIS_ASS_QTY,',
'       POTV_RTRN_QTY,',
'       POTV_PROJ_ID,',
'       POTV_TASK_ID,',
'       POTV_SO_PFX,',
'       POTV_SO_NO,',
'       POTV_SO_SEQ_NO,',
'       POTV_SO_SUB_SEQ_NO,',
'       POTV_SO_SCHLD_DESC,',
'       POTV_CUST_ID,',
'       POTV_CUST_NAME,',
'       POTV_TYPE,',
'       POTV_DATE,',
'       POTV_PP_NO,',
'       POTV_PP_REV,',
'       POTV_PP_SEQ_NO,',
'       POTV_PP_DATE,',
'       POTV_PROD_TYPE,',
'       POTV_CRE_BY,',
'       POTV_CRE_DATE,',
'       POTV_CRE_IP_ADDR,',
'       POTV_CRE_OS_USER,',
'       POTV_CRE_EMP_ID,',
'       POTV_UPD_BY,',
'       POTV_UPD_DATE,',
'       POTV_UPD_IP_ADDR,',
'       POTV_UPD_OS_USER,',
'       POTV_UPD_EMP_ID,',
'       POTV_SYS_LS_NO,',
'       POTV_ORD_SO_TYPE,',
'       POTV_CUST_PO_NO,',
'       POTV_CUST_PO_SEQ_NO,',
'       POTV_CUST_PO_DATE,',
'       POTV_SO_DESP_DATE,',
'       POTV_TOLR_PCT,',
'       POTV_TOLR_QTY,',
'       POTV_MAT_RQST_QTY,',
'       POTV_SUGGESTED_QTY,',
'       POTV_SUGG_PROC_QTY,',
'       POTV_CUR_PROC_QTY,',
'       POTV_IMPLEMENTED_QTY,',
'       POTV_IMPPROC_QTY,',
'       POTV_INSPEND_QTY,',
'       POTV_OUTPEND_QTY,',
'       POTV_JOBRQST_QTY,',
'       POTV_INSPROC_QTY,',
'       POTV_OUTPROC_QTY,',
'       POTV_JOBPROC_QTY,',
'       POTV_COMPSUG_QTY,',
'       POTV_COMPSUGPROC_QTY,',
'       POTV_SUGG_SEL_FLAG,',
'       POTV_SUGG_SEL_USER,',
'       POTV_COMP_CUR_PROC_QTY,',
'       POTV_COMP_SEL_FLAG,',
'       POTV_PEND_MR_QTY,',
'       POTV_SHORT_QTY,',
'       POTV_MR_IMP_USER,',
'       POTV_MR_IMP_SEL_FLAG,',
'       POTV_STYLE,',
'       POTV_COLOR,',
'       POTV_GAR_SIZE,',
'       POTV_SOU_BU,',
'       POTV_SOU_PLNT,',
'       POTV_SOU_ORD_PFX,',
'       POTV_SOU_ORD_NO,',
'       POTV_SOU_SEQ_NO,',
'       POTV_SOU_SUB_SEQ_NO,',
'       POTV_MR_QTY,',
'       POTV_QMR_QTY,',
'       POTV_DRG_NO,',
'       POTV_DRG_REV,',
'       POTV_PAR_PROD_ORD_NO,',
'       POTV_SFG_PROD_ORD_NO,',
'       POTV_COST_EST_VAL,',
'       POTV_LAST_AMEND_NO,',
'       POTV_GRADE_ID,',
'       POTV_SPEC_ID,',
'       POTV_HT_TEMP,',
'       POTV_UNIT_WEIGHT,',
'       POTV_MRP_NO,',
'       POTV_BOM_NO,',
'       POTV_BOM_NAME,',
'       POTV_OPRN_LN_SEQ,',
'       POTV_NO_OF_UPS,',
'       POTV_FDNG_SIZE,',
'       POTV_RT_CARD_NO,',
'       POTV_LOC_ID',
'     FROM PROD_ORD_TRANS_VIEW a',
'    WHERE potv_bu = :GLOBAL_BU ',
'	AND potv_type = ''PR'' ',
'	and POTV_SER_NO IS NULL',
'         AND (potv_oprn_flag IN (''I'', ''B'')',
'              OR (potv_oprn_flag IN (''O'')',
'                  AND func_find_vi_oprn_flag (:GLOBAL_BU, potv_oprn_id) = ''Y''))',
'         AND EXISTS',
'                (SELECT 1',
'                   FROM appl_user_plant_access',
'                  WHERE     auba_bu = :GLOBAL_BU',
'                        AND auba_user_id = :GLOBAL_USER',
'                        AND (SYSDATE) BETWEEN auba_from AND auba_to',
'                        AND potv_plnt = auba_plant)              ',
'         AND ( (potv_queue_qty + potv_run_qty + potv_os_run_qty) > 0',
'              AND (  potv_comp_qty',
'                   + potv_rej_qty',
'                   + potv_scrap_qty',
'                   + potv_rework_qty',
'                   + potv_dis_ass_qty) <>',
'                     (SELECT prohd_order_qty',
'                        FROM prod_order_hd',
'                       WHERE     prohd_bu = :GLOBAL_BU',
'                             AND prohd_plnt = potv_plnt',
'                             AND prohd_ord_no = potv_ord_no))              ',
'         AND EXISTS',
'                (SELECT prohd_ord_no',
'                   FROM prod_order_hd',
'                  WHERE     prohd_bu = :GLOBAL_BU',
'                        AND prohd_plnt = potv_plnt',
'                        AND prohd_status = ''P''',
'                        AND prohd_ord_no = potv_ord_no)  ',
'      AND  EXISTS (',
'                     SELECT * FROM mfg_oprns',
'                     where Mfgo_Pack_Flag=''Y''',
'                      AND  mfgo_bu=:GLOBAL_BU',
'                      AND  MFGO_OPRN_ID=POTV_OPRN_ID',
'                      )',
'        /* AND EXISTS ( (SELECT 1  from APPL_USER_ROLE_ACCESS',
'                        where AURA_BU =:GLOBAL_bu',
'                        AND  AURA_USER_ID   =:GLOBAL_USER',
'                        AND AURA_BENF_TYPE  =''W''',
'                        AND  AURA_BENF_ID  =POTV_PROC_ID',
'                         AND (TRUNC(SYSDATE) BETWEEN AURA_DATE_FROM AND AURA_DATE_TO ))',
'                            UNION   ',
'                         ( SELECT 1  from APPL_USER_ROLE_ACCESS',
'                        where AURA_BU =:GLOBAL_bu',
'                       AND  AURA_USER_ID   =:GLOBAL_USER',
'                        AND AURA_BENF_TYPE  =''N''',
'                        AND  AURA_BENF_ID IS NULL',
'                         AND (TRUNC(SYSDATE) BETWEEN AURA_DATE_FROM AND AURA_DATE_TO)))',
' /* FROM PROD_ORD_TRANS_VIEW',
'   WHERE potv_bu = :GLOBAL_BU ',
'	AND potv_type = ''PR'' and POTV_SER_NO IS NULL',
'         AND (potv_oprn_flag IN (''I'', ''B'') OR (potv_oprn_flag IN (''O'') AND func_find_vi_oprn_flag (:GLOBAL_BU, potv_oprn_id) = ''Y''))',
'         AND EXISTS (SELECT 1  FROM appl_user_plant_access',
'                  WHERE     auba_bu = :GLOBAL_BU',
'                        AND auba_user_id = :GLOBAL_USER',
'                        AND (SYSDATE) BETWEEN auba_from AND auba_to',
'                        AND potv_plnt = auba_plant)',
'         AND ( (potv_queue_qty + potv_run_qty + potv_os_run_qty) > 0',
'              AND (  potv_comp_qty + potv_rej_qty + potv_scrap_qty+ potv_rework_qty + potv_dis_ass_qty) <>',
'                     (SELECT prohd_order_qty',
'                        FROM prod_order_hd',
'                       WHERE     prohd_bu = :GLOBAL_BU',
'                             AND prohd_plnt = potv_plnt',
'                             AND prohd_ord_no = potv_ord_no))',
'         AND EXISTS',
'                (SELECT prohd_ord_no',
'                   FROM prod_order_hd',
'                  WHERE     prohd_bu = :GLOBAL_BU',
'                        AND prohd_plnt = potv_plnt',
'                        AND prohd_status = ''P''',
'                        AND prohd_ord_no = potv_ord_no)',
'           AND  EXISTS (',
'                     SELECT 1 FROM mfg_oprns',
'                     where Mfgo_Pack_Flag=''Y''',
'                      AND  mfgo_bu=:GLOBAL_BU',
'                      AND  MFGO_OPRN_ID=POTV_OPRN_ID',
'                      ) */',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'PFG'
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
 p_id=>wwv_flow_imp.id(8480495736546260853)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4843387054742024169
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995746707060940)
,p_db_column_name=>'OUTSIDE_1'
,p_display_order=>1370
,p_column_identifier=>'EG'
,p_column_label=>'Outside Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995146422060934)
,p_db_column_name=>'POTV_BOM_NAME'
,p_display_order=>1310
,p_column_identifier=>'EA'
,p_column_label=>'Potv Bom Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995093399060933)
,p_db_column_name=>'POTV_BOM_NO'
,p_display_order=>1300
,p_column_identifier=>'DZ'
,p_column_label=>'Potv Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480495985882260855)
,p_db_column_name=>'POTV_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Potv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992945245060912)
,p_db_column_name=>'POTV_COLOR'
,p_display_order=>1090
,p_column_identifier=>'DE'
,p_column_label=>'Potv Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991912720060952)
,p_db_column_name=>'POTV_COMPSUGPROC_QTY'
,p_display_order=>990
,p_column_identifier=>'CU'
,p_column_label=>'Potv Compsugproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991808070060951)
,p_db_column_name=>'POTV_COMPSUG_QTY'
,p_display_order=>980
,p_column_identifier=>'CT'
,p_column_label=>'Potv Compsug Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992262966060955)
,p_db_column_name=>'POTV_COMP_CUR_PROC_QTY'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Potv Comp Cur Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984433749060927)
,p_db_column_name=>'POTV_COMP_QTY'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Potv Comp Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992318286060956)
,p_db_column_name=>'POTV_COMP_SEL_FLAG'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'Potv Comp Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994345939060926)
,p_db_column_name=>'POTV_COST_EST_VAL'
,p_display_order=>1230
,p_column_identifier=>'DS'
,p_column_label=>'Potv Cost Est Val'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988825201060921)
,p_db_column_name=>'POTV_CRE_BY'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Potv Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988992184060922)
,p_db_column_name=>'POTV_CRE_DATE'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Potv Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989251735060925)
,p_db_column_name=>'POTV_CRE_EMP_ID'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Potv Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989068920060923)
,p_db_column_name=>'POTV_CRE_IP_ADDR'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Potv Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989124339060924)
,p_db_column_name=>'POTV_CRE_OS_USER'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Potv Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990978896060942)
,p_db_column_name=>'POTV_CUR_PROC_QTY'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Potv Cur Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987937347060912)
,p_db_column_name=>'POTV_CUST_ID'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Potv Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988087136060913)
,p_db_column_name=>'POTV_CUST_NAME'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Potv Cust Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990263886060935)
,p_db_column_name=>'POTV_CUST_PO_DATE'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Potv Cust Po Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990086413060933)
,p_db_column_name=>'POTV_CUST_PO_NO'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Potv Cust Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990186704060934)
,p_db_column_name=>'POTV_CUST_PO_SEQ_NO'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Potv Cust Po Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988277550060915)
,p_db_column_name=>'POTV_DATE'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Potv Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983176372060914)
,p_db_column_name=>'POTV_DEPT_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Potv Dept Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983076484060913)
,p_db_column_name=>'POTV_DEPT_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Potv Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987071482060953)
,p_db_column_name=>'POTV_DIS_ASS_QTY'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Potv Dis Ass Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993929499060922)
,p_db_column_name=>'POTV_DRG_NO'
,p_display_order=>1190
,p_column_identifier=>'DO'
,p_column_label=>'Potv Drg No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994081628060923)
,p_db_column_name=>'POTV_DRG_REV'
,p_display_order=>1200
,p_column_identifier=>'DP'
,p_column_label=>'Potv Drg Rev'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985478077060937)
,p_db_column_name=>'POTV_END_DATE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Potv End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985570730060938)
,p_db_column_name=>'POTV_ENTER_QTY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Comp. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985631232060939)
,p_db_column_name=>'POTV_ENTER_WT_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Potv Enter Wt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986726887060950)
,p_db_column_name=>'POTV_EXEC_SEQ_NO'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Potv Exec Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995487220060937)
,p_db_column_name=>'POTV_FDNG_SIZE'
,p_display_order=>1340
,p_column_identifier=>'ED'
,p_column_label=>'Potv Fdng Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993003208060913)
,p_db_column_name=>'POTV_GAR_SIZE'
,p_display_order=>1100
,p_column_identifier=>'DF'
,p_column_label=>'Potv Gar Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994531936060928)
,p_db_column_name=>'POTV_GRADE_ID'
,p_display_order=>1250
,p_column_identifier=>'DU'
,p_column_label=>'Potv Grade Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994720630060930)
,p_db_column_name=>'POTV_HT_TEMP'
,p_display_order=>1270
,p_column_identifier=>'DW'
,p_column_label=>'Potv Ht Temp'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991003201060943)
,p_db_column_name=>'POTV_IMPLEMENTED_QTY'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Potv Implemented Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991124851060944)
,p_db_column_name=>'POTV_IMPPROC_QTY'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Potv Impproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984287238060925)
,p_db_column_name=>'POTV_INPROGRESS_QTY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Potv Inprogress Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991244673060945)
,p_db_column_name=>'POTV_INSPEND_QTY'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Potv Inspend Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991560060060948)
,p_db_column_name=>'POTV_INSPROC_QTY'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Potv Insproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986242343060945)
,p_db_column_name=>'POTV_INS_PROC'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Potv Ins Proc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983438999060917)
,p_db_column_name=>'POTV_ITEM_DESC1'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991778761060950)
,p_db_column_name=>'POTV_JOBPROC_QTY'
,p_display_order=>970
,p_column_identifier=>'CS'
,p_column_label=>'Potv Jobproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991497086060947)
,p_db_column_name=>'POTV_JOBRQST_QTY'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Potv Jobrqst Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994411655060927)
,p_db_column_name=>'POTV_LAST_AMEND_NO'
,p_display_order=>1240
,p_column_identifier=>'DT'
,p_column_label=>'Potv Last Amend No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995690633060939)
,p_db_column_name=>'POTV_LOC_ID'
,p_display_order=>1360
,p_column_identifier=>'EF'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985033978060933)
,p_db_column_name=>'POTV_LOT_NO'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990607207060939)
,p_db_column_name=>'POTV_MAT_RQST_QTY'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Potv Mat Rqst Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983559097060918)
,p_db_column_name=>'POTV_MFG_UOM'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Potv Mfg Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986144128060944)
,p_db_column_name=>'POTV_MOVE_TYPE'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Potv Move Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994991154060932)
,p_db_column_name=>'POTV_MRP_NO'
,p_display_order=>1290
,p_column_identifier=>'DY'
,p_column_label=>'Potv Mrp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992704793060910)
,p_db_column_name=>'POTV_MR_IMP_SEL_FLAG'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Potv Mr Imp Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992669512060959)
,p_db_column_name=>'POTV_MR_IMP_USER'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Potv Mr Imp User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993735868060920)
,p_db_column_name=>'POTV_MR_QTY'
,p_display_order=>1170
,p_column_identifier=>'DM'
,p_column_label=>'Potv Mr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986543446060948)
,p_db_column_name=>'POTV_NEXT_OPRN_ID'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Potv Next Oprn Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986493321060947)
,p_db_column_name=>'POTV_NEXT_PROC_ID'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Potv Next Proc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986650556060949)
,p_db_column_name=>'POTV_NEXT_SEQ'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Potv Next Seq'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995346992060936)
,p_db_column_name=>'POTV_NO_OF_UPS'
,p_display_order=>1330
,p_column_identifier=>'EC'
,p_column_label=>'Potv No Of Ups'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763982711500060910)
,p_db_column_name=>'POTV_OPER_DESC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Process Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763982943379060912)
,p_db_column_name=>'POTV_OPRN_CODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763982876989060911)
,p_db_column_name=>'POTV_OPRN_FLAG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Potv Oprn Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480496370566260859)
,p_db_column_name=>'POTV_OPRN_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Process ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995269667060935)
,p_db_column_name=>'POTV_OPRN_LN_SEQ'
,p_display_order=>1320
,p_column_identifier=>'EB'
,p_column_label=>'Oprn. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986806116060951)
,p_db_column_name=>'POTV_OPRN_NO'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Potv Oprn No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986051456060943)
,p_db_column_name=>'POTV_OPRN_SEQ_NO'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Potv Oprn Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983619391060919)
,p_db_column_name=>'POTV_ORDER_QTY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Potv Order Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480496195028260857)
,p_db_column_name=>'POTV_ORD_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989961547060932)
,p_db_column_name=>'POTV_ORD_SO_TYPE'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Potv Ord So Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984803686060931)
,p_db_column_name=>'POTV_OS_REWORK_QTY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Potv Os Rework Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991393361060946)
,p_db_column_name=>'POTV_OUTPEND_QTY'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Potv Outpend Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763991678766060949)
,p_db_column_name=>'POTV_OUTPROC_QTY'
,p_display_order=>960
,p_column_identifier=>'CR'
,p_column_label=>'Potv Outproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986306788060946)
,p_db_column_name=>'POTV_OUT_PROC'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Potv Out Proc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994188833060924)
,p_db_column_name=>'POTV_PAR_PROD_ORD_NO'
,p_display_order=>1210
,p_column_identifier=>'DQ'
,p_column_label=>'Potv Par Prod Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992445366060957)
,p_db_column_name=>'POTV_PEND_MR_QTY'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Potv Pend Mr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480496086409260856)
,p_db_column_name=>'POTV_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988637584060919)
,p_db_column_name=>'POTV_PP_DATE'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Potv Pp Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988325794060916)
,p_db_column_name=>'POTV_PP_NO'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Potv Pp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988415807060917)
,p_db_column_name=>'POTV_PP_REV'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Potv Pp Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988512442060918)
,p_db_column_name=>'POTV_PP_SEQ_NO'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Potv Pp Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983250768060915)
,p_db_column_name=>'POTV_PROD_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983320416060916)
,p_db_column_name=>'POTV_PROD_REV'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988751267060920)
,p_db_column_name=>'POTV_PROD_TYPE'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Potv Prod Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987275715060955)
,p_db_column_name=>'POTV_PROJ_ID'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Potv Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984903934060932)
,p_db_column_name=>'POTV_QC_QTY'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Potv Qc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984361779060926)
,p_db_column_name=>'POTV_QC_RWK_REJ_QTY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Potv Qc Rwk Rej Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993866571060921)
,p_db_column_name=>'POTV_QMR_QTY'
,p_display_order=>1180
,p_column_identifier=>'DN'
,p_column_label=>'Potv Qmr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983743164060920)
,p_db_column_name=>'POTV_QUEUE_QTY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Queue Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983870258060921)
,p_db_column_name=>'POTV_QUEUE_WT_QTY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Potv Queue Wt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984520242060928)
,p_db_column_name=>'POTV_REJ_QTY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Potv Rej Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984789964060930)
,p_db_column_name=>'POTV_REWORK_QTY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Potv Rework Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985253707060935)
,p_db_column_name=>'POTV_ROUTE_CARD_NO'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Potv Route Card No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987141579060954)
,p_db_column_name=>'POTV_RTRN_QTY'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Potv Rtrn Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763995510821060938)
,p_db_column_name=>'POTV_RT_CARD_NO'
,p_display_order=>1350
,p_column_identifier=>'EE'
,p_column_label=>'Potv Rt Card No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763983937898060922)
,p_db_column_name=>'POTV_RUN_QTY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Inside Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984094680060923)
,p_db_column_name=>'POTV_RUN_WT_QTY'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Potv Run Wt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763984615109060929)
,p_db_column_name=>'POTV_SCRAP_QTY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Potv Scrap Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985850520060941)
,p_db_column_name=>'POTV_SEL_FLAG'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Potv Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480496256807260858)
,p_db_column_name=>'POTV_SEQ_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Potv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985162013060934)
,p_db_column_name=>'POTV_SER_NO'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Serial No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994290326060925)
,p_db_column_name=>'POTV_SFG_PROD_ORD_NO'
,p_display_order=>1220
,p_column_identifier=>'DR'
,p_column_label=>'Potv Sfg Prod Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992567390060958)
,p_db_column_name=>'POTV_SHORT_QTY'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Potv Short Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985971899060942)
,p_db_column_name=>'POTV_SOB_FLAG'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Potv Sob Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993120587060914)
,p_db_column_name=>'POTV_SOU_BU'
,p_display_order=>1110
,p_column_identifier=>'DG'
,p_column_label=>'Potv Sou Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993442750060917)
,p_db_column_name=>'POTV_SOU_ORD_NO'
,p_display_order=>1140
,p_column_identifier=>'DJ'
,p_column_label=>'Potv Sou Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993373582060916)
,p_db_column_name=>'POTV_SOU_ORD_PFX'
,p_display_order=>1130
,p_column_identifier=>'DI'
,p_column_label=>'Potv Sou Ord Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993230074060915)
,p_db_column_name=>'POTV_SOU_PLNT'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'Potv Sou Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993563474060918)
,p_db_column_name=>'POTV_SOU_SEQ_NO'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Potv Sou Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763993691462060919)
,p_db_column_name=>'POTV_SOU_SUB_SEQ_NO'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Potv Sou Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990348556060936)
,p_db_column_name=>'POTV_SO_DESP_DATE'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Potv So Desp Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987549843060958)
,p_db_column_name=>'POTV_SO_NO'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Potv So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987441480060957)
,p_db_column_name=>'POTV_SO_PFX'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Potv So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987860928060911)
,p_db_column_name=>'POTV_SO_SCHLD_DESC'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'SO/Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987700413060959)
,p_db_column_name=>'POTV_SO_SEQ_NO'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Potv So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987793582060910)
,p_db_column_name=>'POTV_SO_SUB_SEQ_NO'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Potv So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994619571060929)
,p_db_column_name=>'POTV_SPEC_ID'
,p_display_order=>1260
,p_column_identifier=>'DV'
,p_column_label=>'Potv Spec Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985355748060936)
,p_db_column_name=>'POTV_START_DATE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Potv Start Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992802394060911)
,p_db_column_name=>'POTV_STYLE'
,p_display_order=>1080
,p_column_identifier=>'DD'
,p_column_label=>'Potv Style'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763985749601060940)
,p_db_column_name=>'POTV_ST_QTY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'In Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990751850060940)
,p_db_column_name=>'POTV_SUGGESTED_QTY'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Potv Suggested Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990886211060941)
,p_db_column_name=>'POTV_SUGG_PROC_QTY'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Potv Sugg Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992031613060953)
,p_db_column_name=>'POTV_SUGG_SEL_FLAG'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Potv Sugg Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763992154393060954)
,p_db_column_name=>'POTV_SUGG_SEL_USER'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Potv Sugg Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989823064060931)
,p_db_column_name=>'POTV_SYS_LS_NO'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Potv Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763987367253060956)
,p_db_column_name=>'POTV_TASK_ID'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Potv Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990447424060937)
,p_db_column_name=>'POTV_TOLR_PCT'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Potv Tolr Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763990582635060938)
,p_db_column_name=>'POTV_TOLR_QTY'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Potv Tolr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8480495885178260854)
,p_db_column_name=>'POTV_TRANS_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Potv Trans No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763988190638060914)
,p_db_column_name=>'POTV_TYPE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Potv Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763994853683060931)
,p_db_column_name=>'POTV_UNIT_WEIGHT'
,p_display_order=>1280
,p_column_identifier=>'DX'
,p_column_label=>'Potv Unit Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989305349060926)
,p_db_column_name=>'POTV_UPD_BY'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Potv Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989411868060927)
,p_db_column_name=>'POTV_UPD_DATE'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Potv Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989716965060930)
,p_db_column_name=>'POTV_UPD_EMP_ID'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Potv Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989518441060928)
,p_db_column_name=>'POTV_UPD_IP_ADDR'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Potv Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763989645727060929)
,p_db_column_name=>'POTV_UPD_OS_USER'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Potv Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763986937735060952)
,p_db_column_name=>'POTV_USER'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Potv User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8764039182994062113)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4967428'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'POTV_LOC_ID:POTV_PLNT:POTV_ORD_NO:POTV_PROD_ID:POTV_PROD_REV:POTV_ITEM_DESC1:POTV_OPRN_LN_SEQ:POTV_OPRN_ID:POTV_OPER_DESC:POTV_QUEUE_QTY:POTV_RUN_QTY:OUTSIDE_1:POTV_ST_QTY:POTV_ENTER_QTY:POTV_LOT_NO:POTV_SO_SCHLD_DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8655967372843063580)
,p_plug_name=>'Production Order Completed'
,p_static_id=>'production-order-completed'
,p_title=>'Production Order Completed'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PROHD_BU,',
'       PROHD_PLNT,',
'       PROHD_ORD_NO,',
'       PROHD_DATE,',
'       PROHD_PROD_ID,',
'       PROHD_PROD_REV,',
'       func_find_prod_qry_desc(PROHD_BU,PROHD_PROD_ID,PROHD_PROD_REV,1) ITEM_DSEC,',
'       PROHD_UOM,',
'       PROHD_ORDER_QTY,',
'       PROHD_RECEIVED_QTY,',
'       PROHD_UNIT_COST,',
'       PROHD_BOM_NO,',
'       PROHD_BOM_NAME,',
'       PROHD_SO_SCHLD_DESC,',
'       PROHD_CRE_BY,',
'       PROHD_CRE_DATE,',
'       DECODE (PROHD_ORD_TYPE,''S'',''Standard'',''N'',''Non - Standard'',''R'',''R&D'',''C'',''Conversion'',''O'',''Labor Order (External)'',''E'',''Labor Order (External Rework)'',''I'',''Labor Order Internal - Entity'',''U'',''Labor Order Internal - Unit'',''T'',''Tools - External'''
||',''TI'',''TI'')PROHD_ORD_TYPE,',
'       PROHD_REFERENCE,',
'       DECODE(PROHD_STATUS,''E'',''Unreleased'',''N'',''Entry Completed'',''P'',''Inprogress'',''H'',''On Hold'',''L'',''Close Shorted'',''R'',''Completed'',''C'',''Cancelled'')PROHD_STATUS,',
'       DECODE(PROHD_STATUS,''E'',''Blue'',''N'',''Brown'',''P'',''Orange'',''H'',''Red'',''L'',''Red'',''C'',''Red'',''R'',''Green'')color',
'  FROM prod_order_hd',
'where PROHD_STATUS=''R''',
'and prohd_bu=:global_bu',
'AND PROHD_PLNT IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)',
'UNION ALL ',
'  SELECT PROHDH_BU,',
'       PROHDH_PLNT,',
'       PROHDH_ORD_NO,',
'       PROHDH_DATE,',
'       PROHDH_PROD_ID,',
'       PROHDH_PROD_REV,',
'       func_find_prod_qry_desc(PROHDH_BU,PROHDH_PROD_ID,PROHDH_PROD_REV,1) ITEM_DSEC,',
'       PROHDH_UOM,',
'       PROHDH_ORDER_QTY,',
'       PROHDH_RECEIVED_QTY,',
'       PROHDH_UNIT_COST,',
'       PROHDH_BOM_NO,',
'       PROHDH_BOM_NAME,',
'       PROHDH_SO_SCHLD_DESC,',
'       PROHDH_CRE_BY,',
'       PROHDH_CRE_DATE,',
'       DECODE (PROHDH_ORD_TYPE,''S'',''Standard'',''N'',''Non - Standard'',''R'',''R&D'',''C'',''Conversion'',''O'',''Labor Order (External)'',''E'',''Labor Order (External Rework)'',''I'',''Labor Order Internal - Entity'',''U'',''Labor Order Internal - Unit'',''T'',''Tools - External'
||''',''TI'',''TI'')PROHDH_ORD_TYPE,',
'       PROHDH_REFERENCE,',
'       DECODE(PROHDH_STATUS,''E'',''Unreleased'',''N'',''Entry Completed'',''P'',''Inprogress'',''H'',''On Hold'',''L'',''Close Shorted'',''R'',''Completed'',''C'',''Cancelled'')PROHDH_STATUS,',
'       DECODE(PROHDH_STATUS,''E'',''Blue'',''N'',''Brown'',''P'',''Orange'',''H'',''Red'',''L'',''Red'',''C'',''Red'',''R'',''Green'')color',
'  FROM prod_order_hd_hist',
'  WHERE prohdh_status=''R''',
'  and prohdh_bu=:global_bu',
'  AND PROHDH_PLNT IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'POC'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Production Order Completed'
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
 p_id=>wwv_flow_imp.id(8655968286298063590)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5018859604493826906
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765811933609546281)
,p_db_column_name=>'COLOR'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022539347288387)
,p_db_column_name=>'ITEM_DSEC'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Item Dsec.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022938043288391)
,p_db_column_name=>'PROHD_BOM_NAME'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'BOM Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022864578288390)
,p_db_column_name=>'PROHD_BOM_NO'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'BOM No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022351412288385)
,p_db_column_name=>'PROHD_BU'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Prohd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023143468288393)
,p_db_column_name=>'PROHD_CRE_BY'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023255175288394)
,p_db_column_name=>'PROHD_CRE_DATE'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022447469288386)
,p_db_column_name=>'PROHD_DATE'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Prod. Ord. Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655969020963063597)
,p_db_column_name=>'PROHD_ORDER_QTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Prod. Ord. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655968562920063592)
,p_db_column_name=>'PROHD_ORD_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023289643288395)
,p_db_column_name=>'PROHD_ORD_TYPE'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655968390741063591)
,p_db_column_name=>'PROHD_PLNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655968716885063594)
,p_db_column_name=>'PROHD_PROD_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655968809525063595)
,p_db_column_name=>'PROHD_PROD_REV'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022706964288389)
,p_db_column_name=>'PROHD_RECEIVED_QTY'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Received Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023467649288396)
,p_db_column_name=>'PROHD_REFERENCE'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023054265288392)
,p_db_column_name=>'PROHD_SO_SCHLD_DESC'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'SO/Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763023544795288397)
,p_db_column_name=>'PROHD_STATUS'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#PROHD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8655969111741063598)
,p_db_column_name=>'PROHD_UNIT_COST'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763022605239288388)
,p_db_column_name=>'PROHD_UOM'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8760305141612068414)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4931018'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PROHD_PLNT:PROHD_ORD_NO:PROHD_DATE:PROHD_PROD_ID:PROHD_PROD_REV:ITEM_DSEC:PROHD_UOM:PROHD_ORDER_QTY:PROHD_BOM_NO:PROHD_BOM_NAME:PROHD_RECEIVED_QTY:PROHD_CRE_BY:PROHD_CRE_DATE:PROHD_SO_SCHLD_DESC:PROHD_REFERENCE:PROHD_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8760159243700939829)
,p_plug_name=>'Production Order Unreleased'
,p_static_id=>'production-order-unreleased'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PROHD_BU,',
'       PROHD_PLNT,',
'       PROHD_ORD_NO,',
'       PROHD_DATE,',
'       PROHD_PROD_ID,',
'       PROHD_PROD_REV,',
'       func_find_prod_qry_desc(PROHD_BU,PROHD_PROD_ID,PROHD_PROD_REV,1) ITEM_DSEC,',
'       PROHD_UOM,',
'       PROHD_ORDER_QTY,',
'       PROHD_RECEIVED_QTY,',
'       PROHD_UNIT_COST,',
'       PROHD_BOM_NO,',
'       PROHD_BOM_NAME,',
'       PROHD_BOM_REVISION_NUM,',
'       PROHD_SO_SCHLD_DESC,',
'       PROHD_CRE_BY,',
'       PROHD_CRE_DATE,',
'       DECODE (PROHD_ORD_TYPE,''S'',''Standard'',''N'',''Non - Standard'',''R'',''R&D'',''C'',''Conversion'',''O'',''Labor Order (External)'',''E'',''Labor Order (External Rework)'',''I'',''Labor Order Internal - Entity'',''U'',''Labor Order Internal - Unit'',''T'',''Tools - External'''
||',''TI'',''TI'')PROHD_ORD_TYPE,',
'       PROHD_REFERENCE,',
'       DECODE(PROHD_STATUS,''E'',''Unreleased'',''N'',''Entry Completed'',''P'',''Inprogress'',''H'',''On Hold'',''L'',''Close Shorted'',''R'',''Completed'',''C'',''Cancelled'')PROHD_STATUS,',
'       DECODE(PROHD_STATUS,''E'',''Blue'',''N'',''Brown'',''P'',''Orange'',''H'',''Red'',''L'',''Red'',''C'',''Red'',''R'',''Green'')color',
'  FROM prod_order_hd',
'where PROHD_STATUS=''E''',
'and prohd_bu=:global_bu',
'AND PROHD_PLNT IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)',
'',
'UNION ALL ',
'  SELECT PROHDH_BU,',
'       PROHDH_PLNT,',
'       PROHDH_ORD_NO,',
'       PROHDH_DATE,',
'       PROHDH_PROD_ID,',
'       PROHDH_PROD_REV,',
'       func_find_prod_qry_desc(PROHDH_BU,PROHDH_PROD_ID,PROHDH_PROD_REV,1) ITEM_DSEC,',
'       PROHDH_UOM,',
'       PROHDH_ORDER_QTY,',
'       PROHDH_RECEIVED_QTY,',
'       PROHDH_UNIT_COST,',
'       PROHDH_BOM_NO,',
'       PROHDH_BOM_NAME,',
'       PROHDH_BOM_REVISION_NUM,',
'       PROHDH_SO_SCHLD_DESC,',
'       PROHDH_CRE_BY,',
'       PROHDH_CRE_DATE,',
'       DECODE (PROHDH_ORD_TYPE,''S'',''Standard'',''N'',''Non - Standard'',''R'',''R&D'',''C'',''Conversion'',''O'',''Labor Order (External)'',''E'',''Labor Order (External Rework)'',''I'',''Labor Order Internal - Entity'',''U'',''Labor Order Internal - Unit'',''T'',''Tools - External'
||''',''TI'',''TI'')PROHDH_ORD_TYPE,',
'       PROHDH_REFERENCE,',
'       DECODE(PROHDH_STATUS,''E'',''Unreleased'',''N'',''Entry Completed'',''P'',''Inprogress'',''H'',''On Hold'',''L'',''Close Shorted'',''R'',''Completed'',''C'',''Cancelled'')PROHDH_STATUS,',
'       DECODE(PROHDH_STATUS,''E'',''Blue'',''N'',''Brown'',''P'',''Orange'',''H'',''Red'',''L'',''Red'',''C'',''Red'',''R'',''Green'')color',
'  FROM prod_order_hd_hist',
'  WHERE prohdh_status=''E''',
'  and prohdh_bu=:global_bu',
'  AND PROHDH_PLNT IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'POU'
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
 p_id=>wwv_flow_imp.id(8760159381084939830)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5123050699280703146
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765756626055512240)
,p_db_column_name=>'COLOR'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760160243133939839)
,p_db_column_name=>'ITEM_DSEC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Item Dsec.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966492501254338)
,p_db_column_name=>'PROHD_BOM_NAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'BOM Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762965913640254333)
,p_db_column_name=>'PROHD_BOM_NO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'BOM No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7750605093003216127)
,p_db_column_name=>'PROHD_BOM_REVISION_NUM'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'BOM Rev.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159511149939831)
,p_db_column_name=>'PROHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Prohd Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966668976254340)
,p_db_column_name=>'PROHD_CRE_BY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966753251254341)
,p_db_column_name=>'PROHD_CRE_DATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159737561939834)
,p_db_column_name=>'PROHD_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Prod. Ord. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760160048043939837)
,p_db_column_name=>'PROHD_ORDER_QTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Prod. Ord. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159629056939833)
,p_db_column_name=>'PROHD_ORD_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966320707254337)
,p_db_column_name=>'PROHD_ORD_TYPE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Prod.Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159603691939832)
,p_db_column_name=>'PROHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159821642939835)
,p_db_column_name=>'PROHD_PROD_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760159944259939836)
,p_db_column_name=>'PROHD_PROD_REV'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760160202351939838)
,p_db_column_name=>'PROHD_RECEIVED_QTY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Received Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966198645254335)
,p_db_column_name=>'PROHD_REFERENCE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966542142254339)
,p_db_column_name=>'PROHD_SO_SCHLD_DESC'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'SO/Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762966216913254336)
,p_db_column_name=>'PROHD_STATUS'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#PROHD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760160318236939840)
,p_db_column_name=>'PROHD_UNIT_COST'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8762965913080254332)
,p_db_column_name=>'PROHD_UOM'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8760237582071022274)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4930894'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PROHD_PLNT:PROHD_ORD_NO:PROHD_DATE:PROHD_PROD_ID:PROHD_PROD_REV:ITEM_DSEC:PROHD_UOM:PROHD_ORDER_QTY:PROHD_STATUS:PROHD_BOM_NO:PROHD_BOM_NAME:PROHD_BOM_REVISION_NUM:PROHD_SO_SCHLD_DESC:PROHD_REFERENCE:PROHD_CRE_BY:PROHD_CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8760833008799242169)
,p_plug_name=>'Rework Order Completion'
,p_static_id=>'rework-order-completion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select RWOCHD_BU,',
'       RWOCHD_PLNT,',
'       RWOCHD_COMP_PFX,',
'       RWOCHD_DOC_NO,',
'       RWOCHD_DATE,',
'       RWOCHD_RW_ORD_NO,',
'       RWOCHD_PROD_ID,',
'       RWOCHD_PROD_REV,',
'       (SELECT prod_desc11 ',
'         FROM products',
'        WHERE prod_bu = RWOCHD_BU',
'        AND prod_id = RWOCHD_PROD_ID',
'        AND prod_rev = RWOCHD_PROD_REV)ITEM_DESC,',
'        (select prod_uom ',
'          from products',
'         where prod_bu = RWOCHD_BU',
'           and prod_id = RWOCHD_PROD_ID',
'           and prod_rev = RWOCHD_PROD_REV)UOM,',
'       RWOCHD_COMP_QTY,',
'       RWOCHD_SCRAP_QTY,',
'       DECODE(RWOCHD_STATUS,''P'',''Posted'')RWOCHD_STATUS,',
'       RWOCHD_LINE_ID,',
'       RWOCHD_PROD_ORD_NO,',
'       RWOCHD_DIS_ASSEMBLE,',
'       RWOCHD_ORD_TYPE,',
'       RWOCHD_MATERIAL_COST,',
'       RWOCHD_RES_COST,',
'       RWOCHD_OT_COST,',
'       RWOCHD_UNIT_COST,',
'       RWOCHD_ALLOC_FLAG,',
'       RWOCHD_RCPT_LINE,',
'       RWOCHD_SO_PFX,',
'       RWOCHD_SO_NO,',
'       RWOCHD_SO_SEQ_NO,',
'       RWOCHD_SO_SUB_SEQ_NO,',
'       decode(RWOCHD_TYPE,''GRN(PR)'',''RCPR'',''Rework Rejection'',''RCRR'',''WIP/Supplier'',''RCWS'',''GRN(SC)'',''RCSC'',''Stock QC'',''RCST'',''Prod. Ord.(Discrete/Line)'',''RCPO'',''Stock Adjustment'',''RCSA'')RWOCHD_TYPE,',
'       RWOCHD_GEN_CONS,',
'       RWOCHD_PROD_COMP_QTY,',
'       RWOCHD_CONV_FACTOR,',
'       RWOCHD_COMP_STK_QTY,',
'       RWOCHD_PROD_COMP_STK_QTY,',
'       RWOCHD_YEAR,',
'       RWOCHD_PERIOD,',
'       RWOCHD_SF_CODE,',
'       RWOCHD_CRE_BY,',
'       RWOCHD_CRE_DATE,',
'       RWOCHD_UPD_BY,',
'       RWOCHD_UPD_DATE,',
'       RWOCHD_MACH_ID,',
'       RWOCHD_OPT_ID,',
'       RWOCHD_SHIFT_ID,',
'       RWOCHD_TRANS_QTY,',
'       RWOCHD_SOURCE,',
'       RWOCHD_SOU_STORE,',
'       RWOCHD_TARGET_STORE,',
'       RWOCHD_LOT_NO,',
'       RWOCHD_SER_NO,',
'       RWOCHD_SOURCE_ID,',
'       RWOCHD_SOURCE_TYPE,',
'       RWOCHD_COMP_SF_CODE,',
'       RWOCHD_BATCH_ID,',
'       RWOCHD_REFERENCE,',
'       RWOCHD_PROD_ORD_TYPE,',
'       RWOCHD_CUST_ID,',
'       RWOCHD_SAL_ORD_TYPE,',
'       RWOCHD_PP_NO,',
'       RWOCHD_PP_REV,',
'       RWOCHD_PP_SEQ_NO,',
'       RWOCHD_SOURCE_PFX,',
'       RWOCHD_SOURCE_NO,',
'       RWOCHD_SOURCE_LINE,',
'       RWOCHD_PROJ_ID,',
'       RWOCHD_TASK_ID,',
'       RWOCHD_QC_PFX,',
'       RWOCHD_QC_NO,',
'       RWOCHD_REJ_QTY,',
'       RWOCHD_QC_FLAG,',
'       RWOCHD_SYS_LS_NO,',
'       RWOCHD_ROUTE_CARD_NO,',
'       RWOCHD_VI_FLAG,',
'       RWOCHD_OPRN_ID,',
'       RWOCHD_SO_SCHLD_DESC,',
'       RWOCHD_STL_DOC_NO,',
'       RWOCHD_STL_SEQ_NO,',
'       RWOCHD_INC_JRNL,',
'       RWOCHD_IMO_RPLC_TYPE,',
'       RWOCHD_IMO_NO,',
'       RWOCHD_BUFFER,',
'       RWOCHD_SEL_FLAG,',
'       RWOCHD_SEL_USER,',
'       RWOCHD_DC_NO,',
'       ROWCHD_MR_CRE_FLAG,',
'       RWOCHD_STANDBY_FLAG,',
'       RWOCHD_STOCK_TYPE,',
'       RWOCHD_CHRG_FLAG,',
'       RWOCHD_BER_REASON,',
'       RWOCHD_CSR_NO,',
'       RWOCHD_OPT_ID1,',
'       RWOCHD_OPT_ID2,',
'       RWOCHD_SAME_LOT,',
'       RWOCHD_PLNT_LOC_ID,',
'       RWOCHD_DISASSEMBLE_TYPE,',
'       RWOCHD_RWK_TYPE',
'  from REWORK_ORDER_COMP_VIEW',
'  where RWOCHD_BU = :global_bu',
'    AND RWOCHD_STATUS =''P''',
'    AND RWOCHD_PLNT IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'ROC'
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
 p_id=>wwv_flow_imp.id(8760833154727242170)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5123724472923005486
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760785992708230291)
,p_db_column_name=>'ITEM_DESC'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921832056431752)
,p_db_column_name=>'ROWCHD_MR_CRE_FLAG'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Rowchd Mr Cre Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835150610242190)
,p_db_column_name=>'RWOCHD_ALLOC_FLAG'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Rwochd Alloc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918726582431771)
,p_db_column_name=>'RWOCHD_BATCH_ID'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Rwochd Batch Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922215536431756)
,p_db_column_name=>'RWOCHD_BER_REASON'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Rwochd Ber Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833249052242171)
,p_db_column_name=>'RWOCHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rwochd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921445470431748)
,p_db_column_name=>'RWOCHD_BUFFER'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Rwochd Buffer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922120906431755)
,p_db_column_name=>'RWOCHD_CHRG_FLAG'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Rwochd Chrg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833446742242173)
,p_db_column_name=>'RWOCHD_COMP_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Rwochd Comp Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834043419242179)
,p_db_column_name=>'RWOCHD_COMP_QTY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Rwochd Comp Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918654952431770)
,p_db_column_name=>'RWOCHD_COMP_SF_CODE'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Rwochd Comp Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916580151431750)
,p_db_column_name=>'RWOCHD_COMP_STK_QTY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Rwochd Comp Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916560350431749)
,p_db_column_name=>'RWOCHD_CONV_FACTOR'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Rwochd Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917130210431755)
,p_db_column_name=>'RWOCHD_CRE_BY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917178203431756)
,p_db_column_name=>'RWOCHD_CRE_DATE'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922348488431757)
,p_db_column_name=>'RWOCHD_CSR_NO'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Rwochd Csr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919004599431774)
,p_db_column_name=>'RWOCHD_CUST_ID'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Rwochd Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833672450242175)
,p_db_column_name=>'RWOCHD_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921677261431751)
,p_db_column_name=>'RWOCHD_DC_NO'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Rwochd Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922849270431762)
,p_db_column_name=>'RWOCHD_DISASSEMBLE_TYPE'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Rwochd Disassemble Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834523843242184)
,p_db_column_name=>'RWOCHD_DIS_ASSEMBLE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Rwochd Dis Assemble'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833507941242174)
,p_db_column_name=>'RWOCHD_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Comp. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916343948431747)
,p_db_column_name=>'RWOCHD_GEN_CONS'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Rwochd Gen Cons'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921276763431747)
,p_db_column_name=>'RWOCHD_IMO_NO'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Rwochd Imo No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921189864431746)
,p_db_column_name=>'RWOCHD_IMO_RPLC_TYPE'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Rwochd Imo Rplc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921079960431745)
,p_db_column_name=>'RWOCHD_INC_JRNL'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Rwochd Inc Jrnl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834274091242182)
,p_db_column_name=>'RWOCHD_LINE_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Rwochd Line Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918256883431766)
,p_db_column_name=>'RWOCHD_LOT_NO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Rwochd Lot No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917478354431759)
,p_db_column_name=>'RWOCHD_MACH_ID'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Rwochd Mach Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834721736242186)
,p_db_column_name=>'RWOCHD_MATERIAL_COST'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Rwochd Material Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920770543431791)
,p_db_column_name=>'RWOCHD_OPRN_ID'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Rwochd Oprn Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917599609431760)
,p_db_column_name=>'RWOCHD_OPT_ID'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Rwochd Opt Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922411716431758)
,p_db_column_name=>'RWOCHD_OPT_ID1'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Rwochd Opt Id1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922515894431759)
,p_db_column_name=>'RWOCHD_OPT_ID2'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Rwochd Opt Id2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834660330242185)
,p_db_column_name=>'RWOCHD_ORD_TYPE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Rwochd Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834929895242188)
,p_db_column_name=>'RWOCHD_OT_COST'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Rwochd Ot Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916907830431753)
,p_db_column_name=>'RWOCHD_PERIOD'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Rwochd Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833330541242172)
,p_db_column_name=>'RWOCHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922731934431761)
,p_db_column_name=>'RWOCHD_PLNT_LOC_ID'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919243467431776)
,p_db_column_name=>'RWOCHD_PP_NO'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Rwochd Pp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919335174431777)
,p_db_column_name=>'RWOCHD_PP_REV'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Rwochd Pp Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919373278431778)
,p_db_column_name=>'RWOCHD_PP_SEQ_NO'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Rwochd Pp Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916374970431748)
,p_db_column_name=>'RWOCHD_PROD_COMP_QTY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Rwochd Prod Comp Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916741155431751)
,p_db_column_name=>'RWOCHD_PROD_COMP_STK_QTY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Rwochd Prod Comp Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833861141242177)
,p_db_column_name=>'RWOCHD_PROD_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834407479242183)
,p_db_column_name=>'RWOCHD_PROD_ORD_NO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Rwochd Prod Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918939813431773)
,p_db_column_name=>'RWOCHD_PROD_ORD_TYPE'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Rwochd Prod Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833961296242178)
,p_db_column_name=>'RWOCHD_PROD_REV'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919809835431782)
,p_db_column_name=>'RWOCHD_PROJ_ID'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Rwochd Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920286524431787)
,p_db_column_name=>'RWOCHD_QC_FLAG'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Rwochd Qc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920147071431785)
,p_db_column_name=>'RWOCHD_QC_NO'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Rwochd Qc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920039635431784)
,p_db_column_name=>'RWOCHD_QC_PFX'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Rwochd Qc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835221456242191)
,p_db_column_name=>'RWOCHD_RCPT_LINE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Rwochd Rcpt Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918789024431772)
,p_db_column_name=>'RWOCHD_REFERENCE'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Rwochd Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920206336431786)
,p_db_column_name=>'RWOCHD_REJ_QTY'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Rwochd Rej Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834780644242187)
,p_db_column_name=>'RWOCHD_RES_COST'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Rwochd Res Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920565789431789)
,p_db_column_name=>'RWOCHD_ROUTE_CARD_NO'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Rwochd Route Card No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922886980431763)
,p_db_column_name=>'RWOCHD_RWK_TYPE'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Rwochd Rwk Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760833729471242176)
,p_db_column_name=>'RWOCHD_RW_ORD_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Rwochd Rw Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919169307431775)
,p_db_column_name=>'RWOCHD_SAL_ORD_TYPE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Rwochd Sal Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922654810431760)
,p_db_column_name=>'RWOCHD_SAME_LOT'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Rwochd Same Lot'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834169615242180)
,p_db_column_name=>'RWOCHD_SCRAP_QTY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Rwochd Scrap Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921563143431749)
,p_db_column_name=>'RWOCHD_SEL_FLAG'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Rwochd Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921590569431750)
,p_db_column_name=>'RWOCHD_SEL_USER'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Rwochd Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918328454431767)
,p_db_column_name=>'RWOCHD_SER_NO'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Rwochd Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917046962431754)
,p_db_column_name=>'RWOCHD_SF_CODE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Rwochd Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917749145431761)
,p_db_column_name=>'RWOCHD_SHIFT_ID'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Rwochd Shift Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917920933431763)
,p_db_column_name=>'RWOCHD_SOURCE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Rwochd Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918407093431768)
,p_db_column_name=>'RWOCHD_SOURCE_ID'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Rwochd Source Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919702159431781)
,p_db_column_name=>'RWOCHD_SOURCE_LINE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Rwochd Source Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919623398431780)
,p_db_column_name=>'RWOCHD_SOURCE_NO'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Rwochd Source No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919495635431779)
,p_db_column_name=>'RWOCHD_SOURCE_PFX'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Rwochd Source Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918537794431769)
,p_db_column_name=>'RWOCHD_SOURCE_TYPE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Rwochd Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917988838431764)
,p_db_column_name=>'RWOCHD_SOU_STORE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Rwochd Sou Store'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835437082242193)
,p_db_column_name=>'RWOCHD_SO_NO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Rwochd So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835327917242192)
,p_db_column_name=>'RWOCHD_SO_PFX'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Rwochd So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920796857431792)
,p_db_column_name=>'RWOCHD_SO_SCHLD_DESC'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Rwochd So Schld Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835519335242194)
,p_db_column_name=>'RWOCHD_SO_SEQ_NO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Rwochd So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916091950431745)
,p_db_column_name=>'RWOCHD_SO_SUB_SEQ_NO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Rwochd So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921896594431753)
,p_db_column_name=>'RWOCHD_STANDBY_FLAG'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Rwochd Standby Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760834175156242181)
,p_db_column_name=>'RWOCHD_STATUS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920973128431793)
,p_db_column_name=>'RWOCHD_STL_DOC_NO'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Rwochd Stl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760921045426431794)
,p_db_column_name=>'RWOCHD_STL_SEQ_NO'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Rwochd Stl Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760922043031431754)
,p_db_column_name=>'RWOCHD_STOCK_TYPE'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Rwochd Stock Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920439235431788)
,p_db_column_name=>'RWOCHD_SYS_LS_NO'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Rwochd Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760918077864431765)
,p_db_column_name=>'RWOCHD_TARGET_STORE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Rwochd Target Store'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760919905963431783)
,p_db_column_name=>'RWOCHD_TASK_ID'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Rwochd Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917860579431762)
,p_db_column_name=>'RWOCHD_TRANS_QTY'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Rwochd Trans Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916202702431746)
,p_db_column_name=>'RWOCHD_TYPE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760835046805242189)
,p_db_column_name=>'RWOCHD_UNIT_COST'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rwochd Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917273643431757)
,p_db_column_name=>'RWOCHD_UPD_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Rwochd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760917374945431758)
,p_db_column_name=>'RWOCHD_UPD_DATE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Rwochd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760920634300431790)
,p_db_column_name=>'RWOCHD_VI_FLAG'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Rwochd Vi Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8760916788473431752)
,p_db_column_name=>'RWOCHD_YEAR'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Rwochd Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8763474468127396977)
,p_db_column_name=>'UOM'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8760984004759451076)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4933302'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'RWOCHD_PLNT_LOC_ID:RWOCHD_PLNT:RWOCHD_DOC_NO:RWOCHD_DATE:RWOCHD_PROD_ID:RWOCHD_PROD_REV:ITEM_DESC:UOM:RWOCHD_STATUS:RWOCHD_CRE_BY:RWOCHD_CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8765987329639471911)
,p_plug_name=>'Rework Order Pending'
,p_static_id=>'rework-order-pending'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select RWOHD_BU,',
'       RWOHD_PLNT,',
'       RWOHD_LOC_ID,',
'       RWOHD_ORD_NO,',
'       RWOHD_DATE,',
'       RWOHD_PROD_ID,',
'       RWOHD_PROD_REV,',
'       (SELECT prod_desc11',
'			  FROM products',
'			  WHERE prod_bu  = :global_bu',
'				AND prod_id  = RWOHD_PROD_ID',
'				AND prod_rev = RWOHD_PROD_REV)Item_Desc,',
'       RWOHD_PROD_ORD_NO,',
'       RWOHD_REWORK_QTY,',
'       RWOHD_STATUS,',
'       RWOHD_LINE_ID,',
'       RWOHD_REC_SOURCE,',
'       RWOHD_ORD_TYPE,',
'       RWOHD_DIS_ASSEMBLE,',
'       RWOHD_PROD_COMP_QTY,',
'       RWOHD_SCRAP_QTY,',
'       RWOHD_REPAIR_QTY,',
'       RWOHD_IN_PROC_QTY,',
'       RWOHD_SEL_FLAG,',
'       RWOHD_USER,',
'       RWOHD_RCPT_SEQ_NO,',
'       RWOHD_PRIM_RWK_QTY,',
'       RWOHD_SECON_RWK_QTY,',
'       RWOHD_RCPT_STORE_ID,',
'       RWOHD_SF_CODE,',
'       RWOHD_CRE_BY,',
'       RWOHD_CRE_EMP_ID,',
'       RWOHD_CRE_IP_ADDR,',
'       RWOHD_CRE_OS_USER,',
'       RWOHD_CRE_DATE,',
'       RWOHD_UPD_BY,',
'       RWOHD_UPD_EMP_ID,',
'       RWOHD_UPD_IP_ADDR,',
'       RWOHD_UPD_OS_USER,',
'       RWOHD_UPD_DATE,',
'       RWOHD_PROC_QTY,',
'       RWOHD_REFERENCE,',
'       RWOHD_PROD_ORD_TYPE,',
'       RWOHD_SAL_ORD_TYPE,',
'       RWOHD_SOU_DOC_PFX,',
'       RWOHD_SOU_DOC_NO,',
'       RWOHD_SOU_DOC_LINE_NO,',
'       RWOHD_LOT_NO,',
'       RWOHD_SYS_LS_NO,',
'       RWOHD_SERIAL_NO,',
'       RWOHD_SEQ_NO,',
'       RWOHD_SO_PFX,',
'       RWOHD_SO_NO,',
'       RWOHD_SO_SEQ_NO,',
'       RWOHD_SO_SUB_SEQ_NO,',
'       RWOHD_PROJ_ID,',
'       RWOHD_TASK_ID,',
'       RWOHD_PP_NO,',
'       RWOHD_PP_SEQ_NO,',
'       RWOHD_VI_FLAG,',
'       RWOHD_SO_SCHLD_DESC,',
'       RWOHD_REJ_REFERENCE,',
'       RWOHD_PLNT_LOC_ID,',
'       RWOHD_PLNT_LOC_NAME',
'  from REWORK_ORDER_VIEW',
'  WHERE RWOHD_BU  =  :GLOBAL_BU and rwohd_status IN (''A'')',
'AND rwohd_plnt IN (SELECT AUBA_PLANT',
'                 FROM APPL_USER_PLANT_ACCESS ',
'                WHERE AUBA_BU=:GLOBAL_BU',
'                  AND AUBA_USER_ID=:GLOBAL_USER',
'                  AND (sysdate) between AUBA_FROM and AUBA_TO)',
'AND ((0 = (SELECT COUNT(1) FROM work_flow_doc_control',
'                  WHERE wfdc_bu = :GLOBAL_bu',
'                    AND wfdc_type = ''WF_SFRWA''',
'                     AND wfdc_plnt = RWOHD_PLNT',
'                    AND wfdc_doc_no = rwohd_ord_no)) OR (rwohd_ord_no) IN(',
'           SELECT wfdc_doc_no',
'               FROM work_flow_doc_control',
'               WHERE wfdc_bu = :GLOBAL_bu',
'               AND wfdc_type = ''WF_SFRWA''',
'               AND wfdc_plnt = RWOHD_PLNT',
'               AND wfdc_doc_no = rwohd_ord_no',
'               AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_bu, :GLOBAL_user)))'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'ROP'
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
 p_id=>wwv_flow_imp.id(8765987474312471912)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5128878792508235228
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159532778636072)
,p_db_column_name=>'ITEM_DESC'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765987551792471913)
,p_db_column_name=>'RWOHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rwohd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156151255635988)
,p_db_column_name=>'RWOHD_CRE_BY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Rwohd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156506511635992)
,p_db_column_name=>'RWOHD_CRE_DATE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Cre. DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156259754635989)
,p_db_column_name=>'RWOHD_CRE_EMP_ID'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Rwohd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156351858635990)
,p_db_column_name=>'RWOHD_CRE_IP_ADDR'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Rwohd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156455136635991)
,p_db_column_name=>'RWOHD_CRE_OS_USER'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Rwohd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154045968635967)
,p_db_column_name=>'RWOHD_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154933223635976)
,p_db_column_name=>'RWOHD_DIS_ASSEMBLE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Disassemble'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155324112635980)
,p_db_column_name=>'RWOHD_IN_PROC_QTY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'In Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154652528635973)
,p_db_column_name=>'RWOHD_LINE_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Rwohd Line Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766153859175635965)
,p_db_column_name=>'RWOHD_LOC_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157847841636005)
,p_db_column_name=>'RWOHD_LOT_NO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Rwohd Lot No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766153922634635966)
,p_db_column_name=>'RWOHD_ORD_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Rwk. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154824330635975)
,p_db_column_name=>'RWOHD_ORD_TYPE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Rwohd Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765987621064471914)
,p_db_column_name=>'RWOHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159314648636070)
,p_db_column_name=>'RWOHD_PLNT_LOC_ID'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Rwohd Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159490887636071)
,p_db_column_name=>'RWOHD_PLNT_LOC_NAME'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'RWOHD_PLNT_LOC_NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158815372636065)
,p_db_column_name=>'RWOHD_PP_NO'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Rwohd Pp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158902935636066)
,p_db_column_name=>'RWOHD_PP_SEQ_NO'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Rwohd Pp Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155743632635984)
,p_db_column_name=>'RWOHD_PRIM_RWK_QTY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Rwohd Prim Rwk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157121530635998)
,p_db_column_name=>'RWOHD_PROC_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Comp. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155006468635977)
,p_db_column_name=>'RWOHD_PROD_COMP_QTY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Comp Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154147253635968)
,p_db_column_name=>'RWOHD_PROD_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154326664635970)
,p_db_column_name=>'RWOHD_PROD_ORD_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157391630636000)
,p_db_column_name=>'RWOHD_PROD_ORD_TYPE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Rwohd Prod Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154254457635969)
,p_db_column_name=>'RWOHD_PROD_REV'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158657841636013)
,p_db_column_name=>'RWOHD_PROJ_ID'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Rwohd Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155598208635983)
,p_db_column_name=>'RWOHD_RCPT_SEQ_NO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Rwohd Rcpt Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155931652635986)
,p_db_column_name=>'RWOHD_RCPT_STORE_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Rwohd Rcpt Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154749251635974)
,p_db_column_name=>'RWOHD_REC_SOURCE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Rwohd Rec Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157265046635999)
,p_db_column_name=>'RWOHD_REFERENCE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Rwohd Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159261467636069)
,p_db_column_name=>'RWOHD_REJ_REFERENCE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Rwohd Rej Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155255385635979)
,p_db_column_name=>'RWOHD_REPAIR_QTY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Repair'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154419640635971)
,p_db_column_name=>'RWOHD_REWORK_QTY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Rework'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157408857636001)
,p_db_column_name=>'RWOHD_SAL_ORD_TYPE'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Rwohd Sal Ord Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155185563635978)
,p_db_column_name=>'RWOHD_SCRAP_QTY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Scrap '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155807745635985)
,p_db_column_name=>'RWOHD_SECON_RWK_QTY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Rwohd Secon Rwk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155451608635981)
,p_db_column_name=>'RWOHD_SEL_FLAG'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rwohd Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158112530636008)
,p_db_column_name=>'RWOHD_SEQ_NO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Rwohd Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158023895636007)
,p_db_column_name=>'RWOHD_SERIAL_NO'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Rwohd Serial No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156061334635987)
,p_db_column_name=>'RWOHD_SF_CODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Rwohd Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157714897636004)
,p_db_column_name=>'RWOHD_SOU_DOC_LINE_NO'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Rwohd Sou Doc Line No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157625212636003)
,p_db_column_name=>'RWOHD_SOU_DOC_NO'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Rwohd Sou Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157529233636002)
,p_db_column_name=>'RWOHD_SOU_DOC_PFX'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Rwohd Sou Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158346506636010)
,p_db_column_name=>'RWOHD_SO_NO'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Rwohd So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158265625636009)
,p_db_column_name=>'RWOHD_SO_PFX'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Rwohd So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159147727636068)
,p_db_column_name=>'RWOHD_SO_SCHLD_DESC'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Rwohd So Schld Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158461078636011)
,p_db_column_name=>'RWOHD_SO_SEQ_NO'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Rwohd So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158570128636012)
,p_db_column_name=>'RWOHD_SO_SUB_SEQ_NO'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Rwohd So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766154505639635972)
,p_db_column_name=>'RWOHD_STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Rwohd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157935019636006)
,p_db_column_name=>'RWOHD_SYS_LS_NO'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Rwohd Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766158790730636014)
,p_db_column_name=>'RWOHD_TASK_ID'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Rwohd Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156596452635993)
,p_db_column_name=>'RWOHD_UPD_BY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Rwohd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766157016695635997)
,p_db_column_name=>'RWOHD_UPD_DATE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Upd. DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156782149635994)
,p_db_column_name=>'RWOHD_UPD_EMP_ID'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Rwohd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156877953635995)
,p_db_column_name=>'RWOHD_UPD_IP_ADDR'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Rwohd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766156911698635996)
,p_db_column_name=>'RWOHD_UPD_OS_USER'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Rwohd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766155510566635982)
,p_db_column_name=>'RWOHD_USER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8766159077021636067)
,p_db_column_name=>'RWOHD_VI_FLAG'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Rwohd Vi Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8766183122621639398)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4986317'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RWOHD_LOC_ID:RWOHD_PLNT:RWOHD_ORD_NO:RWOHD_PROD_ID:RWOHD_PROD_REV:ITEM_DESC:RWOHD_REWORK_QTY:RWOHD_IN_PROC_QTY:RWOHD_PROC_QTY:RWOHD_REPAIR_QTY:RWOHD_SCRAP_QTY:RWOHD_DIS_ASSEMBLE:RWOHD_USER:RWOHD_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8764158708885094612)
,p_plug_name=>'Serial Wise Pending'
,p_static_id=>'serial-wise-pending'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select POSTV_TRANS_NO,',
'       POSTV_BU,',
'       POSTV_PLNT,',
'       POSTV_ORD_NO,',
'       POSTV_SEQ_NO,',
'       POSTV_OPRN_SEQ_NO,',
'       POSTV_OPRN_NO,',
'       POSTV_OPRN_ID,',
'       POSTV_OPER_DESC,',
'       POSTV_SF_CODE,',
'       POSTV_LOT_NO,',
'       POSTV_SER_NO,',
'       POSTV_SYS_LS_NO,',
'       POSTV_PROD_ID,',
'       POSTV_PROD_REV,',
'       FUNC_FIND_PROD_DESC(:GLOBAL_bu,POSTV_PROD_ID,POSTV_PROD_REV,1)POSTV_PROD_DESC,',
'       POSTV_SO_PFX,',
'       POSTV_SO_NO,',
'       POSTV_SO_SEQ_NO,',
'       POSTV_SO_SUB_SEQ_NO,',
'       POSTV_SO_SCHLD_DESC,',
'       POSTV_CUST_ID,',
'       POSTV_CUST_DESC,',
'       POSTV_PRQC_TYPE,',
'       POSTV_DATE,',
'       POSTV_PP_NO,',
'       POSTV_PP_REV,',
'       POSTV_PP_SEQ_NO,',
'       POSTV_PP_DATE,',
'       POSTV_TYPE,',
'       POSTV_TRANSFER_TYPE,',
'       POSTV_QUEUE_QTY,',
'       POSTV_RUN_QTY,',
'       POSTV_OUT_PROC,',
'       POSTV_OS_RUN_QTY,',
'       POSTV_ST_QTY,',
'       POSTV_ENTER_QTY,',
'       POSTV_SEL_FLAG,',
'       POSTV_SOB_FLAG,',
'       POSTV_USER,',
'       POSTV_OPRN_FLAG,',
'       POSTV_ORDER_QTY,',
'       POSTV_TOLR_QTY,',
'       POSTV_TOLR_PCT,',
'       POSTV_BOM_NO,',
'       POSTV_BOM_NAME,',
'       POSTV_OPRN_LN_SEQ,',
'       POSTV_LOC_ID,',
'       POSTV_CRE_BY,',
'       POSTV_CRE_DATE,',
'       POSTV_UPD_BY,',
'       POSTV_UPD_DATE,',
'       PROHD_THICKNESS,',
'       PROHD_WIDTH,',
'       PROHD_LENGTH,',
'       POSTV_PROD_TYPE,',
'       POSTV_PROC_ID',
'  from PROD_ORD_SER_TRANS_VIEW',
'   WHERE postv_bu = :GLOBAL_bu  ',
'   AND EXISTS (SELECT 1',
' 	           FROM appl_user_plant_access',
'                WHERE auba_bu 	= :GLOBAL_bu ',
'                AND auba_user_id = :GLOBAL_USER ',
'                AND (SYSDATE) BETWEEN auba_from AND auba_to',
'                AND postv_plnt	= auba_plant',
' 	          )',
'  AND (((postv_queue_qty + postv_run_qty + postv_os_run_qty) > 0))',
'  AND (postv_oprn_flag IN(''I'',''B'')',
'  OR (postv_oprn_flag IN (''O'') AND func_find_vi_oprn_flag(:GLOBAL_bu, postv_oprn_id) = ''Y''))',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P206_TYPE'
,p_plug_display_when_cond2=>'SWP'
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
 p_id=>wwv_flow_imp.id(8764158850293094613)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5127050168488857929
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893194929451108)
,p_db_column_name=>'POSTV_BOM_NAME'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Postv Bom Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893088886451107)
,p_db_column_name=>'POSTV_BOM_NO'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Postv Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159006621094615)
,p_db_column_name=>'POSTV_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Postv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893525160451211)
,p_db_column_name=>'POSTV_CRE_BY'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Postv Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893653553451212)
,p_db_column_name=>'POSTV_CRE_DATE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Postv Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890914851451085)
,p_db_column_name=>'POSTV_CUST_DESC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Postv Cust Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890808728451084)
,p_db_column_name=>'POSTV_CUST_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Postv Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891103665451087)
,p_db_column_name=>'POSTV_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Postv Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892304082451099)
,p_db_column_name=>'POSTV_ENTER_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Comp.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893390051451110)
,p_db_column_name=>'POSTV_LOC_ID'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159895861094624)
,p_db_column_name=>'POSTV_LOT_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159725774094622)
,p_db_column_name=>'POSTV_OPER_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Process Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892683696451103)
,p_db_column_name=>'POSTV_OPRN_FLAG'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Postv Oprn Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159622916094621)
,p_db_column_name=>'POSTV_OPRN_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893283534451109)
,p_db_column_name=>'POSTV_OPRN_LN_SEQ'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Oprn No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159544974094620)
,p_db_column_name=>'POSTV_OPRN_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Postv Oprn No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159449880094619)
,p_db_column_name=>'POSTV_OPRN_SEQ_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Postv Oprn Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892777574451104)
,p_db_column_name=>'POSTV_ORDER_QTY'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Postv Order Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159186330094617)
,p_db_column_name=>'POSTV_ORD_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892106296451097)
,p_db_column_name=>'POSTV_OS_RUN_QTY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Outside Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892021860451096)
,p_db_column_name=>'POSTV_OUT_PROC'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Postv Out Proc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159108942094616)
,p_db_column_name=>'POSTV_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891529674451091)
,p_db_column_name=>'POSTV_PP_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Postv Pp Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891236205451088)
,p_db_column_name=>'POSTV_PP_NO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Postv Pp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891340532451089)
,p_db_column_name=>'POSTV_PP_REV'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Postv Pp Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891398655451090)
,p_db_column_name=>'POSTV_PP_SEQ_NO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Postv Pp Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765894311365451219)
,p_db_column_name=>'POSTV_PROC_ID'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Postv Proc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765894446913451220)
,p_db_column_name=>'POSTV_PROD_DESC'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764160190713094627)
,p_db_column_name=>'POSTV_PROD_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890225316451078)
,p_db_column_name=>'POSTV_PROD_REV'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765894235926451218)
,p_db_column_name=>'POSTV_PROD_TYPE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Postv Prod Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890969279451086)
,p_db_column_name=>'POSTV_PRQC_TYPE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Prod. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891824195451094)
,p_db_column_name=>'POSTV_QUEUE_QTY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Queue Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891874705451095)
,p_db_column_name=>'POSTV_RUN_QTY'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Inside Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892363443451100)
,p_db_column_name=>'POSTV_SEL_FLAG'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Postv Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159347682094618)
,p_db_column_name=>'POSTV_SEQ_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159971405094625)
,p_db_column_name=>'POSTV_SER_NO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Serial No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764159829743094623)
,p_db_column_name=>'POSTV_SF_CODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892511235451101)
,p_db_column_name=>'POSTV_SOB_FLAG'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Postv Sob Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890451565451080)
,p_db_column_name=>'POSTV_SO_NO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Postv So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890345159451079)
,p_db_column_name=>'POSTV_SO_PFX'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Postv So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890682904451083)
,p_db_column_name=>'POSTV_SO_SCHLD_DESC'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'SO /Prj. Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890458372451081)
,p_db_column_name=>'POSTV_SO_SEQ_NO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Postv So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765890648418451082)
,p_db_column_name=>'POSTV_SO_SUB_SEQ_NO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Postv So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892222317451098)
,p_db_column_name=>'POSTV_ST_QTY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Inprogress Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764160143855094626)
,p_db_column_name=>'POSTV_SYS_LS_NO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Postv Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893006813451106)
,p_db_column_name=>'POSTV_TOLR_PCT'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Postv Tolr Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892863293451105)
,p_db_column_name=>'POSTV_TOLR_QTY'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Postv Tolr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891657942451093)
,p_db_column_name=>'POSTV_TRANSFER_TYPE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Postv Transfer Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8764158865401094614)
,p_db_column_name=>'POSTV_TRANS_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Postv Trans No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765891585498451092)
,p_db_column_name=>'POSTV_TYPE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Postv Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893731347451213)
,p_db_column_name=>'POSTV_UPD_BY'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Postv Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893850789451214)
,p_db_column_name=>'POSTV_UPD_DATE'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Postv Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765892611991451102)
,p_db_column_name=>'POSTV_USER'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Postv User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765894144815451217)
,p_db_column_name=>'PROHD_LENGTH'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Prohd Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765893860220451215)
,p_db_column_name=>'PROHD_THICKNESS'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Prohd Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8765894034127451216)
,p_db_column_name=>'PROHD_WIDTH'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Prohd Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8765913380642452109)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4984545'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'POSTV_LOC_ID:POSTV_PLNT:POSTV_ORD_NO:POSTV_PROD_ID:POSTV_PROD_REV:POSTV_PROD_DESC:POSTV_OPRN_LN_SEQ:POSTV_OPRN_ID:POSTV_OPER_DESC:POSTV_SER_NO:POSTV_QUEUE_QTY:POSTV_RUN_QTY:POSTV_OS_RUN_QTY:POSTV_ST_QTY:POSTV_SO_SCHLD_DESC:POSTV_LOT_NO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6724838369722224569)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7754974436594483312)
,p_button_name=>'CLOSE1'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI:t-Button--gapRight:t-Button--gapTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7755028407994483462)
,p_name=>'P206_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7754974436594483312)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6724933129199224716)
,p_name=>'New1'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6724838369722224569)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6724933620402224716)
,p_event_id=>wwv_flow_imp.id(6724933129199224716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
