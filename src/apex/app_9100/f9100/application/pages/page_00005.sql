prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Alerts Details'
,p_alias=>'ALERTS-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Alerts Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-HeroRegion-title {',
'    font-size: 1.5rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'    color: #5C6BC0;',
'}',
'',
'.t-HeroRegion-wrap {',
'    padding: 16px;',
'    display: flex;',
'    padding-bottom: 0px;',
'    flex-direction: row;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 500;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #3f51b5c7;',
'    color: white;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650485080006505315)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11521871407710687768)
,p_plug_name=>'Alert Paramters'
,p_static_id=>'alert-paramters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6258258645366746674)
,p_plug_name=>'Mail'
,p_static_id=>'mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6258257487782746662)
,p_plug_name=>'Mail Sent'
,p_static_id=>'mail-sent'
,p_parent_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_icon_css_classes=>'fa-envelope-check'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            CASE WHEN EOH_UNIT IS NOT NULL THEN',
'            func_find_plnt_desc(NVL(EOH_BU,:GLOBAL_bu),EOH_UNIT,1)',
'            ELSE NULL',
'            END "UNIT1",',
'            eoh_vou_pfx||''-''||eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "From",',
'            eorl_rcvr_email "To",',
'            eorl_cc_email "CC",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body",',
'            eorl_status "Unsend Reason",',
'            func_find_bu_desc(:GLOBAL_bu,1) "Business Unit",',
'            CASE WHEN EOH_WF_TYPE IS NOT NULL THEN',
'            FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,EOH_WF_TYPE,1)',
'            ELSE NULL',
'            END "Document Type"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  ',
'    AND EORL_STATUS LIKE ''%Message Sent%''',
'  ORDER BY EOH_DOC_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN'' AND :P5_MAIL_SMS =''MS'''
,p_plug_display_when_cond2=>'SQL'
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
 p_id=>wwv_flow_imp.id(6258257561728746663)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>114415532322225402
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258258529270746672)
,p_db_column_name=>'Body'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258261174147746699)
,p_db_column_name=>'Business Unit'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260973905746697)
,p_db_column_name=>'CC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Cc Mail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258258575126746673)
,p_db_column_name=>'Doc. Date'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258258096026746668)
,p_db_column_name=>'Doc. No.'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258261233386746700)
,p_db_column_name=>'Document Type'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260791667746695)
,p_db_column_name=>'From'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258258335826746671)
,p_db_column_name=>'Receiver Type'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Receiver Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258257709468746664)
,p_db_column_name=>'Subject'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260840022746696)
,p_db_column_name=>'To'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260648817746694)
,p_db_column_name=>'UNIT1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258257811388746665)
,p_db_column_name=>'Unit'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#Unit#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258261083698746698)
,p_db_column_name=>'Unsend Reason'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Unsend Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6258383177552855628)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1145412'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Unit:Doc. Date:From:To:CC:Subject:Body:Business Unit:Document Type:Unsend Reason:Receiver Type'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6258258787423746675)
,p_plug_name=>'Mail Unsent'
,p_static_id=>'mail-unsent'
,p_parent_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            CASE WHEN  EOH_UNIT IS NOT NULL THEN',
'            func_find_plnt_desc(NVL(EOH_BU,:GLOBAL_bu),EOH_UNIT,1)',
'            END "UNIT1",',
'            eoh_vou_pfx||''-''||eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "From",',
'            eorl_rcvr_email "To",',
'            eorl_cc_email "CC",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body",',
'            eorl_status "Unsend Reason",',
'            func_find_bu_desc(:GLOBAL_bu,1) "Business Unit",',
'            FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,EOH_WF_TYPE,1)"Document Type"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  ',
'  AND (EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'')) ',
'  ORDER BY EOH_DOC_DATE DESC,EOH_DOC_NO DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2 and :P5_TYPE=''MUN'' AND :P5_MAIL_SMS =''MU'''
,p_plug_display_when_cond2=>'SQL'
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
 p_id=>wwv_flow_imp.id(6258258918670746676)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>114416889264225415
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259706537746684)
,p_db_column_name=>'Body'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260389199746691)
,p_db_column_name=>'Business Unit'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260171193746689)
,p_db_column_name=>'CC'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'CC'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259752662746685)
,p_db_column_name=>'Doc. Date'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Send On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259233238746680)
,p_db_column_name=>'Doc. No.'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260507763746692)
,p_db_column_name=>'Document Type'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259948632746687)
,p_db_column_name=>'From'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259622373746683)
,p_db_column_name=>'Receiver Type'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Receiver Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258258968695746677)
,p_db_column_name=>'Subject'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260048098746688)
,p_db_column_name=>'To'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260588294746693)
,p_db_column_name=>'UNIT1'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258259121857746678)
,p_db_column_name=>'Unit'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#Unit#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258260253972746690)
,p_db_column_name=>'Unsend Reason'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Unsend Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6258382606334855615)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1145406'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Unit:Doc. Date:From:To:CC:Subject:Body:Business Unit:Document Type:Unsend Reason:Receiver Type:UNIT1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6281744844245641580)
,p_plug_name=>'Mail Unsent'
,p_static_id=>'mail-unsent-2'
,p_parent_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            func_find_plnt_desc(NVL(EOH_BU,:GLOBAL_bu),EOH_UNIT,1)"UNIT1",',
'            eoh_vou_pfx||''-''||eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "From",',
'            eorl_rcvr_email "To",',
'            eorl_cc_email "CC",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body",',
'            eorl_status "Unsend Reason",',
'            func_find_bu_desc(:GLOBAL_bu,1) "Business Unit",',
'            FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,EOH_WF_TYPE,1)"Document Type"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  ',
'  AND (EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'')) ',
'  ORDER BY EOH_DOC_DATE DESC,EOH_DOC_NO DESC',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN'' AND :P5_MAIL_SMS =''MU'''
,p_plug_display_when_cond2=>'SQL'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6281746439093641596)
,p_region_id=>wwv_flow_imp.id(6281744844245641580)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'Subject'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'From'
,p_body_adv_formatting=>false
,p_body_column_name=>'Body'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'CC'
,p_badge_column_name=>'Doc. Date'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11521875553874687810)
,p_plug_name=>'Mail Unsent'
,p_static_id=>'mail-unsent-3'
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            eorl_dc_seq_no "Line",',
'            eoh_vou_pfx "Doc. Pfx.",',
'            eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "Sender Email",',
'            eorl_rcvr_email "Receiver Email",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN''AND 1=2'
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11521875679880687811)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5378033650474166550
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045291373815875)
,p_db_column_name=>'Body'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522046870696815891)
,p_db_column_name=>'Doc. Date'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522044846121815871)
,p_db_column_name=>'Doc. No.'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522044817208815870)
,p_db_column_name=>'Doc. Pfx.'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doc. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522044720480815869)
,p_db_column_name=>'Line'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045064586815873)
,p_db_column_name=>'Receiver Email'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Receiver Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045153243815874)
,p_db_column_name=>'Receiver Type'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Receiver Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522044985663815872)
,p_db_column_name=>'Sender Email'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sender Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522043975133815862)
,p_db_column_name=>'Subject'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522044547591815868)
,p_db_column_name=>'Unit'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11522053123137823686)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53782111'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Doc. Date:Unit:Line:Doc. Pfx.:Doc. No.:Sender Email:Receiver Email:Receiver Type:Subject:Body'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11521874027934687794)
,p_plug_name=>'Messages'
,p_static_id=>'messages'
,p_icon_css_classes=>'fa-commenting'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT intmse_sender_id "Sender",',
'       intmse_sent_date "Sent Date",',
'       intmse_subject "Subject",',
'       intmse_message "Message",',
'       intmse_attach_no',
'  FROM int_msg_receivers, internal_message',
' WHERE     imsrcvr_bu = :global_bu',
'       AND imsrcvr_rcvr_id = :global_user',
'       AND imsrcvr_bu = intmse_bu',
'       AND imsrcvr_msg_id = intmse_msg_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MSG'''
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11521874115968687795)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5378032086562166534
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521875404808687808)
,p_db_column_name=>'INTMSE_ATTACH_NO'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Intmse Attach No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521875288350687807)
,p_db_column_name=>'Message'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521875069683687805)
,p_db_column_name=>'Sender'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Sender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521875148478687806)
,p_db_column_name=>'Sent Date'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Sent Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521874253403687797)
,p_db_column_name=>'Subject'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11521985112305630551)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53781431'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Sent Date:Sender:Subject'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11521870850155687763)
,p_plug_name=>'Notifications'
,p_static_id=>'notifications'
,p_icon_css_classes=>'fa-bell'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT cun_notfn_mod "Module",',
'            cun_notfn_desc "Notification",',
'            cun_rec_cnt "Count",',
'             DECODE(cun_priority,''L'',''<span aria-hidden="true" class="fa fa-exclamation-circle-o" style="color:#4CAF50"></span>''||'''',',
'                    ''M'',''<span aria-hidden="true" class="fa fa-alert" style="color:black"></span>''||'''',',
'                    ''H'',''<span aria-hidden="true" class="fa fa-exclamation-triangle fa-anim-horizontal-shake fam-x fam-is-danger"></span>''||'''') cun_priority,',
'            DECODE(cun_priority,''L'',''Low'',',
'                    ''M'',''Medium'',',
'                    ''H'',''High'') cun_title,                    ',
'            DECODE(cun_priority,''L'',''limegreen'',''M'',''#a8dc6b'',''H'',''red'') priority_bg_color,',
'            DECODE(cun_priority,''L'',''black'',''M'',''black'',''H'',''white'') priority_font_color',
'  FROM notification_alert    ',
' WHERE cun_user_id=:global_user'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''NOTIFY'''
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11521870992591687764)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5378028963185166503
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521871802384687772)
,p_db_column_name=>'CUN_PRIORITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#CUN_PRIORITY#'
,p_column_link_attr=>'title=#CUN_TITLE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521872167824687776)
,p_db_column_name=>'CUN_TITLE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Cun Title'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521871232808687767)
,p_db_column_name=>'Count'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521871080992687765)
,p_db_column_name=>'Module'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521871135039687766)
,p_db_column_name=>'Notification'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Notification'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521871989050687774)
,p_db_column_name=>'PRIORITY_BG_COLOR'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Priority Bg Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521872092284687775)
,p_db_column_name=>'PRIORITY_FONT_COLOR'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Priority Font Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11521906405703862901)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53780644'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Module:Notification:Count:CUN_PRIORITY:PRIORITY_BG_COLOR:PRIORITY_FONT_COLOR:CUN_TITLE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11521872303820687777)
,p_plug_name=>'Open Activities'
,p_static_id=>'open-activities'
,p_icon_css_classes=>'fa-tasks'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT scha_subj "Subject",',
'              DECODE(scha_type,''T'',''Task'',''P'',''Phone Call'',''E'',''E-Mail'',''L'',''Letter'',''F'',''Fax'',''A'',''Appointment'') "Type",              ',
'              DECODE(scha_priority,''L'',''<span aria-hidden="true" class="fa fa-exclamation-circle-o" style="color:#4CAF50"></span>''||'''',',
'                    ''M'',''<span aria-hidden="true" class="fa fa-alert" style="color:black"></span>''||'''',',
'                    ''H'',''<span aria-hidden="true" class="fa fa-exclamation-triangle fa-anim-horizontal-shake fam-x fam-is-danger"></span>''||'''') cun_priority,',
'               scha_start_time "Start Time",',
'               scha_end_time "End Time",',
'               scha_doc_pfx "Prefix",',
'               scha_doc_no "No.",',
'               scha_doc_seq_no "Seq. No.",',
'               DECODE(scha_for,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'',''P'',''Accounts'',',
'                             ''PQ'',''Purchase Request'',',
'                             ''PO'',''Purchase Order'',',
'                             ''PR'',''Purchase Receipt'',''QC'',''QC Document'',''EQ'',''Opportunity'',''QN'',''Quotation'',''SO'',''Sales Order'',''SI'',''Sales Invoice'',''PJ'',''Project'',''PT'',''Project Task'',',
'                             ''SC'',''Service Contract'',''AP'',''AP Document'',''AR'',''AR Document '',''BP'',''Bank Payment Voucher'',''BR'',''Bank Receipt Voucher'',',
'                             ''CP'',''Cash Payment voucher'',''CR'',''Cash Receipt Voucher'',',
'                             ''GL'',''GL Journal'',''FA'',''Fixed Assets'',',
'                             ''O'',''Others'',''TR'',''Tender'',',
'                             ''DW'',''Design Work'',',
'                             ''L'',''Lead'') "For."',
'    FROM sch_activities',
'  WHERE scha_bu=:global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''TASK'''
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11521872355706687778)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5378030326300166517
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521872796642687782)
,p_db_column_name=>'CUN_PRIORITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#CUN_PRIORITY#'
,p_column_link_attr=>'title=#CUN_TITLE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873469311687789)
,p_db_column_name=>'End Time'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'End Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873914252687793)
,p_db_column_name=>'For.'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'For.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873719260687791)
,p_db_column_name=>'No.'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873543170687790)
,p_db_column_name=>'Prefix'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873791662687792)
,p_db_column_name=>'Seq. No.'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873339402687788)
,p_db_column_name=>'Start Time'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Start Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873178771687786)
,p_db_column_name=>'Subject'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11521873289358687787)
,p_db_column_name=>'Type'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11521980714280458607)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53781387'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Subject:Type:CUN_PRIORITY:Start Time:End Time:Prefix:No.:Seq. No.:For.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6258551769783966703)
,p_plug_name=>'SMS Sent'
,p_static_id=>'sms-sent'
,p_parent_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SOH_BU,',
'       CASE WHEN SOH_BU IS NOT NULL THEN',
'       func_find_bu_desc(:GLOBAL_bu,1)',
'       ELSE NULL',
'       END "Business Units",',
'       SOH_DOC_NO,',
'       SOH_DOC_DATE "Doc.Date",',
'       SOH_SNDR_MOB_NO "Sender Mobile",',
'       SOH_BODY "Body",',
'       SOH_USER_ID,',
'       SOH_EMP_ID,',
'       SOH_VOU_TYPE,',
'       CASE WHEN SOH_VOU_TYPE IS NOT NULL THEN',
'       FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,SOH_VOU_TYPE,1)',
'       ELSE',
'       NULL',
'       END "Document Type",',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_VOU_PFX||''-''||SOH_VOU_NO||''-''||SORL_SUB_SEQ_NO "Doc. No",',
'       SOH_STATUS "Exception",',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       func_find_plnt_desc(NVL(SOH_BU,:GLOBAL_bu),SOH_UNIT, 1)"UNIT1",',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO "Receiver Mobile",',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
' where SOH_BU = :Global_bu ',
'   AND SOH_STATUS LIKE ''%SUCCESS%''',
'   ORDER BY SOH_DOC_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN'' AND :P5_MAIL_SMS =''SS'''
,p_plug_display_when_cond2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'SMS Sent'
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
 p_id=>wwv_flow_imp.id(6258551874014966704)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>114709844608445443
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042791463044281)
,p_db_column_name=>'Body'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042469621044278)
,p_db_column_name=>'Business Units'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Business Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042954977044283)
,p_db_column_name=>'Doc. No'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Doc. No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042593254044279)
,p_db_column_name=>'Doc.Date'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Doc.date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042909581044282)
,p_db_column_name=>'Document Type'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259043100458044284)
,p_db_column_name=>'Exception'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Exception'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259043152404044285)
,p_db_column_name=>'Receiver Mobile'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Receiver Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041369721044267)
,p_db_column_name=>'SOH_API_URL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Soh Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551954896966705)
,p_db_column_name=>'SOH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Soh Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259040895249044262)
,p_db_column_name=>'SOH_CRE_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Soh Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041025612044263)
,p_db_column_name=>'SOH_CRE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Soh Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552121552966706)
,p_db_column_name=>'SOH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Soh Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552302958966708)
,p_db_column_name=>'SOH_EMP_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Soh Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041443643044268)
,p_db_column_name=>'SOH_SMS_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Soh Sms Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041263053044266)
,p_db_column_name=>'SOH_UNIT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#SOH_UNIT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041091752044264)
,p_db_column_name=>'SOH_UPD_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Soh Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041173958044265)
,p_db_column_name=>'SOH_UPD_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Soh Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552194481966707)
,p_db_column_name=>'SOH_USER_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Soh User Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552614861966711)
,p_db_column_name=>'SOH_VOU_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Soh Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552454492966710)
,p_db_column_name=>'SOH_VOU_PFX'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Soh Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258552365810966709)
,p_db_column_name=>'SOH_VOU_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Soh Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042263945044276)
,p_db_column_name=>'SORL_API_URL'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Sorl Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041550917044269)
,p_db_column_name=>'SORL_BU'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Sorl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041878030044272)
,p_db_column_name=>'SORL_CRE_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Sorl Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042017804044273)
,p_db_column_name=>'SORL_CRE_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Sorl Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041669353044270)
,p_db_column_name=>'SORL_DOC_NO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Sorl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259041734246044271)
,p_db_column_name=>'SORL_SEQ_NO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Sorl Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042369010044277)
,p_db_column_name=>'SORL_SUB_SEQ_NO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Sorl Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042069988044274)
,p_db_column_name=>'SORL_UPD_BY'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Sorl Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042136300044275)
,p_db_column_name=>'SORL_UPD_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Sorl Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259042674229044280)
,p_db_column_name=>'Sender Mobile'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Sender Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6259043302559044286)
,p_db_column_name=>'UNIT1'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6259128263729048486)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1152863'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOH_UNIT:Doc. No:Doc.Date:Sender Mobile:Receiver Mobile:Body:Exception:Document Type:Business Units'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6258261333576746701)
,p_plug_name=>'SMS Unsent'
,p_static_id=>'sms-unsent'
,p_parent_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SOH_BU,',
'       CASE WHEN SOH_BU IS NOT NULL THEN',
'       func_find_bu_desc(:GLOBAL_bu,1)',
'       ELSE NULL',
'       END "Business Units",',
'       SOH_DOC_NO,',
'       SOH_DOC_DATE "Doc.Date",',
'       SOH_SNDR_MOB_NO "Sender Mobile",',
'       SOH_BODY "Body",',
'       SOH_USER_ID,',
'       SOH_EMP_ID,',
'       SOH_VOU_TYPE,',
'       CASE WHEN SOH_VOU_TYPE IS NOT NULL THEN',
'       FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,SOH_VOU_TYPE,1)',
'       ELSE',
'       NULL',
'       END "Document Type",',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_VOU_PFX||''-''||SOH_VOU_NO||''-''||SORL_SUB_SEQ_NO "Doc. No",',
'       SOH_STATUS "Exception",',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       func_find_plnt_desc(NVL(SOH_BU,:GLOBAL_bu),SOH_UNIT, 1)"UNIT1",',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO "Receiver Mobile",',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
' where SOH_BU = :Global_bu ',
'   AND SOH_STATUS NOT LIKE ''%SUCCESS%''',
'   ORDER BY SOH_DOC_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''MUN'' AND :P5_MAIL_SMS =''SU'''
,p_plug_display_when_cond2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'SMS Unsent'
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
 p_id=>wwv_flow_imp.id(6258261463494746702)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>114419434088225441
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551227799966697)
,p_db_column_name=>'Body'
,p_display_order=>320
,p_column_identifier=>'AA'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550890983966694)
,p_db_column_name=>'Business Units'
,p_display_order=>290
,p_column_identifier=>'X'
,p_column_label=>'Business Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551342723966699)
,p_db_column_name=>'Doc. No'
,p_display_order=>340
,p_column_identifier=>'AC'
,p_column_label=>'Doc. No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550946603966695)
,p_db_column_name=>'Doc.Date'
,p_display_order=>300
,p_column_identifier=>'Y'
,p_column_label=>'Doc.date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551230044966698)
,p_db_column_name=>'Document Type'
,p_display_order=>330
,p_column_identifier=>'AB'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551479062966700)
,p_db_column_name=>'Exception'
,p_display_order=>350
,p_column_identifier=>'AD'
,p_column_label=>'Exception'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551584966966701)
,p_db_column_name=>'Receiver Mobile'
,p_display_order=>360
,p_column_identifier=>'AE'
,p_column_label=>'Receiver Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549693304966682)
,p_db_column_name=>'SOH_API_URL'
,p_display_order=>170
,p_column_identifier=>'M'
,p_column_label=>'Soh Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548112301966666)
,p_db_column_name=>'SOH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Soh Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549209165966677)
,p_db_column_name=>'SOH_CRE_BY'
,p_display_order=>120
,p_column_identifier=>'H'
,p_column_label=>'Soh Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549264225966678)
,p_db_column_name=>'SOH_CRE_DATE'
,p_display_order=>130
,p_column_identifier=>'I'
,p_column_label=>'Soh Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548179974966667)
,p_db_column_name=>'SOH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Soh Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548689600966672)
,p_db_column_name=>'SOH_EMP_ID'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Soh Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549751997966683)
,p_db_column_name=>'SOH_SMS_TYPE'
,p_display_order=>180
,p_column_identifier=>'N'
,p_column_label=>'Soh Sms Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549581041966681)
,p_db_column_name=>'SOH_UNIT'
,p_display_order=>160
,p_column_identifier=>'L'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#SOH_UNIT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549423352966679)
,p_db_column_name=>'SOH_UPD_BY'
,p_display_order=>140
,p_column_identifier=>'J'
,p_column_label=>'Soh Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549480350966680)
,p_db_column_name=>'SOH_UPD_DATE'
,p_display_order=>150
,p_column_identifier=>'K'
,p_column_label=>'Soh Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548554635966671)
,p_db_column_name=>'SOH_USER_ID'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Soh User Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549012612966675)
,p_db_column_name=>'SOH_VOU_NO'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'Soh Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548841679966674)
,p_db_column_name=>'SOH_VOU_PFX'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Soh Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258548807264966673)
,p_db_column_name=>'SOH_VOU_TYPE'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Soh Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550701771966692)
,p_db_column_name=>'SORL_API_URL'
,p_display_order=>270
,p_column_identifier=>'V'
,p_column_label=>'Sorl Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258549914307966684)
,p_db_column_name=>'SORL_BU'
,p_display_order=>190
,p_column_identifier=>'O'
,p_column_label=>'Sorl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550283110966688)
,p_db_column_name=>'SORL_CRE_BY'
,p_display_order=>230
,p_column_identifier=>'R'
,p_column_label=>'Sorl Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550366162966689)
,p_db_column_name=>'SORL_CRE_DATE'
,p_display_order=>240
,p_column_identifier=>'S'
,p_column_label=>'Sorl Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550027985966685)
,p_db_column_name=>'SORL_DOC_NO'
,p_display_order=>200
,p_column_identifier=>'P'
,p_column_label=>'Sorl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550070311966686)
,p_db_column_name=>'SORL_SEQ_NO'
,p_display_order=>210
,p_column_identifier=>'Q'
,p_column_label=>'Sorl Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550759401966693)
,p_db_column_name=>'SORL_SUB_SEQ_NO'
,p_display_order=>280
,p_column_identifier=>'W'
,p_column_label=>'Sorl Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550501852966690)
,p_db_column_name=>'SORL_UPD_BY'
,p_display_order=>250
,p_column_identifier=>'T'
,p_column_label=>'Sorl Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258550539444966691)
,p_db_column_name=>'SORL_UPD_DATE'
,p_display_order=>260
,p_column_identifier=>'U'
,p_column_label=>'Sorl Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551043624966696)
,p_db_column_name=>'Sender Mobile'
,p_display_order=>310
,p_column_identifier=>'Z'
,p_column_label=>'Sender Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6258551699616966702)
,p_db_column_name=>'UNIT1'
,p_display_order=>370
,p_column_identifier=>'AF'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6258696204099020212)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1148542'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOH_UNIT:Doc. No:Doc.Date:Sender Mobile:Receiver Mobile:Body:Exception:Document Type:Business Units:UNIT1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11522045342934815876)
,p_plug_name=>'SMS Unsent'
,p_static_id=>'sms-unsent-2'
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT soh_doc_date "Doc. Date",',
'            soh_unit "Unit",',
'            sorl_sub_seq_no "Line",',
'            soh_vou_pfx "Doc. Pfx.",',
'            soh_vou_no "Doc. No.",',
'            SOH_SNDR_MOB_NO "Sender Mobile",',
'            SORL_RCVR_MOB_NO "Receiver Mobile",',
'            soh_body "Body"',
'   FROM sms_outbox_vw',
'  WHERE soh_bu=:global_bu  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P5_TYPE=''SUN'''
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11522045431196815877)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5378203401790294616
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522046486230815887)
,p_db_column_name=>'Body'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522047016991815892)
,p_db_column_name=>'Doc. Date'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522046055654815883)
,p_db_column_name=>'Doc. No.'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045939808815882)
,p_db_column_name=>'Doc. Pfx.'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doc. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045905847815881)
,p_db_column_name=>'Line'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522046812268815890)
,p_db_column_name=>'Receiver Mobile'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Receiver Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522046645272815889)
,p_db_column_name=>'Sender Mobile'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Sender Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11522045751395815880)
,p_db_column_name=>'Unit'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11522070524798857059)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53782285'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Doc. Date:Unit:Line:Doc. Pfx.:Doc. No.:Sender Mobile:Receiver Mobile:Body'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6259043364310044287)
,p_name=>'P5_MAIL_SMS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6258258645366746674)
,p_item_default=>'MU'
,p_prompt=>'Mail Sms'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Mail Unsend;MU,Mail Send;MS,SMS Unsend ;SU,SMS Send ;SS'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:margin-top-none:margin-bottom-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11521871596253687770)
,p_name=>'P5_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11521871407710687768)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11521889205040768359)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11521889630949768361)
,p_event_id=>wwv_flow_imp.id(11521889205040768359)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11521888376429768357)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p5_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p5_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p5_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p5_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p5_search, 1)',
'      || '',''',
'      || :app_session);',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'Raise_Application_Error(-20999,''Application not defined for the Page.'');',
'   ',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6039926540886157329
);
wwv_flow_imp.component_end;
end;
/
