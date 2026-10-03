prompt --application/pages/page_00117
begin
--   Manifest
--     PAGE: 00117
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
 p_id=>117
,p_name=>'Attachment'
,p_alias=>'ATTACHMENT4'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5627275602734866548)
,p_plug_name=>'Attachment_COM'
,p_static_id=>'attachment-com'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT EOA_SEQ_NO eoa_seq_no,',
'       ROWID,',
'       EOA_BU,',
'       EOA_DOC_NO,',
'       --EOA_SEQ_NO,',
'       EOA_FILENAME,',
'       EOA_DOC,',
'       EOA_TYPE,',
'       EOA_CRE_BY,',
'       EOA_CRE_IP_ADDR,',
'       EOA_CRE_OS_USER,',
'       EOA_CRE_DATE,',
'       EOA_UPD_BY,',
'       EOA_UPD_IP_ADDR,',
'       EOA_UPD_OS_USER,',
'       EOA_UPD_DATE,',
'       EOA_CRE_EMP_ID,',
'       EOA_UPD_EMP_ID,',
'       EOA_MAIL_TYPE,',
'        ''<span class="fa fa-download" aria-hidden="true" style = "color:green;font-weight:bold;"></span>'' Download,',
'        ''<span class="fa fa-remove" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' Del',
'  from EMAIL_OUTBOX_ATTACH',
'  WHERE eoa_BU = :GLOBAL_BU',
'    AND EOA_DOC_NO = :P117_DOC_NO_COM',
'    AND :P117_SHOW_DATA = ''Y''',
'  ORDER BY eoa_seq_no'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P117_DOC_NO_COM,P117_SHOW_DATA'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P117_SHOW_DATA'
,p_plug_display_when_cond2=>'Y'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5627275691485866549)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>145313855942255521
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277618844866568)
,p_db_column_name=>'DEL'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Delete'
,p_column_link=>'javascript:$s(''P117_DOC_NO_COM'',''#EOA_DOC_NO#''),$s(''P117_ATTA_SEQ_NO_COM'',''#EOA_SEQ_NO#'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_column_linktext=>'#DEL#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5629378914965696429)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Download'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627275766123866550)
,p_db_column_name=>'EOA_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eoa Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276415735866556)
,p_db_column_name=>'EOA_CRE_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Eoa Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276727010866559)
,p_db_column_name=>'EOA_CRE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Eoa Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277224133866564)
,p_db_column_name=>'EOA_CRE_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Eoa Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276521039866557)
,p_db_column_name=>'EOA_CRE_IP_ADDR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Eoa Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276599385866558)
,p_db_column_name=>'EOA_CRE_OS_USER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eoa Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276206833866554)
,p_db_column_name=>'EOA_DOC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Eoa Doc'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627275886580866551)
,p_db_column_name=>'EOA_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Eoa Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276066827866553)
,p_db_column_name=>'EOA_FILENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277383035866566)
,p_db_column_name=>'EOA_MAIL_TYPE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Eoa Mail Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276014888866552)
,p_db_column_name=>'EOA_SEQ_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276272625866555)
,p_db_column_name=>'EOA_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Eoa Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276809622866560)
,p_db_column_name=>'EOA_UPD_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Eoa Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277132308866563)
,p_db_column_name=>'EOA_UPD_DATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Eoa Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277267480866565)
,p_db_column_name=>'EOA_UPD_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Eoa Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276913676866561)
,p_db_column_name=>'EOA_UPD_IP_ADDR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Eoa Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627276957617866562)
,p_db_column_name=>'EOA_UPD_OS_USER'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Eoa Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627277512304866567)
,p_db_column_name=>'ROWID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5629146113790482509)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1471843'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EOA_BU:EOA_DOC_NO:EOA_SEQ_NO:EOA_FILENAME:EOA_DOC:EOA_TYPE:EOA_CRE_BY:EOA_CRE_IP_ADDR:EOA_CRE_OS_USER:EOA_CRE_DATE:EOA_UPD_BY:EOA_UPD_IP_ADDR:EOA_UPD_OS_USER:EOA_UPD_DATE:EOA_CRE_EMP_ID:EOA_UPD_EMP_ID:EOA_MAIL_TYPE:ROWID:DEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5626607573030682173)
,p_plug_name=>'Attachment_EDIT'
,p_static_id=>'attachment-edit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT EOA_SEQ_NO eoa_seq_no,',
'       ROWID,       ',
'       EOA_BU,',
'       EOA_DOC_NO,',
'       --EOA_SEQ_NO,',
'       EOA_FILENAME,',
'       EOA_DOC,',
'       EOA_TYPE,',
'       EOA_CRE_BY,',
'       EOA_CRE_IP_ADDR,',
'       EOA_CRE_OS_USER,',
'       EOA_CRE_DATE,',
'       EOA_UPD_BY,',
'       EOA_UPD_IP_ADDR,',
'       EOA_UPD_OS_USER,',
'       EOA_UPD_DATE,',
'       EOA_CRE_EMP_ID,',
'       EOA_UPD_EMP_ID,',
'       EOA_MAIL_TYPE,',
'         ''<span class="fa fa-download" aria-hidden="true" style = "color:green;font-weight:bold;"></span>'' Download,',
'		 ''<span class="fa fa-remove" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' Del',
'  from EMAIL_OUTBOX_ATTACH',
'  WHERE eoa_BU = :GLOBAL_BU',
'    AND EOA_DOC_NO = :P117_DOC_NO',
'    AND :P117_SHOW_DATA = ''N''',
'  ORDER BY eoa_seq_no    '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P117_DOC_NO,P117_SHOW_DATA'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P117_SHOW_DATA'
,p_plug_display_when_cond2=>'N'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5626607696060682173)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>144645860517071145
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627274443029866537)
,p_db_column_name=>'DEL'
,p_display_order=>200
,p_column_identifier=>'BX'
,p_column_label=>'Delete'
,p_column_link=>'javascript:$s(''P117_DOC_NO'',''#EOA_DOC_NO#''),$s(''P117_ATTA_SEQ_NO'',''#EOA_SEQ_NO#'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_column_linktext=>'#DEL#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5629378941344696430)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>210
,p_column_identifier=>'BY'
,p_column_label=>'Download'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620884766791700468)
,p_db_column_name=>'EOA_BU'
,p_display_order=>10
,p_column_identifier=>'BE'
,p_column_label=>'Eoa Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885388802700474)
,p_db_column_name=>'EOA_CRE_BY'
,p_display_order=>70
,p_column_identifier=>'BK'
,p_column_label=>'Eoa Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885697226700477)
,p_db_column_name=>'EOA_CRE_DATE'
,p_display_order=>100
,p_column_identifier=>'BN'
,p_column_label=>'Eoa Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627273953005866532)
,p_db_column_name=>'EOA_CRE_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'BS'
,p_column_label=>'Eoa Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885441565700475)
,p_db_column_name=>'EOA_CRE_IP_ADDR'
,p_display_order=>80
,p_column_identifier=>'BL'
,p_column_label=>'Eoa Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885587849700476)
,p_db_column_name=>'EOA_CRE_OS_USER'
,p_display_order=>90
,p_column_identifier=>'BM'
,p_column_label=>'Eoa Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885216358700472)
,p_db_column_name=>'EOA_DOC'
,p_display_order=>50
,p_column_identifier=>'BI'
,p_column_label=>'Eoa Doc'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620884863668700469)
,p_db_column_name=>'EOA_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'BF'
,p_column_label=>'Eoa Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885091658700471)
,p_db_column_name=>'EOA_FILENAME'
,p_display_order=>40
,p_column_identifier=>'BH'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627274206576866534)
,p_db_column_name=>'EOA_MAIL_TYPE'
,p_display_order=>170
,p_column_identifier=>'BU'
,p_column_label=>'Eoa Mail Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620884956106700470)
,p_db_column_name=>'EOA_SEQ_NO'
,p_display_order=>30
,p_column_identifier=>'BG'
,p_column_label=>'Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885329334700473)
,p_db_column_name=>'EOA_TYPE'
,p_display_order=>60
,p_column_identifier=>'BJ'
,p_column_label=>'Eoa Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5620885786282700478)
,p_db_column_name=>'EOA_UPD_BY'
,p_display_order=>110
,p_column_identifier=>'BO'
,p_column_label=>'Eoa Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627273891555866531)
,p_db_column_name=>'EOA_UPD_DATE'
,p_display_order=>140
,p_column_identifier=>'BR'
,p_column_label=>'Eoa Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627274047436866533)
,p_db_column_name=>'EOA_UPD_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'BT'
,p_column_label=>'Eoa Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627273637162866529)
,p_db_column_name=>'EOA_UPD_IP_ADDR'
,p_display_order=>120
,p_column_identifier=>'BP'
,p_column_label=>'Eoa Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627273736417866530)
,p_db_column_name=>'EOA_UPD_OS_USER'
,p_display_order=>130
,p_column_identifier=>'BQ'
,p_column_label=>'Eoa Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5627274322420866535)
,p_db_column_name=>'ROWID'
,p_display_order=>180
,p_column_identifier=>'BV'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5626892193542728981)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1449304'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5626606973740682010)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5629381326729696453)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_CC_MAIL,P1900043_TO_MAIL,P1900043_EOH_SNDR_EMAIL,P1900043_EOH_SUBJ,P1900043_EOH_BODY:&P117_DOC_NO.,&P117_CC_MAIL.,&P117_TO_EMAIL.,&P117_FORM.,&P117_SUBJ.,&P117_BODY.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5629382389173696464)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_button_name=>'Back_COM'
,p_static_id=>'back-com'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back '
,p_button_redirect_url=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_CC_MAIL_COM,P1900043_TO_MAIL_COM,P1900043_EOH_SNDR_EMAIL_COM,P1900043_EOH_SUBJ_COM,P1900043_EOH_BODY_COM,P1900043_SHOW_DATA:&P117_CC_MAIL_COM.,&P117_TO_EMAIL_COM.,&P117_FORM_COM.,&P117_SUBJ_COM.,&P117_BODY_COM.,Y'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5627274781959866540)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5627278206730866574)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_button_name=>'Upload_Com'
,p_static_id=>'upload-com'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--simple:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
,p_grid_column_span=>5
,p_grid_column=>4
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5629382746427696468)
,p_branch_name=>'GO_TO_117'
,p_branch_action=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::P117_SHOW_DATA,P117_DOC_NO_COM:Y,&P117_DOC_NO_COM.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5627278206730866574)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5629382892236696469)
,p_branch_name=>'GO_TO_117'
,p_branch_action=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::P117_SHOW_DATA:N&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5627278206730866574)
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627274680248866539)
,p_name=>'P117_ATTA_SEQ_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627278073753866573)
,p_name=>'P117_ATTA_SEQ_NO_COM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381732610696457)
,p_name=>'P117_BODY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629382158213696462)
,p_name=>'P117_BODY_COM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381510854696455)
,p_name=>'P117_CC_MAIL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629382017660696460)
,p_name=>'P117_CC_MAIL_COM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627274890339866541)
,p_name=>'P117_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627277877663866571)
,p_name=>'P117_DOC_NO_COM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5500059636752781532)
,p_name=>'P117_FILE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_prompt=>'File Choose'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5620884659911700467)
,p_name=>'P117_FILE_CHOOSE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_prompt=>'File Choose'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627277975807866572)
,p_name=>'P117_FILE_CHOOSE_COM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_prompt=>'File'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'dropzone_title', 'Choose your File',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627275224553866544)
,p_name=>'P117_FILE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_prompt=>'File Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627277741079866570)
,p_name=>'P117_FILE_NAME_COM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381780842696458)
,p_name=>'P117_FORM'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629382252508696463)
,p_name=>'P117_FORM_COM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5627278516146866577)
,p_name=>'P117_SHOW_DATA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381569871696456)
,p_name=>'P117_SUBJ'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629382130141696461)
,p_name=>'P117_SUBJ_COM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381398752696454)
,p_name=>'P117_TO_EMAIL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5626607573030682173)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5629381865296696459)
,p_name=>'P117_TO_EMAIL_COM'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5627275602734866548)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5500059623975781531)
,p_validation_name=>'File Choose'
,p_static_id=>'file-choose'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P117_FILE_CHOOSE_COM IS NULL THEN',
'   RETURN(''Choose File'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5627278206730866574)
,p_associated_item=>wwv_flow_imp.id(5627277975807866572)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5627275410218866546)
,p_validation_name=>'FILE_NAME'
,p_static_id=>'file-name'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P117_FILE_NAME IS NULL THEN ',
'  RETURN(''File must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5627274781959866540)
,p_associated_item=>wwv_flow_imp.id(5627275224553866544)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5630212511678602346)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P117_FILE_NAME_COM IS NULL THEN ',
'  RETURN(''File name must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_imp.id(5627278206730866574)
,p_associated_item=>wwv_flow_imp.id(5627277741079866570)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5627275284866866545)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete'
,p_static_id=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_application_error(-20999,:P117_DOC_NO||''~''||:P117_ATTA_SEQ_NO);',
'DELETE email_outbox_attach',
' WHERE eoa_bu = :GLOBAL_BU',
'   AND eoa_doc_no = :P117_DOC_NO',
'   AND eoa_seq_no = :P117_ATTA_SEQ_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Deleted Successfully.'
,p_internal_uid=>145313449323255517
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5627278411065866576)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete_COM'
,p_static_id=>'delete-com'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_application_error(-20999,:P117_DOC_NO||''~''||:P117_ATTA_SEQ_NO);',
'DELETE email_outbox_attach',
' WHERE eoa_bu = :GLOBAL_BU',
'   AND eoa_doc_no = :P117_DOC_NO',
'   AND eoa_seq_no = :P117_ATTA_SEQ_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Deleted Successfully.'
,p_internal_uid=>145316575522255548
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5627274582753866538)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Upload'
,p_static_id=>'upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'      IF :P117_DOC_NO IS NOT NULL THEN',
'',
'        SELECT NVL(MAX(eoa_seq_no),0) + 1',
'          INTO :P117_ATTA_SEQ_NO',
'          FROM email_outbox_attach',
'         WHERE eoa_bu = :GLOBAL_BU ',
'           AND eoa_doc_no = :P117_DOC_NO;',
'      END IF;   ',
'',
'    IF :P117_DOC_NO IS NOT NULL THEN',
'         --  Raise_application_error(-20999,:P117_DOC_NO);',
'             INSERT INTO email_outbox_attach(eoa_bu         ,',
'                                            eoa_doc         ,',
'                                            eoa_doc_no      ,',
'                                            eoa_filename    ,',
'                                            eoa_mail_type   ,',
'                                            eoa_seq_no      ,',
'                                            eoa_type        ,',
'                                            eoa_cre_by      ,',
'                                            eoa_cre_date    ,',
'                                            eoa_cre_emp_id  ,',
'                                            eoa_cre_ip_addr ,',
'                                            eoa_cre_os_user',
'                                            )',
'                                     VALUES(:GLOBAL_BU,',
'                                            :P117_FILE_CHOOSE,',
'                                            :P117_DOC_NO,',
'                                            :P117_FILE_NAME,',
'                                            ''A'',',
'                                            :P117_ATTA_SEQ_NO,',
'                                            :eoa_type,',
'                                            :GLOBAL_USER,',
'                                            SYSDATE,',
'                                            NULL,',
'                                            NULL,',
'                                            NULL',
'                                           );',
'     END IF;',
'END;        ',
'',
'                                         ',
'                                    ',
'                                     ',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5627274781959866540)
,p_process_success_message=>'Upload Successfully'
,p_internal_uid=>145312747210255510
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5627278286224866575)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Upload_COM'
,p_static_id=>'upload-com'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Raise_application_error(-20999,:P117_DOC_NO_COM);',
'',
'BEGIN',
'      IF :P117_DOC_NO_COM IS NOT NULL THEN',
'',
'        SELECT NVL(MAX(eoa_seq_no),0) + 1',
'          INTO :P117_ATTA_SEQ_NO_COM',
'          FROM email_outbox_attach',
'         WHERE eoa_bu = :GLOBAL_BU ',
'           AND eoa_doc_no = :P117_DOC_NO_COM;',
'      END IF;   ',
'',
'    IF :P117_DOC_NO_COM IS NOT NULL THEN',
'         --  Raise_application_error(-20999,:P117_DOC_NO);',
'             INSERT INTO email_outbox_attach(eoa_bu         ,                                       ',
'                                            eoa_doc         ,',
'                                            eoa_doc_no      ,',
'                                            eoa_filename    ,',
'                                            eoa_mail_type   ,',
'                                            eoa_seq_no      ,',
'                                            eoa_type        ,',
'                                            eoa_cre_by      ,',
'                                            eoa_cre_date    ,',
'                                            eoa_cre_emp_id  ,',
'                                            eoa_cre_ip_addr ,',
'                                            eoa_cre_os_user                 ',
'                                            )',
'                                     VALUES(:GLOBAL_BU,',
'                                            :eoa_doc,',
'                                            :P117_DOC_NO_COM,',
'                                            :P117_FILE_NAME_COM,',
'                                            ''A'',',
'                                            :P117_ATTA_SEQ_NO_COM,',
'                                            :eoa_type,',
'                                            :GLOBAL_USER,',
'                                            SYSDATE,',
'                                            NULL,',
'                                            NULL,',
'                                            NULL',
'                                           );',
'     END IF;',
'END;        ',
'',
'                                         ',
'                                    ',
'                                     ',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5627278206730866574)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Upload Successfully'
,p_internal_uid=>145316450681255547
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5500059462472781530)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Upload_COM_INSERT'
,p_static_id=>'upload-com-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR C1',
'       IS',
'    SELECT EOA_SEQ_NO',
'      FROM EMAIL_OUTBOX_ATTACH',
'     WHERE EOA_BU     = :GLOBAL_BU',
'       AND EOA_DOC_NO = :P117_DOC_NO_COM',
'       AND EOA_SEQ_NO = :P117_ATTA_SEQ_NO_COM ;',
'',
'   v_image        apex_application_temp_files.blob_content%TYPE;',
'   v_filename     apex_application_temp_files.filename%TYPE;',
'   v_doc_name     VARCHAR2 (200);',
'   v_doc_no       VARCHAR2 (15);',
'   v_mime_type    VARCHAR2 (200);',
'   v_att_seq_no   NUMBER (5);',
'   v_dir_name     VARCHAR2 (25);',
'   v_dir_path     VARCHAR2 (150);',
'',
'   CR1            C1%ROWTYPE;',
'BEGIN',
'   OPEN c1;',
'    FETCH c1 INTO cr1;',
'   IF CR1.EOA_SEQ_NO IS NULL',
'   THEN',
'      SELECT NVL (MAX (TO_NUMBER (EOA_SEQ_NO)),0) + 1',
'        INTO v_att_seq_no',
'        FROM EMAIL_OUTBOX_ATTACH',
'       WHERE EOA_BU     = :GLOBAL_BU',
'         AND EOA_DOC_NO = :P117_DOC_NO_COM;',
'   END IF;',
'   CLOSE C1;',
'',
'IF :P117_FILE_CHOOSE_COM IS NOT NULL THEN',
'',
'   SELECT blob_content,',
'          filename,',
'             SUBSTR (filename, 1, INSTR (filename, ''.'') - 1)',
'          || ''(''',
'          || v_doc_no',
'          || '')''',
'          || ''.''',
'          || SUBSTR (filename,',
'                     INSTR (filename, ''.'', -1) + 1,',
'                     LENGTH (filename) - INSTR (filename, ''.'', -1)),',
'          mime_type',
'     INTO v_image,',
'          v_filename,',
'          v_doc_name,',
'          v_mime_type',
'     FROM apex_application_temp_files',
'    WHERE UPPER (name) = UPPER (:P117_FILE_CHOOSE_COM);',
'',
'END IF;',
'-- RAISE_APPLICATION_ERROR(-20999,''HRM''||''~''||v_filename||''~''||v_doc_name);',
'IF v_att_seq_no IS NOT NULL THEN',
'',
'      v_dir_name := ''C_DIR'';',
'',
'      	SELECT directory_path',
'          INTO v_dir_path',
'          FROM sys.dba_directories',
'         WHERE directory_name = ''FILE_ATTACH_DIR'';',
'',
'      v_doc_name := v_dir_path||v_doc_name ;',
'',
'    INSERT INTO EMAIL_OUTBOX_ATTACH (',
'                EOA_BU,',
'                EOA_DOC_NO,',
'                EOA_SEQ_NO,',
'                EOA_FILENAME,',
'                EOA_DOC,',
'                EOA_TYPE,',
'                EOA_CRE_BY,',
'                EOA_CRE_IP_ADDR,',
'                EOA_CRE_DATE,',
'                EOA_CRE_EMP_ID,',
'                EOA_MAIL_TYPE)',
'        VALUES (',
'                :GLOBAL_BU,',
'                :P117_DOC_NO_COM,',
'                v_att_seq_no,',
'                v_doc_name,',
'                NULL,',
'                NULL,',
'                :GLOBAL_USER,',
'                :GLOBAL_IP,',
'                SYSDATE,',
'                :GLOBAL_EMP_ID,',
'                ''A''-- v_mime_type',
'               );',
'',
'    IF v_image IS NOT NULL THEN',
'       proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'    END IF;',
'',
'    COMMIT;',
'ELSE',
'      -- apex_error.add_error (',
'      --    p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'      --    p_display_location   => apex_error.c_inline_in_notification);',
'',
'OPEN c1;',
'  FETCH c1 INTO cr1;',
'  IF CR1.EOA_SEQ_NO IS NOT NULL THEN',
'',
'    v_dir_name := ''C_DIR'';',
'',
'    UPDATE EMAIL_OUTBOX_ATTACH',
'       SET EOA_FILENAME    = v_doc_name,',
'           EOA_DOC         = NULL,',
'           EOA_UPD_BY      = :GLOBAL_USER,',
'           EOA_UPD_DATE    = SYSDATE,',
'           EOA_UPD_EMP_ID  = :GLOBAL_EMP_ID,',
'           EOA_UPD_IP_ADDR = :GLOBAL_IP',
'     WHERE EOA_BU          = :GLOBAL_BU',
'       AND EOA_DOC_NO      = :P117_DOC_NO_COM',
'       AND EOA_SEQ_NO      = CR1.EOA_SEQ_NO ;',
'',
'    IF v_image IS NOT NULL THEN',
'       proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'    END IF;',
'CLOSE c1;',
'END IF;',
'',
'END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5627278206730866574)
,p_process_success_message=>'Upload Successfully'
,p_internal_uid=>18097626929170502
);
wwv_flow_imp.component_end;
end;
/
