prompt --application/pages/page_00163
begin
--   Manifest
--     PAGE: 00163
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
 p_id=>163
,p_name=>'Notification List'
,p_alias=>'NOTIFICATION-LIST'
,p_step_title=>'Notification List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5686969758812290661)
,p_plug_name=>'Notification List'
,p_static_id=>'notification-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wnl_seq_no,',
'       wnl_bus_fun_id,',
'       wnl_bus_fun_name,',
'       wnl_par_fun_id,',
'       CASE WHEN (SELECT b.wnl_bus_fun_name FROM wapl_notify_list b WHERE b.wnl_bus_fun_id = a.wnl_par_fun_id) IS NOT NULL THEN ',
'          ''Sub''',
'       ELSE',
'         ''Main''',
'       END Type,     ',
'       (SELECT b.wnl_bus_fun_name',
'          FROM wapl_notify_list b',
'         WHERE b.wnl_bus_fun_id = a.wnl_par_fun_id)wnl_par_fun_name,',
'       ROWNUM,',
'       WNL_MODULE  ',
'  FROM wapl_notify_list a WHERE wnl_par_fun_id IS NOT NULL',
'ORDER BY wnl_bus_fun_id,wnl_seq_no   '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Notification List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5686969783998290661)
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
,p_internal_uid=>207448800213370459
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6544985642078269823)
,p_db_column_name=>'ROWNUM'
,p_display_order=>44
,p_column_identifier=>'M'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5606188216128456525)
,p_db_column_name=>'TYPE'
,p_display_order=>34
,p_column_identifier=>'L'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5686970889502290680)
,p_db_column_name=>'WNL_BUS_FUN_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Notification ID'
,p_column_link=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:178:P178_WNL_BUS_FUN_ID:#WNL_BUS_FUN_ID#'
,p_column_linktext=>'#WNL_BUS_FUN_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5686971305470290680)
,p_db_column_name=>'WNL_BUS_FUN_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Notification Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6608472991598122711)
,p_db_column_name=>'WNL_MODULE'
,p_display_order=>54
,p_column_identifier=>'N'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5686971764964290680)
,p_db_column_name=>'WNL_PAR_FUN_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Par. Not. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5606188064924456523)
,p_db_column_name=>'WNL_PAR_FUN_NAME'
,p_display_order=>14
,p_column_identifier=>'J'
,p_column_label=>'Par. Not. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5606188116082456524)
,p_db_column_name=>'WNL_SEQ_NO'
,p_display_order=>24
,p_column_identifier=>'K'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5687045838050302611)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2075249'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ROWNUM:WNL_BUS_FUN_ID:WNL_BUS_FUN_NAME:WNL_PAR_FUN_NAME:WNL_MODULE'
,p_sort_column_1=>'WNL_BUS_FUN_ID'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
