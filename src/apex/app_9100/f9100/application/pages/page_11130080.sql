prompt --application/pages/page_11130080
begin
--   Manifest
--     PAGE: 11130080
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
 p_id=>11130080
,p_name=>'Forms/ Database Error Message'
,p_alias=>'SYSTEM-ERROR-MESSAGE'
,p_step_title=>'Forms/ Database Error Message'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* --------------------------------Tab Color--------------------------------- */',
'/* ',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label {',
'    --a-button-background-color: #00b1e7 ;',
'    --a-button-text-color: #ffffff;',
'    --a-button-hover-background-color: #00b1e7 ;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #00b1e7 ;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'.apex-item-radio input:checked+.u-radio, .apex-item-radio input:checked+label, .u-radio.is-checked {',
'    --a-checkbox-background-color: #00b1e7;',
'    --a-checkbox-text-color: var(--a-checkbox-checked-text-color);',
'} */',
'',
'',
'/* -----------------------------Grid Header Column Color--------------------- */',
'/* ',
'  .a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'      font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,700));',
'      background: #00b1e7 !important;',
'      color: white !important;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'  background: #00b1e7 !important;',
'} */'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6223584646327989543)
,p_plug_name=>'Database Error'
,p_static_id=>'database-error'
,p_region_name=>'DE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
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
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11130080_FIND'
,p_plug_display_when_cond2=>'DE'
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
 p_id=>wwv_flow_imp.id(6223584825106989544)
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
,p_internal_uid=>741622989563378516
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223585174630989548)
,p_db_column_name=>'ER_APPL'
,p_display_order=>40
,p_is_primary_key=>'Y'
,p_column_identifier=>'D'
,p_column_label=>'Application'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223585391631989550)
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
 p_id=>wwv_flow_imp.id(6223585707583989553)
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
 p_id=>wwv_flow_imp.id(6223586195172989558)
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
 p_id=>wwv_flow_imp.id(6223585485206989551)
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
 p_id=>wwv_flow_imp.id(6223585604005989552)
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
 p_id=>wwv_flow_imp.id(6223584879129989545)
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
 p_id=>wwv_flow_imp.id(6223584951716989546)
,p_db_column_name=>'ER_ERROR_MSG1'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223585104401989547)
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
 p_id=>wwv_flow_imp.id(6223585327660989549)
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
 p_id=>wwv_flow_imp.id(6223585739788989554)
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
 p_id=>wwv_flow_imp.id(6223586054580989557)
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
 p_id=>wwv_flow_imp.id(6223586258287989559)
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
 p_id=>wwv_flow_imp.id(6223585850225989555)
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
 p_id=>wwv_flow_imp.id(6223585974079989556)
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
 p_id=>wwv_flow_imp.id(6223586687436989563)
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
 p_id=>wwv_flow_imp.id(6223586562945989562)
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
 p_id=>wwv_flow_imp.id(6224551304863386570)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7425895'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ER_ERROR_ID:ER_ERROR_MSG1:ER_APPL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6223002890846456621)
,p_plug_name=>'Form Error Message'
,p_static_id=>'form-error-message'
,p_title=>'Form Error Message'
,p_region_name=>'FE'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
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
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11130080_FIND'
,p_plug_display_when_cond2=>'FE'
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
 p_id=>wwv_flow_imp.id(6223002949697456621)
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
,p_internal_uid=>741041114153845593
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223005156431456760)
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
 p_id=>wwv_flow_imp.id(6223006423513456767)
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
 p_id=>wwv_flow_imp.id(6223008405101456770)
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
 p_id=>wwv_flow_imp.id(6223005615938456760)
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
 p_id=>wwv_flow_imp.id(6223006017560456760)
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
 p_id=>wwv_flow_imp.id(6223003689808456757)
,p_db_column_name=>'ECG_ERR_TYPE'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223003307396456742)
,p_db_column_name=>'ECG_GROUP_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223003980510456759)
,p_db_column_name=>'ECG_GROUP_MSG1'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223004401533456759)
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
 p_id=>wwv_flow_imp.id(6223004797446456759)
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
 p_id=>wwv_flow_imp.id(6223006746911456767)
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
 p_id=>wwv_flow_imp.id(6223008006511456770)
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
 p_id=>wwv_flow_imp.id(6223008831316456770)
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
 p_id=>wwv_flow_imp.id(6223007188220456768)
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
 p_id=>wwv_flow_imp.id(6223007621681456768)
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
 p_id=>wwv_flow_imp.id(6034228684127332661)
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
 p_id=>wwv_flow_imp.id(6223584596293989542)
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
 p_id=>wwv_flow_imp.id(6034228634200332660)
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
 p_id=>wwv_flow_imp.id(6223022705305479195)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7410609'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ECG_GROUP_ID:ECG_ERR_TYPE:ECG_GROUP_MSG1:Edit'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6227763099090488431)
,p_plug_name=>'Multi Language Desc.'
,p_static_id=>'multi-language-desc'
,p_region_name=>'MLD'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
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
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P11130080_FIND'
,p_plug_display_when_cond2=>'MLD'
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
 p_id=>wwv_flow_imp.id(6227763425511488434)
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
 p_id=>wwv_flow_imp.id(6227763803714488438)
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
 p_id=>wwv_flow_imp.id(6227764042840488441)
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
 p_id=>wwv_flow_imp.id(6227764606059488446)
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
 p_id=>wwv_flow_imp.id(6227763906837488439)
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
 p_id=>wwv_flow_imp.id(6227764016637488440)
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
 p_id=>wwv_flow_imp.id(6227763330122488433)
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
 p_id=>wwv_flow_imp.id(6227763435636488435)
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
 p_id=>wwv_flow_imp.id(6227764163341488442)
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
 p_id=>wwv_flow_imp.id(6227764446638488445)
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
 p_id=>wwv_flow_imp.id(6227764731648488447)
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
 p_id=>wwv_flow_imp.id(6227764248514488443)
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
 p_id=>wwv_flow_imp.id(6227764392900488444)
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
 p_id=>wwv_flow_imp.id(6227763687818488437)
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
 p_id=>wwv_flow_imp.id(6227763568497488436)
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
 p_id=>wwv_flow_imp.id(6227763216315488432)
