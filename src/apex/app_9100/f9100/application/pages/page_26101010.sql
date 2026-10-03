prompt --application/pages/page_26101010
begin
--   Manifest
--     PAGE: 26101010
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
 p_id=>26101010
,p_name=>'Stock Transfer GRN'
,p_alias=>'STOCK-TRANSFER-GRN'
,p_page_mode=>'MODAL'
,p_step_title=>'Stock Transfer GRN'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function title(){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title");',
'} '))
,p_javascript_code_onload=>'title();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'           white-space: nowrap;',
'       }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1000'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5763436039719902176)
,p_plug_name=>'Results'
,p_static_id=>'results'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT porh_receipt_pfx,porh_Receipt_no,porh_receipt_date,porh_suplr_id,porh_suplr_name,act_inv_date',
'   FROM (',
' SELECT porh_bu,porh_receipt_pfx,porh_Receipt_no,porh_receipt_date,porh_suplr_id,(SELECT NVL(suplr_name1,suplr_name2)',
'                                             FROM suppliers',
'                                            WHERE suplr_bu = porl_bu',
'                                              AND suplr_suplr_id = porh_suplr_id) porh_suplr_name,',
'        (SELECT sihd_inv_date',
'           FROM sales_invoices_hd',
'          WHERE sihd_bu = porl_bu',
'            AND sihd_inv_pfx = porl_st_inv_pfx',
'            AND sihd_inv_no = porl_st_inv_no',
'            ) act_inv_date',
'  FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view',
' WHERE porh_bu = porl_bu',
'   AND porh_receipt_no = porl_receipt_no',
'   AND porh_bu = :GLOBAL_bu',
'   AND porh_grn_source = ''ST''',
'   AND EXISTS (SELECT 1 ',
'                  FROM appl_user_plant_access',
'                 WHERE auba_bu = :GLOBAL_bu ',
'                   AND auba_user_id =  :GLOBAL_user',
'                   AND trunc(sysdate) between  auba_from and  auba_to',
'                   AND auba_plant = porh_plnt',
'                   AND auba_plnt_loc_id = porh_plnt_loc_id)',
'   )'))
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
 p_id=>wwv_flow_imp.id(5763436216172902177)
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
,p_internal_uid=>281474380629291149
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043035113032479937)
,p_db_column_name=>'ACT_INV_DATE'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'Act Inv Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043034771781479934)
,p_db_column_name=>'PORH_RECEIPT_DATE'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Porh Receipt Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043034690464479933)
,p_db_column_name=>'PORH_RECEIPT_NO'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Receipt No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043034590005479932)
,p_db_column_name=>'PORH_RECEIPT_PFX'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Porh Receipt Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043034883469479935)
,p_db_column_name=>'PORH_SUPLR_ID'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Supplier ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6043035011640479936)
,p_db_column_name=>'PORH_SUPLR_NAME'
,p_display_order=>50
,p_column_identifier=>'T'
,p_column_label=>'Supplier Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5781431677206431470)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2994699'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PORH_SUPLR_ID:PORH_SUPLR_NAME:PORH_RECEIPT_NO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5824312916737395978)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5763436039719902176)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5883178800071861829)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5824312916737395978)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5883178876370861830)
,p_event_id=>wwv_flow_imp.id(5883178800071861829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
