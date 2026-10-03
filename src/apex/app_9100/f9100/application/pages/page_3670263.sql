prompt --application/pages/page_3670263
begin
--   Manifest
--     PAGE: 3670263
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
 p_id=>3670263
,p_name=>'Appl. Ctrl. - Workflow Management'
,p_alias=>'APPL-CTRL-WORKFLOW-MANAGEMENT1'
,p_step_title=>'Appl. Ctrl. - Workflow Management'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11659960124726735987)
,p_plug_name=>'Appl. Ctrl. - Workflow Management'
,p_static_id=>'appl-ctrl-workflow-management'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,',
'       wfmc_bu,',
'       DECODE(wfmc_doc_comp,''S'',''Sequential'',''N'',''Non Sequential'') wfmc_doc_comp,',
'       DECODE(wfmc_allow_dir_appr_fwd_flag,''Y'',''Yes'',''N'',''No'') wfmc_allow_dir_appr_fwd_flag,',
'       DECODE(wfmc_allow_dir_rtn_to_cre,''Y'',''Yes'',''N'',''No'') wfmc_allow_dir_rtn_to_cre,',
'       DECODE(wfmc_report_file_req,''Y'',''Yes'',''N'',''No'') wfmc_report_file_req,',
'       DECODE(wfmc_mail_option,''U'',''User Wise'',''D'',''Department Wise'') wfmc_mail_option,',
'       wfmc_cre_by,',
'       wfmc_cre_ip_addr,',
'       wfmc_cre_os_user,',
'       wfmc_cre_date,',
'       wfmc_upd_by,',
'       wfmc_upd_ip_addr,',
'       wfmc_upd_os_user,',
'       wfmc_upd_date,',
'       wfmc_cre_emp_id,',
'       wfmc_upd_emp_id',
'  FROM wfm_control',
' WHERE wfmc_bu = :global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Appl. Ctrl. - Workflow Management'
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
 p_id=>wwv_flow_imp.id(11659960525528735989)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:367026301:&SESSION.::&DEBUG.:RP:P367026301_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>5516118496122214728
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659960611091735989)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659961821863735989)
,p_db_column_name=>'WFMC_ALLOW_DIR_APPR_FWD_FLAG'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>'Allow Direct Fwd. while Appr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659962137919735989)
,p_db_column_name=>'WFMC_ALLOW_DIR_RTN_TO_CRE'
,p_display_order=>33
,p_column_identifier=>'E'
,p_column_label=>'Allow direct Return to Creator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659961001248735989)
,p_db_column_name=>'WFMC_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Wfmc Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659963413485735990)
,p_db_column_name=>'WFMC_CRE_BY'
,p_display_order=>53
,p_column_identifier=>'H'
,p_column_label=>'Wfmc Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659964560170735990)
,p_db_column_name=>'WFMC_CRE_DATE'
,p_display_order=>83
,p_column_identifier=>'K'
,p_column_label=>'Wfmc Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659966572621735992)
,p_db_column_name=>'WFMC_CRE_EMP_ID'
,p_display_order=>133
,p_column_identifier=>'P'
,p_column_label=>'Wfmc Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659963732944735990)
,p_db_column_name=>'WFMC_CRE_IP_ADDR'
,p_display_order=>63
,p_column_identifier=>'I'
,p_column_label=>'Wfmc Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659964155282735990)
,p_db_column_name=>'WFMC_CRE_OS_USER'
,p_display_order=>73
,p_column_identifier=>'J'
,p_column_label=>'Wfmc Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659961375593735989)
,p_db_column_name=>'WFMC_DOC_COMP'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc. Approval'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659963001116735990)
,p_db_column_name=>'WFMC_MAIL_OPTION'
,p_display_order=>13
,p_column_identifier=>'G'
,p_column_label=>'Mail Option'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659962617539735990)
,p_db_column_name=>'WFMC_REPORT_FILE_REQ'
,p_display_order=>43
,p_column_identifier=>'F'
,p_column_label=>'Report File Req.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659965007382735992)
,p_db_column_name=>'WFMC_UPD_BY'
,p_display_order=>93
,p_column_identifier=>'L'
,p_column_label=>'Wfmc Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659966203393735992)
,p_db_column_name=>'WFMC_UPD_DATE'
,p_display_order=>123
,p_column_identifier=>'O'
,p_column_label=>'Wfmc Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659966969554735992)
,p_db_column_name=>'WFMC_UPD_EMP_ID'
,p_display_order=>143
,p_column_identifier=>'Q'
,p_column_label=>'Wfmc Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659965399417735992)
,p_db_column_name=>'WFMC_UPD_IP_ADDR'
,p_display_order=>103
,p_column_identifier=>'M'
,p_column_label=>'Wfmc Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11659965805346735992)
,p_db_column_name=>'WFMC_UPD_OS_USER'
,p_display_order=>113
,p_column_identifier=>'N'
,p_column_label=>'Wfmc Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11659968958828736412)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55161270'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WFMC_DOC_COMP:WFMC_MAIL_OPTION:WFMC_ALLOW_DIR_APPR_FWD_FLAG:WFMC_ALLOW_DIR_RTN_TO_CRE:WFMC_REPORT_FILE_REQ'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11659968388575735993)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11659960124726735987)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Workflow Ctrl.'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:367026301:&SESSION.::&DEBUG.:367026301'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11659967366124735993)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11659960124726735987)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11659967858755735993)
,p_event_id=>wwv_flow_imp.id(11659967366124735993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11659960124726735987)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
