prompt --application/pages/page_00040
begin
--   Manifest
--     PAGE: 00040
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
 p_id=>40
,p_name=>'Announcement'
,p_alias=>'ANNOUNCEMENT2'
,p_step_title=>'Announcement'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-header a{',
'    --a-gv-header-cell-border-color: #fafafa;',
'    background-color: #235bb1;',
'    color: white;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6201469550022659689)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE,',
'       GN_NOTI_HD,',
'       GN_NOTI,',
'       GN_NOTI_BY,',
'       GN_EFF_TO,',
'       GN_EFF_FROM,',
'       GN_DUE_DATE,',
'       GN_STATUS,',
'       GN_VISIBLITY,',
'       GN_CRE_BY,',
'       GN_CRE_IP_ADDR,',
'       GN_CRE_OS_USER,',
'       GN_CRE_DATE,',
'       GN_UPD_BY,',
'       GN_UPD_IP_ADDR,',
'       GN_UPD_OS_USER,',
'       GN_UPD_DATE,',
'       GN_CRE_EMP_ID,',
'       GN_UPD_EMP_ID,',
'       GN_ATTACH,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION',
'  WHERE GN_BU =:GLOBAL_BU;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Announcement'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6201469662899659689)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:100201:&SESSION.::&DEBUG.::P100201_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_internal_uid=>329127330717808132
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201063760235904200)
,p_db_column_name=>'GN_ATTACH'
,p_display_order=>34
,p_column_identifier=>'X'
,p_column_label=>'Gn Attach'
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
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201470022991659696)
,p_db_column_name=>'GN_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Gn Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201474415528659702)
,p_db_column_name=>'GN_CRE_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Gn Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201475559204659703)
,p_db_column_name=>'GN_CRE_DATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Gn Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201477553742659705)
,p_db_column_name=>'GN_CRE_EMP_ID'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Gn Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201474780756659702)
,p_db_column_name=>'GN_CRE_IP_ADDR'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Gn Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201475227344659702)
,p_db_column_name=>'GN_CRE_OS_USER'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Gn Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201470764594659697)
,p_db_column_name=>'GN_DOC_DATE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc. Date'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 62px;',
'   word-wrap: break-word;">#GN_DOC_DATE#</div>'))
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201470364059659697)
,p_db_column_name=>'GN_DOC_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 62px;',
'   word-wrap: break-word;">#GN_DOC_NO#</div>'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201473141893659700)
,p_db_column_name=>'GN_DUE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Due Date'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 62px;',
'   word-wrap: break-word;">#GN_DUE_DATE#</div>'))
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201472771766659700)
,p_db_column_name=>'GN_EFF_FROM'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Eff. From'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 62px;',
'   word-wrap: break-word;">#GN_EFF_FROM#</div>'))
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201472356693659699)
,p_db_column_name=>'GN_EFF_TO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Eff. To'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 62px;',
'   word-wrap: break-word;">#GN_EFF_TO#</div>'))
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201478335844659708)
,p_db_column_name=>'GN_FILE_NAME'
,p_display_order=>23
,p_column_identifier=>'V'
,p_column_label=>'Gn File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201478828300659708)
,p_db_column_name=>'GN_MIME_TYPE'
,p_display_order=>24
,p_column_identifier=>'W'
,p_column_label=>'Gn Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201471537681659699)
,p_db_column_name=>'GN_NOTI'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Notification'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201472011525659699)
,p_db_column_name=>'GN_NOTI_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Notification By'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 90px;',
'   word-wrap: break-word;">#GN_NOTI_BY#</div>'))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201471176104659697)
,p_db_column_name=>'GN_NOTI_HD'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Notification Title'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 90px;',
'   word-wrap: break-word;">#GN_NOTI_HD#</div>'))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201473626551659700)
,p_db_column_name=>'GN_STATUS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201476006444659703)
,p_db_column_name=>'GN_UPD_BY'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Gn Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201477185529659705)
,p_db_column_name=>'GN_UPD_DATE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Gn Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201477936841659707)
,p_db_column_name=>'GN_UPD_EMP_ID'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Gn Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201476431655659703)
,p_db_column_name=>'GN_UPD_IP_ADDR'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Gn Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201476826619659703)
,p_db_column_name=>'GN_UPD_OS_USER'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Gn Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201473988886659700)
,p_db_column_name=>'GN_VISIBLITY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Visiblity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201063852367904201)
,p_db_column_name=>'ROWID'
,p_display_order=>44
,p_column_identifier=>'Y'
,p_column_label=>'Rowid'
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
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6201481888232676683)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3291396'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'GN_DOC_NO:GN_DOC_DATE:GN_NOTI_HD:GN_NOTI:GN_NOTI_BY:GN_EFF_TO:GN_EFF_FROM:GN_DUE_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201064092864904203)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6201469550022659689)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:100201:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp.component_end;
end;
/
