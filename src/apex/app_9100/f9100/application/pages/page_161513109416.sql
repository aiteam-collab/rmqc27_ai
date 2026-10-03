prompt --application/pages/page_161513109416
begin
--   Manifest
--     PAGE: 161513109416
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
 p_id=>161513109416
,p_name=>'GST Details'
,p_alias=>'GST-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'GST Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }',
'b, strong {',
'    font-weight: bolder;',
'    font-size: initial;',
'    color: teal;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11130637783025463879)
,p_plug_name=>'<b>Account - &P161513109416_ACCT_DESC.</b>'
,p_static_id=>'b-account-p161513109416-acct-desc-b'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 12/29/2021 12:12:31 PM (QP5 v5.163.1008.3004) */',
'SELECT ajhv_gstin_no,',
'       ajhv_gst_suplr_name,',
'       DECODE (ajhv_gst_class,',
'               ''L'', ''Local'',',
'               ''I'', ''Inter-State'',',
'               ''U'', ''Union Territory'',',
'               ''M'', ''Import'',',
'               ''S'', ''SEZ-Unit'',',
'               ''D'', ''SEZ - Developer'',',
'               ''E'', ''Export'',',
'               ''X'', ''Deemed - Export'')',
'          ajhv_gst_class,',
'       DECODE (ajhv_suplr_type,',
'               ''R'', ''Registered'',',
'               ''U'', ''Unregistered'',',
'               ''C'', ''Composition'',',
'               ''S'', ''Casual Person'',',
'               ''N'', ''Non-Resident'')',
'          ajhv_suplr_type,',
'       (SELECT grtc_cat_desc',
'          FROM gst_rev_tax_cat',
'         WHERE grtc_bu = ajhv_bu AND grtc_cat_id = ajhv_gst_rev_tax_cat)',
'          "RCM",',
'       (SELECT exprt_port_desc',
'          FROM exp_port',
'         WHERE exprt_bu = :GLOBAL_bu AND exprt_port = ajhv_port_code)',
'          Port,',
'       ajhv_state_code,',
'       ajhv_hsn_code,',
'       DECODE (ajhv_gst_type,',
'               ''G'', ''GST Supply'',',
'               ''Y'', ''Exempted'',',
'               ''R'', ''Nil Rated'',',
'               ''C'', ''Composition'',',
'               ''N'', ''Non-GST Supply'',',
'               ''A'', ''Not Applicable'')',
'          ajhv_gst_type,',
'       DECODE (ajhv_input_type,',
'               ''I'', ''Inputs'',',
'               ''C'', ''Capital Goods'',',
'               ''S'', ''Input Services'',',
'               ''N'', ''Ineligible'',',
'               ''A'', ''Not Applicable'')',
'          ajhv_input_type,',
'       DECODE(ajhv_gst_rev_tax_flag,''Y'',''Yes'',''N'',''No'')ajhv_gst_rev_tax_flag,',
'       DECODE(ajhv_lc_import_flag,''Y'',''Yes'',''N'',''No'')ajhv_lc_import_flag',
'  FROM appl_journals_hist_vw',
' WHERE     ajhv_bu = :Global_bu',
'      AND (ajhv_plnt = :P161513109416_PLNT OR :P161513109416_PLNT IS NULL)',
'      AND (ajhv_vou_pfx = :P161513109416_VOU_PFX OR :P161513109416_VOU_PFX IS NULL)',
'      AND (ajhv_vou_no = :P161513109416_VOU_NO OR :P161513109416_VOU_NO IS NULL)',
'      AND ajhv_gl_acct=:P161513109416_ACCT',
'       AND ajhv_vou_line_no = :P161513109416_LINE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P161513109416_VOU_NO,P161513109416_PLNT,P161513109416_ACCT,P161513109416_LINE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Account - &P161513109416_ACCT_DESC.</b>'
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
 p_id=>wwv_flow_imp.id(11130637923746463880)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5648676088202852852
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869360003155933173)
,p_db_column_name=>'AJHV_GSTIN_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'GSTIN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869360756719933178)
,p_db_column_name=>'AJHV_GST_CLASS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'GST Clsf.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869363977433933186)
,p_db_column_name=>'AJHV_GST_REV_TAX_FLAG'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'RCM'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869360353005933178)
,p_db_column_name=>'AJHV_GST_SUPLR_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'GST Suplr./Cust.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869363193105933184)
,p_db_column_name=>'AJHV_GST_TYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Supply Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869362797833933183)
,p_db_column_name=>'AJHV_HSN_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'HSN/SAC Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869363549013933184)
,p_db_column_name=>'AJHV_INPUT_TYPE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869364340052933186)
,p_db_column_name=>'AJHV_LC_IMPORT_FLAG'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'LC  Import'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869362343179933181)
,p_db_column_name=>'AJHV_STATE_CODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869361131663933179)
,p_db_column_name=>'AJHV_SUPLR_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'GST Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869361969687933179)
,p_db_column_name=>'PORT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Port'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9869361612196933179)
,p_db_column_name=>'RCM'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'RCM Catg.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11131001567932203237)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1803556'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'AJHV_GSTIN_NO:AJHV_GST_SUPLR_NAME:AJHV_GST_CLASS:AJHV_SUPLR_TYPE:RCM:PORT:AJHV_STATE_CODE:AJHV_HSN_CODE:AJHV_GST_TYPE:AJHV_INPUT_TYPE:AJHV_GST_REV_TAX_FLAG:AJHV_LC_IMPORT_FLAG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8146627483545405560)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869371390250933309)
,p_name=>'P161513109416_ACCT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869371827214933311)
,p_name=>'P161513109416_ACCT_DESC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869372208620933311)
,p_name=>'P161513109416_LINE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869371061795933309)
,p_name=>'P161513109416_PLNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869370661049933309)
,p_name=>'P161513109416_VOU_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9869370211803933306)
,p_name=>'P161513109416_VOU_PFX'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8146627483545405560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
