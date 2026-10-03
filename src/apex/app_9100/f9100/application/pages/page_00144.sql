prompt --application/pages/page_00144
begin
--   Manifest
--     PAGE: 00144
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
 p_id=>144
,p_name=>'Waiting for approval Onduty'
,p_alias=>'WAITING-FOR-APPROVAL-ONDUTY'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for approval Onduty'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'          white-space: nowrap;',
'          word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5971561682184820246)
,p_plug_name=>'Waiting for approval Onduty'
,p_static_id=>'waiting-for-approval-onduty'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empper_emp_id,',
'       (SELECT initcap(UPPER(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'          FROM employees',
'         WHERE emp_bu     = empper_bu',
'           AND emp_emp_id = empper_emp_id) emp_name,',
'       (SELECT UPPER(hrpos_pos_name1)',
'          FROM hr_positions',
'         WHERE hrpos_bu     = empper_bu',
'           AND hrpos_pos_id = empai_pos_id) designation,',
'       (SELECT UPPER(dept_name1) ',
'          FROM departments',
'         WHERE dept_bu       = empai_bu',
'           AND empai_dept_id = dept_id) department, ',
'       (SELECT UPPER(bup_name1)',
'          FROM bus_unit_plants',
'         WHERE bup_bu       = empai_bu ',
'           AND bup_plant_id = empai_plnt) unit,',
'       empper_doc_no,',
'       empai_plnt,',
'       empper_type,',
'       decode(empper_type,''P'',''Permission'',''O'',''On - Duty(Hourly)'',''M'',''On - Duty(Day)'')empper_type_desc,',
'       empper_prmn_date,',
'       to_char(TO_DATE(empper_time_from,''SSSSS''),''HH24:MI:SS'') empper_time_from,',
'       to_char(TO_DATE(empper_time_to,''SSSSS''),''HH24:MI:SS'') empper_time_to,',
'       empper_status,',
'       decode(empper_status,''N'',''Draft'',''E'',''Entry Completed'',''A'',''Approved'',''R'',''Reversed'')status,',
'       empper_prmn_date_to,',
'       CASE empper_status WHEN ''N'' THEN ''Blue''',
'                          WHEN ''E'' THEN ''Brown''',
'                          WHEN ''A'' THEN ''Green''',
'                          WHEN ''R'' THEN ''Orange''',
'       END color,',
'       empper_cre_by,',
'       to_char(empper_cre_date,''DD-MM-RRRR HH12:MI AM'') empper_cre_date      ',
'  FROM employee_permission A,',
'       emp_active_infos',
' WHERE empper_bu      = empai_bu',
'   AND empper_emp_id  = empai_emp_id  ',
'   AND empper_bu      = :global_bu',
'   AND empper_status  = ''E''',
'   AND empper_type    IN (''M'',''O'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(5971561790332820247)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489599954789209219
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563347404820263)
,p_db_column_name=>'COLOR'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562164727820251)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562106321820250)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>70
,p_column_identifier=>'C'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562471341820254)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Empai Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563439623820264)
,p_db_column_name=>'EMPPER_CRE_BY'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Empper Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563624875820265)
,p_db_column_name=>'EMPPER_CRE_DATE'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Empper Cre Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562415756820253)
,p_db_column_name=>'EMPPER_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971561896272820248)
,p_db_column_name=>'EMPPER_EMP_ID'
,p_display_order=>50
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562758584820257)
,p_db_column_name=>'EMPPER_PRMN_DATE'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Prmn. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563237854820262)
,p_db_column_name=>'EMPPER_PRMN_DATE_TO'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Empper Prmn Date To'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563123282820260)
,p_db_column_name=>'EMPPER_STATUS'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Empper Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562849497820258)
,p_db_column_name=>'EMPPER_TIME_FROM'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Time From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563021836820259)
,p_db_column_name=>'EMPPER_TIME_TO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Time  To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562555516820255)
,p_db_column_name=>'EMPPER_TYPE'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Empper Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562678201820256)
,p_db_column_name=>'EMPPER_TYPE_DESC'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971561955027820249)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563210897820261)
,p_db_column_name=>'STATUS'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971562313543820252)
,p_db_column_name=>'UNIT'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971625602440859359)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4896638'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMPPER_DOC_NO:EMPPER_PRMN_DATE:EMPPER_EMP_ID:EMP_NAME:EMPPER_TYPE_DESC:EMPPER_TIME_FROM:EMPPER_TIME_TO:DESIGNATION:DEPARTMENT:UNIT:STATUS'
);
wwv_flow_imp.component_end;
end;
/