,p_internal_uid=>745801380771877404
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>false
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
 p_id=>wwv_flow_imp.id(6227953090331658681)
,p_interactive_grid_id=>wwv_flow_imp.id(6227763216315488432)
,p_static_id=>'7459913'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6227953248141658682)
,p_report_id=>wwv_flow_imp.id(6227953090331658681)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227953803356658696)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6227763330122488433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227954665718658713)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6227763425511488434)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227955618337658721)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6227763435636488435)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227956512121658729)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6227763568497488436)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227957338617658735)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6227763687818488437)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227958294296658743)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6227763803714488438)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227959159167658753)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6227763906837488439)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227960046953658763)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6227764016637488440)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227961086172658771)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6227764042840488441)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227961976801658779)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6227764163341488442)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227962840150658785)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6227764248514488443)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227963776268658793)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6227764392900488444)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227964728623658801)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6227764446638488445)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227965539955658809)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6227764606059488446)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6227966426541658817)
,p_view_id=>wwv_flow_imp.id(6227953248141658682)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6227764731648488447)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6223586957436989566)
,p_plug_name=>'Sys. Error'
,p_static_id=>'sys-error'
,p_region_name=>'SE'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EML_BUS_FUN_ID,',
'TO_CHAR(EML_DATE,''DD-MM-YYYY HH24:MI:SS'')EML_DATE,',
'       EML_FE_MESSAGE,',
'       EML_BE_MESSAGE',
'  from ERROR_MESSAGE_LOG',
' --where EML_BUS_FUN_ID=:P11130080_BUS_FUN ',
' where  ((EML_BUS_FUN_ID LIKE ''%''||:P11130080_BUS_FUN||''%'') OR :P11130080_BUS_FUN IS NULL)',
' order by EML_DATE desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11130080_BUS_FUN'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(6223587075559989567)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>741625240016378539
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223587453655989571)
,p_db_column_name=>'EML_BE_MESSAGE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Database'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223587143846989568)
,p_db_column_name=>'EML_BUS_FUN_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Bus. Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223587616978989572)
,p_db_column_name=>'EML_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Date & Time'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6223587353844989570)
,p_db_column_name=>'EML_FE_MESSAGE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Forms'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6224872253294584838)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7429105'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EML_BUS_FUN_ID:EML_DATE:EML_FE_MESSAGE:EML_BE_MESSAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6223586349125989560)
,p_plug_name=>'Tab Items'
,p_static_id=>'tab-items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6034229966196332674)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6223002890846456621)
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
 p_id=>wwv_flow_imp.id(7590238785604992472)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6223586349125989560)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:111300801:&SESSION.::&DEBUG.::P111300801_TAB:'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6223588009877989576)
,p_name=>'P11130080_BUS_FUN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6223586957436989566)
,p_prompt=>'Bus. Fun. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BUS_FUN_NAME'
,p_cSize=>30
,p_colspan=>2
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(6223588064905989577)
,p_name=>'P11130080_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6223586957436989566)
,p_prompt=>'Bus. Fun. Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6223586487084989561)
,p_name=>'P11130080_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6223586349125989560)
,p_item_default=>'FE'
,p_prompt=>'Filter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Form Error;FE,Database Error;DE'
,p_colspan=>6
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7590238269203992467)
,p_name=>'P11130080_FIND'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6223586349125989560)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6223588137418989578)
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11130080_BUS_FUN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6227762931736488429)
,p_event_id=>wwv_flow_imp.id(6223588137418989578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P11130080_DESC',
  'items_to_submit', 'P11130080_BUS_FUN',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT DECODE((SELECT applctrl_desc_level',
    '                 FROM appl_control',
    '                WHERE applctrl_bu = :global_bu),1, APBUF_FUN_DESC1,NVL (APBUF_FUN_DESC2, APBUF_FUN_DESC2))',
    '       fun_desc',
    '  INTO :P11130080_DESC     ',
    '  FROM appl_bus_fun',
    ' WHERE apbuf_fun_id IS NOT NULL',
    '   AND APBUF_FUN_ID=:P11130080_BUS_FUN;',
    'EXCEPTION WHEN NO_DATA_FOUND THEN',
    'Raise_Application_Error(-20999,''APX''||''Bus. Fun. ID not found.''); ',
    'END; ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6227762984405488430)
,p_event_id=>wwv_flow_imp.id(6223588137418989578)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Bus. Fun. Desc.'
,p_static_id=>'bus-fun-desc-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6223586957436989566)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6971629377328328072)
,p_name=>'FILTER'
,p_static_id=>'filter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11130080_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6971629638559328075)
,p_event_id=>wwv_flow_imp.id(6971629377328328072)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P11130080_FILTER',
  'language', 'PLSQL',
  'plsql_code', ':MAIN_TAB := :P11130080_FILTER;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6971629481040328073)
,p_event_id=>wwv_flow_imp.id(6971629377328328072)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''FE'': ''FE'',',
    '  ''DE'': ''DE'',',
    '  ''SE'': ''SE'',',
    '  ''MLD'' : ''MLD''',
    '  };',
    '  ',
    'const selectedTab = $v("P11130080_FILTER");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
