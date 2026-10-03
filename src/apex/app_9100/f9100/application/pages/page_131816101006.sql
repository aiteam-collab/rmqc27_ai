prompt --application/pages/page_131816101006
begin
--   Manifest
--     PAGE: 131816101006
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
 p_id=>131816101006
,p_name=>'ERP'
,p_alias=>'ERP'
,p_page_mode=>'MODAL'
,p_step_title=>'ERP'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>'<b style = "margin-left:10px">SO Details- &P558_MRPL_PROD_ID. -  &P558_PROD.</b>'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'800'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20610128663077127959)
,p_plug_name=>'SO'
,p_static_id=>'so'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>1010
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MSV_BU,',
'       MSV_PLNT,',
'       MSV_MRP_NO,',
'       MSV_SO_PFX "So. Pfx.",',
'       MSV_SO_NO "So.No.",',
'       MSV_SEQ_NO,',
'       MSV_SUB_SEQ_NO,',
'       MSV_SCHLD_DESC,',
'       MSV_CUST_ID,',
'       (SELECT cust_name1',
'        FROM customers',
'       WHERE cust_bu = :global_bu ',
'        AND cust_cust_id = MSV_CUST_ID ',
'        AND cust_status = ''A'')"Customer",',
'       MSV_PROD_ID,',
'       MSV_PROD_REV,',
'       MSV_QTY "Quantity"',
'  from MRP_SO_VIEW',
'  where MSV_BU=:GLOBAL_BU',
'  AND MSV_PLNT=:P131816101006_MRPL_PLNT',
'  AND MSV_MRP_NO=:P131816101006_MRPHD_MRP_NO',
'  AND MSV_PROD_ID=:P131816101006_MRPL_PROD_ID',
'  AND MSV_PROD_REV=:P131816101006_MRPL_PROD_REV'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'SO'
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
 p_id=>wwv_flow_imp.id(20610128778030127960)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>14466286748623606699
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129438836836773961)
,p_db_column_name=>'Customer'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129434501639773957)
,p_db_column_name=>'MSV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Msv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129436863676773959)
,p_db_column_name=>'MSV_CUST_ID'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Msv Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129435320021773957)
,p_db_column_name=>'MSV_MRP_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Msv Mrp No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129434906727773957)
,p_db_column_name=>'MSV_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Msv Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129437249308773959)
,p_db_column_name=>'MSV_PROD_ID'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Msv Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129437688736773959)
,p_db_column_name=>'MSV_PROD_REV'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'Msv Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129436463407773959)
,p_db_column_name=>'MSV_SCHLD_DESC'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Msv Schld Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129435697402773957)
,p_db_column_name=>'MSV_SEQ_NO'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Msv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129436087805773959)
,p_db_column_name=>'MSV_SUB_SEQ_NO'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Msv Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129439264575773961)
,p_db_column_name=>'Quantity'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129438047767773961)
,p_db_column_name=>'So. Pfx.'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'So. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11129438453818773961)
,p_db_column_name=>'So.No.'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'So.no.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20611454604547807317)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'49855976'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'So. Pfx.:So.No.:Customer:Quantity'
,p_sum_columns_on_break=>'Quantity'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11129440429794773962)
,p_name=>'P131816101006_MRPHD_MRP_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20610128663077127959)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11129440065513773962)
,p_name=>'P131816101006_MRPL_PLNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20610128663077127959)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11129440912499773962)
,p_name=>'P131816101006_MRPL_PROD_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(20610128663077127959)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11129441257556773962)
,p_name=>'P131816101006_MRPL_PROD_REV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20610128663077127959)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11129441638114773964)
,p_name=>'P131816101006_PROD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20610128663077127959)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
