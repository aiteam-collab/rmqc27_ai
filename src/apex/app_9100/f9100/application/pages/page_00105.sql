prompt --application/pages/page_00105
begin
--   Manifest
--     PAGE: 00105
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
 p_id=>105
,p_name=>'Expires Item'
,p_alias=>'EXPIRES_ITEM_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Expires Item'
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
 p_id=>wwv_flow_imp.id(5795705354558199329)
,p_plug_name=>'Expires Item'
,p_static_id=>'expires-item'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select store_plnt,lssv_prod_id,lssv_prod_rev,lssv_prod_desc,prod_ext_desc1,lssv_expiry_date,lssv_qty_hand,lssv_lot_no,lssv_test_no',
'           from lot_ser_stocks_vw,stores,products,classes',
'         where lssv_BU =:GLOBAL_bu',
'           AND lssv_bu = store_bu',
'           AND lssv_store_id = store_id ',
'           and lssv_bu = prod_bu',
'           and lssv_prod_id = prod_id',
'           and lssv_prod_rev = prod_rev',
'           and prod_bu = class_bu',
'           and prod_cls = class_id',
'        --   and CLASS_TYPE =''RM''',
'           AND LSS_DUE_DAYS  <= 15',
'            and LSSV_QTY_HAND > 0',
'	      AND prod_expr_flag = ''Y'''))
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
 p_id=>wwv_flow_imp.id(5795705452866199330)
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
,p_internal_uid=>313743617322588302
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795705841234199334)
,p_db_column_name=>'LSSV_EXPIRY_DATE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5824310508816395954)
,p_db_column_name=>'LSSV_LOT_NO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795705807053199333)
,p_db_column_name=>'LSSV_PROD_DESC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795705588665199331)
,p_db_column_name=>'LSSV_PROD_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795705732791199332)
,p_db_column_name=>'LSSV_PROD_REV'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795705950259199335)
,p_db_column_name=>'LSSV_QTY_HAND'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Qty. Hand'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5824310569898395955)
,p_db_column_name=>'LSSV_TEST_NO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Roll No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5824310724930395956)
,p_db_column_name=>'PROD_EXT_DESC1'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6012952724996904233)
,p_db_column_name=>'STORE_PLNT'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Store Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5795836664945305638)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3138749'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LSSV_PROD_ID:LSSV_PROD_REV:LSSV_PROD_DESC:PROD_EXT_DESC1:LSSV_LOT_NO:LSSV_TEST_NO:LSSV_EXPIRY_DATE:LSSV_QTY_HAND'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8241163383508709859)
,p_plug_name=>'Expires Item'
,p_static_id=>'expires-item-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sttr_trans_date,sttr_prod_id,sttr_prod_rev',
'  FROM (select  (SYSDATE - STTR_TRANS_DATE) date_1,sttr_trans_date,sttr_prod_id,sttr_prod_rev',
'          from  stock_trans,products,classes',
'         where STTR_BU =:GLOBAL_bu',
'           and sttr_bu = prod_bu',
'           and sttr_prod_id = prod_id',
'           and sttr_prod_rev = prod_rev',
'           and prod_bu = class_bu',
'           and prod_cls = class_id',
'           and class_type =''RM''',
'group by sttr_trans_date,sttr_prod_id,sttr_prod_rev',
')WHERE  date_1 <= 60'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New'
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
 p_id=>wwv_flow_imp.id(8244688052150683749)
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
,p_internal_uid=>2762726216607072721
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8244689530958683763)
,p_db_column_name=>'STTR_PROD_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8244689633669683764)
,p_db_column_name=>'STTR_PROD_REV'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8235048819039081569)
,p_db_column_name=>'STTR_TRANS_DATE'
,p_display_order=>160
,p_column_identifier=>'AI'
,p_column_label=>'Sttr Trans Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8245013199287801410)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27630514'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'STTR_PROD_ID:STTR_PROD_REV:STTR_TRANS_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5995965965879053043)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5795705354558199329)
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
 p_id=>wwv_flow_imp.id(5995966089420053044)
,p_name=>'Close Region'
,p_static_id=>'close-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5995965965879053043)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5995966207574053045)
,p_event_id=>wwv_flow_imp.id(5995966089420053044)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
