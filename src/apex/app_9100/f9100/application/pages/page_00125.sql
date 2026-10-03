prompt --application/pages/page_00125
begin
--   Manifest
--     PAGE: 00125
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
 p_id=>125
,p_name=>'Email Attach View'
,p_alias=>'EMAIL-ATTCH-VIEW'
,p_page_mode=>'MODAL'
,p_step_title=>'Email Attach View'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function down(){',
'apex.server.process("DOWN", {',
'      pageItems:''#P125_FILE''',
'  },',
'  {',
'    dataType: ''text'',',
'    success: function(pData) {  ',
'      if (pData){           ',
'          window.open(pData, ''_blank'');  ',
'      }',
'      else{   ',
'         window.open(pData, ''_blank'');            ',
'      }',
'    }',
'  });',
'}',
'',
'function VIEW(){',
'apex.server.process("VIEW", {',
'      pageItems:''#P125_FILE''',
'  },',
'  {',
'    dataType: ''text'',',
'    success: function(pData) {  ',
'      if (pData){           ',
'          window.open(pData, ''_blank'');  ',
'      }',
'      else{   ',
'         window.open(pData, ''_blank'');            ',
'      }',
'    }',
'  });',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ---Interactive Report--- */',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'/* ---Interactive Report  end--- */'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5630404459992823626)
,p_plug_name=>'Email Attach View'
,p_static_id=>'email-attach-view'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    "ROWID",',
'    "EOA_BU",',
'    "EOA_DOC_NO",',
'    "EOA_SEQ_NO",',
'    "EOA_FILENAME",',
'     "EOA_DOC",',
'    ''<span class="fa fa-download" aria-hidden="true" style = "color:green;font-weight:bold;"></span>'' Download,     ',
'    ''<span class="fa fa-eye" aria-hidden="true" style = "color:purple;font-weight:bold;"></span>'' view_att,',
'    ''<span class="fa fa-eye" aria-hidden="true" style = "color:purple;font-weight:bold;"></span>'' view_att2,',
'    EOA_DOC_NO||EOA_SEQ_NO doc_seq',
'FROM "EMAIL_OUTBOX_ATTACH"',
'WHERE eoa_bu = :GLOBAL_BU',
'  AND eoa_doc_no = :P125_P_DOC_NO',
'ORDER BY eoa_seq_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P125_P_DOC_NO'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5630404631645823626)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>148442796102212598
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630644658147013851)
,p_db_column_name=>'DOC_SEQ'
,p_display_order=>90
,p_column_identifier=>'V'
,p_column_label=>'Doc Seq'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630644568564013850)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Download'
,p_column_link=>'javascript:$s(''P125_DOC_SEQ'',''#DOC_SEQ#'');apex.submit(''DOWN'');'
,p_column_linktext=>'#DOWNLOAD#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630405227355824237)
,p_db_column_name=>'EOA_BU'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Eoa Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5696296376781006554)
,p_db_column_name=>'EOA_DOC'
,p_display_order=>100
,p_column_identifier=>'W'
,p_column_label=>'Eoa Doc'
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
,p_format_mask=>'DOWNLOAD:EMAIL_OUTBOX_ATTACH:EOA_DOC:ROWID::EOA_MAIL_TYPE:EOA_FILENAME:::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630405472368824249)
,p_db_column_name=>'EOA_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Eoa Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630406310981824253)
,p_db_column_name=>'EOA_FILENAME'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5630405934945824251)
,p_db_column_name=>'EOA_SEQ_NO'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5583610462837820756)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5583610731358820758)
,p_db_column_name=>'VIEW_ATT'
,p_display_order=>60
,p_column_identifier=>'S'
,p_column_label=>'View'
,p_column_link=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.::P186_DM_DOC_NO,P186_DM_DOC_SEQ,P186_LINK:#EOA_DOC_NO#,#EOA_SEQ_NO#,#EOA_FILENAME#'
,p_column_linktext=>'#VIEW_ATT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6923978167015252803)
,p_db_column_name=>'VIEW_ATT2'
,p_display_order=>110
,p_column_identifier=>'X'
,p_column_label=>'View Att2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5630431952494852203)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1484702'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'EOA_SEQ_NO:EOA_FILENAME:VIEW_ATT:DOWNLOAD'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5630645191045013856)
,p_branch_name=>'Go To Page javascript:down();'
,p_branch_action=>'f?p=800:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'DOWN'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6745210654909893709)
,p_branch_name=>'go to page Download'
,p_branch_action=>'&GLOBAL_API_URL.attachment/download/&GLOBAL_BU./&P125_P_DOC_NO.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6787718750651928506)
,p_branch_name=>'Go To Page javascript:view();'
,p_branch_action=>'f?p=800:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630644919813013853)
,p_name=>'P125_DOC_SEQ'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5630404459992823626)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630645095248013855)
,p_name=>'P125_FILE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5630404459992823626)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583610892130820760)
,p_name=>'P125_P_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5630404459992823626)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5630645007876013854)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWN'
,p_static_id=>'down'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' proc_apex_down_temp_blob(:GLOBAL_FILE_NAME);',
' HTP.p(''self.close();'');',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>148683172332402826
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5630644766881013852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD'
,p_static_id=>'download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1 --(c_seq   VARCHAR2)',
'   IS',
'      SELECT eoa_filename ',
'        FROM EMAIL_OUTBOX_ATTACH',
'       WHERE EOA_BU = :global_bu',
'         AND EOA_DOC_NO || TO_CHAR(EOA_SEQ_NO) = :P125_DOC_SEQ;',
'',
'   v_seq       NUMBER;',
'   cr1         c1%ROWTYPE;',
'   v_dir_path VARCHAR2(1000);',
'   v_file_name VARCHAR2(2000);   ',
'BEGIN',
'   OPEN c1;',
'   ',
'   FETCH c1 INTO cr1;/*',
'   SELECT DIRECTORY_PATH ',
'     INTO v_dir_path',
'     FROM SYS.DBA_DIRECTORIES',
'    WHERE DIRECTORY_NAME = ''FILE_ATTACH_DIR''',
'      AND v_dir_path = 0',
'    UNION ALL',
'   SELECT DIRECTORY_PATH ',
'     FROM SYS.DBA_DIRECTORIES',
'    WHERE DIRECTORY_NAME = ''FILE_ATTACH_DIR_1''',
'      AND v_dir_path = 1;*/',
'',
'    :GLOBAL_FILE_NAME := cr1.eoa_filename;--REPLACE(cr1.eoa_filename, v_dir_path, '''');',
'',
'  ',
'',
'   -- :GLOBAL_FILE_NAME := cr1.eoa_filename;',
'',
'    CLOSE c1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DOWN'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>148682931337402824
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5696296519877006555)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD_1'
,p_static_id=>'download-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_dir_path VARCHAR2(1000);',
'v_file_name VARCHAR2(2000);',
'BEGIN',
'',
'SELECT DIRECTORY_PATH ',
'  INTO v_dir_path',
'  FROM SYS.DBA_DIRECTORIES',
' WHERE DIRECTORY_NAME = ''FILE_ATTACH_DIR'';',
'',
':GLOBAL_FILE_NAME := REPLACE(:GLOBAL_FILE_NAME, v_dir_path, '''');',
'',
'-- proc_apex_down_temp_blob(v_file_name);',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>214334684333395527
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6787718672062928505)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VIEW'
,p_static_id=>'view'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' proc_apex_down_temp_blob(:GLOBAL_FILE_NAME);',
' HTP.p(''self.close();'');',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1308197688278008303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6787718515435928504)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VIEW ATTACHMENT_2'
,p_static_id=>'view-attachment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1 --(c_seq   VARCHAR2)',
'   IS',
'      SELECT eoa_filename ',
'        FROM EMAIL_OUTBOX_ATTACH',
'       WHERE EOA_BU = :global_bu',
'         AND EOA_DOC_NO || TO_CHAR(EOA_SEQ_NO) = :P125_DOC_SEQ;',
'',
'   v_seq       NUMBER;',
'   cr1         c1%ROWTYPE;',
'   v_dir_path VARCHAR2(1000);',
'   v_file_name VARCHAR2(2000);   ',
'BEGIN',
'   OPEN c1;',
'   ',
'   FETCH c1 INTO cr1;/*',
'   SELECT DIRECTORY_PATH ',
'     INTO v_dir_path',
'     FROM SYS.DBA_DIRECTORIES',
'    WHERE DIRECTORY_NAME = ''FILE_ATTACH_DIR''',
'      AND v_dir_path = 0',
'    UNION ALL',
'   SELECT DIRECTORY_PATH ',
'     FROM SYS.DBA_DIRECTORIES',
'    WHERE DIRECTORY_NAME = ''FILE_ATTACH_DIR_1''',
'      AND v_dir_path = 1;*/',
'',
'    :GLOBAL_FILE_NAME := cr1.eoa_filename;--REPLACE(cr1.eoa_filename, v_dir_path, '''');',
'',
'  ',
'',
'   -- :GLOBAL_FILE_NAME := cr1.eoa_filename;',
'',
'    CLOSE c1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'VIEW'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1308197531651008302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6745210569230893708)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'View Attachment'
,p_static_id=>'view-attachment-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' BEGIN',
'   PROC_WEB_FILE_TRANSF_VIEW(:GLOBAL_BU,:P125_P_DOC_NO,:P125_DOC_SEQ);',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'VIEW'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1265689585445973506
);
wwv_flow_imp.component_end;
end;
/
