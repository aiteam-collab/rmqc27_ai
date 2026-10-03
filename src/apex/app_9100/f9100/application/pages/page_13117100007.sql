prompt --application/pages/page_13117100007
begin
--   Manifest
--     PAGE: 13117100007
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
 p_id=>13117100007
,p_name=>'Attachment'
,p_alias=>'ATTACHMENT2'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'900'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16527391703971355061)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 4/22/2020 1:19:55 PM (QP5 v5.163.1008.3004) */',
'SELECT "ROWID",',
'       "CCAH_BU",',
'       "CCAH_CAMPAIGN_ID",',
'       "CCAH_SEQ_NO",',
'       "CCAH_DOC_NAME",',
'       sys.DBMS_LOB.getlength ("CCAH_DOC") "CCAH_DOC",',
'       "CCAH_FILE_NAME",',
'       case when CCAH_MAIL_FLAG = ''Y'' then ''<span class="fa fa-check-square-o" aria-hidden="true"></span>'' ',
'       else ''<span aria-hidden="true" class="fa fa-square-o"></span>'' end',
'       "CCAH_MAIL_FLAG",',
'       "CCAH_MIME_TYPE",',
'       "CCAH_CRE_BY",',
'       "CCAH_CRE_IP_ADDR",',
'       "CCAH_CRE_OS_USER",',
'       "CCAH_CRE_EMP_ID",',
'       "CCAH_CRE_DATE",',
'       "CCAH_UPD_BY",',
'       "CCAH_UPD_IP_ADDR",',
'       "CCAH_UPD_OS_USER",',
'       "CCAH_UPD_EMP_ID",',
'       "CCAH_UPD_DATE"',
'  FROM "CRM_CAMPGN_ATTACH"',
'  where CCAH_BU = :global_bu',
'  AND CCAH_CAMPAIGN_ID = :p13117100007_doc_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16527392181795355061)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:13117100008:&SESSION.::&DEBUG.:RP,:P13117100008_ROWID:\#ROWID#\'
,p_detail_link_text=>'<center><span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span></center>'
,p_internal_uid=>10383550152388833800
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152792019740590378)
,p_db_column_name=>'CCAH_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Ccah Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152792356475590378)
,p_db_column_name=>'CCAH_CAMPAIGN_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Ccah Campaign Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152794779515590379)
,p_db_column_name=>'CCAH_CRE_BY'
,p_display_order=>45
,p_column_identifier=>'I'
,p_column_label=>'Ccah Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152796378158590381)
,p_db_column_name=>'CCAH_CRE_DATE'
,p_display_order=>85
,p_column_identifier=>'M'
,p_column_label=>'Ccah Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152795954895590381)
,p_db_column_name=>'CCAH_CRE_EMP_ID'
,p_display_order=>75
,p_column_identifier=>'L'
,p_column_label=>'Ccah Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152795157415590379)
,p_db_column_name=>'CCAH_CRE_IP_ADDR'
,p_display_order=>55
,p_column_identifier=>'J'
,p_column_label=>'Ccah Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152795624147590379)
,p_db_column_name=>'CCAH_CRE_OS_USER'
,p_display_order=>65
,p_column_identifier=>'K'
,p_column_label=>'Ccah Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152793621992590378)
,p_db_column_name=>'CCAH_DOC'
,p_display_order=>25
,p_column_identifier=>'F'
,p_column_label=>'Download'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_format_mask=>'DOWNLOAD:CRM_CAMPGN_ATTACH:CCAH_DOC:ROWID::CCAH_MIME_TYPE:CCAH_DOC_NAME:::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152793175439590378)
,p_db_column_name=>'CCAH_DOC_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152794004703590379)
,p_db_column_name=>'CCAH_FILE_NAME'
,p_display_order=>15
,p_column_identifier=>'G'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152794337062590379)
,p_db_column_name=>'CCAH_MAIL_FLAG'
,p_display_order=>35
,p_column_identifier=>'H'
,p_column_label=>'Mail'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152798808162590382)
,p_db_column_name=>'CCAH_MIME_TYPE'
,p_display_order=>145
,p_column_identifier=>'S'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152792801050590378)
,p_db_column_name=>'CCAH_SEQ_NO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152796750194590381)
,p_db_column_name=>'CCAH_UPD_BY'
,p_display_order=>95
,p_column_identifier=>'N'
,p_column_label=>'Ccah Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152798375190590382)
,p_db_column_name=>'CCAH_UPD_DATE'
,p_display_order=>135
,p_column_identifier=>'R'
,p_column_label=>'Ccah Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152797987960590382)
,p_db_column_name=>'CCAH_UPD_EMP_ID'
,p_display_order=>125
,p_column_identifier=>'Q'
,p_column_label=>'Ccah Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152797185933590381)
,p_db_column_name=>'CCAH_UPD_IP_ADDR'
,p_display_order=>105
,p_column_identifier=>'O'
,p_column_label=>'Ccah Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152797579259590381)
,p_db_column_name=>'CCAH_UPD_OS_USER'
,p_display_order=>115
,p_column_identifier=>'P'
,p_column_label=>'Ccah Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11152791579172590376)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16527400329972357261)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50089571'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCAH_SEQ_NO:CCAH_FILE_NAME:CCAH_DOC_NAME:CCAH_DOC:CCAH_MAIL_FLAG'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11152799586702590384)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(16527391703971355061)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13117100008:&SESSION.::&DEBUG.:13117100008:P13117100008_CCAH_CAMPAIGN_ID:&P13117100007_DOC_NO.'
,p_icon_css_classes=>'fa-file-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11152799967512590384)
,p_name=>'P13117100007_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16527391703971355061)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
