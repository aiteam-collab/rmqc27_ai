prompt --application/pages/page_00129
begin
--   Manifest
--     PAGE: 00129
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
 p_id=>129
,p_name=>'Attachment'
,p_alias=>'EMAIL-OUTBOX-ATTACH1'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ---Interactive Report--- */',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'/* ',
'---Interactive Report  end--- */'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5631541274628133865)
,p_plug_name=>'EMAIL_OUTBOX_ATTACH'
,p_static_id=>'email-outbox-attach'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID","EOA_BU","EOA_DOC_NO","EOA_SEQ_NO","EOA_FILENAME",sys.dbms_lob.getlength("EOA_DOC")"EOA_DOC","EOA_TYPE","EOA_CRE_BY","EOA_CRE_IP_ADDR","EOA_CRE_OS_USER","EOA_CRE_DATE","EOA_UPD_BY","EOA_UPD_IP_ADDR","EOA_UPD_OS_USER","EOA_UPD_DATE","EO'
||'A_CRE_EMP_ID","EOA_UPD_EMP_ID","EOA_MAIL_TYPE",''<span class="fa fa-trash-o" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' "DELETE"',
'from "EMAIL_OUTBOX_ATTACH"',
'where eoa_bu     = :GLOBAL_BU',
'  and EOA_DOC_NO = :P129_DOC_NO',
' ORDER BY EOA_SEQ_NO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P129_DOC_NO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5631541365518133865)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>149579529974522837
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6738064438532474503)
,p_db_column_name=>'DELETE'
,p_display_order=>37
,p_column_identifier=>'S'
,p_column_label=>'Delete'
,p_column_link=>'javascript:$s(''P129_ROWID'',''#ROWID#'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_column_linktext=>'#DELETE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631542078353133920)
,p_db_column_name=>'EOA_BU'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Eoa Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631544403239133935)
,p_db_column_name=>'EOA_CRE_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Eoa Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631545634824133963)
,p_db_column_name=>'EOA_CRE_DATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Eoa Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631547544155133968)
,p_db_column_name=>'EOA_CRE_EMP_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Eoa Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631544805187133937)
,p_db_column_name=>'EOA_CRE_IP_ADDR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Eoa Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631545149339133937)
,p_db_column_name=>'EOA_CRE_OS_USER'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Eoa Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631543623933133935)
,p_db_column_name=>'EOA_DOC'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Download'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631542461901133932)
,p_db_column_name=>'EOA_DOC_NO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Eoa Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631543159621133934)
,p_db_column_name=>'EOA_FILENAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631548385199133970)
,p_db_column_name=>'EOA_MAIL_TYPE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Eoa Mail Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631542810396133934)
,p_db_column_name=>'EOA_SEQ_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Line'
,p_column_link=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.::P130_DOC_NO,P130_SEQ_NO:#EOA_DOC_NO#,#EOA_SEQ_NO#'
,p_column_linktext=>'#EOA_SEQ_NO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631543966872133935)
,p_db_column_name=>'EOA_TYPE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Eoa Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631545960004133965)
,p_db_column_name=>'EOA_UPD_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Eoa Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631547233992133967)
,p_db_column_name=>'EOA_UPD_DATE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Eoa Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631547977369133968)
,p_db_column_name=>'EOA_UPD_EMP_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Eoa Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631546374714133965)
,p_db_column_name=>'EOA_UPD_IP_ADDR'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Eoa Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631546772403133967)
,p_db_column_name=>'EOA_UPD_OS_USER'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Eoa Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630642890346013833)
,p_db_column_name=>'ROWID'
,p_display_order=>27
,p_is_primary_key=>'Y'
,p_column_identifier=>'R'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5631550841835135807)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1495891'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'EOA_SEQ_NO:EOA_FILENAME:DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5631548844119133974)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5631541274628133865)
,p_button_name=>'Add_Attachment'
,p_static_id=>'add-attachment'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Attachment'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:130:P130_DOC_NO,P130_SEQ_NO:&P129_DOC_NO.,'
,p_icon_css_classes=>'fa-file-plus fa-anim-vertical-shake'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5631617662537276729)
,p_name=>'P129_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5631541274628133865)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6738064493816474504)
,p_name=>'P129_ROWID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5631541274628133865)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5631549226315133976)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5631541274628133865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5631549703114133978)
,p_event_id=>wwv_flow_imp.id(5631549226315133976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5631541274628133865)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6738065249085474511)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ATTACH_DELT'
,p_static_id=>'attach-delt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'DELETE from "EMAIL_OUTBOX_ATTACH"',
'where eoa_bu     = :GLOBAL_BU',
'  and EOA_DOC_NO = :P129_DOC_NO',
'  AND ROWID  = :P129_ROWID;',
'',
' END ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1258544265300554309
);
wwv_flow_imp.component_end;
end;
/
