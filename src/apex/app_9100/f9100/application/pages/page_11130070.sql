prompt --application/pages/page_11130070
begin
--   Manifest
--     PAGE: 11130070
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
 p_id=>11130070
,p_name=>'System Error Message'
,p_alias=>'ERROR-MSG'
,p_step_title=>'System Error Message'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      /* white-space: nowrap; */',
'      /* word-wrap: break-word; */',
'}',
'',
'/* .a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'} */',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8922876442109011728)
,p_plug_name=>'Database Error'
,p_static_id=>'database-error'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ER_ERROR_ID,',
'       ER_ERROR_MSG1,',
'       ER_ERROR_MSG2,',
'       ER_APPL,',
'       ER_ROT_CAU_FLAG,',
'         CASE WHEN ER_ROT_CAU_FLAG=''N''THEN',
'                   ''<span class="fa fa-square-o" aria-hidden="true" title="edit"></span></span>'' ',
'               ELSE ',
'                   ''<span class="fa fa-check-square" aria-hidden="true" title="edit" style="cursor:no-drop;"></span></span>'' ',
'         END "Route Cause",',
'         ''<span aria-hidden="true" class="fa fa-info-circle"style="color:darkblue;"></span>''"Language",',
'       ER_CRE_BY,',
'       ER_CRE_IP_ADDR,',
'       ER_CRE_OS_USER,',
'       ER_CRE_DATE,',
'       ER_UPD_BY,',
'       ER_UPD_IP_ADDR,',
'       ER_UPD_OS_USER,',
'       ER_UPD_DATE,',
'       ER_CRE_EMP_ID,',
'       ER_UPD_EMP_ID',
'  from ERROR_MESSAGES',
'  order by ER_ERROR_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Database Error'
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
 p_id=>wwv_flow_imp.id(8922876620888011729)
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
,p_internal_uid=>3440914785344400701
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922876970412011733)
,p_db_column_name=>'ER_APPL'
,p_display_order=>40
,p_is_primary_key=>'Y'
,p_column_identifier=>'D'
,p_column_label=>'Application'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877187413011735)
,p_db_column_name=>'ER_CRE_BY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Er Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877503365011738)
,p_db_column_name=>'ER_CRE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Er Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877990954011743)
,p_db_column_name=>'ER_CRE_EMP_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Er Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877280988011736)
,p_db_column_name=>'ER_CRE_IP_ADDR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Er Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877399787011737)
,p_db_column_name=>'ER_CRE_OS_USER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Er Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922876674911011730)
,p_db_column_name=>'ER_ERROR_ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Code'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922876747498011731)
,p_db_column_name=>'ER_ERROR_MSG1'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922876900183011732)
,p_db_column_name=>'ER_ERROR_MSG2'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Er Error Msg2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877123442011734)
,p_db_column_name=>'ER_ROT_CAU_FLAG'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Er Rot Cau Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877535570011739)
,p_db_column_name=>'ER_UPD_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Er Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877850362011742)
,p_db_column_name=>'ER_UPD_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Er Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922878054069011744)
,p_db_column_name=>'ER_UPD_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Er Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877646007011740)
,p_db_column_name=>'ER_UPD_IP_ADDR'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Er Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922877769861011741)
,p_db_column_name=>'ER_UPD_OS_USER'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Er Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922878483218011748)
,p_db_column_name=>'Language'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Language'
,p_column_link=>'f?p=&APP_ID.:1113008003:&SESSION.::&DEBUG.::P1113008003_APPL,P1113008003_ERROR_ID:#ER_APPL#,#ER_ERROR_ID#'
,p_column_linktext=>'#Language#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922878358727011747)
,p_db_column_name=>'Route Cause'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Route Cause'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8923843100644408755)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7425895'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ER_ERROR_ID:ER_ERROR_MSG1:ER_APPL:Language:Route Cause'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8922294686627478806)
,p_plug_name=>'Form Error Message'
,p_static_id=>'form-error-message'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ECG_GROUP_ID,',
'       ECG_ERR_TYPE,',
'       ECG_GROUP_MSG1,',
'       ECG_GROUP_MSG2,',
'       ECG_ROT_CAU_FLAG,',
'         CASE WHEN ECG_ROT_CAU_FLAG=''N''THEN',
'                   ''<span class="fa fa-square-o" aria-hidden="true" title="edit"></span></span>'' ',
'               ELSE ',
'                   ''<span class="fa fa-check-square" aria-hidden="true" title="edit" style="cursor:no-drop;"></span></span>'' ',
'         END "Route Cause",',
'        ''<span aria-hidden="true" class="fa fa-edit" style="color:darkpink;" ></span>''"Edit", ',
'        ''<span aria-hidden="true" class="fa fa-info-circle"style="color:darkblue;"></span>''"Language",',
'       ECG_CRE_BY,',
'       ECG_CRE_IP_ADDR,',
'       ECG_CRE_OS_USER,',
'       ECG_CRE_DATE,',
'       ECG_UPD_BY,',
'       ECG_UPD_IP_ADDR,',
'       ECG_UPD_OS_USER,',
'       ECG_UPD_DATE,',
'       ECG_CRE_EMP_ID,',
'       ECG_UPD_EMP_ID',
'  from ERR_COLUMN_GROUPS'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Form Error Message'
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
 p_id=>wwv_flow_imp.id(8922294745478478806)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3440332909934867778
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922296952212478945)
,p_db_column_name=>'ECG_CRE_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Ecg Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922298219294478952)
,p_db_column_name=>'ECG_CRE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Ecg Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922300200882478955)
,p_db_column_name=>'ECG_CRE_EMP_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Ecg Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922297411719478945)
,p_db_column_name=>'ECG_CRE_IP_ADDR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Ecg Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922297813341478945)
,p_db_column_name=>'ECG_CRE_OS_USER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Ecg Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922295485589478942)
,p_db_column_name=>'ECG_ERR_TYPE'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922295103177478927)
,p_db_column_name=>'ECG_GROUP_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922295776291478944)
,p_db_column_name=>'ECG_GROUP_MSG1'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922296197314478944)
,p_db_column_name=>'ECG_GROUP_MSG2'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Ecg Group Msg2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922296593227478944)
,p_db_column_name=>'ECG_ROT_CAU_FLAG'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Ecg Rot Cau Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922298542692478952)
,p_db_column_name=>'ECG_UPD_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ecg Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922299802292478955)
,p_db_column_name=>'ECG_UPD_DATE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Ecg Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922300627097478955)
,p_db_column_name=>'ECG_UPD_EMP_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Ecg Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922298984001478953)
,p_db_column_name=>'ECG_UPD_IP_ADDR'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Ecg Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922299417462478953)
,p_db_column_name=>'ECG_UPD_OS_USER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Ecg Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8733520479908354846)
,p_db_column_name=>'Edit'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Edit'
,p_column_link=>'f?p=&APP_ID.:1113008001:&SESSION.::&DEBUG.::P1113008001_GROUP,P1113008001_TYPE,P1113008001_MESSAGE,P1113008001_BTN_TYPE:#ECG_GROUP_ID#,#ECG_ERR_TYPE#,#ECG_GROUP_MSG1#,E'
,p_column_linktext=>'#Edit#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922876392075011727)
,p_db_column_name=>'Language'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Language'
,p_column_link=>'f?p=&APP_ID.:1113008002:&SESSION.::&DEBUG.::P1113008002_GRP_ID,P1113008002_TYPE:#ECG_GROUP_ID#,#ECG_ERR_TYPE#'
,p_column_linktext=>'#Language#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8733520429981354845)
,p_db_column_name=>'Route Cause'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Route Cause'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8922314501086501380)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7410609'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ECG_GROUP_ID:ECG_ERR_TYPE:ECG_GROUP_MSG1:Edit:Language'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8927054894871510616)
,p_plug_name=>'Multi Language Desc.'
,p_static_id=>'multi-language-desc'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>5
,p_plug_display_column=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LLC_ENG_1,',
'       LLC_ARAB_2,',
'       LLC_TAM_3,',
'       LLC_USER_ENG,',
'       LLC_USER_ARAB,',
'       LLC_CRE_BY,',
'       LLC_CRE_IP_ADDR,',
'       LLC_CRE_OS_USER,',
'       LLC_CRE_DATE,',
'       LLC_UPD_BY,',
'       LLC_UPD_IP_ADDR,',
'       LLC_UPD_OS_USER,',
'       LLC_UPD_DATE,',
'       LLC_CRE_EMP_ID,',
'       LLC_UPD_EMP_ID',
'  from LABEL_LANG_CONTROL'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Multi Language Desc.'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055221292510619)
,p_name=>'LLC_ARAB_2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_ARAB_2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Llc Arab 2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055599495510623)
,p_name=>'LLC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055838621510626)
,p_name=>'LLC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Llc Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927056401840510631)
,p_name=>'LLC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055702618510624)
,p_name=>'LLC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055812418510625)
,p_name=>'LLC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Cre Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055125903510618)
,p_name=>'LLC_ENG_1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_ENG_1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'System Label English'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055231417510620)
,p_name=>'LLC_TAM_3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_TAM_3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Llc Tam 3'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055959122510627)
,p_name=>'LLC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927056242419510630)
,p_name=>'LLC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Llc Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927056527429510632)
,p_name=>'LLC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927056044295510628)
,p_name=>'LLC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927056188681510629)
,p_name=>'LLC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Llc Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055483599510622)
,p_name=>'LLC_USER_ARAB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_USER_ARAB'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Llc User Arab'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8927055364278510621)
,p_name=>'LLC_USER_ENG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LLC_USER_ENG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Llc User Eng'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8927055012096510617)
,p_internal_uid=>3445093176552899589
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8927244886112680866)
,p_interactive_grid_id=>wwv_flow_imp.id(8927055012096510617)
,p_static_id=>'7459913'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8927245043922680867)
,p_report_id=>wwv_flow_imp.id(8927244886112680866)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927245599137680881)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8927055125903510618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927246461499680898)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8927055221292510619)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927247414118680906)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8927055231417510620)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927248307902680914)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8927055364278510621)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927249134398680920)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8927055483599510622)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927250090077680928)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8927055599495510623)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927250954948680938)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8927055702618510624)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927251842734680948)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8927055812418510625)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927252881953680956)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8927055838621510626)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927253772582680964)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8927055959122510627)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927254635931680970)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8927056044295510628)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927255572049680978)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8927056188681510629)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927256524404680986)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8927056242419510630)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927257335736680994)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8927056401840510631)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8927258222322681002)
,p_view_id=>wwv_flow_imp.id(8927245043922680867)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8927056527429510632)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8922878753218011751)
,p_plug_name=>'Sys. Error'
,p_static_id=>'sys-error'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT WBF_FORM_ID,',
'      WBF_PAGE_NO,',
'       EML_DATE,',
'       EML_FE_MESSAGE,',
'       EML_BE_MESSAGE',
'FROM(',
'select WBF_FORM_ID,',
'      WBF_PAGE_NO,',
'       EML_DATE,',
'       EML_FE_MESSAGE,',
'       EML_BE_MESSAGE',
'  from ERROR_MESSAGE_LOG, WAPL_BUS_FUN',
' where (EML_BUS_FUN_ID=:P11130070_BUS_FUN OR :P11130070_BUS_FUN IS NULL)',
' AND WBF_BUS_FUN_ID(+) = EML_BUS_FUN_ID',
' order by EML_DATE  DESC)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11130070_BUS_FUN'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sys. Error'
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
 p_id=>wwv_flow_imp.id(8922878871341011752)
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
,p_internal_uid=>3440917035797400724
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922879249437011756)
,p_db_column_name=>'EML_BE_MESSAGE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Error Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8180722065093357033)
,p_db_column_name=>'EML_DATE'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>'Date & Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8922879149626011755)
,p_db_column_name=>'EML_FE_MESSAGE'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Error'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143408271512427154)
,p_db_column_name=>'WBF_FORM_ID'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Bus. Fun ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143408413633427155)
,p_db_column_name=>'WBF_PAGE_NO'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Page No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8924164049075607023)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7429105'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WBF_FORM_ID:WBF_PAGE_NO:EML_DATE:EML_FE_MESSAGE:EML_BE_MESSAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8922878144907011745)
,p_plug_name=>'Tab Items'
,p_static_id=>'tab-items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117345201218696917)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8922294686627478806)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1113008001:&SESSION.::&DEBUG.::P1113008001_BTN_TYPE:A'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(220064514501171814)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8922878753218011751)
,p_button_name=>'BACK'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:111300801:&SESSION.::&DEBUG.::P111300801_TAB:'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117330469466696821)
,p_button_sequence=>10
,p_button_name=>'DELETE_LOG'
,p_static_id=>'delete-log'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete Log'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8922891666739012494)
,p_name=>'P11130070_BUS_FUN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8922878753218011751)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Bus. Fun. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BUS_FUN_AAM00701'
,p_cSize=>30
,p_colspan=>2
,p_grid_column=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8922891721767012495)
,p_name=>'P11130070_DESC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8922878753218011751)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Bus. Fun. Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8922916499688012633)
,p_name=>'P11130070_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8922878144907011745)
,p_item_default=>'FE'
,p_prompt=>'Filter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Form Error;FE,Database Error;DE,Sys. Error;SE,Multi Language Desc.;MLD'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117354470327697034)
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11130070_BUS_FUN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117355013977697040)
,p_event_id=>wwv_flow_imp.id(7117354470327697034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P11130070_DESC',
  'items_to_submit', 'P11130070_BUS_FUN',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P11130070_BUS_FUN IS NOT NULL THEN',
    '  DECLARE',
    '  	CURSOR c1 IS',
    '  	  SELECT *',
    '  	    FROM wapl_bus_fun',
    '  	   WHERE wbf_form_id = :P11130070_BUS_FUN;',
    '  	cr1	    c1%ROWTYPE;',
    '  BEGIN',
    '  	OPEN c1;',
    '  	FETCH c1 INTO cr1;',
    '  	  IF c1%FOUND THEN',
    '  	  	:P11130070_DESC := cr1.wbf_bus_fun_name;',
    '  	  END IF;',
    '  	CLOSE c1;',
    '  END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117355436310697043)
,p_event_id=>wwv_flow_imp.id(7117354470327697034)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8922878753218011751)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117355894620697045)
,p_name=>'enable/disable button'
,p_static_id=>'enable-disable-button'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117330469466696821)
,p_condition_element=>'P11130070_DESC'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117356911144697048)
,p_event_id=>wwv_flow_imp.id(7117355894620697045)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7117330469466696821)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117356420560697046)
,p_event_id=>wwv_flow_imp.id(7117355894620697045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7117330469466696821)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117354080244697032)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'for delete log'
,p_static_id=>'for-delete-log'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    proc_del_busfun_error_log(:P11130070_BUS_FUN);',
'END;    '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7117330469466696821)
,p_internal_uid=>1635392244701086004
);
wwv_flow_imp.component_end;
end;
/
