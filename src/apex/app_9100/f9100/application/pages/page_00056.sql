prompt --application/pages/page_00056
begin
--   Manifest
--     PAGE: 00056
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
 p_id=>56
,p_name=>'Zone Calendar Ln'
,p_alias=>'ZONE-CALENDAR-LN'
,p_page_mode=>'MODAL'
,p_step_title=>'Zone Calendar Ln'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: linear-gradient(90deg,#1c53a3,#1c53a3) !important;',
'    font-family: Arial !important;',
'    color: white !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'900'
,p_dialog_max_width=>'900'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19459955386022723281)
,p_plug_name=>'Zone Calendar Ln'
,p_static_id=>'zone-calendar-ln'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       zwcln_bu,',
'       zwcln_plnt,',
'       zwcln_clndr_no,',
'       zwcln_zone_id,',
'       zwcln_year,',
'       zwcln_seq_no,',
'       zwcln_date,',
'       zwcln_workoff,',
'       DECODE(zwcln_workoff,',
'              ''Y'',''<span aria-hidden="true" class="fa fa-toggle-on" style="color:green"></span>'',',
'              ''N'',''<span aria-hidden="true" class="fa fa-toggle-off" style="color:red"></span>'') zwcln_workoff_desc,       ',
'       zwcln_ref,',
'       DECODE(zwcln_holiday,''N'',''Working'',''W'',''Work Off'',''H'',''Holiday'',''B'',''Both Work Off & Holiday'') zwcln_holiday,',
'       zwcln_day,',
'       zwcln_period,',
'       zwcln_cre_by,',
'       zwcln_cre_ip_addr,',
'       zwcln_cre_os_user,',
'       zwcln_cre_date,',
'       zwcln_upd_by,',
'       zwcln_upd_ip_addr,',
'       zwcln_upd_os_user,',
'       zwcln_upd_date,',
'       zwcln_cre_emp_id,',
'       zwcln_upd_emp_id',
'  FROM zone_workday_calendar_ln',
' WHERE zwcln_bu = :GLOBAL_BU',
'   AND zwcln_clndr_no = :P56_CLNDR_NO',
' ORDER BY zwcln_date'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Zone Calendar Ln'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19459955277448723281)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>13587612945266871724
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201882010592005689)
,p_db_column_name=>'ROWID'
,p_display_order=>244
,p_column_identifier=>'W'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201881206408005688)
,p_db_column_name=>'ZWCLN_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Zwcln Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201880417126005686)
,p_db_column_name=>'ZWCLN_CLNDR_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Zwcln Clndr No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201876346289005680)
,p_db_column_name=>'ZWCLN_CRE_BY'
,p_display_order=>144
,p_column_identifier=>'M'
,p_column_label=>'Zwcln Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201875147351005678)
,p_db_column_name=>'ZWCLN_CRE_DATE'
,p_display_order=>174
,p_column_identifier=>'P'
,p_column_label=>'Zwcln Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201873171230005677)
,p_db_column_name=>'ZWCLN_CRE_EMP_ID'
,p_display_order=>224
,p_column_identifier=>'U'
,p_column_label=>'Zwcln Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201875969750005680)
,p_db_column_name=>'ZWCLN_CRE_IP_ADDR'
,p_display_order=>154
,p_column_identifier=>'N'
,p_column_label=>'Zwcln Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201875599572005680)
,p_db_column_name=>'ZWCLN_CRE_OS_USER'
,p_display_order=>164
,p_column_identifier=>'O'
,p_column_label=>'Zwcln Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201878765256005685)
,p_db_column_name=>'ZWCLN_DATE'
,p_display_order=>64
,p_column_identifier=>'G'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DF.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201877170035005683)
,p_db_column_name=>'ZWCLN_DAY'
,p_display_order=>74
,p_column_identifier=>'K'
,p_column_label=>'Day'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201877612574005683)
,p_db_column_name=>'ZWCLN_HOLIDAY'
,p_display_order=>114
,p_column_identifier=>'J'
,p_column_label=>'Holiday'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201876733321005682)
,p_db_column_name=>'ZWCLN_PERIOD'
,p_display_order=>94
,p_column_identifier=>'L'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201880763226005688)
,p_db_column_name=>'ZWCLN_PLNT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Zwcln Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201878028636005683)
,p_db_column_name=>'ZWCLN_REF'
,p_display_order=>104
,p_column_identifier=>'I'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201879179149005685)
,p_db_column_name=>'ZWCLN_SEQ_NO'
,p_display_order=>14
,p_column_identifier=>'F'
,p_column_label=>'Zwcln Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201874802409005678)
,p_db_column_name=>'ZWCLN_UPD_BY'
,p_display_order=>184
,p_column_identifier=>'Q'
,p_column_label=>'Zwcln Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201873554820005677)
,p_db_column_name=>'ZWCLN_UPD_DATE'
,p_display_order=>214
,p_column_identifier=>'T'
,p_column_label=>'Zwcln Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201872820170005675)
,p_db_column_name=>'ZWCLN_UPD_EMP_ID'
,p_display_order=>234
,p_column_identifier=>'V'
,p_column_label=>'Zwcln Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201874372533005678)
,p_db_column_name=>'ZWCLN_UPD_IP_ADDR'
,p_display_order=>194
,p_column_identifier=>'R'
,p_column_label=>'Zwcln Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201873959738005677)
,p_db_column_name=>'ZWCLN_UPD_OS_USER'
,p_display_order=>204
,p_column_identifier=>'S'
,p_column_label=>'Zwcln Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201878363494005685)
,p_db_column_name=>'ZWCLN_WORKOFF'
,p_display_order=>134
,p_column_identifier=>'H'
,p_column_label=>'WO'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201881571917005688)
,p_db_column_name=>'ZWCLN_WORKOFF_DESC'
,p_display_order=>124
,p_column_identifier=>'X'
,p_column_label=>'WO'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201879631543005686)
,p_db_column_name=>'ZWCLN_YEAR'
,p_display_order=>84
,p_column_identifier=>'E'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201879963907005686)
,p_db_column_name=>'ZWCLN_ZONE_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Zwcln Zone Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19459943818017719092)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55026364'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ZWCLN_DATE:ZWCLN_DAY:ZWCLN_YEAR:ZWCLN_PERIOD:ZWCLN_REF:ZWCLN_HOLIDAY:ZWCLN_WORKOFF:ZWCLN_WORKOFF_DESC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201882673955005691)
,p_name=>'P56_CLNDR_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19459955386022723281)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
