prompt --application/pages/page_11130012
begin
--   Manifest
--     PAGE: 11130012
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
 p_id=>11130012
,p_name=>'Configuration Updates'
,p_alias=>'CONFIGURATION-UPDATES'
,p_step_title=>'Configuration Updates'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
' .t-fht-thead {',
'    overflow: auto !important;',
' }'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6404900626435649435)
,p_plug_name=>'Configuration Updates'
,p_static_id=>'configuration-updates'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ssca_form_id,',
'       (SELECT wbf_bus_fun_name ',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id =ssca_form_id) ssca_form_name,',
'       ssca_team_id,',
'       ssca_module_id,',
'       ssca_bu,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu       = :GLOBAL_bu ',
'           AND bup_plant_id = ssca_plnt) ssca_plnt,',
'       ssca_par_col_id,',
'       ssca_par_col_id_val,',
'       ssca_table_name,',
'       ssca_col_name,',
'       DECODE (ssca_old_value,''N'',''New'',''A'',''Active'',''I'',''Inactive'') ssca_old_value,',
'       DECODE (ssca_new_value,''N'',''New'',''A'',''Active'',''I'',''Inactive'') ssca_new_value,',
'       ssca_upd_by,',
'       ssca_upd_date,',
'       ssca_upd_ip_addr,',
'       ssca_upd_os_user,',
'       ssca_upd_emp_id',
'  FROM setup_status_chng_audit',
' WHERE ssca_bu = :GLOBAL_bu',
'   AND ssca_old_value IN (''N'',''A'',''I'')',
'   AND ssca_new_value IN (''N'',''A'',''I'')',
' ORDER BY ssca_upd_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Configuration Updates'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6404900701457649435)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>922938865914038407
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404902152417649535)
,p_db_column_name=>'SSCA_BU'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Ssca Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404904183101649538)
,p_db_column_name=>'SSCA_COL_NAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Column Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404900953034649528)
,p_db_column_name=>'SSCA_FORM_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Form ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6221878426148108576)
,p_db_column_name=>'SSCA_FORM_NAME'
,p_display_order=>36
,p_column_identifier=>'R'
,p_column_label=>'Form Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404901794043649534)
,p_db_column_name=>'SSCA_MODULE_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404905026468649559)
,p_db_column_name=>'SSCA_NEW_VALUE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'New Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404904556465649557)
,p_db_column_name=>'SSCA_OLD_VALUE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Old Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404902961112649537)
,p_db_column_name=>'SSCA_PAR_COL_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Par. Col. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404903394898649537)
,p_db_column_name=>'SSCA_PAR_COL_ID_VAL'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Par. Col. Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404902610807649535)
,p_db_column_name=>'SSCA_PLNT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404903783597649537)
,p_db_column_name=>'SSCA_TABLE_NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Table Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404901411397649529)
,p_db_column_name=>'SSCA_TEAM_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Team ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404905415706649559)
,p_db_column_name=>'SSCA_UPD_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404905800843649560)
,p_db_column_name=>'SSCA_UPD_DATE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404906985015649562)
,p_db_column_name=>'SSCA_UPD_EMP_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Upd. Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404906177811649560)
,p_db_column_name=>'SSCA_UPD_IP_ADDR'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Upd. IP. Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6404906536157649560)
,p_db_column_name=>'SSCA_UPD_OS_USER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Upd.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6404908585281654215)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9229468'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SSCA_FORM_ID:SSCA_FORM_NAME:SSCA_TEAM_ID:SSCA_MODULE_ID:SSCA_PLNT:SSCA_TABLE_NAME:SSCA_COL_NAME:SSCA_PAR_COL_ID:SSCA_PAR_COL_ID_VAL:SSCA_OLD_VALUE:SSCA_NEW_VALUE:SSCA_UPD_DATE:SSCA_UPD_BY:SSCA_UPD_EMP_ID:SSCA_UPD_OS_USER:SSCA_UPD_IP_ADDR'
);
wwv_flow_imp.component_end;
end;
/
